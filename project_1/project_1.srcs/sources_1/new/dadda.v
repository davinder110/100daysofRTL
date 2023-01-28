`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2022 11:35:44
// Design Name: 
// Module Name: dadda
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


module dadda(
input [3:0] A,
input [3:0] B,
output wire [7:0] y
);
    wire  gen_pp [0:3][3:0];
    // stage-1 sum and carry
    wire [3:0]s1,c1;
    // stage-2 sum and carry
    wire [3:0]s2,c2;
    // stage-3 sum and carry
    wire [3:0]s3,c3;

genvar i;
genvar j;

for(i = 0; i<4; i=i+1)begin
   for(j = 0; j<4;j = j+1)begin
      assign gen_pp[i][j] = A[j]&B[i];
end

end
assign y[0]=gen_pp[0][0];
// stage 1
HA h1(.a(gen_pp[1][0]),.b(gen_pp[0][1]),.Sum(s1[0]),.Cout(c1[0]));

assign y[1]=s1[0];

FA f1(.A(gen_pp[0][2]),.B(gen_pp[1][1]),.Cin(gen_pp[2][0]),.Y(s1[1]),.Cout(c1[1]));
FA f2(.A(gen_pp[0][3]),.B(gen_pp[1][2]),.Cin(gen_pp[2][1]),.Y(s1[2]),.Cout(c1[2]));
FA f3(.A(gen_pp[1][3]),.B(gen_pp[2][2]),.Cin(gen_pp[3][1]),.Y(s1[3]),.Cout(c1[3]));

//stage 2
HA h2(.a(s1[1]),.b(c1[0]),.Sum(s2[0]),.Cout(c2[0]));

assign y[2]=s2[0];
FA f4(.A(s1[2]),.B(c1[1]),.Cin(gen_pp[3][0]),.Y(s2[1]),.Cout(c2[1]));

HA h3(.a(s1[3]),.b(c1[2]),.Sum(s2[2]),.Cout(c2[2]));
FA f5(.A(c1[3]),.B(gen_pp[2][3]),.Cin(gen_pp[3][2]),.Y(s2[3]),.Cout(c2[3]));

//stage 3
HA h4(.a(s2[1]),.b(c2[0]),.Sum(s3[0]),.Cout(c3[0]));
assign y[3]=s3[0];

FA f6(.A(s2[2]),.B(c2[1]),.Cin(c3[0]),.Y(s3[1]),.Cout(c3[1]));

assign y[4]=s3[1];

FA f7(.A(s2[3]),.B(c2[2]),.Cin(c3[1]),.Y(s3[2]),.Cout(c3[2]));
assign y[5]=s3[2];

FA f8(.A(gen_pp[3][3]),.B(c2[3]),.Cin(c3[2]),.Y(s3[3]),.Cout(c3[3]));
assign y[6]=s3[3];
assign y[7]=c3[3];

endmodule

//half adder
module HA(a, b, Sum, Cout);

input a, b; 
output Sum, Cout; 

assign Sum = a ^ b; 
assign Cout = a & b; 

endmodule

//full adder
module FA(A,B,Cin,Y,Cout);
input A,B,Cin;
output Y,Cout;
    
assign Y = A^B^Cin;
assign Cout = (A&B)|(A&Cin)|(B&Cin);
    
endmodule

