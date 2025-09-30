# Clock divider

## Overview
Clock divider is a simple clock divider module implemented in verilog. The clock divider can be customized to fit any system clock and also select its idle state to either be low or high, with 0 being low and 1 being high. A round mode also allows for either round up or round down options if the clock half period is not divisible by the CYCLE_TIME. 

---

## Pinout

| Signal                | Direction | Width | Description                         |
|-----------------------|-----------|-------|-------------------------------------|
| clk                   | Input     | 1     | System clock                        |
| enable                | Inupt     | 1     | Enable signal to start divider      |
| divider_clock_signal  | Output    | 1     | Output divided clock signal         |

---

## Parameters
| Name         | Default | Description                                            |
|--------------|---------|--------------------------------------------------------|
| CLOCK_PERIOD | 0       | Divided clock period needed to be produced (ns)        |
| CYCLE_TIME   | 10      | System clock period (ns)                               |
| MODE         | 0       | Mode selection for idle state: 0 for low, 1 for high   |
| ROUND_MODE   | 0       | Rounding mode selection                                |

---

## Sample Top Module

```verilog
reg  clk = 0;
reg  enable = 0;
wire divider_clock_signal;
    
clock_divider #(
    .CLOCK_PERIOD(40),  //Wait for 40 ns
    .CYCLE_TIME(10),    //100MHz clock
    .MODE(0),           //Idle state set to low
    .ROUND_MODE(0)      //Set to round down
)inst (
    .clk(clk),
    .enable(enable),
    .divided_clk_out(divider_clock_signal)
);
