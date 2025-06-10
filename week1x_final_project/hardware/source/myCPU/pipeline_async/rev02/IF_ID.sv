module IF_ID (
    input clk,
    input n_rst, 
    input StallD,
    
    input FlushD,
    input [31:0] RDF,
    input [31:0] PCF,
    input [31:0] PCPlus4F,
    

    output reg [31:0] InstrD,
    output reg [31:0] PCD,
    output reg [31:0] PCPlus4D
);
parameter RESET_VALUE = 32'h1000_0000;
always @(posedge clk or negedge n_rst) begin
        if(!n_rst) begin
            InstrD <= 32'h00000013;
            PCD <= RESET_VALUE;
            PCPlus4D <= 32'h0;
        end
        else begin
            if (FlushD) begin
                InstrD <= 32'h00000013;
            end
            else begin
                if (StallD) begin
                    InstrD <= InstrD;
                    PCD <= PCD;
                    PCPlus4D <= PCPlus4D;
                end
                else begin
                    InstrD <= RDF;
                    PCD <= PCF;
                    PCPlus4D <= PCPlus4F;
                end
            end
        end
    end
endmodule



