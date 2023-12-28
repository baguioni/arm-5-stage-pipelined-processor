// 32-bit addressing
// 32-bit word size
module instruction_memory(
	input [31:0] Address, 
	output wire [31:0] ReadData 
);
	// 32-bit wide word
	reg [31:0] memory [63:0];
	integer i;

	initial begin
		$display("Initializing instruction memory");
		$readmemh("../instruction.dat", memory);
	end

	// reads are combinational operations
	assign ReadData = memory[Address[31:2]];
	
endmodule
