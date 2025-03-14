﻿#include "functions_sundials.h"
#include <nvector/nvector_openmp.h>
int flag = 0;
double t = 0;
int i_ida = 0;
double corector = 0.1;
#define RTOL  RCONST(1.0e-5)
#define T0    RCONST(0.0)      /* initial time           */
#define T1    RCONST(pow(10, -7))     /* first output time      */
#define TMULT RCONST(1.006)     /* output time factor     */
#define NOUT  1800
#define ZERO  RCONST(0.0)
int vizov = 0;



void InitialData(double d_drop, int& Nx, vector<double>& x_vect, vector<Cell_Properties>& Cell_Properties_vector, double Tstart, double Tfinish, double* Ystart, double* Yend)
{
    double h;
    double j = 0;
    double T_left = Tstart;
    double Tright = Tfinish;

    double d = d_drop; //mkm
    double ri = d / 2. * 1.e-4;

    double q = 1.1;
    double phi = 0.00005;
    int delta = 40;
    double step_pol = 1;
    r_inter = ri;

    double O2_in = 0.21;
    double N2_in = 0.79;

    double koeff_O2 = 1.;

    double koeff_N2 = N2_in / O2_in * koeff_O2;

    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        Xi[k_spec] = 0;
    }

    Xi[komponents["O2"]] = koeff_O2 / (koeff_O2 + koeff_N2);
    Xi[komponents["N2"]] = koeff_N2 / (koeff_O2 + koeff_N2);
    moleFraction_to_massFraction(Xi, Y_tmp);
    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        Ystart[k_spec] = pow(10, -50);
        Yend[k_spec] = pow(10, -50);
    }

    Ystart[komponents[Fuel]] = 1 - pow(10, -50);
    Ystart[komponents["N2"]] = pow(10, -50);
    Ystart[komponents["O2"]] = pow(10, -50);

    Yend[komponents["N2"]] = Y_tmp[komponents["N2"]];
    Yend[komponents["O2"]] = Y_tmp[komponents["O2"]];
    Yend[komponents[Fuel]] = pow(10, -50);

    double rho0_d = get_rho(Ystart, T_left, 'd');
    double rho0_g = get_rho(Yend, Tright, 'g');
    double R = ri * pow(rho0_d / rho0_g / 0.062 / phi, 1. / 3.);
    int x_eps = 50;
    double h_dot = ri / (preinter + 1);
    q = exp(log(R / h_dot / (2. * preinter)) / (Nx - 2. * preinter));
    q_cells = q;
    for (int i = 0; i < Nx; i++) {
        if (i < preinter + x_eps) {
            x_vect[i] = h_dot * (i + 1. / 2.);
        }
        else {
            h_dot *= q;
            x_vect[i] = x_vect[i - 1] + h_dot;
        }
    }

    double Dt = Lambda_All(Yend, Tright, 'g') / get_Cp(num_gas_species, Yend, Tright, 'g') / get_rho(Yend, Tright, 'g') * pow(10, -4);

    for (int i = 0; i < Nx; i++) {

        if (i <= preinter)
        {
            Cell_Properties_vector[i].T = T_left;
        }
        else {
            double arg_erfc = (x_vect[i] - ri) / 2. / pow(Dt, 0.5);
            Cell_Properties_vector[i].T = Tright + ri / x_vect[i] * (T_left - Tright) * erfc(arg_erfc);
        }
        Cell_Properties_vector[i].u = 0;
    }



    Cell_Properties_inter.T = T_left;
    double Pf_ = Pf(Cell_Properties_inter.T, ri);
    double mol_w = my_mol_weight(komponents[Fuel]);
    double W = get_W(Yend);
    double jop = Pf_ / P * mol_w / W;
    Cell_Properties_inter.Y[komponents[Fuel]] = Pf_ / P * mol_w / W;

    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        if (k_spec != komponents[Fuel]) {
            Cell_Properties_inter.Y[k_spec] = (1 - Cell_Properties_inter.Y[komponents[Fuel]]) * Yend[k_spec];
        }
    }

    Cell_Properties_inter.u = 0;
    Cell_Properties_inter.vel = 0;
    Cell_Properties_inter.rho = get_rho(Cell_Properties_inter.Y.data(), Cell_Properties_inter.T, 'g');
    for (int i = 0; i < Nx; i++)
    {
        if (i <= preinter) {
            for (int k = 0; k < num_gas_species; k++) {
                Cell_Properties_vector[i].Y[k] = Cell_Properties_inter.Y[k];
            }
        }

        else {
            double arg_erfc = (x_vect[i] - ri) / 2. / pow(Dt, 0.5);
            /*Cell_Properties_vector[i].Y[komponents["N2"]] = Yend[komponents["N2"]];
            Cell_Properties_vector[i].Y[komponents["O2"]] = Yend[komponents["O2"]];
            Cell_Properties_vector[i].Y[komponents[Fuel]] = Yend[komponents[Fuel]];*/
            for (int k = 0; k < num_gas_species; k++) {
                //Cell_Properties_vector[i].Y[k] = Yend[k];
                //Cell_Properties_vector[i].Y[k] = Yend[k] + ri / x_vect[i] * (Cell_Properties_inter.Y[k] - Yend[k]) * erfc(arg_erfc);
                Cell_Properties_vector[i].Y[k] = Yend[k] + ri / x_vect[i] * (Cell_Properties_inter.Y[k] - Yend[k]) * erfc(arg_erfc);
                /*if (k != komponents["N2"] && k != komponents["O2"] && k != komponents[Fuel]) {
                    Cell_Properties_vector[i].Y[k] = Yend[k] + 1.e-10 * exp(-pow((x_vect[i] - x_vect[preinter + 80]) / ri, 2.0));
                    Cell_Properties_vector[i].Y[komponents["N2"]] -= Cell_Properties_vector[i].Y[k];
                }*/
            }
        }
    }

    for (int i = 0; i < Nx; i++)
    {
        Cell_Properties_vector[i].rho = get_rho(Cell_Properties_vector[i].Y.data(), Cell_Properties_vector[i].T, 'g');
        Cell_Properties_vector[i].vel = Cell_Properties_inter.vel;
    }
}

