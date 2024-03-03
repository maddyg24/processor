module rightshift16(out, number);
    input [31:0] number;
    output [31:0] out;

    wire [31:0] w1;
    rightshift8 right1(w1, number);
    rightshift8 right2(out, w1);

endmodule