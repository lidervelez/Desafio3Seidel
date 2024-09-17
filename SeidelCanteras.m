A = [0.52 0.2 0.25;
     0.3  0.5 0.2;
     0.18 0.3 0.55];
b = [4800; 5810; 5690];

tol = 0.001;
max_iter = 100;

n = length(b);
x = zeros(n, 1);
iter = 0;

while iter < max_iter
    x_old = x;
    iter += 1;

    for i = 1:n
        sum = 0;
        for j = 1:n
            if j != i
                sum += A(i, j) * x(j);
            end
        end
        x(i) = (b(i) - sum) / A(i, i);
    end

    if norm(x - x_old, inf) < tol
        break;
    end
end

disp("Solución (x):");
disp(x);

disp("Número de iteraciones:");
disp(iter);