void Write_drhodt(string str) {
    string path = "";
    fs::path cwd = fs::current_path();
    if (str.find("//") != string::npos) {
        path = str.substr(0, str.find_last_of("//") + 1);
    }
    if (!fs::exists(cwd.string() + "//" + path)) {
        fs::create_directory(path);
    }

    ofstream fout;
    fout.open(str + ".dat");
    string title2 = R"(VARIABLES= "r, cm", "drho/dt, g/(cm<sup>3</sup>s", " dT/dt", "dW/dt")";
    fout << "TITLE=\"" << "Graphics" << "\"" << endl;
    fout << title2 << endl;
    for (int i = preinter + 1; i < Nx; i++) {
        fout << x_vect[i] << " " << drhodt_vect[i] << " " << dTdt_vect[i] << " " << dWdt_vect[i] << endl;
    }
    fout.close();
}

double get_mass_of_system(double ri) {
    double Mass = 0;
    Mass = 4. / 3. * PI * (pow(x_vect[preinter + 1], 3) - pow(ri, 3)) * 0.5 * (Cell_Properties_inter.rho + Cell_Properties_vector[preinter + 1].rho)
        * (Cell_Properties_inter.Y[komponents[Fuel]] + Cell_Properties_vector[preinter + 1].Y[komponents[Fuel]]) * 0.5;
    for (int i = preinter + 2; i < Nx; i++) {
        Mass += 4. / 3. * PI * (pow(x_vect[i], 3) - pow(x_vect[i - 1], 3)) * 0.5 * (Cell_Properties_vector[i - 1].rho + Cell_Properties_vector[i].rho)
            * (Cell_Properties_vector[i - 1].Y[komponents[Fuel]] + Cell_Properties_vector[i].Y[komponents[Fuel]]) * 0.5;
    }
    Mass += 4. / 3. * PI * pow(ri, 3) * get_rho(Y_inter, Cell_Properties_inter.T, 'd');
    return Mass;
}
static int check_retval(void* retvalvalue, const char* funcname, int opt)
{
    int* errretval;

    /* Check if SUNDIALS function returned NULL pointer - no memory allocated */
    if (opt == 0 && retvalvalue == NULL) {
        fprintf(stderr,
            "\nSUNDIALS_ERROR: %s() failed - returned NULL pointer\n\n",
            funcname);
        return(1);
    }

    /* Check if retval < 0 */
    else if (opt == 1) {
        errretval = (int*)retvalvalue;
        if (*errretval < 0) {
            fprintf(stderr,
                "\nSUNDIALS_ERROR: %s() failed with retval = %d\n\n",
                funcname, *errretval);
            return(1);
        }
    }

    /* Check if function returned NULL pointer - no memory allocated */
    else if (opt == 2 && retvalvalue == NULL) {
        fprintf(stderr,
            "\nMEMORY_ERROR: %s() failed - returned NULL pointer\n\n",
            funcname);
        return(1);
    }

    return(0);
}

double F_right_T_g(
    double Tprev, double T, double Tnext, double xprev, double x, double xnext,
    double uprev, double u, double unext, int number_cell)
{
    double h_left = x - xprev;
    double h = xnext - x;
    double Cp = get_Cp(num_gas_species, Yi, T, 'g');
    double rho = get_rho(Yi, T, 'g');
    double W = get_W(Yi);
    get_grad(gradX, Xi, Xinext, x, xnext);
    double dTdx = (h_left / h / (h + h_left) * Tnext + (h - h_left) / h / h_left * T - h / h_left / (h + h_left) * Tprev);
    double slag_diff = 0;
    double slag_chem = 0.;

    double Vc = 0;
    double YkVk_slag = 0;
    set_Dij_res(T);
    for (int k = 0; k < num_gas_species; k++) {
        YkVk[k] = YkVk_func(k, T, Yi, gradX, Xi, Yi);
        Vc -= YkVk[k];
    }
    for (int i = 0; i < 9; i++) {
        Cpn[i] = 0;
        Hn[i] = 0;
    }

    for (int k = 0; k < num_gas_species; k++) {
        if (T > chec.chemkinReader->species()[k].thermo().getTCommon())
            for (int i = 0; i < 9; i++) {
                Hn[i] += ydot[k] * phyc.Cp_coef_hT[k][i] * my_mol_weight(k);
                Cpn[i] += rho * (YkVk[k] + Yi[k] * Vc) * phyc.Cp_coef_hT[k][i] * dTdx;
            }
        else {
            for (int i = 0; i < 9; i++) {
                Hn[i] += ydot[k] * phyc.Cp_coef_lT[k][i] * my_mol_weight(k);
                Cpn[i] += rho * (YkVk[k] + Yi[k] * Vc) * phyc.Cp_coef_lT[k][i] * dTdx;
            }
        }
        //slag_diff += rho * data->YkVk[k] * myget_Cpi(k, T)  * dTdx;
        //slag_chem += data->ydot[k] * myget_Hi(k, T) * my_mol_weight(k);
    }

    make_averageY(X_tmp, Xi, Xinext);
    double lambda_right = Lambda_All(X_tmp, (Tnext + T) / 2., 'g');
    //cout << "lambda_right = " << lambda_right << "\n";
    make_averageY(X_tmp, Xi, Xiprev);
    double lambda_left = Lambda_All(X_tmp, (T + Tprev) / 2., 'g');
    //cout << "lambda_left = " << lambda_left << "\n";
    double M = get_rho(Yi, T, 'g') * u;
    double dTdr_r = (Tnext - T) / h;
    double dTdr_l = (T - Tprev) / h_left;
    double x_r = (xnext + x) / 2.;
    double x_l = (x + xprev) / 2.;
    double conduct_slag = (2. / (xnext - xprev)) / x / x *
        (lambda_right * dTdr_r * pow(x_r, 2)
            - lambda_left * dTdr_l * pow(x_l, 2));
    //double conduct_slag = (2. / (xnext - xprev)) *
    //    (lambda_right * dTdr_r
    //        - lambda_left * dTdr_l);
    //slag_diff = get_dCpi(Cpn, T);
    slag_diff = 0;
    slag_chem = get_dHiRT(Hn, T);
    //slag_chem = 0;
    return conduct_slag - Cp * M * dTdx - slag_chem + slag_diff;

}
double F_right_T_interfase(double* my_X_tmp, double T_inter_3l, double T_inter_2l,
    double T_inter, double T_inter_2r, double T_inter_3r, double us, double ri, double h, double p) {
    double lambda_d = Lambda_All(my_X_tmp, T_inter, 'd');
    double lambda_g = Lambda_All(my_X_tmp, T_inter, 'g');
    double Wv = my_mol_weight(komponents[Fuel]);
    double grad_d = (p / (p + 1.) * T_inter_3l - (p + 1.) / p * T_inter_2l + T_inter * (2. * p + 1.) / ((p + 1.) * p)) / h;
    double grad_g = (((2. * p - 7.) / ((p - 3.) * (p - 4.))) * T_inter + ((p - 4.) / (p - 3.)) * T_inter_2r + ((p - 3.) / (4. - p)) * T_inter_3r) / h;
    /*double grad_d = (T_inter - Cell_Properties_vector[preinter  - 1].T) / (r_inter - x_vect[preinter - 1]);
    double grad_g = (Cell_Properties_vector[preinter + 2].T - T_inter) / (x_vect[preinter + 2] - r_inter);*/
    //cout << "grad_d = " << grad_d << "\n";
    //cout << "grad_g = " << grad_g << "\n";
    //cout << "T_inter_3l = " << T_inter_3l << "\n";
    //cout << "T_inter_2l = " << T_inter_2l << "\n";
    //cout << "T_inter = " << T_inter << "\n\n";
    return lambda_d * grad_d -
        lambda_g * grad_g - L_d(T_inter) * us * get_rho(Y_inter, T_inter, 'd');
}

double F_right_T_interfase_l(double* X_inter, double T_inter_3l, double T_inter_2l, double T_inter_l,
    double T_inter, double ri_l, double ri, double ri_r, double h, double p) {
    double lambda_r = Lambda_All(X_inter, T_inter, 'd');
    double lambda_l = Lambda_All(X_inter, T_inter, 'd');
    double grad_r = (T_inter - T_inter_2l) / (p * h);
    grad_r = (T_inter - T_inter_l) / (ri_r - ri);
    return 1 / pow(ri, 2) * (1 / (ri_r - 0.5 * (ri_l + ri))) *
        (pow(ri_r, 2) * lambda_r * grad_r -
            lambda_r * pow(0.5 * (ri + ri_l), 2) * (T_inter_l - T_inter_2l) / (ri - ri_l));
}

double F_right_T_interfase_r(double* my_X_inter, double T_inter,
    double T_inter_r, double T_inter_2r, double T_inter_3r, double u, double ri_l, double ri, double ri_r, double h, double p) {
    double lambda_l = Lambda_All(my_X_inter, T_inter, 'g');
    make_averageY(X_tmp, Xi, Xinext);
    double rho = get_rho(Yi, T_inter_r, 'g');
    double Cp = get_Cp(num_gas_species, Yi, T_inter_r, 'g');
    double lambda_r = Lambda_All(X_tmp, (T_inter_2r + T_inter_r) / 2., 'g');
    //cout << "lambda_r_g = " << lambda_r << "\n";
    //cout << "lambda_l_g = " << lambda_l << "\n";
    double grad_l = ((2 * p - 7) / ((p - 3) * (p - 4) * h)) * T_inter +
        ((p - 4) / ((p - 3) * h)) * T_inter_2r + ((p - 3) / (h * (4 - p))) * T_inter_3r;
    //double grad_l = (T_inter_2r - T_inter) / (3 - p_inter) / h;
    for (int i = 0; i < 9; i++) {
        Cpn[i] = 0;
        Hn[i] = 0;
    }

    for (int k = 0; k < num_gas_species; k++) {
        if (T_inter_r > chec.chemkinReader->species()[k].thermo().getTCommon())
            for (int i = 0; i < 9; i++) {
                Hn[i] += ydot[k] * phyc.Cp_coef_hT[k][i] * my_mol_weight(k);
            }
        else {
            for (int i = 0; i < 9; i++) {
                Hn[i] += ydot[k] * phyc.Cp_coef_lT[k][i] * my_mol_weight(k);

            }
        }
        //slag_diff += rho * data->YkVk[k] * myget_Cpi(k, T)  * dTdx;
        //slag_chem += data->ydot[k] * myget_Hi(k, T) * my_mol_weight(k);
    }
    double slag_chem = get_dHiRT(Hn, T_inter_r);
    return  1 / pow(ri, 2) * (1 / (0.5 * (ri_r + ri) - ri_l)) *
        (lambda_r * pow(0.5 * (ri_r + ri), 2) * (T_inter_2r - T_inter_r) / (ri_r - ri) -
            pow(ri_l, 2) * lambda_l * grad_l) -
        Cp * rho * u * (T_inter_r - T_inter) / ((ri - ri_l)) - slag_chem;
}

double F_right_T_d(
    double Tprev, double T, double Tnext, double xprev, double x, double xnext,
    double uprev, double u, double unext, int number_cell)
{
    double h_left = x - xprev;
    double h = xnext - x;
    double Cp = get_Cp(num_gas_species, Yi, T, 'd');
    double rho = get_rho(Yi, T, 'd');
    double W = get_W(Yi);
    get_grad(gradX, Xi, Xinext, x, xnext);
    double dTdx = (h_left / h / (h + h_left) * Tnext + (h - h_left) / h / h_left * T - h / h_left / (h + h_left) * Tprev);
    double slag_diff = 0;
    double slag_chem = 0.;

    make_averageY(X_tmp, Xi, Xinext);
    double lambda_right = Lambda_All(X_tmp, (Tnext + T) / 2., 'd');
    make_averageY(X_tmp, Xi, Xiprev);
    double lambda_left = Lambda_All(X_tmp, (T + Tprev) / 2., 'd');
    double dTdr_r = (Tnext - T) / h;
    double dTdr_l = (T - Tprev) / h_left;
    double x_r = (xnext + x) / 2.;
    double x_l = (x + xprev) / 2.;
    double conduct_slag = (2. / (xnext - xprev)) / x / x *
        (lambda_right * dTdr_r * pow(x_r, 2)
            - lambda_left * dTdr_l * pow(x_l, 2));
    return conduct_slag;

}
double get_vel(double* my_X_tmp, double T_inter_3l, double T_inter_2l,
    double T_inter, double T_inter_2r, double T_inter_3r, double h, double p) {
    double lambda_d = Lambda_All(my_X_tmp, T_inter, 'd');
    double lambda_g = Lambda_All(my_X_tmp, T_inter, 'g');
    return (lambda_d * (p / (p + 1) * T_inter_3l - (p + 1) / p * T_inter_2l + T_inter * (2 * p + 1) / ((p + 1) * p)) / h -
        lambda_g * (((2 * p - 7) / ((p - 3) * (p - 4))) * T_inter + ((p - 4) / (p - 3)) * T_inter_2r + ((p - 3) / (4 - p)) * T_inter_3r) / h) / L_d(T_inter) / get_rho_d(T_inter);
}
double F_rightY(int k_spec,
    double Tprev, double T, double Tnext, double xprev, double x, double xnext,
    double uprev, double u, double unext, int i)
{

    double h_left = x - xprev;
    double h = xnext - x;
    double x_l = (x + xprev) / 2.;
    double x_r = (xnext + x) / 2.;
    double rho = get_rho(Yi, T, 'g');
    double rhoYkVk_r = 1.;
    double rhoYkVk_l = 1.;
    double slag_diff = 0.;
    double slag_chem = 0.;
    double dTdx = (h_left / h / (h + h_left) * Tnext + (h - h_left) / h / h_left * T - h / h_left / (h + h_left) * Tprev);

    rhoYkVk_r = rho_r_diff * (YkVk_r[k_spec] + Y_tmp_r[k_spec] * Vc_r);
    //cout << "data->YkVk[k_spec] =  " << data->YkVk[k_spec] << "\n";


    rhoYkVk_l = rho_l_diff * (YkVk_l[k_spec] + Y_tmp_l[k_spec] * Vc_l);
    //cout << "\n\n";

    slag_diff = (rhoYkVk_r * pow(x_r, 2) - rhoYkVk_l * pow(x_l, 2)) / (x_r - x_l) / x / x;
    //slag_diff = (rhoYkVk_r  - rhoYkVk_l) / (x_r - x_l);
    slag_chem = my_mol_weight(k_spec) * ydot[k_spec];
    //slag_chem = 0;
    //cout << "slag_chem =  " << slag_chem << "\n";
    //cout << "slag_diff gas = " << slag_diff << "\n";
    double M = get_rho(Yi, T, 'g') * u;
    double dYdr = (h_left / h / (h + h_left) * Yinext[k_spec] + (h - h_left) / h / h_left * Yi[k_spec] - h / h_left / (h + h_left) * Yiprev[k_spec]);
    
    slag_chem_vect[i][k_spec] = slag_chem;
    slag_diff_vect[i][k_spec] = slag_diff;
    MdYdr_vect[i][k_spec] = M * (dYdr);
    return -M * (dYdr)+slag_chem - slag_diff;
}
double get_Qg(double Tval, double Tvalr, double TvalrP, double* Yval, double h, double p) {
    return Lambda_All(Yval, Tval, 'g') * (((2 * p - 7) / ((p - 3) * (p - 4))) * Tval + ((p - 4) / (p - 3)) * Tvalr + ((p - 3) / (4 - p)) * TvalrP) / h;
}
double get_Qd(double TvallM, double Tvall, double Tval, double* Yval, double h, double p) {
    return Lambda_All(Yval, Tval, 'd') * (p / (p + 1) * TvallM - (p + 1) / p * Tvall + Tval * (2 * p + 1) / ((p + 1) * p)) / h;
}
double  F_rightY_interface(int k_spec, double Vc,
    double T_inter, double xprev, double x, double u, double us, double p, int number_cell) {
    if (komponents_str[k_spec] == Fuel) {
        double Pf_ = Pf(T_inter, r_inter);
        double mol_w = my_mol_weight(k_spec);
        double W = get_W(Y_inter);
        /* cout << "Pf = " << Pf(Cell_Properties_inter.T) << "\n";
         cout << "Mu = " << get_W(Cell_Properties_inter.Y.data()) << "\n";
         cout << "Yf = " << Y_inter[k_spec]<<"\n";
         cout << "Pf/P * mol_w/W = " << Pf_ / P * mol_w / W << "\n";
         cout << "1 - 2 =  " << Y_inter[k_spec] - Pf_ / P * mol_w / W << "\n";*/
         /*if (i_ida < 10) {
             cout << "corector  = " << corector << std::endl;
             return Y_inter[k_spec] - corector * Pf_ / P * mol_w / W;
         }
         else {*/
        return Y_inter[k_spec] - Pf_ / P * mol_w / W;
        //}
    }
    else {
        double rho = get_rho(Y_inter, T_inter, 'g');
        double YkVk_spec = YkVk[k_spec] + Y_inter[k_spec] * Vc;
        //cout << komponents_str[k_spec] << "\n";
        //cout << "YkVk_spec = " << YkVk_spec / Y_inter[k_spec] << "\n\n";
        if (t_curr < chem_time) {
            if (initital_components.find(komponents_str[k_spec]) == initital_components.end()) {
                return pow(10, 8) * Y_inter[k_spec];
            }
            else {
                return  (Y_inter[k_spec] * (u - us) + YkVk_spec);
            }
        }
        return  (Y_inter[k_spec] * (u - us) + YkVk_spec);


    }
}

double F_rightY_interface_r(int k_spec,
    double Tprev, double T, double Tnext, double xprev, double x, double xnext,
    double uprev, double u, double unext, int i) {
    double h_left = x - xprev;
    double h = xnext - x;
    double x_l = xprev;
    double x_r = (xnext + x) / 2.;
    double rho = get_rho(Yi, T, 'g');
    double rhoYkVk_r = 1.;
    double rhoYkVk_l = 1.;
    double slag_diff = 0.;
    double slag_chem = 0.;

    rhoYkVk_r = rho_r_diff * (YkVk_r[k_spec] + Y_tmp_r[k_spec] * Vc_r);
    //cout << "data->YkVk[k_spec] =  " << data->YkVk[k_spec] << "\n";


    rhoYkVk_l = rho_l_diff * (YkVk_l[k_spec] + Y_tmp_l[k_spec] * Vc_l);
    //cout << "\n\n";

    slag_diff = (rhoYkVk_r * pow(x_r, 2) - rhoYkVk_l * pow(x_l, 2)) / (x_r - x_l) / x / x;
    //slag_diff = (rhoYkVk_r  - rhoYkVk_l) / (x_r - x_l);
    //slag_chem = my_mol_weight(k_spec) * ydot[k_spec];
    slag_chem = 0;
    //cout << "slag_chem =  " << slag_chem << "\n";
    //cout << "slag_diff inter_r=  " << slag_diff << "\n";
    double M = get_rho(Yi, T, 'g') * u;
    double dYdr = (h_left / h / (h + h_left) * Yinext[k_spec] + (h - h_left) / h / h_left * Yi[k_spec] - h / h_left / (h + h_left) * Y_inter[k_spec]);
    //double dYdr = (Yi[k_spec] - Y_inter[k_spec]) / (x - xprev);
    //if (abs(M * (dYdr)) < pow(10, -10)) {
    //    M = 0;
    //}
    //if (abs(slag_diff) < pow(10, -10)) {
    //    slag_diff = 0;
    //}
    slag_chem_vect[i][k_spec] = slag_chem;
    slag_diff_vect[i][k_spec] = slag_diff;
    MdYdr_vect[i][k_spec] = M * (dYdr);
    return -M * (dYdr)+slag_chem - slag_diff;

}
double  F_right_u_inter(double Vc, int k_spec,
    double T_inter, double xprev, double x, double u, double us, double p, int number_cell) {
    double rhog = get_rho(Y_inter, T_inter, 'g');
    double rhod = get_rho(Y_inter, T_inter, 'd');
    double YkVk_spec = YkVk[k_spec] + Y_inter[k_spec] * Vc;
    //cout << "k_spec = " << Fuel << "\n";
    //cout << "Vk_spec = " << YkVk_spec / Y_inter[k_spec] << "\n";
    return rhog * Y_inter[k_spec] * (u - us) + rhog * YkVk_spec + rhod * us;
}

double inital_u(UserData data, double Vc, double T_inter,
    double u, double us, int number_cell) {
    int k_spec = komponents[Fuel];
    double rho = get_rho(Y_inter, T_inter, 'g');
    double YkVk_fuel = YkVk[k_spec] + Y_inter[k_spec] * Vc;
    return us - (rho * YkVk_fuel + rho * us) / (rho * Y_inter[k_spec]);
}

void Write_to_file(string str, string type_str, vector<Cell_Properties>& my_Cell_Properties_vector,
    Cell_Properties& my_Cell_Properties_inter) {
    double x_start, x_finish, D;
    double rho;
    ofstream fout;

    string path = "";
    fs::path cwd = fs::current_path();
    if (str.find("//") != string::npos) {
        path = str.substr(0, str.find_last_of("//") + 1);
    }
    if (!fs::exists(cwd.string() + "//" + path)) {
        fs::create_directory(path);
    }

    fout.open(str + ".dat");
    string title2 = R"(VARIABLES= "r, cm", "T, K", "rho, g/cm3", "u, cm/s", "vel, cm/s")";
    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        title2.append(R"(, "Y_)" + komponents_str[k_spec] + R"(")");
    }

    /*for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        title2.append(R"(, "YkVK_)" + komponents_str[k_spec] + R"(")");
    }*/
    fout << "TITLE=\"" << "Graphics" << "\"" << endl;
    fout << title2 << endl;
    int N_x = my_Cell_Properties_vector.size();
    for (int i = 0; i < N_x; i++) {
        double W = get_W(my_Cell_Properties_vector[i].Y.data());
        if (i == preinter + 1) {
            double h = x_vect[i] - x_vect[i - 1];
            double ri = x_vect[preinter] + (p_inter - 1.0) * h;
            fout << std::scientific << std::setprecision(12) << ri << "  " << my_Cell_Properties_inter.T << " " << my_Cell_Properties_inter.rho << " " << my_Cell_Properties_inter.u
                << " " << my_Cell_Properties_inter.vel;
            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                fout << std::fixed << std::setprecision(12) << " " << my_Cell_Properties_inter.Y[k_spec];
            }
            //for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            //    fout << " " << Vk_inter[k_spec];
            //}
            fout << endl;
        }
        fout << std::scientific << std::setprecision(12) << x_vect[i] << "  " << my_Cell_Properties_vector[i].T << " " << my_Cell_Properties_vector[i].rho
            << " " << my_Cell_Properties_vector[i].u << " " << my_Cell_Properties_vector[i].vel;
        for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            fout << std::scientific << std::setprecision(12) << " " << my_Cell_Properties_vector[i].Y[k_spec];
        }
        //for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        //    fout << " " << Vk_vect[i][k_spec];
        //}
        fout << endl;
    }
    fout.close();
}

void WriteLog(string msg) {
    string main_log_file = "calculation.log";
    ofstream main_log;

    main_log.open(main_log_file, ios::app);

    // вывод на экран
    cout << msg;

    // вывод в лог
    main_log << msg;


    main_log.close();
}


void Init_Data(UserData data, int N_x, int NEQ) {

    for (int i = 0; i < num_gas_species; i++) {
        ydot[i] = 0;
    }
}

