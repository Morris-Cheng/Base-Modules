`timescale 1ns / 1ps

module top_tb();
    reg  clk = 1;                  //system clock
    reg  enable = 0;               //enable signal
    wire divided_clk;              //divided clock output
    
    clock_divider #(
        .CLOCK_CYCLE_TIME(10),     //using system clock of 100MHz
        .NEW_CLOCK_CYCLE_TIME(30), //divided clock FULL period: 30ns
        .IDLE_STATE(0),            //set idle state to 0 (LOW)
        .ROUND_MODE(1)             //set round mode to round UP
    ) clock_divider_inst(
        .clk(clk),
        .enable(enable),
        .divided_clk_out(divided_clk)
    );

    always #5 clk = ~clk; //system clock of 100Mhz
    
    initial begin
        #10;
        enable = 1;
    end
endmodule
