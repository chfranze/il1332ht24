module rca_nbit #(parameter N = 4)(
	input logic [N-1:0] a,
	input logic [N-1:0] b,
	input logic cin,
	output logic [N-1:0] sum,
	output logic cout
);

    // Internal wires for carries
	logic [N-1:0] co;

	// First Adder
	full_adder_structural_half_adder_nand fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(co[0]));

	genvar i;
  	generate
    	for (i=1; i < N; i++)
      		begin : generate_FA
    			full_adder_structural_half_adder_nand fa (.a(a[i]), .b(b[i]), .cin(co[i-1]), .sum(sum[i]), .cout(co[i]));
      		end
  	endgenerate

	assign cout = co[N-1];

endmodule