void find_diff_slag(double Tcurr, double Tnext, double* Yi, double* Yinext,
    double* Xi, double* Xinext, double* Ykvk_side, double* Y_tmp_side, double* X_tmp_side, double* gradX_side, double& rho_side, double& Vc_side, int i, char side) {

    make_averageY(Y_tmp_side, Yi, Yinext);
    make_averageY(X_tmp_side, Xi, Xinext);
    get_grad(gradX_side, Xi, Xinext, x_vect[i], x_vect[i + 1]);
    rho_side = get_rho(Y_tmp_side, (Tcurr + Tnext) / 2., 'g');
    Vc_side = 0;
    set_Dij_res((Tcurr + Tnext) / 2.);
    for (int k = 0; k < num_gas_species; k++) {
        //cout << "k = " << komponents_str[k] << "\n";
        int jop;
        Ykvk_side[k] = YkVk_func(k, (Tcurr + Tnext) / 2., Yi, gradX_side, X_tmp_side, Y_tmp_side);
        Vc_side -= Ykvk_side[k];
        //cout << "k = " << komponents_str[k] << "  Ykvk = " << Ykvk_side[k] << "\n";
    }
    // cout << "\n";
}
void find_diff_slag_interface(double xprev, double x, double Tcurr, double Tnext, double* Yi, double* Yinext,
    double* Xi, double* Xinext, double* Ykvk_side, double* Y_tmp_side, double* X_tmp_side, double* gradX_side, double& rho_side, double& Vc_side, double p) {

    make_averageY(Y_tmp_side, Y_inter, Y_inter);
    make_averageY(X_tmp_side, X_inter, X_inter);
    get_grad_interpolate(gradX, Xi, Xi_2, Xi_3, x - xprev, p);
    Vc_side = 0;
    rho_side = get_rho(Y_tmp_side, (Tcurr + Tnext) / 2., 'g');
    set_Dij_res((Tcurr + Tnext) / 2.);
    for (int k = 0; k < num_gas_species; k++) {
        //cout << "k = " << komponents_str[k] << "\n";
        //cout <<"grad = " << gradX[k] << "\n";
        int jop;
        Ykvk_side[k] = YkVk_func(k, (Tcurr + Tnext) / 2., Yi, gradX, X_tmp_side, Y_tmp_side);
        Vc_side -= Ykvk_side[k];
        //cout << "k = " << komponents_str[k] << "  Ykvk = " << Ykvk_side[k] << "\n";
    }
    //cout << "\n";
}

void MakePropertiesvectors(vector<Cell_Properties>& my_Cell_Properties_vector,
    Cell_Properties& my_Cell_Properties_inter,
    double* Y, int myNx) {
    //cout << "i = " << i << "\n";
    for (int i = 1; i < myNx - 1; i++) {
        if (i < preinter + 1) {
            my_Cell_Properties_vector[i].T = Y[(i)*count_var_in_cell - 4];
            my_Cell_Properties_vector[i].u = Y[(i)*count_var_in_cell - 3];
            my_Cell_Properties_vector[i].vel = Y[(i)*count_var_in_cell - 2];
            my_Cell_Properties_vector[i].rho = Y[(i)*count_var_in_cell - 1];
        }
        else {
            my_Cell_Properties_vector[i].T = Y[(i + 1) * count_var_in_cell - 4];
            my_Cell_Properties_vector[i].u = Y[(i + 1) * count_var_in_cell - 3];
            my_Cell_Properties_vector[i].vel = Y[(i + 1) * count_var_in_cell - 2];
            my_Cell_Properties_vector[i].rho = Y[(i + 1) * count_var_in_cell - 1];
        }
    }
    my_Cell_Properties_vector[0].T = my_Cell_Properties_vector[1].T;
    my_Cell_Properties_vector[0].u = my_Cell_Properties_vector[1].u;
    my_Cell_Properties_vector[0].vel = my_Cell_Properties_vector[1].vel;
    my_Cell_Properties_vector[0].rho = my_Cell_Properties_vector[1].rho;

    my_Cell_Properties_vector[myNx - 1].T = my_Cell_Properties_vector[myNx - 2].T;
    my_Cell_Properties_vector[myNx - 1].u = my_Cell_Properties_vector[myNx - 2].u;
    my_Cell_Properties_vector[myNx - 1].vel = my_Cell_Properties_vector[myNx - 2].vel;
    my_Cell_Properties_vector[myNx - 1].rho = my_Cell_Properties_vector[myNx - 2].rho;


    my_Cell_Properties_inter.T = Y[(preinter + 1) * count_var_in_cell - 4];
    my_Cell_Properties_inter.u = Y[(preinter + 1) * count_var_in_cell - 3];
    my_Cell_Properties_inter.vel = Y[(preinter + 1) * count_var_in_cell - 2];
    my_Cell_Properties_inter.rho = Y[(preinter + 1) * count_var_in_cell - 1];
    MakeYvector(my_Cell_Properties_vector, my_Cell_Properties_inter, Y, myNx);
}


void MakeYvector(vector<Cell_Properties>& my_Cell_Properties_vector,
    Cell_Properties& my_Cell_Properties_inter, double* Y, int myNx) {
    //cout << "i = " << i << "\n";
    for (int i = 1; i < myNx - 1; i++) {
        for (int j = 0; j < num_gas_species; j++) {
            if (i < preinter + 1) {
                my_Cell_Properties_vector[i].Y[j] = Y[j + (i - 1) * count_var_in_cell];

            }
            else {
                my_Cell_Properties_vector[i].Y[j] = Y[j + (i)*count_var_in_cell];
            }
        }
    }
    my_Cell_Properties_vector[0].Y = my_Cell_Properties_vector[1].Y;
    my_Cell_Properties_vector[myNx - 1].Y = my_Cell_Properties_vector[myNx - 2].Y;
    for (int j = 0; j < num_gas_species; j++) {
        my_Cell_Properties_inter.Y[j] = Y[j + (preinter)*count_var_in_cell];
    }
}

void get_Yi(UserData data,
    double* yval, double* my_Yi, int i) {
    for (int j = 0; j < num_gas_species; j++) {
        my_Yi[j] = yval[j + (i - 1) * count_var_in_cell];
    }
}

void MakeYvectors_interface(double* yval) {
    for (int j = 0; j < num_gas_species; j++) {
        Y_inter[j] = yval[j + (preinter)*count_var_in_cell];
        Y_inter_2r[j] = yval[j + (preinter + 2) * count_var_in_cell];
        Y_inter_3r[j] = yval[j + (preinter + 3) * count_var_in_cell];
    }
}

void Make_Xvector(UserData data, double* Y, double* X_mol, int myNx, int i) {
    //cout << "i = " << i << "\n";
    for (int j = 0; j < num_gas_species; j++) {

        Y_tmp[j] = Y[j + (i - 1) * count_var_in_cell];
    }
    Get_mole_fr(X_mol, Y_tmp);
}


void makeYstart(double koeff_topl, string fuel, double O2_in, double N2_in, double* Ystart) {

    double n = 7;
    double m = 16;
    double koeff_O2 = (n + 0.25 * m);

    double koeff_N2 = N2_in / O2_in * koeff_O2;
    double koeff_fuel = koeff_topl;
    cout << "koeff_fuel = " << koeff_fuel << "\n";
    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        Xi[k_spec] = 0;
    }

    Xi[komponents["O2"]] = koeff_O2 / (koeff_O2 + koeff_N2 + koeff_fuel);
    Xi[komponents["N2"]] = koeff_N2 / (koeff_O2 + koeff_N2 + koeff_fuel);
    Xi[komponents[fuel]] = koeff_fuel / (koeff_O2 + koeff_N2 + koeff_fuel);

    cout << "mol O2 = " << Xi[komponents["O2"]] << "\n";
    cout << "mol N2 = " << Xi[komponents["N2"]] << "\n";
    cout << "mol " << fuel << " = " << Xi[komponents[fuel]] << "\n";

    moleFraction_to_massFraction(Xi, Ystart);


    cout << "O2 = " << Ystart[komponents["O2"]] << "\n";
    cout << "N2 = " << Ystart[komponents["N2"]] << "\n";
    cout << fuel << " = " << Ystart[komponents[fuel]] << "\n";
}

