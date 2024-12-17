#include <cmath>
#include <iostream>
#include "functions_sundials.h"

using namespace std;

struct phy_consts phyc;
struct che_consts chec;

extern vector<vector<double>> Cp_arr;
extern vector<vector<double>> Lambda_arr;
extern vector<vector<vector<double>>> Dij_arr_r;
extern vector<vector<vector<double>>> Dij_arr_l;



extern std::unordered_map<std::string, int> komponents;
extern std::unordered_map<int, string> komponents_str;
extern vector<string> name_species;
extern map<string, double> elem_mol_weight;
extern double*** diff_polynom;
extern double** lambda_polynom;
extern double** Dij_func_saved;
extern double* mol_weight;

extern thread_local double* Yi;
extern thread_local double* Yiprev;
extern thread_local double* Yinext;
extern thread_local  double* Y_inter;
extern thread_local double* Y_inter_2r;
extern thread_local double* Y_inter_3r;


extern thread_local double* YkVk_r;
extern thread_local double* YkVk_l;

extern thread_local double* gradX_r;
extern thread_local double* gradX_l;

extern thread_local double* X_tmp_r;
extern thread_local double* X_tmp_l;

extern thread_local double* Y_tmp_r;
extern thread_local double* Y_tmp_l;

extern thread_local double* Xiprev;
extern thread_local double* Xi;
extern thread_local double* Xinext;

extern thread_local double* gradX;

extern thread_local double* Y_tmp;
extern thread_local double* X_tmp;
extern thread_local double* YkVk;

extern thread_local double* Sn;
extern thread_local double* Hn;
extern thread_local double* Cpn;

extern thread_local double* forward_arr;
extern thread_local double* reverse_arr;
extern thread_local double* equilib_arr;
extern double* Y_left_bound;
extern double* wk_add;
extern thread_local double* ydot;

extern double*** diff_polynom;
extern double** lambda_polynom;
extern double* mol_weight;
extern double* Ystart;
extern double* Yend;
extern double* X;
extern double* YkVk_res;


