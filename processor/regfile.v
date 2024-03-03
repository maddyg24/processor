module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB
);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;

	output [31:0] data_readRegA, data_readRegB;

	// add your code here
	wire [31:0] decoded;
	wire [31:0] outofsingle [0:31];
	decoder32 DECODE(decoded, ctrl_writeReg, ctrl_writeEnable);
	assign outofsingle[0] = 0;

	genvar i;
	generate
		for(i=1; i<32; i=i+1) begin: loop1
			singlereg REG(data_writeReg, ctrl_reset, decoded[i], clock, outofsingle[i]);
		end
	endgenerate
	mux_32 MUXrs1(data_readRegA, ctrl_readRegA, outofsingle[0], outofsingle[1], outofsingle[2], outofsingle[3], outofsingle[4], outofsingle[5], outofsingle[6], outofsingle[7],outofsingle[8], outofsingle[9],outofsingle[10],outofsingle[11],outofsingle[12],outofsingle[13],outofsingle[14],outofsingle[15],outofsingle[16],outofsingle[17],outofsingle[18],outofsingle[19],outofsingle[20],outofsingle[21],outofsingle[22],outofsingle[23],outofsingle[24],outofsingle[25],outofsingle[26],outofsingle[27],outofsingle[28],outofsingle[29],outofsingle[30],outofsingle[31]);
	mux_32 MUXrs2(data_readRegB, ctrl_readRegB, outofsingle[0], outofsingle[1], outofsingle[2], outofsingle[3], outofsingle[4], outofsingle[5], outofsingle[6], outofsingle[7],outofsingle[8], outofsingle[9],outofsingle[10],outofsingle[11],outofsingle[12],outofsingle[13],outofsingle[14],outofsingle[15],outofsingle[16],outofsingle[17],outofsingle[18],outofsingle[19],outofsingle[20],outofsingle[21],outofsingle[22],outofsingle[23],outofsingle[24],outofsingle[25],outofsingle[26],outofsingle[27],outofsingle[28],outofsingle[29],outofsingle[30],outofsingle[31]);
endmodule
