module nand3 (
    input logic a,  // First input
    input logic b,  // Second input
    input logic c,  // Third input
    output logic y  // Output
);

    // NAND gate functionality
    assign y = ~(a & b & c);

endmodule