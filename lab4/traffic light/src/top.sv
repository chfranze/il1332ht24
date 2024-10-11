module top (
    input logic CLK_100MHZ,
    input logic [15:0] SW,
    output logic [15:0] LED,
    output logic RGB0[2:0],
    output logic RGB1[2:0]
);

logic clk;

    clock_divider #(100000000) (
        SW[0],
        CLK_100MHZ,
        clk
    );

logic is_orange;
logic fsm_green_on;

traffic_light_fsm tl_fsm(
    .clk        (clk),
    .rstn       (SW[1]), 
    .red        (RGB0[0]), 
    .orange     (is_orange), 
    .green      (fsm_green_on), 
    .counter_out(LED[6:0])
);


logic [2:0] counter;         // 2-bit counter to track states

logic green_dim_clock;

always_ff @(posedge CLK_100MHZ) begin
     
        counter <= counter + 4'b0001;
        
        if (counter < 4'b0011)
            green_dim_clock = 1'b1;
        else
            green_dim_clock = 1'b0;
    
end

assign RGB1[1] = (green_dim_clock & is_orange) || fsm_green_on;
assign RGB1[0] = is_orange;





// always_comb begin : orange_mux
//     case (is_orange)
//         1'b1: RGB1[1] = CLK_100MHZ; 
//         RGB1[0] = 1'b0;
//     endcase
// end

endmodule
