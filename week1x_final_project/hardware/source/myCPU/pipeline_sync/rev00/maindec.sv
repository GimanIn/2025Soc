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
            7'b001_0011:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_0_00_1_000_10_1;// I-type (ADDI, SLTI 등)10
            7'b110_1111:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_1_0_10_0_10_0_011_01_1;// JAL
            7'b110_0111:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_1_10_0_00_1_000_10_1;// JALR
            7'b011_0111:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_0_10_1_100_00_1;// LUI
            7'b001_0111:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_0_01_1_100_00_1;// AUIPC
            7'b111_0011:{Branch, Jal, Jalr, ResultSrc, MemWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUop, RegWrite} = 15'b0_0_0_00_0_00_1_101_00_1;// Csrrw
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