int integrate_All_IDA_M(int N_x) {


    void* mem;
    N_Vector yy, yp, avtol, cons, id;
    realtype rtol, * yval, * ypval, * atval, * consval, * id_val;
    realtype t0, tout, tret;
    int iout, retval, retvalr;
    SUNMatrix A;
    SUNLinearSolver LS;
    SUNNonlinearSolver NLS;
    SUNContext ctx;
    UserData data;
    data = (UserData)malloc(sizeof * data);
    int NEQ_Y = num_gas_species * (N_x - 2);
    count_var_in_cell = num_gas_species + add_variable_count;


    int NEQ = (N_x - 2) * (count_var_in_cell)+count_var_in_cell;
    vector<double> Yp_vect(num_gas_species * (N_x));
    vector<double> Tp_vect(N_x);
    int j = 0;
    mem = NULL;
    cons = yy = yp = avtol = NULL;
    yval = ypval = atval = NULL;
    A = NULL;
    LS = NULL;
    NLS = NULL;
    /* Create SUNDIALS context */
    retval = SUNContext_Create(NULL, &ctx);
    if (check_retval(&retval, "SUNContext_Create", 1)) return(1);


    data->my_tcur = t_curr;
    data->t = t_curr;
    Init_Data(data, N_x, NEQ);




    /* Allocate N-vectors. */
    yy = N_VNew_OpenMP(NEQ, num_threads_global, ctx);
    if (check_retval((void*)yy, "N_VNew_OpenMP", 0)) return(1);

    yp = N_VNew_OpenMP(NEQ, num_threads_global, ctx);
    if (check_retval((void*)yp, "N_VNew_OpenMP", 0)) return(1);
    avtol = N_VNew_OpenMP(NEQ, num_threads_global, ctx);
    if (check_retval((void*)avtol, "N_VNew_OpenMP", 0)) return(1);
    cons = N_VNew_OpenMP(NEQ, num_threads_global, ctx);
    if (check_retval((void*)cons, "N_VNew_OpenMP", 0)) return(1);
    id = N_VNew_OpenMP(NEQ, num_threads_global, ctx);
    if (check_retval((void*)id, "N_VNew_OpenMP", 0)) return(1);;


    yval = NV_DATA_OMP(yy);
    id_val = NV_DATA_OMP(id);
    ypval = NV_DATA_OMP(yp);
    rtol = RCONST(r_tol);
    atval = NV_DATA_OMP(avtol);
    consval = NV_DATA_OMP(cons);
    int number_spec = 0;
    int i_temp = 0;


    Get_mole_fr(X_tmp, Cell_Properties_inter.Y.data());
    r_inter = x_vect[preinter] + (p_inter - 1) * (x_vect[preinter] - x_vect[preinter - 1]);
    for (int i = 1; i < N_x - 1; i++) {
        if (i < preinter + 1) {
            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                consval[i_temp] = 0.0;   /*constraint*/
                yval[i_temp] = Cell_Properties_vector[i].Y[k_spec];
                atval[i_temp] = abs_tol_Y;
                id_val[i_temp] = 0.;
                i_temp++;
            }

            yval[i_temp] = Cell_Properties_vector[i].T;
            consval[i_temp] = 1.0;
            atval[i_temp] = abs_tol_T;
            id_val[i_temp] = 1.;

            i_temp++;
            yval[i_temp] = Cell_Properties_vector[i].u;
            atval[i_temp] = abs_tol_u;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;

            yval[i_temp] = Cell_Properties_inter.vel;
            atval[i_temp] = abs_tol_u_interf;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;

            yval[i_temp] = Cell_Properties_vector[i].rho;
            atval[i_temp] = abs_tol_rho;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;
        }

        if (i == preinter + 1) {
            r_inter = x_vect[preinter] + (p_inter - 1) * (x_vect[preinter] - x_vect[preinter - 1]);
            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {//Интерфейс
                consval[i_temp] = 0.0;   /*constraint*/
                yval[i_temp] = Cell_Properties_inter.Y[k_spec];
                atval[i_temp] = pow(10, -12);
                id_val[i_temp] = 0.;
                i_temp++;
            }

            yval[i_temp] = Cell_Properties_inter.T;
            consval[i_temp] = 1.0;
            atval[i_temp] = abs_tol_T;
            id_val[i_temp] = 0.;
            i_temp++;

            yval[i_temp] = Cell_Properties_inter.u;
            atval[i_temp] = abs_tol_u;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;


            yval[i_temp] = Cell_Properties_inter.vel;
            atval[i_temp] = abs_tol_u_interf;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;

            yval[i_temp] = Cell_Properties_inter.rho;
            atval[i_temp] = abs_tol_rho;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;


            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                consval[i_temp] = 0.0;   /*constraint*/
                yval[i_temp] = Cell_Properties_vector[i].Y[k_spec];
                atval[i_temp] = abs_tol_Y;
                id_val[i_temp] = 1.;

                i_temp++;
            }
            yval[i_temp] = Cell_Properties_vector[i].T;
            consval[i_temp] = 1.0;
            atval[i_temp] = abs_tol_T;
            id_val[i_temp] = 1.;

            i_temp++;
            yval[i_temp] = Cell_Properties_vector[i].u;

            atval[i_temp] = abs_tol_u;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 1;

            i_temp++;
            yval[i_temp] = Cell_Properties_inter.vel;
            atval[i_temp] = abs_tol_u_interf;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;

            yval[i_temp] = Cell_Properties_vector[i].rho;
            atval[i_temp] = abs_tol_rho;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;
        }

        if (i > preinter + 1) {
            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                consval[i_temp] = 0.0;   /*constraint*/
                yval[i_temp] = Cell_Properties_vector[i].Y[k_spec];
                atval[i_temp] = abs_tol_Y;
                id_val[i_temp] = 1.;
                i_temp++;
            }
            yval[i_temp] = Cell_Properties_vector[i].T;
            consval[i_temp] = 1.0;
            atval[i_temp] = abs_tol_T;
            id_val[i_temp] = 1.;
            i_temp++;

            yval[i_temp] = Cell_Properties_vector[i].u;
            atval[i_temp] = abs_tol_u;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 1;
            i_temp++;

            yval[i_temp] = Cell_Properties_inter.vel;
            atval[i_temp] = abs_tol_u_interf;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;

            yval[i_temp] = Cell_Properties_vector[i].rho;
            atval[i_temp] = abs_tol_rho;
            consval[i_temp] = 0.0;
            id_val[i_temp] = 0;
            i_temp++;
        }
    }

    MakePropertiesvectors(Cell_Properties_vector, Cell_Properties_inter, yval, Nx);
    t0 = t_curr;
    double rho;


    i_temp = 0;
    int i_T, i_u, i_vel_interf, di_l, di_r, i_inter_T;
    double T_prev, T_curr, T_next;
    double u_prev, u_curr, u_next;
    double vel_prev, vel_curr, vel_next;
    double rho_prev, rho_curr, rho_next;

    double T_inter, T_inter_2l, T_inter_3l, T_inter_2r, T_inter_3r;
    double vel_inter, rho_inter;
    double vel_interf_curr;
    for (int i = 1; i < N_x - 1; i++) {
        T_inter = Cell_Properties_inter.T;
        u_inter = Cell_Properties_inter.u;
        vel_inter = Cell_Properties_inter.vel;
        rho_inter = Cell_Properties_inter.rho;


        for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            Yiprev[k_spec] = Cell_Properties_vector[i - 1].Y[k_spec];
            Yi[k_spec] = Cell_Properties_vector[i].Y[k_spec];
            Yinext[k_spec] = Cell_Properties_vector[i + 1].Y[k_spec];
        }

        for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            Y_inter[k_spec] = Cell_Properties_inter.Y[k_spec];
        }

        T_prev = Cell_Properties_vector[i - 1].T;
        T_curr = Cell_Properties_vector[i].T;
        T_next = Cell_Properties_vector[i + 1].T;

        u_prev = Cell_Properties_vector[i - 1].u;
        u_curr = Cell_Properties_vector[i].u;
        u_next = Cell_Properties_vector[i + 1].u;

        vel_prev = Cell_Properties_vector[i - 1].vel;
        vel_curr = Cell_Properties_vector[i].vel;
        vel_next = Cell_Properties_vector[i + 1].vel;

        rho_prev = Cell_Properties_vector[i - 1].rho;
        rho_curr = Cell_Properties_vector[i].rho;
        rho_next = Cell_Properties_vector[i + 1].rho;


        vel_interf_curr = Cell_Properties_vector[i].vel;


        Get_molar_cons(Xi, Cell_Properties_vector[i].Y.data(), Cell_Properties_vector[i].T);
        chem_vel(Sn, Hn, forward_arr, reverse_arr, equilib_arr,
            Cell_Properties_vector[i].T, Xi, ydot, i);
        Get_mole_fr(Xiprev, Cell_Properties_vector[i - 1].Y.data()); Get_mole_fr(Xi, Cell_Properties_vector[i].Y.data()); Get_mole_fr(Xinext, Cell_Properties_vector[i + 1].Y.data());
        Get_mole_fr(Xi_2, Cell_Properties_vector[preinter + 2].Y.data()); Get_mole_fr(Xi_3, Cell_Properties_vector[preinter + 3].Y.data()); Get_mole_fr(X_inter, Cell_Properties_inter.Y.data());


        if (i < preinter) {

            rho = get_rho(Yi, T_curr, 'd');

            double Cp = get_Cp(num_gas_species, Yi, T_curr, 'd');
            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                ypval[i_temp] = Cell_prouds_vector[i].Y[k_spec];
                Cell_prouds_vector[i].Y[k_spec] = ypval[i_temp];
                i_temp++;
            }
            ypval[i_temp] = F_right_T_d(
                T_prev, T_curr, T_next,
                x_vect[i - 1], x_vect[i], x_vect[i + 1],
                u_prev, u_curr, u_next, i) / rho / Cp;
            Cell_prouds_vector[i].T = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].u;
            Cell_prouds_vector[i].u = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].vel;
            Cell_prouds_vector[i].vel = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].rho;
            Cell_prouds_vector[i].rho = ypval[i_temp];
            i_temp++;
        }

        if (i == preinter) {
            T_inter_2l = Cell_Properties_vector[preinter - 1].T;
            T_inter_3l = Cell_Properties_vector[preinter - 2].T;

            double h = x_vect[preinter] - x_vect[preinter - 1];
            r_inter = x_vect[preinter - 1] + p_inter * h;

            rho = get_rho(Yi, T_curr, 'd');
            double Cp = get_Cp(num_gas_species, Yi, T_curr, 'd');

            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                ypval[i_temp] = Cell_prouds_vector[i].Y[k_spec];
                Cell_prouds_vector[i].Y[k_spec] = ypval[i_temp];
                i_temp++;
            }
            ypval[i_temp] = F_right_T_interfase_l(X_inter, T_inter_3l, T_inter_2l, T_curr, T_inter, x_vect[i - 1], x_vect[i], r_inter, h, p_inter) / rho / Cp;
            Cell_prouds_vector[i].T = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].u;
            Cell_prouds_vector[i].u = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].vel;
            Cell_prouds_vector[i].vel = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].rho;
            Cell_prouds_vector[i].rho = ypval[i_temp];
            i_temp++;
        }

        if (i == preinter + 1) {
            T_inter_2l = Cell_Properties_vector[preinter - 1].T;
            T_inter_3l = Cell_Properties_vector[preinter - 2].T;
            T_inter_2r = Cell_Properties_vector[preinter + 2].T;
            T_inter_3r = Cell_Properties_vector[preinter + 3].T;
            u_inter_2r = Cell_Properties_vector[preinter + 2].u;
            u_inter_3r = Cell_Properties_vector[preinter + 3].u;
            double rho_inter_2r = Cell_Properties_vector[preinter + 2].rho;
            double rho_inter_3r = Cell_Properties_vector[preinter + 3].rho;

            double h = x_vect[preinter] - x_vect[preinter - 1];
            r_inter = x_vect[preinter] + (p_inter - 1.0) * h;
            find_diff_slag_interface(x_vect[i - 1], x_vect[i], T_inter, T_inter, Y_inter, Y_inter, X_inter, X_inter, YkVk_l, Y_tmp_l, X_tmp_l, gradX_l, rho_l_diff, Vc_l, p_inter);
            rho = get_rho(Yi, T_inter, 'g');
            double Cp = get_Cp(num_gas_species, Yi, T_inter, 'g');
            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                ypval[i_temp] = Cell_prouds_inter.Y[k_spec];
                Cell_prouds_inter.Y[k_spec] = ypval[i_temp];
                i_temp++;
            }

            ypval[i_temp] = Cell_prouds_inter.T;
            Cell_prouds_inter.T = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_inter.u;
            Cell_prouds_inter.u = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_inter.vel;
            Cell_prouds_inter.vel = ypval[i_temp];

            i_temp++;

            ypval[i_temp] = Cell_prouds_inter.rho;
            Cell_prouds_inter.rho = ypval[i_temp];

            // cout << "i_temp rho initial = " << i_temp << " = " << ypval[i_temp] << "\n";
            i_temp++;

            find_diff_slag(T_curr, T_next, Yi, Yinext, Xi, Xinext, YkVk_r, Y_tmp_r, X_tmp_r, gradX_r, rho_r_diff, Vc_r, i, 'r');

            rho = get_rho(Yi, T_curr, 'g');

            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                ypval[i_temp] = F_rightY_interface_r(k_spec,
                    T_inter, T_curr, T_next,
                    r_inter, x_vect[i], x_vect[i + 1],
                    u_inter, u_curr, u_next, i) / rho;
                Cell_prouds_vector[i].Y[k_spec] = ypval[i_temp];
                i_temp++;
            }


            Cp = get_Cp(num_gas_species, Yi, T_curr, 'g');
            ypval[i_temp] = F_right_T_interfase_r(X_inter,
                T_inter, T_curr, T_inter_2r, T_inter_3r,
                u_curr, r_inter, x_vect[i], x_vect[i + 1],
                h, p_inter) / rho / Cp;
            Cell_prouds_vector[i].T = ypval[i_temp];

            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].u;
            Cell_prouds_vector[i].u = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].vel;
            Cell_prouds_vector[i].vel = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].rho;
            Cell_prouds_vector[i].rho = ypval[i_temp];
            i_temp++;
        }


        if (i > preinter + 1) {

            find_diff_slag(T_curr, T_next, Yi, Yinext, Xi, Xinext, YkVk_r, Y_tmp_r, X_tmp_r, gradX_r, rho_r_diff, Vc_r, i, 'r');

            find_diff_slag(T_prev, T_curr, Yiprev, Yi, Xiprev, Xi, YkVk_l, Y_tmp_l, X_tmp_l, gradX_l, rho_l_diff, Vc_l, i - 1, 'l');

            rho = get_rho(Yi, T_curr, 'g');
            double Cp = get_Cp(num_gas_species, Yi, T_curr, 'g');

            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                ypval[i_temp] = F_rightY(k_spec,
                    T_prev, T_curr, T_next,
                    x_vect[i - 1], x_vect[i], x_vect[i + 1],
                    u_prev, u_curr, u_next, i) / rho;
                Cell_prouds_vector[i].Y[k_spec] = ypval[i_temp];

                i_temp++;
            }
            ypval[i_temp] = F_right_T_g(
                T_prev, T_curr, T_next,
                x_vect[i - 1], x_vect[i], x_vect[i + 1],
                u_prev, u_curr, u_next, i) / rho / Cp;
            Cell_prouds_vector[i].T = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].u;
            Cell_prouds_vector[i].u = ypval[i_temp];
            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].vel;
            Cell_prouds_vector[i].vel = ypval[i_temp];

            i_temp++;

            ypval[i_temp] = Cell_prouds_vector[i].rho;
            Cell_prouds_vector[i].rho = ypval[i_temp];

            i_temp++;
        }
    }
    /* Call IDACreate and IDAInit to initialize IDA memory */
    mem = IDACreate(ctx);
    if (check_retval((void*)mem, "IDACreate", 0)) return(1);

    retval = IDAInit(mem, func_All_IDA_M, t0, yy, yp);
    if (check_retval(&retval, "IDAInit", 1)) return(1);
    /* Call IDASVtolerances to set tolerances */
    data->sun_mem = mem;
    retval = IDASVtolerances(mem, rtol, avtol);
    if (check_retval(&retval, "IDASVtolerances", 1)) return(1);
    retval = IDASetConstraints(mem, cons);
    retval = IDASetUserData(mem, data);
    if (check_retval(&retval, "IDASetUserData", 1)) return(1);
    //retval = IDASetMaxNumSteps(mem, 1000);
    /* Create dense SUNMatrix for use in linear solves */
    int mu = 4 * (count_var_in_cell);
    int ml = 4 * (count_var_in_cell);

    A = SUNBandMatrix(NEQ, mu, ml, ctx);
    if (check_retval((void*)A, "SUNBandMatrix", 0)) return(1);

    /* Create banded SUNLinearSolver object */
    LS = SUNLinSol_Band(yy, A, ctx);
    if (check_retval((void*)LS, "SUNLinSol_Band", 0)) return(1);

    /* Attach the matrix and linear solver */
    retval = IDASetLinearSolver(mem, LS, A);
    if (check_retval(&retval, "IDASetLinearSolver", 1)) return(1);

    NLS = SUNNonlinSol_Newton(yy, ctx);
    if (check_retval((void*)NLS, "SUNNonlinSol_Newton", 0)) return(1);

    /* Attach the nonlinear solver */
    retval = IDASetNonlinearSolver(mem, NLS);
    if (check_retval(&retval, "IDASetNonlinearSolver", 1)) return(1);


    IDASetMaxNumSteps(mem, 20);
    /* In loop, call IDASolve, print results, and test for error.
        Break out of loop when NOUT preset output times have been reached. */

    iout = 0;
    double tout1 = tout1_global;
    tout = t_curr + tout1;
    double W, w_dot;

    ofstream params;
    params.open("params\\params.dat");
    params << R"(VARIABLES= "t, s", "D^2", "Mdot", "Qd, J/(s*cm<sup>2", "Qg, J/(s*cm<sup>2", "vel, cm/s", "Mass", "p_inter", "P_heptane", "Pf")" << endl;
    params << "TITLE=\"" << "Graphics" << "\"" << endl;
    double r0 = r_inter;
    IDASetEtaMax(mem, 8);
    IDASetEtaMin(mem, 0.2);
    IDASetMinStep(mem, 1e-30);
    IDASetMaxStep(mem, dt_max);
    IDASetInitStep(mem, initial_dt);
    IDASetMaxNumSteps(mem, MaxNumSteps);
    MakePropertiesvectors(Cell_Properties_vector, Cell_Properties_inter, yval, Nx);
    MakePropertiesvectors(Cell_prouds_vector, Cell_prouds_inter, ypval, Nx);

    while (t_curr <= t_end_all) {
        retval = IDASolve(mem, tout, &tret, yy, yp, IDA_NORMAL);
        Get_mole_fr(Xi, Cell_Properties_inter.Y.data());
        double dt_IdA;
        IDAGetCurrentStep(mem, &dt_IdA);
        cout << "dt_IdA = " << dt_IdA << "\n";
        tout1_global = dt_IdA;
        if (check_retval(&retval, "IDASolve", 1)) {
            std::ostringstream out;
            int precision = 12;
            out << std::fixed << std::setprecision(precision) << tout;
            string tout_string = out.str();
            Write_to_file("ida_result//" + tout_string + "_yval_eror", "yval", Cell_Properties_vector, Cell_Properties_inter);
            Write_to_file("ida_result//" + tout_string + "_ypval_eror", "ypval", Cell_prouds_vector, Cell_prouds_inter);
            return 1;
        }
        MakePropertiesvectors(Cell_Properties_vector, Cell_Properties_inter, yval, Nx);
        MakePropertiesvectors(Cell_prouds_vector, Cell_prouds_inter, ypval, Nx);

        if (iout % n_out == 0) {
            /* Write_to_file("ida_result//" + to_string(tout * pow(10, 0)) + "_yval", "yval", Cell_Properties_vector, Cell_Properties_inter);
             Write_drhodt("ida_result//" + to_string(tout * pow(10, 0)) + "drhodt");
             Write_to_file("ida_result//" + to_string(tout * pow(10, 0)) + "_ypval", "ypval", Cell_prouds_vector, Cell_prouds_inter);*/
            std::ostringstream out;
            int precision = 12;
            out << std::fixed << std::setprecision(precision) << tout;
            string tout_string = out.str();
            Write_to_file("ida_result//" + tout_string + "_yval", "yval", Cell_Properties_vector, Cell_Properties_inter);
            //Write_drhodt("ida_result//" + tout_string + "drhodt");
            Write_to_file("ida_result//" + tout_string + "_ypval", "ypval", Cell_prouds_vector, Cell_prouds_inter);
            Write_to_file_slagY("ida_result//" + tout_string + "slag");
        }
        if (iout % n_out == 0) {
            double h = x_vect[1] - x_vect[0];
            params << tout << " " << pow(r_inter / r0, 2) << " " << 4 * Pi * pow(r_inter, 2) * Cell_Properties_inter.rho * Cell_Properties_inter.u << " "
                << get_Qd(Cell_Properties_vector[preinter - 2].T, Cell_Properties_vector[preinter - 1].T, Cell_Properties_inter.T, Cell_Properties_inter.Y.data(), h, p_inter) << " "
                << get_Qg(Cell_Properties_inter.T, Cell_Properties_vector[preinter + 2].T, Cell_Properties_vector[preinter + 3].T, Cell_Properties_inter.Y.data(), h, p_inter) << " "
                << Cell_Properties_inter.vel << " " << get_mass_of_system(r_inter)
                << " " << p_inter << " " << P * Xi[komponents[Fuel]] << " " << Pf(Cell_Properties_inter.T, r_inter) << "\n";
        }

        for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            if (Cell_Properties_vector[preinter + 1].Y[k_spec] < 0) {
                Cell_Properties_vector[preinter + 1].Y[k_spec] = pow(10, -30);
                Cell_prouds_vector[preinter + 1].Y[k_spec] = pow(10, -30);
            }

            if (Cell_Properties_inter.Y[k_spec] < 0) {
                Cell_Properties_inter.Y[k_spec] = pow(10, -30);
                Cell_prouds_inter.Y[k_spec] = pow(10, -30);
            }
        }
        Make_Yval_From_Cell_Properties(Cell_Properties_vector, Cell_Properties_inter, yval, Nx);
        iout++;
        tout1 *= 1.;
        tout += tout1_global;
        if (tout > chem_time) {
            IDASetMinStep(mem, 1.e-16);
        }
        if (tout > 5 * 1.e-6) {
            IDASetEtaMax(mem, 2);
            IDASetEtaMin(mem, 0.5);
        }

    }
    params.close();
    IDA_data_file.close();
    //std::cout << "tout = " << tout << "\n";
    cout << "\nFinal Statistics:\n";
    retval = IDAPrintAllStats(mem, stdout, SUN_OUTPUTFORMAT_TABLE);

    // Вывод статистики IDA в лог
    FILE* log_file = fopen("calculation.log", "a");
    retval = IDAPrintAllStats(mem, log_file, SUN_OUTPUTFORMAT_TABLE);
    fclose(log_file);

    free(data);
    IDAFree(&mem);
    SUNNonlinSolFree(NLS);
    SUNLinSolFree(LS);
    SUNMatDestroy(A);
    N_VDestroy_OpenMP(avtol);
    N_VDestroy_OpenMP(yy);
    N_VDestroy_OpenMP(yp);
    N_VDestroy_OpenMP(cons);
    SUNContext_Free(&ctx);
    return(retval);
}

