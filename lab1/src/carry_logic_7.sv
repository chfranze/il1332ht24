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
    .in1(p7),
    .in2(p6),
    .in3(p5),
    .in4(p4),
    .in5(p3),
    .out(nand5_out)
);

nand6_delay u6 (
    .in1(p7),
    .in2(p6),
    .in3(p5),
    .in4(p4),
    .in5(p3),
    .in6(p2),
    .out(nand6_out)
);

nand7_delay u7 (
    .in1(p7),
    .in2(p6),
    .in3(p5),
    .in4(p4),
    .in5(p3),
    .in6(p2),
    .in7(p1),
    .out(nand6_out)
);

nand8_delay u8 (
    .in1(p7),
    .in2(p6),
    .in3(p5),
    .in4(p4),
    .in5(p3),
    .in6(p2),
    .in7(p1),
    .in8(p0),
    .out(nand7_out)
);

nand9_delay u9 (
    .in1(p7),
    .in2(p6),
    .in3(p5),
    .in4(p4),
    .in5(p3),
    .in6(p2),
    .in7(p1),
    .in8(p0),
    .in9(carry_in0),
    .out(nand8_out)
);

nand9_delay u10 (
  .in1(nand1_out),
  .in2(nand2_out),
  .in3(nand3_out),
  .in4(nand4_out),
  .in5(nand5_out),
  .in6(nand6_out),
  .in7(nand7_out),
  .in8(nand7_out),
  .in9(nand8_out),
  .out(carry_out)
);

endmodule
