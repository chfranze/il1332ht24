//-----------------------------------------------------------------------------
// Module: carry_logic_4
// Description:
// Author: Christoffer
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module carry_logic_4 (
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
    input  logic carry_in0,
    output logic carry_out
);

    logic nand1_out;
    logic nand2_out;
    logic nand3_out;
    logic nand4_out;
    logic nand5_out;
    logic nand6_out;

nand2_delay u1 (
    .a(g4),
    .b(g4),
    .y(nand1_out)
);

nand2_delay u2 (
    .a(p4),
    .b(g3),
    .y(nand2_out)
);

nand3_delay u3 (
    .a(p4),
    .b(p3),
    .c(g2),
    .y(nand3_out)
);

nand4_delay u4 (
    .a(p4),
    .b(p3),
    .c(p2),
    .d(g1),
    .y(nand4_out)
);

nand5_delay u5 (
    .in1(p4),
    .in2(p3),
    .in3(p2),
    .in4(p1),
    .in5(p0),
    .out(nand5_out)
);

nand6_delay u6 (
    .in1(p4),
    .in2(p3),
    .in3(p2),
    .in4(p1),
    .in5(p0),
    .in6(carry_in0),
    .out(nand6_out)
);

nand6_delay u7 (
  .in1(nand1_out),
  .in2(nand2_out),
  .in3(nand3_out),
  .in4(nand4_out),
  .in5(nand5_out),
  .in6(nand6_out),
  .out(carry_out)
);

endmodule
