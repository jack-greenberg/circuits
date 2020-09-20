loadspice("lab1-exp1.txt");

% v1, v_out

for i=1:size(v_out, 1)
    v = v_out(i,:);

    (first, last, m, b, n) = linefit(v, 5e-4);
    disp(m);
end
