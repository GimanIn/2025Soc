module EX_MEM(
    input clk,
// Active low reset
    input [31:0] PCPlus4E,  // PC+4 from EX stage
    input [31:0] ALUResultE,// ALU computation result
    input [31:0] WriteDataE,// Data to write to memory
    input [31:0] InstrE,    // Instruction from EX stage
    input [4:0] RdE,        // Destination register
    input MemWriteE,        // Memory write control
    input RegWriteE,        // Register write control
    input [1:0] ResultSrcE, // Memory to register control

    output reg [31:0] PCPlus4M,
    output reg [31:0] ALUResultM,
    output reg [31:0] WriteDataM,
    output reg [31:0] InstrM,    // Instruction to MEM stage
    output reg [4:0] RdM,
    output reg MemWriteM,
    output reg RegWriteM,
    output reg [1:0] ResultSrcM  // Memory to register control
);

    always @(posedge clk) begin//posedge clk or 
            PCPlus4M <= PCPlus4E;
            ALUResultM <= ALUResultE;
            WriteDataM <= WriteDataE;
            InstrM <= InstrE;
            RdM <= RdE;
            MemWriteM <= MemWriteE;
            RegWriteM <= RegWriteE;
            ResultSrcM <= ResultSrcE;
        end
    
endmodule
