module leftshift4(out, number);
    input [31:0] number;
    output [31:0] out;

    wire [31:0] w1;
    leftshift2 left1(w1, number);
    leftshift2 left2(out, w1);
endmodule