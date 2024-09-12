//-----------------------------------------------------------------------------
// Module: generate_logic
// Description:
// Author: Christoffer, Marcus
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module generate_logic (
    input  logic a,
    input  logic b,
    output logic g
);

    logic nand1_out;

nand2_out u1 (
    .a(b),
    .b(b),
    .y(nand1_out)
);

nand2_out u2 (
    .a(nand1_out),
    .b(nand1_out),
    .y(g)
);

endmodule
