module rightshift2(out, number);
    input [31:0] number;
    output [31:0] out;

    wire [31:0] w1;
    rightshift1 right1(w1, 1, number);
    rightshift1 right2(out, 1, w1);
endmodule