close all; clear all;
loadspice("data/exp3.txt");

v_in = v1;

% I1 = I1 * 1e6;
% I2 = I2 * 1e6;
% I3 = I3 * 1e6;
% I4 = I4 * 1e6;
 
S1 = [I1(1,1) I2(1,1) I3(1,1) I4(1,1)]; % Different branches, same voltage
S2 = [I1(1,2) I2(1,2) I3(1,2) I4(1,2)];
S3 = [I1(1,3) I2(1,3) I3(1,3) I4(1,3)];

f = figure;

% Experimental (simulated)
semilogy([1:4], S1, "r.", "DisplayName", "Voltage = 1V", "MarkerSize", 12);
hold on;
semilogy([1:4], S2, "g.", "DisplayName", "Voltage = 2V", "MarkerSize", 12);
semilogy([1:4], S3, "b.", "DisplayName", "Voltage = 3V", "MarkerSize", 12);

colors = ["r-" "g-" "b-"];
for v=1:3
    i = [];
    for b=1:4
        i = [i; ((.5)^(b)) * (v/10000)];
    end
    plot([1:4], i, colors(v), "DisplayName", sprintf("Theoretical (V = %dV)", v)); % "HandleVisibility", "off");
end

legend("location", "NorthEast");
xlabel("Branch");
ylabel("Current Out (A)");

xticks([1 2 3 4]);
yticks([1e-5 1e-4]);

xlim([.5 4.5]);
ylim([5e-6 2e-4]);

set(gca, 'YGrid', 'on', 'XGrid', 'off')
hold off;
