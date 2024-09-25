module left_shifter (
    input  logic [3:0] x,
    output logic [3:0] y
);

assign y[0] = 1'b0;
assign y[1] = x[0];
assign y[2] = x[1];
assign y[3] = x[2];


endmodule

