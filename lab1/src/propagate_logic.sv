module propagate_logic (
    input  logic a,
    input  logic b,
    output logic p,
    output logic g
);

    logic nand1_out;
    logic nand2_out;
    logic nand4_out;

// Start of a input propogate logic
nand2_out u1 (
    .a(a),
    .b(a),
    .y(nand1_out)
);

// Start of b propogate logic
nand2_out u2 (
    .a(b),
    .b(b),
    .y(nand2_out)
);

// Output of propogate logic
nand2_out u3 (
    .a(nand1_out),
    .b(nand2_out),
    .y(p)
);

// Start of generate logic
nand2_out u4 (
    .a(a),
    .b(b),
    .y(nand4_out)
);

// Output of generate logic
nand2_out u5 (
    .a(nand4_out),
    .b(nand4_out),
    .y(g)
);

endmodule
