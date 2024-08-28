%% Write a MATLAB program to determine the percent fractional bandwidth of a single-section quarter-wave transformer network where the maximum acceptable SWR is Sm.

Z0 = 50;
ZL = 100;
f0 = 2e9;
Sm = 1.5;
Zq = sqrt(Z0*ZL);
Gamma_max = (Sm-1)/(Sm+1);
f_over_f0 = linspace(0, 2, 1000);
Gamma = zeros(size(f_over_f0));
f_min = NaN;
f_max = NaN;

for i=1:length(f_over_f0)
    f = f_over_f0(i)*f0;
    beta_l = pi/2 * f_over_f0(i);
    Zin = Zq * (ZL+1j*Zq*tan(beta_l))/(Zq+1j*ZL*tan(beta_l));
    Gamma(i) = abs((Zin-Z0)/(Zin+Z0));
end
acceptable_range = (Gamma <= Gamma_max);

if any(acceptable_range)
    f_min = f0 * f_over_f0(find(acceptable_range, 1, 'first'));
    f_max = f0 * f_over_f0(find(acceptable_range, 1, 'last'));
    bandwidth = (f_max - f_min) / f0 * 100;
    fprintf('Percent Fractional Bandwidth: %.2f%%\n', bandwidth);
else
    fprintf('No acceptable bandwidth found within the normalized frequency range.\n');
end
figure;
plot(f_over_f0, Gamma, 'LineWidth', 2);
hold on;
yline(Gamma_max, 'r--', 'Maximum Acceptable Reflection Coefficient', 'Linewidth', 2);
xlabel('Normalized Frequency f/f_0');
ylabel('Magnitude of Reflection Coefficient |\Gamma|');
title('Reflection Coefficient vs. Normalized Frequency for Quarter-Wave Transformer');
grid on;
legend('Reflection Coefficient','Max Acceptable Reflection Coefficient');
hold off;