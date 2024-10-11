module d_flop_beh (
		   input logic d,      // D input
		   input logic clk,
		   output logic q,     // Output Q
		   output logic qb     // Output QB
		   );

   always_ff @(posedge clk) begin
      q <= d; // non blocking assignment
      qb <= ~d;
   end
   
endmodule