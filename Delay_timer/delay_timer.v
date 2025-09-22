`timescale 1ns / 1ps

module delay_timer #(
        parameter DELAY_PERIOD = 0,
        parameter CYCLE_TIME   = 10   //time required for each clock complete cycle
    )(
        input  wire clk,
        input  wire enable,
        output wire done
    );
    
    //calculate the number of cycles needed to reach the desired delay time
    localparam DELAY_CYCLE = DELAY_PERIOD / CYCLE_TIME;
    
    reg [$clog2(DELAY_CYCLE + 1) - 1 : 0] delay_cycle_counter = 0;
    reg done_reg = 0;
    
    always @(posedge clk) begin
        if(enable) begin
            if(delay_cycle_counter >= DELAY_CYCLE) begin
                done_reg <= 1;
            end
            else begin
                delay_cycle_counter <= delay_cycle_counter + 1;
            end
        end
        else begin
            done_reg <= 0;
            delay_cycle_counter <= 0;
        end
    end
    
    assign done = done_reg;
endmodule