static int func_All_IDA_M(realtype tres, N_Vector yy, N_Vector yp, N_Vector rr, void* user_data)
{
    realtype* yval, * ypval, * rval;
    UserData data;
    double Temp;
    double M;
    double sumY = 0;
    data = (UserData)user_data;
    double Cp;
    double p = 0;

    int j;
    yval = NV_DATA_OMP(yy);
    ypval = NV_DATA_OMP(yp);
    rval = NV_DATA_OMP(rr);

    double rho = get_rho(Yi, Cell_Properties_vector[0].T, 'g');
    double Vc = 0;


    int i_T, i_u, i_vel_interf, di_l, di_r, i_inter_T;

    double u_inter_prev, u_inter_curr, u_inter_next;
    double vel_interf_curr, vel_interf_prev, vel_interf_next;
    double step;

    int retval = IDAGetCurrentStep(data->sun_mem, &step);
    check_retval(&retval, "IDAGetCurrentStep", 1);

    double tprev = data->t;
    data->t = tres;
    t_curr = tres;
    double dt = tres - tprev;
    double h = x_vect[preinter + 1] - x_vect[preinter];
    double rho_inter;
    MakePropertiesvectors(Cell_Properties_vector, Cell_Properties_inter, yval, Nx);
    MakePropertiesvectors(Cell_prouds_vector, Cell_prouds_inter, ypval, Nx);

    double T_inter = Cell_Properties_inter.T;
    u_inter = Cell_Properties_inter.u;
    double vel_inter = Cell_Properties_inter.vel;
    rho_inter = Cell_Properties_inter.rho;

    double V = vel_inter / h;
    set_p(tres, dt, step, V, h);
    if (dt > 0) {

        char log_message[200];
        sprintf(log_message, "\nt current = %.10g\ndt = %.10g\nr_inter = %f\np_inter = %f\n\n\n", tres, dt, r_inter, p_inter);
        WriteLog(log_message);

        long int nsteps, nrevals, nlinsetups, netfails, nniters, nncfails, njevals;
        int qlast, qcur;
        double hinused, hlast, hcur, tcur_ida;
        IDAGetIntegratorStats(data->sun_mem, &nsteps, &nrevals, &nlinsetups, &netfails,
            &qlast, &qcur, &hinused, &hlast, &hcur,
            &tcur_ida);
        IDAGetNonlinSolvStats(data->sun_mem, &nniters, &nncfails);
        IDAGetNumJacEvals(data->sun_mem, &njevals);
        IDA_data_file << tres << " " << nsteps << " " << netfails << " "
            << nncfails << " " << hcur << " " << nrevals << " "
            << nniters << " " << njevals << "\n\n\n";
    }
    double tstart = omp_get_wtime();
#pragma omp parallel num_threads(num_threads_global) 
    {
        for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            Y_inter[k_spec] = Cell_Properties_inter.Y[k_spec];
        }
        //if (omp_get_thread_num() == 0) {
        //    cout << "threads = " << omp_get_num_threads() << "\n";
        //}
#pragma omp for schedule(dynamic)
        for (int i = 1; i < Nx - 1; i++) {
            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                Yiprev[k_spec] = Cell_Properties_vector[i - 1].Y[k_spec];
                Yi[k_spec] = Cell_Properties_vector[i].Y[k_spec];
                Yinext[k_spec] = Cell_Properties_vector[i + 1].Y[k_spec];
            }

            double T_prev = Cell_Properties_vector[i - 1].T;
            double T_curr = Cell_Properties_vector[i].T;
            double T_next = Cell_Properties_vector[i + 1].T;

            double u_prev = Cell_Properties_vector[i - 1].u;
            double u_curr = Cell_Properties_vector[i].u;
            double u_next = Cell_Properties_vector[i + 1].u;

            double vel_prev = Cell_Properties_vector[i - 1].vel;
            double vel_curr = Cell_Properties_vector[i].vel;
            double vel_next = Cell_Properties_vector[i + 1].vel;

            double rho_prev = Cell_Properties_vector[i - 1].rho;
            double rho_curr = Cell_Properties_vector[i].rho;
            double rho_next = Cell_Properties_vector[i + 1].rho;


            double vel_interf_curr = Cell_Properties_vector[i].vel;


            if (i > preinter)
            {
                Get_molar_cons(Xi, Yi, T_curr);
                if (t_curr > chem_time) {
                    chem_vel(Sn, Hn, forward_arr, reverse_arr, equilib_arr,
                        T_curr, Xi, ydot, i);
                }
                else {
                    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                        ydot[k_spec] = 0;
                    }

                }
            }


            Get_mole_fr(Xiprev, Yiprev); Get_mole_fr(Xi, Yi); Get_mole_fr(Xinext, Yinext);
            Get_mole_fr(Xi_2, Cell_Properties_vector[preinter + 2].Y.data()); Get_mole_fr(Xi_3, Cell_Properties_vector[preinter + 3].Y.data()); Get_mole_fr(X_inter, Y_inter);

            if (i < preinter) {
                set_fuel_rval(T_prev, T_curr, T_next,
                    u_prev, u_curr, u_next,
                    vel_prev, vel_curr, vel_next,
                    rho_prev, rho_curr, rho_next,
                    rval, yval, ypval, i);
            }

            if (i == preinter) {
                double T_inter_2l = Cell_Properties_vector[preinter - 1].T;
                double T_inter_3l = Cell_Properties_vector[preinter - 2].T;


                set_interface_l_rval(T_prev, T_curr, T_next,
                    u_prev, u_curr, u_next,
                    vel_prev, vel_curr, vel_next,
                    rho_prev, rho_curr, rho_next,
                    T_inter_3l, T_inter_2l, T_inter,
                    rval, yval, ypval, vel_inter, rho_inter, i);
            }

            if (i == preinter + 1) {
                double T_inter_2l = Cell_Properties_vector[preinter - 1].T;
                double T_inter_3l = Cell_Properties_vector[preinter - 2].T;
                double T_inter_2r = Cell_Properties_vector[preinter + 2].T;
                double T_inter_3r = Cell_Properties_vector[preinter + 3].T;
                double u_inter_2r = Cell_Properties_vector[preinter + 2].u;
                double u_inter_3r = Cell_Properties_vector[preinter + 3].u;
                double rho_inter_2r = Cell_Properties_vector[preinter + 2].rho;
                double rho_inter_3r = Cell_Properties_vector[preinter + 3].rho;

                set_interface_rval(T_prev, T_curr, T_next,
                    u_prev, u_curr, u_next,
                    vel_prev, vel_curr, vel_next,
                    rho_prev, rho_curr, rho_next,
                    T_inter_3l, T_inter_2l, T_inter, T_inter_2r, T_inter_3r,
                    rval, yval, ypval, p_inter, vel_inter, rho_inter, u_inter, i);



                set_interface_r_rval(T_prev, T_curr, T_next,
                    u_prev, u_curr, u_next,
                    vel_prev, vel_curr, vel_next,
                    rho_prev, rho_curr, rho_next,
                    T_inter_3l, T_inter_2l, T_inter, T_inter_2r, T_inter_3r,
                    rho_inter, rho_inter_2r, rho_inter_3r,
                    rval, yval, ypval, vel_inter, i);
            }


            if (i > preinter + 1) {
                {
                    set_rval_gas(T_prev, T_curr, T_next,
                        u_prev, u_curr, u_next,
                        vel_prev, vel_curr, vel_next,
                        rho_prev, rho_curr, rho_next,
                        rval, yval, ypval, vel_inter, i);
                }
            }
        }
    }
    double tfinish = omp_get_wtime();
    double total = tfinish - tstart;

    vizov++;
    MakePropertiesvectors(Cell_prouds_vector, Cell_prouds_inter, ypval, Nx);
    MakePropertiesvectors(Cell_rval_vector, Cell_rval_inter, rval, Nx);
    return 0;
}



double F_right_rho(
    double rho_l, double rho, double rho_r, double r_l, double r, double r_r,
    double u_l, double u, double u_r,
    int number_cell) {
    //double r_next = (r + r_r) / 2.;
    //double r_prev = (r + r_l) / 2.;

    double r_next = r;
    double r_prev = r_l;
    //return - 2 / (r_r - r_l) / pow(r, 2) * (pow(0.5 * (r_r + r), 2.) * (rho_r * u_r + rho * u) / 2. - pow(0.5 * (r + r_l), 2.) * (rho * u + rho_l * u_l) / 2.);
    return -1. / (r_next - r_prev) / pow(r, 2.) * (pow(r_next, 2.) * rho * u - pow(r_prev, 2.) * rho_l * u_l);
}
double F_right_rho_1(
    double rho_l, double rho, double rho_r, double r_l, double r, double r_r,
    double u_l, double u, double u_r,
    int number_cell) {
    //return - 2 / (r_r - r_l) / pow(r, 2) * (pow(0.5 * (r_r + r), 2.) * (rho_r * u_r + rho * u) / 2. - pow(0.5 * (r + r_l), 2.) * (rho * u + rho_l * u_l) / 2.);
    return -1. / (r - r_l) / pow(r, 2.) * (pow(r, 2.) * rho * u - pow(r_l, 2.) * rho_l * u_l);
}

double F_right_rho_inter_r(
    double rho_inter, double rho, double rho_inter_2r, double rho_inter_3r,
    double u_inter, double u, double u_inter_2r, double u_inter_3r, double r_l, double r, double r_r, double p) {
    double h = r_r - r;
    double r_inter = x_vect[preinter] + (p_inter - 1) * h;
    double rho_r = get_rho(Yinext, Cell_Properties_vector[preinter + 2].T, 'g');
    double u_r = Cell_Properties_vector[preinter + 2].u;
    //double r_next = (r + r_r) / 2.;
    double r_next = r;

    return -1. / (r_next - r_inter) / pow(r, 2) * (pow(r_next, 2.) * rho * u - pow(r_inter, 2) * rho_inter * u_inter);
}

void set_fuel_rval(double T_prev, double T_curr, double T_next,
    double u_prev, double u_curr, double u_next,
    double vel_prev, double vel_curr, double vel_next,
    double rho_prev, double rho_curr, double rho_next,
    double* rval, double* yval, double* ypval, int i) {

    double h = x_vect[preinter] - x_vect[preinter - 1];
    r_inter = x_vect[preinter] + (p_inter - 1) * h;

    double rho = get_rho(Yi, T_curr, 'd');
    double rho_l = get_rho(Yiprev, T_prev, 'd');
    double rho_r = get_rho(Yinext, T_next, 'd');
    double Cp = get_Cp(num_gas_species, Yi, T_curr, 'd');
    int my_i_temp;
    my_i_temp = (i - 1) * count_var_in_cell;
    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        rval[my_i_temp] = Yi[k_spec] - Yinext[k_spec];
        my_i_temp++;
    }
    rval[my_i_temp] = ypval[my_i_temp] - F_right_T_d(
        T_prev, T_curr, T_next,
        x_vect[i - 1], x_vect[i], x_vect[i + 1],
        u_prev, u_curr, u_next, i) / rho / Cp;
    my_i_temp++;

    rval[my_i_temp] = u_curr - u_next;
    my_i_temp++;

    rval[my_i_temp] = vel_curr - vel_next;
    my_i_temp++;

    rval[my_i_temp] = rho_curr - rho_next;
    my_i_temp++;
}


void set_interface_l_rval(double T_prev, double T_curr, double T_next,
    double u_prev, double u_curr, double u_next,
    double vel_prev, double vel_curr, double vel_next,
    double rho_prev, double rho_curr, double rho_next,
    double T_inter_3l, double T_inter_2l, double T_inter,
    double* rval, double* yval, double* ypval, double vel_inter, double rho_inter, int i) {

    double h = x_vect[preinter] - x_vect[preinter - 1];
    r_inter = x_vect[preinter] + (p_inter - 1) * h;
    int my_i_temp;
    my_i_temp = (i - 1) * count_var_in_cell;
    double rho = get_rho(Yi, T_curr, 'd');
    double rho_l = get_rho(Yiprev, T_prev, 'd');
    double rho_r = get_rho(Yinext, T_next, 'd');

    double Cp = get_Cp(num_gas_species, Yi, T_curr, 'd');
    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        rval[my_i_temp] = Yi[k_spec] - Y_inter[k_spec];
        my_i_temp++;
    }
    rval[my_i_temp] = ypval[my_i_temp] - F_right_T_interfase_l(X_inter,
        T_inter_3l, T_inter_2l,
        T_curr, T_inter, x_vect[i - 1], x_vect[i], r_inter, h, p_inter) / rho / Cp;
    my_i_temp++;

    rval[my_i_temp] = u_curr - u_inter;
    my_i_temp++;

    rval[my_i_temp] = vel_curr - vel_inter;
    my_i_temp++;

    rval[my_i_temp] = rho_curr - rho_inter;
    my_i_temp++;
}

