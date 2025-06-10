module controller(
    
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
    Jump,
    Csr
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
    output Csr;

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
        .ALUop(ALUop),
        .Csr(Csr)
    );
    
    // aludec 인스턴스
    aludec adec(
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .ALUop(ALUop),
        .ALUControl(ALUControl)
    );

endmodule
