close all; clear all;

loadspice("data/exp2/IdIV.txt");
loadspice("data/exp2/VdIV.txt");
loadspice("data/exp2/IinIV.txt");

fig = figure;

plot(v_in, VdIV(1,:), "r.", "DisplayName", "R_1 = 100\Omega", "MarkerSize", 10);
hold on;
plot(v_in, VdIV(2,:), "g.", "DisplayName", "R_2 = 1k\Omega", "MarkerSize", 10);
plot(v_in, VdIV(3,:), "b.", "DisplayName", "R_3 = 10k\Omega", "MarkerSize", 10);

xlabel("Voltage In (V)");
ylabel("Voltage across Diode (V)")
legend("FontSize", 12); grid on; hold off;
saveas(fig, "docs/images/exp2-VdIV.eps");


fig2 = figure;

semilogy(v_in, IinIV, "r.", "DisplayName", "I_{in} (A)"); hold on;

xlabel("Voltage In (V)");
ylabel("Current into circuit (A)")
legend("FontSize", 12); grid on; hold off;
saveas(fig2, "docs/images/exp2-IinIV.eps");


fig3 = figure;

plot(v_in, IdIV(1,:), "r.", "DisplayName", "R_1 = 100\Omega", "MarkerSize", 10); hold on;
plot(v_in, IdIV(2,:), "g.", "DisplayName", "R_2 = 1k\Omega", "MarkerSize", 10);
plot(v_in, IdIV(3,:), "b.", "DisplayName", "R_3 = 10k\Omega", "MarkerSize", 10);

xlabel("Voltage In (V)");
ylabel("Current across Diode (I)")
legend("FontSize", 12); grid on; hold off;
saveas(fig3, "docs/images/exp2-IdIV.eps");
