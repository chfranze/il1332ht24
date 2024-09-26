module tb_twos_complement_inverter;

  parameter N = 8;

  logic [N-1:0] a;
  logic [N-1:0] y;

  // Instantiate the 2's complement inverter module
  twos_complement_inverter #(N) uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test case 1: Positive number 3
    a = 8'd3;
    #10;
    $display("Input: %0d, Output (negative): %0d", a, y);

    // Test case 2: Positive number 5
    a = 8'd5;
    #10;
    $display("Input: %0d, Output (negative): %0d", a, y);

    // Test case 3: Positive number 127 (largest positive number in 8-bit 2's complement)
    a = 8'd127;
    #10;
    $display("Input: %0d, Output (negative): %0d", a, y);

    // Test case 4: Positive number 1
    a = 8'd1;
    #10;
    $display("Input: %0d, Output (negative): %0d", a, y);

    // End simulation
    $finish;
  end
endmodule
