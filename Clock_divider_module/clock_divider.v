`timescale 1ns / 1ps

module clock_divider #(
        parameter CLOCK_PERIOD = 0,
        parameter CYCLE_TIME = 10   //time required for each clock complete cycle
    )(
        input   wire clk,
        output  wire divider_clock_signal
    );
        
    //converting the clock period to number of cycles
    localparam CLOCK_DIVIDER_CYCLE = (CLOCK_PERIOD / CYCLE_TIME / 2) - 1;
    
    reg internal_clock_divider_signal = 0;
    reg [$clog2(CLOCK_DIVIDER_CYCLE + 1) - 1 : 0] clock_divider_counter = 0;
    
    always @(posedge clk) begin
        $display("number of cycles: %d", CLOCK_DIVIDER_CYCLE);
        
        if(clock_divider_counter >= CLOCK_DIVIDER_CYCLE) begin
            internal_clock_divider_signal <= ~internal_clock_divider_signal;
            clock_divider_counter <= 0;
        end
        else begin
            clock_divider_counter <= clock_divider_counter + 1;
        end
    end
    
    assign divider_clock_signal = internal_clock_divider_signal;
endmodule
