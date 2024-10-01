module tb_mult_mnbit;
  // Local parameters for M and N
  localparam M = 9;
  localparam N = 9;

  // Testbench signals
  logic [M-1:0] a_tb;  // Input A
  logic [N-1:0] b_tb;  // Input B
  logic [M+N-1:0] Prod_tb;  // Output Product

  // Instantiate the design under test (DUT)
  mult_mnbit #(.M(M), .N(N)) DUT (
    .a(a_tb),
    .b(b_tb),
    .Prod(Prod_tb)
  );

  // Task to display results
  task display_results;
    input [M-1:0] a_in;
    input [N-1:0] b_in;
    input [M+N-1:0] prod_out;
    begin
      $display("A = %d, B = %d, Product = %d", $signed(a_in), $signed(b_in), $signed(prod_out));
    end
  endtask

  // Test stimulus
  initial begin
    // Test case 1: Positive * Positive
    a_tb = 9'd25;  // 25
    b_tb = 9'd15;  // 15
    #10;
    display_results(a_tb, b_tb, Prod_tb);

    // Test case 2: Positive * Negative
    a_tb = 9'd50;  // 50
    b_tb = -9'd12; // -12
    #10;
    display_results(a_tb, b_tb, Prod_tb);

    // Test case 3: Negative * Positive
    a_tb = -9'd33; // -33
    b_tb = 9'd7;   // 7
    #10;
    display_results(a_tb, b_tb, Prod_tb);

    // Test case 4: Negative * Negative
    a_tb = -9'd20; // -20
    b_tb = -9'd5;  // -5
    #10;
    display_results(a_tb, b_tb, Prod_tb);

    // Test case 5: Zero multiplication
    a_tb = 9'd0;
    b_tb = 9'd100;
    #10;
    display_results(a_tb, b_tb, Prod_tb);

    a_tb = 9'd50;
    b_tb = 9'd0;
    #10;
    display_results(a_tb, b_tb, Prod_tb);

    $finish;
  end
endmodule
