module singlereg(D, reset, wren, clk, Q);
    input [31:0] D;
    input reset, wren, clk;
    output [31:0] Q;

    genvar i;
    generate
        for(i=0; i<32; i=i+1) begin: loop1
            dffe_ref_pos dffe_1(Q[i], D[i], clk, wren, reset);
        end
    endgenerate

endmodule