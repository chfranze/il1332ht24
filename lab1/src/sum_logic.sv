//-----------------------------------------------------------------------------
// Module: sum_logic
// Description:
// Author: Christoffer, Marcus
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------


module sum_logic (
    input  logic a,
    input  logic b,
    input  logic carry_in,
    output logic sum
);

    logic xor1_out;

xor2_delay x1 (
    .a(a),
    .b(b),
    .y(xor1_out)
);

xor2_delay x2 (
    .a(carry_in),
    .b(xor1_out),
    .y(sum)
);

endmodule
