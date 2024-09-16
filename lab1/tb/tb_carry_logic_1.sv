`timescale 1ns / 1ps

module tb_carry_logic_1;

logic [4:0] in;
logic out;

carry_logic_1 dut (in[0], in[1], in[2], in[3], in[4], out);

// generate stimuli
initial begin
	in = 5'b00001;
	#10ns;
	in = 5'b00000;
	#10ns;
	in = 5'b111111;
	#10ns;
	in = 5'b001000;
	#10ns;
	$stop;
end

endmodule
