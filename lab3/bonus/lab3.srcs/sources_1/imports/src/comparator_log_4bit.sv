module comparator_log_4bit (
    input logic [3:0] A,
    input logic [3:0] B,
    output logic g,
    output logic l
);

  logic cs1_g, cs1_l, cs2_g, cs2_l;

  comparator_slice cs1 (
      .a0(A[0]),
      .b0(B[0]),
      .a1(A[1]),
      .b1(B[1]),
      .g (cs1_g),
      .l (cs1_l)
  );

  comparator_slice cs2 (
      .a0(A[2]),
      .b0(B[2]),
      .a1(A[3]),
      .b1(B[3]),
      .g (cs2_g),
      .l (cs2_l)
  );

  comparator_slice cs3 (
      .a0(cs1_g),
      .b0(cs1_l),
      .a1(cs2_g),
      .b1(cs2_l),
      .g (g),
      .l (l)
  );

endmodule
