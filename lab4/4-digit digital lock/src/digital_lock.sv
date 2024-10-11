module digital_lock (
    input logic clk_100mhz,
    input logic rstn,
    input logic [3:0] key,
    input logic valid_key,
    output logic state
);

    // Define state
    typedef enum logic {
        RELEASED_STATE = 1'b0,
        PRESSED_STATE = 1'b1
    } state_ty;

    // Current and next state registers
    state_ty pres_state, next_state;

    always_ff @(posedge clk_100mhz or negedge rstn) begin
        if (!rstn) begin
            pres_state <= RELEASED_STATE;
        end else begin
            // Kay validate logic
            
        end
    end

    // // Next state logic
    // always_comb begin
    //     case (pres_state)
    //         RED_STATE: next_state = RED_ORANGE_STATE;
    //         RED_ORANGE_STATE: next_state = GREEN_STATE;
    //         GREEN_STATE: next_state = ORANGE_STATE;
    //         ORANGE_STATE: next_state = RED_STATE;
    //         default: next_state = RED_STATE;
    //     endcase
    // end

    // Output logic based on the current state
    always_comb begin
        // Default output values
        released = 0;
        pressed = 0;

        case (pres_state)
            RELEASED_STATE: released = 1;
            PRESSED_STATE: pressed = 1
        endcase
    end

endmodule
