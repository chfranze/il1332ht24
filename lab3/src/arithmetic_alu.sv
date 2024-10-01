module arithmetic_alu(
	input logic[7:0] x,
    input logic[7:0] y,
	input logic[1:0] select,
	output logic[15:0] y
	);

    logic [8:0] add_out, sub_out;
	logic [15:0] mul_out;

    logic [15:0] adder_out;

    // ADD
    rca_nbit #(8) adder (
        x,
        y,
        0,
        adder_out,
        adder_out[8]
    );
    assign adder_out[15:9] = 0;

    // SUB

    // MULTIPLY

	// Select MUX
	mux4to1_N_bit #(16) M1(
		ls_out,		
		rs_out,
		rl_out,
		ll_out,
		select,
		y
	);

endmodule