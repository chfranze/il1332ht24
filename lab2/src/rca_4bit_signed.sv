module rca_4bit_signed (
    input logic signed [3:0] a,
    input logic signed [3:0] b,
    output logic signed [3:0] sum,
    output logic ovf,
    output logic uvf
);

    // Internal wires for carries
    logic co0, co1, co2, co3;

    // Full Adder instances
    full_adder_structural_half_adder_nand fa0 (.a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(co0));
    full_adder_structural_half_adder_nand fa1 (.a(a[1]), .b(b[1]), .cin(co0), .sum(sum[1]), .cout(co1));
    full_adder_structural_half_adder_nand fa2 (.a(a[2]), .b(b[2]), .cin(co1), .sum(sum[2]), .cout(co2));
    full_adder_structural_half_adder_nand fa3 (.a(a[3]), .b(b[3]), .cin(co2), .sum(sum[3]), .cout(co3));

    // Overflow and underflow detection
    assign ovf = (!co3) & co2;
    assign uvf = co3 & (!co2);

endmodule