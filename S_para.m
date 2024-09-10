%% The S-matrix of a three-port network is given below. Write a MATLAB program to determine if the network is a reciprocal and lossless network. Determine the return loss (RL) at port 1 when all other ports are terminated with matched loads, and the insertion loss (IL) between port 2 and port 3 when all other ports are terminated with matched loads.

close all;
clear;
clc;
S = [0.178*exp(1j*pi/2), 0.6*exp(1j*pi/4), 0.4*exp(1j*pi/4);
0.6*exp(1j*pi/4), 0, 0.3*exp(-1j*pi/4);
0.4*exp(1j*pi/4), 0.3*exp(-1j*pi/4), 0];
is_reciprocal = isequal(S, S.');
is_lossless = isequal((S' * S), eye(3));
RL = -20 * log10(abs(S(1,1)));
IL = -20 * log10(abs(S(2,3)));
disp(['Is the network reciprocal? ', num2str(is_reciprocal)]);
disp(['Is the network lossless? ', num2str(is_lossless)]);
disp(['Return Loss (RL) at port 1: ', num2str(RL), ' dB']);
disp(['Insertion Loss (IL) between port 2 and port 3: ', num2str(IL), ' dB'])