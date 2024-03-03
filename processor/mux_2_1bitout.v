module mux_2_1bitout(out, select, in0, in1);
    input select;
    input [31:0] in0, in1;
    output out;
    assign out = select ? in1 : in0;
endmodule