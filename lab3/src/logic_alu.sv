module logic_alu (
    input  logic [ 7:0] x,
    input  logic [ 7:0] y,
    input  logic [ 1:0] m,
    output logic [7:0] z
);

  logic [15:0] mux_out;
  logic [7:0] and_out;
  logic [7:0] or_out;
  logic [7:0] not_out;



  genvar i;
  generate
    for (i = 0; i < 8; i++) begin : gen_and2
      and2_delay and_slice (
          x[i],
          y[i],
          and_out[i]
      );
    end
  endgenerate

  genvar i;
  generate
    for (i = 0; i < 8; i++) begin : gen_or2
      or2 or_slice (
          x[i],
          y[i],
          or_out[i]
      );
    end
  endgenerate

  genvar i;
  generate
    for (i = 0; i < 8; i++) begin : gen_xor2
      xor2_delay xor_slice (
          x[i],
          y[i],
          xor_out[i]
      );
    end
  endgenerate

genvar i;
  generate
    for (i = 0; i < 8; i++) begin : gen_not
      nand2_delay xor_slice (
          x[i],
          x[i],
          not_out[i]
      );
    end
  endgenerate



  mux4to1_N_bit #(8) mux (
      .A  (and_out),
      .B  (or_out),
      .C  (not_out),
      .D  (xor_out),
      .sel(m),
      .Y  (z)
  );

endmodule

