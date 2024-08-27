%% Write a MATLAB program to plot the magnitude of the reflection coefficient versus normalized frequency f/f0 for a single-section quarter-wave transformer for ZL/Z0 = 2,5 and 10 where f/f0 varies from 0 to 2.
Z0 = 50;
f0 = 2e9;
ZL_over_Z0 = [2, 5, 10];
f_over_f0 = linspace(0, 2, 1000);
figure;
hold on;

for ratio = ZL_over_Z0
    ZL = ratio*Z0;
    Zq = sqrt(Z0*ZL);
    Gamma = zeros(size(f_over_f0));
    for i = 1:length(f_over_f0);
        beta_l = pi/2 *f_over_f0(i);
        Zin = Zq * (ZL + 1j * Zq * tan(beta_l)) / (Zq + 1j * ZL * tan(beta_l));
    Gamma(i) = abs((Zin-Z0)/(Zin+Z0));
    end
    plot(f_over_f0,Gamma,'Linewidth',2,'DisplayName',['ZL/Z0 =' num2str(ratio)]);
end

xlabel('Normalized Frequency f/f0');
ylabel('Magnitude of Reflection Coefficient |\Gamma|');
title('Reflection Coefficient vs. Normalilzed Frequency for Quarter-Wave Transformer');
legend('show');
grid on;
hold off;