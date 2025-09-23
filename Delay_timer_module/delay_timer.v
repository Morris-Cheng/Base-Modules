`timescale 1ns / 1ps

module delay_timer #(
        parameter DELAY_PERIOD = 0,
        parameter CYCLE_TIME   = 10   //time required for each clock complete cycle
    )(
        input  wire clk,
        input  wire enable,
        output reg  done
    );
    
    //calculate the number of cycles needed to reach the desired delay time
    localparam DELAY_CYCLE = DELAY_PERIOD / CYCLE_TIME;
    
    reg [$clog2(DELAY_CYCLE + 1) - 1 : 0] delay_counter = 0;
    reg previous_enable = 0;
    wire enable_rising_edge;
    
    always @(posedge clk) begin
        done <= 0;
        
        if (enable_rising_edge) begin
            delay_counter <= DELAY_CYCLE;
            done <= 0;
        end
        else if (delay_counter > 1) begin
            delay_counter <= delay_counter - 1;
        end
        else if (delay_counter == 1) begin
            delay_counter <= 0;
            done <= 1;
        end
        else begin
            delay_counter <= 0;
        end
        
        previous_enable <= enable;
    end
    
    assign enable_rising_edge = enable & ~previous_enable;
endmodule
