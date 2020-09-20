close all; clear all;
loadspice("lab1-exp2.txt");

i_in = i1; clear i1;
i_out = I_out1; clear I_out1;

f = figure;
axis equal; hold on;

% Experimental (simulated)
plot(i_in, i_out, "b.", "DisplayName", "Current through 3 series resistors");

[first, last, m, b, n] = linefit(i_in, i_out, 5e-4);

% Best Fit
plot(i_in, m*i_in + b, 'r-', "DisplayName", "Best Fit");

legend("location", "NorthWest");
xlabel("Current In (A)");
ylabel("Current Out (A)");
gtext(sprintf("Slope: %f", m));

grid on;
hold off;
