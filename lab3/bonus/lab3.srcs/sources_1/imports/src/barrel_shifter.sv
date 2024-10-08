module mux2_1 (
    input logic a,          // Input a
    input logic b,          // Input b
    input logic sel,        // Select signal
    output logic y          // Output
);
    // 2:1 multiplexer implementation
    assign y = sel ? b : a;
endmodule


module barrel_shifter (
    input logic [7:0] x,        // 8-bit input vector
    input logic [2:0] s,        // Shift amount (S2, S1, S0)
    input logic [1:0] shift_mode, // Control for shift type (00: No shift, 01: Right Shift, 10: Left Shift, 11: Rotate)
    output logic [7:0] y        // 8-bit shifted output
);

    // Intermediate wires to hold the values after each stage
    logic [7:0] stage1, stage2, stage3;
    logic [7:0] shifted_right, shifted_left;

    // Stage 1: Rotate by 1 bit
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : rotate_by_1
            if (i == 0) begin
                mux2_1 mux_1 (.a(x[i]), .b(x[7]), .sel(s[0]), .y(stage1[i]));
            end else begin
                mux2_1 mux_1 (.a(x[i]), .b(x[i-1]), .sel(s[0]), .y(stage1[i]));
            end
        end
    endgenerate

    // Stage 2: Rotate by 2 bits
    generate
        for (i = 0; i < 8; i = i + 1) begin : rotate_by_2
            if (i < 2) begin
                mux2_1 mux_2 (.a(stage1[i]), .b(stage1[i+6]), .sel(s[1]), .y(stage2[i]));
            end else begin
                mux2_1 mux_2 (.a(stage1[i]), .b(stage1[i-2]), .sel(s[1]), .y(stage2[i]));
            end
        end
    endgenerate

    // Stage 3: Rotate by 4 bits
    generate
        for (i = 0; i < 8; i = i + 1) begin : rotate_by_4
            if (i < 4) begin
                mux2_1 mux_3 (.a(stage2[i]), .b(stage2[i+4]), .sel(s[2]), .y(stage3[i]));
            end else begin
                mux2_1 mux_3 (.a(stage2[i]), .b(stage2[i-4]), .sel(s[2]), .y(stage3[i]));
            end
        end
    endgenerate

    // Right shift: Equivalent to the original x shifted right by 's' positions
    assign shifted_right = x >> s;

    // Left shift: Equivalent to the original x shifted left by 's' positions
    assign shifted_left = x << s;

    // Output assignment based on shift mode
    always_comb begin
        case (shift_mode)
            2'b00: y = x;              // No shift
            2'b01: y = shifted_right;   // Right shift
            2'b10: y = shifted_left;    // Left shift
            2'b11: y = stage3;          // Rotate (right rotate by default)
            default: y = x;             // Default case (no shift)
        endcase
    end

endmodule
