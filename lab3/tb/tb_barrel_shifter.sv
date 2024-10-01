module tb_barrel_shifter;

    logic [2:0] s;           // Control signals
    logic [7:0] x;           // Input data
    logic left_in;           // Left shift input
    logic right_in;          // Right shift input
    logic [7:0] y;           // Output data

    // Instantiate the barrel shifter
    barrel_shifter uut (
        .s(s),
        .x(x),
        .left_in(left_in),
        .right_in(right_in),
        .y(y)
    );

    initial begin
        // Test No Shift
        s = 3'b000; x = 8'b10101010; left_in = 1'b0; right_in = 1'b0;
        #10;

        // Test Left Shift
        s = 3'b100; x = 8'b10101010; left_in = 1'b1;
        #10;

        // Test Right Shift
        s = 3'b110; x = 8'b10101010; right_in = 1'b1;
        #10;

        // Test Left Rotate
        s = 3'b101; x = 8'b10101010;
        #10;

        // Test Right Rotate
        s = 3'b111; x = 8'b10101010;
        #10;

        // Finish simulation
        $finish;
    end

    initial begin
        // Monitor the output
        $monitor("Time: %0t | s = %b | x = %b | y = %b", $time, s, x, y);
    end

endmodule
