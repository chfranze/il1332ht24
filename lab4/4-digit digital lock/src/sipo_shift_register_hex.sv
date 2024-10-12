module sipo_shift_register_hex (
    input  logic clk,               // Clock input
    input  logic reset_n,           // Active-low reset
    input  logic [3:0] data_in,     // 4-bit serial input (hex value)
    output logic [3:0] q0, q1, q2, q3 // 4-bit parallel outputs
);

    // 4 flip-flops, each storing a 4-bit value
    logic [3:0] shift_reg [3:0]; // 4x4-bit storage (array of 4-bit registers)

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            // Asynchronous reset (active low) clears all flip-flops
            shift_reg[0] <= 4'b0000;
            shift_reg[1] <= 4'b0000;
            shift_reg[2] <= 4'b0000;
            shift_reg[3] <= 4'b0000;
        end
        else begin
            // Shift the 4-bit values on every clock cycle
            shift_reg[3] <= shift_reg[2];
            shift_reg[2] <= shift_reg[1];
            shift_reg[1] <= shift_reg[0];
            shift_reg[0] <= data_in; // Load new 4-bit hex value from data_in
        end
    end

    // Assign flip-flop outputs to external 4-bit parallel outputs
    assign q0 = shift_reg[0]; // Output from the first flip-flop
    assign q1 = shift_reg[1]; // Output from the second flip-flop
    assign q2 = shift_reg[2]; // Output from the third flip-flop
    assign q3 = shift_reg[3]; // Output from the fourth flip-flop

endmodule