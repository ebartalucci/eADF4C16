%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plotting chemical shift distributions for secondary structure types%%%
%%% from: Probability-based protein secondary structure identification %%%
%%% using combined NMR chemical-shift data.                            %%%
%%% Using RBNMR function to load spectra on which to plot data         %%%
%%% Author: Ettore Bartalucci, Aachen, 28.05.2024                      %%%                                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Load spectrum
tobsy = rbnmr('D:\PhD\Publications\Spider_silks_eADF4(C16)\Codes\sec_struct_chem_shifts\2D_INEPT_TOBSY_Fibrils_1\pdata\1\2rr');
darr = rbnmr('D:\PhD\Publications\Spider_silks_eADF4(C16)\Codes\sec_struct_chem_shifts\2D_DARR_20ms_Fibrils_1\pdata\1\2rr');

% Axes
w1_spectrum1 = tobsy.XAxis;
w2_spectrum1 = tobsy.YAxis;

w1_spectrum2 = darr.XAxis;
w2_spectrum2 = darr.YAxis;

% Get 2D data
spectrum1 = tobsy.Data;
spectrum2 = darr.Data;

% read data from excel table: values from Wang, Jardetzky, 2002
chem_shift = readtable("average_chemical_shifts_values.xlsx");
aminoacid = chem_shift.Aminoacid;

%Glutammate values for protonated 'hx' and deprotonated 'x' species 13C / ppm
glutammate_ca_ha = 56;
glutammate_ca_a = 56.9;
glutammate_cb_ha = 28.5;
glutammate_cb_a = 30;
glutammate_cg_ha = 32.7;
glutammate_cg_a = 36.1;
glutammate_cd_ha = 179.7;
glutammate_cd_a = 183.8;
glutammate_co_ha = 176.5;
glutammate_co_a = 177;

%% Chemical shift statistics
% C alphas
c_alpha_strand = chem_shift.C_alpha_strand;
c_alpha_coil = chem_shift.C_alpha_coil;
c_alpha_helix = chem_shift.C_alpha_helix;

% C betas
c_beta_strand = chem_shift.C_beta_strand;
c_beta_coil = chem_shift.C_beta_coil;
c_beta_helix = chem_shift.C_beta_helix;

%% Standard Deviation
% C alphas std
std_c_alpha_strand = chem_shift.std_C_alpha_strand;
std_c_alpha_coil = chem_shift.std_C_alpha_coil;
std_c_alpha_helix = chem_shift.std_C_alpha_helix;

% C betas std
std_c_beta_strand = chem_shift.std_C_beta_strand;
std_c_beta_coil = chem_shift.std_C_beta_coil;
std_c_beta_helix = chem_shift.std_C_beta_helix;


%%
%%%%%%%%%%%%%%%%%%%%%%%  PLOT CHEMICAL SHIFTS STATS  %%%%%%%%%%%%%%%%%%%%%%
  
% Create one figure per secondary structure type and put all aminoacid
figure(1);clf;hold on;
title('Random coil shifts')
contour(w1_spectrum1, w2_spectrum1, spectrum1, 32);
set ( gca, 'xdir', 'reverse' ) 
set ( gca, 'ydir', 'reverse' ) 
axis square

xlim([10,75]) 
set ( gca, 'xdir', 'reverse' )
ylim([10,75])
set ( gca, 'ydir', 'reverse' ) 

% Diagonal line
diagx = linspace(10,75); 
diagy = linspace(10,75); 
plot(diagx,diagy, '--', 'Color', 'k');

% Plot statistics on one side of the diagonal
errorbar(c_alpha_coil, c_beta_coil, std_c_alpha_coil, 'horizontal','o','MarkerSize',6) 
errorbar(c_alpha_coil, c_beta_coil, std_c_beta_coil,'vertical','o','MarkerSize',6)

% Mirror statistics on the other side of the diagonal
errorbar(c_beta_coil, c_alpha_coil, std_c_beta_coil , 'horizontal','o','MarkerSize',6)
errorbar(c_beta_coil, c_alpha_coil, std_c_alpha_coil,'vertical','o','MarkerSize',6)

axis square 

hold off;
    

% Create one figure per secondary structure type and put all aminoacid
figure(2);clf;hold on;
title('Secondary structure shifts')
contour(w1_spectrum2, w2_spectrum2, spectrum2, 32);
set ( gca, 'xdir', 'reverse' ) 
set ( gca, 'ydir', 'reverse' ) 
axis square

xlim([10,75]) 
set ( gca, 'xdir', 'reverse' ) 
ylim([10,75]) 
set ( gca, 'ydir', 'reverse' ) 

% Diagonal line
diagx = linspace(10,75); 
diagy = linspace(10,75); 
plot(diagx,diagy, '--', 'Color', 'k');

% Plot statistics on one side of the diagonal
errorbar(c_alpha_helix, c_beta_helix, std_c_alpha_helix, 'horizontal','d','MarkerSize',6,'MarkerFaceColor', 'auto') 
errorbar(c_alpha_helix, c_beta_helix, std_c_beta_helix,'vertical','d','MarkerSize',6,'MarkerFaceColor', 'auto')
errorbar(c_alpha_strand, c_beta_strand, std_c_alpha_strand, 'horizontal','*','MarkerSize',6,'MarkerFaceColor', 'auto') 
errorbar(c_alpha_strand, c_beta_strand, std_c_beta_strand,'vertical','*','MarkerSize',6,'MarkerFaceColor', 'auto')

% Mirror statistics on the other side of the diagonal
errorbar(c_beta_helix, c_alpha_helix, std_c_beta_helix , 'horizontal','d','MarkerSize',6,'MarkerFaceColor', 'auto')
errorbar(c_beta_helix, c_alpha_helix, std_c_alpha_helix,'vertical','d','MarkerSize',6,'MarkerFaceColor', 'auto')
errorbar(c_beta_strand, c_alpha_strand, std_c_beta_strand, 'horizontal','*','MarkerSize',6,'MarkerFaceColor', 'auto')
errorbar(c_beta_strand, c_alpha_strand, std_c_alpha_strand,'vertical','*','MarkerSize',6,'MarkerFaceColor', 'auto')

legend('-',aminoacid, 'location', 'best')
axis square 

hold off;

% Glutammate protonation state
figure(3);clf; hold on;
title('Glutammate Protonation State')

contour(w1_spectrum2, w2_spectrum2, spectrum2, 32);
set ( gca, 'xdir', 'reverse' ) 
set ( gca, 'ydir', 'reverse' ) 
axis square

xlim([165,185]) 
set ( gca, 'xdir', 'reverse' ) 
ylim([10,75]) 
set ( gca, 'ydir', 'reverse' )

plot(glutammate_cd_a,glutammate_cg_a,'*','MarkerSize',20,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor',[1 .6 .6])
plot(glutammate_cd_ha,glutammate_cg_ha,'s','MarkerSize',20,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6])

pbaspect([1 2 1])
legend('-','Deprotonated E','Protonated E', Location='best')

hold off;



