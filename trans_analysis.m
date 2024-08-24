%% Write a MATLAB program to determine the input impedance, reflection coefficient, and VSWR of a lossless transmission line for a given characteristic impedance, load impedance, phase constant and length.

close all;
clear;
clc;
function transmissionLineAnalysis(Z0, ZL, beta, l)
transmissionLineAnalysis(Z0, ZL, beta, l);
Z0 = 50;
ZL = 100 + 50i;
beta = 2*pi/0.5;
l = 0.25;
Gamma_L = (ZL - Z0) / (ZL + Z0);
Zin = Z0 * (ZL + 1i*Z0*tan(beta*l)) / (Z0 + 1i*ZL*tan(beta*l));
Gamma_in = (Zin - Z0) / (Zin + Z0);
VSWR = (1 + abs(Gamma_L)) / (1 - abs(Gamma_L));
fprintf('Input Impedance (Zin): %.2f + %.2fi Ohms\n', real(Zin), imag(Zin));
fprintf('Reflection Coefficient (Gamma_L): %.2f + %.2fi\n', real(Gamma_L), imag(Gamma_L));
fprintf('Reflection Coefficient (Gamma_in): %.2f + %.2fi\n', real(Gamma_in), imag(Gamma_in));
fprintf('Voltage Standing Wave Ratio (VSWR): %.2f\n', VSWR);
end
