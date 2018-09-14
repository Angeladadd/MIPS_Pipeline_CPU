`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:53:18 05/22/2018 
// Design Name: 
// Module Name:    inst_memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module inst_memory(
    input reset,
    input [31:0] readAddress,
    output reg [31:0] inst
    );
	 reg [31:0] instMemFile[0:15];
	 initial
	 begin
		instMemFile[0] = 32'b10001100000000010000000000001000;//lw $1,8($0);
		instMemFile[1] = 32'b10001100000000100000000000001010;//lw $2,12($0)
		instMemFile[2] = 32'b10001100000000110000000000000000;//lw $3,0($0)
		instMemFile[3] = 32'b00000000001000100010000000100000;//add $4,$1,$2
		instMemFile[4] = 32'b00000000011000010011100000100101;//or $7,$3,$1
		instMemFile[5] = 32'b00000000100001100010000000100000;//add $4,$4,$6
		instMemFile[6] = 32'b00000000011000010010100000100010;//sub $5,$3,$1
		instMemFile[7] = 32'b00000000010000010011000000100100;//and $6,$2,$1
		instMemFile[8] = 32'b10001100000010100000000000000000;//lw $10,0($0)
		instMemFile[9] = 32'b10001100000010100000000000000000;//lw $10,0($0)
		instMemFile[10] = 32'b10001100000010100000000000000000;//lw $10,0($0)
		instMemFile[11] = 32'b00000000000000000000000000000000;//nop
		instMemFile[12] = 32'b00000000000000000000000000000000;//nop
		instMemFile[13] = 32'b00010000000000000000000000000001;//beq $0,$0,1
		instMemFile[14] = 32'b10001100000010000000000000000000;//lw $8,0($0) not executed
		instMemFile[15] = 32'b00000000000000000000000000000000;
	end
	
	always @(readAddress or reset)
	begin
		if(reset)
			inst=0;
		else 
			inst=instMemFile[readAddress>>2];
	end


endmodule
