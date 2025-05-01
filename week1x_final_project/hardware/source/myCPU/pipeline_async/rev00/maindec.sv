/*module maindec(
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
    Branch
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
            default: {RegWrite, ImmSrc, ALUSrcA, ALUSrcB, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b00000000000000;  // Invalid instruction
        endcase

        // Btaken이나 Jump가 1일 때 PCSrc를 2'b01로 설정, 단 JALR 명령어일 때는 2'b10 유지
        if ((Btaken == 1 | Jump == 1) && opcode != 7'b110_0111) 
            PCSrc = 2'b01;
    end
endmodule
*/

/*module maindec(
    input [6:0] opcode,          // 명령어의 opcode 필드
    input [2:0] funct3,          // 명령어의 funct3 필드
    input Btaken,                // 브랜치가 성공했는지 여부
    output reg Branch,           // 브랜치 명령어 신호
    output reg Jal,              // JAL 명령어 신호
    output reg Jalr,             // JALR 명령어 신호
    output reg [1:0] ResultSrc,  // 결과 소스 선택 신호
    output reg MemWrite,         // 메모리 쓰기 제어
    output reg [1:0] ALUSrcA,    // ALU A 입력 선택 신호
    output reg ALUSrcB,          // ALU B 입력 선택 신호
    output reg [2:0] ImmSrc,     // Immediate 생성 신호
    output reg RegWrite,          // 레지스터 쓰기 제어
    output reg [1:0] ALUop
);

    always @(*) begin
        // 기본 설정
        {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, RegWrite} = 12'b0000_0000_0000;

        // Opcode에 따른 제어 신호 설정
        case (opcode)
            7'b0000011: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0000_01_00_1_000_00_1; // LW
            7'b0100011: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0000_00_00_1_001_00_0; // SW
            7'b0110011: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0000_00_00_0_xxx_10_1; // R-type
            7'b1100011: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b1000_00_00_0_010_01_0; // BEQ
            7'b0010011: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0000_00_01_1_000_10_1; // I-type (e.g., ADDI)
            7'b1101111: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0101_xx_00_0_011_00_1; // JAL
            7'b1100111: begin // JALR
                {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0011_00_00_1_000_00_1;
            end
            7'b0110111: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0000_00_10_1_100_00_1; // LUI
            7'b0010111: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0000_00_10_1_100_00_1; // AUIPC
            default: {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc,ALUop, RegWrite} = 13'b0000_0000_0000; // Invalid instruction
        endcase

        // Btaken에 따라 제어 신호를 설정
        if (Btaken == 1)
            Branch = 1'b1;
    end
endmodule*/

/*module maindec(
    Z_flag,
    opcode,
    Branch,
    ResultSrc,
    MemWrite,
    ALUSrc_A,
    ALUSrc_B,
    ImmSrc,
    RegWrite,
    Jump,
    ALUop
);
    // input
    input Z_flag;
    input [6:0] opcode;
    // output
    output reg Branch;
    output reg [1:0] ALUSrc_A;
    output reg MemWrite, ALUSrc_B, RegWrite, Jump;
    output reg [1:0] ResultSrc;
    output reg[2:0] ImmSrc;
    output reg [1:0] ALUop;

    always@(*) begin    // main decoder
        case(opcode)
            7'b000_0011 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_000_00_1_0_01_0_00_0;     // lw
            7'b010_0011 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b0_001_00_1_1_00_0_00_0;     // sw
            7'b011_0011 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_000_00_0_0_00_0_10_0;     // R-type
            7'b011_0111 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_100_10_1_0_00_0_00_0;     // U-type
            7'b110_0011 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b0_010_00_0_0_00_1_01_0;	 // B-type
            7'b001_0011 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_000_00_1_0_00_0_10_0;     // I-type
            7'b110_1111 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_011_00_0_0_10_0_00_1;     // jal
            7'b110_0111 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_000_00_1_0_10_0_00_0;     // jalr
            7'b001_0111 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_100_01_1_0_00_0_00_0;     // auipc
            7'b111_0011 : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'b1_101_00_1_0_00_0_00_0;     // Csrrw
            default : {RegWrite, ImmSrc, ALUSrc_A, ALUSrc_B, MemWrite, ResultSrc, Branch, ALUop, Jump} = 14'h0;
        endcase
    end

endmodule*/

module maindec(
    input [6:0] opcode,          // 명령어의 opcode 필드
    input [2:0] funct3,          // 명령어의 funct3 필드
    //input Btaken,                // 브랜치가 성공했는지 여부
    output reg Branch,           // 브랜치 명령어 신호
    output reg Jal,              // JAL 명령어 신호
    output reg Jalr,             // JALR 명령어 신호
    output reg [1:0] ResultSrc,  // 결과 소스 선택 신호
    output reg MemWrite,         // 메모리 쓰기 제어
    output reg [1:0] ALUSrcA,    // ALU A 입력 선택 신호
    output reg ALUSrcB,          // ALU B 입력 선택 신호
    output reg [2:0] ImmSrc,     // Immediate 생성 신호
    output reg RegWrite,         // 레지스터 쓰기 제어
    output reg [1:0] ALUop       // ALU 연산 제어
);

    always @(*) begin
        // 기본 설정 (15비트)
        {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} 
            = 15'b000_00_0_00_000_00_0;

        case (opcode)
            7'b000_0011:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_01_0_00_1_000_00_1;// LW
            7'b010_0011:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_1_00_1_001_00_0;// SW
            7'b011_0011:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_0_00_0_000_10_1;// R-type
            7'b110_0011:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b1_0_0_00_0_00_0_010_01_0;// BEQ, BNE 등
            7'b001_0011:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_0_00_1_000_10_1;// I-type (ADDI, SLTI 등)
            7'b110_1111:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_1_0_10_0_10_0_011_00_1;// JAL
            7'b110_0111:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_1_10_0_01_0_000_00_1;// JALR
            7'b011_0111:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_0_10_1_100_00_1;// LUI
            7'b001_0111:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_0_10_1_100_00_1;// AUIPC
            default:
                {Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} 
                    = 15'b000_00_0_00_000_00_0;
        endcase

        // Btaken 적용
       /* if (Btaken)
            Branch = 1'b1;
    end*/
    end
endmodule






