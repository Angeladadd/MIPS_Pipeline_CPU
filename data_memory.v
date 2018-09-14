`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:39 04/18/2018 
// Design Name: 
// Module Name:    data_memory 
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
module data_memory(
    input clock_in,
	 input reset,
    input [31:0] address,
    input [31:0] writeData,
    input memWrite,
    input memRead,
    output reg [31:0] readData);
	 
	 reg [31:0] memFile[15:0];
	 
	 
	 initial
	 begin
		memFile[0]	<= 32'b00000000000000000000000000000000;
		memFile[1]	<= 32'b00000000000000000000000000000001;
		memFile[2]	<= 32'b00000000000000000000000000000010;
		memFile[3]	<= 32'b00000000000000000000000000000011;
		memFile[4]	<= 32'b00000000000000000000000000000100;
		memFile[5]	<= 32'b00000000000000000000000000000101;
		memFile[6]	<= 32'b00000000000000000000000000000110;
		memFile[7]	<= 32'b00000000000000000000000000000111;	
		memFile[8]	<= 32'b00000000000000000000000000001000;
		memFile[9]	<= 32'b00000000000000000000000000001001;
		memFile[10]	<= 32'b00000000000000000000000000001010;
		memFile[11]	<= 32'b00000000000000000000000000001011;
		memFile[12]	<= 32'b00000000000000000000000000001100;
		memFile[13]	<= 32'b00000000000000000000000000001101;
		memFile[14]	<= 32'b00000000000000000000000000001110;
		memFile[15]	<= 32'b00000000000000000000000000001111;
	 end
	 always @ (memRead or address or reset)
	 begin
	 if(reset)
			readData = 0;
	 else if(memRead)
			readData = memFile[address>>2];
	 end 
	 always @ (negedge clock_in)
	 begin
	 if(reset)
	 begin
		memFile[0]	= 32'b00000000000000000000000000000000;
		memFile[1]	= 32'b00000000000000000000000000000001;
		memFile[2]	= 32'b00000000000000000000000000000010;
		memFile[3]	= 32'b00000000000000000000000000000011;
		memFile[4]	= 32'b00000000000000000000000000000100;
		memFile[5]	= 32'b00000000000000000000000000000101;
		memFile[6]	= 32'b00000000000000000000000000000110;
		memFile[7]	= 32'b00000000000000000000000000000111;	
		memFile[8]	= 32'b00000000000000000000000000001000;
		memFile[9]	= 32'b00000000000000000000000000001001;
		memFile[10]	= 32'b00000000000000000000000000001010;
		memFile[11]	= 32'b00000000000000000000000000001011;
		memFile[12]	= 32'b00000000000000000000000000001100;
		memFile[13]	= 32'b00000000000000000000000000001101;
		memFile[14]	= 32'b00000000000000000000000000001110;
		memFile[15]	= 32'b00000000000000000000000000001111;
	 end
	 else if (memWrite == 1)
			memFile[address>>2] = writeData;
	 end
    


endmodule
