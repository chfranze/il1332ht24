//-----------------------------------------------------------------------------
// Module: propagate_logic
// Description: This module implements the propagate logic using NAND gates. PowerPoint L4 S34
// Author: Christoffer, Marcus
//-----------------------------------------------------------------------------
// Inputs:
//   a - Input logic signal
//   b - Input logic signal
// Outputs:
//   p - Propagate output logic signal
//   g - Generate output logic signal
//-----------------------------------------------------------------------------

module propagate_logic (
    input  logic a,
    input  logic b,
    output logic p
);

    logic nand1_out;
    logic nand2_out;

// Start of a input propogate logic
nand2_delay u1 (
    .a(a),
    .b(a),
    .y(nand1_out)
);

// Start of b propogate logic
nand2_delay u2 (
    .a(b),
    .b(b),
    .y(nand2_out)
);

// Output of propogate logic
nand2_delay u3 (
    .a(nand1_out),
    .b(nand2_out),
    .y(p)
);

endmodule
