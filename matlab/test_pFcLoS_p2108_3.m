

theta = linspace(0, 90, 101);

hm = 8; % Low-rise environment

h = 5; % Ground terminal height

f = 3; % Frequency in GHz


figure;

pFcLoS = zeros(size(theta));
for it = 1:length(theta)

        pFcLoS(it) = pFcLoS_p2108_3(f, theta(it), h, hm);
            
end
plot(theta, pFcLoS);
grid on
ylabel('pFcLoS (%)')
xlabel('theta')
title(' f = 3 GHz, h = 5 m, Low-rise' )



hm = 25; % High-rise environment

h = 18; % Ground terminal height

f = 30; % Frequency in GHz
figure;

pFcLoS = zeros(size(theta));
for it = 1:length(theta)

        pFcLoS(it) = pFcLoS_p2108_3(f, theta(it), h, hm);
            
end
plot(theta, pFcLoS);
grid on
ylabel('pFcLoS (%)')
xlabel('theta')
title(' f = 30 GHz, h = 25 m, High-rise' )
