# FIFO Buffer

## Overview
FIFO is a data buffer that allows data to be written into and read out of at different clock speeds. However, this design is only for synchronous buffers.

---

## Pinout

| Signal      | Direction | Width       | Description             |
|-------------|-----------|-------------|-------------------------|
| clk         | Input     | 1           | System clock            |
| reset       | Input     | 1           | Reset signal            |
| wr_signal   | Input     | 1           | Write enable signal     |
| rd_signal   | Input     | 1           | Read enable signal      |
| write_data  | Input     | user input  | Write data              |
| read_data   | Output    | user input  | Read data               |
| empty_out   | Output    | 1           | Empty signal            |
| full_out    | Output    | 1           | Full signal             |

---

## Parameters
| Name         | Default | Description                                                         |
|--------------|---------|---------------------------------------------------------------------|
| BUFFER_WIDTH | 0       | Number of entries the buffer can hold (should be some power of two) |
| ADDR_WIDTH   | 0       | Bit size of each index                                              |

---

## Sample Top Module

```verilog
// Example instantiation for a 16-bit transmission module
reg         wr_signal  = 0;
reg         rd_signal  = 0;
reg  [15:0] write_data = 0;
wire [15:0] read_data;
wire        empty;
wire        full;

fifo #(
    .BUFFER_WIDTH(2), //has to be a power of two ideally
    .ADDR_WIDTH(16)
) inst(
    .clk(clk),
    .reset(reset),
    .wr_signal(wr_signal),
    .rd_signal(rd_signal),
    .write_data(write_data),
    .read_data(read_data),
    .empty_out(empty),
    .full_out(full)
);

//Sample write block
always @(posedge clk) begin
    if(~full) begin
        wr_signal <= 1;
        write_data <= write_data + 1;
        if(write_data >= 10) begin
        write_data <= 0;
    end
    end
    else begin
        wr_signal <= 0;
    end
end

//Sample read block
reg [15:0] data_output = 0;
always @(posedge clk) begin
    if(~empty) begin
        rd_signal <= 1;
        data_output <= read_data;
    end
    else begin
        rd_signal <= 0;
    end
end
