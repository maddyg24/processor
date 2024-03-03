module leftshift32(out, shift, number);
    input [4:0] shift;
    input [31:0] number;
    output [31:0] out;
    assign shift0 = shift[0];
    assign shift1 = shift[1];
    assign shift2 = shift[2];
    assign shift3 = shift[3];
    assign shift4 = shift[4];

    wire [31:0] w1, w2, w3, w4, w5, w6, w7, w8, w9;

    leftshift16 left1(w1, number);
    mux_2 mux1(w2, shift4, number, w1);
    leftshift8 left2(w3, w2);
    mux_2 mux2(w4, shift3, w2, w3);
    leftshift4 left3(w5, w4);
    mux_2 mux3(w6, shift2, w4, w5);
    leftshift2 left4(w7, w6);
    mux_2 mux4(w8, shift1, w6, w7);
    leftshift1 left5(w9, 1, w8);
    mux_2 mux5(out, shift0, w8, w9);
endmodule