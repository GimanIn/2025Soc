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
                    3'b000: begin
                        if (funct7 == 7'b0000000)
                            ALUControl = 5'b00000;  // add
                        else if (funct7 == 7'b0100000)
                            ALUControl = 5'b00001;  // sub
                        else
                            ALUControl = 5'bxxxxx;  // 잘못된 값
                        end

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
                        if (funct7 == 7'b0000000)
                            ALUControl = 5'b0111;  // srl
                        else
                            ALUControl = 5'b1000;  // sra
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

/*module aludec(
    opcode,
    funct3,
    funct7,
    ALUop,
    ALUControl
);
    // input
    input [6:0] opcode;
    input [2:0] funct3;
    input [1:0] ALUop;
    input funct7;
    // output
    output reg [4:0] ALUControl;

    always@(*)begin // ALU decoder
        if(ALUop == 2'b00)
            ALUControl = 5'b0_0000; // lw, sw

        else if(ALUop == 2'b01)
            ALUControl = 5'b1_0000; // beq, bne
            
        else if(ALUop == 2'b10) begin
            if (funct3 == 3'b000 && ({opcode[5], funct7} == 2'b00 || {opcode[5], funct7} == 2'b01 || {opcode[5], funct7} == 2'b10 || opcode == 7'b1100111))  // add
                ALUControl = 5'b0_0000;

            else if (funct3 == 3'b000 && {opcode[5], funct7} == 2'b11) // sub
                ALUControl = 5'b1_0000;

            else if (funct3 == 3'b001) // sll
                ALUControl = 5'b0_0100;

            else if (funct3 == 3'b010)	// slt
                ALUControl = 5'b1_0111;

            else if (funct3 == 3'b011)	// sltu
                ALUControl = 5'b1_1000;

            else if (funct3 == 3'b101 && ({opcode[5], funct7} == 2'b10 | {opcode[5], funct7} == 2'b00))	// srl or srli
                ALUControl = 5'b0_0101;

            else if (funct3 == 3'b101 && ({opcode[5], funct7} == 2'b11 | {opcode[5], funct7} == 2'b01))	// sra or srai
                ALUControl = 5'b0_0110;

            else if (funct3 == 3'b110) // or
                ALUControl = 5'b0_0010;

            else if (funct3 == 3'b100) // xor
                ALUControl = 5'b0_0011;

            else if (funct3 == 3'b111) // and
                ALUControl = 5'b0_0001;
            else 
                ALUControl = 5'h0;
        end
    end
        

endmodule*/


