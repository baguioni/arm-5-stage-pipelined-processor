module decode_reg(
    input CLK, FlushD, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD,
    input [1:0] ALUDControl, FlagWriteD,
    output PCSrcE, RegWriteE, MemtoRegE, MemWriteE, ALUControlE, BranchE, ALUSrcE,
    output [1:0] ALUEControl, FlagWriteE,
    output []
)