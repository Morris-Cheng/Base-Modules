# Clock divider

## Overview
Clock divider is a simple clock divider module implemented in verilog. The clock divider can be customized to fit any clocks and produce the given clock periods.

---

## Pinout

| Signal                | Direction | Width | Description                         |
|-----------------------|-----------|-------|-------------------------------------|
| clk                   | Input     | 1     | System clock                        |
| enable                | Inupt     | 1     | Enable signal to start divider      |
| divider_clock_signal  | Output    | 1     | Output divided clock signal         |

---

## Parameters
| Name         | Default | Description                                  |
|--------------|---------|----------------------------------------------|
| CLOCK_PERIOD_| 0       | Divided clock period needed to be produced   |
| CYCLE_TIME   | 10      | System clock frequency (s)                   |

---

## Sample Top Module

```verilog
reg  clk = 0;
reg  enable = 0;
wire divider_clock_signal;
    
clock_divider #(
    .CLOCK_PERIOD(40)
)inst (
    .clk(clk),
    .enable(enable),
    .divided_clk_out(divider_clock_signal)
);