void init_consts(const std::string thermfile, const std::string transfile, const std::string chemfile, int& num_gas_species, int& num_react) {
    std::string cond_str = "CONDUCTIVITIES";
    std::string visc_str = "VISCOSITIES";
    std::string diff_str = "DIFFUSION";


    //const std::string thermfile = R"(..\data_files\term.dat)";
    //const std::string transfile = R"(..\data_files\tran.dat)";
    //const std::string chemfile = R"(..\data_files\heptane2.inp)";

    //const std::string thermfile = R"(..\data_files\DKM_kinetics\therm.dat)";
    //const std::string transfile = R"(..\data_files\DKM_kinetics\tran.dat)";
    //const std::string chemfile = R"(..\data_files\DKM_kinetics\isp_dkm_heptane.inp)";

    /*const std::string thermfile = R"(..\data_files\CRECK_kinetics\CRECK_therm.dat)";
    const std::string transfile = R"(..\data_files\CRECK_kinetics\CRECK_tran.dat)";
    const std::string chemfile = R"(..\data_files\CRECK_kinetics\CRECK_chem2.inp)";*/
    //const std::string chemfile = R"(..\data_files\heptane2.inp)";


    //chec.chemkinReader = new IO::ChemkinReader(chemfile, thermfile, transfile);
    chec.chemkinReader = new IO::ChemkinReader(chemfile, thermfile, transfile);


    chec.chemkinReader->read();
    num_react = chec.chemkinReader->reactions().size();
    num_gas_species = chec.chemkinReader->species().size();
    chec.sum_v = new double[num_react];

    phyc.kR = 8.314472;  // universal gas constant ( erg/K/mole )
    phyc.kRc = 1.987207e-3; // universal gas constant ( kcal/K/mole )
    phyc.kTime = 1;     // dimensional time ( sec )
    phyc.kLength = 1;   // dimensional length ( cm )
    phyc.kMass = 1;     // dimensional mass ( g )
    phyc.kTemp = 1.e0;      // dimensional temperature ( K )
    phyc.kPres = 1.e+7;     // dimensional pressure ( dyn/cm**2 )
    phyc.kDens = phyc.kMass / pow(phyc.kLength, 3); // dimensional density ( g/cm**3 )
    phyc.kVel = phyc.kLength / phyc.kTime;           // dimensional velocity ( cm/sec )

    phyc.kR /= phyc.kMass * pow(phyc.kVel, 2);

    int i_specie = 0;
    for (const auto& specie_i : chec.chemkinReader->species()) {
        komponents[specie_i.name()] = i_specie;
        komponents_str[i_specie] = specie_i.name();
        name_species.push_back(specie_i.name());
        i_specie++;
    }
    allocate_memory();
    auto& species = chec.chemkinReader->species();


    for (int i = 0; i < num_gas_species; i++) {
        auto koeff_vect = chec.chemkinReader->species()[i].thermo().getLowerTemperatureCoefficients();
        //cout << komponents_str[i] << "\n";
        for (int j = 0; j < 9; j++) {
            phyc.Cp_coef_lT[i][j] = 0;
            phyc.Cp_coef_hT[i][j] = 0;
        }

        for (int j = 0; j < koeff_vect.size(); j++) {
            phyc.Cp_coef_lT[i][j] = koeff_vect[j];
        }

        koeff_vect = chec.chemkinReader->species()[i].thermo().getUpperTemperatureCoefficients();
        for (int j = 0; j < koeff_vect.size(); j++) {
            phyc.Cp_coef_hT[i][j] = koeff_vect[j];
        }
    }

    phyc.mol_weight = new double[num_gas_species];
    auto elm = chec.chemkinReader->elements();
    for (int i = 0; i < num_gas_species; i++) {
        phyc.mol_weight[i] = 0;
        auto elms = chec.chemkinReader->species()[i].thermo().getElements();
        for (const auto& elm_i : elms) {
            phyc.mol_weight[i] += elem_mol_weight[elm_i.first] * elm_i.second;
        }
    }


    for (int i = 0; i < num_gas_species; i++)
        phyc.mol_weight[i] /= phyc.kMass;

    // 8th coef. is for enthalpy calculation

    GasTransport poly_obj;
    for (int k = 0; k < num_gas_species; k++) {
        double logt = log(300);
        poly_obj.getConductivityPolynomial(k, lambda_polynom[k]);
        for (int k2 = 0; k2 < num_gas_species; k2++) {
            poly_obj.getBinDiffusivityPolynomial(k, k2, diff_polynom[k][k2]);
            // cout << name_species[k] << " " << name_species[k2] << " " << diff_polynom[k][k2][0] << " " << diff_polynom[k][k2][1] << " " << diff_polynom[k][k2][2] << " " << diff_polynom[k][k2][3] << "\n";
        }
    }
    for (int component_i = 0; component_i < num_gas_species; component_i++)
    {
        for (int power_i = 0; power_i <= 8; power_i++)
        {
            // T < 1000 K
            phyc.Cp_coef_lT[component_i][power_i] *= phyc.kR / phyc.mol_weight[component_i];
            // T > 1000 K
            phyc.Cp_coef_hT[component_i][power_i] *= phyc.kR / phyc.mol_weight[component_i];
        }
    }
}
void set_polynom(double** ploynom, std::string name_file, std::string type_polynom) {
    std::string line;
    std::string koeff_str = "COEFFICIENTS";
    std::ifstream in(name_file); // îêðûâàåì ôàéë äëÿ ÷òåíèÿ
    if (in.is_open())
    {
        while (getline(in, line))
        {
            vector splitted_string = splitString(line, ' ');
            if (std::find(splitted_string.begin(), splitted_string.end(), koeff_str) != splitted_string.end()
                && std::find(splitted_string.begin(), splitted_string.end(), type_polynom) != splitted_string.end())
            {
                getline(in, line);
                while (getline(in, line))
                {
                    vector splitted_string = splitString(line, ' ');
                    if (std::find(splitted_string.begin(), splitted_string.end(), koeff_str) != splitted_string.end())
                        return;


                    if (splitted_string.size() != 0)
                    {

                        string specie = splitted_string[0];
                        std::transform(specie.begin(), specie.end(), specie.begin(), ::toupper);
                        if (komponents.contains(specie))
                        {
                            int i_komp = komponents[specie];
                            cout << "line = " << line << "\n";
                            cout << "i_komp = " << i_komp << "\n";

                            ploynom[i_komp][0] = stod(splitted_string[1]);
                            ploynom[i_komp][1] = stod(splitted_string[2]);
                            ploynom[i_komp][2] = stod(splitted_string[3]);
                            ploynom[i_komp][3] = stod(splitted_string[4]);
                            cout << specie << " " << i_komp << " " << ploynom[i_komp][0]
                                << " " << ploynom[i_komp][1]
                                << " " << ploynom[i_komp][2]
                                << " " << ploynom[i_komp][3] << "\n";
                        }

                    }

                }
            }


        }
    }
    in.close();
}

