%% An L-section impedance matching network is inserted between a transmission line with a characteristic impedance Z0 and a load impedance ZL=RL+jXL. The frequency of operation is f0. Write a MATLAB program to determine the values of the lumped elements L and C. Note that there are two possible solutions.

% L-section Impedance Matching Network Calculation
close all;
clear;
clc;

% Given values
Zo = 50;      % Characteristic impedance of the transmission line (Ohms)
Xl = 10;      % Reactive part of the load impedance (Ohms)
Rl = 10;      % Resistive part of the load impedance (Ohms)
f = 2e9;      % Operating frequency (Hz)

% Initialize variables
X1 = 0;
B1 = 0;
X2 = 0;
B2 = 0;

% Calculate for different cases based on the relation between Rl and Zo
if Rl > Zo
    Zl = Rl + 1i*Xl;
    B1 = (Xl + sqrt(Rl/Zo) * sqrt(Rl^2 + Xl^2 - Zo*Rl)) / (Rl^2 + Xl^2);
    B2 = (Xl - sqrt(Rl/Zo) * sqrt(Rl^2 + Xl^2 - Zo*Rl)) / (Rl^2 + Xl^2);
    X1 = 1/B1 + (Xl*Zo)/Rl - Zo/(B1*Rl);
    X2 = 1/B2 + (Xl*Zo)/Rl - Zo/(B2*Rl);
elseif Rl < Zo
    Zl = Rl + 1i*Xl;
    X1 = sqrt(Rl * (Zo - Rl)) - Xl;
    X2 = -sqrt(Rl * (Zo - Rl)) - Xl;
    B1 = sqrt((Zo - Rl)/Rl) / Zo;
    B2 = -sqrt((Zo - Rl)/Rl) / Zo;
end

% Initialize inductance and capacitance values
L1 = 0;
C1 = 0;
L2 = 0;
C2 = 0;

% Determine L and C values for both possible solutions
if B1 >= 0
    C1 = B1/(2*pi*f);
else
    L1 = -1/(2*pi*f*B1);
end

if X1 >= 0
    L1 = X1/(2*pi*f);
else
    C1 = -1/(2*pi*f*X1);
end

if B2 >= 0
    C2 = B2/(2*pi*f);
else
    L2 = -1/(2*pi*f*B2);
end

if X2 >= 0
    L2 = X2/(2*pi*f);
else
    C2 = -1/(2*pi*f*X2);
end

% Display results
fprintf('For series L and parallel C:\n');
disp(['Inductance, L1 = ', num2str(L1), ' H']);
disp(['Capacitance, C1 = ', num2str(C1), ' F']);

fprintf('For parallel L and series C:\n');
disp(['Inductance, L2 = ', num2str(L2), ' H']);
disp(['Capacitance, C2 = ', num2str(C2), ' F']);
