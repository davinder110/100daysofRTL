`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2022 13:56:39
// Design Name: 
// Module Name: dadda_tb
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


module dadda_tb();
reg [3:0]A;
reg [3:0]B;
wire [7:0]y;

 dadda dut(.A(A),.B(B),.y(y));

initial
begin
	#100 A = 4'h7; B = 4'h5;
	#100
	A=4'h3;B=4'h5;
	
	$display(" A=%d,B=%d,AxB=%d",(A),(B),(y));

end
endmodule