void set_polynom_diffusion(double*** polynom, std::string name_file, std::string type_polynom) {
    std::string line;
    std::string koeff_str = "COEFFICIENTS";
    std::ifstream in(name_file); // îêðûâàåì ôàéë äëÿ ÷òåíèÿ
    if (in.is_open())
    {
        while (getline(in, line))
        {
            vector splitted_string = splitString(line, ' ');
            if (std::find(splitted_string.begin(), splitted_string.end(), koeff_str) != splitted_string.end()
                && std::find(splitted_string.begin(), splitted_string.end(), type_polynom) != splitted_string.end())
            {
                getline(in, line);
                while (getline(in, line))
                {
                    vector splitted_string = splitString(line, ' ');
                    if (std::find(splitted_string.begin(), splitted_string.end(), koeff_str) != splitted_string.end())
                        return;

                    if (splitted_string.size() != 0)
                    {
                        string specie1 = splitted_string[0];
                        std::transform(specie1.begin(), specie1.end(), specie1.begin(), ::toupper);

                        string specie2 = splitted_string[1];
                        std::transform(specie2.begin(), specie2.end(), specie2.begin(), ::toupper);

                        if (komponents.contains(specie1) && komponents.contains(specie2))
                        {
                            int i_sp1 = komponents[specie1];
                            int i_sp2 = komponents[specie2];
                            polynom[i_sp1][i_sp2][0] = stod(splitted_string[2]);
                            polynom[i_sp1][i_sp2][1] = stod(splitted_string[3]);
                            polynom[i_sp1][i_sp2][2] = stod(splitted_string[4]);
                            polynom[i_sp1][i_sp2][3] = stod(splitted_string[5]);

                            polynom[i_sp2][i_sp1][0] = stod(splitted_string[2]);
                            polynom[i_sp2][i_sp1][1] = stod(splitted_string[3]);
                            polynom[i_sp2][i_sp1][2] = stod(splitted_string[4]);
                            polynom[i_sp2][i_sp1][3] = stod(splitted_string[5]);

                            /*cout << komponents[specie1] << " " << komponents[specie2]
                                << " " << polynom[i_sp1][i_sp2][0]
                                << " " << polynom[i_sp1][i_sp2][1]
                                << " " << polynom[i_sp1][i_sp2][2]
                                << " " << polynom[i_sp1][i_sp2][3] << "\n";*/
                        }

                    }

                }
            }
        }
    }
    in.close();
}
std::vector<std::string> splitString(std::string str, char splitter) {
    std::vector<std::string> result;
    std::string current = "";
    for (int i = 0; i < str.size(); i++) {
        if (str[i] == splitter) {
            if (current != "") {
                result.push_back(current);
                current = "";
            }
            continue;
        }
        current += str[i];
    }
    if (current.size() != 0)
        result.push_back(current);
    return result;
}

