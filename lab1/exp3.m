close all; clear all;
loadspice("lab1-exp3.txt");

v_in = v1;
I2 = V2 * 1e6;
I3 = V3 * 1e6;
I4 = V4 * 1e6;
I5 = V5 * 1e6;

f = figure;

% Experimental (simulated)
semilogy([1:5], I2(238,:), "r.", "DisplayName", "Current through branch 1");
hold on;
semilogy(v_in, I3(238,:), "g.", "DisplayName", "Current through branch 2");
semilogy(v_in, I4(238,:), "b.", "DisplayName", "Current through branch 3");
semilogy(v_in, I5(238,:), "m.", "DisplayName", "Current through branch 4");

% disp(v_in);
% disp(I2(238,:));
[first, last, m_2, b_2, n] = linefit(v_in, I2(238,:), 5e-4);
[first, last, m_3, b_3, n] = linefit(v_in, I3(238,:), 5e-4);
[first, last, m_4, b_4, n] = linefit(v_in, I4(238,:), 5e-4);
[first, last, m_5, b_5, n] = linefit(v_in, I5(238,:), 5e-4);

% Best Fit
semilogy(v_in, m_2*v_in + b_2, 'r-', "DisplayName", "Best Fit (Branch 1)");
semilogy(v_in, m_3*v_in + b_3, 'g-', "DisplayName", "Best Fit (Branch 2)");
semilogy(v_in, m_4*v_in + b_4, 'b-', "DisplayName", "Best Fit (Branch 3)");
semilogy(v_in, m_5*v_in + b_5, 'm-', "DisplayName", "Best Fit (Branch 4)");

legend("location", "NorthWest");
title("R-2R Ladder Network DC-DC Sweep");
xlabel("Voltage In (V)");
ylabel("Current Out (\mu A)");
% gtext(sprintf("Slope: %f", m_1));
% gtext(sprintf("Slope: %f", m_2));

grid on;
hold off;

% ratio = [];
% for i=1:size(v_out, 1)
%     [first, last, m, b, n] = linefit(i1, v_out(i,:), 5e-4);
%     ratio = [ratio; m];
% end
% 
% f2 = figure;
% hold on;
% histogram(ratio);
% set(gca, "xtick", [0.3738:.0001:.376]);
% xtickangle(45)
% xlabel("Voltage Divider Ratio");
% ylabel("Count")
% title("Histogram Plot of Monte Carlo Simulation Results")
% hold off;
