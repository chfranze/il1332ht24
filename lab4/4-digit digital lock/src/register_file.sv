module reg_file #(
	parameter int BITWIDTH = 16,
	parameter int DEPTH = 64
) (
	input logic clk,
	input logic rst_n,
	input logic read_enable,
	input logic write_enable,
	input logic [$clog2(DEPTH)-1:0] read_address,
	input logic [$clog2(DEPTH)-1:0] write_address,
	input logic [BITWIDTH-1:0] data_in,
	output logic [BITWIDTH-1:0] data_out,
);

	logic [DEPTH-1:0][BITWIDTH-1:0] memory;

	always_ff @(posedge clk, negedge rst_n) begin
		if (!rst_n) begin
			for (int i = 0; i < DEPTH; i++) begin
				for (int j = 0; i < BITWIDTH; j++) begin
					memory[i][j] <= 1'b0;
				end
			end
		end else if (write_enable) begin
			memory[write_address] <= data_in;
		end
	end

	
	always_comb  begin
		data_out = 0;

		if (read_enable) begin
				data_out = memory[read_address];
			end
	end
endmodule
