module dffe_ref_neg32 (q, d, clk, en, clr);
   
   //Inputs
   input [31:0] d;
   input clk, en, clr;
   
   //Internal wire
   wire clr;

   //Output
   output[31:0] q;
   
   //Register
   reg [31:0] q;

   //Intialize q to 0
   initial
   begin
       q = 0;
   end

   //Set value of q on positive edge of the clock or clear
   always @(negedge clk or posedge clr) begin
       //If clear is high, set q to 0
       if (clr) begin
           q <= 0;
       //If enable is high, set q to the value of d
       end else if (en) begin
           q <= d;
       end
   end
endmodule