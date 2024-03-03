module leftshift2(out, number);
    input [31:0] number;
    output [31:0] out;

    wire [31:0] w1;
    leftshift1 left1(w1, 1, number);
    leftshift1 left2(out, 1, w1);
endmodule