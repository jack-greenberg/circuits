close all; clear all;
loadspice("./exp1/lab1-exp1.txt");

% Rename v1 to v_int
v_in = v1; clear v1;

f = figure;
hold on;

% Experimental (simulated)
plot(v_in, v_out(310,:), "b.", "DisplayName", "Experimental");

[first, last, m, b, n] = linefit(v_in, v_out(310,:), 5e-4);

% Best Fit
plot(v_in, m*v_in + b, 'r-', "DisplayName", "Best Fit");

legend("location", "NorthWest");
xlabel("Voltage In (V)");
ylabel("Voltage Out (V)");
gtext(sprintf("Slope: %f", m));

grid on;
hold off;

ratio = [];
for i=1:size(v_out, 1)
    [first, last, m, b, n] = linefit(v_in, v_out(i,:), 5e-4);
    ratio = [ratio; m];
end

f2 = figure;
hold on;
histogram(ratio);
set(gca, "xtick", [0.3738:.0001:.376]);
xtickangle(45)
xlabel("Voltage Divider Ratio");
ylabel("Count")
title("Histogram Plot of Monte Carlo Simulation Results")
hold off;
