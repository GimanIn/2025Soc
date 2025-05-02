module aludec(
    input [6:0] opcode,
    input [2:0] funct3,
    input [1:0] ALUop,
    input [6:0] funct7,
    output reg [4:0] ALUControl  // Adjusted to 5 bits to match ALU module
);

    always @(*) begin  // ALU decoder logic
        case (ALUop)
            2'b00: ALUControl = 5'b00000;  // lw, sw (use ADD)
            2'b01: ALUControl = 5'b00001;  // beq (use SUB)
            2'b10: begin  // R-type operations
                case (funct3)
                    3'b000:  // add, sub 구분
                        if (funct7 == 1'b0)
                            ALUControl = 5'b00000;  // add
                        else
                            ALUControl = 5'b00001;  // sub
                    3'b010: 
                        ALUControl = 5'b00101;  // slt
                    3'b011:
                        ALUControl = 5'b10100;
                    3'b110: 
                        ALUControl = 5'b00011;  // or
                    3'b111: 
                        ALUControl = 5'b00010;  // and
                    3'b100: 
                        ALUControl = 5'b00100;  // xor
                    3'b001: 
                        ALUControl = 5'b00110;  // sll
                    3'b101:  // srl, sra 구분
                        if (funct7 == 1'b0)
                            ALUControl = 5'b0111;  // srl
                        else
                            ALUControl = 5'b00101;  // sra
                    default: 
                        ALUControl = 5'h0;  // 알 수 없는 명령어
                endcase
            end
            2'b11: begin  // I-type operations
                case (funct3)
                    3'b000: 
                        if (opcode == 7'b1100111) // JALR
                            ALUControl = 5'b10011; // JALR (새로운 제어 신호)
                        else
                            ALUControl = 5'b01100; // ADDI
                    3'b010: ALUControl = 5'b01101;  // SLTI
                    3'b011: ALUControl = 5'b01110;  // SLTIU
                    3'b100: ALUControl = 5'b01111;  // XORI
                    3'b110: ALUControl = 5'b10001;  // ORI
                    3'b111: ALUControl = 5'b10010;  // ANDI
                    3'b001: ALUControl = 5'b01001;  // SLLI
                    3'b101:  // SRLI/SRAI
                        if (funct7 == 1'b0)
                            ALUControl = 5'b10000;  // SRLI
                        else
                            ALUControl = 5'b01010;  // SRAI
                    default: ALUControl = 5'b00000;  // Invalid instruction
                endcase
            end
            default: ALUControl = 5'b00000;  // Invalid ALUop
        endcase
    end
endmodule


/*module aludec(
    input [6:0] opcode,
    input [2:0] funct3,
    input [1:0] ALUop,
    input funct7,
    output reg [4:0] ALUControl  // Adjusted to 5 bits to match ALU module
);

    always @(*) begin  // ALU decoder logic
        case (ALUop)
            2'b00: ALUControl = 5'b00000;  // lw, sw (use ADD)
            2'b01: ALUControl = 5'b00001;  // beq (use SUB)
            2'b10: begin  // R-type operations
               case (funct3)
                3'b000:  // add, sub 구분
                    if (funct7 == 1'b0)
                        ALUControl = 5'b00000;  // add
                    else
                        ALUControl = 5'b00001;  // sub
                3'b010: 
                    ALUControl = 5'b00101;  // slt
                3'b110: 
                    ALUControl = 5'b00011;  // or
                3'b111: 
                    ALUControl = 5'b00010;  // and
                3'b100: 
                    ALUControl = 5'b00100;  // xor
                3'b001: 
                    ALUControl = 5'b00110;  // sll
                3'b101:  // srl, sra 구분
                    if (funct7 == 1'b0)
                        ALUControl = 5'b0111;  // srl
                    else
                        ALUControl = 5'b1000;  // sra
                default: 
                    ALUControl = 5'hx;  // 알 수 없는 명령어
            endcase
            end
            2'b11: begin  // I-type operations
                case (funct3)
                    3'b000: ALUControl = 5'b01100;  // ADDI
                    3'b010: ALUControl = 5'b01101;  // SLTI
                    3'b011: ALUControl = 5'b01110;  // SLTIU
                    3'b100: ALUControl = 5'b01111;  // XORI
                    3'b110: ALUControl = 5'b10001;  // ORI
                    3'b111: ALUControl = 5'b10010;  // ANDI
                    3'b001: ALUControl = 5'b01001;  // SLLI
                    3'b101:  // SRLI/SRAI
                        if (funct7 == 1'b0)
                            ALUControl = 5'b10000;  // SRLI
                        else
                            ALUControl = 5'b01010;  // SRAI
                    default: ALUControl = 5'bxxxxx;  // Invalid instruction
                endcase
            end
            default: ALUControl = 5'bxxxxx;  // Invalid ALUop
        endcase
    end
endmodule*/

