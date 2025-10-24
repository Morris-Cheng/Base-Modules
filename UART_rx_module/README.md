# UART Receiver ('uart_rx')

## Overview
uart_tx is a simple Verilog UART receiver module.
It takes a 16-bit value from the computer and reconstructs a 16-bit register.

---

## Pinout

| Signal      | Direction | Width | Description                         |
|-------------|-----------|-------|-------------------------------------|
| clk         | Input     | 1     | System clock                        |
| i_rx        | Input     | 1     | Input signal                        |
| o_data      | Output    | 16    | 16-bit value received               |
| o_ready     | Output    | 1     | RX busy signal                      |

---

## Parameters
| Name       | Default | Description               |
|------------|---------|---------------------------|
| BAUD       | 115200  | UART baud rate (bps)      |
| CLK_FREQ   | 100e6   | System clock frequency Hz |

---

## Sample Top Module

```verilog
// Example instantiation for a 16-bit receiving module
//rx variables
wire [15:0] rx_value; //input rx value from the computer
wire        rx_ready; //ready signal from the rx module
    
uart_rx uart_rx_inst ( //declare a rx instance called uart_rx_inst
    .clk(clk),
    .i_rx(uart_rx),
    .o_data(rx_value),
    .o_ready(rx_ready)
);
        
//final measured height after some logic
reg signed [15:0] received_value; //this can be either signed or unsigned, depends on the value being sent from the computer
    
//updating the measured height with either the user input or the control signal
always @(posedge clk) begin
    if(rx_ready) begin
		received_value <= rx_value;
    end
end
