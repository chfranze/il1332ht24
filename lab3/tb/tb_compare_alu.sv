`timescale 1ns / 1ps

module tb_compare_alu;
  
  // Declare inputs as regs and output as wire
  logic [7:0] x;
  logic [7:0] y;
  logic [1:0] m;
  logic z;

  // Instantiate the DUT (Device Under Test)
  compare_alu uut (
    .x(x),
    .y(y),
    .m(m),
    .z(z)
  );

  // Test stimulus
  initial begin
    // Test case 1: x > y, expect g = 1, select g in mux (m=00)
    x = 8'hA5; // 165
    y = 8'h64; // 100
    m = 2'b00;
    #10;
    $display("Test 1: x = %h, y = %h, m = %b, z = %b (expected z = 1)", x, y, m, z);

    // Test case 2: x < y, expect l = 1, select l in mux (m=01)
    x = 8'h32; // 50
    y = 8'h78; // 120
    m = 2'b01;
    #10;
    $display("Test 2: x = %h, y = %h, m = %b, z = %b (expected z = 1)", x, y, m, z);

    // Test case 3: x == y, expect equal = 1, select equal in mux (m=10)
    x = 8'h55; // 85
    y = 8'h55; // 85
    m = 2'b10;
    #10;
    $display("Test 3: x = %h, y = %h, m = %b, z = %b (expected z = 1)", x, y, m, z);

    // Test case 4: x != y, expect not_equal = 1, select not_equal in mux (m=11)
    x = 8'hFF; // 255
    y = 8'h00; // 0
    m = 2'b11;
    #10;
    $display("Test 4: x = %h, y = %h, m = %b, z = %b (expected z = 1)", x, y, m, z);

    x = 8'hA; // 255
    y = 8'hFF; // 0
    m = 2'b00;
    #10;

    x = 8'hFF; // 255
    y = 8'hAA; // 0
    m = 2'b01;
    #10;

    x = 8'hA; // 255
    y = 8'hFF; // 0
    m = 2'b10;
    #10;

    x = 8'hFF; // 255
    y = 8'hFF; // 0
    m = 2'b11;
    #10;

    x = 8'hFF; // 255
    y = 8'hFF; // 0
    m = 2'b00;
    #10;

    x = 8'hFF; // 255
    y = 8'hFF; // 0
    m = 2'b01;
    #10;




    // Finish the simulation
    $finish;
  end

endmodule
