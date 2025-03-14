module datapath(
    clk,
    n_rst,
    Instr,         // from imem
    ReadData,      // from dmem
    PCSrc,         // from controller
    Branch, 
    ResultSrc,
    ALUControl,
    ALUSrcA,
    ALUSrcB,
    ImmSrc,
    RegWrite,
    PC,            // for imem  
    ALUResult,     // for dmem
    BE_WD,      
    Z_flag, 
    C_flag,
    N_flag,
    V_flag,       // for controller
    Btaken,
    ByteEnable,
    Csr
);

    parameter RESET_PC = 32'h1000_0000;

    // Inputs
    input clk, n_rst, Branch, RegWrite;
    input [31:0] Instr, ReadData;
    input [1:0] PCSrc, ResultSrc, ALUSrcA;
    input ALUSrcB;
    input [2:0] ImmSrc;
    input [4:0] ALUControl;
    input Csr;

    // Outputs
    output [31:0] PC, ALUResult;
    output [31:0] BE_WD;
    output Z_flag, C_flag, N_flag, V_flag, Btaken;
    output [3:0] ByteEnable;

    // Internal wires
    wire [31:0] PC_next, PC_target, PC_plus4;
    wire [31:0] ImmExt, SrcA, bef_SrcB;
    wire [31:0] SrcB, Result;
    wire [31:0] BE_RD;
    wire sltu_result;

    wire [6:0] opcode = Instr[6:0];
    wire [2:0] funct3 = Instr[14:12];
    reg [31:0] tohost_csr;

    always @(*)
    begin
        if (Csr==1'b1)
        begin
            case(Instr[14:12])
            3'b001:tohost_csr=SrcA;
            3'b101:tohost_csr=ImmExt;
            default :tohost_csr=32'h0;
            endcase
        end
        else
        tohost_csr=32'h0;
    end

    // PC Source Mux
    mux3 u_pc_mux1(
        .in0(PC_plus4),
        .in1(PC_target),
        .in2(ALUResult),
        .sel(PCSrc),
        .out(PC_next)
    );

    // PC Register
    flopr #(
        .RESET_VALUE(RESET_PC)
    ) u_pc_register(
        .clk(clk),
        .n_rst(n_rst),
        .d(PC_next),
        .q(PC)
    );

    // Adder for PC+4
    adder u_pc_plus4(
        .a(PC), 
        .b(32'h4), 
        .ci(1'b0), 
        .sum(PC_plus4),
        .N(), .Z(), .C(), .V()
    );

    // Immediate Extension Unit
    extend u_Extend(
        .ImmSrc(ImmSrc),
        .in(Instr[31:7]),
        .opcode(opcode),
        .out(ImmExt)
    );

    // Adder for Branch Target Address
    adder u_pc_target(
        .a(PC), 
        .b(ImmExt), 
        .ci(1'b0), 
        .sum(PC_target),
        .N(), .Z(), .C(), .V()
    );

    // Register File
    reg_file_async rf (
        .clk(clk),
        .clkb(clk),
        .we(RegWrite),
        .ra1(Instr[19:15]),
        .ra2(Instr[24:20]),
        .wa(Instr[11:7]),
        .wd(Result),
        .rd1(SrcA),
        .rd2(bef_SrcB)
    );

    // ALU Source A Mux
    wire [31:0] ALU_SrcA;
    mux3 u_alu_srcA_mux(
        .in0(SrcA),       // for AUIPC
        .in1(PC),     // Register value
        .in2(32'b0),    // Zero for LUI
        .sel(ALUSrcA),
        .out(ALU_SrcA)
    );

    // ALU Source B Mux
    wire [31:0] ALU_SrcB;
    mux2 u_alu_srcB_mux(
        .in0(bef_SrcB), // Register value
        .in1(ImmExt),   // Immediate
        .sel(ALUSrcB),
        .out(ALU_SrcB)
    );

    // ALU
    alu u_ALU(
        .a_in(ALU_SrcA),
        .b_in(ALU_SrcB),
        .ALUControl(ALUControl),
        .result(ALUResult),
        .sltu_result(sltu_result),
        .aZ(Z_flag),
        .aV(V_flag),
        .aC(C_flag),
        .aN(N_flag)
    );

    // Result Mux (ALU result, Memory data, PC+4)
    mux3 u_result_mux3(
        .in0(ALUResult),
        .in1(BE_RD),    // Data from memory
        .in2(PC_plus4), // PC + 4
        .sel(ResultSrc),
        .out(Result)
    );

    // Branch Logic
    branch_logic u_blogic(
        .opcode(opcode),
        .funct3(funct3),
        .Z_flag(Z_flag),
        .C_flag(C_flag),
        .N_flag(N_flag),
        .Branch(Branch),
        .Btaken(Btaken),
        .sltu_result(sltu_result)
    );

    // BE Logic for Byte Enable operations
    BE_logic u_BE_logic(
        .AddrLast2(ALUResult[1:0]),  // 하위 2비트 주소
        .funct3(funct3),
        .WD(bef_SrcB),
        .RD(ReadData),
        .BE_WD(BE_WD),
        .BE_RD(BE_RD),
        .BE(ByteEnable)  // Byte Enable 신호 출력
    );

endmodule

