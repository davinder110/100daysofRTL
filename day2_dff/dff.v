`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2023 13:44:40
// Design Name: 
// Module Name: dff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dff(
    input clk,
    input reset,
    input d,
    output reg q_norst_o,
    output reg q_syncrst_o,
    output reg q_asyncrst_o
    );
    
    // No reset
    always @(posedge clk)
    begin
     q_norst_o<=d;
    end
    
     // Sync reset
     always @(posedge clk)
    begin
     if(reset)
     q_syncrst_o<=1'b0;
     else
     q_syncrst_o<=d;
    end
    
     // Async reset
     always @(posedge clk or posedge reset)
    begin
       if(reset)
     q_asyncrst_o<=1'b0;
     else
     q_asyncrst_o<=d;
    end
    
endmodule
