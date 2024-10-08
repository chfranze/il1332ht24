module comparator_slice (
    input  logic a0,
    input  logic b0,
    input  logic a1,
    input  logic b1,
    output logic g,
    output logic l
);
  // Intermediate signals for the NOT gates
  
  logic a0_inv, b0_inv, a1_inv, b1_inv;
  logic u1_out, u2_out, u3_out, u4_out, u5_out, u7_out, u8_out;

  // Inverting the inputs
  nand2_delay inv0 (
      .a(a0),
      .b(a0),
      .y(a0_inv)
  );
  nand2_delay inv1 (
      .a(a1),
      .b(a1),
      .y(a1_inv)
  );
  nand2_delay inv2 (
      .a(b0),
      .b(b0),
      .y(b0_inv)
  );
  nand2_delay inv3 (
      .a(b1),
      .b(b1),
      .y(b1_inv)
  );
  // g = a1 AND b1_inv OR a0 AND b1_inv AND b0_inv OR a1 AND a0 and b0_inv
  nand2_delay u1 (
      .a(a1),
      .b(b1_inv),
      .y(u1_out)
  );
  nand3_delay u2 (
      .a(a0),
      .b(b1_inv),
      .c(b0_inv),
      .y(u2_out)
  );
  nand3_delay u3 (
      .a(a0),
      .b(a1), // fixed
      .c(b0_inv),
      .y(u3_out)
  );
  nand3_delay u4 (
      .a(u1_out),
      .b(u2_out),
      .c(u3_out),
      .y(g)
  );
  // l = a1_inv AND b1 OR a0_inv AND a1_inv AND b0 OR b1 AND b0 and a0_inv
  nand2_delay u5 (
      .a(a1_inv),
      .b(b1),
      .y(u5_out)
  );
  nand3_delay u6 (
      .a(a0_inv),
      .b(a1_inv),
      .c(b0),
      .y(u6_out)
  );
  nand3_delay u7 (
      .a(b1),
      .b(b0),
      .c(a0_inv),
      .y(u7_out)
  );
  nand3_delay u8 (
      .a(u5_out),
      .b(u6_out),
      .c(u7_out),
      .y(l)
  );
endmodule
