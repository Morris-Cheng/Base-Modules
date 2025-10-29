# Delay Timer

## Overview
Delay timer is a simple verilog module that can delay a given amount of time before flipping the trigger signal. The delay timer can be triggered with a rising edge from the enable signal, meaning both a hold signal and a pulse can be used. It also supports a zero delay option, meaning it would immediately pull done high after enable is true. A rounding option is added so that delay periods that are not divisible by the CYCLE_TIME can choose to either be rounded up or rounded down, depending on the needs.

---

## Pinout

| Signal     | Direction | Width | Description                             |
|------------|-----------|-------|-----------------------------------------|
| clk        | Input     | 1     | System clock                            |
| enable     | Inupt     | 1     | Enable signal to start divider          |
| done       | Output    | 1     | Done indicator after the delay is over  |

---

## Parameters
| Name             | Default | Description              |
|------------------|---------|--------------------------|
| CLOCK_CYCLE_TIME | 0       | System clock period (ns) |
| DELAY_PERIOD     | 0       | Delay period (ns)        |
| ROUND_MODE       | 0       | Rounding mode selection  |
