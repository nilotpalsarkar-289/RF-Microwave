%% Write a MATLAB program to determine the impedance and length (in cm) at the operating frequency f0 of the single-section quarter-wave transformer to match a real load ZL to a lossless transmission line with characteristic impedance Z0.
Z0 = 50;
ZL = 100;
f0 = 2e9;
c = 3e8;
Zq = sqrt(Z0*ZL);
lambda0 = c/f0;

length_q = lambda0/4;
length_q_cm = length_q*100;

fprintf('Impedance of quarter-wave transformer: %.2f Ohms\n',Zq);
fprintf('Length of quarter-wave transformer: %.2f cm\n',length_q_cm);
