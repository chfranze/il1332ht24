module mux2to1_slice
  (   input  logic a,
      input  logic b,
      input  logic s,
      output logic y
      );

   logic 	   u1_out;
   logic 	   u2_out;
   logic 	   s_inv;


   nand2 U0 (
                   .a(s),
                   .b(s),
                   .y(s_inv)
		   );

   nand2 U1 (
                   .a(a),
                   .b(s),
                   .y(u1_out)
		   );

   nand2 U2 (
                   .a(b),
                   .b(s_inv),
                   .y(u2_out)
		   );

   nand2 U3 (
                   .a(u1_out),
                   .b(u2_out),
                   .y(y)
		   );


endmodule