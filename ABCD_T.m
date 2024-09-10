%% Write a MATLAB program to determine the ABCD-matrix of the T-network. Determine if the network is a reciprocal and symmetrical network.
clc;
clear;
syms Z1 Z2 Y3;
%for impedance
ABCD1 = [1,Z1;0,1];
ABCD2 = [1,Z2;0,1];
%for admittance
ABCD3 = [1,0;Y3,1];
% Calculate ABCD parameters
ABCD = (ABCD1*ABCD3*ABCD2);
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