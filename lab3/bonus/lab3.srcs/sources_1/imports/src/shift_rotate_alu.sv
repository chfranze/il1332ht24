module shift_rotate_alu (
    input  logic [3:0] x,
    input  logic [3:0] y,
    input  logic [1:0] m,
    output logic [3:0] z
);

  logic mux_0r_out, mux_0l_out, mux_1r_out, mux_1l_out, mux_2r_out, mux_2l_out;

  logic [3:0] step1_out, step2_out, step3_out;

    logic s0;
    logic [1:0] control;
    assign control[1] = 1'b1;
    assign control[0] = ~m[0];
    

//step 1
  mux2to1_Nbit #(1) mux_0r (
      .A  (1'b0),
      .B  (x[3]),
      .s(m[1]),
      .Y  (mux_0r_out)
  );

  mux2to1_Nbit #(1) mux_0l (
      .A  (1'b0),
      .B  (x[0]),
      .s(m[1]),
      .Y  (mux_0l_out)
  );

  mux4to1_N_bit #(1) mux_00 (
      .A  (x[0]),
      .B  (1'b0),
      .C  (mux_0r_out),
      .D  (x[1]),
      .sel(control),
      .Y  (step1_out[0])
  );

  genvar i;
  generate
    for (i = 1; i < 3; i = i + 1) begin : rotate_by_1
      mux4to1_N_bit #(1) mux_0 (
          .A  (x[i]),
          .B  (1'b0),
          .C  (x[i-1]),
          .D  (x[i+1]),
          .sel(control),
          .Y  (step1_out[i])
      );
    end
  endgenerate

  mux4to1_N_bit #(1) mux_07 (
      .A  (x[3]),
      .B  (1'b0),
      .C  (x[2]),
      .D  (mux_0l_out),
      .sel(control),
      .Y  (step1_out[3])
  );

  assign z = step1_out;

endmodule
