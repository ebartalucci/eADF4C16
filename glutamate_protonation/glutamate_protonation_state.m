%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plotting chemical shift values for glutamate residues in various   %%%
%%% protonation states.%%%
%%% values from pH-dependent random coil 1H, 13C, and 15N chemical shifts
%%% of the ionizable amino acids: a guide for protein pKa
%%% measurements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nucleus type Nucleus d (HA) d (A) Dd (A–HA)
% 13C Ca 56.0 56.9 1.0
% Cb 28.5 30.0 1.5
% Cc 32.7 36.1 3.5
% Cd (carboxyl) 179.7 183.8 4.1
% CO 176.5 177.0 0.6

%% Values
ca_ha = 56;
ca_a = 56.9;
cb_ha = 28.5;
cb_a = 30;
cg_ha = 32.7;
cg_a = 36.1;
cd_ha = 179.7;
cd_a = 183.8;
co_ha = 176.5;
co_a = 177;

%%%%%%%%%%%%%%%%%%%%%%%  PLOT CHEMICAL SHIFTS STATS  %%%%%%%%%%%%%%%%%%%%%%
%% Figures section
% rescale figure based on the size of a '2D DARR spectrum' for the aliphatic
% region (e.g. 10ppm to 75ppm) 

% Create figure
figure(1);clf;hold on;
xlim([165,185]) % 15ppm to 75ppm - change based on the spectral region
set ( gca, 'xdir', 'reverse' ) % invert axes directions
ylim([15,75]) % 15ppm to 75ppm - change based on the spectral region
set ( gca, 'ydir', 'reverse' ) % invert axes directions

plot(cd_a,cg_a,'*','MarkerSize',10,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor',[1 .6 .6])
plot(cd_ha,cg_ha,'s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6])
% xlim(165,190)
% ylim(15,75)
pbaspect([1 2 1])
legend('Deprotonated E','Protonated E', Location='best')








