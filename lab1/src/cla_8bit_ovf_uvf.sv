module cla_8bit_ovf_uvf (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] out,
    output logic ovf, uvf
);

  logic [7:0] P, G;  // Propagate and Generate
  logic [8:0] C;     // Carry
  logic [7:0] sum;   // Sum

  // Overflow
  assign ovf = (~a[7] & ~b[7]) & sum[7];

  // Underflow: Occurs when two negative numbers produce a positive result
  assign uvf = (a[7] & b[7]) & ~sum[7];

  logic [7:0] temp_out;

  // Mux for output based on overflow: If ovf is 1, set out to 8'b11111111, else sum
  mux2to1_Nbit #(8) m1 (  // Overflow mux
    .A(8'b01111111),
    .B(sum),
    .s(ovf),
    .Y(temp_out)
  );

  mux2to1_Nbit #(8) m2 ( // Underflow mux
      .A(8'b10000000),       // Output from the overflow mux
      .B(temp_out),               // Underflow value
      .s(uvf),               // Select signal for underflow
      .Y(out)          // Output of the mux
  );

  // Propagate Logic
  genvar i;
  generate
    for (i = 0; i < 8; i++) begin : generate_PL
      propagate_logic pl (.a(a[i]), .b(b[i]), .p(P[i]));
    end
  endgenerate

  // Generate Logic
  genvar j;
  generate
    for (j = 0; j < 8; j++) begin : generate_GL
      generate_logic gl (.a(a[j]), .b(b[j]), .g(G[j]));
    end
  endgenerate

  // Sum Logic
  genvar k;
  generate
    for (k = 0; k < 8; k++) begin : generate_SL
      sum_logic sl (.a(a[k]), .b(b[k]), .carry_in(C[k]), .sum(sum[k]));
    end
  endgenerate

  // Initialize carry-in as 0
  assign C[0] = 1'b0;

  // Carry Logic Slices
  carry_logic_0 cl0 (.p0(P[0]), .g0(G[0]), .carry_in0(1'b0), .carry_out(C[1]));
  carry_logic_1 cl1 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .carry_in0(C[1]), .carry_out1(C[2]));
  carry_logic_2 cl2 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .carry_in1(C[2]), .carry_out2(C[3]));
  carry_logic_3 cl3 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .carry_in2(C[3]), .carry_out3(C[4]));
  carry_logic_4 cl4 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .carry_in3(C[4]), .carry_out4(C[5]));
  carry_logic_5 cl5 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .carry_in4(C[5]), .carry_out5(C[6]));
  carry_logic_6 cl6 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .p6(P[6]), .g6(G[6]), .carry_in5(C[6]), .carry_out6(C[7]));
  carry_logic_7 cl7 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), .p3(P[3]), .g3(G[3]), .p4(P[4]), .g4(G[4]), .p5(P[5]), .g5(G[5]), .p6(P[6]), .g6(G[6]), .p7(P[7]), .g7(G[7]), .carry_in6(C[7]), .carry_out7(C[8]));

endmodule
