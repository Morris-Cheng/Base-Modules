# Pulse Generator

## Overview
Pulse generator is a verilog module that can create a single clock cycle pulse module. 

---

## Pinout

| Signal   | Direction | Width | Description                         |
|----------|-----------|-------|-------------------------------------|
| clk      | Input     | 1     | System clock                        |
| enable   | Inupt     | 1     | Enable signal to start divider      |
| trigger  | Output    | 1     | Output trigger signal               |

---

## Sample Top Module

```verilog
reg  clk = 0;
wire trigger;
reg enable = 0;
    
pulse inst(
    .clk(clk),
    .enable(enable),
    .trigger(trigger)
);
