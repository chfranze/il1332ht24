module digital_lock (
    input logic clk,
    input logic rstn,
    input logic [3:0] key,
    input logic valid_key,
    output logic state
);

    // Define state
    typedef enum logic [1:0] {
        UNLOCKED = 2'b00,
        LOCKED = 2'b01,
        ENTERING_NEW_PIN = 2'b10
    } state_ty;

    // Current and next state registers
    state_ty pres_state, next_state;

    logic [15:0] unlock_pin = 16'h3132; // ASCII representation for '1234'
    logic [15:0] entered_pin; // No default initialization

    // Sequential logic
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            pres_state <= UNLOCKED;
            entered_pin <= 16'b0; // Clear entered pin
        end else begin
            pres_state <= next_state; // Update state

            // // Store input pins
            // if (valid_key && pres_state == LOCKED) begin
            //     // Only store if in locked state and key pressed
            //     entered_pin <= {entered_pin[11:0], key}; // Shift in the new key
            // end

            // // Reset entered_pin if unlocked
            // if (next_state == UNLOCKED) begin
            //     entered_pin <= 16'b0; // Reset on unlocking
            // end
        end
    end

    // Next state logic
    always_comb begin
        next_state = pres_state; // Initialize next state to current state

        case (pres_state)
            UNLOCKED: begin
                if (valid_key && key == 'hB)  // Press B to lock
                    next_state = LOCKED;
                else if (valid_key && key == 'hE)  // Press E to change password
                    next_state = ENTERING_NEW_PIN;
            end

            LOCKED: begin
                // Check if the entered pin matches unlock_pin
                if (valid_key && (entered_pin == unlock_pin) && (key == 'hC)) begin
                    next_state = UNLOCKED;
                end
            end

            ENTERING_NEW_PIN: begin
                if (valid_key && key == 'hE) begin
                    unlock_pin <= entered_pin; // Update the unlock pin
                    next_state = UNLOCKED;
                end
            end

            default: next_state = UNLOCKED;
        endcase
    end

    // Output logic based on the current state
    always_comb begin
        state = 0; 

        case (pres_state)
            UNLOCKED: state = 0;
            LOCKED: state = 1;
            ENTERING_NEW_PIN: state = 0;
        endcase
    end

endmodule