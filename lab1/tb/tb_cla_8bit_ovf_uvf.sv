`timescale 1ns / 1ps

module tb_cla_8bit_ovf_uvf;

  // Parameters
  parameter N = 8;

  // Inputs
  logic [N-1:0] a;
  logic [N-1:0] b;

  // Outputs
  logic [N-1:0] out;
  logic ovf, uvf;

  // Instantiate the Unit Under Test (UUT)
  cla_8bit_ovf_uvf uut (
    .a(a),
    .b(b),
    .out(out),
    .ovf(ovf),
    .uvf(uvf)
  );

  // Testbench
  initial begin
    // Display Header
    $display(" a        |  b        |  out      | ovf | uvf | Expected out | Expected ovf | Expected uvf");
    $display("----------|-----------|-----------|-----|-----|--------------|--------------|--------------");

    // Test cases
    test_case(8'b00000000, 8'b00000000, 8'b00000000, 1'b0, 1'b0);
    #30;
    test_case(8'b00000001, 8'b00000001, 8'b00000010, 1'b0, 1'b0);
    #30;    
    test_case(8'b01111110, 8'b00011001, 8'b10000000, 1'b1, 1'b0); // Overflow
    #30;
    test_case(8'b10000000, 8'b10000000, 8'b00000000, 1'b0, 1'b1); // Underflow
    #30;
    test_case(8'b11111111, 8'b00000001, 8'b00000000, 1'b0, 1'b1); // Underflow
    #30;
    test_case(8'b00000101, 8'b00000101, 8'b00001010, 1'b0, 1'b0); // 5 + 5
    #30;
    test_case(8'b11111110, 8'b00000001, 8'b11111111, 1'b0, 1'b0); // -2 + 1
    #30;
    test_case(8'b10000001, 8'b01111111, 8'b00000000, 1'b1, 1'b0); // Overflow

    // End of simulation
    $finish;
  end

  // Task to apply test cases and display results
  task test_case(
    input logic [N-1:0] a_in,
    input logic [N-1:0] b_in,
    input logic [N-1:0] expected_out,
    input logic expected_ovf,
    input logic expected_uvf
  );
    begin
      // Apply inputs
      a = a_in;
      b = b_in;
      #80; // Increase delay to 10 time units to allow for propagation

      // Display the results
      $display("%b | %b | %b |  %b  |  %b  |    %b     |      %b      |      %b", 
                a, b, out, ovf, uvf, expected_out, expected_ovf, expected_uvf);
    end
  endtask

endmodule
