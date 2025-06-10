module riscvsingle(
	clk,
	n_rst,
	PC,
	Instr,
	MemWrite,
	ALUResult,
	//WriteData,
	ReadData,
	ByteEnable,
	BE_WD
);

	parameter   RESET_PC = 32'h1000_0000;

	//input
	input clk, n_rst;
	input [31:0] Instr, ReadData;
	//output
	output MemWrite;
	output [31:0] PC, ALUResult, BE_WD;//WriteData; BE_WD;
	output [3:0]  ByteEnable;

	wire Z_flag,N_flag,C_flag,V_flag,  ALUSrcB, RegWrite;  
	wire [1:0] ResultSrc,PCSrc,ALUSrcA;
	wire [2:0] ImmSrc;
	wire [4:0] ALUControl;
	wire Csr;

	controller u_controller(
		//.Z_flag(Z_flag),
		//.C_flag(C_flag),
		//.N_flag(N_flag),
		//.V_flag(V_flag),
		.Btaken(Btaken),
        .Branch(Branch),
		.opcode(Instr[6:0]),
		.funct3(Instr[14:12]),
		.funct7(Instr[30]),
		.PCSrc(PCSrc),
		.ResultSrc(ResultSrc),
		.MemWrite(MemWrite),
		.ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
		.ImmSrc(ImmSrc),
		.RegWrite(RegWrite),
		.ALUControl(ALUControl),
		.Jump(),
		.Csr(Csr)
	);

	datapath #(
		.RESET_PC(RESET_PC)
	) i_datapath(
		.clk(clk),
		.n_rst(n_rst),
		.Btaken(Btaken),
        .Branch(Branch),
		.Instr(Instr),        
		.ReadData(ReadData),    
		.PCSrc(PCSrc),      
		.ResultSrc(ResultSrc),
		.ALUControl(ALUControl),
		.ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
		.ImmSrc(ImmSrc),
		.RegWrite(RegWrite),
		.PC(PC),            
		.ALUResult(ALUResult),   
		//.WriteData(WriteData),      
		.Z_flag(Z_flag),
		.C_flag(C_flag),
		.N_flag(N_flag),
		.V_flag(V_flag),
		.ByteEnable(ByteEnable),
		.BE_WD(BE_WD),
		.Csr(Csr)
		
	);


endmodule

/*module riscvsingle(
	clk,
	n_rst,
	PC,
	Instr,
	MemWrite,
	ALUResult,
	ReadData,
	ByteEnable,
	BE_WD
);

	parameter   RESET_PC = 32'h1000_0000;

	// input
	input clk, n_rst;
	input [31:0] Instr, ReadData;
	
	// output
	output MemWrite;
	output [31:0] PC, ALUResult, BE_WD;
	output [3:0]  ByteEnable;

	// Internal wires
	wire Z_flag, N_flag, C_flag, V_flag, Branch, Btaken, RegWrite, Jump;
	wire [1:0] PCSrc, ResultSrc, ALUSrcA;
	wire ALUSrcB;
	wire [2:0] ImmSrc;
	wire [4:0] ALUControl;

	// Controller instantiation
	controller u_controller(
		.Z_flag(Z_flag),
		.Btaken(Btaken),
		.Branch(Branch),
		.opcode(Instr[6:0]),
		.funct3(Instr[14:12]),
		.funct7(Instr[30]),
		.PCSrc(PCSrc),
		.ResultSrc(ResultSrc),
		.MemWrite(MemWrite),
		.ALUSrcA(ALUSrcA),
		.ALUSrcB(ALUSrcB),
		.ImmSrc(ImmSrc),
		.RegWrite(RegWrite),
		.ALUControl(ALUControl),
		.Jump(Jump)
	);

	// Datapath instantiation
	datapath #(
		.RESET_PC(RESET_PC)
	) i_datapath(
		.clk(clk),
		.n_rst(n_rst),
		.Btaken(Btaken),
		.Branch(Branch),
		.Instr(Instr),        
		.ReadData(ReadData),    
		.PCSrc(PCSrc),      
		.ResultSrc(ResultSrc),
		.ALUControl(ALUControl),
		.ALUSrcA(ALUSrcA),
		.ALUSrcB(ALUSrcB),
		.ImmSrc(ImmSrc),
		.RegWrite(RegWrite),
		.PC(PC),            
		.ALUResult(ALUResult),   
		.Z_flag(Z_flag),
		.C_flag(C_flag),
		.N_flag(N_flag),
		.V_flag(V_flag),
		.ByteEnable(ByteEnable),
		.BE_WD(BE_WD)
	);

endmodule
*/

