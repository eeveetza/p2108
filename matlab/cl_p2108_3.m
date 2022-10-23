function Lces = cl_p2108_3(f, th, p)
%cl_loss3 clutter loss according to P.2108 §3.3
%   L = cl_p2108_3(f, th, p)
%
%   This function computes the statistical distribution of clutter loss
%   as defined in ITU-R P.2108 (Section 3.3) for Earth to Space and Aeronautical
%   paths 
%
%     Input parameters:
%     f       -   Frequency (GHz): 10 <= f <= 100
%     th      -   elevation angle (degrees):  0 <= th <= 90 
%     p       -   percentage of locations (%): 0 < p < 100
%
%     Output parameters:
%     Lces     -   clutter loss according to P.2108 §3.3
%
%     Example:
%     Lces = cl_p2108_3(f, th, p)

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    01MAY17     Ivica Stevanovic, OFCOM         Initial version

%% Read the input arguments and check them

% Checking passed parameter to the defined limits

if f < 10 || f > 100
   warning('cl_p2108_3: Frequency is outside of the valid domain [10, 100] GHz'); 
end

if th < 0 || th > 90
    warning('cl_p2108_3: Elevation angle is outside of the valid domain [0, 90] degrees'); 
end    


if p <= 0 || p >= 100
    warning('cl_p2108_3: Percentage of locations is outside of the valid domain (0, 100) %%'); 
end    

K1 = 93*f^(0.175);  
A1 = 0.05;

L1 = -K1 *log(1-p/100);
L2 = cot(A1*(1-th/90)+pi*th/180);

Lces = (L1*L2).^(0.5*(90-th)/90) - 1 - 0.6*norminv(1-p/100, 0, 1);   %(6);


return
end
    


