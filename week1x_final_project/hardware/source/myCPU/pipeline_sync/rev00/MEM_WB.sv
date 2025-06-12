module MEM_WB(
    input clk,
          
    input [31:0] PCPlus4M,  // PC+4 from MEM stage
    input [31:0] ReadDataM, // Data read from memory
    input [31:0] ALUResultM,// ALU computation result
    input [4:0] RdM,        // Destination register
    input RegWriteM,        // Register write control
    input [31:0]InstrM,
    input [1:0] ResultSrcM,       // Memory to register control

    output reg [31:0] PCPlus4W,
    output reg [31:0] ReadDataW,
    output reg [31:0] ALUResultW,
    output reg [4:0] RdW,
    output reg RegWriteW,
    output reg [1:0]  ResultSrcW,
    output reg [31:0] InstrW
);
reg [31:0] ReadDataM_delayed;
    always @( posedge clk ) begin//posedge clk or
            InstrW <= InstrM;
            PCPlus4W <= PCPlus4M;
            ReadDataW <= ReadDataM;
            ALUResultW <= ALUResultM;
            RdW <= RdM;
            RegWriteW <= RegWriteM;
            ResultSrcW <= ResultSrcM;
            //ReadDataM_delayed <= ReadDataM;       // 1클럭 지연
            //ReadDataW <= ReadDataM_delayed;       // 2클럭 지연 (총합)
        end
    
endmodule
