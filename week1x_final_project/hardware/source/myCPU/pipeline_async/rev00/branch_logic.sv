/*module branch_logic(
    input Z_flag,               // ALU의 Zero flag
    input N_flag,               // ALU의 Negative flag
    input C_flag,               // ALU의 Carry flag
    input V_flag,               // ALU의 Overflow flag
    input [2:0] funct3,         // Branch 명령어의 funct3 필드
    input Branch,              // 브랜치 명령어 신호
    input jalE,                 // JAL 명령어 신호
    input jalrE,                // JALR 명령어 신호
    input sltu_result,
    output reg [1:0] PCSrc      // PC Source 제어 신호
);

    always @(*) begin
        // 기본값: PC + 4 (기본 동작)
        PCSrc = 2'b00;

        if (jalE) begin
            // JAL 명령어: 항상 분기
            PCSrc = 2'b01;
        end else if (jalrE) begin
            // JALR 명령어: 레지스터를 기준으로 분기
            PCSrc = 2'b10;
        end else if (Branch) begin
            // Branch 명령어 동작
            case (funct3)
                3'b000: PCSrc = (Z_flag) ? 2'b01 : 2'b00; // BEQ
                3'b001: PCSrc = (~Z_flag) ? 2'b01 : 2'b00; // BNE
                3'b100: PCSrc = (N_flag) ? 2'b01 : 2'b00;  // BLT
                3'b101: PCSrc = (~N_flag) ? 2'b01 : 2'b00; // BGE
                3'b110: PCSrc = (sltu_result==1'b1) ? 2'b01 : 2'b00; // BLTU
                3'b111: PCSrc = (sltu_result==1'b0) ? 2'b01 : 2'b00;  // BGEU
                default: PCSrc = 2'b00;                   // 기본값: PC + 4
            endcase
            

        end
        else begin
                PCSrc = 2'b00;
            end
    end

endmodule*/
module branch_logic(
    // input
    Branch,
    jalE,
    jalrE,
    N_flag,
    Z_flag,
    C_flag,
    V_flag,
    funct3,

    // output
    PCSrc 
);

input Branch;
input jalE;
input jalrE;
input N_flag, Z_flag, C_flag, V_flag;
input [2:0] funct3;
output [1:0] PCSrc;

 wire beq, bne, blt, bltu, bge, bgeu;

    //TA edit section
    localparam OPC_BRANCH = 7'd99;
    localparam OPC_JAL    = 7'd111;

    localparam F3_BEQ = 3'b000;
    localparam F3_BNE = 3'b001;
    localparam F3_BLT = 3'b100;
    localparam F3_BGE = 3'b101;
    localparam F3_BLTU = 3'b110;
    localparam F3_BGEU = 3'b111;
    
    reg branch_type;
    reg [1:0] pcsrc;
    wire branch_taken;

    wire jalrE;
    
    //branch condition assignment
    assign beq = (Z_flag == 1);
    assign bne = (Z_flag == 0);
    assign blt = (N_flag != V_flag);
    assign bge = (N_flag == V_flag);
    assign bltu = (C_flag == 0);
    assign bgeu = (C_flag == 1);

    assign branch_taken = (Branch) && (branch_type);

    //branch control logic
    always @(*)begin
        case(funct3)
            F3_BEQ: branch_type = beq;
            F3_BNE: branch_type = bne;
            F3_BLT: branch_type = blt;
            F3_BGE: branch_type = bge;
            F3_BLTU: branch_type = bltu;
            F3_BGEU: branch_type = bgeu;
            default: branch_type = 1'b0;
        endcase
    end

    //PCSrc assignment
    assign PCSrc = pcsrc;

    //PCSrc control
    always @(*)begin
        if(branch_taken || jalE)
            pcsrc = 2'b01;

        else if(jalrE)
            pcsrc = 2'b10;

        else
            pcsrc = 2'b00;
    end

endmodule


