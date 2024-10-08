module arithmetic_alu(
    input logic [3:0] x,
    input logic [3:0] y,
    input logic [1:0] m,
    output logic [7:0] z
);

    logic [7:0] add_out, sub_out;

    // Add
    logic [7:0] sum_add;
    logic carry_add;

    rca_nbit #(4) add (
        .a(x),
        .b(y),
        .cin(1'b0),
        .sum(sum_add),
        .cout(carry_add)    // Carry-out
    );

    assign add_out[3:0] = sum_add;
    assign add_out[4] = carry_add;
    assign add_out[7:5] = 3'b0; // Padding for higher bits

    // Sub
    logic [3:0] y_inv;
    logic [3:0] sum_sub;
    logic carry_sub;

    twos_complement_inverter #(4) inv (
        .a(y),
        .y(y_inv)
    );

    rca_nbit #(4) sub (
        .a(x),
        .b(y_inv),
        .cin(1'b0),
        .sum(sum_sub), 
        .cout(carry_sub)    // Carry-out
    );

    assign sub_out[3:0] = sum_sub;
    // assign sub_out[8] = carry_sub;
    assign sub_out[7:4] = 8'b0; // Padding for higher bits
    // assign sub_out[15:9] = 7'b0; // Padding for higher bits

    logic [7:0] mul_out;
    logic [3:0] mul_x;
    logic [3:0] mul_y;

    assign mul_x[3:0] = x[3:0];
    assign mul_y[3:0] = y[3:0];
    assign mul_x[4] = 1'b0;
    assign mul_y[4] = 1'b0;


    mult_mnbit #(4,4) mul (
    (mul_x),
    (mul_y),
    (mul_out)
);

    logic [7:0] mul_done;

    assign mul_done[7:0] = mul_out[7:0];



    // Select MUX
    mux4to1_N_bit #(8) M1(
        .A(add_out),
        .B(sub_out),
        .C(mul_done),
        .D(8'b0),
        .sel(m),
        .Y(z)             // Output to 'out'
    );

endmodule