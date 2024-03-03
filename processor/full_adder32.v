module full_adder32(A, B, out, cout);
    input [31:0] A, B;
    output [31:0] out;
    output cout;
    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31;
    full_adder ADD0(w0, cout0, A[0], B[0], 1'b0);
    full_adder ADD1(w1, cout1, A[1], B[1], cout0);
    full_adder ADD2(w2, cout2, A[2], B[2], cout1);
    full_adder ADD3(w3, cout3, A[3], B[3], cout2);
    full_adder ADD4(w4, cout4, A[4], B[4], cout3);
    full_adder ADD5(w5, cout5, A[5], B[5], cout4);
    full_adder ADD6(w6, cout6, A[6], B[6], cout5);
    full_adder ADD7(w7, cout7, A[7], B[7], cout6);
    full_adder ADD8(w8, cout8, A[8], B[8], cout7);
    full_adder ADD9(w9, cout9, A[9], B[9], cout8);
    full_adder ADD10(w10, cout10, A[10], B[10], cout9);
    full_adder ADD11(w11, cout11, A[11], B[11], cout10);
    full_adder ADD12(w12, cout12, A[12], B[12], cout11);
    full_adder ADD13(w13, cout13, A[13], B[13], cout12);
    full_adder ADD14(w14, cout14, A[14], B[14], cout13);
    full_adder ADD15(w15, cout15, A[15], B[15], cout14);
    full_adder ADD16(w16, cout16, A[16], B[16], cout15);
    full_adder ADD17(w17, cout17, A[17], B[17], cout16);
    full_adder ADD18(w18, cout18, A[18], B[18], cout17);
    full_adder ADD19(w19, cout19, A[19], B[19], cout18);
    full_adder ADD20(w20, cout20, A[20], B[20], cout19);
    full_adder ADD21(w21, cout21, A[21], B[21], cout20);
    full_adder ADD22(w22, cout22, A[22], B[22], cout21);
    full_adder ADD23(w23, cout23, A[23], B[23], cout22);
    full_adder ADD24(w24, cout24, A[24], B[24], cout23);
    full_adder ADD25(w25, cout25, A[25], B[25], cout24);
    full_adder ADD26(w26, cout26, A[26], B[26], cout25);
    full_adder ADD27(w27, cout27, A[27], B[27], cout26);
    full_adder ADD28(w28, cout28, A[28], B[28], cout27);
    full_adder ADD29(w29, cout29, A[29], B[29], cout28);
    full_adder ADD30(w30, cout30, A[30], B[30], cout29);
    full_adder ADD31(w31, cout, A[31], B[31], cout30);

    assign out[0] = w0;
    assign out[1] = w1;
    assign out[2] = w2;
    assign out[3] = w3;
    assign out[4] = w4;
    assign out[5] = w5;
    assign out[6] = w6;
    assign out[7] = w7;
    assign out[8] = w8;
    assign out[9] = w9;
    assign out[10] = w10;
    assign out[11] = w11;
    assign out[12] = w12;
    assign out[13] = w13;
    assign out[14] = w14;
    assign out[15] = w15;
    assign out[16] = w16;
    assign out[17] = w17;
    assign out[18] = w18;
    assign out[19] = w19;
    assign out[20] = w20;
    assign out[21] = w21;
    assign out[22] = w22;
    assign out[23] = w23;
    assign out[24] = w24;
    assign out[25] = w25;
    assign out[26] = w26;
    assign out[27] = w27;
    assign out[28] = w28;
    assign out[29] = w29;
    assign out[30] = w30;
    assign out[31] = w31;
endmodule