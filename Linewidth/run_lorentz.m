%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%            Making figure for the NMR linewidths contributions       %%%
%%%                          ETBA, 02.03.23                             %%%
%%%                                                                     %%%
%%%  Very hands-on, use the values for the linewidths taken from ccpn   %%%
%%%  in the direct dimension (F1 in ccpn) which correspond to the total %%%
%%%  linewidths, and includes the homogeneous contribution as 1/(pi*T2')%%%
%%%  to get out the inhomogeneous contribution. Plots it as lorenzian   %%%
%%%  with various colors on an arbitrary frequency axis.                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Import data from CCPN and relaxation measurements
freq_axis = linspace (-100, 100);
pos = 0;
width = linspace(1, 100); % here i need to modify according to the experimental values
height = 50; % can be rather random i think

%% loop through 
for i = 1:8 %change based on number of different amino acids
    for k = 1:3 % number of linewidth parameters
        d = lorentz(freq_axis, pos, width(i), height); % use lorentz fn to
        figure(k);
        plot(freq_axis, d);hold on;
        xlabel('Hz')
    end
end