%% Write a MATLAB program to determine the cutoff frequency fc and phase constant β of the TEmn/TMmn mode of a rectangular waveguide having dimensions a and b (a > b) along x- and y- axis, respectively. The waveguide is filled with a medium with permeability μ and permittivity ε.

clc;
clear;

c = 3e8;

% User inputs for medium parameters, waveguide dimensions, and mode numbers
x = input('Enter permeability of the medium (μ): '); 
y = input('Enter permittivity of the medium (ε): '); 
m = input('Enter mode number m: '); 
n = input('Enter mode number n: '); 
a = input('Enter waveguide dimension a: '); 
b = input('Enter waveguide dimension b: '); 
f = input('Enter operating frequency f: '); 

% Calculating cutoff frequency f_c
f_c = (c / (2 * sqrt(x * y))) * (sqrt((m/a)^2 + (n/b)^2));
fprintf('The cutoff frequency is %.2f Hz\n', f_c);
% Checking if operating frequency is greater than cutoff frequency
if f <= f_c
    disp('Operating frequency is below cutoff frequency, no propagation occurs.');
else
% Calculate phase constant β
    z = 2 * pi * f;
    beta = (z*sqrt(x*y)/c)*sqrt(1-(f_c/f)^2);
    fprintf('The phase constant β is %.4f rad/m\n', beta);
end
