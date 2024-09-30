module alu (
    input logic [7:0] x,
    input logic [7:0] y,
    input logic [1:0] m,
    input logic [1:0] s,
    output logic[15:0] z
);

    logic [7:0] [3:0] x_mux_out;
    logic [7:0] [3:0] y_mux_out;

    logic [15:0] arithmetic_mux_out;
    logic [7:0] shiftRotate_mux_out;
    logic [7:0] compare_mux_out;
    logic [7:0] logic_mux_out;

    mux4to1_N_bit #(8) x_input_mux (
        .A(x_mux_out[0]),   // Arithmetic
        .B(x_mux_out[1]),   // Shift/Rotate
        .C(x_mux_out[2]),   // Compare
        .D(x_mux_out[3]),   // Logic
        .sel(s),
        .Y(x)
    );

    mux4to1_N_bit #(8) y_input_mux (
        .A(y_mux_out[0]),   // Arithmetic
        .B(y_mux_out[1]),   // Shift/Rotate
        .C(y_mux_out[2]),   // Compare
        .D(y_mux_out[3]),   // Logic
        .sel(s),
        .Y(y)
    );

    // Arithmetic

    // ADD

    // Subtract

    // Multiply

    // Unused

    mux4to1_N_bit #(16) arithmetic_input_mux (
        .A(),
        .B(),
        .C(),
        .D(),
        .sel(m),
        .Y(arithmetic_mux_out)
    );
    
    // Shift/Rotate

    mux4to1_N_bit #(8) shiftRotate_input_mux (
        .A(),
        .B(),
        .C(),
        .D(),
        .sel(m),
        .Y(shiftRotate_mux_out)
    );

    logic [15:0] shiftRotate_mux_out_16bit;

    // Compare

    mux4to1_N_bit #(8) compare_input_mux (
        .A(),
        .B(),
        .C(),
        .D(),
        .sel(m),
        .Y(compare_mux_out)
    );

    logic [15:0] compare_mux_out_16bit;

    // Logic

    mux4to1_N_bit #(8) logic_input_mux (
        .A(),
        .B(),
        .C(),
        .D(),
        .sel(m),
        .Y(logic_mux_out)
    );

    logic [15:0] logic_mux_out_16bit;

    // Output mux

    mux4to1_N_bit #(16) output_mux (
        .A(arithmetic_mux_out),
        .B(shiftRotate_mux_out_16bit),
        .C(compare_mux_out_16bit),
        .D(logic_mux_out_16bit),
        .sel(s),
        .Y(z)
    );

endmodule