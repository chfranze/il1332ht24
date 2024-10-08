module tb_traffic_light_fsm();

    // Testbench signals
    logic clk;
    logic rstn;
    logic red;
    logic green;
    logic orange;
    logic [6:0] counter;  // Adjust the bit width according to COUNTER_WIDTH in the FSM

    // Clock generation (50 MHz for example)
    always #10 clk = ~clk;  // 20ns clock period => 50MHz clock

    // Instantiate the DUT (Design Under Test)
    traffic_light_fsm dut (
        .clk(clk),
        .rstn(rstn),
        .red(red),
        .green(green),
        .orange(orange),
        .counter_out(counter)  // Connect the counter signal to the DUT
    );

    // Testbench process
    initial begin
        // Initialize clock and reset
        clk = 0;
        rstn = 0;  // Apply reset
        #25 rstn = 1;  // Release reset after 25ns

        // Run the simulation for enough time to see multiple cycles
        #2000;

        // End simulation
        $stop;
    end

    // Monitor output changes
    initial begin
        $monitor("Time: %0t | Red: %b | Green: %b | Orange: %b | Counter: %0d", 
                 $time, red, green, orange, counter);
    end

endmodule
