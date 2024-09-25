module inv_Nbit #(parameter N = 4)(
	input logic [N-1:0] a,
	output logic [N-1:0] y
);

    // Internal wires for carries
	logic [N-1:0] nand_out;
    logic co;

	genvar i;
  	generate
    	for (i=0; i < N; i++) begin : generate_NAND
    			nand2 nand_inst(.a(a[i]), .b(a[i]), .y(nand_out[i])); // Named instance "nand_inst"
        end
  	endgenerate

    rca_nbit #(N) u1 (
      .a(nand_out),
      .b(1),
      .cin(1'b0),
      .sum(y),
      .cout(co)
    );

endmodule
