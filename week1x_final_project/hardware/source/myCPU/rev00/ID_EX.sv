module ID_EX(
    input clk,
    input n_rst,             // Active low reset
    input [31:0] PCPlus4D,   // PC+4 from ID stage
    input [31:0] RD1D,       // Source register 1 data
    input [31:0] RD2D,       // Source register 2 data
    input [31:0] ImmExtD,    // Immediate value
    input [31:0] PCD,        // PC value from ID stage
    input [31:0] InstrD,     // Instruction from ID stage
    input [4:0] RdD,         // Destination register
    input [4:0] Rs1D,        // Source register 1
    input [4:0] Rs2D,        // Source register 2
    input [4:0] ALUControlD, // ALU control signals
    input [1:0] ALUSrcAD,    // ALU source A control
    input ALUSrcBD,          // ALU source B control
    input MemWriteD,         // Memory write control
    input RegWriteD,         // Register write control
    input [1:0] ResultSrcD,  // Memory to register control
    //input [2:0] ImmSrcD,     // Immediate source control
    input BranchD,           // Branch control
    input JalD,              // JAL control signal
    input JalrD,             // JALR control signal
    output reg [31:0] PCPlus4E,
    output reg [31:0] RD1E,
    output reg [31:0] RD2E,
    output reg [31:0] ImmExtE,
    output reg [31:0] PCE,         // PC value to EX stage
    output reg [31:0] InstrE,      // Instruction to EX stage
    output reg [4:0] RdE,
    output reg [4:0] Rs1E,
    output reg [4:0] Rs2E,
    output reg [4:0] ALUControlE,  // ALU control signals to EX stage
    output reg [1:0] ALUSrcAE,     // ALU source A control to EX stage
    output reg ALUSrcBE,           // ALU source B control to EX stage
    output reg MemWriteE,
    output reg RegWriteE,
    output reg [1:0] ResultSrcE,   // Memory to register control to EX stage
    //output reg [2:0] ImmSrcE,      // Immediate source control to EX stage
    output reg BranchE,
    output reg JalE,               // JAL control signal to EX stage
    output reg JalrE               // JALR control signal to EX stage
);

    always @(posedge clk or negedge n_rst) begin//posedge clk or
        if (!n_rst) begin
            PCPlus4E <= 0;
            RD1E <= 0;
            RD2E <= 0;
            ImmExtE <= 0;
            PCE <= 0;
            InstrE <= 0;
            RdE <= 0;
            Rs1E <= 0;
            Rs2E <= 0;
            ALUControlE <= 0;
            ALUSrcAE <= 0;
            ALUSrcBE <= 0;
            MemWriteE <= 0;
            RegWriteE <= 0;
            ResultSrcE <= 0;
           // ImmSrcE <= 0;
            BranchE <= 0;
            JalE <= 0;
            JalrE <= 0;
        end else begin
            PCPlus4E <= PCPlus4D;
            RD1E <= RD1D;
            RD2E <= RD2D;
            ImmExtE <= ImmExtD;
            PCE <= PCD;
            InstrE <= InstrD;
            RdE <= RdD;
            Rs1E <= Rs1D;
            Rs2E <= Rs2D;
            ALUControlE <= ALUControlD;
            ALUSrcAE <= ALUSrcAD;
            ALUSrcBE <= ALUSrcBD;
            MemWriteE <= MemWriteD;
            RegWriteE <= RegWriteD;
            ResultSrcE <= ResultSrcD;
            //ImmSrcE <= ImmSrcD;
            BranchE <= BranchD;
            JalE <= JalD;
            JalrE <= JalrD;
        end
    end
endmodule
