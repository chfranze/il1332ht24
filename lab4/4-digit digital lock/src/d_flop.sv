module d_flop (
    input logic d,         // D input
    input logic clk,       // Clock
    input logic reset_n,   // Active-low reset
    output logic q,        // Output Q
    output logic qb        // Output QB
    );

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            q <= 1'b0;      // Reset Q to 0
            qb <= 1'b1;     // Reset QB to 1 (complement of Q)
        end else begin
            q <= d;         // Normal D flip-flop behavior
            qb <= ~d;
        end
    end

endmodule
