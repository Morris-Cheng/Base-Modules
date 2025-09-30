# UART Transmitter ('uart_tx')

## Overview
uart_tx is a simple Verilog UART transmitter module.
It takes in an eight-bit value and sends it to the computer.

---

## Pinout

| Signal      | Direction | Width | Description                         |
|-------------|-----------|-------|-------------------------------------|
| clk         | Input     | 1     | System clock                        |
| i_send      | Input     | 1     | Send signal                         |
| i_data      | Input     | 8     | Data byte to send                   |
| o_tx        | Input     | 1     | TX output                           |
| o_busy      | Output    | 1     | TX line busy signal                 |

---

## Parameters
| Name       | Default | Description               |
|------------|---------|---------------------------|
| BAUD_RATE  | 115200  | UART baud rate (bps)      |
| CLK_FREQ   | 100e6   | System clock frequency Hz |

---

## Sample Top Module

```verilog
// Example instantiation for a 16-bit transmission module
module top_module(
        input   wire clk,
        output  wire uart_tx
    );
    
    //tx variables
    reg [1:0] state = 0;            //states of the tx module
    reg [7:0]  out_data;            //data being sent back to the PC
    reg        send_pulse = 0;      //sending pulse
    reg [15:0] value_being_sent = 0;
    wire       busy;                //busy signal of the tx line
    
    uart_tx uart_tx_inst(
        .clk(clk), 
        .i_send(send_pulse), 
        .i_data(out_data), 
        .o_tx(uart_tx), 
        .o_busy(busy)
    );
    
    //tx block used to send data back to the computer
    always @(posedge clk) begin
        send_pulse <= 0;
        case(state)
            0: if (!busy) begin
                out_data <= 8'hFF;
                send_pulse <= 1; 
                state <= 1;
            end
            1: if (!busy) begin
                out_data <= value_being_sent[7:0]; //forms the low byte that's being sent first
                send_pulse <= 1; 
                state <= 2;
            end
            2: if (!busy) begin
                out_data <= value_being_sent[15:8]; //forms the high byte that's being sent next
                send_pulse <= 1; 
                state <= 0;
            end
        endcase
    end
endmodule
