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

    logic [15:0] unlock_pin = 16'h1234;  // Default PIN '1234'
    logic [15:0] entered_pin;            // For storing entered PIN
    logic [1:0]  pin_digit_count;        // Count the number of entered digits during new PIN entry

    // SIPO shift register for entered PIN (shift in 4 digits)
    logic [3:0] q0, q1, q2, q3;  // Outputs from the SIPO shift register

    // Instantiate the SIPO shift register
    sipo_shift_register_hex shift_reg_inst (
        .clk(valid_key),
        .reset_n(rstn),
        .data_in(key),       // Shift in each key
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3)
    );

    // Sequential logic for state transitions and PIN handling
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            pres_state <= UNLOCKED;
            entered_pin <= 16'b0;        // Clear entered pin
            pin_digit_count <= 2'b00;    // Reset digit counter
        end else begin
            pres_state <= next_state;    // Update state

            // Store input pins (shifted in by the SIPO register)
            if (valid_key && pres_state == LOCKED) begin
                entered_pin <= {q3, q2, q1, q0}; // Store the entered PIN from the shift register
            end

            // Reset entered_pin if unlocked
            if (next_state == UNLOCKED) begin
                entered_pin <= 16'b0;     // Reset on unlocking
            end

            // Handle new PIN entry
            if (pres_state == ENTERING_NEW_PIN && valid_key) begin
                entered_pin <= {q3, q2, q1, q0}; // Store new entered PIN
                pin_digit_count <= pin_digit_count + 1'b1; // Increment digit count
            end

            // Reset counter when switching states
            if (next_state != ENTERING_NEW_PIN) begin
                pin_digit_count <= 2'b00;
            end
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
                if (pin_digit_count == 4) begin  // After entering 4 digits
                    unlock_pin <= entered_pin; // Update unlock_pin with new PIN
                    next_state = UNLOCKED;     // Go back to unlocked state
                end
                else if (valid_key && key == 'hB)  // Press B to lock
                    next_state = LOCKED;
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
