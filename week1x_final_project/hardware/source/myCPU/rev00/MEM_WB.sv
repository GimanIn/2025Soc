module MEM_WB(
    input clk,
    input n_rst,            // Active low reset
    input [31:0] PCPlus4M,  // PC+4 from MEM stage
    input [31:0] ReadDataM, // Data read from memory
    input [31:0] ALUResultM,// ALU computation result
    input [4:0] RdM,        // Destination register
    input RegWriteM,        // Register write control
    input [1:0] ResultSrcM,       // Memory to register control
    output reg [31:0] PCPlus4W,
    output reg [31:0] ReadDataW,
    output reg [31:0] ALUResultW,
    output reg [4:0] RdW,
    output reg RegWriteW,
    output reg [1:0]  ResultSrcW
);

    always @( posedge clk or negedge n_rst) begin//posedge clk or
        if (!n_rst) begin
            PCPlus4W <= 0;
            ReadDataW <= 0;
            ALUResultW <= 0;
            RdW <= 0;
            RegWriteW <= 0;
            ResultSrcW <= 0;
        end else begin
            PCPlus4W <= PCPlus4M;
            ReadDataW <= ReadDataM;
            ALUResultW <= ALUResultM;
            RdW <= RdM;
            RegWriteW <= RegWriteM;
            ResultSrcW <= ResultSrcM;
        end
    end
endmodule
