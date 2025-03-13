#include "functions_sundials.h"

double k_mol = pow(10, 3);
double R = 8.314;
const double kB = 1.3806504e-23;
const double Angstroem__ = 1.0e-10;
const double santimetr = 1.0e-8;


int need_second_start;
double P;
double Tstart ;
double Tfinish;
double P_1_atm = 0.101325;
int preinter;
int Nx;
int n_out;


double p_inter;
int add_variable_count = 4;
int count_var_in_cell = 0;

//!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!!
int num_threads_global;//!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//! 
//! 


double vel_prev;
double t_curr = 0;
double t_end_all;
double tout1_global;
string Fuel;

thread_local double* Xi_2;
thread_local double* Xi_3;
thread_local double* X_inter;

thread_local double* Yi;
thread_local double* Yiprev;
thread_local double* Yinext;
thread_local double* Y_inter;
thread_local double* Y_inter_2r;
thread_local double* Y_inter_3r;

thread_local double* YkVk_r; thread_local double* YkVk_l;

thread_local double* gradX_r; thread_local double* gradX_l;

thread_local double* X_tmp_r; thread_local double* X_tmp_l;

thread_local double* Y_tmp_r; thread_local double* Y_tmp_l;

thread_local double* Xiprev; thread_local double* Xi; thread_local double* Xinext;

double r_inter;
thread_local double* gradX;

thread_local double* Y_tmp; thread_local double* X_tmp;
thread_local double* YkVk;
thread_local double** Dij_res;

thread_local double* Sn; thread_local double* Hn; thread_local double* Cpn;
thread_local double* ydot;

thread_local double* forward_arr; thread_local double* reverse_arr; thread_local double* equilib_arr;
double* Y_left_bound;
double* wk_add;
double*** diff_polynom; double** lambda_polynom;
double* mol_weight;
double* Ystart; double* Yend;
double eps = pow(10, -8);
double* X;
thread_local double rho_l, rho_r, Vc_l, Vc_r;
double u_inter; double u_inter_2r; double u_inter_3r;
double q_cells;
thread_local double rho_r_diff, rho_l_diff;

int num_gas_species; int num_react;
double initial_dt;
double dt_max;
int MaxNumSteps;

vector<double> x_vect, Y_vect, T_vect, u_vect, vel_vect, rho_vect;
vector<double> drhodt_vect;
vector<vector<double>> Vk_vect;
vector<vector<double>> ydot_vect;

vector<vector<double>> slag_chem_vect;
vector<vector<double>> MdYdr_vect;
vector<vector<double>> slag_diff_vect;

vector<double> Vk_inter;
vector<double> dTdt_vect;
vector<double> dWdt_vect;


vector<string> name_species;

double corrector = 1;

std::unordered_map<std::string, int> komponents{
};

std::unordered_map<int, string> komponents_str{
};

map<string, double> elem_mol_weight{
    {"H", 1.00797},
    {"O", 15.9994},
    {"N", 14.0067},
    {"C", 12.0096},
    {"AR", 39.94},
    {"HE", 4.002602}
};

Cell_Properties Cell_Properties_inter;
Cell_Properties Cell_prouds_inter;
Cell_Properties Cell_rval_inter;

vector<Cell_Properties> Cell_Properties_vector;
vector<Cell_Properties> Cell_prouds_vector;
vector<Cell_Properties> Cell_rval_vector;
vector<double> ydot_reaction;

ofstream IDA_data_file;

double r_tol;			//относительная погрешность
double abs_tol_T;					//абсолютная погрешность для температуры
double abs_tol_rho;				//абсолютная погрешность для плотности
double abs_tol_u;			//абсолютная погрешность для скорости газа
double abs_tol_u_interf;			//абсолютная погрешность для скорости интерфейса
double abs_tol_Y;
double Pf_time;
double chem_time;
set<string> initital_components = { "O2", "N2" };

