module digital_lock_fsm (
    input logic clk,
    input logic rstn,
    input logic key,
    input logic valid_key,
    output logic state
);

    // // Define state
    // typedef enum logic [1:0] {
    //     RED_STATE = 2'b00,
    //     RED_ORANGE_STATE = 2'b01,
    //     GREEN_STATE = 2'b10,
    //     ORANGE_STATE = 2'b11
    // } state_ty;

    // // Current and next state registers
    // state_ty pres_state, next_state;

    // // State transition and counter logic
    // always_ff @(posedge clk or negedge rstn) begin
    //     if (!rstn) begin
    //         // Reset state and counter
    //         pres_state <= RED_STATE;
    //         counter <= RED_DELAY;
    //     end else begin
    //         if (counter == 0) begin
    //             // Move to the next state
    //             pres_state <= next_state;
                
    //             // Reset counter for the new state
    //             case (next_state)
    //                 RED_STATE: counter <= RED_DELAY;
    //                 RED_ORANGE_STATE: counter <= RED_ORANGE_DELAY;
    //                 GREEN_STATE: counter <= GREEN_DELAY;
    //                 ORANGE_STATE: counter <= ORANGE_DELAY;
    //             endcase
    //         end else begin
    //             // Decrease counter for the current state
    //             counter <= counter - 1;
    //         end
    //     end
    // end

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

    // // Output logic based on the current state
    // always_comb begin
    //     // Default output values
    //     red = 0;
    //     orange = 0;
    //     green = 0;

    //     case (pres_state)
    //         RED_STATE: red = 1;
    //         RED_ORANGE_STATE: begin
    //             red = 1;
    //             orange = 1;
    //         end
    //         GREEN_STATE: green = 1;
    //         ORANGE_STATE: orange = 1;
    //     endcase
    // end

    // assign counter_out = counter;  // Expose the internal counter

endmodule
