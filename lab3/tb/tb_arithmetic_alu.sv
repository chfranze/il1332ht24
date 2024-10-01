module tb_arithmetic_alu;

    // Testbench signals
    logic [7:0] x_tb;
    logic [7:0] y_tb;
    logic [1:0] m_tb;
    logic [15:0] z_tb;

    // Instantiate the DUT (Device Under Test)
    arithmetic_alu dut (
        .x(x_tb),
        .y(y_tb),
        .m(m_tb),
        .z(z_tb)
    );

    // Task to apply stimulus to the DUT
    task apply_stimulus(input [7:0] x_in, input [7:0] y_in, input [1:0] mode);
        begin
            x_tb = x_in;
            y_tb = y_in;
            m_tb = mode;
            #10; // Wait for 10 time units
        end
    endtask

    // Test sequence
    initial begin
        // Monitor output changes
        $monitor("Time: %0t, x = %0d, y = %0d, m = %0d, z = %0d", $time, x_tb, y_tb, m_tb, z_tb);

        // Test 1: Add operation (m = 00)
        apply_stimulus(8'd15, 8'd10, 2'b00); // Expected z = 25

        // Test 2: Subtract operation (m = 01)
        apply_stimulus(8'd20, 8'd10, 2'b01); // Expected z = 10

        // Test 3: Multiply operation (m = 10)
        apply_stimulus(8'd3, 8'd4, 2'b10); // Expected z = 12

        // Test 4: Undefined operation (m = 11)
        apply_stimulus(8'd5, 8'd5, 2'b11); // Expected z = 0 (as per mux D input)

        // End the simulation
        #50;
        $finish;
    end

endmodule
