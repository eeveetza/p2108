function Lces = cl_p2108_3(f, theta, p, h, hm)
%cl_loss3 clutter loss according to P.2108-2 §3.3
%   L = cl_p2108_3(f, theta, p, h, hm)
%
%   This function computes the statistical distribution of clutter loss
%   as defined in ITU-R P.2108 (Section 3.3) for Earth to Space and Aeronautical
%   paths 
%
%     Input parameters:
%     f       -   Frequency (GHz): 10 <= f <= 100
%     theta   -   elevation angle (degrees):  0 <= th <= 90 
%     p       -   percentage of locations (%): 0 < p < 100
%     h       -   ground station height (m): h >= 1
%     hm      -   median clutter height (m): Low-rise: hm <= 8
%                                            Mid-rise: 8 < hm <= 20
%                                            High-rise: hm > 20
%
%     Output parameters:
%     Lces     -   clutter loss according to P.2108 §3.3
%
%     Example:
%     Lces = cl_p2108_3(f, theta, p, h, hm)

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    12JUN25     Ivica Stevanovic, OFCOM         Initial version

%% Read the input arguments and check them

% Checking passed parameter to the defined limits

if f < 0.5 || f > 100
   warning('cl_p2108_3: Frequency is outside of the valid domain [0.5, 100] GHz'); 
end

if theta < 0 || theta > 90
    warning('cl_p2108_3: Elevation angle is outside of the valid domain [0, 90] degrees'); 
end    


if p <= 0 || p >= 100
    warning('cl_p2108_3: Percentage of locations is outside of the valid domain (0, 100) %%'); 
end    

% Table 7: plos parameters for equations (7) and (8)
if (hm <= 8)
    % Low-rise
    ak = 4.9;
    bk = 6.7;
    ck = 2.6;
    aC = 0.19; 
    bC = 0;
    aV = 1.4;
    bV = 74;

elseif (hm > 8 && hm <= 20)
    % Mid-rise
    ak = -2.6;
    bk =  6.6;
    ck =  2.0;
    aC =  0.42; 
    bC = -6.7;
    aV =  0.15;
    bV =  97;    

else % hm > 20
    % High-rise
    ak =  2.4;
    bk =  7.0;
    ck =  1.0;
    aC =  0.19; 
    bC = -2.7;
    aV =  0.15;
    bV =  98;
end


% Table 8: plos parameters for equations (9) and (10)
if (hm <= 8)
    % Low-rise
    akp = 6.0;
    bkp = 0.07;
    aCp = 0.15; 
    bC1p = 5.4;
    bC2p = -0.3;
    bC3p = 3.2;
    bC4p = 0.07;
    cCp = -27;
    aVp = 1.6;
    bVp = -17;

elseif (hm > 8 && hm <= 20)
    % Mid-rise
    akp = 3.6;
    bkp = 0.05;
    aCp = 0.17; 
    bC1p = 13;
    bC2p = -0.2;
    bC3p = 3.7;
    bC4p = 0.06;
    cCp = -41;
    aVp = 1;
    bVp = -21;    

else % hm > 20
    % High-rise
    akp = 5.0;
    bkp = 0.003;
    aCp = 0.17; 
    bC1p = 32.6;
    bC2p = 0.012;
    bC3p = -23.9;
    bC4p = -0.07;
    cCp = -41;
    aVp = 1;
    bVp = -18; 
end

% LoS probability (7-8)

Vmax = min(aV*h + bV, 100);
Ce = aC*h + bC;
k = ((h + ak)/bk).^ck;
pLoS = max(0, Vmax * ( ( 1 - exp( -k*(theta + Ce)/90 ) ) / (1 - exp(-k*(90 + Ce) / 90 ) ) ) );

% Conditional probability of Fresnel zone clearance (9-10)

Vmaxp = min(aVp*h + bVp, 0) * f.^(-0.55) + 100;
Cep = (f*1e9).^aCp + bC1p * exp(bC2p * h) + bC3p * exp(bC4p * h) + cCp;
kp = akp * exp (bkp * h);
pFcLoS_LoS = max(0, Vmaxp * ( ( 1 - exp( -kp*(theta + Cep)/90 ) ) / (1 - exp(-kp*(90 + Cep) / 90 ) ) ) );

% Probability of a link being Fresnel clear

pFcLoS = pLoS * pFcLoS_LoS / 100;     %(11)

if (p > pLoS)

    pp = (p - pLoS) / (100 - pLoS);  %(12a)

    % Table 9

    alpha1 = 8.54;
    alpha2 = 0.056;
    beta1 = 17.57;
    beta2 = 6.32;
    gamma1 = 0.63;
    gamma2 = 0.19;
    
    mu =    alpha1 + beta1 * log( 1 + ( 90 - theta) / 90 ) + f.^gamma1;   % (13a)
    sigma = alpha2 + beta2 * log( 1 + ( 90 - theta) / 90 ) + f.^gamma2;   % (13b)

    %Lces = max ( norminv( pp, mu, sigma), 6 );      % (12b)
    % Using Qinv
    Qinv = sqrt(2)*erfcinv(2*pp);
    Lces = max( mu + sigma*Qinv, 6);
    % Using Finv
    Finv = sqrt(2) * erfinv(2*pp-1);
    
    Lces = max( mu + sigma*Finv, 6);
    %Lces = max ( norminv( pp, mu, sigma), 6 ); 

elseif (p < pFcLoS)

    % Table 10

    theta1 = -3.542;
    theta2 = -155.1;
    sigma1 = -1.06;
    sigma2 = -6.342;

    Lces = theta1 * exp(theta2 * p / pFcLoS) + sigma1 * exp( sigma2 * p / pFcLoS);  %(15)

else

    Lces = 6 * (p - pFcLoS) / (pLoS - pFcLoS);   % (14)

end


return
end