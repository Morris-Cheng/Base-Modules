`timescale 1ns / 1ps

module top_tb();
    reg clk = 1;
    reg enable = 0;
    wire done;
    
    delay_timer #(
        .CLOCK_CYCLE_TIME(10), //using a system clock of 100MHz = clock cycle time of 10ns
        .DELAY_TIME(30),       //delay for 30ns (set to for zero delay)
        .ROUND_MODE(1)         //round mode: 0 for round down, 1 for round up
    ) delay_time_inst (        //name of instance can be changed to any
        .clk(clk),
        .enable(enable),
        .done(done)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        #10;
        enable = 1;
        #10;
        enable = 0;
        
        #60;
        enable = 1;
        #10;
        enable = 0;
    end
endmodule
