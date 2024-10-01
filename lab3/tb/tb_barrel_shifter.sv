module tb_barrel_shifter;

    // Input and output declarations
    logic [7:0] x;         // 8-bit input
    logic [2:0] s;         // Shift amount (for rotate operations)
    logic [1:0] shift_mode; // Control signals to define the type of shift (00: no shift, 01: right shift, 10: left shift, 11: rotate)
    logic [7:0] y;         // 8-bit output

    // Instantiate the module (assuming the logic for all shifts is implemented)
    barrel_shifter uut (
        .x(x),
        .s(s),
        .shift_mode(shift_mode),
        .y(y)
    );

    // Test all operations
    initial begin
        // Test case 1: No shift
        x = 8'b11010101; s = 3'b000; shift_mode = 2'b00; // No shift
        #10;
        
        // Test case 2: Right shift by 1 bit
        x = 8'b11010101; s = 3'b001; shift_mode = 2'b01; // Right shift by 1 bit
        #10;

        // Test case 3: Right shift by 2 bits
        x = 8'b11010101; s = 3'b010; shift_mode = 2'b01; // Right shift by 2 bits
        #10;

        // Test case 4: Left shift by 1 bit
        x = 8'b11010101; s = 3'b001; shift_mode = 2'b10; // Left shift by 1 bit
        #10;

        // Test case 5: Left shift by 2 bits
        x = 8'b11010101; s = 3'b010; shift_mode = 2'b10; // Left shift by 2 bits
        #10;

        // Test case 6: Right rotate by 1 bit
        x = 8'b11010101; s = 3'b001; shift_mode = 2'b11; // Right rotate by 1 bit
        #10;

        // Test case 7: Right rotate by 3 bits
        x = 8'b11010101; s = 3'b011; shift_mode = 2'b11; // Right rotate by 3 bits
        #10;

        // Test case 8: Left rotate by 1 bit (same as right rotate by 7 bits)
        x = 8'b11010101; s = 3'b001; shift_mode = 2'b11; // Left rotate by 1 bit
        #10;

        // Test case 9: Left rotate by 3 bits (same as right rotate by 5 bits)
        x = 8'b11010101; s = 3'b011; shift_mode = 2'b11; // Left rotate by 3 bits
        #10;

        // End simulation
        $finish;
    end

    // Monitor the values to see changes in the waveforms
    initial begin
        $monitor("Time: %0t | x = %b | shift_mode = %b | s = %b | y = %b", 
            $time, x, shift_mode, s, y);
    end

endmodule
