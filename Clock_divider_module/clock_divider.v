`timescale 1ns / 1ps

module clock_divider #(
        parameter CLOCK_PERIOD = 0,
        parameter CYCLE_TIME = 10   //time required for each clock complete cycle
    )(
        input   wire clk,
        input   wire enable,        //enable signal to start the clock divider
        output  wire divided_clk_out
    );
        
    //converting the clock period to number of cycles
    localparam CLOCK_DIVIDER_CYCLE = (CLOCK_PERIOD / CYCLE_TIME / 2) - 1;
    
    reg divided_clk_reg = 0;
    reg [$clog2(CLOCK_DIVIDER_CYCLE + 1) - 1 : 0] clock_divider_counter = 0;
    
    always @(posedge clk) begin
        if(enable) begin
                if(clock_divider_counter >= CLOCK_DIVIDER_CYCLE) begin
                divided_clk_reg <= ~divided_clk_reg;
                clock_divider_counter <= 0;
            end
            else begin
                clock_divider_counter <= clock_divider_counter + 1;
            end
        end
        else begin
            divided_clk_reg <= 0; //pulls the clock signal low for next start up
        end
    end
    
    assign divided_clk_out = divided_clk_reg;
endmodule
