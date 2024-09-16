//-----------------------------------------------------------------------------
// Module: carry_logic_7
// Description:
// Author: Christoffer
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module carry_logic_7 (
    input  logic p0,
    input  logic g0,  
    input  logic p1,
    input  logic g1,
    input  logic p2,
    input  logic g2,
    input  logic p3,
    input  logic g3,
    input  logic p4,
    input  logic g4,
    input  logic p5,
    input  logic g5,
    input  logic p6,
    input  logic g6,
    input  logic p7,
    input  logic g7,
    input  logic carry_in0,
    output logic carry_out
);

    logic nand1_out;
    logic nand2_out;
    logic nand3_out;
    logic nand4_out;
    logic nand5_out;
    logic nand6_out;
    logic nand7_out;
    logic nand8_out;
    logic nand9_out;

nand2_delay u1 (
    .a(g7),
    .b(g7),
    .y(nand1_out)
);

nand2_delay u2 (
    .a(p7),
    .b(g6),
    .y(nand2_out)
);

nand3_delay u3 (
    .a(p7),
    .b(p6),
    .c(g5),
    .y(nand3_out)
);

nand4_delay u4 (
    .a(p7),
    .b(p6),
    .c(p5),
    .d(g4),
    .y(nand4_out)
);

nand5_delay u5 (
    .a(p7),
    .b(p6),
    .c(p5),
    .d(p4),
    .e(p3),
    .y(nand5_out)
);

nand6_delay u6 (
    .a(p7),
    .b(p6),
    .c(p5),
    .d(p4),
    .e(p3),
    .f(p2),
    .y(nand6_out)
);

nand7_delay u7 (
    .a(p7),
    .b(p6),
    .c(p5),
    .d(p4),
    .e(p3),
    .f(p2),
    .g(p1),
    .y(nand6_out)
);

nand8_delay u8 (
    .a(p7),
    .b(p6),
    .c(p5),
    .d(p4),
    .e(p3),
    .f(p2),
    .g(p1),
    .h(p0),
    .y(nand7_out)
);

nand9_delay u9 (
    .a(p7),
    .b(p6),
    .c(p5),
    .d(p4),
    .e(p3),
    .f(p2),
    .g(p1),
    .h(p0),
    .i(carry_in0),
    .y(nand8_out)
);

nand9_delay u10 (
  .a(nand1_out),
  .b(nand2_out),
  .c(nand3_out),
  .d(nand4_out),
  .e(nand5_out),
  .f(nand6_out),
  .g(nand7_out),
  .h(nand7_out),
  .i(nand8_out),
  .y(carry_out)
);

endmodule
