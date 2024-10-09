module clk_divider #(parameter divisor = 100)
                    (input logic clk, rst_n,
                    output logic divided_clk);

logic [$clog2(divisor)-1:0] count;

always_ff @( posedge clk, negedge rst_n) begin 
    if(!rst_n) begin
        divided_clk <= 1'b0;
        count <= divisor;
    end
    else
    begin
        if(count == 0) begin
            count <= divisor;
            divided_clk <= ~divided_clk;
        end
        else
            count <= count - 1;
    end

    
end
endmodule