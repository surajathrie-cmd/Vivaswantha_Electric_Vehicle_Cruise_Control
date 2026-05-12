% Electric Vehicle Cruise Control (No Toolbox)

clc;
clear;
close all;

% Time span
tspan = [0 30];

% Initial condition
y0 = 0;

% PI Controller gains
Kp = 1;
Ki = 0.5;

% Define ODE
odefun = @(t, y) cruise_eq(t, y, Kp, Ki);

% Solve ODE
[t, y] = ode45(odefun, tspan, y0);

% Plot result
figure;
plot(t, y, 'LineWidth', 2);
title('Cruise Control Response');
xlabel('Time (s)');
ylabel('Speed');
grid on;

% --- Function definition ---
function dydt = cruise_eq(t, y, Kp, Ki)
    % Desired speed (step input)
    r = 1;

    % Error
    e = r - y;

    % Integral (approximation)
    persistent integral_e
    if isempty(integral_e)
        integral_e = 0;
    end
    integral_e = integral_e + e*0.01;

    % PI controller
    u = Kp*e + Ki*integral_e;

    % Disturbance at t = 10
    if t >= 10
        d = -0.2;
    else
        d = 0;
    end

    % System equation: 5 dy/dt + y = u + d
    dydt = (u + d - y)/5;
end
