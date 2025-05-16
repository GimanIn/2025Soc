
module datapath(
    clk,
    n_rst,
    Instr,         // from imem
    ReadDataM,     // from dmem
    //PCSrc,         // from controller (branch_logic 결과)
    ResultSrcD,
    ALUControlD,
    ALUSrcAD,      // srcA
    ALUSrcBD,      // srcB
    ImmSrcD,
    RegWriteD,
    PCF,           // for imem
    ALUResultM,    // for dmem
    //BE_WD,
    WriteData_d,
    
    Z_flagE,       // for controller
    BranchD,
    JalD,
    JalrD,
    Btaken,
    //opcode,
    ByteEnable,
    MemWriteD,     // from controller
    MemWriteM,     // to datamem
    InstrD,         // output
    Csr
);
    //parameter RESET_PC = 32'h1000_0000;
    parameter RESET_PC = 32'h1000_0000;

    // -----------------------------------
    // 1) Port 선언 (원본 그대로)
    // -----------------------------------
    input            clk, n_rst;
    input            ALUSrcBD, RegWriteD;
    //input [6:0] opcode;
    input  [31:0]    Instr, ReadDataM;
    input  [1:0]     ResultSrcD,  ALUSrcAD;
    input  [4:0]     ALUControlD;
    input            BranchD, JalD, JalrD;
    input  [2:0]     ImmSrcD;
    input            MemWriteD;
    input Csr;

    output [31:0]    PCF, ALUResultM, WriteData_d;//BE_WD
    output           Z_flagE, Btaken;
    output [3:0]     ByteEnable;
    output           MemWriteM;
    output [31:0]    InstrD;

    // -----------------------------------
    // 2) Internal Wires
    // -----------------------------------
    wire [31:0] BE_RDW; // BE_logic output

    // [ADD] 해저드 유닛용 신호
    wire [1:0] ForwardAD, ForwardBD,PCSrc;
    wire [1:0] ForwardAE, ForwardBE;
    wire       lwStall;
    wire       FlushD, FlushE;

    // IF
    wire [31:0] PC_nextF, PCPlus4D,PCPlus4E,PCPlus4F,PCPlus4M;

    // ID
    wire [31:0] PCD;
    wire [31:0] ImmExtD, RD1D, RD2D,BE_RD,BE_WD;
    
    // [ADD] Decode 포워딩 후
    wire [31:0] RD1D_w, RD2D_w;

    // ID/EX
    wire        RegWriteE;
    wire [1:0]  ResultSrcE;
    wire        MemWriteE, BranchE;
    wire [4:0]  ALUControlE;
    wire [1:0]  ALUSrcAE;
    wire        ALUSrcBE;
    wire [31:0] RD1E, RD2E, PCE;
    wire [4:0]  Rs1E, Rs2E, RdE;
    wire [31:0] ImmExtE, InstrE;
    // [ADD] EX 포워딩 후
    wire [31:0] RD1E_w, RD2E_w,RD1E_w2, RD2E_w2;

    // EX
    wire [31:0] PC_targetE, ALUResultE, SrcAE, SrcBE;
    wire        N_flagE, C_flagE, V_flagE;
    // [MOD] store 데이터에 포워딩된 RD2E_w 사용
    wire [31:0] WriteDataE;

    // MEM
    wire        RegWriteM;
    wire [1:0]  ResultSrcM;
    wire [31:0] WriteDataM;
    wire [4:0]  RdM;
    wire [31:0] InstrM;

    // WB
    wire        RegWriteW;
    wire [1:0]  ResultSrcW;
    wire [31:0] ALUResultW, ReadDataW, PCPlus4W;
    wire [4:0]  RdW;
    wire [31:0] ResultW;
    
    assign StallD = lwStall;
    assign StallF = lwStall;
    wire Csr = (InstrE[6:0] == 7'b111_0011) ? 1'b1 : 1'b0;
    reg [31:0] tohost_csr;

    always @(posedge clk)
    begin
        if (Csr==1'b1)
        begin
            case(InstrE[14:12])
            3'b001:tohost_csr=RD1E_w2;
            3'b101:tohost_csr=ImmExtE;
            default :tohost_csr=32'h0;
            endcase
        end
        else
        tohost_csr=32'h0;
    end


    // -----------------------------------
    // 3) 파이프라인 & 연산 유닛
    // -----------------------------------
    IF_ID u_IF_ID(
    .clk       (clk),
    .n_rst     (n_rst),
    
    .PCF       (PCF),
    .RDF       (Instr),
    .PCPlus4F  (PCPlus4F),
    .StallD    (StallD),  // load‑use hazard 시 stall
    .FlushD    (FlushD),   // branch taken 시 flush
    
    .InstrD    (InstrD),
    .PCD       (PCD),
    .PCPlus4D  (PCPlus4D)
    );
    
        /*reg [31:0] WriteData_d;

        always @(posedge clk or negedge n_rst) begin
        if (!n_rst)
        WriteData_d <= 32'b0;
        else
        WriteData_d <= BE_WD;  // BE_WD는 BE 로직에서 나온 원래 데이터
        end*/
        assign WriteData_d = BE_WD;  // 즉시 계산된 비딜레이 데이터




    
ID_EX u_ID_EX(
    .clk         (clk),
    .n_rst       (n_rst),
    .StallE      (lwStall),       // [ADD] stall 신호
    .FlushE      (FlushE),        // flush 신호
    .PCPlus4D    (PCPlus4D),
    .RD1D_w      (RD1D_w),
    .RD2D_w      (RD2D_w),
    .ImmExtD     (ImmExtD),
    .PCD         (PCD),
    .InstrD      (InstrD),
    .RdD         (InstrD[11:7]),
    .Rs1D        (InstrD[19:15]),
    .Rs2D        (InstrD[24:20]),
    .ALUControlD (ALUControlD),
    .ALUSrcAD    (ALUSrcAD),
    .ALUSrcBD    (ALUSrcBD),
    .MemWriteD   (MemWriteD),
    .RegWriteD   (RegWriteD),
    .ResultSrcD  (ResultSrcD),
    .BranchD     (BranchD),
    .JalD        (JalD),
    .JalrD       (JalrD),
    .PCPlus4E    (PCPlus4E),
    .RD1E_w      (RD1E_w),
    .RD2E_w      (RD2E_w),
    .ImmExtE     (ImmExtE),
    .PCE         (PCE),
    .InstrE      (InstrE),
    .RdE         (RdE),
    .Rs1E        (Rs1E),
    .Rs2E        (Rs2E),
    .ALUControlE (ALUControlE),
    .ALUSrcAE    (ALUSrcAE),
    .ALUSrcBE    (ALUSrcBE),
    .MemWriteE   (MemWriteE),
    .RegWriteE   (RegWriteE),
    .ResultSrcE  (ResultSrcE),
    .BranchE     (BranchE),
    .JalE        (JalE),
    .JalrE       (JalrE)
);



    EX_MEM u_EX_MEM(
        .clk         (clk),
        .n_rst       (n_rst),
        .RegWriteE   (RegWriteE),
        .ResultSrcE  (ResultSrcE),
        .MemWriteE   (MemWriteE),
        .ALUResultE  (ALUResultE),
        .WriteDataE  (RD2E_w2),//WriteDataE
        .RdE         (RdE),
        .PCPlus4E    (PCPlus4E),
        .InstrE      (InstrE),
        .RegWriteM   (RegWriteM),
        .ResultSrcM  (ResultSrcM),
        .MemWriteM   (MemWriteM),
        .ALUResultM  (ALUResultM),
        .WriteDataM  (WriteDataM),
        .RdM         (RdM),
        .PCPlus4M    (PCPlus4M),
        .InstrM      (InstrM)
    );

    MEM_WB u_MEM_WB(
        .clk         (clk),
        .n_rst       (n_rst),
        .RegWriteM   (RegWriteM),
        .ResultSrcM  (ResultSrcM),
        .ALUResultM  (ALUResultM),
        .ReadDataM   (ReadDataM),
        .RdM         (RdM),
        .PCPlus4M    (PCPlus4M),
        .RegWriteW   (RegWriteW),
        .ResultSrcW  (ResultSrcW),
        .ALUResultW  (ALUResultW),
        .ReadDataW   (ReadDataW),
        .RdW         (RdW),
        .PCPlus4W    (PCPlus4W)
    );

    // PC 업데이트
    mux3 u_pc_mux3(
        .in0(PCPlus4F),
        .in1(PC_targetE),
        .in2(ALUResultE),
        .sel(PCSrc),
        .out(PC_nextF)
    );
    // [MOD] 원본대로 lwStall을 enable 로 사용
    flopenr #(.RESET_VALUE (RESET_PC)
    ) u_pc_register(
        .clk(clk),
        .n_rst(n_rst),
        .en(lwStall),//~lwStall
        .d(PC_nextF),
        .q(PCF)
    );


    adder u_pc_plus4(
        .a(PCF), .b(32'h4), .ci(1'b0),
        .sum(PCPlus4F),
        .N(), .Z(), .C(), .V()
    );

    // Immediate 확장
    extend u_extend(
        .ImmSrc(ImmSrcD),
        .in(InstrD[31:0]),
        .out(ImmExtD)
    );
    // Branch target 계산
    adder u_pc_target(
        .a(PCE), .b(ImmExtE), .ci(1'b0),
        .sum(PC_targetE),
        .N(), .Z(), .C(), .V()
    );

    // Register File
    reg_file_async rf (
        .clk    (clk),
        .clkb   (clk),
        .we     (RegWriteW),
        .ra1    (InstrD[19:15]),
        .ra2    (InstrD[24:20]),
        .wa     (RdW),
        .wd     (ResultW),
        .rd1    (RD1D),
        .rd2    (RD2D)
    );



    // -----------------------------------
    // 4) Hazard Unit 인스턴스
    // -----------------------------------
    hazard_unit u_hazard_unit(
        // data hazard
        .Rs1E       (Rs1E),
        .Rs2E       (Rs2E),
        .RdM        (RdM),
        .RdW        (RdW),
        .RegWriteM  (RegWriteM),
        .RegWriteW  (RegWriteW),
        // lw dependency
        .Rs1D       (InstrD[19:15]),//Rs1D
        .Rs2D       (InstrD[24:20]),//Rs2D
        .RdE        (RdE),//RdE
        .ResultSrcE (ResultSrcE[0]),
        // control hazard
        .PCSrcE     (PCSrc),
        // outputs
        .ForwardAD  (ForwardAD),
        .ForwardBD  (ForwardBD),
        .ForwardAE  (ForwardAE),
        .ForwardBE  (ForwardBE),
        .lwStall    (lwStall),
        .FlushD     (FlushD),
        .FlushE     (FlushE)
    );

    // -----------------------------------
    // 5) Decode-stage Forwarding
    // -----------------------------------
    mux3 u_hazard_RD1D(
        .in0(RD1D),
        .in1(ResultW),
        .in2(ALUResultM),
        .sel(ForwardAD),
        //.sel(2'b00),
        .out(RD1D_w)
    );
    mux3 u_hazard_RD2D(
        .in0(RD2D),
        .in1(ResultW),
        .in2(ALUResultM),
        .sel(ForwardBD),
        //.sel(2'b00),
        .out(RD2D_w)
    );

    // -----------------------------------
    // 6) Execute-stage Forwarding
    // -----------------------------------
    mux3 u_hazard_RD1E(
        .in0(RD1E_w),
        .in1(ResultW),
        .in2(ALUResultM),
        .sel(ForwardAE),
        //.sel(2'b00),
        .out(RD1E_w2)
    );
    mux3 u_hazard_RD2E(
        .in0(RD2E_w),
        .in1(ResultW),
        .in2(ALUResultM),
        .sel(ForwardBE),
        //.sel(2'b00),
        .out(RD2E_w2)
    );

    // ALU 입력 mux
    mux3 u_aluA_mux3(
        .in0(RD1E_w2),
        .in1(PCE),
        .in2(32'd0),
        .sel(ALUSrcAE),
        .out(SrcAE)
    );
    mux2 u_aluB_mux2(
        .in0(RD2E_w2),
        .in1(ImmExtE),
        .sel(ALUSrcBE),
        .out(SrcBE)
    );

    // ALU
    alu u_ALU(
        .a_in       (SrcAE),
        .b_in       (SrcBE),
        .ALUControl (ALUControlE),
        .result     (ALUResultE),
        .aZ         (Z_flagE),
        .aN         (N_flagE),
        .aC         (C_flagE),
        .aV         (V_flagE)
    );

    // Writeback Mux
    mux3 u_result_mux3(
        .in0(ALUResultW),
        .in1(BE_RD),
        .in2(PCPlus4W),
        .sel(ResultSrcW),
        .out(ResultW)
    );

    // Branch Logic
    branch_logic u_branch_logic(
        .funct3 (InstrE[14:12]),
        .Branch (BranchE),
        .jalE   (JalE),
        .jalrE  (JalrE),
        .N_flag (N_flagE),
        .Z_flag (Z_flagE),
        .C_flag (C_flagE),
        .V_flag (V_flagE),
        .PCSrc  (PCSrc)
    );
    assign Btaken = (PCSrc != 2'b00);

    // Byte Enable Logic
    BE_logic u_BE_logic(
        .clk        (clk),
        .n_rst      (n_rst),
        //.opcode(opcode),
        .AddrLast2  (ALUResultM[1:0]),
        .funct3     (InstrM[14:12]),
        .WD         (WriteDataM),
        .RD         (ReadDataW),
        .BE_WD      (BE_WD),
        .BE_RD      (BE_RD),
        .BE         (ByteEnable)
    );
    

endmodule

