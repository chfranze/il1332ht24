`timescale 1ns/1ns
module tb_register();

logic clk, rstn_asynch, rstn_syn, enable;
logic [3:0] d, out;

register register_module(.clk(clk), .rstn_syn(rstn_syn), .rstn_asynch(rstn_asynch), .enable(enable) ,.d(d), .out(out));

initial begin
    clk = 1'b0;
    rstn_asynch = 1'b0;
    rstn_syn = 1'b0;
    d = 4'b0100;
    enable = 1'b0;
    #10;

    rstn_asynch = 1'b1;
    #10;

    rstn_syn = 1'b1;

    #40;

    d = 4'b1100;
    enable = 1'b1;


end

always #10 clk =~clk;

endmodule