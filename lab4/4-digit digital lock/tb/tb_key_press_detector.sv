`timescale 1ns/1ps

module tb_key_press_detector();

    // Testbench signals
    logic clk;
    logic rstn;
    logic valid_key_BTN;  // Input key press signal for debouncing
    logic valid_key;      // Output from key_press_detector
    logic debounced_valid_key;

    // Clock generation (50 MHz or 20 ns period)
    always #10 clk = ~clk;

    // Instantiate the register module for debouncing
    register debounce_register (
        .divided_clk(clk),   // In this testbench, we'll use the same clock for simplicity
        .rstn(rstn),
        .valid_key_BTN(valid_key_BTN),
        .debounced_valid_key(debounced_valid_key)  // Connected to key_press_detector
    );

    // Instantiate the key_press_detector module
    key_press_detector uut (
        .clk(clk),
        .rstn(rstn),
        .debounced_valid_key(debounced_valid_key),  // Debounced key press signal
        .valid_key(valid_key)                 // Output valid_key
    );

    // Initial block to simulate reset and key press scenarios
    initial begin
        // Initialize signals
        clk = 0;
        rstn = 0;  // Apply reset
        valid_key_BTN = 0;
        #25 rstn = 1;  // Release reset after 25 ns

        // Test case 1: No key press (valid_key_BTN = 0)
        #50;
        assert(valid_key == 1'b0) else $error("Test case 1 failed: valid_key should be 0");

        // Test case 2: Key press detected (valid_key_BTN = 1)
        valid_key_BTN = 1;
        #50;
        assert(valid_key == 1'b1) else $error("Test case 2 failed: valid_key should be 1");

        // Test case 3: After one clock cycle, key press should be released (valid_key_BTN = 0)
        valid_key_BTN = 0;
        #50;
        assert(valid_key == 1'b0) else $error("Test case 3 failed: valid_key should be 0");

        // Test case 4: Another key press detected
        valid_key_BTN = 1;
        #50;
        assert(valid_key == 1'b1) else $error("Test case 4 failed: valid_key should be 1");

        // Test case 5: Back to released state
        valid_key_BTN = 0;
        #50;
        assert(valid_key == 1'b0) else $error("Test case 5 failed: valid_key should be 0");

        $display("All test cases passed!");
        $finish;
    end
endmodule