template <typename T>
void findValue(const std::vector<T>& data, bool(*condition)(T))
{
    auto result{ std::find_if(begin(data), end(data), condition) };
    if (result == end(data))
        std::cout << "Value not found" << std::endl;
    else
        std::cout << "Value found at position " << (result - begin(data)) << std::endl;
}




void allocate_memory() {
    Ystart = new double[num_gas_species];
    Yend = new double[num_gas_species];

    Xi_2 = new double[num_gas_species];
    Xi_3 = new double[num_gas_species];

    X_inter = new double[num_gas_species];
    Y_inter = new double[num_gas_species];

    Y_inter_2r = new double[num_gas_species];
    Y_inter_3r = new double[num_gas_species];

    X = new double[num_gas_species];

    YkVk_r = new double[num_gas_species];
    YkVk_l = new double[num_gas_species];

    gradX_r = new double[num_gas_species];
    gradX_l = new double[num_gas_species];

    X_tmp_r = new double[num_gas_species];
    X_tmp_l = new double[num_gas_species];

    Y_tmp_r = new double[num_gas_species];
    Y_tmp_l = new double[num_gas_species];

    Xiprev = new double[num_gas_species];
    Xi = new double[num_gas_species];
    Xinext = new double[num_gas_species];

    Yiprev = new double[num_gas_species];
    Yi = new double[num_gas_species];
    Yinext = new double[num_gas_species];


    gradX = new double[num_gas_species];
    Y_tmp = new double[num_gas_species];
    X_tmp = new double[num_gas_species];

    YkVk = new double[num_gas_species];

    Sn = new double[9];
    Hn = new double[9];
    Cpn = new double[9];

    ydot = new double[num_gas_species];
    forward_arr = new double[num_react];
    reverse_arr = new double[num_react];
    equilib_arr = new double[num_react];
    Y_left_bound = new double[num_gas_species];
    wk_add = new double[num_gas_species];

    Dij_res = new double* [num_gas_species];
    phyc.Cp_coef_hT = new double* [num_gas_species];
    phyc.Cp_coef_lT = new double* [num_gas_species];

    for (int i = 0; i < num_gas_species; i++) {
        Dij_res[i] = new double[num_gas_species];
        phyc.Cp_coef_hT[i] = new double[9];
        phyc.Cp_coef_lT[i] = new double[9];
    }

    diff_polynom = new double** [num_gas_species];
    lambda_polynom = new double* [num_gas_species];
    for (int i = 0; i < num_gas_species; i++) {
        lambda_polynom[i] = new double[5];
        diff_polynom[i] = new double* [num_gas_species];
    }
    for (int i = 0; i < num_gas_species; i++) {
        for (int j = 0; j < num_gas_species; j++) {
            diff_polynom[i][j] = new double[5];
        }
    }
}


