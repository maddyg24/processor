module rightshift4(out, number);
    input [31:0] number;
    output [31:0] out;

    wire [31:0] w1;
    rightshift2 right1(w1, number);
    rightshift2 right2(out, w1);
endmodule