void set_interface_rval(double T_prev, double T_curr, double T_next,
    double u_prev, double u_curr, double u_next,
    double vel_prev, double vel_curr, double vel_next,
    double rho_prev, double rho_curr, double rho_next,
    double T_inter_3l, double T_inter_2l, double T_inter, double T_inter_2r, double T_inter_3r,
    double* rval, double* yval, double* ypval, double p, double vel_inter, double rho_inter, double u_inter, int i) {

    double h = x_vect[preinter] - x_vect[preinter - 1];
    r_inter = x_vect[preinter] + (p_inter - 1.) * h;
    //cout << "INTERFACE!" << endl;
    double Cp = get_Cp(num_gas_species, Y_inter, T_inter, 'g');
    int my_i_temp;
    my_i_temp = (i - 1) * count_var_in_cell;
    get_grad_interpolate(gradX, Xi, Xi_2, Xi_3, x_vect[i] - x_vect[i - 1], p_inter);
    set_Dij_res(T_inter);//Cделать Dij thread_local
    double Vc = 0;
    for (int k = 0; k < num_gas_species; k++) {
        YkVk[k] = YkVk_func(k, T_inter, Y_inter, gradX, X_inter, Y_inter);
        Vc -= YkVk[k];
    }
    double Pf_ = Pf(T_inter, r_inter);
    double mol_w = my_mol_weight(komponents[Fuel]);
    double W = get_W(Y_inter);

    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        Vk_inter[k_spec] = (YkVk[k_spec] + Y_inter[k_spec] * Vc);
        rval[my_i_temp] = F_rightY_interface(k_spec, Vc,
            T_inter,
            x_vect[i - 1], x_vect[i], u_inter, vel_inter, p_inter, i);
        //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
        my_i_temp++;
    }
    rval[my_i_temp] = F_right_T_interfase(X_inter, T_inter_3l, T_inter_2l, T_inter, T_inter_2r,
        T_inter_3r, vel_inter, r_inter, h, p_inter);
    //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
    my_i_temp++;

    double sum = 0.;
    double Dfm = 0;
    for (int j = 0; j < num_gas_species; j++) {
        if (j != komponents[Fuel]) {
            sum += X_inter[j]
                / Dij_res[komponents[Fuel]][j];
        }
    }
    if (sum != 0) {
        Dfm = (1. - Y_inter[komponents[Fuel]]) / sum;
    }
    else {
        Dfm = 0;
    }

    rval[my_i_temp] = F_right_rho_interface(rho_inter, vel_inter, u_inter, T_inter);
    //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
    my_i_temp++;

    rval[my_i_temp] = F_right_u_inter(Vc, komponents[Fuel],
        T_inter, x_vect[i - 1], x_vect[i], u_inter, vel_inter, p_inter, i);
    //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
    my_i_temp++;

    rval[my_i_temp] = rho_inter - get_rho(Y_inter, T_inter, 'g');
    //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
    //cout << endl << endl << endl;
    my_i_temp++;
}


double F_right_rho_interface(double rhog, double vel, double u_inter, double T_inter) {
    double rhod = get_rho(Y_inter, T_inter, 'd');
    double Vd = 0;
    return rhod * (-vel) - rhog * (u_inter - vel);
}

void set_interface_r_rval(double T_prev, double T_curr, double T_next,
    double u_prev, double u_curr, double u_next,
    double vel_prev, double vel_curr, double vel_next,
    double rho_prev, double rho_curr, double rho_next,
    double T_inter_3l, double T_inter_2l, double T_inter, double T_inter_2r, double T_inter_3r,
    double rho_inter, double rho_inter_2r, double rho_inter_3r,
    double* rval, double* yval, double* ypval, double vel_inter, int i) {
    double h = x_vect[preinter] - x_vect[preinter - 1];
    r_inter = x_vect[preinter] + (p_inter - 1) * h;
    int my_i_temp = i * (count_var_in_cell);
    // cout << i << " i " << endl;
    find_diff_slag_interface(x_vect[i - 1], x_vect[i], T_inter, T_inter, Yi, Yinext, Xi, Xinext, YkVk_l, Y_tmp_l, X_tmp_l, gradX_l, rho_l_diff, Vc_l, p_inter);
    find_diff_slag(T_curr, T_next, Yi, Yinext, Xi, Xinext, YkVk_r, Y_tmp_r, X_tmp_r, gradX_r, rho_r_diff, Vc_r, i, 'r');
    double dWdt = 0;

    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {

        Vk_vect[i][k_spec] = (YkVk_r[k_spec] + Y_tmp_r[k_spec] * Vc_r);
        ydot_vect[i][k_spec] = ydot[k_spec];
        double dYdt = F_rightY_interface_r(k_spec,
            T_prev, T_curr, T_next,
            r_inter, x_vect[i], x_vect[i + 1],
            u_prev, u_curr, u_next, i) / rho_curr;
        rval[my_i_temp] = ypval[my_i_temp] - dYdt;
        if (t_curr < chem_time) {
            if (initital_components.find(komponents_str[k_spec]) == initital_components.end()) {
                rval[my_i_temp] = ypval[my_i_temp] + pow(10, 10) * Yi[k_spec];
            }
        }
        //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
        dWdt += ypval[my_i_temp] / my_mol_weight(k_spec);
        my_i_temp++;
    }
    double W = 0;
    W = get_W(Cell_Properties_vector[preinter + 1].Y.data());
    dWdt *= -pow(W, 2);
    dWdt_vect[i] = dWdt;
    double Cp = get_Cp(num_gas_species, Yi, T_curr, 'g');
    double dTdt = F_right_T_interfase_r(X_inter,
        T_inter, T_curr, T_inter_2r, T_inter_3r,
        u_curr, r_inter, x_vect[i], x_vect[i + 1],
        h, p_inter) / rho_curr / Cp;
    dTdt_vect[i] = dTdt;

    double drhodt = -P * W / R / pow(T_curr, 2) * dTdt + P / R / T_curr * dWdt;
    drhodt_vect[i] = drhodt;
    rval[my_i_temp] = ypval[my_i_temp] - dTdt;
    //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
    my_i_temp++;


    rval[my_i_temp] = drhodt - F_right_rho_inter_r(rho_inter, rho_curr, rho_inter_2r, rho_inter_3r,
        u_inter, u_curr, u_inter_2r, u_inter_3r, x_vect[i - 1], x_vect[i], x_vect[i + 1], p_inter);
    //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
    my_i_temp++;

    rval[my_i_temp] = vel_curr - vel_inter;
    //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
    my_i_temp++;

    rval[my_i_temp] = rho_curr - get_rho(Yi, T_curr, 'g');
    //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
    //cout << endl << endl<< endl;
    my_i_temp++;
}

void set_rval_gas(double T_prev, double T_curr, double T_next,
    double u_prev, double u_curr, double u_next,
    double vel_prev, double vel_curr, double vel_next,
    double rho_prev, double rho_curr, double rho_next,
    double* rval, double* yval, double* ypval, double vel_inter, int i) {

    find_diff_slag(T_curr, T_next, Yi, Yinext, Xi, Xinext, YkVk_r, Y_tmp_r, X_tmp_r, gradX_r, rho_r_diff, Vc_r, i, 'r');

    find_diff_slag(T_prev, T_curr, Yiprev, Yi, Xiprev, Xi, YkVk_l, Y_tmp_l, X_tmp_l, gradX_l, rho_l_diff, Vc_l, i - 1, 'l');
    {
        //cout << "i = " << i << endl;
        double rho = get_rho(Yi, T_curr, 'g');
        double rho_l = get_rho(Yiprev, T_prev, 'g');
        double rho_r = get_rho(Yinext, T_next, 'g');
        double Cp = get_Cp(num_gas_species, Yi, T_curr, 'g');
        double dWdt = 0;
        int my_i_temp = (i)*count_var_in_cell;

        for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            Vk_vect[i][k_spec] = (YkVk_r[k_spec] + Y_tmp_r[k_spec] * Vc_r);
            ydot_vect[i][k_spec] = ydot[k_spec];
            double dYdt = F_rightY(k_spec,
                T_prev, T_curr, T_next,
                x_vect[i - 1], x_vect[i], x_vect[i + 1],
                u_prev, u_curr, u_next, i) / rho;

            rval[my_i_temp] = ypval[my_i_temp] - dYdt;
            if (t_curr < chem_time) {
                if (initital_components.find(komponents_str[k_spec]) == initital_components.end()) {
                    rval[my_i_temp] = ypval[my_i_temp] + pow(10, 10) * Yi[k_spec];
                }
            }
            // cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
            dWdt += ypval[my_i_temp] / my_mol_weight(k_spec);
            my_i_temp++;
        }
        double W = 0;


        W = get_W(Yi);
        dWdt *= -pow(W, 2);
        //dWdt_vect[i] = dWdt;
        double dTdt = F_right_T_g(
            T_prev, T_curr, T_next,
            x_vect[i - 1], x_vect[i], x_vect[i + 1],
            u_prev, u_curr, u_next, i) / rho / Cp;

        rval[my_i_temp] = ypval[my_i_temp] - dTdt;
        //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
        double drhodt = -P * W / R / pow(T_curr, 2) * dTdt + P / R / T_curr * dWdt;
        //drhodt_vect[i] = drhodt;
        my_i_temp++;
        //dTdt_vect[i] = dTdt;
        rval[my_i_temp] = drhodt - F_right_rho(rho_prev, rho_curr, rho_next, x_vect[i - 1], x_vect[i], x_vect[i + 1],
            u_prev, u_curr, u_next, i);
        //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
        my_i_temp++;

        rval[my_i_temp] = vel_curr - vel_prev;
        //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
        my_i_temp++;

        rval[my_i_temp] = rho_curr - get_rho(Yi, T_curr, 'g');
        //cout << rval[my_i_temp] << " i_temp " << my_i_temp << endl;
       // cout << endl << endl << endl;
        my_i_temp++;
    }
}

void set_p(double tres, double dt, double step, double V, double h) {
    i_ida++;
    double V_prev = vel_prev / h;
    if (abs(V) / 100.0 < abs(V_prev) || abs(V) / 100.0 > abs(V_prev)) {
        if (p_inter + dt * V > 1.9999 && dt < 0)
            p_inter += 0;
        else
            p_inter += dt * V;

        if (p_inter + V * dt < 1.00001) {
            p_inter = 1.99999;
            preinter--;
        }
        vel_prev = V * h;
    }

    //p_inter = 1.5;
    //double drdt = Cell_Properties_inter.vel;
    //double dr = drdt * dt;
    //double r_inter = (x_vect[preinter] + (p_inter - 1.) * h) + dr;
    //double h_new = r_inter / (preinter + 1.);
    //r_inter = (x_vect[preinter] + (p_inter - 1.) * h_new) + dr;
    //h_new = r_inter / (preinter + 1.);
    //for (int i = 0; i < Nx; i++) {
    //    if (i <= 1 * preinter) {
    //        x_vect[i] = h_new * (i + 1. / 2.);
    //    }
    //    else if (i != Nx - 1) {
    //        //x_vect[i] = x_vect[i] + dr;
    //        x_vect[i] = x_vect[i] + 1.0 * dr;
    //    }

    //}
    // p_inter = 1.5;
}

double F_right_u(
    double Tprev, double T, double Tnext, double xprev, double x, double xnext,
    double uprev, double u, double unext,
    int number_cell) {
    double h_left = x - xprev;
    double h = xnext - x;

    double rho_r = get_rho(Yinext, Tnext, 'g');
    double rho = get_rho(Yi, T, 'g');
    double rho_l = get_rho(Yiprev, Tprev, 'g');

    double du_dr = (u - uprev) / (x - xprev);
    return -u * du_dr;

}
double F_right_u_inter_r(
    double Tprev, double T, double Tnext,
    double u_inter, double u, double u_inter_2r, double u_inter_3r, double h, double p) {
    double dudr = (2 * p - 7) / ((p - 3) * (p - 4) * h) * u_inter
        + (p - 4) / ((p - 3) * h) * u_inter_2r + (p - 3) / ((4 - p) * h) * u_inter_3r;
    return -u * dudr;

}

void set_Dij_res(double T) {
    for (unsigned short int i = 0; i < num_gas_species; ++i) {
        for (unsigned short int j = i; j < num_gas_species; ++j) {
            Dij_res[i][j] = Dij_func5(i, j, T);
            Dij_res[j][i] = Dij_res[i][j];
        }
    }
}

double get_dotM(double Ys, double Tval, double ri, double rhog, double Dfm) {
    double By, Sh;
    By = (Ys) / (1 - Ys);
    return   rhog * ri * Dfm * log(1 + By);
}


