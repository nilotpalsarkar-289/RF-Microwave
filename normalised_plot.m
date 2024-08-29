%% Write a MATLAB program to plot the normalized input impedance of a lossless transmission line terminated with a short-circuit and open-circuit.
beta_l = linspace(0, 2*pi, 1000);

% Normalized input impedance for a short-circuited termination
Zin_short = 1i * tan(beta_l);

% Normalized input impedance for an open-circuited termination
Zin_open = -1i * cot(beta_l);

% Plotting the results
figure;
hold on;

% Plot the imaginary part of the short-circuit case
plot(beta_l, imag(Zin_short), 'b', 'LineWidth', 1.5);

% Plot the imaginary part of the open-circuit case
plot(beta_l, imag(Zin_open), 'r', 'LineWidth', 1.5);

% Set y-axis limits to better visualize the impedance
ylim([-10 10]);

% Labels and title
xlabel('\beta d (radians)');
ylabel('Imaginary Part of Normalized Input Impedance');
title('Normalized Input Impedance of a Lossless Transmission Line');
legend('Short-circuit', 'Open-circuit', 'Location', 'Best');
grid on;
hold off;
