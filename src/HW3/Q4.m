f =  @(t,x,k) [x(2); -x(1) + (5-k)*x(2)^3];

%Stable system (k=6)
K_stable = 6;
[t_stable, x_stable] = ode45(@(t,x) f(t,x,K_stable), [0 10], [1; 1]);

%Unstable system (k=4)
K_unstable = 4;
[t_unstable, x_unstable] = ode45(@(t,x) f(t,x,K_unstable), [0 10], [1; 1]);

%Marginally stale system (k=5)
K_marginal = 5;
[t_marginal, x_marginal] = ode45(@(t,x) f(t,x,K_marginal), [0 10], [1; 1]);

[x1, x2] = meshgrid(-2: 0.5:2, -2:0.5:2);

figure;
plot(x_stable(:, 1), x_stable(:, 2), 'LineWidth', 2);
hold on;
dx1_stable = x2;
dx2_stable = -x1 + (5 - K_stable)*x2.^3;
quiver(x1, x2, dx1_stable, dx2_stable, 'r');
xlabel('x_1');
ylabel('x_2');
title('Phase plane: Stable System K=6');
grid on;
axis([-2 2 -2 2]);

figure;
plot(x_unstable(:, 1), x_unstable(:, 2), 'LineWidth', 2);
hold on;
dx1_unstable = x2;
dx2_unstable = -x1 + (5 - K_unstable)*x2.^3;
quiver(x1, x2, dx1_unstable, dx2_unstable, 'r');
xlabel('x_1');
ylabel('x_2');
title('Phase plane: Unstable System K=4');
grid on;
axis([-2 2 -2 2]);

figure;
plot(x_marginal(:, 1), x_marginal(:, 2), 'LineWidth', 2);
hold on;
dx1_marginal = x2;
dx2_marginal = -x1 + (5 - K_unstable)*x2.^3;
quiver(x1, x2, dx1_marginal, dx2_marginal, 'r');
xlabel('x_1');
ylabel('x_2');
title('Phase plane: Marginally Stable System K=5');
grid on;
axis([-2 2 -2 2]);