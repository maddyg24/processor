module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode;
    input [4:0] ctrl_shiftamt;

    wire ze, nz;
    assign ze = 0;
    assign nz = 1;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;
    wire [31:0] a, s;
    // add your code here:
    wire [31:0] w1, w5, w6, w7;
    wire [31:0] w2, w3, w4; 
    wire ovfadd, ovfsub, neqadd, neqsub;
    and32 AND(w2, data_operandA, data_operandB);
    or32 OR(w3, data_operandA, data_operandB);
    leftshift32 leftshift(w1, ctrl_shiftamt, data_operandA);
    rightshift32 rightshift(w5, ctrl_shiftamt, data_operandA);
    cla32 add(w6, ovfadd, neqadd, data_operandA, data_operandB, ze);
    cla32 sub(w7, ovfsub, neqsub, data_operandA, data_operandB, nz);
    wire xorval;
    xor XOR(xorval, ovfsub, data_result[31]);
    mux_32 alumux(data_result, ctrl_ALUopcode, w6, w7, w2, w3, w1, w5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    mux_32_1bitin1bitout muxforovf(overflow, ctrl_ALUopcode, ovfadd, ovfsub, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    mux_32_1bitin1bitout muxfornoteq(isNotEqual, ctrl_ALUopcode, 0, neqsub, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    mux_32_1bitin1bitout muxforlessthan(isLessThan, ctrl_ALUopcode, 0, xorval, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
endmodule