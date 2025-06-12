%% Reproduce Figure 2

theta = linspace(90, 0, 10);

hm = 8; % Low-rise environment

h = 5; % Ground terminal height

tp = linspace(1e-6, 100-1e-6, 1000);

f = 3; % Frequency in GHz

clear legendstr

figure;
hold on

for it = 1:length(theta)

    L = zeros(size(tp));
    
    for ip = 1:length(tp)

        L(ip) = cl_p2108_3(f, theta(it), tp(ip), h, hm);
            
    end
    legendstr(it) = sprintf("%g^o", theta(it));
    plot(L, tp, 'LineWidth', 2);
end
grid on
xlabel('Clutter Loss (dB)')
ylabel('Percentage of Locations')
title('CDF of clutter loss, f = 3 GHz, h = 5 m, Low-rise' )
set(gca,'XLim',[-5,30])
legend(legendstr, 'Location', 'east outside', 'NumColumns', 1);

%% Reproduce Figure 3

hm = 25; % High-rise environment

h = 18; % Ground terminal height

tp = linspace(1e-6, 100-1e-6, 1000);

f = 30; % Frequency in GHz

clear legendstr

figure;
hold on

for it = 1:length(theta)

    L = zeros(size(tp));
    
    for ip = 1:length(tp)

        L(ip) = cl_p2108_3(f, theta(it), tp(ip), h, hm);
            
    end
    legendstr(it) = sprintf("%g^o", theta(it));
    plot(L, tp, 'LineWidth', 2);
end
grid on
xlabel('Clutter Loss (dB)')
ylabel('Percentage of Locations')
title('CDF of clutter loss, f = 30 GHz, h = 18 m, High-rise' )
set(gca,'XLim',[-5,45])
legend(legendstr, 'Location', 'east outside', 'NumColumns', 1);