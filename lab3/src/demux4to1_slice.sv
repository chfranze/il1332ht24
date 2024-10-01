module demux4to1_slice (
    input logic y,
    input logic [1:0] s,
    output logic a,
    output logic b,
    output logic c,
    output logic d
);

  logic s0, s1, s0_inv, s1_inv;

  assign s0 = s[0];
  assign s1 = s[1];

  nand2_delay inv0 (
      .a(s0),
      .b(s0),
      .y(s0_inv)
  );

  nand2_delay inv1 (
      .a(s1),
      .b(s1),
      .y(s1_inv)
  );

  and3_delay U1 (
      .a(y),
      .b(s1_inv),
      .c(s0_inv)
  );

  and3_delay U2 (
      .a(y),
      .b(s1_inv),
      .c(s0)
  );

  and3_delay U3 (
      .a(y),
      .b(s1),
      .c(s0_inv)
  );

  and3_delay U4 (
      .a(y),
      .b(s1),
      .c(s0)
  );



endmodule
