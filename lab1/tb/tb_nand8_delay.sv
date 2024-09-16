`timescale 1ns / 1ps

module tb_nand8_delay;

logic [7:0] in;
logic out;

nand7_delay dut (in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], out);

// generate stimuli
initial begin
	in = 8'b00001000;
	#10ns;
	in = 8'b00000000;
	#10ns;
	in = 8'b11111111;
	#10ns;
	in = 8'b01000000;
	#10ns;
	$stop;
end

endmodule
