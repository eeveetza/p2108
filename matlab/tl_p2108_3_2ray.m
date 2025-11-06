function Lt = tl_p2108_3_2ray(f, theta, p, h, hm, Gt_cld, Gt_clg, Gr, Lb)
%% tl_p2108_3_2ray
%   This function computes the transmission loss including the
%   clutter loss as defined in ITU-R P.2108 (Section 3.3) for Earth to Space and Aeronautical
%   paths using guidance in Attachment of Document 5D/629 for 2 ray approximation
%
%     Input parameters:
%     f       -   Frequency (GHz): 0.5 <= f <= 100
%     theta   -   elevation angle from the ground station to the elevated station:  0 <= th <= 90
%     p       -   percentage of locations (%): 0 < p < 100
%     h       -   ground station height (m): h >= 1
%     hm      -   median clutter height (m): Low-rise: hm <= 8
%                                            Mid-rise: 8 < hm <= 20
%                                            High-rise: hm > 20
%     Gt_cld  -   the gain of the transmitter towards the receiver along
%                 the direct path (theta, phi) (dBi)
%     Gt_clg  -   the gain of the transmitter towards the receiver along
%                 the path with a ground reflection (-theta, phi) (dBi)
%     Gr      -   the gain of the satellite or aircraft receiver in the
%                 direction of the transmitter (dBi)
%     Lb      -   Basic transmission loss between transmitter and the
%                 receiver computed using a propagation model that does not
%                 have clutter loss included and does not have a ground
%                 reflection path considered (dB)
%     Output parameters:
%     Ltot   -   Transmission loss between Earth and Space/Aeronautical
%                stations (dB)
%

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    30JUN25     Ivica Stevanovic, OFCOM         Initial version
%     v1    14OCT25     Ivica Stevanovic, OFCOM         Modification to the use of location percentage


% Compute the probability of locations with FcLoS

pFcLoS = pFcLoS_p2108_3(f, theta, h, hm);

beta = 17 + 6 * randn;

%ptrial = 100*rand;

% Clutter loss along the direct path

%if (ptrial <= pFcLoS)
if (p <= pFcLoS)

    Lcld = 0;

else % FoLoS or NLoS

    Lcld = cl_p2108_3(f, theta, p, h, hm);

end

% Additional clutter loss of the secondary path Lclg is modeled as
% Lcld + beta'

Lclg = Lcld + max(0,beta);

% Transform dB values into linear units

lcld = 10.^(Lcld/10);
lclg = 10.^(Lclg/10);
gt_cld = 10.^(Gt_cld/10);
gt_clg = 10.^(Gt_clg/10);
gr = 10.^(Gr/10);
loss = 10.^(Lb/10);

% The transmission loss between the transmitter and receiver accounting for
% all the loss factors of the link


lt = (gt_cld/lcld + gt_clg/lclg) * gr/loss;

% Transform the linear unit into dB
Lt = -10*log10(lt);

return
end



