%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plotting chemical shift distributions for secondary structure types%%%
%%% from: Probability-based protein secondary structure identification %%%
%%% using combined NMR chemical-shift data.                            %%%
%%% Using RBNMR function to load spectra on which to plot data         %%%
%%% Author: Ettore Bartalucci, Aachen, 28.05.2024                      %%%                                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Load spectrum
tobsy = rbnmr('~\sec_struct_chem_shifts\specta\2D_INEPT_TOBSY_Fibrils_1');
darr = rbnmr('~\sec_struct_chem_shifts\spectra\2D_DARR_20ms_Fibrils_1');

tobsy = tobsy{1};
darr = darr{1};

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
  
% % Create one figure per secondary structure type and put all aminoacid
% figure(1);clf;hold on;
% title('Random coil shifts')
% contour(w1_spectrum1, w2_spectrum1, spectrum1, 32);
% set ( gca, 'xdir', 'reverse' ) 
% set ( gca, 'ydir', 'reverse' ) 
% axis square
% 
% xlim([10,75]) 
% set ( gca, 'xdir', 'reverse' )
% ylim([10,75])
% set ( gca, 'ydir', 'reverse' ) 
% 
% % Diagonal line
% diagx = linspace(10,75); 
% diagy = linspace(10,75); 
% plot(diagx,diagy, '--', 'Color', 'k');
% 
% % Plot statistics on one side of the diagonal
% errorbar(c_alpha_coil, c_beta_coil, std_c_alpha_coil, 'horizontal','o','MarkerSize',6) 
% errorbar(c_alpha_coil, c_beta_coil, std_c_beta_coil,'vertical','o','MarkerSize',6)
% 
% % Mirror statistics on the other side of the diagonal
% errorbar(c_beta_coil, c_alpha_coil, std_c_beta_coil , 'horizontal','o','MarkerSize',6)
% errorbar(c_beta_coil, c_alpha_coil, std_c_alpha_coil,'vertical','o','MarkerSize',6)
% 
% axis square 
% 
% hold off;
%     
% 
% % Create one figure per secondary structure type and put all aminoacid
% figure(2);clf;hold on;
% title('Secondary structure shifts')
% contour(w1_spectrum2, w2_spectrum2, spectrum2, 32);
% set ( gca, 'xdir', 'reverse' ) 
% set ( gca, 'ydir', 'reverse' ) 
% axis square
% 
% xlim([10,75]) 
% set ( gca, 'xdir', 'reverse' ) 
% ylim([10,75]) 
% set ( gca, 'ydir', 'reverse' ) 
% 
% % Diagonal line
% diagx = linspace(10,75); 
% diagy = linspace(10,75); 
% plot(diagx,diagy, '--', 'Color', 'k');
% 
% % Plot statistics on one side of the diagonal
% errorbar(c_alpha_helix, c_beta_helix, std_c_alpha_helix, 'horizontal','d','MarkerSize',6,'MarkerFaceColor', 'auto') 
% errorbar(c_alpha_helix, c_beta_helix, std_c_beta_helix,'vertical','d','MarkerSize',6,'MarkerFaceColor', 'auto')
% errorbar(c_alpha_strand, c_beta_strand, std_c_alpha_strand, 'horizontal','*','MarkerSize',6,'MarkerFaceColor', 'auto') 
% errorbar(c_alpha_strand, c_beta_strand, std_c_beta_strand,'vertical','*','MarkerSize',6,'MarkerFaceColor', 'auto')
% 
% % Mirror statistics on the other side of the diagonal
% errorbar(c_beta_helix, c_alpha_helix, std_c_beta_helix , 'horizontal','d','MarkerSize',6,'MarkerFaceColor', 'auto')
% errorbar(c_beta_helix, c_alpha_helix, std_c_alpha_helix,'vertical','d','MarkerSize',6,'MarkerFaceColor', 'auto')
% errorbar(c_beta_strand, c_alpha_strand, std_c_beta_strand, 'horizontal','*','MarkerSize',6,'MarkerFaceColor', 'auto')
% errorbar(c_beta_strand, c_alpha_strand, std_c_alpha_strand,'vertical','*','MarkerSize',6,'MarkerFaceColor', 'auto')
% 
% legend('-',aminoacid, 'location', 'best')
% axis square 
% 
% hold off;
% 
% % Glutammate protonation state
% figure(3);clf; hold on;
% title('Glutammate Protonation State')
% 
% contour(w1_spectrum2, w2_spectrum2, spectrum2, 32);
% set ( gca, 'xdir', 'reverse' ) 
% set ( gca, 'ydir', 'reverse' ) 
% axis square
% 
% xlim([165,185]) 
% set ( gca, 'xdir', 'reverse' ) 
% ylim([10,75]) 
% set ( gca, 'ydir', 'reverse' )
% 
% plot(glutammate_cd_a,glutammate_cg_a,'*','MarkerSize',20,...
%     'MarkerEdgeColor','c',...
%     'MarkerFaceColor',[1 .6 .6])
% plot(glutammate_cd_ha,glutammate_cg_ha,'s','MarkerSize',20,...
%     'MarkerEdgeColor','red',...
%     'MarkerFaceColor',[1 .6 .6])
% 
% pbaspect([1 2 1])
% legend('-','Deprotonated E','Protonated E', Location='best')
% 
% hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(999);clf;hold on;

