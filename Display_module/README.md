# 7 Segment Display Driver

## Overview
The display driver is used to control a four-digit 7-segment display.

---

## Pinout

| Signal     | Direction | Width | Description             |
|------------|-----------|-------|-------------------------|
| clk        | Input     | 1     | System clock            |
| value      | Inupt     | N     | Value being displayed   |
| seg        | Output    | 8     | Segment pattern         |
| an         | Output    | 4     | Digit being shown       |

---

## Parameters
| Name         | Default | Description                  |
|--------------|---------|------------------------------|
| N            | 0       | Bit size of the input value  |

---

## Sample Top Module
```verilog
reg         clk;
reg  [15:0] value;
wire [7:0]  seg;
wire [3:0]  an;

display #(
    .N(16)
) display_inst(
    .clk(clk),
    .value(value),
    .seg(seg),
    .an(an)
);
