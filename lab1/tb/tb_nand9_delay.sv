`timescale 1ns / 1ps

module tb_nand9_delay;

logic [8:0] in;
logic out;

nand9_delay dut (in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8], out);

// generate stimuli
initial begin
	in = 9'b000010000;
	#10ns;
	in = 9'b000000000;
	#10ns;
	in = 9'b111111111;
	#10ns;
	in = 9'b010000000;
	#10ns;
	$stop;
end

endmodule