int KinSetIc(int NEQ)
{
    SUNContext sunctx;
    realtype fnormtol, scsteptol;
    N_Vector res_vect, s, c;
    int glstr, mset, retval;
    void* kmem;
    SUNMatrix J;
    SUNLinearSolver LS;
    realtype* yval, * cval, * sval;
    UserData data;
    data = (UserData)malloc(sizeof * data);
    res_vect = NULL;
    s = c = NULL;
    kmem = NULL;
    J = NULL;
    LS = NULL;
    /* Create the SUNDIALS context that all SUNDIALS objects require */
    retval = SUNContext_Create(NULL, &sunctx);
    if (check_retval(&retval, "SUNContext_Create", 1)) return(1);

    res_vect = N_VNew_OpenMP(NEQ, num_threads_global, sunctx);
    if (check_retval((void*)res_vect, "N_VNew_Serial", 0)) return(1);

    s = N_VNew_OpenMP(NEQ, num_threads_global, sunctx);
    if (check_retval((void*)s, "N_VNew_Serial", 0)) return(1);

    c = N_VNew_OpenMP(NEQ, num_threads_global, sunctx);
    if (check_retval((void*)c, "N_VNew_Serial", 0)) return(1);

    N_VConst(ONE, s); /* no scaling */

    yval = NV_DATA_OMP(res_vect);
    cval = NV_DATA_OMP(c);
    sval = NV_DATA_OMP(s);

    yval[0] = Cell_Properties_inter.T;
    cval[0] = 1.0;
    sval[0] = pow(10, -5);

    yval[1] = Cell_Properties_inter.u;
    cval[1] = 0.0;
    sval[1] = pow(10, -5);

    yval[2] = Cell_Properties_inter.vel;
    cval[2] = 0.0;
    sval[2] = pow(10, -5);
    int vel_start = 3;
    for (int i_yval = vel_start; i_yval < NEQ; i_yval++) {
        yval[i_yval] = 0;
        cval[i_yval] = 0.0;
        sval[i_yval] = pow(10, -2);
    }
    fnormtol = FTOL * pow(10, -3); scsteptol = STOL * pow(10, -10);

    data->NEQ = NEQ;
    kmem = KINCreate(sunctx);
    if (check_retval((void*)kmem, "KINCreate", 0)) return(1);

    retval = KINSetUserData(kmem, data);
    if (check_retval(&retval, "KINSetUserData", 1)) return(1);
    retval = KINSetConstraints(kmem, c);
    if (check_retval(&retval, "KINSetConstraints", 1)) return(1);
    retval = KINSetFuncNormTol(kmem, fnormtol);
    if (check_retval(&retval, "KINSetFuncNormTol", 1)) return(1);
    retval = KINSetScaledStepTol(kmem, scsteptol);
    if (check_retval(&retval, "KINSetScaledStepTol", 1)) return(1);
    KINSetNumMaxIters(kmem, 1000);
    retval = KINInit(kmem, func_kinsol, res_vect);
    if (check_retval(&retval, "KINInit", 1)) return(1);

    J = SUNDenseMatrix(NEQ, NEQ, sunctx);
    if (check_retval((void*)J, "SUNBandMatrix", 0)) return(1);

    /* Create banded SUNLinearSolver object */
    LS = SUNLinSol_Dense(res_vect, J, sunctx);
    if (check_retval((void*)LS, "SUNLinSol_Band", 0)) return(1);


    /* Attach the matrix and linear solver to KINSOL */
    retval = KINSetLinearSolver(kmem, LS, J);
    if (check_retval(&retval, "KINSetLinearSolver", 1)) return(1);
    data->sun_mem = kmem;
    glstr = 0;
    mset = 100000;
    KINSetNumMaxIters(kmem, mset);
    double tstart = omp_get_wtime();
    retval = KINSol(kmem, res_vect, glstr, s, s);
    double tfinish = omp_get_wtime();
    double total = tfinish - tstart;
    //cout << "total = " << total << "\n";
    if (check_retval(&retval, "KINSol", 1)) return(1);
    /* Free memory */
    data->sun_mem = NULL;
    retval = KINPrintAllStats(kmem, stdout, SUN_OUTPUTFORMAT_TABLE);

    // Вывод статистики KinSol в лог
    FILE* log_file = fopen("calculation.log", "a");
    retval = KINPrintAllStats(kmem, log_file, SUN_OUTPUTFORMAT_TABLE);
    fclose(log_file);

    Cell_Properties_inter.T = yval[0];

    Cell_Properties_inter.u = yval[1];

    Cell_Properties_inter.vel = yval[2];

    Cell_Properties_inter.rho = get_rho(Cell_Properties_inter.Y.data(), Cell_Properties_inter.T, 'g');

    /* cout << "T = " << Cell_Properties_inter.T << "\n";
     cout << "u = " << Cell_Properties_inter.u << "\n";
     cout << "vel = " << Cell_Properties_inter.vel << "\n";
     cout << "Yf = " << Cell_Properties_inter.Y[komponents[Fuel]] << "\n";
     cout << "Pf = " << Pf(Cell_Properties_inter.T, r_inter) << "\n";
     cout << "Mu = " << get_W(Cell_Properties_inter.Y.data()) << "\n";*/
    int i_u = 3;
    //for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
    //    if (k_spec != komponents[Fuel]) {
    //        cout << "Y = " << Cell_Properties_inter.Y[k_spec] << std::endl;
    //    }
    //}

    for (int i = 0; i < Nx - 1; i++) {
        if (i <= preinter) {
            Cell_Properties_vector[i].rho = Cell_Properties_inter.rho;
            Cell_Properties_vector[i].u = Cell_Properties_inter.u;
            Cell_Properties_vector[i].vel = Cell_Properties_inter.vel;
        }
        else {
            Cell_Properties_vector[i].u = yval[i_u];
            Cell_Properties_vector[i].vel = Cell_Properties_inter.vel;
            i_u++;
        }
    }
    Cell_Properties_vector[Nx - 1].u = Cell_Properties_vector[Nx - 2].u;
    Cell_Properties_vector[Nx - 1].vel = Cell_Properties_vector[Nx - 2].vel;
    Cell_Properties_inter.rho = get_rho(Cell_Properties_inter.Y.data(), Cell_Properties_inter.T, 'g');

    for (int i = 0; i < Nx; i++)
    {
        if (i <= preinter) {
            for (int k = 0; k < num_gas_species; k++) {
                Cell_Properties_vector[i].Y[k] = Cell_Properties_inter.Y[k];
                //Y_vect[k + i * num_gas_species] = Ystart[k] + (Yend[k] - Ystart[k]) / (x_finish - x_start) * (x_vect[i] - x_start);
            }
            Cell_Properties_vector[i].u = Cell_Properties_inter.u;
            Cell_Properties_vector[i].rho = Cell_Properties_inter.rho;
        }
        Cell_Properties_vector[i].vel = Cell_Properties_inter.vel;

    }
    N_VDestroy_OpenMP(res_vect);
    N_VDestroy_OpenMP(s);
    N_VDestroy_OpenMP(c);
    KINFree(&kmem);
    SUNLinSolFree(LS);
    SUNMatDestroy(J);
    free(data);
    SUNContext_Free(&sunctx);
    return 0;
}

static int func_kinsol(N_Vector u, N_Vector f, void* user_data)
{
    realtype* yval, * ypval, * rval;
    UserData data;
    data = (UserData)user_data;
    yval = NV_DATA_OMP(u);
    rval = NV_DATA_OMP(f);
    double T_inter_2l = Cell_Properties_vector[preinter - 1].T;
    double T_inter_3l = Cell_Properties_vector[preinter - 2].T;
    double T_inter_r = Cell_Properties_vector[preinter + 1].T;
    double T_inter_2r = Cell_Properties_vector[preinter + 2].T;
    double T_inter_3r = Cell_Properties_vector[preinter + 3].T;
    double u_inter_2r = Cell_Properties_vector[preinter + 2].u;
    double u_inter_3r = Cell_Properties_vector[preinter + 3].u;
    double rho_inter_2r = Cell_Properties_vector[preinter + 2].rho;
    double rho_inter_3r = Cell_Properties_vector[preinter + 3].rho;
    double T_inter = yval[0];
    double u_inter = yval[1];
    double vel_inter = yval[2];
    double mol_w = my_mol_weight(komponents[Fuel]);
    int i_u_start = 3;
    int i = preinter + 1;
    double W = get_W(Cell_Properties_inter.Y.data());

    double h = x_vect[preinter] - x_vect[preinter - 1];
    double rho_inter = get_rho(Cell_Properties_inter.Y.data(), T_inter, 'g');

    r_inter = x_vect[preinter] + (p_inter - 1) * h;
    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        Y_inter[k_spec] = Cell_Properties_inter.Y[k_spec];
    }
    double V = vel_inter / h;
    double Cp = get_Cp(num_gas_species, Y_inter, T_inter, 'g');

    //for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
    //    ydot[k_spec] = 0;
    //}
    Get_molar_cons(Xi, Cell_Properties_vector[i].Y.data(), Cell_Properties_vector[i].T);
    chem_vel(Sn, Hn, forward_arr, reverse_arr, equilib_arr,
        Cell_Properties_vector[i].T, Xi, ydot, i);
    Get_mole_fr(Xiprev, Cell_Properties_vector[i - 1].Y.data()); Get_mole_fr(Xi, Cell_Properties_vector[i].Y.data()); Get_mole_fr(Xinext, Cell_Properties_vector[i + 1].Y.data());
    Get_mole_fr(Xi_2, Cell_Properties_vector[preinter + 2].Y.data()); Get_mole_fr(Xi_3, Cell_Properties_vector[preinter + 3].Y.data()); Get_mole_fr(X_inter, Cell_Properties_inter.Y.data());
    for (int l = preinter + 1; l < Nx - 1; l++) {
        Cell_Properties_vector[l].u = yval[i_u_start];
        Cell_Properties_vector[l].vel = Cell_Properties_inter.vel;
        i_u_start++;
    }
    get_grad_interpolate(gradX, X_inter, Xi_2, Xi_3, h, p_inter);
    set_Dij_res(T_inter);
    double Vc = 0;
    for (int k = 0; k < num_gas_species; k++) {
        YkVk[k] = YkVk_func(k, T_inter, Y_inter, gradX, X_inter, Y_inter);
        Vc -= YkVk[k];
    }
    i_u_start = 3;

    double u_inter_r = yval[i_u_start];
    u_inter_2r = yval[i_u_start + 1];


    double rho_inter_r = get_rho(Cell_Properties_vector[preinter + 1].Y.data(),
        Cell_Properties_vector[preinter + 1].T, 'g');
    double Cp_inter_r = get_Cp(num_gas_species, Cell_Properties_vector[preinter + 1].Y.data(),
        Cell_Properties_vector[preinter + 1].T, 'g');
    double r_inter = x_vect[preinter] + (p_inter - 1) * h;

    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        Yiprev[k_spec] = Cell_Properties_inter.Y[k_spec];
        Yi[k_spec] = Cell_Properties_vector[preinter + 1].Y[k_spec];
        Yinext[k_spec] = Cell_Properties_vector[preinter + 2].Y[k_spec];
    }
    double dTdt = F_right_T_interfase_r(X_inter, T_inter, T_inter_r, T_inter_2r,
        T_inter_3r, u_inter_r, r_inter, x_vect[preinter + 1], x_vect[preinter + 2], h, p_inter) / rho_inter_r / Cp_inter_r;

    double dWdt = 0;

    find_diff_slag_interface(x_vect[i - 1], x_vect[i], T_inter, T_inter, Y_inter, Y_inter, X_inter, X_inter, YkVk_l, Y_tmp_l, X_tmp_l, gradX_l, rho_l_diff, Vc_l, p_inter);
    find_diff_slag(T_inter_r, T_inter_2r, Yi, Yinext, Xi, Xinext, YkVk_r, Y_tmp_r, X_tmp_r, gradX_r, rho_r_diff, Vc_r, i, 'r');

    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
        dWdt += F_rightY_interface_r(k_spec, T_inter, T_inter_r, T_inter_2r,
            r_inter, x_vect[preinter + 1], x_vect[preinter + 2],
            u_inter, u_inter_r, u_inter_2r, preinter + 1) / my_mol_weight(k_spec);
        //dWdt += ydot[k_spec] *  my_mol_weight(k_spec);
    }
    W = get_W(Cell_Properties_vector[preinter + 1].Y.data());
    dWdt *= -pow(W, 2);

    double drhodt = -P * W / R / pow(T_inter_r, 2) * dTdt + P / R / T_inter_r * dWdt;

    rval[0] = F_right_T_interfase(X_inter, T_inter_3l, T_inter_2l, T_inter, T_inter_2r,
        T_inter_3r, vel_inter, r_inter, h, p_inter);
    //cout << "rval 0 = " << rval[0] << "\n";
    rval[1] = F_right_rho_interface(rho_inter, vel_inter, u_inter, T_inter);
    //cout << "rval 1 = " << rval[1] << "\n";
    rval[2] = F_right_u_inter(Vc, komponents[Fuel],
        T_inter, x_vect[i - 1], x_vect[i], u_inter, vel_inter, p_inter, i);
    //cout << "rval 2 = " << rval[2] << "\n";
    //cout << "\n\n\n";
    //drhodt = 0;
    //Cell_Properties_vector[preinter + 2].u = yval[i_u_start];
    rval[i_u_start] = drhodt - F_right_rho_inter_r(rho_inter, rho_inter_r, rho_inter_2r,
        rho_inter_3r, u_inter, u_inter_r, u_inter_2r, u_inter_3r, r_inter, x_vect[i], x_vect[i + 1], p_inter);
    int NEQ = data->NEQ;


    double i_start = i_u_start;
    double i_preinter_r = i;
#pragma omp parallel num_threads(num_threads_global)
    {
        for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            Y_inter[k_spec] = Cell_Properties_inter.Y[k_spec];
        }
#pragma omp for schedule(dynamic)
        for (int i_yval = i_u_start + 1; i_yval < NEQ; i_yval++) {

            int i = i_yval - i_u_start + i_preinter_r;

            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                Yiprev[k_spec] = Cell_Properties_vector[i - 1].Y[k_spec];
                Yi[k_spec] = Cell_Properties_vector[i].Y[k_spec];
                Yinext[k_spec] = Cell_Properties_vector[i + 1].Y[k_spec];
            }

            int thread_id = omp_get_thread_num();

            double T_prev = Cell_Properties_vector[i - 1].T;
            double T_curr = Cell_Properties_vector[i].T;
            double T_next = Cell_Properties_vector[i + 1].T;

            double u_prev = Cell_Properties_vector[i - 1].u;
            double u_curr = Cell_Properties_vector[i].u;
            double u_next = Cell_Properties_vector[i + 1].u;

            double vel_prev = Cell_Properties_vector[i - 1].vel;
            double vel_curr = Cell_Properties_vector[i].vel;
            double vel_next = Cell_Properties_vector[i + 1].vel;

            double rho_prev = Cell_Properties_vector[i - 1].rho;
            double rho_curr = Cell_Properties_vector[i].rho;
            double rho_next = Cell_Properties_vector[i + 1].rho;


            double vel_interf_curr = vel_inter;

            //cout << "in func i = " << i << "\n";
            //cout << "M = " << data->M << "\n\n";

            //Get_molar_cons(Xi, Cell_Properties_vector[i].Y.data(), Cell_Properties_vector[i].T);
            //for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            //    ydot[k_spec] = 0;
            //}
            Get_molar_cons(Xi, Yi, T_curr);
            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                ydot[k_spec] = 0;
            }
            Get_mole_fr(Xiprev, Cell_Properties_vector[i - 1].Y.data()); Get_mole_fr(Xi, Cell_Properties_vector[i].Y.data()); Get_mole_fr(Xinext, Cell_Properties_vector[i + 1].Y.data());
            Get_mole_fr(Xi_2, Cell_Properties_vector[preinter + 2].Y.data()); Get_mole_fr(Xi_3, Cell_Properties_vector[preinter + 3].Y.data()); Get_mole_fr(X_inter, Cell_Properties_inter.Y.data());

            find_diff_slag(T_curr, T_next, Yi, Yinext, Xi, Xinext, YkVk_r, Y_tmp_r, X_tmp_r, gradX_r, rho_r_diff, Vc_r, i, 'r');

            find_diff_slag(T_prev, T_curr, Yiprev, Yi, Xiprev, Xi, YkVk_l, Y_tmp_l, X_tmp_l, gradX_l, rho_l_diff, Vc_l, i - 1, 'l');

            double rho = get_rho(Yi, T_curr, 'g');
            double rho_l = get_rho(Yiprev, T_prev, 'g');
            double rho_r = get_rho(Yinext, T_next, 'g');
            double Cp = get_Cp(num_gas_species, Yi, T_curr, 'g');
            double dWdt = 0;

            for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
                double dYdt = F_rightY(k_spec,
                    T_prev, T_curr, T_next,
                    x_vect[i - 1], x_vect[i], x_vect[i + 1],
                    u_prev, u_curr, u_next, i) / rho_curr;
                //cout << "i_temp Y initial  = " << i_temp << " Y  = " << rho * ypval[i_temp] << "\n";
                //cout << "i_temp  Y initial = " << i_temp << " = " << rval[i_temp] << "\n";
              //  cout << "i_temp  Yp initial = " << i_temp << " = " << ypval[i_temp] << "\n";
                dWdt += dYdt / my_mol_weight(k_spec);
                //dWdt += ydot[k_spec] * my_mol_weight(k_spec);
            }
            double W = 0;
            Cp = get_Cp(num_gas_species, Yi, T_curr, 'g');
            double dTdt = F_right_T_g(
                T_prev, T_curr, T_next,
                x_vect[i - 1], x_vect[i], x_vect[i + 1],
                u_prev, u_curr, u_next, i) / rho_curr / Cp;

            W = get_W(Yi);
            dWdt *= -pow(W, 2);

            double drhodt = -P * W / R / pow(T_curr, 2) * dTdt + P / R / T_curr * dWdt;
            drhodt_vect[i] = drhodt;
            dWdt_vect[i] = P / R / T_curr * dWdt;
            dTdt_vect[i] = -P * W / R / pow(T_curr, 2) * dTdt;
            if (i_yval == NEQ - 1) {
                rval[i_yval] = drhodt - F_right_rho(Cell_Properties_vector[i - 1].rho, Cell_Properties_vector[i].rho, Cell_Properties_vector[i + 1].rho,
                    x_vect[i - 1], x_vect[i], x_vect[i + 1], yval[i_yval - 1], yval[i_yval], -yval[i_yval], i);
            }
            else {
                rval[i_yval] = drhodt - F_right_rho(Cell_Properties_vector[i - 1].rho, Cell_Properties_vector[i].rho, Cell_Properties_vector[i + 1].rho,
                    x_vect[i - 1], x_vect[i], x_vect[i + 1], yval[i_yval - 1], yval[i_yval], yval[i_yval + 1], i);
            }
        }
    }
    return 0;
}


