`timescale 1ns / 1ps

module cla_8bit_tb;

// Declare testbench variables
parameter N = 8;
logic signed [N-1:0] A, B;
logic signed [N:0] Sum_cla; // Sum is 9 bits to account for carry-out
int x, y;

// Instantiate the Device Under Test (DUT)
cla_8bit dut (
    .a(A),
    .b(B),
    .sum(Sum_cla)
);

// Initial block to start the simulation
initial begin
    $display("Starting 8-bit Carry Lookahead Adder Testbench");

    // Apply test vectors
    for (x = -128; x <= 127; x = x + 1) begin
        for (y = -128; y <= 127; y = y + 1) begin
            A = x;
            B = y;
            #100;  // Wait for the adder to stabilize
            
            // Display results for verification
            $display("A = %d, B = %d, Sum = %d", A, B, Sum_cla);
        end
    end

    $display("Test completed");
    $stop;
end

endmodule
