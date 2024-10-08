module demux4to1_N_bit #(parameter N=4)(
    input logic [N-1:0] Y,
    input  logic [1:0] sel,
    output  logic [N-1:0] A,
    output  logic [N-1:0] B,
    output  logic [N-1:0] C,
    output  logic [N-1:0] D
);


    // Generate N bit 4-1 demux
    genvar i;
    generate
        for (i = 0; i < N; i++) begin : gen_4to1_demux
            demux4to1_slice ms (
                .y(Y[i]),
                .s(sel),
                .a(A[i]),
                .b(B[i]),
                .c(C[i]),
                .d(D[i])
            );
        end
    endgenerate

endmodule