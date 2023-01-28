`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2022 09:06:51
// Design Name: 
// Module Name: Mirror_Display_TB
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


module Mirror_Display_TB(

    );
    reg [7:0]Temperature;
    reg [7:0]Average_mpg;
    reg [7:0]Instantaneous_mpg;
    reg [7:0]Miles_Remaining;
    reg [1:0]Sel;
    reg [7:0]Display;
    
    Mirror_Display dut(.Temperature(Temperature), .Average_mpg(Average_mpg),.Instantaneous_mpg(Instantaneous_mpg), .Miles_Remaining(Miles_Remaining), .Sel(Sel));
    initial
     begin
    Temperature =8'b0;
    Average_mpg=8'b10011000;
    Instantaneous_mpg=8'b00010010;
    Miles_Remaining=8'b11110000;
    Sel=8'b00;
    
    #100;
    Average_mpg=8'b10011000;
    Instantaneous_mpg=8'b00010010;
    Miles_Remaining=8'b00001111;
    Sel=8'b11;
    #1000;
    end
endmodule
