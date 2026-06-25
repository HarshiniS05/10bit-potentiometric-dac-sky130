# Block 1 — Notes: DAC Basics & Resistor-String Architecture

## What is a DAC

A Digital-to-Analog Converter takes an N-bit binary code and produces a
proportional analog voltage. For this project: N = 10, so there are 2^10 =
1024 possible digital codes, each mapping to one of 1024 distinct output
voltage levels.

## Resolution and LSB

- Levels = 2^10 = 1024
- LSB (Least Significant Bit, i.e. the voltage step size) =
  VREFH / 1024 = 3.3 / 1024 ≈ 3.22 mV

## Verified output values

| Code | Calculation | Output voltage |
|------|-------------|-----------------|
| 0    | (0/1024) × 3.3   | 0 V       |
| 1    | (1/1024) × 3.3   | 3.22 mV   |
| 512  | (512/1024) × 3.3 | 1.65 V    |
| 1023 | (1023/1024) × 3.3| 3.2968 V  |

## Resistor-string (potentiometric) architecture

```
VREFH
  |
  R
  |--- Tap 1023
  R
  |--- Tap ...
  R
  |--- Tap 1
  R
  |--- Tap 0
  |
VREFL
```

1024 equal resistors in series between VREFH and VREFL create 1024 evenly
spaced voltage taps. A digital code selects exactly one tap via a switch
network, routing that tap's voltage to the output.

## Why this matters (my own takeaway)

This architecture is monotonic by construction — resistors only add voltage
in one direction along the chain, so a higher code can never select a lower
voltage. That's a structural guarantee, not something that depends on
precise device matching, which is the main reason this topology was chosen
over R-2R or binary-weighted alternatives for this design.
