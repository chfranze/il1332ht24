`timescale 1ns / 1ps

module tb_logic_alu;

  // Testbench signals
  logic [7:0] x_tb;
  logic [7:0] y_tb;
  logic [1:0] m_tb;
  logic [7:0] z_tb;

  // Instantiate the Device Under Test (DUT)
  logic_alu dut (
    .x(x_tb),
    .y(y_tb),
    .m(m_tb),
    .z(z_tb)
  );

  // Task for displaying signals
  task display_signals;
    $display("Time: %0t | x = %b | y = %b | m = %b | z = %b", $time, x_tb, y_tb, m_tb, z_tb);
  endtask

  // Test Procedure
  initial begin
    // Test case 1: AND operation
    x_tb = 8'b10101010; y_tb = 8'b11001100; m_tb = 2'b00;
    #10 display_signals(); // Wait and display results

    // Test case 2: OR operation
    x_tb = 8'b10101010; y_tb = 8'b11001100; m_tb = 2'b01;
    #10 display_signals(); // Wait and display results

    // Test case 3: NOT operation (on x)
    x_tb = 8'b10101010; y_tb = 8'b00000000; m_tb = 2'b10;
    #10 display_signals(); // Wait and display results

    // Test case 4: XOR operation
    x_tb = 8'b10101010; y_tb = 8'b11001100; m_tb = 2'b11;
    #10 display_signals(); // Wait and display results

    // Add more test cases as needed

    // Finish simulation
    $finish;
  end

  // Initialize signals and monitor
  initial begin
    $monitor("At time %0t: x = %b, y = %b, m = %b, z = %b", $time, x_tb, y_tb, m_tb, z_tb);
  end

endmodule
