module mult_mnbit #(
    parameter M = 4,
    parameter N = 4
) (
    input  logic [M-1:0] a,  // Input A (signed)
    input  logic [N-1:0] b,  // Input B (signed)
    output logic [M+N-1:0] Prod  // Output Product (signed)
);

  logic [M-1:0] abs_a;         // Absolute value of A
  logic [N-1:0] abs_b;         // Absolute value of B
  logic [M+N-1:0] abs_prod;    // Absolute value of product
  logic sign_a, sign_b, sign_prod;  // Signs of A, B, and the product

  // Temporary signals for 2's complement inversion
  logic [M-1:0] inv_a;
  logic [N-1:0] inv_b;
  logic [M+N-1:0] inv_prod;

  // Instantiating the 2's complement inverter module
  twos_complement_inverter #(M) inv_A (
    .a(a),
    .y(inv_a)
  );

  twos_complement_inverter #(N) inv_B (
    .a(b),
    .y(inv_b)
  );

  mux2to1_Nbit #(M) input_mux_a (
    inv_a,
    a,
    a[M-1],
    abs_a
  );

  mux2to1_Nbit #(N) input_mux_b (
    inv_b,
    b,
    b[N-1],
    abs_b
  );

  // Step 3: Multiply the absolute values using the original logic
  logic [M-1:0][N-1:0] prod_terms;
  logic [N-1:0] A0, B0, Sum0, A1, B1, Sum1, A2, B2, Sum2;
  logic co0, co1, co2;  // The three carry-outs from the three adders

  genvar i, j;
  generate
    for (i = 0; i < M; i++) begin : B_loop
      for (j = 0; j < N; j++) begin : A_loop
        and2 u_and (
            .a(abs_a[i]),
            .b(abs_b[j]),
            .y(prod_terms[j][i])
        );
      end
    end
  endgenerate

  // Adder logic (unchanged)
  assign abs_prod[0] = prod_terms[0][0];
  assign A0[N-1] = 1'b0;
  assign A0[N-2:0] = prod_terms[0][N-1:1];
  assign B0 = prod_terms[1];

  rca_nbit #(N) u1 (
      .a(A0),
      .b(B0),
      .cin(1'b0),
      .sum(Sum0),
      .cout(co0)
  );

  assign A1[N-1] = co0;
  assign A1[N-2:0] = Sum0[N-1:1];
  assign abs_prod[1] = Sum0[0];
  assign B1 = prod_terms[2];

  rca_nbit #(N) u2 (
      .a(A1),
      .b(B1),
      .cin(1'b0),
      .sum(Sum1),
      .cout(co1)
  );

  assign A2[N-1] = co1;
  assign A2[N-2:0] = Sum1[N-1:1];
  assign abs_prod[2] = Sum1[0];
  assign B2 = prod_terms[3];

  rca_nbit #(N) u3 (
      .a(A2),
      .b(B2),
      .cin(1'b0),
      .sum(Sum2),
      .cout(co2)
  );

  assign abs_prod[M+N-2:3] = Sum2;
  assign abs_prod[M+N-1]   = co2;

  // Step 5: If the result should be negative, invert the absolute product
  twos_complement_inverter #(M+N) inv_Prod (
    .a(abs_prod),
    .y(inv_prod)
  );

  logic select_output;

  xor2 aorb (
    a[M-1],
    b[N-1],
    select_output
  );

  mux2to1_Nbit #(M+N) output_mux (
    inv_prod,
    abs_prod,
    select_output,
    Prod
  );

endmodule
