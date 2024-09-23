module full_adder_structural_half_adder_nand(
    input logic a,
    input logic b,
    input logic cin,
    output logic sum,
    output logic cout
);

// Intermediate signals
logic sum1, carry1, carry2;

// Instantiate the first half adder
half_adder HA1 (a, b, sum1, carry1);

// Instantiate the second half adder
half_adder HA2 (sum1, cin, sum, carry2);

// Instantiate the two-input NAND gate for the carry out
nand2 N2 (carry1, carry2, cout);

endmodule