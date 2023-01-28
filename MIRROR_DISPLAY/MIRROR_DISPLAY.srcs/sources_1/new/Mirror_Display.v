`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2022 08:47:39
// Design Name: 
// Module Name: Mirror_Display
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


module Mirror_Display(
    input [7:0] Temperature,
    input [7:0] Average_mpg,
    input [7:0] Instantaneous_mpg,
    input [7:0] Miles_Remaining,
    input [1:0] Sel,
    output reg [7:0] Display
    );
    
    always @(*)
    begin
    case(Sel)
    0: Display=Temperature;
    1: Display=Average_mpg;
    2: Display=Instantaneous_mpg;
    3: Display=Miles_Remaining;
    endcase
    
    
    end
    
endmodule
