module nand2_delay ( 
	input logic a,   // First input 
	input logic b,   // Second input 
	output logic y   // Output 
	); 

    assign y = a||b; 
	
endmodule