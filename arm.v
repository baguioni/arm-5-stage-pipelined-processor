module arm(
    input CLK, RST
);
    wire PC_in;
    
    wire [31:0] InstrF, InstrD, PCPlus4F;

    // Fetch Stage
    fetch fetch_unit(
        .CLK(CLK),
        .RST(RST),
        .PC_in(PC_in),
        .InstrF(InstrF),
        .PCPlus4F(PCPlus4F)
    );

    fetch_reg fetch_reg_unit(
        .CLK(CLK),
        .RST(RST),
        .FlushD(FlushD),
        .InstrF(InstrF),
        .InstrD(InstrD)
    );

endmodule