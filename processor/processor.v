/**
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB                   // I: Data from port B of RegFile
	 
	);

	// Control signals
	input clock, reset;
	
	// Imem
    output [31:0] address_imem;
	input [31:0] q_imem;

	// Dmem
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

	/* YOUR CODE STARTS HERE */

    /* FETCH */
    wire [11:0] pcout;
    wire [11:0] intopc;

    programcounter PC(intopc, reset, 1'b1, clock, pcout);
    wire [11:0] q_new;
    wire trash;
    full_adder12 full(pcout, 12'd1, intopc, trash);
    //dffe_ref_neg12 DFF(intopc, q_new, clock, 1'b1, reset);

    assign address_imem = intopc;

    /* END FETCH */

    /* F/D LATCH */
    wire [11:0] pcafterfd;
    dffe_ref_neg12 DFF2(pcafterfd, intopc, clock, 1'b1, reset);
    wire [31:0] irafterfd;
    dffe_ref_neg32 DFF3(irafterfd, q_imem, clock, 1'b1, reset);
    /* END F/D LATCH */

    /* DECODE */
    wire [4:0] shamt, rd, rt, rs, opcode, aluop;
    wire [16:0] immediate;
    wire [26:0] target;
    decode DECODE(shamt, rd, rt, rs, opcode, immediate, target, irafterfd, aluop);
    wire addi, inalu;
    control CONTROL(addi, inalu, opcode, aluop);
    
    wire [31:0] newdata;
    assign ctrl_writeEnable = 1;
    assign ctrl_readRegA = rs;
    assign ctrl_readRegB = rt;
    assign ctrl_writeReg = iraftermw[26:22];
    assign data_writeReg = resultaftermw;

    /* END DECODE */

    /* D/X LATCH */
    wire [31:0] aafterdx;
    dffe_ref_neg32 DFF4(aafterdx, data_readRegA, clock, 1'b1, reset);
    wire [31:0] bafterdx;
    dffe_ref_neg32 DFF5(bafterdx, data_readRegB, clock, 1'b1, reset);
    wire [11:0] pcafterdx;
    dffe_ref_neg12 DFF6(pcafterdx, pcafterfd, clock, 1'b1, reset);
    wire [31:0] irafterdx;
    dffe_ref_neg32 DFF7(irafterdx, irafterfd, clock, 1'b1, reset);
    /* END D/X LATCH */

    /* EXECUTE */
    wire [16:0] imm;
    assign imm = irafterdx[16:0];
    wire [31:0] signextended;
    assign signextended[16:0] = imm[16:0];
    assign signextended[17] = imm[16];
    assign signextended[18] = imm[16];
    assign signextended[19] = imm[16];
    assign signextended[20] = imm[16];
    assign signextended[21] = imm[16];
    assign signextended[22] = imm[16];
    assign signextended[23] = imm[16];
    assign signextended[24] = imm[16];
    assign signextended[25] = imm[16];
    assign signextended[26] = imm[16];
    assign signextended[27] = imm[16];
    assign signextended[28] = imm[16];
    assign signextended[29] = imm[16];
    assign signextended[30] = imm[16];
    assign signextended[31] = imm[16];

    wire [31:0] aluresult;
    wire neq, lessthan, ovf;
    wire [4:0]  aluopimmediate;
    wire [4:0] shamtimmediate;
    assign aluopimmediate = 5'b0;
    wire [4:0] finalop;
    wire [4:0] finalshamt;
    wire [31:0] regB;
    wire adding;
    wire trash2;
    control CONTROL2(adding, trash2, irafterdx[31:27], irafterdx[6:2]);
    mux_2 ALUMUX(finalop, adding, irafterdx[6:2], aluopimmediate);
    mux_2 ALUMUX2(finalshamt, adding, irafterdx[11:7], shamtimmediate);
    mux_2 REGB(regB, adding, bafterdx, signextended);
    alu ALU(aafterdx, regB, finalop, finalshamt, aluresult, neq, lessthan, ovf);
    /* END EXECUTE */

    /* X/M LATCH */
    wire [31:0] resultafterxm;
    dffe_ref_neg32 DFF8(resultafterxm, aluresult, clock, 1'b1, reset);
    wire [31:0] bafterxm;
    dffe_ref_neg32 DFF9(bafterxm, bafterdx, clock, 1'b1, reset);
    wire [31:0] irafterxm;
    dffe_ref_neg32 DFF10(irafterxm, irafterdx, clock, 1'b1, reset);
    /* END X/M LATCH */

    /* MEMORY */
    /* END MEMORY */
    /* M/W LATCH */
    wire [31:0] resultaftermw;
    dffe_ref_neg32 DFF11(resultaftermw, resultafterxm, clock, 1'b1, reset);
    wire [31:0] iraftermw;
    dffe_ref_neg32 DFF12(iraftermw, irafterxm, clock, 1'b1, reset);
    /* END M/W LATCH */

	/* END CODE */

endmodule
