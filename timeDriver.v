`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:08 04/25/2018 
// Design Name: 
// Module Name:    timeDriver 
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
module timeDriver(
    input clockIn,
    output reg clockOut
    );
	reg [24:0] buffer;
	
	initial begin
	buffer=0;
	clockOut=0;
	end
	always @(posedge clockIn)
	begin
		buffer <= buffer+1;
		clockOut <= buffer[24];
	end

endmodule
