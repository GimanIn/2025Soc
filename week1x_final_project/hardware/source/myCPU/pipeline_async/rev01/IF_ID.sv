module IF_ID (
    input clk,
    input n_rst,
    input en,
    input FlushD,
    input [31:0] RD,
    input [31:0] PCF,
    input [31:0] PC_plus4F,
    

    output reg [31:0] InstrD,
    output reg [31:0] PCD,
    output reg [31:0] PC_plus4D
);

    parameter RESET_VALUE = 32'h0000_0000;

    always @(posedge clk or negedge n_rst) begin
        if(!n_rst) begin
            InstrD <= 32'h00000013;
            PCD <= RESET_VALUE;
            PC_plus4D <= 32'h0;
        end
        else begin
            if (FlushD) begin
                InstrD <= 32'h00000013;
            end
            else begin
                if (en) begin
                    InstrD <= InstrD;
                    PCD <= PCD;
                    PC_plus4D <= PC_plus4D;
                end
                else begin
                    InstrD <= RD;
                    PCD <= PCF;
                    PC_plus4D <= PC_plus4F;
                end
            end
        end
    end
endmodule
