module cla_8bit_ovf_uvf (
//module cla_8bit (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] out,
    output logic ovf, uvf
);

  logic [7:0] P, G; // Propagate and Generate
  logic [8:0] C; // Carry
  logic [7:0] sum;

  assign ovf = C[8]; 

  mux2to1_Nbit #(.N(8)) m1 (
    .A(sum),
    .B(8'b01111111),
    .s(ovf),
    .Y(out)
  );

  // Propagate Logic
  genvar i;
  generate
    for (i=0; i < 8; i++)
      begin : generate_PL
        propagate_logic pl (.a(a[i]), .b(b[i]), .p(P[i]));
      end
  endgenerate

  // Generate Logic
  genvar j;
  generate
    for (j=0; j < 8; j++)
      begin : generate_GL
        generate_logic gl (.a(a[j]), .b(b[j]), .g(G[j]));
      end
  endgenerate

  // // Sum Logic
  genvar k;
  generate
    for (k=0; k < 8; k++)
      begin : generate_SL
        sum_logic sl (.a(a[k]), .b(b[k]), .carry_in(C[k]), .sum(sum[k]));
      end
  endgenerate

  // // Last Sum Logic
  // sum_logic sl_8 (
  //   .a(a[7]),
  //   .b(b[7]),
  //   .carry_in(C[8]),
  //   .sum(sum[8])
  // );

  assign C[0] = 1'b0; // cin is 0

  //Slice 1
  carry_logic_0 cl0 (.p0(P[0]), .g0(G[0]), .carry_in0(1'b0), .carry_out(C[1]));

  //Slice 2
  carry_logic_1 cl1 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .carry_in0(1'b0), .carry_out1(C[2]));

  //Slice 3
  carry_logic_2 cl2 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .carry_in1(1'b0), .carry_out2(C[3]));

  //Slice 4
  carry_logic_3 cl3 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .carry_in2(1'b0), .carry_out3(C[4]));

  //Slice 5
  carry_logic_4 cl4 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .carry_in3(1'b0), .carry_out4(C[5]));

  //Slice 6
  carry_logic_5 cl5 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .carry_in4(1'b0), .carry_out5(C[6]));

  //Slice 7
  carry_logic_6 cl6 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .p6(P[6]), .g6(G[6]), .carry_in5(1'b0), .carry_out6(C[7]));

  // Slice 8 implements sign extension
  carry_logic_7 cl7 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .p6(P[6]), .g6(G[6]), .p7(P[7]), .g7(G[7]), .carry_in6(1'b0), .carry_out7(C[8]));

endmodule
