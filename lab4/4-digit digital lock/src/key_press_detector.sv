module key_press_detector (
    input logic clk_100mhz,
    input logic rstn,
    input logic [3:0] key,
    input logic debounced_valid_key,
    output logic valid_key
);

    always_ff @(posedge clk_100mhz or negedge rstn) begin
        if (!rstn) begin
            // Reset s
        end else begin
            
        end
    end

endmodule