module fetch(
    input CLK, RST,
    input [31:0] PC_in,
    output reg [31:0] InstrF,
    output wire [31:0] PCPlus4F,
);
    wire [31:0] PC_out;
    
    program_counter program_counter_unit(
		.CLK(CLK),
		.RST(RST),
		.PC_in(PC_in),
		.PC_out(PC_out)
	);

   	instruction_memory instruction_memory_unit(
		.Address(PC_out),
		.ReadData(InstrF)
	);

    adder adder_PCPlus4 (
		.a(PC_out),
		.b(32'd4),
		.result(PCPlus4F)
	);
endmodule