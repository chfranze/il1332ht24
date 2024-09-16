module cla_8bit (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [8:0] sum
);

  logic [7:0] P, G; // Propagate and Generate
  logic [8:0] C; // Carry

  // Propagate Logic
  genvar i;
  generate
    for (i=0; i < 8; i++)
      begin : generate_PL
        propagate_logic pl (.a(a[i]), .b(a[i]), .p(P[i]));
      end
  endgenerate

  // Generate Logic
  genvar j;
  generate
    for (j=0; j < 8; j++)
      begin : generate_GL
        generate_logic gl (.a(a[j]), .b(b[j]), .g(C[j]));
      end
  endgenerate

  // // Sum Logic
  // genvar k;
  // generate
  //   for (k=0; k < 8; k++)
  //     begin : generate_SL
  //       sum_logic sl (.a(a[k]), .b(b[k]), .carry_in(C[k]), .sum(sum[k]));
  //     end
  // endgenerate

  // Sum Logic
  sum_logic sl_0 (
    .a(a[0]),
    .b(b[0]),
    .carry_in(C[0]),
    .sum(sum[0])
  );

  // Sum Logic
  sum_logic sl_1 (
    .a(a[1]),
    .b(b[1]),
    .carry_in(C[1]),
    .sum(sum[1])
  );

  // Sum Logic
  sum_logic sl_2 (
    .a(a[2]),
    .b(b[2]),
    .carry_in(C[2]),
    .sum(sum[2])
  );

  // Sum Logic
  sum_logic sl_3 (
    .a(a[3]),
    .b(b[3]),
    .carry_in(C[3]),
    .sum(sum[3])
  );

  // Sum Logic
  sum_logic sl_4 (
    .a(a[4]),
    .b(b[4]),
    .carry_in(C[4]),
    .sum(sum[4])
  );

  // Sum Logic
  sum_logic sl_5 (
    .a(a[5]),
    .b(b[5]),
    .carry_in(C[5]),
    .sum(sum[5])
  );
    
  // Sum Logic
  sum_logic sl_6 (
    .a(a[6]),
    .b(b[6]),
    .carry_in(C[6]),
    .sum(sum[6])
  );

  // Sum Logic
  sum_logic sl_7 (
    .a(a[7]),
    .b(b[7]),
    .carry_in(C[7]),
    .sum(sum[7])
  );

  // Last Sum Logic
  sum_logic sl_8 (
    .a(a[7]),
    .b(b[7]),
    .carry_in(C[8]),
    .sum(sum[8])
  );

  assign C[0] = 1'b0; // cin is 0

  //Slice 1
  carry_logic_0 cl0 (.p0(P[0]), .g0(G[0]), .carry_in0(1'b0), .carry_out(C[1]));

  //Slice 2
  carry_logic_1 cl1 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .carry_in0(1'b0), .carry_out(C[2]));

  //Slice 3
  carry_logic_2 cl2 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .carry_in0(1'b0), .carry_out(C[3]));

  //Slice 4
  carry_logic_3 cl3 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .carry_in0(1'b0), .carry_out(C[4]));

  //Slice 5
  carry_logic_4 cl4 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .carry_in0(1'b0), .carry_out(C[5]));

  //Slice 6
  carry_logic_5 cl5 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .carry_in0(1'b0), .carry_out(C[6]));

  //Slice 7
  carry_logic_6 cl6 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .p6(P[6]), .g6(G[6]), .carry_in0(1'b0), .carry_out(C[7]));

  // Slice 8 implements sign extension
  carry_logic_7 cl7 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .p6(P[6]), .g6(G[6]), .p7(P[7]), .g7(G[7]), .carry_in0(1'b0), .carry_out(C[8]));

endmodule
