module arithmetic_alu(
    input logic [7:0] x,
    input logic [7:0] y,
    input logic [1:0] m,
    output logic [15:0] z
);

    logic [15:0] add_out, sub_out;

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
    assign add_out[15:9] = 7'b0; // Padding for higher bits

    // Sub
    logic [7:0] y_inv;
    logic [7:0] sum_sub;
    logic carry_sub;

    twos_complement_inverter #(8) inv (
        .a(y),
        .y(y_inv)
    );

    rca_nbit #(8) sub (
        .a(x),
        .b(y_inv),
        .cin(1'b0),
        .sum(sum_sub),      // Assign the 8-bit sum
        .cout(carry_sub)    // Carry-out
    );

    assign sub_out[7:0] = sum_sub;
    // assign sub_out[8] = carry_sub;
    assign sub_out[15:8] = 8'b0; // Padding for higher bits
    // assign sub_out[15:9] = 7'b0; // Padding for higher bits

    // Multiply
    // mult_Nbit #(8) mul (
    //     .A(x),
    //     .B(y),
    //     .Prod(mul_out)      // Directly assign the 16-bit product
    // );

    logic [17:0] mul_out;
    logic [8:0] mul_x;
    logic [8:0] mul_y;

    assign mul_x[7:0] = x[7:0];
    assign mul_y[7:0] = y[7:0];
    assign mul_x[8] = 1'b0;
    assign mul_y[8] = 1'b0;


    mult_mnbit #(9,9) mul (
    (mul_x),
    (mul_y),
    (mul_out)
);

    logic [15:0] mul_done;

    assign mul_done[15:0] = mul_out[15:0];



    Select MUX
    mux4to1_N_bit #(16) M1(
        .A(add_out),
        .B(sub_out),
        .C(mul_done),
        .D(16'b0),
        .sel(m),
        .Y(z)             // Output to 'out'
    );

endmodule