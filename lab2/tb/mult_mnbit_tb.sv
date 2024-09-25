module mult_mnbit_tb #(
    parameter M = 5,
    parameter N = 4
) ();

logic [M-1:0] a;            // End with a semicolon instead of a comma
logic [N-1:0] b;            // End with a semicolon instead of a comma
logic [M+N-1:0] Prod;       // End with a semicolon

// Instantiate the mult_mnbit module
mult_mnbit #(M, N) dut (
    (a),
    (b),
    (Prod)
);

  initial begin
    // Apply test inputs
    a = 1;
    b = 6;
    #30;
    a = 0;
    b = 6;
    #30;
    a = 1;
    b = 6;
    #30;
    a = 0;
    b = 0;
    #30;
    a = 4;
    b = 2;
    #30;
    a = 5;
    b = 5;
    #30;
    a = 10;
    b = 3;
    #30;
    a = -3;
    b = 5;
    #30;
    a = -1;
    b = 5;
    #30;
    $finish;
  end
endmodule