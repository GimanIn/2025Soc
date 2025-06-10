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
/*module IF_ID(
    input clk,
    input n_rst,            // Active low reset
    input [31:0] PCF,       // PC value from IF stage
    input [31:0] RDF,       // Fetched instruction
    input [31:0] PCPlus4F,  // PC+4 value from IF stage
    input StallD,          // Stall signal for ID stage
    input FlushD,          // Flush signal for branch misprediction
    output reg [31:0] InstrD,   // Instruction to ID stage
    output reg [31:0] PCD,      // PC to ID stage
    output reg [31:0] PCPlus4D  // PC+4 to ID stage
    
);

    always @(posedge clk or negedge n_rst) begin//posedge clk or
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
endmodule*/
/*module IF_ID(
    input         clk,
    input         n_rst,         // Active low reset
    input  [31:0] PCF,           // IF stage PC
    input  [31:0] RDF,           // fetched instruction
    input  [31:0] PCPlus4F,      // IF stage PC+4
    input         StallD,        // ID stage stall
    input         FlushD,        // ID stage flush
    output reg [31:0] InstrD,    // to ID stage
    output reg [31:0] PCD,       // to ID stage
    output reg [31:0] PCPlus4D   // to ID stage
);

    parameter RESET_PC = 32'h1000_0000;

    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            InstrD    <= 32'h00000013;       // NOP
            PCD       <= RESET_PC;
            PCPlus4D  <= RESET_PC + 4;
        end
        else if (FlushD) begin
            InstrD    <= 32'h00000013;       // NOP
            // PCD, PCPlus4D 값은 유지
        end
        else if (~StallD) begin
            InstrD    <= RDF;
            PCD       <= PCF;
            PCPlus4D  <= PCPlus4F;
        end
        // StallD == 1일 경우: 값 유지
    end

endmodule*/

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



