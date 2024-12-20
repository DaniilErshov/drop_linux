#include "thermodynamic.h"
//#include "constants.h"

extern vector<vector<double>> Cp_arr;
extern vector<vector<double>> Lambda_arr;
extern vector<vector<vector<double>>> Dij_arr_r;
extern vector<vector<vector<double>>> Dij_arr_l;




double Lambda_All(double* X, double T, char phase)
{
    double res1 = 0;
    double res2 = 0;
    if (phase == 'g') {
        for (int i = 0; i < num_gas_species; i++) {
            double lambda_i = get_Lambda(i, T, phase);
            res1 += X[i] * lambda_i;
            res2 += X[i] / lambda_i;
        }
        return (res1 + 1. / res2) / 2. * pow(10, -7);
    }
    else {
        double res = 0.17517996172043065 * pow(T, 0) + -1.0681596399366151e-17 * pow(T, 1) + -2.8633066421104084e-14 * pow(T, 2) + -5.222647999048707e-13 * pow(T, 3) + -4.8835219079905365e-11 * pow(T, 4) + 2.8626443226979734e-13 * pow(T, 5) + -6.707205166592653e-16 * pow(T, 6) + 7.148822623783114e-19 * pow(T, 7) + -2.8429334108185087e-22 * pow(T, 8);
        return res * pow(10, -2);
        //return (0.124e-2);
    }


}


double get_dHiRT(double* Cp_coef, double T)
{
    double Hi;
    Hi = Cp_coef[0] + Cp_coef[1] / 2. * T + Cp_coef[2] / 3. * T * T
        + Cp_coef[3] / 4. * T * T * T + Cp_coef[4] / 5. * T * T * T * T + Cp_coef[5] / T;
    return Hi * T;
}

double get_dSiR(double* Cp_coef, double T) {
    double Si;
    Si = Cp_coef[0] * log(T) + Cp_coef[1] * T + Cp_coef[2] / 2. * T * T
        + Cp_coef[3] / 3. * T * T * T + Cp_coef[4] / 4. * T * T * T * T + Cp_coef[6];
    return Si;
}
double get_dCpi(double* Cp_coef, double T)
{
    double Cpi;
    Cpi = Cp_coef[0] + Cp_coef[1] * T + Cp_coef[2] * T * T
        + Cp_coef[3] * T * T * T + Cp_coef[4] * T * T * T * T;

    return Cpi;
}

double get_Hi(int component_i, double T)
{
    double Hi;
    int i = component_i;
    if (T > chec.chemkinReader->species()[component_i].thermo().getTCommon())
        Hi = phyc.Cp_coef_hT[i][0] + phyc.Cp_coef_hT[i][1] / 2. * T + phyc.Cp_coef_hT[i][2] / 3. * T * T
        + phyc.Cp_coef_hT[i][3] / 4. * T * T * T + phyc.Cp_coef_hT[i][4] / 5. * T * T * T * T + phyc.Cp_coef_hT[i][5] / T;
    else
        Hi = phyc.Cp_coef_lT[i][0] + phyc.Cp_coef_lT[i][1] / 2. * T + phyc.Cp_coef_lT[i][2] / 3. * T * T
        + phyc.Cp_coef_lT[i][3] / 4. * T * T * T + phyc.Cp_coef_lT[i][4] / 5. * T * T * T * T + phyc.Cp_coef_lT[i][5] / T;

    return Hi * T;
}

// Specific heat of ith component
double get_Cpi(int component_i, double T)
{
    double Cpi;
    int i = component_i;
    if (T > chec.chemkinReader->species()[component_i].thermo().getTCommon())
        Cpi = phyc.Cp_coef_hT[i][0] + phyc.Cp_coef_hT[i][1] * T + phyc.Cp_coef_hT[i][2] * T * T
        + phyc.Cp_coef_hT[i][3] * T * T * T + phyc.Cp_coef_hT[i][4] * T * T * T * T;
    else
        Cpi = phyc.Cp_coef_lT[i][0] + phyc.Cp_coef_lT[i][1] * T + phyc.Cp_coef_lT[i][2] * T * T
        + phyc.Cp_coef_lT[i][3] * T * T * T + phyc.Cp_coef_lT[i][4] * T * T * T * T;
    return Cpi;
}

