% This script creates validation examples for function cl_p2108_3
% which computes the clutter loss as defined in ITU-R P.2108 (Section 3.3) 
% for Earth to Space and Aeronautical paths 
% Error tolerance: 1e-8 dB.

% 16JUL25   Ivica Stevanovic

%% Set the values for the input parameters to cl_p2108_3
fGHz = [0.5, 1, 2, 5, 10, 20, 50, 100];
theta = 0:10:90;
p = [0.1, 1:99, 99.9];
h = [1.5, 5, 8, 10, 15, 20, 30];
hm = [5, 8, 10, 20, 25];

%% Set the file in which the validation data are to be written

fidlog = fopen('validation_examples/validation_example_p2108_3.csv', 'w');

fprintf(fidlog,'f (GHz), theta (deg), p (%%), h (m), hm (m), Lces (dB)\n');

for ff = 1:length(fGHz)
    for it = 1:length(theta)
        for ip = 1:length(p)
            for ih = 1:length(h)
                for ihm = 1:length(hm)

                    Lc = cl_p2108_3(fGHz(ff), theta(it), p(ip), h(ih), hm(ihm));

                    fprintf(fidlog,'%.1f, %.1f, %.1f, %.1f, %.1f, %.8f\n', fGHz(ff), theta(it), p(ip), h(ih), hm(ihm), Lc);
                end
            end
        end
    end
end

fclose(fidlog);

