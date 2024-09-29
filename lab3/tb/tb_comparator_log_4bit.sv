`timescale 1ns / 1ps

module tb_comparator_log_4bit;

  // Inputs
  logic [3:0] A;
  logic [3:0] B;

  // Outputs
  logic g;
  logic l;

  // Instantiate the 4-bit comparator
  comparator_log_4bit uut (
    .A(A),
    .B(B),
    .g(g),
    .l(l)
  );

  // Test sequence
  initial begin
    // Test case 1: A = 4, B = 3
    A = 4'b0100;
    B = 4'b0011;
    #30;  // Wait for the result
    $display("A = %b, B = %b, g = %b, l = %b", A, B, g, l);
    // Expected: g = 1, l = 0

    // Test case 2: A = 7, B = 7
    A = 4'b0111;
    B = 4'b0111;
    #30;  
    $display("A = %b, B = %b, g = %b, l = %b", A, B, g, l);
    // Expected: g = 0, l = 0 (equal case)

    // Test case 3: A = 2, B = 5
    A = 4'b0010;
    B = 4'b0101;
    #30;  
    $display("A = %b, B = %b, g = %b, l = %b", A, B, g, l);
    // Expected: g = 0, l = 1

    // Test case 4: A = 15, B = 0
    A = 4'b1111;
    B = 4'b0000;
    #30;  
    $display("A = %b, B = %b, g = %b, l = %b", A, B, g, l);
    // Expected: g = 1, l = 0

    // Test case 5: A = 0, B = 15
    A = 4'b0000;
    B = 4'b1111;
    #30;  
    $display("A = %b, B = %b, g = %b, l = %b", A, B, g, l);
    // Expected: g = 0, l = 1

    $stop;
  end

endmodule
