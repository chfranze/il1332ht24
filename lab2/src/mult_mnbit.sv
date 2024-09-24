module mult_mnbit #(
    parameter M = 4,
    parameter N = 4
) (
    input  logic [  M-1:0] a,
    input  logic [  N-1:0] b,
    output logic [M+N-1:0] Prod
);

  logic [M-1:0][N-1:0] prod_terms;
  logic [N-1:0] A0, B0, Sum0, A1, B1, Sum1, A2, B2, Sum2;
  logic co0, co1, co2;  // The three carry-outs from the three adders

  // Generate block to create the four product terms
  genvar i, j;
  generate
    for (i = 0; i < M; i++) begin : B_loop
      for (j = 0; j < N; j++) begin : A_loop
        and2 u_and (
            .a(a[i]),
            .b(b[j]),
            .y(prod_terms[j][i])
        );
      end
    end
  endgenerate

  // Adder logic
  assign Prod[0] = prod_terms[0][0];
  assign A0[N-1] = 1'b0;
  assign A0[N-2:0] = prod_terms[0][N-1:1];  // a3b0 a2b0 a1b0
  assign B0 = prod_terms[1];  // a3b1 a2b1 a1b1 a0b1

  rca_nbit #(N) u1 (
      .a(A0),
      .b(B0),
      .cin(1'b0),
      .sum(Sum0),
      .cout(co0)
  );

  assign A1[N-1] = co0;
  assign A1[N-2:0] = Sum0[N-1:1];
  assign Prod[1] = Sum0[0];
  assign B1 = prod_terms[2];  // a3b2 a2b2 a1b2 a0b2

  rca_nbit #(N) u2 (
      .a(A1),
      .b(B1),
      .cin(1'b0),
      .sum(Sum1),
      .cout(co1)
  );

  assign A2[N-1] = co1;
  assign A2[N-2:0] = Sum1[N-1:1];
  assign Prod[2] = Sum1[0];
  assign B2 = prod_terms[3];  // a3b3 a2b3 a1b3 a0b3

  rca_nbit #(N) u3 (
      .a(A2),
      .b(B2),
      .cin(1'b0),
      .sum(Sum2),
      .cout(co2)
  );

  assign Prod[N+2:3] = Sum2;
  assign Prod[M+N-1]   = co2;

endmodule
