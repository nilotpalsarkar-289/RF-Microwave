%% Write a MATLAB program to determine the ABCD-matrix of the Π-network. Determine if the network is a reciprocal and symmetrical network.
clc;
clear;
% Given impedances for the T-network
%Y1 = 2; % Admittance Y1
%Y2 = 3; % Admittance Y2
%Z3 = 5; % Impedance Z3
syms Y1 Y2 Z3;
%for impedance
A1=1;
B1=Z3;
C1=0;
D1=1;
ABCD1 = [A1,B1;C1,D1];
%for admittance
A2=1;
B2=0;
C2=Y1;
C3=Y2;
D2=1;
ABCD2 = [A2,B2;C2,D2];
ABCD3 = [A2,B2;C3,D2];
% Calculate ABCD parameters
ABCD = ABCD2*ABCD1*ABCD3;
% Display the ABCD matrix
disp('ABCD matrix:');
disp(ABCD);
% Check if the network is reciprocal
isReciprocal = simplify(ABCD(1,1)*ABCD(2,2) - ABCD(1,2)*ABCD(2,1) == 1);
if isReciprocal
disp('The network is reciprocal.');
else
disp('The network is not reciprocal.');
end
% Check if the network is symmetrical
isSymmetrical = simplify(ABCD(1,1) == ABCD(2,2));
if isSymmetrical
disp('The network is symmetrical.');
else
disp('The network is not symmetrical.');
end