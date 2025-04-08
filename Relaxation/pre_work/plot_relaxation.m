%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plot relaxation data for Fibrils and Beads eADF4C16                 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = readtable("relaxation_final.xlsx");

sample = data.Sample;

T2_dash = data.x13C_T2___ms_;
T2_dash_val = T2_dash(1:2);
err_T2_dash = T2_dash(3:4);

T1rho_1H = data.x1H_T1rho__ms_;
T1rho_1H_val = T1rho_1H(1:2);
err_T1rho_1H = T1rho_1H(3:4);

T1rho_13C = data.x13C_T1rho__ms_;
T1rho_13C_val = T1rho_13C(1:2);
err_T1rho_13C= T1rho_13C(3:4);

Delta_tot = data.Delta_tot_Hz_;
Delta_homo = data.Delta_homo_Hz_;
Delta_inhomo = data.Delta_inhomo_Hz_;

x = ["Fibrils" "Beads"];

figure(1); hold on;
bar([T2_dash_val;T1rho_1H_val;T1rho_13C_val]);






% er = errorbar(T2_dash(1),T2_dash(2));    
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';





