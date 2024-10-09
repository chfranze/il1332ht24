`timescale 1ns/1ns
module clk_divider_tb();
logic clk, rst_n;
logic divided_clk;

clk_divider #(20) clk_div_module(.clk(clk), .rst_n(rst_n), .divided_clk(divided_clk));

initial begin
    clk = 1'b0;
    rst_n = 1'b0;

    #20;

    rst_n = 1'b1;
end

always #10 clk =~clk;

endmodule