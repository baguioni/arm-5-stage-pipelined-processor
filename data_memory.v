// 32-bit addressing
// 32-bit word size
module data_memory(
	input CLK, 
	input [31:0] Address, 
	input [31:0] WriteData, 
	input MemWrite, // write data
	output wire [31:0] ReadData 
);
	// 32-bit wide word
	reg [31:0] memory [63:0];

	// initialize memory values to 0
	integer i;
	initial begin
		$display("Initializing data memory");
		for(i=0; i< 63; i=i+1) begin
			memory[i] = 32'b0;
		end
	end

	// writes are synchronous operations
	always @(posedge CLK) begin
		if (MemWrite == 1'b1) begin
			$display("Address: %d Data: %d", Address[31:2], WriteData);
			memory[Address[31:2]] <= WriteData;
		end
	end

	// reads are combinational operations
	assign ReadData = memory[Address[31:2]];
	
endmodule
