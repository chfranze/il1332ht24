module A_tb_bouns #(
    parameter M = 4,
    parameter N = 4
) ();

logic [3:0] a0, a1, a2, a3, a4, a5, a6, a7;

logic [7:0] mult0_out, mult1_out, mult2_out, mult3_out;

logic [8:0] add0_out;
logic [9:0] add1_out;
logic [10:0] add2_out;
// logic [11:0] add3_out;
// logic [12:0] add4_out;

// Instantiate the mult_mnbit_unsigned module
mult_mnbit_unsigned #(4,4) mult0 (
    (a0),
    (a1),
    (mult0_out)
);

mult_mnbit_unsigned #(4,4) mult1 (
    (a2),
    (a3),
    (mult1_out)
);

mult_mnbit_unsigned #(4,4) mult2 (
    (a4),
    (a5),
    (mult2_out)
);

mult_mnbit_unsigned #(4,4) mult3 (
    (a6),
    (a7),
    (mult3_out)
);

rca_nbit #(8) add0 (
    mult0_out, mult1_out, 1'b0, add0_out[7:0], add0_out[8]
);

logic [8:0] add1_in;
assign add1_in[8] = 1'b0;
assign add1_in[7:0] = mult2_out;

rca_nbit #(9) add1 (
    add0_out, add1_in, 1'b0, add1_out[8:0], add1_out[9]
);

logic [9:0] add2_in;
assign add2_in[9:8] = 2'b0;
assign add2_in[7:0] = mult3_out;

rca_nbit #(10) add2 (
    add1_out, add2_in, 1'b0, add2_out[9:0], add2_out[10]
);


  initial begin
    // Apply test inputs
    a0 = 1;
    a1 = 2;
    a2 = 3;
    a3 = 4;
    a4 = 5;
    a5 = 6;
    a6 = 7;
    a7 = 8;
    #30;
    $finish;
  end
endmodule