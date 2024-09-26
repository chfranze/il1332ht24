module twos_complement_inverter #(parameter N = 8)(
    input logic [N-1:0] a,    // Input positive 2's complement number
    output logic [N-1:0] y    // Output negative 2's complement number
);

    // Intermediate signal to store the bitwise inversion
    logic [N-1:0] inverted;

    // Perform bitwise inversion
    assign inverted = ~a;

    // Add 1 to the inverted number to get the 2's complement
    assign y = inverted + 1'b1;

endmodule
