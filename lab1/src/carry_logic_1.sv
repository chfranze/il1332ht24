//-----------------------------------------------------------------------------
// Module: carry_logic_1
// Description:
// Author: Christoffer
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module carry_logic_1 (
    input  logic p0,
    input  logic g0,  
    input  logic p1,
    input  logic g1,
    input  logic carry_in0,
    output logic carry_out
);

    logic nand1_out;
    logic nand2_out;
    logic nand3_out;

nand2_delay u1 (
    .a(g1),
    .b(g1),
    .y(nand1_out)
);

nand2_delay u2 (
    .a(p1),
    .b(g0),
    .y(nand2_out)
);

nand3_delay u3 (
    .a(p1),
    .b(p0),
    .c(carry_in0),
    .y(nand3_out)
);

nand3_delay u4 (
  .a(nand1_out),
  .b(nand2_out),
  .c(nand3_out),
  .y(carry_out)
);

endmodule
