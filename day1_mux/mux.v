`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2023 15:57:53
// Design Name: 
// Module Name: mux
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


module mux(
    input wire [7:0] a,
    input wire [7:0] b,
    input wire  sel,
    output wire [7:0] y
    );
    
  assign y = sel ? b : a;
  /*
  always @(*)
  begin 
   case(sel)
   1'b0 : y = a;
   1'b1 : y = b; 
   endcase
  end
  */
    
endmodule
