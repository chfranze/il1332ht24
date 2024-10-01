module mult_Nbit #(parameter N=4) (
    input  logic [N-1:0] A,
    input  logic [N-1:0] B,
    output logic [2*N-1:0] Prod
);

logic [N-1:0][N-1:0] prod_terms;

logic [N-1:0] A0, B0, Sum0;
logic co0;

logic [N-1:0] A1, B1, Sum1;
logic co1;

logic [N-1:0] A2, B2, Sum2;
logic co2;


    // Generate block to create the 4 product terms
    genvar i, j;
    generate
        for (i = 0; i < N; i++) begin : B_loop
            for (j = 0; j < N; j++) begin : A_loop
                and2_delay u_and (
                    .a(A[i]), 
                    .b(B[j]), 
                    .y(prod_terms[j][i])
                    );
            end
        end

        assign A0[N-1]     = 1'b0;
        assign A0[N-2:0]   = prod_terms [0][N-1:1];
        assign Prod[0]     = prod_terms [0][0];
        assign B0          = prod_terms [1];
       
       rca_Nbit_co #(N) u1 ( 
                                .A(A0),
                                .B(B0),
                                .cin(1'b0),
                                .Sum(Sum0),
                                .co(co0)
                            );
                            
        assign A1[N-1]      = co0;
        assign A1[N-2:0]    = Sum0[N-1:1];
        assign Prod[1]      = Sum0[0];
        assign B1           = prod_terms [2];
       
       rca_Nbit_co #(N) u2 ( 
                                .A(A1),
                                .B(B1),
                                .cin(1'b0),
                                .Sum(Sum1),
                                .co(co1)
                            );

        assign A2[N-1]     = co1;
        assign A2[N-2:0]   = Sum1[N-1:1];
        assign Prod[2]     = Sum1[0];
        assign B2                   = prod_terms [3];
       
       rca_Nbit_co #(N) u3 ( 
                                .A(A2),
                                .B(B2),
                                .cin(1'b0),
                                .Sum(Sum2),
                                .co(co2)
                            );

        assign Prod [6:3]  = Sum2;
        assign Prod [7]    = co2;


    endgenerate




endmodule