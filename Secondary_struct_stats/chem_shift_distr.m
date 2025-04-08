%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plotting chemical shift distributions for secondary structure types%%%
%%% from: Probability-based protein secondary structure identification %%%
%%% using combined NMR chemical-shift data.                            %%%
%%% Source: https://onlinelibrary.wiley.com/doi/full/10.1110/ps.3180102 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%% ASSIGN VALUES TO VARIABLES %%%%%%%%%%%%%%%%%%%%%%%
% read data from excel table: values from Wang, Jardetzky, 2002
chem_shift = readtable("average_chemical_shifts_values.xlsx");

% create amino acid list
aminoacid = chem_shift.Aminoacid;

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

%%%%%%%%%%%%%%%%%%%%%%%  PLOT CHEMICAL SHIFTS STATS  %%%%%%%%%%%%%%%%%%%%%%
%% Figures section
% rescale figure based on the size of a '2D DARR spectrum' for the aliphatic
% region (e.g. 10ppm to 75ppm) 

for i=1:length(aminoacid)
    %% Create one figure per aminoacid type to have a clean representation
    figure(i);clf;hold on;
    xlim([10,80]) % 15ppm to 75ppm - change based on the spectral region
    set ( gca, 'xdir', 'reverse' ) % invert axes directions
    ylim([10,80]) % 15ppm to 75ppm - change based on the spectral region
    set ( gca, 'ydir', 'reverse' ) % invert axes directions

    % Diagonal line
    diagx = linspace(10,80); % 15ppm to 75ppm - change based on the spectral region
    diagy = linspace(10,80); % 15ppm to 75ppm - change based on the spectral region
    plot(diagx,diagy, '--', 'Color', 'k');
    
    %% Plot statistics on one side of the diagonal

    % Error on the x axis
    errorbar(c_alpha_coil(i), c_beta_coil(i), std_c_alpha_coil(i), 'horizontal','o','MarkerSize',6,'Color','r') % red circles for coils
    errorbar(c_alpha_helix(i), c_beta_helix(i), std_c_alpha_helix(i), 'horizontal', '*','MarkerSize',6,'Color','b') % blue stars for helices
    errorbar(c_alpha_strand(i), c_beta_strand(i),std_c_alpha_strand(i), 'horizontal', 'd','MarkerSize',6,'Color','k') % black squares for strands

    % Error on the y axis
    errorbar(c_alpha_coil(i), c_beta_coil(i), std_c_beta_coil(i),'vertical','o','MarkerSize',6,'Color','r') % red circles for coils
    errorbar(c_alpha_helix(i), c_beta_helix(i), std_c_beta_helix(i), 'vertical', '*','MarkerSize',6,'Color','b') % blue stars for helices
    errorbar(c_alpha_strand(i), c_beta_strand(i), std_c_beta_strand(i), 'vertical', 'd','MarkerSize',6,'Color','k') % black squares for strands
 
    %% Mirror statistics on the other side of the diagonal
    
    % Error on the x axis
    errorbar(c_beta_coil(i), c_alpha_coil(i), std_c_beta_coil(i) , 'horizontal','o','MarkerSize',6,'Color','r') % red circles for coils
    errorbar(c_beta_helix(i), c_alpha_helix(i), std_c_beta_helix(i) , 'horizontal', '*','MarkerSize',6,'Color','b') % blue stars for helices
    errorbar(c_beta_strand(i), c_alpha_strand(i), std_c_beta_strand(i) , 'horizontal', 'd','MarkerSize',6,'Color','k') % black squares for strands

    % Error on the y axis
    errorbar(c_beta_coil(i), c_alpha_coil(i), std_c_alpha_coil(i),'vertical','o','MarkerSize',6,'Color','r') % red circles for coils
    errorbar(c_beta_helix(i), c_alpha_helix(i), std_c_alpha_helix(i), 'vertical', '*','MarkerSize',6,'Color','b') % blue stars for helices
    errorbar(c_beta_strand(i), c_alpha_strand(i), std_c_alpha_strand(i), 'vertical', 'd','MarkerSize',6,'Color','k') % black squares for strands
    
    hold off;
    legend(aminoacid(i), 'location', 'northwest')
    axis square % make a squared figure with equal axes


end


