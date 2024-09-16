//-----------------------------------------------------------------------------
// Module: nand8_delay
// Description:
// Author: Arvid
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module nand8_delay (
    input  logic in1,
    input  logic in2,
    input  logic in3,
    input  logic in4,
    input  logic in5,
    input  logic in6,
    input  logic in7,
    input  logic in8,
    output logic out
);

  logic nand1_out;
  logic nand2_out;
  logic nand3_out;
  logic nand4_out;
  logic nand5_out;
  logic nand6_out;

  nand3_delay u1 (
      .a(in1),
      .b(in2),
      .c(in3),
      .y(nand1_out)
  );

  nand3_delay u2 (
      .a(in4),
      .b(in5),
      .c(in6),
      .y(nand2_out)
  );

  nand2_delay u3 (
      .a(in7),
      .b(in8),
      .y(nand3_out)
  );

  // Equivalent to NOT gate for nand1_out
  nand2_delay u4 (
      .a(nand1_out),
      .b(nand1_out),
      .y(nand4_out)
  );

  // Equivalent to NOT gate for nand2_out
  nand2_delay u5 (
      .a(nand2_out),
      .b(nand2_out),
      .y(nand5_out)
  );

  // Equivalent to NOT gate for nand3_out
  nand2_delay u6 (
      .a(nand3_out),
      .b(nand3_out),
      .y(nand6_out)
  );

  // Final 3-input NAND gate
  nand3_delay u7 (
      .a(nand4_out),
      .b(nand5_out),
      .c(nand6_out),
      .y(out)
  );

endmodule
