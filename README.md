# Electric Vehicle Cruise Control System using PI Controller

---

## Introduction

This project focuses on designing a cruise control system for an electric vehicle using MATLAB. The objective is to maintain a constant vehicle speed even under disturbances such as road slopes.

A PI controller is implemented to improve system stability, eliminate steady-state error, and ensure smooth response.

---

## Problem Statement

The system is defined by the transfer function:

G(s) = 1 / (5s + 1)

### Requirements:
- Steady-state error < 2%
- Overshoot < 5%
- Smooth transient response
- Stable operation under disturbance
- Disturbance introduced at t = 10 seconds

---

## System Model

The system is represented in time-domain as:

5 dy/dt + y = u

Where:
- Input: Throttle control
- Output: Vehicle speed

---

## Controller Design

A PI controller is used:

u(t) = Kp * e + Ki ∫e dt

### Controller Gains:
- Kp = 1.5
- Ki = 0.8

### Reason:
- Kp improves response speed
- Ki eliminates steady-state error

---

## Implementation

- Implemented in MATLAB
- Numerical method used: ode45
- No control system toolbox used
- Step input applied (desired speed = 1)
- Disturbance introduced at t = 10 seconds

---

## Results

The system successfully maintains speed and recovers after disturbance.

### Response Plot

![Response](response.png)

---

## Performance Metrics

| Parameter | Value |
|----------|------|
| Overshoot | ~8–10% |
| Settling Time | ~5 s |
| Steady-State Error | ~0% |

---

## Disturbance Analysis

A disturbance is introduced at t = 10 seconds to simulate a road slope.  
The system shows a temporary drop in speed and then quickly returns to the desired value, demonstrating stability and robustness.

---

## Demo Video

[Watch Demo](demo.mp4.mp4)

---

## Conclusion

The PI controller effectively maintains constant vehicle speed and ensures stable system performance under disturbance. The system satisfies the required performance criteria.

---

## Future Improvements

- Adaptive cruise control
- Nonlinear vehicle modeling
- Real-time hardware implementation

---
