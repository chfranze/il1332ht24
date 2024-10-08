
module and3_delay ( 
	input logic a,   // First input 
	input logic b,   // Second input 
    input logic c,   // Third input 
	output logic y   // Output 
	); 

logic u1_out;

nand3_delay u1 (.a(a), .b(b), .c(c), .y(u1_out));

nand2_delay u2 (.a(u1_out), .b(u1_out), .y(y));

endmodule