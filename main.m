% Electric Vehicle Cruise Control

clc;
clear;
close all;

% System Model
G = tf(1, [5 1]);

% PI Controller
Kp = 1;
Ki = 0.5;
C = pid(Kp, Ki);

% Closed Loop System
T = feedback(C*G, 1);

% Step Response
figure;
step(T);
title('Step Response of Cruise Control System');
grid on;

% Time vector
t = 0:0.1:30;
u = ones(size(t));

% Disturbance Simulation
[y, t] = lsim(T, u, t);

figure;
plot(t, y);
title('Response with Disturbance');
xlabel('Time (s)');
ylabel('Speed');
grid on;
