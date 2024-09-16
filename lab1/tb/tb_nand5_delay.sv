`timescale 1ns / 1ps

module tb_nand5_delay;

logic [4:0] in;
logic out;

nand5_delay dut (in[0], in[1], in[2], in[3], in[4], out);

// generate stimuli
initial begin
	in = 5'b00001;
	#10ns;
	in = 5'b00000;
	#10ns;
	in = 5'b11111;
	#10ns;
	in = 5'b01000;
	#10ns;
	$stop;
end

endmodule
