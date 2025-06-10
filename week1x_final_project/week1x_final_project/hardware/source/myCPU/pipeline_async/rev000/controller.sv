/*module controller(
    
    opcode,
    funct3,
    funct7,
    PCSrc,
    ResultSrc,
    MemWrite,
    ALUSrcA,
    ALUSrcB,
    ImmSrc,
    Branch,
    Btaken,
    RegWrite,
    ALUControl,
    Jump
);
    // input
    
    input Btaken;
    input [6:0] opcode;
    input [2:0] funct3;
    input funct7;
    // output
    output [1:0] PCSrc;
    output MemWrite, ALUSrcB, RegWrite, Jump, Branch;
    output [1:0] ResultSrc, ALUSrcA;
    output [2:0] ImmSrc;
    output [4:0] ALUControl;

    wire [1:0] ALUop;

    // maindec 인스턴스
    maindec mdec(
        
        .funct3(funct3),
        .opcode(opcode),
        .PCSrc(PCSrc),
        .Btaken(Btaken),
        .Branch(Branch),
        .ResultSrc(ResultSrc),
        .MemWrite(MemWrite),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .ImmSrc(ImmSrc),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .ALUop(ALUop)
    );
    
    // aludec 인스턴스
    aludec adec(
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .ALUop(ALUop),
        .ALUControl(ALUControl)
    );

endmodule*/
module controller(
    input [6:0] opcode,          // 명령어의 opcode 필드
    input [2:0] funct3,          // 명령어의 funct3 필드
    input [6:0] funct7,                // 명령어의 funct7 필드
    input Btaken,                // 브랜치 성공 여부
               // 메모리 쓰기 신호
    output [1:0] ResultSrc,      // 결과 소스 제어
    output [4:0] ALUControl,      // ALU 제어 신호
    output [1:0] ALUSrcA,        // ALU A 입력 제어
    output ALUSrcB,              // ALU B 입력 제어
    output [2:0] ImmSrc,         // Immediate 소스 제어
    output RegWrite,             // 레지스터 쓰기 신호
    output Branch,               // 브랜치 신호
    output Jal,                  // JAL 명령어 신호
    output Jalr,                 // JALR 명령어 신호
    output MemWrite              // 메모리 쓰기 신호
);

    wire [1:0] ALUop;            // ALU Operation 신호 (maindec에서 제공)
    /*localparam OPC_JALR   = 7'd103;
    assign Jalr = (opcode == OPC_JALR);*/

    // maindec 인스턴스
    maindec mdec(
        .opcode(opcode),         // Opcode 입력
        .funct3(funct3),         // Funct3 입력
        //.Btaken(Btaken),         // 브랜치 성공 여부
        .Branch(Branch),         // 브랜치 신호 출력
        .Jal(Jal),               // JAL 신호 출력
        .Jalr(Jalr),             // JALR 신호 출력
        .ResultSrc(ResultSrc),   // 결과 소스 제어 신호 출력
        .MemWrite(MemWrite),     // 메모리 쓰기 신호 출력
        .ALUSrcA(ALUSrcA),       // ALU A 입력 제어 신호 출력
        .ALUSrcB(ALUSrcB),       // ALU B 입력 제어 신호 출력
        .ImmSrc(ImmSrc),         // Immediate 소스 제어 신호 출력
        .RegWrite(RegWrite),      // 레지스터 쓰기 신호 출력
        .ALUop(ALUop)
    );
    
    // aludec 인스턴스
    aludec adec(
        .opcode(opcode),         // Opcode 입력
        .funct3(funct3),         // Funct3 입력
        .funct7(funct7),         // Funct7 입력
        .ALUop(ALUop),           // ALU Operation 신호 입력
        .ALUControl(ALUControl)  // ALU 제어 신호 출력
    );

endmodule

