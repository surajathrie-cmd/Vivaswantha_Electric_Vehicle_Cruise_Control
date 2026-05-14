% Electric Vehicle Cruise Control (Final Stable Version)

clc;
clear;
close all;

% Simulation time
tspan = [0 30];

% Initial conditions
y0 = 0;          % initial speed
I0 = 0;          % initial integral error

% Controller gains (tuned)
Kp = 1.5;
Ki = 0.8;

% Solve ODE system
[t, X] = ode45(@(t, X) cruise_system(t, X, Kp, Ki), tspan, [y0 I0]);

% Extract variables
y = X(:,1);   % speed

% Plot result
figure;
plot(t, y, 'LineWidth', 2);
title('Cruise Control Response');
xlabel('Time (s)');
ylabel('Speed');
grid on;

% ---------------- FUNCTION ----------------
function dXdt = cruise_system(t, X, Kp, Ki)

    y = X(1);     % current speed
    I = X(2);     % integral of error

    % Desired speed (step input)
    r = 1;

    % Error
    e = r - y;

    % Disturbance at t = 10 sec
    if t >= 10
        d = -0.2;
    else
        d = 0;
    end

    % PI controller
    u = Kp * e + Ki * I;

    % System equation: 5 dy/dt + y = u + d
    dydt = (u + d - y) / 5;

    % Integral of error
    dIdt = e;

    % Return derivatives
    dXdt = [dydt; dIdt];
end
% --- Controller Comparison: P vs PI ---

Kp_only = 1.5;

[t1, y1] = ode45(@(t, y) cruise_P(t, y, Kp_only), tspan, y0);

figure;
plot(t, y, 'LineWidth', 2); hold on;
plot(t1, y1, '--', 'LineWidth', 2);
legend('PI Controller', 'P Controller');
title('Controller Comparison');
xlabel('Time (s)');
ylabel('Speed');
grid on;

% -------- P Controller Function --------
function dydt = cruise_P(t, y, Kp)

    r = 1;
    e = r - y;

    if t >= 10
        d = -0.2;
    else
        d = 0;
    end

    u = Kp * e;

    dydt = (u + d - y) / 5;
end
