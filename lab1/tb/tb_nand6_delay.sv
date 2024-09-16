`timescale 1ns / 1ps

module tb_nand6_delay;

logic [5:0] in;
logic out;

nand6_delay dut (in[0], in[1], in[2], in[3], in[4], in[5], out);

// generate stimuli
initial begin
	in = 6'b000010;
	#10ns;
	in = 6'b000000;
	#10ns;
	in = 6'b111111;
	#10ns;
	in = 6'b010000;
	#10ns;
	$stop;
end

endmodule
