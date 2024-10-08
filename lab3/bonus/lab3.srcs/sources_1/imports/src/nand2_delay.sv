
module nand2_delay ( 
	input logic a,   // First input 
	input logic b,   // Second input 
	output logic y   // Output 
	); 

// Continuous assignment for NAND gate 
    assign y = ~(a & b);  // Perform the NAND operation after the delay
	
endmodule