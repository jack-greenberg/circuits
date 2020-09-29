close all; clear all;

loadspice("data/exp1/IdIV.txt");
loadspice("data/exp1/VdIV.txt");
loadspice("data/exp1/IdVI.txt");
loadspice("data/exp1/VdVI.txt");

f = fit(VdIV', IdIV', "exp1");

fig = figure;

% Theoretical
% Exponential fit of voltage-source current-measure: I(V)
V_th = [0.250:0.05:0.750];
semilogy(V_th, f.a.*exp(V_th.*f.b), "m-", "LineWidth", 2, "DisplayName", "Theoretical");
hold on;
% Experimental
semilogy(VdIV, IdIV, 'b.', "DisplayName", "IV", "MarkerSize", 8);
semilogy(VdVI, IdVI, 'kx', "DisplayName", "VI", "MarkerSize", 12);

legend("Location", "SouthEast", "FontSize", 12);
xlabel("Voltage (V)");
ylabel("Current (A)");

% r_d = diff(VdIV)./diff(IdIV);
grid on;
hold off;

saveas(fig, "exp1-semilog.eps");

% fig2 = figure;
% 
% loglog(IdIV(1:440), r_d, 'bo', "MarkerSize", 8, "DisplayName", "Experimental"); hold on;
% loglog(IdIV(1:440), (f.b.*IdIV(1:440)).^-1, "r-", "LineWidth", 2, "DisplayName", "Theoretical");
% xlabel("I_d");
% ylabel("R_d");
% legend("Location", "NorthEast", "FontSize", 12);
% 
% grid on;

% hold off;
% saveas(fig2, "exp2-loglog-brad.eps");
