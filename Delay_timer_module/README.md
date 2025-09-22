# Delay Timer

## Overview
Delay timer is a simple verilog module that can delay a given amount of time before flipping the trigger signal.

---

## Pinout

| Signal     | Direction | Width | Description                           |
|------------|-----------|-------|---------------------------------------|
| clk        | Input     | 1     | System clock                          |
| enable     | Inupt     | 1     | Enable signal to start divider        |
| done       | Output    | 1     | Done trigger after the delay is over  |

---

## Parameters
| Name         | Default | Description                 |
|--------------|---------|-----------------------------|
| DELAY_PERIOD_| 0       | Delay period                |
| CYCLE_TIME   | 10      | System clock frequency (s)  |

---

## Sample Top Module
```verilog
reg clk = 1;
reg enable = 0;  //enable signal must only be triggered on the rising edge of the clock
wire done;
    
delay_timer #(
    .DELAY_PERIOD(500)
) inst (
    .clk(clk),
    .enable(enable),
    .done(done)
);