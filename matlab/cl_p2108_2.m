function Lctt = cl_p2108_2(f, d, p)
%cl_loss2 clutter loss according to P.2108-1 §3.2
%   L = cl_p2108_2(f, d, p)
%
%   This function computes the statistical distribution of clutter loss
%   as defined in ITU-R P.2108 (Section 3.2) for terrestrial paths in
%   urban and suburban environments.
%
%     Input parameters:
%     f       -   Frequency (GHz): 0.5 <= f <= 67
%     d       -   distance (km):  0.25 < d < 1 (correction to be applied at one end only)
%                                        d >= 1 (correction can be applied at both ends of the path)
%     p       -   percentage of locations (%): 0 < p < 100
%
%     Output parameters:
%     Lctt     -   clutter loss according to P.2108 §3.2
%
%     Example:
%     Lctt = cl_p2108_2(f, d, p)

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    01MAY17     Ivica Stevanovic, OFCOM         Initial version
%     v1    14JUL21     Ivica Stevanovic, OFCOM         Aligned with ITU-R P.2108-1

%% Read the input arguments and check them

% Checking passed parameter to the defined limits

if f < 0.5 || f > 67
   warning('Frequency is outside of the valid domain [0.5, 67] GHz'); 
end

if p <= 0 || p >= 100
    warning('Percentage of locations is outside of the valid domain (0, 100) %%'); 
end    

% Ll = 23.5 + 9.6*log10(f);   %(4)
Ll = -2.0*log10(10.^(-5.0*log10(f)-12.5) + 10.^(-16.5));   %(4a)
sigmal= 4;                                                 %(4b)

Ls = 32.98 + 23.9*log10(d) + 3*log10(f);                   %(5a)
sigmas = 6;                                                %(5b)

sigmacb = sqrt( (sigmal^2*10^(-0.2*Ll) + sigmas^2*10^(-0.2*Ls) ) / (10^(-0.2*Ll) + 10^(-0.2*Ls)) );      %(3b)

Lctt = -5*log10(10^(-0.2*Ll) + 10^(-0.2*Ls)) - sigmacb * norminv(1-p/100, 0, 1);  %(3a)

Ls2 = 32.98 + 23.9*log10(2) + 3*log10(f);   
sigmacb2 = sqrt( (sigmal^2*10^(-0.2*Ll) + sigmas^2*10^(-0.2*Ls2) ) / (10^(-0.2*Ll) + 10^(-0.2*Ls2)) );      %(3b)
Lctt2 = -5*log10(10^(-0.2*Ll) + 10^(-0.2*Ls2)) - sigmacb2 * norminv(1-p/100, 0, 1);  %(3a)

Lctt = min(Lctt, Lctt2);

return
end
    


