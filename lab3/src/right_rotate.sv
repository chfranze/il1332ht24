module right_rotate (
    input  logic [3:0] x,
    output logic [3:0] y
);

assign y[0] = x[1];
assign y[1] = x[2];
assign y[2] = x[3];
assign y[3] = x[0];


endmodule

