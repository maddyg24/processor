module mux_2_1in32out(out, select, in0, in1);
    input select;
    input in0, in1;
    output [31:0] out;
    assign out = select ? in1 : in0;
endmodule