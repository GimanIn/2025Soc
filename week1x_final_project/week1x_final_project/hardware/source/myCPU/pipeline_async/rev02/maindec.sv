
module maindec(
    opcode,
    PCSrc,
    ResultSrc,
    MemWrite,
    ALUSrcA,
    ALUSrcB,
    ImmSrc,
    RegWrite,
    Jump,
    ALUop,
    Btaken,
    funct3,
    Branch,
    Csr
);
    // input
    input [2:0] funct3;
    input [6:0] opcode;
    input Btaken;

    // output
    output reg [1:0] PCSrc;
    output reg MemWrite, RegWrite, Jump;
    output reg [1:0] ResultSrc, ALUSrcA;
    output reg ALUSrcB;
    output reg [2:0] ImmSrc;
    output reg [1:0] ALUop;
    output reg Branch;
    output reg Csr;

    assign Csr = (opcode == 7'b111_0011)?1'b1:1'b0;

    always @(*) begin
        // 기본 설정
        {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b00000000000000;
        PCSrc = 2'b00; // 기본값

        // Opcode에 따른 제어 신호 설정
        case (opcode)
            7'b000_0011: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_000_00_1_0_01_0_00_0; // lw
            7'b010_0011: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b0_001_00_1_1_00_0_00_0; // sw
            7'b011_0011: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_xxx_00_0_0_00_0_10_0; // R-type
            7'b110_0011: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b0_010_00_0_0_00_1_01_0; // beq
            7'b001_0011: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_000_00_1_0_00_0_11_0; // I-type ALU (addi)
            7'b110_1111: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_011_xx_0_0_10_0_00_1; // jal
            7'b110_0111: begin // JALR
                {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_000_00_1_0_10_0_11_1;
                PCSrc = 2'b10; // JALR 명령어일 때 PCSrc를 2'b10으로 설정
            end
            7'b011_0111: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_100_10_1_0_00_0_00_0; // LUI (U-type)
            7'b001_0111: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_100_01_1_0_00_0_00_0; // AUIPC (U-type)
            7'b111_0011: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b0_000_00_0_0_00_0_00_0; // sw
            
            default: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b00000000000000;  // Invalid instruction
        endcase

        // Btaken이나 Jump가 1일 때 PCSrc를 2'b01로 설정, 단 JALR 명령어일 때는 2'b10 유지
        if ((Btaken == 1 | Jump == 1) && opcode != 7'b110_0111) 
            PCSrc = 2'b01;
    end
endmodule






