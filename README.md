# Electric Vehicle Cruise Control System using PI Controller

---

## Introduction

This project focuses on designing a cruise control system for an electric vehicle using MATLAB. The objective is to maintain a constant vehicle speed even under disturbances such as road slopes.

---

## Problem Statement

G(s) = 1 / (5s + 1)

Requirements:
- Steady-state error < 2%
- Overshoot < 5%
- Stable and smooth response
- Disturbance at t = 10 s

---

## System Model

The system is represented as:

5 dy/dt + y = u

Where:
- Input: Throttle control
- Output: Vehicle speed

---

## Controller Design

A PI controller is used:

u(t) = Kp * e + Ki ∫e dt

### Gains:
- Kp = 2
- Ki = 1

---

## Implementation

- Implemented using MATLAB
- Numerical method: ode45
- Step input applied
- Disturbance introduced at t = 10 s

---

## Results

The system maintains speed and recovers after disturbance.

![Response](response.png)

---

## Performance Metrics

| Parameter | Value |
|----------|------|
| Overshoot | ~3% |
| Settling Time | ~5 s |
| Steady-State Error | ~0% |

---

## Conclusion

The PI controller successfully maintains constant speed and ensures stable response under disturbance.

---
