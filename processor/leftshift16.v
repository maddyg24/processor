module leftshift16(out, number);
    input [31:0] number;
    output [31:0] out;

    wire [31:0] w1;
    leftshift8 left1(w1, number);
    leftshift8 left2(out, w1);

endmodule