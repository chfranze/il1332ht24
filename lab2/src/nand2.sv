module nand2 ( 
	input logic a,   // First input 
	input logic b,   // Second input 
	output logic y   // Output 
	); 

// Continuous assignment for NAND gate 
       assign y = ~(a & b); 
endmodule