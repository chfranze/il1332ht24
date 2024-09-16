//-----------------------------------------------------------------------------
// Module: carry_logic_2
// Description:
// Author: Christoffer
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module carry_logic_2 (
    input  logic p0,
    input  logic g0,  
    input  logic p1,
    input  logic g1,
    input  logic p2,
    input  logic g2,
    input  logic carry_in0,
    output logic carry_out
);

    logic nand1_out;
    logic nand2_out;
    logic nand3_out;
    logic nand4_out;

nand2_delay u1 (
    .a(g2),
    .b(g2),
    .y(nand1_out)
);

nand2_delay u2 (
    .a(p2),
    .b(g1),
    .y(nand2_out)
);

nand3_delay u3 (
    .a(p2),
    .b(p1),
    .c(g0),
    .y(nand3_out)
);

nand4_delay u4 (
    .a(p2),
    .b(p1),
    .c(p0),
    .d(carry_in0)
    .y(nand4_out)
);

nand4_delay u5 (
  .a(nand1_out),
  .b(nand2_out),
  .c(nand3_out),
  .d(nand4_out),
  .y(carry_out)
);

endmodule
