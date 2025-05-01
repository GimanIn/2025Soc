module ID_EX (
// input
    input clk,
    input n_rst,
    input CLR,
    input FlushE,
    // control signal
    input BranchD,
    input jal,
    input jalr,
    input [1:0] ResultSrcD,
    input MemWriteD,
    input [4:0] ALUControlD,
    input [1:0] ALUSrc_A,
    input ALUSrc_B,
    input RegWrite,
    // datapath signal
    input [31:0] InstrD,
    input [31:0] RD1,
    input [31:0] RD2, 
    input [31:0] PCD,
    input [4:0] RdD,
    input [4:0] Rs1D,
    input [4:0] Rs2D,
    input [31:0] PC_plus4D,
    input [31:0] ImmExtD,

// output
    // control signal
    output reg BranchE,
    output reg jalE,
    output reg jalrE,
    output reg [1:0] ResultSrcE,
    output reg MemWriteE,
    output reg [4:0] ALUControlE,
    output reg [1:0] ALUSrc_AE,
    output reg ALUSrc_BE,
    output reg RegWriteE,
    // datapath signal
    output reg [31:0] InstrE,
    output reg [31:0] RD1E,
    output reg [31:0] RD2E,
    output reg [31:0] PCE,
    output reg [4:0] Rs1E,
    output reg [4:0] Rs2E,
    output reg [4:0] RdE,
    output reg [31:0] ImmExtE,
    output reg [31:0] PC_plus4E
);

    parameter RESET_VALUE = 32'h0000_0000;

    always @(posedge clk or negedge n_rst) begin
        if(!n_rst) begin
            // control signal
            BranchE <= 1'h0;
            jalE <= 1'h0;
            jalrE <= 1'h0;
            ResultSrcE <= 2'h0;
            MemWriteE <= 1'h0;
            ALUControlE <= 5'h0;
            ALUSrc_AE <= 2'h0;
            ALUSrc_BE <= 1'h0;
            RegWriteE <= 1'h0;

            // datapath signal
            InstrE <= 32'h00000013;
            RD1E <= 32'h0;
            RD2E <= 32'h0;
            PCE <= RESET_VALUE;
            Rs1E <= 32'h0;
            Rs2E <= 32'h0;
            RdE <= 32'h0;
            ImmExtE <= 32'h0;
            PC_plus4E <= 32'h0;
        end
        else begin 
            if (FlushE) begin
                // control signal
                BranchE <= 1'h0;
                jalE <= 1'h0;
                jalrE <= 1'h0;
                ResultSrcE <= 2'h0;
                MemWriteE <= 1'h0;
                ALUControlE <= 5'b0_0000;
                ALUSrc_AE <= 2'h0;
                ALUSrc_BE <= 1'h0;
                RegWriteE <= 1'h0;

                // datapath signal
                InstrE <= 32'h00000013;
                RdE <= 5'b0_0000;
            end
            else begin
                // control signal
                BranchE <= Branch;
                jalE <= jal;
                jalrE <= jalr;
                ResultSrcE <= ResultSrc;
                MemWriteE <= MemWrite;
                ALUControlE <= ALUControl;
                ALUSrc_AE <= ALUSrc_A;
                ALUSrc_BE <= ALUSrc_B;
                RegWriteE <= RegWrite;

                // datapath signal
                InstrE <= InstrD;
                RD1E <= RD1;
                RD2E <= RD2;
                PCE <= PCD;
                Rs1E <= Rs1D;
                Rs2E <= Rs2D;
                RdE <= RdD;
                ImmExtE <= ImmExtD;
                PC_plus4E <= PC_plus4D;
            end
        end
    end

endmodule