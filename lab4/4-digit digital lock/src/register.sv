module register (
    input logic divided_clk,
    input logic rstn,
    input logic valid_key_BTN,
    output logic debounced_valid_key
);

  // Generate block for storage
  genvar i, j;
  generate
    for (i = 0; i < M; i++) begin : B_loop
      for (j = 0; j < N; j++) begin : A_loop
        and2 u_and (
            .a(a[i]),
            .b(b[j]),
            .y(prod_terms[j][i])
        );
      end
    end
  endgenerate

    d_flop_beh [3:0] flop [3:0]

    always_ff @(posedge divided_clk or negedge rstn) begin
        if (!rstn) begin
            // Reset s
        end else begin
            
        end
    end

endmodule