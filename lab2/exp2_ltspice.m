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
legend("FontSize", 12, "Location", "Northwest"); grid on; hold off;
saveas(fig, "docs/images/exp2-VdIV.eps");


fig2 = figure;

semilogy(v_in, IinIV(1,:), "r.", "DisplayName", "R_1 = 100\Omega", "MarkerSize", 10); hold on;
semilogy(v_in, IinIV(2,:), "g.", "DisplayName", "R_2 = 1k\Omega", "MarkerSize", 10);
semilogy(v_in, IinIV(3,:), "b.", "DisplayName", "R_3 = 10k\Omega", "MarkerSize", 10);

xlabel("Voltage In (V)");
ylabel("Current into circuit (A)")
legend("FontSize", 12, "Location", "Northwest"); grid on; hold off;
saveas(fig2, "docs/images/exp2-IinIV.eps");


fig3 = figure;

subplot(3, 1, 1);
plot(v_in, 1e3.*IdIV(1,:), "r.", "DisplayName", "R_1 = 100\Omega", "MarkerSize", 10); hold on;
xlabel("V_{in} (V), R=100\Omega");
ylabel("I_{in} (mA)");
ylim([-2.5 25]);

subplot(3, 1, 2);
plot(v_in, 1e3.*IdIV(2,:), "g.", "DisplayName", "R_2 = 1k\Omega", "MarkerSize", 10);
xlabel("V_{in} (V), R=1k\Omega");
ylabel("I_{in} (mA)");
ylim([-.25 2.5]);

subplot(3, 1, 3);
plot(v_in, 1e3.*IdIV(3,:), "b.", "DisplayName", "R_3 = 10k\Omega", "MarkerSize", 10);
xlabel("V_{in} (V), R=10k\Omega");
ylabel("I_{in} (mA)");
ylim([-.025 .25]);

saveas(fig3, "docs/images/exp2-IdIV.eps");
