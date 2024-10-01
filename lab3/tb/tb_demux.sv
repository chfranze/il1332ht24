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
    Y = 4'b0001;
    sel = 2'b00;
    #30;  // Initial delay
    
    // Test Case 1: sel = 00
    Y = 4'b1010;  // Example input value
    sel = 2'b00;  // Select output A
    #30;  // Wait for delay
    
    // Test Case 2: sel = 01
    Y = 4'b1110;  // Example input value
    sel = 2'b01;  // Select output B
    #30;  // Wait for delay
    
    // Test Case 3: sel = 10
    Y = 4'b1111;  // Example input value
    sel = 2'b10;  // Select output C
    #30;  // Wait for delay
    
    // Test Case 4: sel = 11
    Y = 4'b0111;  // Example input value
    sel = 2'b11;  // Select output D
    #30;  // Wait for delay

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
