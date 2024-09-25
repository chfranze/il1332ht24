module tb_shifter_rotater;

  logic [3:0] a;
  logic [3:0] y;
  logic [1:0] select;

  // Instantiate the mult_mnbit module
  shifter_rotator dut (
      a,
      select,
      y
  );

  initial begin
    // Apply test inputs
    a = 4'b0001;
    select = 2'b00;
    a = 4'b0010;
    #30 select = 2'b00;
    a = 4'b0100;
    #30 select = 2'b00;
    a = 4'b1000;
    #30 select = 2'b00;
    a = 4'b0000;
    #30 select = 2'b00;
    a = 4'b1000;
    #30 select = 2'b01;
    a = 4'b0100;
    #30 select = 2'b01;
    a = 4'b0010;
    #30 select = 2'b01;
    a = 4'b0001;
    #30 select = 2'b01;
    a = 4'b0000;
    #30 select = 2'b01;
    #30 a = 4'b1111;
    #30 select = 2'b10;
    a = 4'b1110;
    #30 select = 2'b10;
    a = 4'b1100;
    #30 select = 2'b10;
    a = 4'b1000;
    #30 select = 2'b10;
    #30 a = 4'b1111;
    #30 select = 2'b11;
    a = 4'b0111;
    #30 select = 2'b11;
    a = 4'b0011;
    #30 select = 2'b11;
    a = 4'b0001;
    #30 select = 2'b11;

    #30;
    $finish;
  end
endmodule