int main()
{
    fs::path cwd = fs::current_path();

    //string windows_path = "..\\..\\auxiliary_projects\\Droplet\\Droplet_sample_dir\\";
    string confname = "config";
    //string confname = windows_path + "config_YOO";
    string path_second_start = cwd.string() + "//start_profile";
    //string path_second_start = windows_path + "start_profile";

    Json::Value config; json_parse_file_or_die(confname, &config);
    Tstart = config["T_drop"].asDouble();
    Tfinish = config["T_gas"].asDouble();

    P = config["P"].asDouble() * P_1_atm;
    p_inter = config["p_inter"].asDouble();
    preinter = config["Nx_in_drop"].asInt();
    Nx = config["Nx"].asInt();
    num_threads_global = config["num_threads"].asInt();
    double d_drop = config["d_drop"].asDouble();
    t_end_all = config["tend"].asDouble();
    Fuel = config["fuel"].asString();

    need_second_start = config["second_start"].asInt();


    const std::string thermfile = config["therm"].asString();
    const std::string transfile = config["tran"].asString();
    const std::string chemfile = config["chem"].asString();

    //const std::string thermfile = windows_path + config["therm"].asString();
    //const std::string transfile = windows_path + config["tran"].asString();
    //const std::string chemfile = windows_path + config["chem"].asString();


    n_out = config["n_out"].asDouble();
    tout1_global = config["t_out"].asDouble();
    initial_dt = config["initial_dt"].asDouble();
    dt_max = config["dt_max"].asDouble();
    MaxNumSteps = config["max_num_steps"].asInt();

    r_tol = config["r_tol"].asDouble();					        //относительная погрешность
    abs_tol_T = config["abs_tol_T"].asDouble();					//абсолютная погрешность для температуры
    abs_tol_rho = config["abs_tol_rho"].asDouble();				//абсолютная погрешность для плотности
    abs_tol_u = config["abs_tol_u"].asDouble();				    //абсолютная погрешность для скорости газа
    abs_tol_u_interf = config["abs_tol_u_interf"].asDouble();	//абсолютная погрешность для скорости интерфейса
    abs_tol_Y = config["abs_tol_Y"].asDouble();                 // абсолютная погрешность для концентраций
    Pf_time = config["Pf_time"].asDouble();
    chem_time = config["chem_time"].asDouble();

    time_t start_time, end_time;
    time(&start_time);

    init_consts(thermfile, transfile, chemfile, num_gas_species, num_react);

    WriteLog("Fuel=" + Fuel + "\n");
    if (komponents.find(Fuel) != komponents.end()) {
        WriteLog(Fuel + " found in inp file!\n");
        initital_components.insert(Fuel);
    }
    else {
        WriteLog(Fuel + " not found in inp file!\n");
        return 0;
    }

    if (!fs::exists(cwd.string() + "//params")) {
        fs::create_directory(cwd.string() + "//params");
    }
    if (!fs::exists(cwd.string() + "//detail")) {
        fs::create_directory(cwd.string() + "//detail");
    }

    count_var_in_cell = num_gas_species + add_variable_count;
    IDA_data_file.open("detail//ida_data.dat");
    IDA_data_file << "TITLE=\"" << "Graphics" << "\"" << "\n";
    string title_ida = R"(VARIABLES = "t, s", "Steps", "Error test fails", "NLS step fails", "Current step size", "Residual fn evals", "NLS iters", "Jac fn evals")";
    IDA_data_file << title_ida << "\n";
    double Tbegin = Tstart;
    double Tend = Tfinish;
    double T_center;

    if (need_second_start) {
        set_size_vectors(Nx, num_gas_species);
        second_start(path_second_start);
        Nx = Cell_Properties_vector.size();
        Tstart = Cell_Properties_vector[0].T;
        Tfinish = Cell_Properties_vector[Nx - 1].T;

#pragma omp parallel num_threads(num_threads_global)
        {
#pragma omp critical
            {
                int thread_id = omp_get_thread_num();
                allocate_paralel_memory();
            }
        }
    }
    else {
        set_size_vectors(Nx, num_gas_species);
        Nx = Cell_Properties_vector.size();
        InitialData(d_drop, Nx, x_vect, Cell_Properties_vector, Tbegin, Tend, Ystart, Yend);
        Write_to_file("initial//initial", "val", Cell_Properties_vector, Cell_Properties_inter);


#pragma omp parallel num_threads(num_threads_global)
        {
#pragma omp critical
            {
                int thread_id = omp_get_thread_num();
                allocate_paralel_memory();
            }
        }

        KinSetIc(3 + (Nx - preinter - 2));
    }

    write_setka("params//setka.dat", x_vect, Nx);
    write_params("params//koeffs.dat", Nx);


    Write_to_file("initial//initial_to_IDA", "val", Cell_Properties_vector, Cell_Properties_inter);
    Write_to_file("initial//initial_to_IDA_prouds", "pval", Cell_prouds_vector, Cell_prouds_inter);
    integrate_All_IDA_M(Nx);

    time(&end_time);

    double calc_time = end_time - start_time;

    WriteLog("Calculation time is: " + to_string(calc_time) + " sec.\n");

    ofstream file_time("detail//time_threads=" + to_string(num_threads_global) + ".dat");
    file_time << "t = " << calc_time << "sec";
    file_time.close();

    return 0;
}