module comparator_Nbit #(parameter N=4)
                (   input  logic [N-1:0] A,
                    input logic [N-1:0] B,
                    output logic         g,
                    output logic         l
                );
   

   logic [N-1:0]                        G, L;
   

   assign G[0] = A[0];
   assign L[0] = B[0];
   
   assign g = G[N-1];
   assign l = L[N-1];
   
    // Generate N bit 2-1 mux
    genvar i;
    generate
        for (i = 0; i < N-1; i++) begin : gen_comp
            comparator_slice cs (
                .a0(G[i]),
                .b0(L[i]),
                .a1(A[i+1]),
                .b1(B[i+1]),
                .g(G[i+1]),
                .l(L[i+1])
            );
        end
    endgenerate

endmodule
