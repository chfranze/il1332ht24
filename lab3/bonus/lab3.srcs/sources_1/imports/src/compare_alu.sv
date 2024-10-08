module compare_alu (
    input  logic [ 3:0] x,
    input  logic [ 3:0] y,
    input  logic [ 1:0] m,
    output logic z
);

  logic g;
  logic l;
  logic equal;
  logic not_equal;


comparator_Nbit #(4) comp (
    x,
    y,
    g,
    l
);

and2_delay equal_and (
    ~g,
    ~l,
    equal
);

xor2_delay not_equal_xor (
    g,
    l,
    not_equal
);


  mux4to1_N_bit #(1) mux (
      .A  (g),
      .B  (l),
      .C  (equal),
      .D  (not_equal),
      .sel(m),
      .Y  (z)
  );

endmodule

