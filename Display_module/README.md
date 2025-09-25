# 7 Segment Display Driver

## Overview
The display driver is used to control a four-digit 7-segment display.

---

## Pinout

| Signal     | Direction | Width | Description             |
|------------|-----------|-------|-------------------------|
| clk        | Input     | 1     | System clock            |
| value      | Inupt     | N     | Value being displayed   |
| seg        | Output    | 1     | Segment pattern         |
| an         | Output    | 1     | Digit being shown       |

---

## Parameters
| Name         | Default | Description                  |
|--------------|---------|------------------------------|
| N            | 0       | Bit size of the input value  |

---

## Sample Top Module
```verilog
reg clk = 1;
reg enable = 0;  //enable signal must only be triggered on the rising edge of the clock
wire done;
    
delay_timer #(
    .DELAY_PERIOD(500),
    .CYCLE_TIME(10),
    .ROUND_MODE(0)
) inst (
    .clk(clk),
    .enable(enable),
    .done(done)
);