double get_Si(int component_i, double T) {
    double Si;
    int i = component_i;

    if (T > chec.chemkinReader->species()[component_i].thermo().getTCommon())
        Si = phyc.Cp_coef_hT[i][0] * log(T) + phyc.Cp_coef_hT[i][1] * T + phyc.Cp_coef_hT[i][2] / 2. * T * T
        + phyc.Cp_coef_hT[i][3] / 3. * T * T * T + phyc.Cp_coef_hT[i][4] / 4. * T * T * T * T + phyc.Cp_coef_hT[i][6];
    else
        Si = phyc.Cp_coef_lT[i][0] * log(T) + phyc.Cp_coef_lT[i][1] * T + phyc.Cp_coef_lT[i][2] / 2. * T * T
        + phyc.Cp_coef_lT[i][3] / 3. * T * T * T + phyc.Cp_coef_lT[i][4] / 4. * T * T * T * T + phyc.Cp_coef_lT[i][6];
    return Si;
}

double get_Cvi(int component_i, double T)
{
    double Cpi, Cvi;

    Cpi = get_Cpi(component_i, T);
    Cvi = Cpi - phyc.kR / mol_weight[component_i];
    return Cvi;
}

// Enthalpy of the gas
// Y -- mass fractions
double get_enthalpy(int num_species, double* Y, double T)
{
    double H_ = 0;

    for (int i = 0; i < num_species; i++)
        H_ += Y[i] * get_Hi(i, T);

    return H_;
}

// P = rho * R * T
// R -- gas constant
// Y -- mass fractions
double get_gas_constant(int num_gas_species, double* Y)
{
    // Gas Constant
    double R = 0;

    for (int i = 0; i < num_gas_species; i++)
        R += Y[i] / mol_weight[i];

    R *= phyc.kR;

    return R;
}

// Specific heat of the gas
double get_Cp(int num_species, double* Y, double T, char phase)
{
    double Cp = 0;
    if (phase == 'g') {
        Cp = 0.0;
        for (int i = 0; i < num_species; i++)
            Cp += Y[i] * get_Cpi(i, T);
    }
    else {
        double log_T = log(T);
        int i_tmp = 0;
        double Cp_arr[37] = { 2.0, 2.009, 2.021, 2.035, 2.052, 2.071, 2.094, 2.119, 2.147, 2.177, 2.21, 2.246, 2.284, 2.324, 2.365, 2.409, 2.455, 2.502, 2.55, 2.6, 2.652, 2.704, 2.759, 2.815, 2.873, 2.933, 2.998, 3.067, 3.144, 3.233, 3.34, 3.48, 3.686, 4.057, 5.08, 9.60640000000002 };
        double T_arr[37] = { 180.0, 190.0, 200.0, 210.0, 220.0, 230.0, 240.0, 250.0, 260.0, 270.0, 280.0, 290.0, 300.0, 310.0, 320.0, 330.0, 340.0, 350.0, 360.0, 370.0, 380.0, 390.0, 400.0, 410.0, 420.0, 430.0, 440.0, 450.0, 460.0, 470.0, 480.0, 490.0, 500.0, 510.0, 520.0, 530.0, 540.0 };
        for (int i = 0; i < 37; i++) {
            if (T > T_arr[i]) {
                i_tmp++;
            }
            else {
                break;
            }
        }
        if (i_tmp < 35) {
            Cp = Cp_arr[i_tmp - 1] + (Cp_arr[i_tmp] - Cp_arr[i_tmp - 1]) / (T_arr[i_tmp] - T_arr[i_tmp - 1]) * (T - T_arr[i_tmp - 1]);
        }
        else {
            Cp = Cp_arr[36];
        }

    }

    // cout << "Cp " << phase << " = " << Cp << "\n";
    return Cp;
}

double get_Cv(int num_species, double* Y, double T, int number_cell)
{
    double Cv;

    Cv = 0.0;
    for (int i = 0; i < num_species; i++)
        Cv += Y[i] * get_Cvi(i, T);

    return Cv;
}

