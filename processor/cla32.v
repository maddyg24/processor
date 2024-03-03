module cla32(out, ovf, neq, A, B, sub);
    input [31:0] A, B;
    input sub;
    output [31:0] out;
    output neq, ovf;

    assign b0 = B[0];
    assign b1 = B[1];
    assign b2 = B[2];
    assign b3 = B[3];
    assign b4 = B[4];
    assign b5 = B[5];
    assign b6 = B[6];
    assign b7 = B[7];
    assign b8 = B[8];
    assign b9 = B[9];
    assign b10 = B[10];
    assign b11 = B[11];
    assign b12 = B[12];
    assign b13 = B[13];
    assign b14 = B[14];
    assign b15 = B[15];
    assign b16 = B[16];
    assign b17 = B[17];
    assign b18 = B[18];
    assign b19 = B[19];
    assign b20 = B[20];
    assign b21= B[21];
    assign b22 = B[22];
    assign b23 = B[23];
    assign b24 = B[24];
    assign b25 = B[25];
    assign b26 = B[26];
    assign b27 = B[27];
    assign b28 = B[28];
    assign b29 = B[29];
    assign b30 = B[30];
    assign b31 = B[31];


    wire [31:0] newB;
    xor XOR0(newB[0], sub, b0);
    xor XOR1(newB[1], sub, b1);
    xor XOR2(newB[2], sub, b2);
    xor XOR3(newB[3], sub, b3);
    xor XOR4(newB[4], sub, b4);
    xor XOR5(newB[5], sub, b5);
    xor XOR6(newB[6], sub, b6);
    xor XOR7(newB[7], sub, b7);
    xor XOR8(newB[8], sub, b8);
    xor XOR9(newB[9], sub, b9);
    xor XOR10(newB[10], sub, b10);
    xor XOR11(newB[11], sub, b11);
    xor XOR12(newB[12], sub, b12);
    xor XOR13(newB[13], sub, b13);
    xor XOR14(newB[14], sub, b14);
    xor XOR15(newB[15], sub, b15);
    xor XOR16(newB[16], sub, b16);
    xor XOR17(newB[17], sub, b17);
    xor XOR18(newB[18], sub, b18);
    xor XOR19(newB[19], sub, b19);
    xor XOR20(newB[20], sub, b20);
    xor XOR21(newB[21], sub, b21);
    xor XOR22(newB[22], sub, b22);
    xor XOR23(newB[23], sub, b23);
    xor XOR24(newB[24], sub, b24);
    xor XOR25(newB[25], sub, b25);
    xor XOR26(newB[26], sub, b26);
    xor XOR27(newB[27], sub, b27);
    xor XOR28(newB[28], sub, b28);
    xor XOR29(newB[29], sub, b29);
    xor XOR30(newB[30], sub, b30);
    xor XOR31(newB[31], sub, b31);

    wire [31:0] Bagain;
    wire trash;

    wire [31:0] useful;

    mux_2 MUX(useful, sub, newB, Bagain);

    full_adder32 BAGAIN(newB, 1, Bagain, trash);

    wire G0, P0, c1bef, c1, G1, P1, c2bef, c2, G2, P2, c3bef, c3, G3, P3, c4bef, c4;
    clain8bitblocks first(A[7:0], useful[7:0], 0, G0, P0, out[7:0], c1, c1bef);
    clain8bitblocks second(A[15:8], useful[15:8], c1, G1, P1, out[15:8], c2, c2bef);
    clain8bitblocks third(A[23:16], useful[23:16], c2, G2, P2, out[23:16], c3, c3bef);
    clain8bitblocks fourth(A[31:24], useful[31:24], c3, G3, P3, out[31:24], c4, c4bef);

    xor XOR(ovf, c4, c4bef);

    or OR0(neq0, out[0], out[1]);
    or OR1(neq1, neq0, out[2]);
    or OR2(neq2, neq1, out[3]);
    or OR3(neq3, neq2, out[4]);
    or OR4(neq4, neq3, out[5]);
    or OR5(neq5, neq4, out[6]);
    or OR6(neq6, neq5, out[7]);
    or OR7(neq7, neq6, out[8]);
    or OR8(neq8, neq7, out[9]);
    or OR9(neq9, neq8, out[10]);
    or OR10(neq10, neq9, out[11]);
    or OR11(neq11, neq10, out[12]);
    or OR(neq, neq10, out[13], out[14], out[15], out[16], out[17], out[18], out[19], out[20], out[21], out[22], out[23], out[24], out[25], out[26], out[27], out[28], out[29], out[30], out[31]);


endmodule