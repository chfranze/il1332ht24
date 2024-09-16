//-----------------------------------------------------------------------------
// Module: carry_logic_5
// Description:
// Author: Christoffer
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module carry_logic_5 (
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

nand2_delay u1 (
    .a(g5),
    .b(g5),
    .y(nand1_out)
);

nand2_delay u2 (
    .a(p5),
    .b(g4),
    .y(nand2_out)
);

nand3_delay u3 (
    .a(p5),
    .b(p4),
    .c(g3),
    .y(nand3_out)
);

nand4_delay u4 (
    .a(p5),
    .b(p4),
    .c(p3),
    .d(g2),
    .y(nand4_out)
);

nand5_delay u5 (
    .a(p5),
    .b(p4),
    .c(p3),
    .d(p2),
    .e(p1),
    .y(nand5_out)
);

nand6_delay u6 (
    .a(p5),
    .b(p4),
    .c(p3),
    .d(p2),
    .e(p1),
    .f(p0),
    .y(nand6_out)
);

nand7_delay u7 (
    .a(p5),
    .b(p4),
    .c(p3),
    .d(p2),
    .e(p1),
    .f(p0),
    .g(carry_in0),
    .y(nand6_out)
);

nand7_delay u8 (
  .a(nand1_out),
  .b(nand2_out),
  .c(nand3_out),
  .d(nand4_out),
  .e(nand5_out),
  .f(nand6_out),
  .g(nand7_out),
  .y(carry_out)
);

endmodule
