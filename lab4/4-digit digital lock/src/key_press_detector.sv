module key_press_detector(
    input logic clk,
    input logic rstn,
    input logic debounced_valid_key,
    output logic valid_key
);

    typedef enum logic {
        RELEASED = 1'b0,
        PRESSED  = 1'b1
    } state_ty;

    state_ty current_state, next_state;

    // State transition logic (combinational)
    always_comb begin
        case (current_state)
            RELEASED: begin
                if (debounced_valid_key)
                    next_state = PRESSED;
                else
                    next_state = RELEASED;
            end
            PRESSED: begin
                next_state = RELEASED; // Transition back to RELEASED after one clock
            end
            default: next_state = RELEASED;
        endcase
    end

    // State flip-flops (sequential)
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn)
            current_state <= RELEASED;
        else
            current_state <= next_state;
    end

    // Output logic
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn)
            valid_key <= 1'b0;  // Reset valid_key
        else if (current_state == RELEASED && debounced_valid_key)
            valid_key <= 1'b1;  // Assert valid_key for one clock cycle
        else
            valid_key <= 1'b0;  // Deassert valid_key in other cases
    end

endmodule
