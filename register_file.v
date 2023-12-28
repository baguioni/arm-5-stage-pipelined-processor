module register_file(
	input CLK, WE3,
	input [3:0] A1, A2, // read port address
	input [3:0] A3, // write port address
	input [31:0] WD3, R15,
	output wire [31:0] RD1, RD2
);

	// 32-bit wide word
	// 15 Registers
	reg [31:0] registers [14:0];

	// initialize memory values to 0
	integer i;
	initial begin
		$display("Initializing register file");
		for(i=0; i< 15; i=i+1) begin
			registers[i] = 32'b0;
		end
	end

	always @(negedge CLK, WE3) begin
		if (WE3 == 1'b1) begin
			$display("Write to Register: %d Data: %d", A3, WD3);
			registers[A3] <= WD3; // Since we are writing to register or seq element use non blocking assignment	
		end
	end

	//Assign R15 to register 15
	assign RD1 = (A1 == 4'b1111) ? R15 : registers[A1];
	assign RD2 = (A2 == 4'b1111) ? R15 : registers[A2];

endmodule
