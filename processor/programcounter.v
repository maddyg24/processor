module programcounter(D, reset, wren, clk, Q);
    input [11:0] D;
    input reset, wren, clk;
    output [11:0] Q;

    genvar i;
    generate
        for(i=0; i<12; i=i+1) begin: loop1
            dffe_ref_neg DFF(Q[i], D[i], clk, wren, reset);
        end
    endgenerate
endmodule