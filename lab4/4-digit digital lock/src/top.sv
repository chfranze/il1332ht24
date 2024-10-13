module top (
    input logic CLK_100MHZ,
    input logic [15:0] SW,
    input logic [3:0] BTN,
    output logic [15:0] LED,
    output logic RGB0[2:0],
    output logic RGB1[2:0],
    output logic [7:0] D1_SEG, D0_SEG,
    output logic [3:0] D1_AN, D0_AN
);

  kw4281_driver right_driver (
      .rst_n(1'b1),
      .clk(CLK_100MHZ),
      .input_bcd({SW[3:0], 4'b0, 4'b0, 4'b0}),
      .an(D1_AN),
      .seg(D1_SEG[6:0])
  );

  assign D1_SEG[7] = 1'b1;
  logic [3:0] q0, q1, q2, q3;

  kw4281_driver left_driver (
      .rst_n(1'b1),
      .clk(CLK_100MHZ),
      .input_bcd({q0, q1, q2, q3}),
      .an(D0_AN),
      .seg(D0_SEG[6:0])
  );

  assign D0_SEG[7] = 1'b1;

  logic divided_clk;

  clock_divider #(10000000) (    // 100Hz
      .rst_n(SW[15]),
      .clk_in(CLK_100MHZ),
      .clk_out(divided_clk)
  );

  assign LED[0] = divided_clk;

  logic debounced_valid_key;

  register register (
      .divided_clk(divided_clk),
      .rstn(SW[15]),
      .valid_key_BTN(BTN[0]),
      .debounced_valid_key(debounced_valid_key)
  );

  logic valid_key;

  key_press_detector key_press_detector (
      .clk(CLK_100MHZ),
      .rstn(SW[15]),
      .debounced_valid_key(debounced_valid_key),
      .valid_key(valid_key)
  );

  logic state;

  digital_lock digital_lock (
      .clk(CLK_100MHZ),
      .rstn(SW[15]),
      .key(SW[3:0]),
      .valid_key(valid_key),
      .state(state),
      .q0(q0),
      .q1(q1),
      .q2(q2),
      .q3(q3)
  );

  assign RGB1[1] = ~state;
  assign RGB1[0] = state;

endmodule
