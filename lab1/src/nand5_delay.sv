//-----------------------------------------------------------------------------
// Module: nand5_delay
// Description:
// Author: Christoffer
//-----------------------------------------------------------------------------
// Inputs:
// Outputs:
//-----------------------------------------------------------------------------

module nand5_delay (
    input  logic in1,
    input  logic in2,
    input  logic in3,
    input  logic in4,
    input  logic in5,
    output logic out
);

    logic nand1_out;
    logic nand2_out;
    logic nand3_out;
    logic nand4_out;

nand2_delay u1 (
    .a(in1),
    .b(in2),
    .y(nand1_out)
);

nand2_delay u2 (
    .a(in3),
    .b(in4),
    .y(nand2_out)
);

// Equivalent to NOT gate for nand1_out
nand2_delay u3 (
    .a(nand1_out),
    .b(nand1_out),
    .y(nand3_out)
);

// Equivalent to NOT gate for nand2_out
nand2_delay u4 (
    .a(nand2_out),
    .b(nand2_out),
    .y(nand4_out)
);

// Final 3-input NAND gate
nand3_delay u5 (
    .a(nand3_out),
    .b(nand4_out),
    .c(in5),
    .y(out)
);

endmodule
