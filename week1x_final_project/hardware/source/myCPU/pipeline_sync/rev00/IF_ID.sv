module IF_ID (
    input clk,
    input StallD,
    input FlushD,
    input [31:0] PCPlus4F,
    output reg [31:0] PCPlus4D
);

always @(posedge clk) begin 
    if (FlushD) begin
        PCPlus4D <= 32'h0;
    end
    else begin
        if (StallD) begin
            PCPlus4D <= PCPlus4D;
        end
        else begin
            PCPlus4D <= PCPlus4F;
        end
    end
end
endmodule