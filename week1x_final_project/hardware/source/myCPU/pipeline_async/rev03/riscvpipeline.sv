module riscvpipeline(
	clk,
	n_rst,
	PC,
	Instr,
	//MemWrite,
	ALUResult,
	WriteData_d,
	ReadData,
	ByteEnable,
	//BE_WD,
	MemWriteM
);
//func3랑 aluresult만 밀기
	parameter   RESET_PC = 32'h1000_0000;

	//input
	input clk, n_rst;
	input [31:0] Instr, ReadData;
	//output
	output MemWriteM;
	output [31:0] PC, ALUResult, WriteData_d;//WriteData; BE_WD;
	output [3:0]  ByteEnable;

	wire [31:0] InstrD;
	wire ALUSrcB, RegWrite, MemWrite;  
	wire [1:0] ResultSrc, PCSrc, ALUSrcA;
	wire [2:0] ImmSrc;
	wire [4:0] ALUControl;

	controller u_controller(
        .opcode(InstrD[6:0]),       // Opcode 입력,InstrD[6:0]
        .funct3(InstrD[14:12]),     // Funct3 입력
        .funct7(InstrD[31:25]),        // Funct7 입력
        .Btaken(Btaken),           // 브랜치 성공 여부 입력
        .Branch(Branch),           // 브랜치 신호 출력
        .Jal(Jal),                 // JAL 신호 출력
        .Jalr(Jalr),               // JALR 신호 출력
        .ResultSrc(ResultSrc),     // 결과 소스 제어 신호 출력
        .MemWrite(MemWrite),       // 메모리 쓰기 신호 출력
        .ALUSrcA(ALUSrcA),         // ALU A 입력 제어 신호 출력
        .ALUSrcB(ALUSrcB),         // ALU B 입력 제어 신호 출력
        .ImmSrc(ImmSrc),           // Immediate 소스 제어 신호 출력
        .RegWrite(RegWrite),       // 레지스터 쓰기 신호 출력
        .ALUControl(ALUControl)    // ALU 제어 신호 출력
    );

 datapath #(
        .RESET_PC(RESET_PC)        // Reset PC 파라미터
    ) i_datapath (
        .clk(clk),                 // 클럭 입력
        .n_rst(n_rst),             // 리셋 입력
        .BranchD(Branch),          // 브랜치 제어 신호
		//.opcode(InstrD[6:0]),
        .Btaken(Btaken),           // 브랜치 성공 여부
        .Instr(Instr),             // 명령어 입력
        .ReadDataM(ReadData),      // 메모리 읽기 데이터 입력
        //.PCSrc(PCSrc),             // PC 소스 제어 신호
        .ResultSrcD(ResultSrc),    // 결과 소스 제어 신호
        .ALUControlD(ALUControl),  // ALU 제어 신호
		.JalD(Jal),
		.JalrD(Jalr),
        .ALUSrcAD(ALUSrcA),        // ALU A 입력 제어 신호
        .ALUSrcBD(ALUSrcB),        // ALU B 입력 제어 신호
        .ImmSrcD(ImmSrc),          // Immediate 소스 제어 신호
        .RegWriteD(RegWrite),      // 레지스터 쓰기 제어 신호
        .PCF(PC),                  // Program Counter 출력
        .ALUResultM(ALUResult),    // ALU 결과 출력
        //.BE_WD(BE_WD),             // 메모리 쓰기 데이터 출력
		.WriteData_d(WriteData_d),
        .Z_flagE(Z_flag),          // Zero 플래그 출력
        //.C_flagE(C_flag),          // Carry 플래그 출력
        //.N_flagE(N_flag),          // Negative 플래그 출력
        //.V_flagE(V_flag),          // Overflow 플래그 출력
        .ByteEnable(ByteEnable),   // 바이트 활성화 신호 출력
        .MemWriteD(MemWrite),      // 메모리 쓰기 제어 신호
        .MemWriteM(MemWriteM),      // MEM 단계 메모리 쓰기 신호
        .InstrD(InstrD)                  // 디코딩된 명령어
    );
// 제거해줘야 할 코드 예시


endmodule


