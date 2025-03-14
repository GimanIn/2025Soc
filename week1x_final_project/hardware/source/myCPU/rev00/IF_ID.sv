/*module IF_ID(
    input clk,
    input n_rst,            // Active low reset
    input [31:0] PCF,       // PC value from IF stage
    input [31:0] RDF,       // Fetched instruction
    input [31:0] PCPlus4F,  // PC+4 value from IF stage
    //input StallD,          // Stall signal for ID stage
    //input FlushD,          // Flush signal for branch misprediction
    output reg [31:0] InstrD,   // Instruction to ID stage
    output reg [31:0] PCD,      // PC to ID stage
    output reg [31:0] PCPlus4D  // PC+4 to ID stage
);

    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            InstrD <= 0;
            PCD <= 0;
            PCPlus4D <= 0;
        end else if (FlushD) begin
            InstrD <= 0; // Flush the instruction
            PCD <= 0;
            PCPlus4D <= 0;
        end else if (!StallD) begin
            InstrD <= RDF;
            PCD <= PCF;
            PCPlus4D <= PCPlus4F;
        end
    end
endmodule
*/
module IF_ID(
    input clk,
    input n_rst,            // Active low reset
    input [31:0] PCF,       // PC value from IF stage
    input [31:0] RDF,       // Fetched instruction
    input [31:0] PCPlus4F,  // PC+4 value from IF stage
    output reg [31:0] InstrD,   // Instruction to ID stage
    output reg [31:0] PCD,      // PC to ID stage
    output reg [31:0] PCPlus4D  // PC+4 to ID stage
);

    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            InstrD <= 0;
            PCD <= 0;
            PCPlus4D <= 0;
        end else begin
            InstrD <= RDF;
            PCD <= PCF;
            PCPlus4D <= PCPlus4F;
        end
    end
endmodule