void free_memory() {



    YkVk_r = new double[num_gas_species];
    YkVk_l = new double[num_gas_species];

    gradX_r = new double[num_gas_species];
    gradX_l = new double[num_gas_species];

    X_tmp_r = new double[num_gas_species];
    X_tmp_l = new double[num_gas_species];

    Y_tmp_r = new double[num_gas_species];
    Y_tmp_l = new double[num_gas_species];

    Xiprev = new double[num_gas_species];
    Xi = new double[num_gas_species];
    Xinext = new double[num_gas_species];

    Yiprev = new double[num_gas_species];
    Yi = new double[num_gas_species];
    Yinext = new double[num_gas_species];


    gradX = new double[num_gas_species];
    Y_tmp = new double[num_gas_species];
    X_tmp = new double[num_gas_species];

    YkVk = new double[num_gas_species];

    Sn = new double[9];
    Hn = new double[9];
    Cpn = new double[9];

    ydot = new double[num_gas_species];
    forward_arr = new double[num_react];
    reverse_arr = new double[num_react];
    equilib_arr = new double[num_react];
    Y_left_bound = new double[num_gas_species];
    wk_add = new double[num_gas_species];

    Dij_res = new double* [num_gas_species];
    phyc.Cp_coef_hT = new double* [num_gas_species];
    phyc.Cp_coef_lT = new double* [num_gas_species];

    for (int i = 0; i < num_gas_species; i++) {
        Dij_res[i] = new double[num_gas_species];
        phyc.Cp_coef_hT[i] = new double[9];
        phyc.Cp_coef_lT[i] = new double[9];
    }

    diff_polynom = new double** [num_gas_species];
    lambda_polynom = new double* [num_gas_species];
    for (int i = 0; i < num_gas_species; i++) {
        lambda_polynom[i] = new double[5];
        diff_polynom[i] = new double* [num_gas_species];
    }
    for (int i = 0; i < num_gas_species; i++) {
        for (int j = 0; j < num_gas_species; j++) {
            diff_polynom[i][j] = new double[5];
        }
    }

    delete[] Y_inter_2r;
    delete[] Y_inter_3r;

    delete[] Ystart;
    delete[] Yend;
    delete[] X;

    delete[] Xi_2;
    delete[] Xi_3;


    delete[] X_inter ;
    delete[] Y_inter;

    delete[] YkVk_r;
    delete[] YkVk_l;

    delete[] gradX_r;
    delete[] gradX_l;

    delete[] X_tmp_r;
    delete[] X_tmp_l;

    delete[] Y_tmp_r;
    delete[] Y_tmp_l;

    delete[] Xiprev;
    delete[] Xi;
    delete[] Xinext;

    delete[] Yiprev;
    delete[] Yi;
    delete[] Yinext;

    delete[] gradX;
    delete[] Y_tmp;
    delete[] X_tmp;
    delete[] YkVk;

    delete[] Sn;
    delete[] Hn;
    delete[] Cpn;

    delete[] ydot;
    delete[] forward_arr;
    delete[] reverse_arr;
    delete[] equilib_arr;
    delete[] Y_left_bound;
    delete[] wk_add;

    for (int i = 0; i < num_gas_species; i++) {
        delete[] Dij_res[i];
        delete[] phyc.Cp_coef_hT[i];
        delete[] phyc.Cp_coef_lT[i];
    }
    delete[] phyc.Cp_coef_hT;
    delete[] phyc.Cp_coef_lT;
    delete[] Dij_res;

    for (int i = 0; i < num_gas_species; i++) {
        delete[] lambda_polynom[i];
    }
    for (int i = 0; i < num_gas_species; i++) {
        for (int j = 0; j < num_gas_species; j++) {
            delete[] diff_polynom[i][j];
        }
    }
    for (int i = 0; i < num_gas_species; i++) {
        delete[] diff_polynom[i];
    }
    delete[] diff_polynom;
}



void allocate_paralel_memory() {
    
        Xi_2 = new double[num_gas_species];
        Xi_3 = new double[num_gas_species];
        X_inter = new double[num_gas_species];

        Y_inter = new double[num_gas_species]; 

        Y_inter_2r = new double[num_gas_species];
        Y_inter_3r = new double[num_gas_species];

        YkVk_r = new double[num_gas_species];
        YkVk_l = new double[num_gas_species];

        gradX_r = new double[num_gas_species];
        gradX = new double[num_gas_species]; 
        gradX_l = new double[num_gas_species];

        X_tmp_r = new double[num_gas_species];
        X_tmp_l = new double[num_gas_species];

        Y_tmp_r = new double[num_gas_species];
        Y_tmp_l = new double[num_gas_species];

        Xiprev = new double[num_gas_species];
        Xi = new double[num_gas_species];
        Xinext = new double[num_gas_species];

        Yiprev = new double[num_gas_species];
        Yi = new double[num_gas_species];
        Yinext = new double[num_gas_species];

        Y_tmp = new double[num_gas_species];
        X_tmp = new double[num_gas_species];
        YkVk = new double[num_gas_species];

        Sn = new double[9];
        Hn = new double[9];
        Cpn = new double[9];

        Dij_res = new double* [num_gas_species];
        for (int i = 0; i < num_gas_species; i++) {
            Dij_res[i] = new double[num_gas_species];
        }
        ydot = new double[num_gas_species];
        forward_arr = new double[num_react];
        reverse_arr = new double[num_react];
        equilib_arr = new double[num_react];
    
}