void write_setka(string name, const vector<double>& x_vect, int N_x_local) {
    ofstream setka;
    setka.open(name);
    setka << "TITLE=\"" << "Graphics" << "\"" << endl;
    setka << R"(VARIABLES= "r, cm", "h, cm")";
    for (int i = 1; i < N_x_local; i++)
    {
        setka << x_vect[i] << " " << x_vect[i] - x_vect[i - 1] << "\n";
    }
    setka.close();
}

void write_params(string name, int Nx_local) {
    ofstream koeff_params;
    koeff_params.open(name);
    koeff_params << R"(VARIABLES= "T, K", "Ld", "Pf", "Lambda", "Cp", "rho", "Cp_hept_g", "Lambda_hept_g", "H_hept_g")";
    koeff_params << "TITLE=\"" << "Graphics" << "\"" << endl;
    for (int i = 1; i < Nx; i++)
    {
        double T_tmp = 200. + (700. - 200.) / (Nx_local - 1.) * i;
        koeff_params << T_tmp << " " << L_d(T_tmp) << " " << Pf(T_tmp, 0) << " " << Lambda_All(Ystart, T_tmp, 'd')
            << " " << get_Cp(num_gas_species, Ystart, T_tmp, 'd') << " "
            << get_rho(Ystart, T_tmp, 'd') << " "
            << get_Cp(num_gas_species, Ystart, T_tmp, 'g') / R << " "
            << Lambda_All(Ystart, T_tmp, 'g') << " " << get_Hi(komponents["NC7H16"], T_tmp) << "\n";

    }
    koeff_params.close();
}

bool contains_any(const std::string& str) {
    // Проверяем, содержится ли хотя бы одна из подстрок
    return str.find("r, cm") != std::string::npos ||
        str.find("T, K") != std::string::npos ||
        str.find("rho, g/cm3") != std::string::npos ||
        str.find("u, cm/s") != std::string::npos ||
        str.find("vel, cm/s") != std::string::npos;
}

void make_string_vector_read_file(string name_file, std::vector<std::string>& quoted_strings, int& num_gas_species_local, int& Nx_local) {
    std::ifstream inputFile(name_file);
    // Вектор для хранения подстрок в кавычках
    std::string line;
    num_gas_species_local = 0;
    Nx_local = 0;
    // Чтение файла построчно
    while (std::getline(inputFile, line)) {
        // Каждая строка будет храниться в переменной "line"
        //std::cout << line << std::endl;
        size_t start = 0;

        if (line.find("VARIABLES") != std::string::npos)
        {
            while ((start = line.find("\"", start)) != std::string::npos) {
                // Находим конец кавычек
                size_t end = line.find("\"", start + 1);
                if (end != std::string::npos) {
                    // Извлекаем подстроку между кавычками
                    string tmp_string = line.substr(start + 1, end - start - 1);

                    size_t pos = tmp_string.find(',');

                    if (contains_any(tmp_string)) {
                        // Извлекаем подстроку до запятой
                        std::string result = tmp_string.substr(0, pos);
                        quoted_strings.push_back(result);
                    }
                    else {
                        std::string to_remove = "Y_";
                        if (tmp_string.find(to_remove) != std::string::npos) {
                            //cout << "tmp_string = " << tmp_string << "\n";
                            num_gas_species_local++;
                            pos = 0;
                            if ((pos = tmp_string.find(to_remove, pos)) != std::string::npos) {
                                tmp_string.erase(pos, to_remove.length());  // Удаляем подстроку
                            }
                            quoted_strings.push_back(tmp_string);
                            // Двигаем указатель на следующий символ после второй кавычки
                        }
                    }


                }
                start = end + 1;
            }

            // Выводим все подстроки, найденные в кавычках
            //std::cout << "Substrings in quotes: " << std::endl;
            //for (const auto& str : quoted_strings) {
            //    //std::cout << str << std::endl;
            //}
        }
        if (std::isdigit(line[0]) || line[0] == '-' || line[0] == '+') {
            Nx_local++;
        }
    }
    Nx_local--;
    inputFile.close();
}

void set_size_vectors(int& Nx_local, int& num_gas_species_local) {
    x_vect.resize(Nx_local);
    drhodt_vect.resize(Nx_local);
    Vk_vect.resize(Nx_local);
    Vk_inter.resize(num_gas_species_local);
    ydot_vect.resize(Nx_local);
    Cell_Properties_vector.resize(Nx_local); Cell_prouds_vector.resize(Nx_local); Cell_rval_vector.resize(Nx_local);
    dTdt_vect.resize(Nx_local); dWdt_vect.resize(Nx_local);

    slag_chem_vect.resize(Nx_local);
    MdYdr_vect.resize(Nx_local);
    slag_diff_vect.resize(Nx_local);
    for (int i = 0; i < Nx_local; i++) {
        Cell_Properties_vector[i].Y.resize(num_gas_species_local);
        Cell_prouds_vector[i].Y.resize(num_gas_species_local);
        Cell_rval_vector[i].Y.resize(num_gas_species_local);
        Vk_vect[i].resize(num_gas_species_local);
        ydot_vect[i].resize(num_gas_species_local);

        slag_chem_vect[i].resize(num_gas_species_local);
        MdYdr_vect[i].resize(num_gas_species_local);
        slag_diff_vect[i].resize(num_gas_species_local);
    }
    Cell_Properties_inter.Y.resize(num_gas_species_local); Cell_prouds_inter.Y.resize(num_gas_species_local); Cell_rval_inter.Y.resize(num_gas_species_local);
}

void set_clear_vectors(int& Nx_local, int& num_gas_species_local) {
    x_vect.clear();
    drhodt_vect.clear();
    Vk_vect.clear();
    Vk_inter.clear();

    Cell_Properties_vector.clear(); Cell_prouds_vector.clear(); Cell_rval_vector.clear();
    dTdt_vect.clear(); dWdt_vect.clear();
    for (int i = 0; i < Nx_local; i++) {
        Cell_Properties_vector[i].Y.clear();
        Cell_prouds_vector[i].Y.clear();
        Cell_rval_vector[i].Y.clear();
        Vk_vect[i].clear();
    }
    Cell_Properties_inter.Y.clear(); Cell_prouds_inter.Y.clear(); Cell_rval_inter.Y.clear();
}

void set_cell_properties(std::vector<std::string>& quoted_strings, Cell_Properties& Cell_properties, double& x_vect_i, int position_num, double num) {
    if (quoted_strings[position_num] == "r") {
        x_vect_i = num;
    }
    if (quoted_strings[position_num] == "T") {
        Cell_properties.T = num;
    }
    if (quoted_strings[position_num] == "u") {
        Cell_properties.u = num;
    }
    if (quoted_strings[position_num] == "vel") {
        Cell_properties.vel = num;
    }
    if (quoted_strings[position_num] == "rho") {
        Cell_properties.rho = num;
    }
    else {
        int k_spec = komponents[quoted_strings[position_num]];
        Cell_properties.Y[k_spec] = num;
    }
}



void set_Cell_properties_full(string name_file, std::vector<std::string>& quoted_strings,
    vector<double>& x_vect_local, vector<Cell_Properties>& Cell_Properties_vector_local, Cell_Properties& Cell_Properties_inter_local) {
    std::ifstream inputFile(name_file);
    // Вектор для хранения подстрок в кавычках
    std::string line;
    int i_cell = 0;
    bool need_set_preinter = 1;
    while (std::getline(inputFile, line)) {
        if (std::isdigit(line[0]) || line[0] == '-' || line[0] == '+') {
            std::vector<double> numbers;

            // Создаем строковый поток из входной строки
            std::istringstream stream(line);
            double num;
            int position_num = 0;
            // Читаем числа из строки
            while (stream >> num) {

                if (position_num < quoted_strings.size()) {

                    set_cell_properties(quoted_strings, Cell_Properties_vector_local[i_cell], x_vect[i_cell], position_num, num);


                }

                position_num++;
            }
            if (i_cell != 0) {
                if (abs(Cell_Properties_vector_local[i_cell].u - Cell_Properties_vector_local[i_cell - 1].u) > pow(10, -10) && need_set_preinter) {
                    Cell_Properties_inter_local = Cell_Properties_vector_local[i_cell - 1];
                    r_inter = x_vect[i_cell - 1];
                    Cell_Properties_vector_local[i_cell - 1] = Cell_Properties_vector_local[i_cell];
                    x_vect[i_cell - 1] = x_vect[i_cell];
                    preinter = i_cell - 2;
                    i_cell--;
                    need_set_preinter = false;
                }
            }
            i_cell++;
        }

    }
    inputFile.close();
    double h = x_vect[preinter] - x_vect[preinter - 1];
    p_inter = 1. + (r_inter - x_vect[preinter]) / h;
}


void second_start(string name_folder) {
    string name_file_yval;
    string name_file_ypval;
    // Проверка, существует ли директория
    if (fs::exists(name_folder) && fs::is_directory(name_folder)) {

        // Перебор всех файлов и папок в директории
        for (const auto& entry : fs::directory_iterator(name_folder)) {
            //std::cout << entry.path() << "\n"; // Вывод пути к файлу/папке
            std::string name_file_tmp = entry.path().string();
            if (name_file_tmp.find("yval") != std::string::npos) {
                name_file_yval = name_file_tmp;
            }
            if (name_file_tmp.find("ypval") != std::string::npos) {
                name_file_ypval = name_file_tmp;
            }
        }
    }


    std::vector<std::string> quoted_strings;

    make_string_vector_read_file(name_file_yval, quoted_strings, num_gas_species, Nx);
    set_size_vectors(Nx, num_gas_species);

    // Чтение файла построчно
    set_Cell_properties_full(name_file_ypval, quoted_strings,
        x_vect, Cell_prouds_vector, Cell_prouds_inter);

    set_Cell_properties_full(name_file_yval, quoted_strings,
        x_vect, Cell_Properties_vector, Cell_Properties_inter);

    t_curr = read_tcurr(name_file_yval);
}


double read_tcurr(string input) {
    size_t pos;
#ifdef  WIN64
    pos = input.find_last_of("\\");
#else
    pos = input.find_last_of("/");
#endif //  WIN64

    if (pos != std::string::npos) {
        // Извлекаем подстроку, начиная с символа после "\\"
        std::string number_str = input.substr(pos + 1);

        // Находим позицию символа "_" после числа
        size_t underscore_pos = number_str.find("_");
        if (underscore_pos != std::string::npos) {
            // Извлекаем подстроку, которая представляет число
            number_str = number_str.substr(0, underscore_pos);
        }

        // Преобразуем строку в число (тип double)
        double number = std::stod(number_str);
        WriteLog("Restart time is " + to_string(number) + "\n");
        return number;
    }
}



void Make_Yval_From_Cell_Properties(vector<Cell_Properties>& my_Cell_Properties_vector,
    Cell_Properties& my_Cell_Properties_inter,
    double* Y, int myNx) {
    //cout << "i = " << i << "\n";
    for (int i = 1; i < myNx - 1; i++) {
        if (i < preinter + 1) {
            Y[(i)*count_var_in_cell - 4] = my_Cell_Properties_vector[i].T;
            Y[(i)*count_var_in_cell - 3] = my_Cell_Properties_vector[i].u;
            Y[(i)*count_var_in_cell - 2] = my_Cell_Properties_vector[i].vel;
            Y[(i)*count_var_in_cell - 1] = my_Cell_Properties_vector[i].rho;
        }
        else {
            Y[(i + 1) * count_var_in_cell - 4] = my_Cell_Properties_vector[i].T;
            Y[(i + 1) * count_var_in_cell - 3] = my_Cell_Properties_vector[i].u;
            Y[(i + 1) * count_var_in_cell - 2] = my_Cell_Properties_vector[i].vel;
            Y[(i + 1) * count_var_in_cell - 1] = my_Cell_Properties_vector[i].rho;
        }
    }


    Y[(preinter + 1) * count_var_in_cell - 4] = my_Cell_Properties_inter.T;
    Y[(preinter + 1) * count_var_in_cell - 3] = my_Cell_Properties_inter.u;
    Y[(preinter + 1) * count_var_in_cell - 2] = my_Cell_Properties_inter.vel;
    Y[(preinter + 1) * count_var_in_cell - 1] = my_Cell_Properties_inter.rho;
    Make_Yval_from_Cell_Properties_Y(my_Cell_Properties_vector, my_Cell_Properties_inter, Y, myNx);
}


void Make_Yval_from_Cell_Properties_Y(vector<Cell_Properties>& my_Cell_Properties_vector,
    Cell_Properties& my_Cell_Properties_inter, double* Y, int myNx) {
    //cout << "i = " << i << "\n";
    for (int i = 1; i < myNx - 1; i++) {
        for (int j = 0; j < num_gas_species; j++) {
            if (i < preinter + 1) {
                Y[j + (i - 1) * count_var_in_cell] = my_Cell_Properties_vector[i].Y[j];

            }
            else {
                Y[j + (i)*count_var_in_cell] = my_Cell_Properties_vector[i].Y[j];
            }
        }
    }
    for (int j = 0; j < num_gas_species; j++) {
        Y[j + (preinter)*count_var_in_cell] = my_Cell_Properties_inter.Y[j];
    }
}


void Write_to_file_slagY(string str) {
    double x_start, x_finish, D;
    double rho;
    ofstream fout;

    string path = "";
    fs::path cwd = fs::current_path();
    if (str.find("//") != string::npos) {
        path = str.substr(0, str.find_last_of("//") + 1);
    }
    if (!fs::exists(cwd.string() + "//" + path)) {
        fs::create_directory(path);
    }

    fout.open(str + ".dat");
    string title2 = R"(VARIABLES= "r, cm")";
    //for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
    //    title2.append(R"(, "Y_)" + komponents_str[k_spec] + R"(")");
    //}

    for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {

        title2.append(R"(, "slag_diff_)" + komponents_str[k_spec] + R"(")");
        title2.append(R"(, "slag_chem_)" + komponents_str[k_spec] + R"(")");
        title2.append(R"(, "MdYdr_)" + komponents_str[k_spec] + R"(")");
    }


    fout << "TITLE=\"" << "Graphics" << "\"" << endl;
    fout << title2 << endl;
    for (int i = 0; i < Nx; i++) {
        fout << x_vect[i];
        for (int k_spec = 0; k_spec < num_gas_species; k_spec++) {
            fout << " " << slag_diff_vect[i][k_spec];
            fout << " " << slag_chem_vect[i][k_spec];
            fout << " " << MdYdr_vect[i][k_spec];
        }
        fout << endl;

    }
    fout.close();
}

