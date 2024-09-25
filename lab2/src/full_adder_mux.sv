module full_adder_mux(
    input logic a,
    input logic b,
    input logic cin,
    output logic sum,
    output logic cout
);

logic S0_out, S1_out, S2_out, S3_out, S4_out, S5_out;

// Sum function

mux2to1_Nbit S0(
    1'b1,
    1'b0,
    a,
    S0_out
);

mux2to1_Nbit S1(
    1'b0,
    1'b1,
    a,
    S1_out
);

mux2to1_Nbit S2(
    1'b0,
    1'b1,
    a,
    S2_out
);

mux2to1_Nbit S3(
    1'b1,
    1'b0,
    a,
    S3_out
);

mux2to1_Nbit S4(
    S0_out,
    S1_out,
    b,
    S4_out
);

mux2to1_Nbit S5(
    S2_out,
    S3_out,
    b,
    S5_out
);

mux2to1_Nbit S6(
    S4_out,
    S5_out,
    cin,
    sum
);

// Carry-out function

logic C0_out, C1_out, C2_out, C3_out, C4_out, C5_out;

mux2to1_Nbit C0(
    1'b1,
    1'b1,
    a,
    C0_out
);

mux2to1_Nbit C1(
    1'b1,
    1'b0,
    a,
    C1_out
);

mux2to1_Nbit C2(
    1'b1,
    1'b0,
    a,
    C2_out
);

mux2to1_Nbit C3(
    1'b0,
    1'b0,
    a,
    C3_out
);

mux2to1_Nbit C4(
    C0_out,
    C1_out,
    b,
    C4_out
);

mux2to1_Nbit C5(
    C2_out,
    C3_out,
    b,
    C5_out
);

mux2to1_Nbit C6(
    C4_out,
    C5_out,
    cin,
    cout
);

endmodule