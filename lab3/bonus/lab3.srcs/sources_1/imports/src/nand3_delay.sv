
module nand3_delay ( 
	input logic a,   // First input 
	input logic b,   // Second input 
	input logic c,   // third input 
	output logic y   // Output 
	); 

// Continuous assignment for NAND gate 
    assign y = ~(a & b & c);  // Perform the NAND operation after the delay
	//assign y = ~(a & b & c);  // Perform the NAND operation after the delay
endmodule