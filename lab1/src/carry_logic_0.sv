//-----------------------------------------------------------------------------
// Module: carry_logic_0
// Description:
// Author: Christoffer, Marcus
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module carry_logic_0 (
    input  logic p0,
    input  logic g0,
    input  logic carry_in0,
    output logic carry_out
);

    logic nand1_out;
    logic nand2_out;

nand2_delay u1 (
  .a(g0),
  .b(g0),
  .y(nand1_out)
);

nand2_delay u2 (
  .a(p0),
  .b(carry_in0),
  .y(nand2_out)
);

nand2_delay u3 (
  .a(nand1_out),
  .b(nand2_out),
  .y(carry_out)
);

endmodule
