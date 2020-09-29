close all; clear all;
load("./data/brad/lab2exp1.mat");

f = fit(VdIV', IdIV', "exp1");

fig = figure;

% Theoretical
% Exponential fit of voltage-source current-measure: I(V)
V_th = [.3:0.05:.8];
semilogy(V_th, f.a.*exp(V_th.*f.b), "m-", "LineWidth", 2, "DisplayName", "Theoretical");

hold on;

% Experimental
semilogy(VdIV, IdIV, 'bo', "DisplayName", "IV", "MarkerSize", 8);
semilogy(VdVI, IdVI, 'rx', "DisplayName", "VI", "MarkerSize", 8);

legend("Location", "SouthEast", "FontSize", 12);
xlabel("Voltage (V)");
ylabel("Current (A)");

r_d = diff(VdIV)./diff(IdIV);

hold off;
saveas(fig, "exp2-semilog-brad.eps");

fig2 = figure;

loglog(IdIV(1:85), r_d, 'bo', "MarkerSize", 8, "DisplayName", "Experimental"); hold on;
loglog(IdIV(1:85), (f.b.*IdIV(1:85)).^-1, "r-", "LineWidth", 2, "DisplayName", "Theoretical");
xlabel("I_d");
ylabel("R_d");
legend("Location", "NorthEast", "FontSize", 12);

hold off;
saveas(fig2, "exp2-loglog-brad.eps");
