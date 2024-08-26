%% Write a MATLAB program to plot the magnitude of the reflection coefficient versus normalized frequency f/f0 for a single-section quarter-wave transformer where f/f0 varies form 0 to 4.

Z0 = 50;
ZL = 100;
f0 = 2e9;

Zq = sqrt(Z0*ZL);
f_over_f0 = linspace(0, 4, 1000);
Gamma = zeros(size(f_over_f0));

for i = 1:length(f_over_f0)
    f_ratio = f_over_f0(i);
    beta_l = pi/2 * f_ratio;
    Zin = Zq * (ZL + 1j * Zq * tan(beta_l)) / (Zq + 1j * ZL * tan(beta_l));
    Gamma(i) = abs((Zin-Z0)/(Zin+Z0));
end

figure;
plot(f_over_f0,Gamma,'LineWidth',2);
xlabel('Normalized Frequency f/f0');
ylabel('Magnitude of Reflection Coefficient |\Gamma|');
title('Reflection Coefficient vs. Normalilzed Frequency for Quarter-Wave Transformer');
grid on;