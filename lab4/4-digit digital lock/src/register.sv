module register (
    input logic divided_clk,
    input logic rstn,
    input logic valid_key_BTN,
    output logic debounced_valid_key
);

  d_flop U1 (
    .d(valid_key_BTN),
    .clk(divided_clk),
    .reset_n(rstn),
    .q(debounced_valid_key),
    .qb()
  );

endmodule