theta = 45;

hm =8; % Low-rise environment

h = 10; % Ground terminal height

f = 3; % Frequency in GHz


Gt_cld = 0; % Tx->Rx gain along the direct ray
Gt_clg = 5; % Tx->Rx gain along the reflected ray
Gr = 0; % Rx->Tx gain
Lb = 150; % Basic transmission loss between Tx and Rx;

Ntot = 100000;

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