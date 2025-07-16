f = 2; % Frequency in GHz
theta = 5;
h = 1.5; % Ground terminal height
hm = 8;
Gt_cld = 10; % Tx->Rx gain along the direct ray
Gt_clg = 10; % Tx->Rx gain along the reflected ray
Gr = 0; % Rx->Tx gain
Lb = 150; % Basic transmission loss between Tx and Rx;

Ntot = 10000;

Lt = zeros(Ntot,1);

for i = 1:Ntot

    p = 100*rand;

    Lt(i) = tl_p2108_3_2ray(f, theta, p, h, hm, Gt_cld, Gt_clg, Gr, Lb);

end

figure;

[f,x] = ecdf(Lt);
plot(x,f,'LineWidth', 2);
grid on
ylabel('CDF')
xlabel('Lt (dB)')
str1 = sprintf('theta = %.1f, hm = %.1f, h = %.1f, Gt_d = %.1f, Gt_g = %.1f, Lb = %.1f', theta, hm, h, Gt_cld, Gt_clg, Lb);
title(str1)

[f,x] = ecdf(Lt);

% Compute 10, 50 and 90 percentiles of total transmission loss
Lt10 = interp1(linspace(0, 1, size(x,1)), sort(x), 10/100);
Lt50 = interp1(linspace(0, 1, size(x,1)), sort(x), 50/100);
Lt90 = interp1(linspace(0, 1, size(x,1)), sort(x), 99/100);