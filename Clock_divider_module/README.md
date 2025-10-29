# Clock divider

## Overview
Clock divider is a simple clock divider module implemented in Verilog. The clock divider can be customized to fit any system clock and also select its idle state to either be low or high, with 0 being low and 1 being high. A round mode also allows for either round up or round down options if the clock half period is not divisible by the CYCLE_TIME. One key feature of the clock divider output signal is that the first change of state happens on the same clock edge as the enable signal, allowing for the immediate triggering of components.

---

## Pinout

| Signal                | Direction | Width | Description                         |
|-----------------------|-----------|-------|-------------------------------------|
| clk                   | Input     | 1     | System clock                        |
| enable                | Inupt     | 1     | Enable signal to start divider      |
| divider_clock_signal  | Output    | 1     | Output divided clock signal         |

---

## Parameters
| Name                   | Default | Description                                                |
|------------------------|---------|------------------------------------------------------------|
| CLOCK_CYCLE_TIME       | 0       | System clock period (ns)                                   |
| NEW_CLOCK_CYCLE_TIME   | 0       | Full divided clock period needed to be produced (ns)       |
| IDLE_STATE             | 0       | Mode selection for idle state: 0 for low, 1 for high       |
| ROUND_MODE             | 0       | Rounding mode selection: 0 for round down, 1 for round up  |
