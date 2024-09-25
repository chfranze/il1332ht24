module tb_inv;

  // Parameter for the bit-width
  parameter N = 4;
  
  // Testbench signals
  logic [N-1:0] a;
  logic [N-1:0] y;
  
  // Instantiate the design under test (DUT)
  inv_Nbit #(N) dut (
    .a(a),
    .y(y)
  );
  
  // Initial block for applying test vectors
  initial begin
    // Apply test vector 1
    a = 4'b0000; // Expect y = 4'b1111
    #10;
    
    // Apply test vector 2
    a = 4'b1010; // Expect y = ~a + 1 = 4'b0110
    #10;
    
    // Apply test vector 3
    a = 4'b1100; // Expect y = ~a + 1 = 4'b0100
    #10;
    
    // Apply test vector 4
    a = 4'b1111; // Expect y = ~a + 1 = 4'b0001
    #10;
    
    // Apply test vector 5 (Max value)
    a = 4'b1001; // Expect y = ~a + 1 = 4'b0111
    #10;
    
    // End simulation
    $stop;
  end
  
  // Monitor the inputs and outputs
  initial begin
    $monitor("Time=%0t: a=%b, y=%b", $time, a, y);
  end

endmodule