void free_paralel_memory() {
    if (Xi_2 != nullptr) {
        delete[] Xi_2;
        Xi_2 = nullptr;
    }
    if (Xi_3 != nullptr) {
        delete[] Xi_3;
        Xi_3 = nullptr;
    }
    if (X_inter != nullptr) {
        delete[] X_inter;
        X_inter = nullptr;
    }
     if (Y_inter != nullptr) {
         cout << "Y_inter = " << Y_inter[2] << endl;
         delete[] Y_inter;
         Y_inter = nullptr;
     }
    if (Y_inter_3r != nullptr) {
        delete[] Y_inter_3r;
        Y_inter_3r = nullptr;
    }

    if (YkVk_r != nullptr) {
        delete[] YkVk_r;
        YkVk_r = nullptr;
    }
    if (YkVk_l != nullptr) {
        delete[] YkVk_l;
        YkVk_l = nullptr;
    }

    if (gradX_r != nullptr) {
        delete[] gradX_r;
        gradX_r = nullptr;
    }
    if (gradX_l != nullptr) {
        delete[] gradX_l;
        gradX_l = nullptr;
    }

    if (X_tmp_r != nullptr) {
        delete[] X_tmp_r;
        X_tmp_r = nullptr;
    }
    if (X_tmp_l != nullptr) {
        delete[] X_tmp_l;
        X_tmp_l = nullptr;
    }

    if (Y_tmp_r != nullptr) {
        delete[] Y_tmp_r;
        Y_tmp_r = nullptr;
    }
    if (Y_tmp_l != nullptr) {
        delete[] Y_tmp_l;
        Y_tmp_l = nullptr;
    }

    if (Xiprev != nullptr) {
        delete[] Xiprev;
        Xiprev = nullptr;
    }
    if (Xi != nullptr) {
        delete[] Xi;
        Xi = nullptr;
    }
    if (Xinext != nullptr) {
        delete[] Xinext;
        Xinext = nullptr;
    }
    if (gradX != nullptr) {
        delete[] gradX;
        gradX = nullptr;
    }
    if (Y_tmp != nullptr) {
        delete[] Y_tmp;
        Y_tmp = nullptr;
    }
    if (X_tmp != nullptr) {
        delete[] X_tmp;
        X_tmp = nullptr;
    }
    if (YkVk != nullptr) {
        delete[] YkVk;
        YkVk = nullptr;
    }

    if (Sn != nullptr) {
        delete[] Sn;
        Sn = nullptr;
    }
    if (Hn != nullptr) {
        delete[] Hn;
        Hn = nullptr;
    }
    if (Cpn != nullptr) {
        delete[] Cpn;
        Cpn = nullptr;
    }

    if (ydot != nullptr) {
        delete[] ydot;
        ydot = nullptr;
    }
    if (forward_arr != nullptr) {
        delete[] forward_arr;
        forward_arr = nullptr;
    }
    if (reverse_arr != nullptr) {
        delete[] reverse_arr;
        reverse_arr = nullptr;
    }
    if (equilib_arr != nullptr) {
        delete[] equilib_arr;
        equilib_arr = nullptr;
    }
    if (Yiprev != nullptr) {
        delete[] Yiprev;
        Yiprev = nullptr;
    }
    if (Yi != nullptr) {
        delete[] Yi;
        Yi = nullptr;        }
    if (Yinext != nullptr) {
        delete[] Yinext;
        Yinext = nullptr;
    }
    for (int i = 0; i < num_gas_species; i++) {
        delete[] Dij_res;
    }
}
