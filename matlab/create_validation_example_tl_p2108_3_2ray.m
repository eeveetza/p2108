% This script creates validation examples for function tl_p2108_3_2ray
% which computes the transmission loss including the clutter loss 
% as defined in ITU-R P.2108 (Section 3.3) for Earth to Space and Aeronautical
% paths using guidance in Attachment of Document 5D/629 for 2 ray approximation
% The first-order statistics (median, sigma) are computed across 100000
% samples; for error tolerance of not exceeding 2 dB for Lt and 0.5 dB for sigma.

% 16JUL25               Ivica Stevanovic
% Modified 14OCT25      Ivica Stevanovic

%% Set the values for the input parameters to tl_p2108_3_2ray
fGHz =[1, 10, 100];
theta = [0, 10, 45, 90];
h = [1.5, 10, 30];
hm = [8, 15, 25];
Gt_cld = [0, 10];
Gt_clg = [0, 10];
Gr = 0;
Lb = [200];
Ntot = 100000;

%% Progress bar header
fprintf(1,'0%%----------100%%\n  ');
total_steps=length(fGHz)*length(theta)*length(h)*length(hm)*length(Gt_cld)*length(Gt_clg)*length(Lb);

%% Set the file in which the validation data are to be written

fidlog = fopen('validation_examples/validation_example_tl_p2108_3_2ray.csv', 'w');

fprintf(fidlog,'f (GHz), theta (deg), h (m), hm (m), Gt_cld (dBi), Gt_clg (dBi), Gr (dBi), Lb (dB), Lt(50%%), sigma (Nsamples = 20000)\n');
kk = 1;
for ff = 1:length(fGHz)
    for it = 1:length(theta)
        for ih = 1:length(h)
            for ihm = 1:length(hm)
                for icld = 1:length(Gt_cld)
                    for iclg = 1:length(Gt_clg)
                        for iLb = 1:length(Lb)

                            %% Compute CDF of total transmission loss
                            Lt = zeros(Ntot,1);

                            for i = 1:Ntot

                                p = 100*rand;

                                Lt(i) = tl_p2108_3_2ray(fGHz(ff), theta(it), p, h(ih), hm(ihm), Gt_cld(icld), Gt_clg(iclg), Gr, Lb(iLb));

                            end

%                             [f,x] = ecdf(Lt);
% 
%                             %% Compute 1, 50 and 99 percentiles of total transmission loss
%                             percentile1 = interp1(linspace(0, 1, size(x,1)), sort(x), 1/100);
%                             percentile2 = interp1(linspace(0, 1, size(x,1)), sort(x), 50/100);
%                             percentile3 = interp1(linspace(0, 1, size(x,1)), sort(x), 99/100);
                            Lt50 = median(Lt);
                            sigma = std(Lt);

                            fprintf(fidlog,'%.1f, %.1f, %.1f, %.1f, %.1f,  %.1f, %.1f, %.1f, %.2f, %.2f\n', fGHz(ff), theta(it), h(ih), hm(ihm), Gt_cld(icld), Gt_clg(iclg), Gr, Lb(iLb), Lt50, sigma);

                            %% Progress bar update
                            if mod(kk, floor(total_steps/10)) == 0
                                fprintf(1,'.');
                            end
                            kk = kk + 1;
                        end
                    end
                end
            end
        end
    end
end
fprintf(1,'\n');

fclose(fidlog);


