module branch_logic(
    input Z_flag,               // ALU의 Zero flag
    input N_flag,               // ALU의 Negative flag
    input C_flag,               // ALU의 Carry flag
    input V_flag,               // ALU의 Overflow flag
    input [2:0] funct3,         // Branch 명령어의 funct3 필드
    input Branch,              // 브랜치 명령어 신호
    input jalE,                 // JAL 명령어 신호
    input jalrE,                // JALR 명령어 신호
    output reg [1:0] PCSrc      // PC Source 제어 신호
);

    always @(*) begin
        // 기본값: PC + 4 (기본 동작)
        PCSrc = 2'b00;

        if (jalE) begin
            // JAL 명령어: 항상 분기
            PCSrc = 2'b10;
        end else if (jalrE) begin
            // JALR 명령어: 레지스터를 기준으로 분기
            PCSrc = 2'b11;
        end else if (Branch) begin
            // Branch 명령어 동작
            case (funct3)
                3'b000: PCSrc = (Z_flag) ? 2'b01 : 2'b00; // BEQ
                3'b001: PCSrc = (~Z_flag) ? 2'b01 : 2'b00; // BNE
                3'b100: PCSrc = (N_flag) ? 2'b01 : 2'b00;  // BLT
                3'b101: PCSrc = (~N_flag) ? 2'b01 : 2'b00; // BGE
                3'b110: PCSrc = (~C_flag) ? 2'b01 : 2'b00; // BLTU
                3'b111: PCSrc = (C_flag) ? 2'b01 : 2'b00;  // BGEU
                default: PCSrc = 2'b00;                   // 기본값: PC + 4
            endcase
        end
    end

endmodule
