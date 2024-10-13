module key_press_detector(
    input logic clk,
    input logic rstn,
    input logic debounced_valid_key,
    output logic valid_key
);

    typedef enum logic [1:0] {
        RELEASED = 2'b00,
        PRESSED  = 2'b01,
        PRESSED_TO_RELEASED = 2'b10
    } state_ty;

    state_ty current_state, next_state;

    // State flip-flops (sequential)
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn)
            current_state <= RELEASED;
        else begin
            if (current_state == PRESSED) begin
                valid_key = 1'b1;
                current_state <= PRESSED_TO_RELEASED;
            end else if (current_state == PRESSED_TO_RELEASED) begin
                valid_key = 1'b0;
                if (~debounced_valid_key)
                    current_state <= RELEASED;
            end else if (current_state == RELEASED) begin
                valid_key = 1'b0;
                if (debounced_valid_key)
                    current_state <= PRESSED;
            end
        end
    end

endmodule
