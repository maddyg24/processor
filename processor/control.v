module control(addi, inalu, opcode, aluop);
    input [4:0] opcode, aluop;
    output inalu;
    output addi;
    wire inalu;
    wire [31:0] decoded;
    decoder32 DECODING(decoded, opcode, 1'b1);
    assign addi = decoded[5];
    
    
endmodule