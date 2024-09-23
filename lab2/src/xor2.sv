module xor2 ( 
	input logic a,   // First input 
	input logic b,   // Second input 
	output logic y   // Output 
	); 

// Continuous assignment for XOR gate 
        assign y = a ^ b;  
endmodule