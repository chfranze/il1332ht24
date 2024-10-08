module tb_alu;

  // Declare inputs as reg and outputs as wire
  logic [7:0] x;
  logic [7:0] y;
  logic [1:0] m;
  logic [1:0] s;
  logic [15:0] z;

  // Instantiate the ALU module
  alu uut (
    .x(x),
    .y(y),
    .m(m),
    .s(s),
    .z(z)
  );

  // Test stimulus
  initial begin
    // Test case 1: Arithmetic addition
    x = 8'd10;
    y = 8'd5;
    m = 2'b10;   // Addition (assuming m controls the arithmetic operation)
    s = 2'b00;   // Select Arithmetic ALU
    #10;         // Wait for 10 time units
    $display("Arithmetic add: x = %d, y = %d, z = %d", x, y, z);

    // Test case 2: Arithmetic subtraction
    x = 8'd15;
    y = 8'd7;
    m = 2'b01;   // Subtraction (assuming m controls subtraction)
    s = 2'b00;   // Select Arithmetic ALU
    #10;
    $display("Arithmetic sub: x = %d, y = %d, z = %d", x, y, z);

    // Test case 3: Shift left
    x = 8'b00011010;  // 26 in binary
    y = 8'b00000010;  // Shift by 2
    m = 2'b00;        // Assume m = 00 means shift left
    s = 2'b01;        // Select Shift/Rotate ALU
    #10;
    $display("Shift left: x = %b, y = %d, z = %b", x, y, z);

    // Test case 4: Shift right
    x = 8'b11010000;  // 208 in binary
    y = 8'b00000011;  // Shift by 3
    m = 2'b01;        // Assume m = 01 means shift right
    s = 2'b01;        // Select Shift/Rotate ALU
    #10;
    $display("Shift right: x = %b, y = %d, z = %b", x, y, z);

    // Test case 5: Rotate left
    x = 8'b10110101;  // 181 in binary
    y = 8'b00000001;  // Rotate by 1
    m = 2'b10;        // Assume m = 10 means rotate left
    s = 2'b01;        // Select Shift/Rotate ALU
    #10;
    $display("Rotate left: x = %b, y = %d, z = %b", x, y, z);

    // Test case 6: Rotate right
    x = 8'b01101001;  // 105 in binary
    y = 8'b00000010;  // Rotate by 2
    m = 2'b11;        // Assume m = 11 means rotate right
    s = 2'b01;        // Select Shift/Rotate ALU
    #10;
    $display("Rotate right: x = %b, y = %d, z = %b", x, y, z);

    // Test case 7: Comparison (x > y)
    x = 8'd20;
    y = 8'd15;
    m = 2'b01;        // Comparison mode
    s = 2'b10;        // Select Compare ALU
    #10;
    $display("Compare (x > y): x = %d, y = %d, z = %b", x, y, z);

    // Test case 8: Comparison (x == y)
    x = 8'd25;
    y = 8'd25;
    m = 2'b10;        // Assume m = 10 means compare equal
    s = 2'b10;        // Select Compare ALU
    #10;
    $display("Compare (x == y): x = %d, y = %d, z = %b", x, y, z);

    // Test case 9: Logic AND
    x = 8'b10101010;
    y = 8'b11001100;
    m = 2'b00;        // Assume m = 00 means AND
    s = 2'b11;        // Select Logic ALU
    #10;
    $display("Logic AND: x = %b, y = %b, z = %b", x, y, z);

    // Test case 10: Logic OR
    x = 8'b10101010;
    y = 8'b11001100;
    m = 2'b01;        // Assume m = 01 means OR
    s = 2'b11;        // Select Logic ALU
    #10;
    $display("Logic OR: x = %b, y = %b, z = %b", x, y, z);

    // Test case 11: Logic XOR
    x = 8'b10101010;
    y = 8'b11001100;
    m = 2'b10;        // Assume m = 10 means XOR
    s = 2'b11;        // Select Logic ALU
    #10;
    $display("Logic XOR: x = %b, y = %b, z = %b", x, y, z);

    // Test case 12: Logic NOR
    x = 8'b10101010;
    y = 8'b11001100;
    m = 2'b11;        // Assume m = 11 means NOR
    s = 2'b11;        // Select Logic ALU
    #10;
    $display("Logic NOR: x = %b, y = %b, z = %b", x, y, z);

    // End simulation
    $finish;
  end
endmodule
