`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2023 16:11:24
// Design Name: 
// Module Name: mux_day1_tb
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


module mux_day1_tb;
    reg [7:0] A;
    reg [7:0] B;
    reg Sel;
    wire [7:0] Y;
    integer i;
    
    mux m1(.a(A), .b(B), .sel(Sel), .y(Y)); 
    
    initial 
    begin
    {A,B,Sel}=0;
    for(i=0;i<5;i=i+1)
    begin 
    #10 A = $random;
    #10 Sel = $random;
    #10 B = $random;
    end
    end
endmodule
