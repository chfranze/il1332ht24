module barrel_shifter (
    input  logic [2:0] s,     // Control signals: S2, S1, S0
    input  logic [7:0] x,     // Input: x7 to x0
    input  logic left_in,     // Left input for shift operations
    input  logic right_in,    // Right input for shift operations
    output logic [7:0] y      // Output: y7 to y0
);

    // Internal signal to hold the shifted/rotated values
    logic [7:0] shifted;

    always_comb begin
        case (s)
            3'b000: // No shift
                shifted = x;

            3'b100: // Left shift
                shifted = {x[6:0], left_in};

            3'b110: // Right shift
                shifted = {right_in, x[7:1]};

            3'b101: // Left rotate
                shifted = {x[6:0], x[7]};

            3'b111: // Right rotate
                shifted = {x[0], x[7:1]};

            default: // Not used
                shifted = x;  // Default case to prevent latches
        endcase
    end

    // Assign the result to the output
    assign y = shifted;

endmodule
