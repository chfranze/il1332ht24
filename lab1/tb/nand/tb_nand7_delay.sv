`timescale 1ns / 1ps

module tb_nand7_delay;

logic [6:0] in;
logic out;

nand7_delay dut (in[0], in[1], in[2], in[3], in[4], in[5], in[6], out);

// generate stimuli
initial begin
	in = 7'b0000100;
	#10ns;
	in = 7'b0000000;
	#10ns;
	in = 7'b1111111;
	#10ns;
	in = 7'b0100000;
	#10ns;
	$stop;
end

endmodule
