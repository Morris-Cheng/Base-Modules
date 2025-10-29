`timescale 1ns / 1ps

module clock_divider #(
        parameter CLOCK_CYCLE_TIME = 0,
        parameter NEW_CLOCK_CYCLE_TIME = 0,
        parameter IDLE_STATE = 0,
        parameter ROUND_MODE = 0
    )(
        input  wire clk,
        input  wire enable,
        output wire divided_clk_out
    );
    
    localparam CLOCK_DIVIDER_CYCLE = (ROUND_MODE == 0) ? (NEW_CLOCK_CYCLE_TIME / CLOCK_CYCLE_TIME): 
                                                        ((NEW_CLOCK_CYCLE_TIME + CLOCK_CYCLE_TIME - 1) / CLOCK_CYCLE_TIME);
    
    reg divided_clk_reg = IDLE_STATE;
    reg [$clog2(CLOCK_DIVIDER_CYCLE + 1) - 1 : 0] clock_divider_counter = 0;
    reg flag = 0;
    
    always @(posedge clk) begin : divider_counter_block
        if(enable) begin
                if(clock_divider_counter >= CLOCK_DIVIDER_CYCLE) begin
                clock_divider_counter <= 1;
            end
            else begin
                clock_divider_counter <= clock_divider_counter + 1;
            end
        end
        else begin
            divided_clk_reg <= IDLE_STATE; //pulls the clock signal low for next start up
            clock_divider_counter <= 0;
        end
    end
    
    always @(*) begin : divider_clock_trigger_block
        if(clock_divider_counter == 1 && flag == 0) begin
            divided_clk_reg = ~divided_clk_reg;
            flag = 1;
        end
        else if(clock_divider_counter == 2) begin
            flag = 0;
        end
        else begin
            divided_clk_reg = divided_clk_reg;
            flag = flag;
        end
    end
    
    assign divided_clk_out = divided_clk_reg;
endmodule
