module branch_logic(
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

endmodule
/*module branch_logic(
    input Z_flag,               // ALU의 Zero flag
    input N_flag,               // ALU의 Negative flag (음수 여부)
    input C_flag,               // ALU의 Carry flag (unsigned 비교에 사용)
    input [6:0] opcode,          // 명령어 opcode
    input [2:0] funct3,          // 브랜치 명령어의 funct3 필드
    input Branch,    
    input sltu_result,            // Control Unit에서 온 Branch 신호
    output reg Btaken            // 분기 발생 여부
);

    always @(*) begin
        // 기본값 설정 (분기 발생하지 않음)
        Btaken = 1'b0;

        // Branch 명령어인지 확인 (opcode가 브랜치 명령어일 때만 실행)
        if (Branch) begin
            case (funct3)
                3'b000: Btaken = Z_flag;       // BEQ (Equal일 때 분기)
                3'b001: Btaken = ~Z_flag;      // BNE (Not Equal일 때 분기)
                3'b100: Btaken = N_flag;       // BLT (Less Than, 부호 있는 비교)
                3'b101: Btaken = ~N_flag;      // BGE (Greater or Equal, 부호 있는 비교)
                3'b110: Btaken = (sltu_result==1'b1);      // BLTU (Less Than, unsigned 비교)
                3'b111: Btaken = (sltu_result==1'b0);      // BGEU (Greater or Equal, unsigned 비교)
                default: Btaken = 1'b0;        // 기본값: 분기하지 않음
            endcase
        end
    end

endmodule*/
