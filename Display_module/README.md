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
reg clk;
reg [15:0] value;
wire seg;
wire an;

display #(
    .N(16)
) display_inst(
    .clk(clk),
    .value(value),
    .seg(seg),
    .an(an)
);
