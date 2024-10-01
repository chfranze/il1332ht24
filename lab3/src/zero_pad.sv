module zero_pad #(
    parameter IN_WIDTH  = 2,  // Width of the input
    parameter OUT_WIDTH = 16  // Width of the output
) (
    input  logic [ IN_WIDTH-1:0] in,  // Input of IN_WIDTH bits
    output logic [OUT_WIDTH-1:0] out  // Output of OUT_WIDTH bits
);

  // Ensure that the output is wider than the input
  // Pad the most significant bits with zeros.
  assign out = {{(OUT_WIDTH - IN_WIDTH) {1'b0}}, in};

endmodule
