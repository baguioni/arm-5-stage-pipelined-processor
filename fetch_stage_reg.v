module fetch_reg(
    input CLK, StallD, FlushD,
    input [31:0] InstrF,
    output reg [31:0] InstrD
)
    always @(posedge CLK) begin
        if (FlushD) begin 
            InstrD <= 32'b0;
        end else if (StallD != 0)begin
            InstrD <= InstrF;
        end
    end

endmodule