`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2023 13:52:20
// Design Name: 
// Module Name: dff_tb
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


module dff_tb();
reg Clk;
reg Reset;
reg D;
wire  Q_norst_o;
wire Q_syncrst_o;
wire Q_asyncrst_o;

dff d1(.clk(Clk), .reset(Reset), .d(D), .q_syncrst_o(Q_syncrst_o), .q_asyncrst_o(Q_asyncrst_o), .q_norst_o(Q_norst_o));
   
   initial
   begin
   Clk=1'b0;
   Reset=1'b0;
   $dumpfile("dff.vcd");
   #9 D=1'b0;
   #2  D=1'b1;
   #5 Reset=1'b1;
   #6 D=1'b1;
   #5  D=1'b0;
   #7 Reset=1'b0;
     #10 D=1'b1;
   
   end
   always #5 Clk =~Clk;
endmodule
