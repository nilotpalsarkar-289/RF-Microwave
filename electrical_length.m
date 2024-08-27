%% Write a MATLAB code to plot the magnitude of the reflection coefficient versus electrical length beta_l for a single-section quarter wave transformer where beta_l varies from 0 to x.
Z0 = 50;
ZL = 100;
f0 = 2e9;

Zq = sqrt(Z0*ZL);
beta_l = linspace(0, pi, 1000);
Gamma = zeros(size(beta_l));

for i = 1:length(beta_l)
    Zin = Zq * (ZL + 1j * Zq * tan(beta_l(i))) / (Zq + 1j * ZL * tan(beta_l(i)));
    Gamma(i) = abs((Zin-Z0)/(Zin+Z0));
end

figure;
plot(beta_l,Gamma,'LineWidth',2);
xlabel('Electrical Length \beta_l (radians)');
ylabel('Magnitude of Reflection Coefficient |\Gamma|');
title('Reflection Coefficient vs. Electrical Length for Quarter-Wave Transformer');
grid on;