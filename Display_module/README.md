# 7 Segment Display Driver

## Overview
The display driver is used to control a four-digit 7-segment display.

---

## Pinout

| Signal     | Direction | Width | Description                             |
|------------|-----------|-------|-----------------------------------------|
| clk        | Input     | 1     | System clock                            |
| value      | Inupt     | 1     | Enable signal to start divider          |
| seg        | Output    | 1     | Done indicator after the delay is over  |
| an         | Output    | 1     | Done indicator after the delay is over  |

---

## Parameters
| Name         | Default | Description              |
|--------------|---------|--------------------------|
| DELAY_PERIOD | 0       | Delay period (ns)        |
| CYCLE_TIME   | 10      | System clock period (ns) |
| ROUND_MODE   | 0       | Rounding mode selection  |

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
