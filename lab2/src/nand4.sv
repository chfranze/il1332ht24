module nand4 ( 
	input logic a,   // First input 
	input logic b,   // Second input 
    input logic c,   // third input 
    input logic d,   // fourth input 
	output logic y   // Output 
	); 

// Continuous assignment for XOR gate 
    assign y = ~(a & b & c & d);  // Perform the XOR operation after the delay
	//assign y = ~(a & b & c & d);  // Perform the XOR operation after the delay

	
endmodule