`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:17 04/18/2018 
// Design Name: 
// Module Name:    signext 
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
module signext(
    input [15:0] inst,
	 input reset,
    output reg [31:0] data
    );
	always @ (inst or reset)
	begin 
	if(reset)
		data=0;
		else if (inst[15] == 0)
			data = {16'b0000000000000000,inst};
		else
			data = {16'b1111111111111111,inst};
		end

endmodule
