m = 1;       
k = 10;      
F0 = 1;      
x0 = 1;      
x_dot0 = 0;  

% Simulation time
t_final = 20; % Simulation time (s)

model = 'HW4_Q2';
load_system(model);

% Set parameters in Simulink model
set_param([model '/m Gain'], 'Gain', 'm');      % Set mass gain
set_param([model '/k Gain'], 'Gain', 'k');      % Set spring constant gain
set_param([model '/F0 Gain'], 'Gain', 'F0');    % Set Coulomb friction gain

% Set initial conditions
set_param([model '/Integrator'], 'InitialCondition', 'x_dot0');
set_param([model '/Integrator1'], 'InitialCondition', 'x0');

% Run simulation
out = sim(model, 'StopTime', num2str(t_final));

% Extract data
t = out.tout;          % Time vector
x = out.x.Data;        % Position
x_dot = out.x_dot.Data; % Velocity

% Plot phase portrait
figure;
plot(x, x_dot, 'b', 'LineWidth', 1.5);
xlabel('Position (x)');
ylabel('Velocity (\dot{x})');
title('Phase Portrait of Mass-Spring System with Coulomb Friction');
grid on;