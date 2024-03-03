module leftshift8(out, number);
    input [31:0] number;
    output [31:0] out;

    wire [31:0] w1;
    leftshift4 left1(w1, number);
    leftshift4 left2(out, w1);

endmodule