% Alanine subplot paper
subplot(1,3,1)
title('Ala Ca-Cb')
contour(w1_spectrum2, w2_spectrum2, spectrum2, 32);
set ( gca, 'xdir', 'reverse' ) 
set ( gca, 'ydir', 'reverse' ) 
axis square
xlim([17,27]) 
set ( gca, 'xdir', 'reverse' )
ylim([47,56])
set ( gca, 'ydir', 'reverse' ) 
hold on;
% Plot statistics on one side of the diagonal
errorbar(c_alpha_coil(1), c_beta_coil(1), std_c_alpha_coil(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250]) 
errorbar(c_alpha_coil(1), c_beta_coil(1), std_c_beta_coil(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_alpha_helix(1), c_beta_helix(1), std_c_alpha_helix(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560]) 
errorbar(c_alpha_helix(1), c_beta_helix(1), std_c_beta_helix(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_alpha_strand(1), c_beta_strand(1), std_c_alpha_strand(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330]) 
errorbar(c_alpha_strand(1), c_beta_strand(1), std_c_beta_strand(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])

% Mirror statistics on the other side of the diagonal
errorbar(c_beta_coil(1), c_alpha_coil(1), std_c_beta_coil(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_beta_coil(1), c_alpha_coil(1), std_c_alpha_coil(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_beta_helix(1), c_alpha_helix(1), std_c_beta_helix(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_beta_helix(1), c_alpha_helix(1), std_c_alpha_helix(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_beta_strand(1), c_alpha_strand(1), std_c_beta_strand(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])
errorbar(c_beta_strand(1), c_alpha_strand(1), std_c_alpha_strand(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])

pbaspect([1.25 1 1])

hold off;

% Serine subplot paper
subplot(1,3,2)
title('Ser Ca-Cb')
contour(w1_spectrum2, w2_spectrum2, spectrum2, 32);
set ( gca, 'xdir', 'reverse' ) 
set ( gca, 'ydir', 'reverse' ) 
axis square
xlim([54,62.5]) 
set ( gca, 'xdir', 'reverse' )
ylim([62,72])
set ( gca, 'ydir', 'reverse' ) 
hold on;
% Plot statistics on one side of the diagonal
errorbar(c_alpha_coil(16), c_beta_coil(16), std_c_alpha_coil(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250]) 
errorbar(c_alpha_coil(16), c_beta_coil(16), std_c_beta_coil(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_alpha_helix(16), c_beta_helix(16), std_c_alpha_helix(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560]) 
errorbar(c_alpha_helix(16), c_beta_helix(16), std_c_beta_helix(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_alpha_strand(16), c_beta_strand(16), std_c_alpha_strand(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330]) 
errorbar(c_alpha_strand(16), c_beta_strand(16), std_c_beta_strand(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])

% Mirror statistics on the other side of the diagonal
errorbar(c_beta_coil(16), c_alpha_coil(16), std_c_beta_coil(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_beta_coil(16), c_alpha_coil(16), std_c_alpha_coil(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_beta_helix(16), c_alpha_helix(16), std_c_beta_helix(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_beta_helix(16), c_alpha_helix(16), std_c_alpha_helix(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_beta_strand(16), c_alpha_strand(16), std_c_beta_strand(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])
errorbar(c_beta_strand(16), c_alpha_strand(16), std_c_alpha_strand(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])

pbaspect([1 1.25 1])

hold off;

% Glutamate subplot paper
subplot(1,3,3)
title('Glu Cg-Cd')
contour(w1_spectrum2, w2_spectrum2, spectrum2, 32);

xlim([175,185]) 
set ( gca, 'xdir', 'reverse' ) 
ylim([31,39]) 
set ( gca, 'ydir', 'reverse' )
hold on;
plot(glutammate_cd_a,glutammate_cg_a,'o','MarkerSize',10,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor','c')
plot(glutammate_cd_ha,glutammate_cg_ha,'o','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor','red')

pbaspect([1.25 1 1])

hold off;

% 
% set(gcf, 'PaperOrientation', 'landscape'); 
% set(gcf, 'PaperUnits', 'centimeters');
% set(gcf, 'PaperPosition', [0 0 29.7 21]); 
% set(gcf, 'PaperSize', [29.7 21]); % A4 size in centimeters (landscape)
% print(gcf, 'Figure_2_stats_plots', '-dpdf', '-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);clf;hold on;
% Alanine subplot paper
title('Ala Ca-Cb')
set ( gca, 'xdir', 'reverse' ) 
set ( gca, 'ydir', 'reverse' ) 
axis square
xlim([17,27]) 
set ( gca, 'xdir', 'reverse' )
ylim([47,56])
set ( gca, 'ydir', 'reverse' ) 
hold on;
% Plot statistics on one side of the diagonal
errorbar(c_alpha_coil(1), c_beta_coil(1), std_c_alpha_coil(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250]) 
errorbar(c_alpha_coil(1), c_beta_coil(1), std_c_beta_coil(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_alpha_helix(1), c_beta_helix(1), std_c_alpha_helix(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560]) 
errorbar(c_alpha_helix(1), c_beta_helix(1), std_c_beta_helix(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_alpha_strand(1), c_beta_strand(1), std_c_alpha_strand(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330]) 
errorbar(c_alpha_strand(1), c_beta_strand(1), std_c_beta_strand(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])

% Mirror statistics on the other side of the diagonal
errorbar(c_beta_coil(1), c_alpha_coil(1), std_c_beta_coil(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_beta_coil(1), c_alpha_coil(1), std_c_alpha_coil(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_beta_helix(1), c_alpha_helix(1), std_c_beta_helix(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_beta_helix(1), c_alpha_helix(1), std_c_alpha_helix(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_beta_strand(1), c_alpha_strand(1), std_c_beta_strand(1), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])
errorbar(c_beta_strand(1), c_alpha_strand(1), std_c_alpha_strand(1),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])

pbaspect([1.25 1 1])

hold off;

set(gcf, 'PaperOrientation', 'landscape'); 
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 29.7 21]); 
set(gcf, 'PaperSize', [29.7 21]); % A4 size in centimeters (landscape)
print(gcf, 'Figure_3_ala', '-dpdf', '-r300');

% Serine subplot paper
figure(2);clf;hold on;
title('Ser Ca-Cb')
set ( gca, 'xdir', 'reverse' ) 
set ( gca, 'ydir', 'reverse' ) 
axis square
xlim([54,62.5]) 
set ( gca, 'xdir', 'reverse' )
ylim([62,72])
set ( gca, 'ydir', 'reverse' ) 
hold on;
% Plot statistics on one side of the diagonal
errorbar(c_alpha_coil(16), c_beta_coil(16), std_c_alpha_coil(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250]) 
errorbar(c_alpha_coil(16), c_beta_coil(16), std_c_beta_coil(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_alpha_helix(16), c_beta_helix(16), std_c_alpha_helix(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560]) 
errorbar(c_alpha_helix(16), c_beta_helix(16), std_c_beta_helix(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_alpha_strand(16), c_beta_strand(16), std_c_alpha_strand(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330]) 
errorbar(c_alpha_strand(16), c_beta_strand(16), std_c_beta_strand(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])

% Mirror statistics on the other side of the diagonal
errorbar(c_beta_coil(16), c_alpha_coil(16), std_c_beta_coil(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_beta_coil(16), c_alpha_coil(16), std_c_alpha_coil(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.9290 0.6940 0.1250],'MarkerFaceColor', [0.9290 0.6940 0.1250])
errorbar(c_beta_helix(16), c_alpha_helix(16), std_c_beta_helix(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_beta_helix(16), c_alpha_helix(16), std_c_alpha_helix(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.4940 0.1840 0.5560],'MarkerFaceColor', [0.4940 0.1840 0.5560])
errorbar(c_beta_strand(16), c_alpha_strand(16), std_c_beta_strand(16), 'horizontal','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])
errorbar(c_beta_strand(16), c_alpha_strand(16), std_c_alpha_strand(16),'vertical','o','MarkerSize',10,'MarkerEdgeColor', [0.3010 0.7450 0.9330],'MarkerFaceColor', [0.3010 0.7450 0.9330])

pbaspect([1 1.25 1])

hold off;

set(gcf, 'PaperOrientation', 'landscape'); 
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 29.7 21]); 
set(gcf, 'PaperSize', [29.7 21]); % A4 size in centimeters (landscape)
print(gcf, 'Figure_3_ser', '-dpdf', '-r300');

