`timescale 1ns / 1ps

module pulse(
        input  wire clk,
        input  wire enable,
        output reg  trigger
    );
    
    reg flag = 0;
    
    always @(posedge clk) begin
        if(enable) begin
            if(~flag) begin
                trigger <= 1;
                flag <= 1;
            end
            else begin
                trigger <= 0;
            end
        end
        else begin
            flag <= 0;
            trigger <= 0;
        end
    end
endmodule
