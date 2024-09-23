module tb_rca_nbit;

  parameter N = 4;

  // Inputs
  logic [N-1:0] a;
  logic [N-1:0] b;
  logic cin;

  // Outputs
  logic [N-1:0] sum;
  logic cout;

  // Instantiate the Unit Under Test (UUT)
  rca_nbit #(N) uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  // Testbench
  initial begin
    // Display Header
    $display(" a   |  b   | cin |  sum  | cout | Expected sum | Expected cout");
    $display("-----|------|-----|-------|------|--------------|--------------");

    // Test cases
    test_case(4'b0000, 4'b0000, 1'b0, 4'b0000, 1'b0);
    test_case(4'b0001, 4'b0010, 1'b0, 4'b0011, 1'b0);
    test_case(4'b0111, 4'b0001, 1'b1, 4'b1001, 1'b0);
    test_case(4'b1111, 4'b1111, 1'b1, 4'b1111, 1'b1);
    test_case(4'b1001, 4'b0110, 1'b0, 4'b1111, 1'b0);
    test_case(4'b1010, 4'b0101, 1'b1, 4'b0000, 1'b1);
    test_case(4'b1110, 4'b0011, 1'b0, 4'b0001, 1'b1);

    // End of simulation
    $finish;
  end

  // Task to apply test cases and display results
  task test_case(
    input logic [N-1:0] a_in,
    input logic [N-1:0] b_in,
    input logic cin_in,
    input logic [N-1:0] expected_sum,
    input logic expected_cout
  );
    begin
      // Apply inputs
      a = a_in;
      b = b_in;
      cin = cin_in;
      #1; // wait for one time unit
      
      // Display the results
      $display("%b | %b |  %b  |  %b  |  %b   |      %b      |      %b", 
                a, b, cin, sum, cout, expected_sum, expected_cout);
    end
  endtask

endmodule
