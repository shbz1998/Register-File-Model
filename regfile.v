//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 7

`timescale 1ns/10ps
module regfile(DATA, ADDR, OE, CS, WS);
parameter WIDTH = 8;
parameter DEPTH = 5;
inout [WIDTH-1 : 0] DATA;
input [DEPTH-1 : 0] ADDR; 
input OE, CS, WS;
reg [WIDTH-1 : 0] memory [0: 2**DEPTH-1];

//CS is ACTIVE LOW; WRITE AT POSEDGE WS WHEN OE=0; READ AT OE=1.

//WRITE OPERATION
always@(posedge WS) begin
if (!OE && !CS)
memory[ADDR] <= DATA;
else;	
end

//READ OPERTAION 
assign DATA = (OE && !CS) ? memory[ADDR] : 8'bz;

endmodule

