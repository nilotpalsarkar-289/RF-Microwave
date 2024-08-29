%% A short-circuited single-stub impedance matching network is inserted between a transmission line with a characteristic impedance Z0 and a load impedance ZL=RL+jXL (RL not equal to Z0). Write a MATLAB program to determine the stub distance d from the load and the stub length l. Note that there are two possible solutions.

% Clear previous data and close all figures
close all;
clear;

% Given values
z_o = 75;                % Characteristic impedance of the transmission line (Ohms)
z_l = 100 + 1i*80;       % Load impedance (Ohms)

% Extract real and imaginary parts of the load impedance
r_l = real(z_l);
x_l = imag(z_l);

% Calculate t_1 and t_2 for the matching network
t_1 = (x_l + sqrt((r_l * ((z_o - r_l)^2 + x_l^2)) / z_o)) / (r_l - z_o);
t_2 = (x_l - sqrt((r_l * ((z_o - r_l)^2 + x_l^2)) / z_o)) / (r_l - z_o);

% Calculate electrical lengths d_1 and d_2
if t_1 >= 0
    d_1 = atan(t_1) / (2 * pi);
else
    d_1 = (atan(t_1) / (2 * pi)) + 0.5;
end

if t_2 >= 0
    d_2 = atan(t_2) / (2 * pi);
else
    d_2 = (atan(t_2) / (2 * pi)) + 0.5;
end

% Calculate susceptances B_1 and B_2
B_1 = (r_l^2 * t_1 - (z_o - x_l * t_1) * (x_l + z_o * t_1)) / ...
      (z_o * (r_l^2 + (x_l + z_o * t_1)^2));
B_2 = (r_l^2 * t_2 - (z_o - x_l * t_2) * (x_l + z_o * t_2)) / ...
      (z_o * (r_l^2 + (x_l + z_o * t_2)^2));

% Calculate electrical lengths l_1 and l_2 for the stub
l_1 = atan(1 / (z_o * B_1)) / (2 * pi);
l_2 = atan(1 / (z_o * B_2)) / (2 * pi);

% Adjust lengths if negative
if l_1 < 0
    l_1 = l_1 + 0.5;
end
if l_2 < 0
    l_2 = l_2 + 0.5;
end

% Display results
fprintf("\n\tSHORT-CIRCUITED SINGLE SHUNT STUB MATCHING PARAMETERS\n");
fprintf("\nFirst Solution: d = %.4f * lambda, l = %.4f * lambda", d_1, l_1);
fprintf("\nSecond Solution: d = %.4f * lambda, l = %.4f * lambda\n", d_2, l_2);
