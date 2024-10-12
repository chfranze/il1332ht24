`timescale 1ns / 1ps // Define the time unit and time precision

module tb_digital_lock;

    // Parameters
    logic clk;
    logic rstn;
    logic [3:0] key;
    logic valid_key;
    logic state;

    // Instantiate the digital_lock module
    digital_lock uut (
        .clk(clk),
        .rstn(rstn),
        .key(key),
        .valid_key(valid_key),
        .state(state)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0; // Assert reset
        key = 4'b0000; // Default key value
        valid_key = 0; // Default valid_key

        // Release reset
        #10;
        rstn = 1; // De-assert reset
        
        // Lock the digital lock by pressing key B
        #10;
        key = 4'hB; // Press key B
        valid_key = 1; // Assert valid_key
        #10;
        valid_key = 0; // Release valid_key

        // Unlocking sequence using the correct PIN (1234)
        #20;
        key = 4'h1; // Press 0
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h2; // Press 1
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h3; // Press 2
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h4; // Press 3
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'hC; // Press C to unlock
        valid_key = 1;
        #10;
        valid_key = 0;

        // Change the password to a new one (e.g., 5678)
        #20;
        key = 4'hE; // Press E to change the password
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h5; // Press 5
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h6; // Press 6
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h7; // Press 7
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h8; // Press 8
        valid_key = 1;
        #10;
        valid_key = 0;

        // Lock and unlock with new password (5678)
        #20;
        key = 4'hB; // Press B to lock
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h5; // Press 5
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h6; // Press 6
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h7; // Press 7
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'h8; // Press 8
        valid_key = 1;
        #10;
        valid_key = 0;

        #20;
        key = 4'hC; // Press C to unlock
        valid_key = 1;
        #10;
        valid_key = 0;

        // Finish the simulation
        #50;
        $finish;
    end
endmodule