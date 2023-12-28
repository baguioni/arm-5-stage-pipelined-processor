module program_counter(
	input CLK, RST,
	input [31:0] PC_in,
	output reg [31:0] PC_out
);
	always @(posedge CLK) begin
		if (RST) begin
			PC_out <= 'd0;
		end else begin
			PC_out <= PC_in;
		end
	end

endmodule
