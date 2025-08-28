f = @(t, x, k1, k2) [x(1) + 2*x(2); 3*x(2) + 3*(x(1)+2*x(2))^3-k1*(x(1)+2*x(2))-k2*(x(1)+2*x(2))^3];

%Stable system:
k1_stable = 5; k2_stable = 4;
[t_stable, x_stable] = ode45(@(t,x) f(t,x, k1_stable, k2_stable), [0 200], [1; 1]);

%Unstable system:
k1_unstable = 0; k2_unstable = 2;
[t_unstable, x_unstable] = ode45(@(t,x) f(t,x, k1_unstable, k2_unstable), [0 20], [1; 1]);

figure;
plot(x_stable(:, 1), x_stable(:, 2), 'LineWidth', 2);
xlabel('x_1');
ylabel('x_2');
title('Phase Plane: Stable System (k_1=5; k_2=4)');
grid on;

figure;
plot(x_unstable(:, 1), x_unstable(:, 2), 'LineWidth', 2);
xlabel('x_1');
ylabel('x_2');
title('Phase Plane: Unstable System (k_1=0; k_2=2)');
grid on;
