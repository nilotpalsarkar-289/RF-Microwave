%% Write a MATLAB program to plot the wave impedance of the TEmn and TMmn modes versus normalized frequency f/fc for a rectangular waveguide having dimensions a and b (a > b) along x- and y-axis, respectively, where f/fc varies from 0 to 2. The waveguide is filled with air medium.

close all;
clear;
clc;
a = input('Enter value for a (waveguide width in meters): ');
b = input('Enter value for b (waveguide height in meters): ');
mu_r = input('Enter value for relative permeability (mu_r): ');
eps_r = input('Enter value for relative permittivity (eps_r): ');
m = input('Enter value for mode number m: ');
n = input('Enter value for mode number n: ');
f = input('Enter operating frequency in Hz: ');
c = 3e8; 
fc = (c / (2 * sqrt(mu_r * eps_r))) * sqrt((m/a)^2 + (n/b)^2);
disp(['You entered a = ', num2str(a), ' meters']);
disp(['You entered b = ', num2str(b), ' meters']);
disp(['You entered mu_r = ', num2str(mu_r)]);
disp(['You entered eps_r = ', num2str(eps_r)]);
disp(['You entered m = ', num2str(m)]);
disp(['You entered n = ', num2str(n)]);
disp(['Operating frequency f = ', num2str(f/1e9), ' GHz']);
disp(['Calculated cutoff frequency fc = ', num2str(fc/1e9), ' GHz']);
if f > fc
    beta = (2 * pi * f / c) * sqrt(mu_r * eps_r) * sqrt(1 - (fc/f)^2);
    
    disp(['Calculated propagation constant beta = ', num2str(beta), ' rad/m']);
else
    disp('Propagation is not possible: Frequency is less than or equal to the cutoff frequency.');
end
mu0 = 4 * pi * 1e-7;  % Permeability of free space
epsilon0 = 8.854e-12; % Permittivity of free space
eta0 = sqrt(mu0 / epsilon0);  % Characteristic impedance of free space
disp(['Characteristic impedance of free space (eta0) = ', num2str(eta0), ' Ohms']);
fc = (c / 2) * sqrt((m/a)^2 + (n/b)^2);  
f_over_fc = linspace(0, 2, 1000);  % Generate normalized frequencies from 0 to 2
f = f_over_fc * fc;  % Actual frequency values corresponding to normalized frequency
Z_TE = zeros(1, length(f));  % Preallocate impedance array for TE mode
Z_TM = zeros(1, length(f));  % Preallocate impedance array for TM mode
for i = 1:length(f)
    if f_over_fc(i) > 1
        Z_TE(i) = eta0 / sqrt(1 - (fc / f(i))^2); 
        Z_TM(i) = eta0 * sqrt(1 - (fc / f(i))^2); 
    else
        Z_TE(i) = NaN;  % No propagation below cutoff frequency
        Z_TM(i) = NaN;
    end
end
figure;
hold on;
plot(f_over_fc, Z_TE, 'b-', 'LineWidth', 2); 
plot(f_over_fc, Z_TM, 'r--', 'LineWidth', 2); 
hold off;
xlabel('Normalized Frequency f/f_c');
ylabel('Wave Impedance (Ohms)');
title('Wave Impedance of TE and TM Modes vs Normalized Frequency');
legend('TE Mode', 'TM Mode');
grid on;
axis([0 2 0 1000]); 