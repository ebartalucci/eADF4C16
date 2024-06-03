%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPUTE SECONDARY CHEMICAL SHIFTS FOR SECONDARY STRUCTURE INFORMATION. %
%                ETTORE BARTALUCCI, V1 12.12.2022                        %
%                PROJECT: SPIDER SILKS eADF4(C16)                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clear vars




function scs = secondary_shifts()
    scs = (delta_C_alpha_exp - delta_C_alpha_RC) - (delta_C_beta_exp - delta_C_beta_RC)
end