double get_Lambda(int i, double T, char phase)
{
    //double lambda_arg;
    //double logt = log(T);
    //lambda_arg = lambda_polynom[i][0] + lambda_polynom[i][1] * logt
    //    + lambda_polynom[i][2] * logt * logt + lambda_polynom[i][3] * logt * logt * logt + lambda_polynom[i][4] * logt * logt * logt * logt;
    //return pow(T, 0.5) * lambda_arg * pow(10, 5);
    if (phase == 'g') {
        double lambda_arg;
        double logt = log(T);
        lambda_arg = lambda_polynom[i][0] + lambda_polynom[i][1] * logt
            + lambda_polynom[i][2] * logt * logt + lambda_polynom[i][3] * logt * logt * logt;
        //cout << "Lambda " << " " << T << " " << name_species[i] << " = " << exp(lambda_arg) * pow(10, 5) << '\n';
        return exp(lambda_arg) * pow(10, 5);
    }
}
double sigma_surf_tension(double T) {
    double res = 0.03863779828609607 * pow(T, 0) + -4.7503191762793e-18 * pow(T, 1) + -1.2733705625941023e-14 * pow(T, 2) + -2.3226133508985805e-13 * pow(T, 3) + -2.1717926612596664e-11 * pow(T, 4) + 1.379104986277825e-13 * pow(T, 5) + -3.5277703173967365e-16 * pow(T, 6) + 4.1769220281082404e-19 * pow(T, 7) + -1.8943361174288376e-22 * pow(T, 8);
    return res * pow(10, -4);
}
double Pf(double T, double r_interfece) {
    //double constexpr n1 = 0.11670521452767e4;
    //double constexpr n2 = -0.72421316703206e6;
    //double constexpr n3 = -0.17073846940092e2;
    //double constexpr n4 = 0.12020824702470e5;
    //double constexpr n5 = -0.3232555022333e7;
    //double constexpr n6 = 0.14915108613530e2;
    //double constexpr n7 = -0.48232657361591e4;
    //double constexpr n8 = 0.40511340542057e6;
    //double constexpr n9 = -0.23855557567849;
    //double constexpr n10 = 0.65017534844798e3;
    //double theta = T + n9 / (T - n10);
    //double A = theta * theta + n1 * theta + n2;
    //double B = n3 * theta * theta + n4 * theta + n5;
    //double C = n6 * theta * theta + n7 * theta + n8;
    ////double lgP = 8.07131 - 1730.63 / (Tval - 273 + 233.426);
    ////return 133.33 * pow(10, lgP);
    //////std::cout << 1.0e6 * pow(2 * C / (-B + pow(B * B - 4 * A * C, 0.5)), 4) << std::endl;
    //return pow(2 * C / (-B + pow(B * B - 4 * A * C, 0.5)), 4);
    //double jop = pow(2 * C / (-B + pow(B * B - 4 * A * C, 0.5)), 4);
    double res = 24523.160692131387 + 922.0983808780411 * T + -21.500586403548954 * pow(T, 2) + 0.1552381071666568 * pow(T, 3) + -0.0004781197006891655 * pow(T, 4) + 5.439451804534201e-07 * pow(T, 5);
    res = 10886470.84314671 + -180300.01448241185 * T + 1150.5424237979357 * pow(T, 2) + -3.5226392936262916 * pow(T, 3) + 0.005133227850356192 * pow(T, 4) + -2.7944561225012876e-06 * pow(T, 5);
    res /= 1.e6;
    //res = tanh(1.e8 * t_curr) * (res + 2. * sigma_surf_tension(T) / r_interfece);
    res = func_Pf(t_curr) * res;
    return res;
}

double func_Pf(double t_curr_local) {
    return tanh(1.e7 * t_curr_local);
}
double L_d(double T) {
    //double Larr[] = { 2481115.000000, 2470000.000000, 2451000.000000, 2431000.000000, 
    //    2411000.000000, 2390000.000000, 2368000.000000, 2346000.000000, 2322000.000000, 2298000.000000, 2273000.000000, 2247000.000000, 2219000.000000 };
    //double Tarr[] = { 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 390 };
    //double T1, T2;
    //T1 = 0;
    //T2 = 0;
    //// return Ld;
    //for (int i = 0; i < 13; i++) {
    //    if (T > Tarr[11]) {
    //        return Larr[11] * 1.e-3;
    //    }
    //    if ((T - Tarr[i]) == 1.e-3) {
    //        return Larr[i] * 1.e-3;
    //    }
    //    if (T < Tarr[i]) {
    //        return (Larr[i] + (Larr[i - 1] - Larr[i]) * (Tarr[i] - T) / (Tarr[i] - Tarr[i - 1])) * 1.0e-3;
    //    }
    double res;
    res = 1429635.1843800305 + -16253.012273771395 * T + 105.08842776426087 * pow(T, 2) + -0.33891544573361093 * pow(T, 3) + 0.0005304143678306894 * pow(T, 4) + -3.2577995057181397e-07 * pow(T, 5);
    res /= 1.e3;
    return res;
}

double get_rho_d(double T) {
    double res;
    res = 382.0229931050386 + 8.233888612039767 * T + -0.06055281806170509 * pow(T, 2) + 0.0002021369250560078 * pow(T, 3) + -3.3385255094635553e-07 * pow(T, 4) + 2.1563943686242482e-10 * pow(T, 5);
    res /= 1.e3;
    //return 0.633;
    return res;
}