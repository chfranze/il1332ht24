module cla_8bit (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [8:0] sum
);
  //TODO: Complete the code

  logic [7:0] p, g; // Propagate and Generate
  logic [8:0] c; // Carry

  

  // Propagate Logic
  genvar i;
  generate
    for (i=0; i < 8; i++)
      begin : generate_PL
        propagate_logic pl (
          .a(a[i]),
          .b(b[i]),
          .p(p[i])
        );
      end
  endgenerate

  // Generate Logic
  genvar j;
  generate
    for (j=0; j < 8; j++)
      begin : generate_GL
        generate_logic gl (
          .a(a[j]),
          .b(b[j]),
          .g(g[j])
        );
      end
  endgenerate

  // Sum Logic
  genvar k;
  generate
    for (k=0; k < 8; k++)
      begin : generate_SL
        sum_logic sl (
          .a(a[k]),
          .b(b[k]),
          .cin(c[k]),
          .s(sum[k])
        );
      end
  endgenerate

  // Last Sum Logic
  sum_logic sl_8 (
    .a(a[7]),
    .b(b[7]),
    .cin(c[8]),
    .s(sum[8])
  );

  assign c[0] = 1'b0; // cin is 0

  //Slice 1
  carry_logic_0 cl0 (.p0(p[0]), .g0(g[0]), .carry_in0(1'b0), .carry_out(c[1]));

  //Slice 2
  carry_logic_1 cl1 (.p0(p[0]), .g0(g[0]), .p1(p[1]), .g1(g[1]), .carry_in0(1'b0), .carry_out(c[2]));

  //Slice 3
  carry_logic_2 cl2 (.p0(p[0]), .g0(g[0]), .p1(p[1]), .g1(g[1]), .p1(p[2]), .g1(g[2]), .carry_in0(1'b0), .carry_out(c[3]));

  //Slice 4
  carry_logic_3 cl3 (.p0(p[0]), .g0(g[0]), .p1(p[1]), .g1(g[1]), .p1(p[2]), .g1(g[2]), .p1(p[3]), .g1(g[3]), .carry_in0(1'b0), .carry_out(c[4]));

  //Slice 5
  carry_logic_4 cl4 (.p0(p[0]), .g0(g[0]), .p1(p[1]), .g1(g[1]), .p1(p[2]), .g1(g[2]), .p1(p[3]), .g1(g[3]), .p1(p[4]), .g1(g[4]), .carry_in0(1'b0), .carry_out(c[5]));

  //Slice 6
  carry_logic_5 cl5 (.p0(p[0]), .g0(g[0]), .p1(p[1]), .g1(g[1]), .p1(p[2]), .g1(g[2]), .p1(p[3]), .g1(g[3]), .p1(p[4]), .g1(g[4]), .p1(p[5]), .g1(g[5]), .carry_in0(1'b0), .carry_out(c[6]));

  //Slice 7
  carry_logic_6 cl6 (.p0(p[0]), .g0(g[0]), .p1(p[1]), .g1(g[1]), .p1(p[2]), .g1(g[2]), .p1(p[3]), .g1(g[3]), .p1(p[4]), .g1(g[4]), .p1(p[5]), .g1(g[5]), .p1(p[6]), .g1(g[6]), .carry_in0(1'b0), .carry_out(c[7]));

  // Slice 8 implements sign extension
  carry_logic_7 cl7 (.p0(p[0]), .g0(g[0]), .p1(p[1]), .g1(g[1]), .p1(p[2]), .g1(g[2]), .p1(p[3]), .g1(g[3]), .p1(p[4]), .g1(g[4]), .p1(p[5]), .g1(g[5]), .p1(p[6]), .g1(g[6]), .p1(p[7]), .g1(g[7]), .carry_in0(1'b0), .carry_out(c[8]));


endmodule
