//-----------------------------------------------------------------------------
// Module: carry_logic_6
// Description:
// Author: Christoffer
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module carry_logic_6 (
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
    input  logic carry_in5,
    output logic carry_out6
);

    logic nand1_out;
    logic nand2_out;
    logic nand3_out;
    logic nand4_out;
    logic nand5_out;
    logic nand6_out;
    logic nand7_out;
    logic nand8_out;

nand2_delay u1 (
    .a(g6),
    .b(g6),
    .y(nand1_out)
);

nand2_delay u2 (
    .a(p6),
    .b(g5),
    .y(nand2_out)
);

nand3_delay u3 (
    .a(p6),
    .b(p5),
    .c(g4),
    .y(nand3_out)
);

nand4_delay u4 (
    .a(p6),
    .b(p5),
    .c(p4),
    .d(g3),
    .y(nand4_out)
);

nand5_delay u5 (
    .in1(p6),
    .in2(p5),
    .in3(p4),
    .in4(p3),
    .in5(p2),
    .out(nand5_out)
);

nand6_delay u6 (
    .in1(p6),
    .in2(p5),
    .in3(p4),
    .in4(p3),
    .in5(p2),
    .in6(p1),
    .out(nand6_out)
);

nand7_delay u7 (
    .in1(p6),
    .in2(p5),
    .in3(p4),
    .in4(p3),
    .in5(p2),
    .in6(p1),
    .in7(p0),
    .out(nand7_out)
);

nand8_delay u8 (
    .in1(p6),
    .in2(p5),
    .in3(p4),
    .in4(p3),
    .in5(p2),
    .in6(p1),
    .in7(p0),
    .in8(carry_in5),
    .out(nand8_out)
);

nand8_delay u9 (
  .in1(nand1_out),
  .in2(nand2_out),
  .in3(nand3_out),
  .in4(nand4_out),
  .in5(nand5_out),
  .in6(nand6_out),
  .in7(nand7_out),
  .in8(nand8_out),
  .out(carry_out6)
);

endmodule
