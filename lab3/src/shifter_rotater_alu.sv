module shifter_rotator_alu(
	input logic[3:0] x,
	input logic[1:0] select,
	output logic[3:0] y
	);

	logic[3:0] ls_out, rs_out, rl_out, ll_out;

	left_shifter ls(
		.x(x),
		.y(ls_out)
	);

	right_shifter rs(
		.x(x),
		.y(rs_out)
	);

	left_rotate lr(
		.x(x),
		.y(rl_out)
	);

	right_rotate rr(
		.x(x),
		.y(ll_out)
	);

	// Select MUX
	mux4to1_N_bit M1(
		ls_out,		
		rs_out,
		rl_out,
		ll_out,
		select,
		y
	);

endmodule