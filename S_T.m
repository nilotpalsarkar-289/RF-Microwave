clc;
clear;
% Given impedances for the T-network
Z1 = 8.56 ; % Impedance Z1
Z3 = 141.8; % Admittance Y3
Z2 = 8.56; % Impedance Z2
Z0 = 50;
%for impedance
ABCD1 = [1,Z1;0,1];
ABCD2 = [1,Z2;0,1];
%for admittance
ABCD3 = [1,0;1/Z3,1];
% Calculate ABCD parameters
ABCD = ABCD1*ABCD3*ABCD2;
%% Write a MATLAB program to determine the S-matrix of the T-network. The network is matched with a characteristic impedance of Z0 = 50 Ω.
% Display the ABCD matrix
disp('ABCD matrix:');
disp(ABCD);
A=ABCD(1,1);
D=ABCD(2,2);
B=ABCD(1,2);
C=ABCD(2,1);
% S- Matrix
S11 = (A + B/Z0 - C*Z0 - D)/(A + B/Z0 + C*Z0 + D);
S12 = (2*(A*D - B*C))/(A + B/Z0 + C*Z0 + D);
S21 = (2)/(A + B/Z0 + C*Z0 + D);
S22 = (-A + B/Z0 - C*Z0 + D)/(A + B/Z0 + C*Z0 + D);
S = [S11,S12;S21,S22];
disp('S matrix:');
disp(S);