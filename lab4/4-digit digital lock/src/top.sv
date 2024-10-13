module top (
    input logic CLK_100MHZ,
    input logic [15:0] SW,
    input logic [3:0] BTN,
    output logic [15:0] LED,
    output logic RGB0[2:0],
    output logic RGB1[2:0],
    output logic [7:0] D1_SEG,
    output logic [3:0] D1_AN
);

    kw4281_driver driver (.rst_n(1'b1), .clk(CLK_100MHZ), 
                          .input_bcd({SW[3:0], SW[7:4], SW[11:8], SW[15:12]}),
                          .an(D1_AN), .seg(D1_SEG[6:0]));
                          
    assign D1_SEG[7] = 1'b1; 

    logic divided_clk;

    clock_divider #(100000000) (
        .rst_n(SW[15]),
        .clk_in(CLK_100MHZ),
        .clk_out(divided_clk)
    );

    logic debounced_valid_key;

    register register (
        .divided_clk(divided_clk),
        .rstn(SW[15]),
        .valid_key_BTN(BTN[0]),
        .debounced_valid_key(debounced_valid_key)
    );

    logic valid_key;

    key_press_detector key_press_detector (
        .clk(CLK_100MHZ),
        .rstn(SW[15]),
        .debounced_valid_key(debounced_valid_key),
        .valid_key(valid_key)
    );

    logic key[3:0];

    assign key[0] = SW[0];
    assign key[1] = SW[1];
    assign key[2] = SW[2];
    assign key[3] = SW[3];

    logic state;

    digital_lock digital_lock (
        .clk(CLK_100MHZ),
        .rstn(SW[15]),
        .key(key),
        .valid_key(valid_key),
        .state(state)
    );

    assign RGB1[1] = state;

endmodule
