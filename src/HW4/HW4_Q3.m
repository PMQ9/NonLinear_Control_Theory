m = 1;
k = 10;
F0 = 1;

t_final = 20; 

model = 'HW4_Q2';
load_system(model);

set_param([model '/m Gain'], 'Gain', 'm'); 
set_param([model '/k Gain'], 'Gain', 'k');
set_param([model '/F0 Gain'], 'Gain', 'F0');

initial_conditions = [
    1.0, 0.0;  % Case 1: x0 = 1.0, x_dot0 = 0.0
    2.0, 0.0;  % Case 2: x0 = 2.0, x_dot0 = 0.0
    3.0, 0.0;  % Case 3: x0 = 3.0, x_dot0 = 0.0
    1.0, 1.0;  % Case 4: x0 = 1.0, x_dot0 = 1.0
    2.0, -1.0; % Case 5: x0 = 2.0, x_dot0 = -1.0
];

line_styles = {'-', '--', ':', '-.', '-'};

figure;
hold on;

for i = 1:size(initial_conditions, 1)
    x0 = initial_conditions(i, 1);
    x_dot0 = initial_conditions(i, 2);
    set_param([model '/Integrator'], 'InitialCondition', num2str(x_dot0));
    set_param([model '/Integrator1'], 'InitialCondition', num2str(x0));
    out = sim(model, 'StopTime', num2str(t_final));
    t = out.tout;          % Time vector
    x = out.x.Data;        % Position
    plot(t, x, 'k', 'LineWidth', 1.5, 'LineStyle', line_styles{i}, ...
        'DisplayName', sprintf('x0 = %.1f, x\\_dot0 = %.1f', x0, x_dot0));
end

xlabel('Time (s)');
ylabel('Position (x)');
title('Position vs. Time for Different Initial Conditions');
legend('show');
grid on;
hold off;