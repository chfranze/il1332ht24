module arithmetic_alu(
    input logic [7:0] x,
    input logic [7:0] y,
    input logic [1:0] select,
    output logic [15:0] out
);

    logic [15:0] add_out, sub_out, mul_out;

    // Add
    logic [7:0] sum_add;
    logic carry_add;

    rca_nbit #(8) add (
        .a(x),
        .b(y),
        .cin(1'b0),
        .sum(sum_add),      // Assign the 8-bit sum
        .cout(carry_add)    // Carry-out
    );

    assign add_out[7:0] = sum_add;
    assign add_out[8] = carry_add;
    assign add_out[15:9] = 0; // Padding for higher bits

    // Sub
    logic [7:0] b_inv;
    logic [7:0] sum_sub;
    logic carry_sub;

    twos_complement_inverter #(8) inv (
        .a(y),
        .y(b_inv)
    );

    rca_nbit #(8) sub (
        .a(x),
        .b(b_inv),
        .cin(1'b0),
        .sum(sum_sub),      // Assign the 8-bit sum
        .cout(carry_sub)    // Carry-out
    );

    assign sub_out[7:0] = sum_sub;
    assign sub_out[8] = carry_sub;
    assign sub_out[15:9] = 0; // Padding for higher bits

    // Multiply
    mult_Nbit #(8) mul (
        .A(x),
        .B(y),
        .Prod(mul_out)      // Directly assign the 16-bit product
    );

    // Select MUX
    mux4to1_N_bit #(16) M1(
        .A(add_out),
        .B(sub_out),
        .C(mul_out),
        .D(16'b0),
        .sel(select),
        .Y(out)             // Output to 'out'
    );

endmodule