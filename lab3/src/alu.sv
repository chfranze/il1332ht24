module alu (
    input  logic [ 7:0] x,
    input  logic [ 7:0] y,
    input  logic [ 1:0] m,
    input  logic [ 1:0] s,
    output logic [15:0] z
);

  logic [3:0][7:0] x_demux_out;
  logic [3:0][7:0] y_demux_out;

  logic [15:0] arithmetic_mux_out;
  logic [7:0] shiftRotate_mux_out;
  logic compare_mux_out;
  logic [7:0] logic_mux_out;

  demux4to1_N_bit #(8) x_input_demux (
      .Y  (x),
      .sel(s),
      .A  (x_demux_out[0]),  // Arithmetic
      .B  (x_demux_out[1]),  // Shift/Rotate
      .C  (x_demux_out[2]),  // Compare
      .D  (x_demux_out[3])   // Logic
  );

  demux4to1_N_bit #(8) y_input_demux (
      .Y  (y),
      .sel(s),
      .A  (y_demux_out[0]),  // Arithmetic
      .B  (y_demux_out[1]),  // Shift/Rotate
      .C  (y_demux_out[2]),  // Compare
      .D  (y_demux_out[3])   // Logic
  );

  // Arithmetic

  arithmetic_alu aa (
    .x(x_demux_out[0]),
    .y(y_demux_out[0]),
    .m(m),
    .z(arithmetic_mux_out)
  );

  // Shift/Rotate

  barrel_shifter sra (
    .x(x_demux_out[1]),
    .s(y_demux_out[1][2:0]),  // TODO: Fix so it can take all 8bits
    .shift_mode(m),
    .y(shiftRotate_mux_out)
  );

  logic [15:0] shiftRotate_mux_out_16bit;

  // Add padding
  zero_pad #(8, 16) za1 (
    .in(shiftRotate_mux_out),
    .out(shiftRotate_mux_out_16bit)
  );

  // Compare

  compare_alu ca (
    .x(x_demux_out[2]),
    .y(y_demux_out[2]),
    .m(m),
    .z(compare_mux_out)
  );

  logic [15:0] compare_mux_out_16bit;

  // Add padding
  zero_pad #(1, 16) za2 (
    .in(compare_mux_out),
    .out(compare_mux_out_16bit)
  );

  // Logic

  logic_alu la (
    .x(x_demux_out[3]),
    .y(y_demux_out[3]),
    .m(m),
    .z(logic_mux_out)
  );

  logic [15:0] logic_mux_out_16bit;

  // Add padding
  zero_pad #(8, 16) za3 (
    .in(logic_mux_out),
    .out(logic_mux_out_16bit)
  );

  // Output mux

  mux4to1_N_bit #(16) output_mux (
      .A  (arithmetic_mux_out),
      .B  (shiftRotate_mux_out_16bit),
      .C  (compare_mux_out_16bit),
      .D  (logic_mux_out_16bit),
      .sel(s),
      .Y  (z)
  );

endmodule
