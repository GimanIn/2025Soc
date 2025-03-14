module datapath(
    clk,
    n_rst,
    Instr,         // from imem
    ReadDataM,     // from dmem
    PCSrc,         // from controller
    ResultSrcD,
    ALUControlD,
    ALUSrcAD,      // srcA
    ALUSrcBD,      // srcB
    ImmSrcD,
    RegWriteD,
    PCF,           // for imem
    ALUResultM,    // for dmem
    BE_WD,
    Z_flagE,       // for controller
    //C_flagE,
    //N_flagE,
    //V_flagE,
    BranchD,
    JalD,
    JalrD,
    Btaken,
    ByteEnable,
    MemWriteD,     // from controller
    MemWriteM,     // to datamem
    InstrD         // output
);

    parameter RESET_PC = 32'h1000_0000;

    // Inputs
    input clk, n_rst, ALUSrcBD, RegWriteD;
    input [31:0] Instr, ReadDataM;
    input [1:0] ResultSrcD, PCSrc, ALUSrcAD;
    input [4:0] ALUControlD;
    input BranchD, JalD, JalrD;
    input [2:0] ImmSrcD;
    input MemWriteD;

    // Outputs
    output [31:0] PCF, ALUResultM, BE_WD;
    output Z_flagE, Btaken;
    output [3:0] ByteEnable;
    output MemWriteM;
    output [31:0] InstrD;

    // Internal wires
    wire [31:0] BE_RDW; // be logic output
   
   // assign WriteData = BE_WD;

   
    // IF
    wire [31:0] PC_nextF;
    wire [31:0] PC_plus4F;
    //wire StallF;

    // ID
    wire [31:0] PCD, InstrD;
    wire [31:0] ImmExtD, RD1D, RD2D;  
    wire [31:0] PCPlus4D;
    wire RdD; // [11:7]Instr
    //wire StallD,FlushD;
    wire [4:0]Rs1D, Rs2D;

    // EX
    wire RegWriteE;
    wire [1:0]ResultSrcE;
    wire MemWriteE, BranchE;
    wire [4:0] ALUControlE;
    wire [1:0] ALUSrcAE;
    wire ALUSrcBE;
    wire [31:0] RD1E,RD2E,PCE;
    wire [4:0] RdE;
    wire [31:0] ImmExtE,PCPlus4E,InstrE; 
    
    wire [31:0] PC_targetE;
    wire [31:0]ALUResultE,SrcAE,SrcBE;
    wire N_flagE, C_flagE, V_flagE;
    wire [31:0]WriteDataE;
    wire [4:0] Rs1E , Rs2E;
    //wire [1:0] ForwardAE, ForwardBE;
    wire [31:0] RD1E_w, RD2E_w;
    //wire FlushE;
    wire JalE,JalrE, PCSrcE;

    // MEM
    wire RegWriteM;
    wire [1:0] ResultSrcM;
    wire [31:0] ALUResultM, WriteDataM, PCPlus4M;
    wire [4:0] RdM;
    wire [31:0] PCM;
    wire [31:0]InstrM;
 //   wire MemWriteM;


    // WB
    wire [31:0] ALUResultW, ReadDataW, PCPlus4W;
    wire RegWriteW;
    wire [1:0] ResultSrcW; 
    wire [4:0] RdW;
    wire [31:0] ResultW; //InstrW;


    IF_ID u_IF_ID(
        .clk(clk),
        .n_rst(n_rst),
        .PCF(PCF),
        .RDF(Instr),
        .PCPlus4F(PC_plus4F),

        .InstrD(InstrD),
        .PCD(PCD),
        .PCPlus4D(PCPlus4D)
    );
    assign Rs1D = InstrD[19:15];
    assign Rs2D = InstrD[24:20];

     ID_EX u_ID_EX(
        .clk(clk),
        .n_rst(n_rst),

        .RegWriteD(RegWriteD),
        .ResultSrcD(ResultSrcD),
        .MemWriteD(MemWriteD),
        .JalD(JalD),
        .JalrD(JalrD),
        .BranchD(BranchD),
        .ALUControlD(ALUControlD),
        .ALUSrcAD(ALUSrcAD),
        .ALUSrcBD(ALUSrcBD),
        .RD1D(RD1D),
        .RD2D(RD2D),
        .PCD(PCD),
        .RdD(InstrD[11:7]),
        .ImmExtD(ImmExtD),
        .PCPlus4D(PCPlus4D),
        .InstrD(InstrD),
        .Rs1D(InstrD[19:15]),
        .Rs2D(InstrD[24:20]),
        
        .BranchE(BranchE),
        .JalE(JalE),
        .JalrE(JalrE),
        .ResultSrcE(ResultSrcE),
        .MemWriteE(MemWriteE),
        .ALUSrcAE(ALUSrcAE),
        .ALUSrcBE(ALUSrcBE),
        .ImmExtE(ImmExtE),
        .RegWriteE(RegWriteE),
        .ALUControlE(ALUControlE),
        .RD1E(RD1E),
        .RD2E(RD2E),
        .PCE(PCE),
        .RdE(RdE),
        .PCPlus4E(PCPlus4E),
        .InstrE(InstrE),
        .Rs1E(Rs1E),
        .Rs2E(Rs2E)
    );

    assign WriteDataE = RD2E_w;

    EX_MEM u_EX_MEM(
        .clk(clk),
        .n_rst(n_rst),
        .RegWriteE(RegWriteE),
        .ResultSrcE(ResultSrcE),
        .MemWriteE(MemWriteE),
        .ALUResultE(ALUResultE),
        .WriteDataE(WriteDataE),
        .RdE(RdE),
        //.PCE(PCM),
        .PCPlus4E(PCPlus4E),
        .InstrE(InstrE),

        .RegWriteM(RegWriteM),
        .ResultSrcM(ResultSrcM),
        .MemWriteM(MemWriteM),
        .ALUResultM(ALUResultM),
        .WriteDataM(WriteDataM),
        .RdM(RdM),
        //.PCM(PCM),
        .PCPlus4M(PCPlus4M),
        .InstrM(InstrM)
    );

    MEM_WB u_MEM_WB(
        .clk(clk),
        .n_rst(n_rst),
        .RegWriteM(RegWriteM),
        .ResultSrcM(ResultSrcM),
        .ALUResultM(ALUResultM),
        .ReadDataM(ReadDataM),
        .RdM(RdM),
        .PCPlus4M(PCPlus4M),
    //    .InstrM(InstrM),
    //    .MemWriteM(MemWriteM),
        .RegWriteW(RegWriteW),
        .ResultSrcW(ResultSrcW),
        .ALUResultW(ALUResultW),
        .ReadDataW(ReadDataW),
        .RdW(RdW),
        .PCPlus4W(PCPlus4W)
    );


     mux3 u_pc_mux3(
        .in0(PC_plus4F),
        .in1(PC_targetE),
        .in2(ALUResultE),
        .sel(PCSrc),  
        .out(PC_nextF)
    );
    // IF Stage
    flopr #(.RESET_VALUE(RESET_PC)
    ) u_pc_register(
        .clk(clk),
        .n_rst(n_rst),
        .d(PC_nextF),
        .q(PCF)
        //.StallF(~StallF)
    );

    adder u_pc_plus4(
        .a(PCF),
        .b(32'h4),
        .ci(1'b0),
        .sum(PC_plus4F),
        .N(),
        .Z(),
        .C(),
        .V()
    );
     /*adder u_pc_plus4W(
        .a(32'h4),
        .b(PCM),
        .ci(1'b0),
        .sum(PC_plus4M),
        .N(),
        .Z(),
        .C(),
        .V()
    );*/

    extend u_extend(
        .ImmSrc(ImmSrcD),
        .in(InstrD[31:7]),
        .out(ImmExtD)
    );

   

    adder u_pc_target(
        .a(PCE),
        .b(ImmExtE),
        .ci(1'b0),
        .sum(PC_targetE),
        .N(),
        .Z(),
        .C(),
        .V()
    );

    reg_file_async rf (
        .clk        (clk),
        .clkb       (clk),
        .we         (RegWriteW),
        .ra1        (InstrD[19:15]),
        .ra2        (InstrD[24:20]),
        .wa         (RdW), //Rd Instr[11:7]
        .wd         (ResultW),
        .rd1        (RD1D   ), //srca
        .rd2        (RD2D)
    );

    /*mux3 u_hazard_RD1E(
        .in0(RD1E), //RD1D , srca
        .in1(ResultW),
        .in2(ALUResultM),
        .sel(ForwardAE),  
        .out(RD1E_w)
    );

    //hazard RD2E select 3 mux
    mux3 u_hazard_RD2E(
        .in0(RD2E), //RD1D , srca
        .in1(ResultW),
        .in2(ALUResultM),
        .sel(ForwardBE),  
        .out(RD2E_w)
    );*/

    mux3 u_aluA_mux3(
        .in0(RD1E_w), //RD1D , srca
        .in1(PCE),
        .in2(0),
        .sel(ALUSrcAE),  
        .out(SrcAE)
    );


    //Src B select mux
    mux2 u_aluB_mux2(
        .in0(RD2E_w), //RD1D 
        .in1(ImmExtE),
        .sel(ALUSrcBE),
        .out(SrcBE)
    );


    alu u_ALU(
        .a_in(SrcAE),
        .b_in(SrcBE),
        .ALUControl(ALUControlE),
        .result(ALUResultE),
        .aZ(Z_flagE),
        .aN(N_flagE),
        .aC(C_flagE),
        .aV(V_flagE)
    );


    // Result Mux
    mux3 u_result_mux3(
        .in0(ALUResultW),
        .in1(BE_RDW),
        .in2(PCPlus4W),
        .sel(ResultSrcW),
        .out(ResultW)
    );

    branch_logic u_branch_logic(
        .funct3(InstrE[14:12]),
        .Branch(BranchE),
        .jalE(JalE),
        .jalrE(JalrE),
        .N_flag(N_flagE),
        .Z_flag(Z_flagE),
        .C_flag(C_flagE),
        .V_flag(V_flagE),
        .PCSrc(PCSrc)
    );

    BE_logic u_BE_logic(
        .clk(clk),
        .n_rst(n_rst),
        .AddrLast2(ALUResultM[1:0]),
        .funct3(InstrM[14:12]),
        .WD(WriteDataM),
        .RD(ReadDataW),
        .BE_WD(BE_WD),
        .BE_RD(BE_RDW),
        .BE(ByteEnable)
    );

endmodule
