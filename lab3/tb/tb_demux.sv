`timescale 1ns / 1ps

module tb_demux4to1_N_bit();

  // Parameters
  parameter N = 4;  // Adjust the parameter as needed

  // Testbench signals
  logic [N-1:0] Y;
  logic [1:0] sel;
  logic [N-1:0] A, B, C, D;

  // Instantiate the DUT (Device Under Test)
  demux4to1_N_bit #(.N(N)) uut (
      .Y(Y),
      .sel(sel),
      .A(A),
      .B(B),
      .C(C),
      .D(D)
  );

  // Initial block for stimulus
  initial begin
    // Initialize signals
    Y = 4'b0000;
    sel = 2'b00;
    #10;  // Initial delay
    
    // Test Case 1: sel = 00
    Y = 4'b1010;  // Example input value
    sel = 2'b00;  // Select output A
    #10;  // Wait for delay
    
    // Test Case 2: sel = 01
    sel = 2'b01;  // Select output B
    #10;  // Wait for delay
    
    // Test Case 3: sel = 10
    sel = 2'b10;  // Select output C
    #10;  // Wait for delay
    
    // Test Case 4: sel = 11
    sel = 2'b11;  // Select output D
    #10;  // Wait for delay

    // Add more test cases as needed

    // Finish simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time: %0t | Y = %b | sel = %b | A = %b | B = %b | C = %b | D = %b", 
              $time, Y, sel, A, B, C, D);
  end

endmodule
