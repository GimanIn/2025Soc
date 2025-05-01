/*module alu(
    a_in,
    b_in,
    ALUControl,
    result,
    aZ,
    aC,
    aN,
    aV
);
    input [31:0] a_in, b_in;
    input [4:0] ALUControl;
    output reg [31:0] result; 
    output reg aZ, aN, aC, aV;

    wire N, Z, C, V;
    wire [31:0] add_sub_b;
    wire [31:0] adder_result, and_result, or_result, xor_result;
    wire [31:0] sll_result, srl_result, sra_result;
    wire [31:0] slli_result, srai_result, SLT_result;
    wire [31:0] addi_result, slti_result, sltiu_result;
    wire [31:0] xori_result, srli_result, ori_result, andi_result;
    wire [31:0] jalr_result;

    // Handle addition/subtraction inputs
    assign add_sub_b = (ALUControl == 5'b00001 || ALUControl == 5'b00101) ? ~b_in + 32'h1 : b_in;

    // Adder instance
    adder u_add_32bit_add(
        .a(a_in),
        .b(add_sub_b),
        .ci(1'b0),
        .sum(adder_result),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V)
    );    

    // Flag assignments for all operations
    // Flag assignments for all operations
always @(*) begin
    case (ALUControl)
        // ADD
        5'b00000: begin
            {aN, aZ, aC, aV} = {N, Z, C, V};  // Na, Za, Ca, Va are computed in adder
        end

        // SUB
        5'b00001: begin
            {aN, aZ, aC, aV} = {N, Z, C, V};  // Subtraction uses the same adder
        end

        // AND
        5'b00010: begin
            aN = and_result[31]; 
            aZ = (and_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;  // No carry for AND
            aV = 1'b0;  // No overflow for AND
        end

        // OR
        5'b00011: begin
            aN = or_result[31]; 
            aZ = (or_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;  // No carry for OR
            aV = 1'b0;  // No overflow for OR
        end

        // XOR
        5'b00100: begin
            aN = xor_result[31]; 
            aZ = (xor_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;  // No carry for XOR
            aV = 1'b0;  // No overflow for XOR
        end

        // SLL
        5'b00110: begin
            aN = sll_result[31];
            aZ = (sll_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;  // No carry for SLL
            aV = 1'b0;  // No overflow for SLL
        end

        // SRL
        5'b00111: begin
            aN = srl_result[31];
            aZ = (srl_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;  // No carry for SRL
            aV = 1'b0;  // No overflow for SRL
        end

        // SRA
        5'b01000: begin
            aN = sra_result[31];
            aZ = (sra_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;  // No carry for SRA
            aV = 1'b0;  // No overflow for SRA
        end

        // SLLI
        5'b01001: begin
            aN = slli_result[31];
            aZ = (slli_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;  // No carry for SLLI
            aV = 1'b0;  // No overflow for SLLI
        end

        // SRAI
        5'b01010: begin
            aN = srai_result[31];
            aZ = (srai_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;  // No carry for SRAI
            aV = 1'b0;  // No overflow for SRAI
        end

        // SLT
        5'b00101: begin
            {aN, aZ, aC, aV} = {N, Z, C, V};  // Same as ADD/SUB
        end

        // ADDI
        5'b01100: begin
            {aN, aZ, aC, aV} = {N, Z, C, V};  // Uses adder
        end

        // SLTI
        5'b01101: begin
            {aN, aZ, aC, aV} = {N, Z, C, V};  // Same as SLT
        end

        // SLTIU
        5'b01110: begin
            {aN, aZ, aC, aV} = {N, Z, C, V};  // Same logic as SLT for unsigned
        end

        // XORI
        5'b01111: begin
            aN = xori_result[31];
            aZ = (xori_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;
            aV = 1'b0;
        end

        // SRLI
        5'b10000: begin
            aN = srli_result[31];
            aZ = (srli_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;
            aV = 1'b0;
        end

        // ORI
        5'b10001: begin
            aN = ori_result[31];
            aZ = (ori_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;
            aV = 1'b0;
        end

        // ANDI
        5'b10010: begin
            aN = andi_result[31];
            aZ = (andi_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;
            aV = 1'b0;
        end
        5'b10011: begin
                result = jalr_result;
                aN = jalr_result[31];
                aZ = (jalr_result == 32'h0) ? 1'b1 : 1'b0;
                aC = 1'b0;
                aV = 1'b0;
            end

        // Default case for invalid ALUControl values
        default: begin
            {aN, aZ, aC, aV} = 4'h0;  // Clear flags
        end
    endcase
end


    // Define operations
    assign and_result = a_in & b_in;
    assign or_result = a_in | b_in;
    assign xor_result = a_in ^ b_in;
    assign sll_result = a_in << b_in[4:0];  
    assign srl_result = a_in >> b_in[4:0]; 
    assign sra_result = $signed(a_in) >>> b_in[4:0];  // Arithmetic right shift

    // Immediate shift operations
    assign slli_result = a_in << b_in[4:0];
    assign srli_result = a_in >> b_in[4:0];
    assign srai_result = $signed(a_in) >>> b_in[4:0];

    // SLT, SLTI, SLTIU
    assign SLT_result = aN ^ aV;
    assign slti_result = aN ^ aV;
    assign sltiu_result = aN ^ aV;

    // Immediate operations
    assign addi_result = a_in + b_in;  
    assign xori_result = a_in ^ b_in;  
    assign ori_result = a_in | b_in;   
    assign andi_result = a_in & b_in;  
    assign jalr_result = (a_in + b_in) & ~1;

    // ALUControl based result selection
    always @(*) begin
        case (ALUControl)
            5'b00000 : result = adder_result;       // ADD
            5'b00001 : result = adder_result;       // SUB
            5'b00010 : result = and_result;         // AND
            5'b00011 : result = or_result;          // OR
            5'b00100 : result = xor_result;         // XOR
            5'b00110 : result = sll_result;         // SLL
            5'b00111 : result = srl_result;         // SRL
            5'b01000 : result = sra_result;         // SRA
            5'b01001 : result = slli_result;        // SLLI
            5'b01010 : result = srai_result;        // SRAI
            5'b00101 : result = SLT_result;         // SLT
            5'b01100 : result = addi_result;        // ADDI
            5'b01101 : result = slti_result;        // SLTI
            5'b01110 : result = sltiu_result;       // SLTIU
            5'b01111 : result = xori_result;        // XORI
            5'b10000 : result = srli_result;        // SRLI
            5'b10001 : result = ori_result;         // ORI
            5'b10010 : result = andi_result;        // ANDI
            5'b10011 : result = jalr_result;        // JALR
            default  : result = 32'h0;              // Invalid ALUControl
        endcase
    end
endmodule*/
module alu(
    a_in,
    b_in,
    ALUControl,
    result,
    aZ,
    aC,
    aN,
    aV
);
    input [31:0] a_in, b_in;
    input [4:0] ALUControl;
    output reg [31:0] result; 
    output reg aZ, aN, aC, aV;

    wire N, Z, C, V;
    wire [31:0] add_sub_b;
    wire [31:0] adder_result, and_result, or_result, xor_result;
    wire [31:0] sll_result, srl_result, sra_result;
    wire [31:0] slli_result, srai_result, SLT_result;
    wire [31:0] addi_result, slti_result, sltiu_result;
    wire [31:0] xori_result, srli_result, ori_result, andi_result;
    wire [31:0] jalr_result;

    // Handle addition/subtraction inputs
    assign add_sub_b = (ALUControl == 5'b00001 || ALUControl == 5'b00101) ? ~b_in + 32'h1 : b_in;

    // Adder instance
    adder u_add_32bit_add(
        .a(a_in),
        .b(add_sub_b),
        .ci(1'b0),
        .sum(adder_result),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V)
    );    

    // Calculate JALR result
    //assign jalr_result = (a_in + b_in) & ~32'h1;

    // Flag assignments for all operations
    always @(*) begin
        case (ALUControl)
            // ADD
            5'b00000: {aN, aZ, aC, aV} = {N, Z, C, V};

            // SUB
            5'b00001: {aN, aZ, aC, aV} = {N, Z, C, V};

            // AND
            5'b00010: begin
                aN = and_result[31]; 
                aZ = (and_result == 32'h0) ? 1'b1 : 1'b0;
                aC = 1'b0;
                aV = 1'b0;
            end

            // OR
            5'b00011: begin
                aN = or_result[31]; 
                aZ = (or_result == 32'h0) ? 1'b1 : 1'b0;
                aC = 1'b0;
                aV = 1'b0;
            end

            // XOR
            5'b00100: begin
                aN = xor_result[31]; 
                aZ = (xor_result == 32'h0) ? 1'b1 : 1'b0;
                aC = 1'b0;
                aV = 1'b0;
            end

            // JALR
            5'b10011: begin
                result = jalr_result;
                aN = jalr_result[31];
                aZ = (jalr_result == 32'h0) ? 1'b1 : 1'b0;
                aC = 1'b0;
                aV = 1'b0;
            end

            default: {aN, aZ, aC, aV} = 4'h0;
        endcase
    end

    // Define operations
    assign and_result = a_in & b_in;
    assign or_result = a_in | b_in;
    assign xor_result = a_in ^ b_in;
    assign sll_result = a_in << b_in[4:0];  
    assign srl_result = a_in >> b_in[4:0]; 
    assign sra_result = $signed(a_in) >>> b_in[4:0];

    // Immediate shift operations
    assign slli_result = a_in << b_in[4:0];
    assign srli_result = a_in >> b_in[4:0];
    assign srai_result = $signed(a_in) >>> b_in[4:0];

    // SLT, SLTI, SLTIU
    assign SLT_result = aN ^ aV;
    assign slti_result = aN ^ aV;
    assign sltiu_result = aN ^ aV;

    // Immediate operations
    assign addi_result = a_in + b_in;  
    assign xori_result = a_in ^ b_in;  
    assign ori_result = a_in | b_in;   
    assign andi_result = a_in & b_in;  

    // ALUControl based result selection
    always @(*) begin
        case (ALUControl)
            5'b00000 : result = adder_result;       // ADD
            5'b00001 : result = adder_result;       // SUB
            5'b00010 : result = and_result;         // AND
            5'b00011 : result = or_result;          // OR
            5'b00100 : result = xor_result;         // XOR
            5'b00110 : result = sll_result;         // SLL
            5'b00111 : result = srl_result;         // SRL
            5'b01000 : result = sra_result;         // SRA
            5'b01001 : result = slli_result;        // SLLI
            5'b01010 : result = srai_result;        // SRAI
            5'b00101 : result = SLT_result;         // SLT
            5'b01100 : result = addi_result;        // ADDI
            5'b01101 : result = slti_result;        // SLTI
            5'b01110 : result = sltiu_result;       // SLTIU
            5'b01111 : result = xori_result;        // XORI
            5'b10000 : result = srli_result;        // SRLI
            5'b10001 : result = ori_result;         // ORI
            5'b10010 : result = andi_result;        // ANDI
            5'b10011 : result = jalr_result;        // JALR
            default  : result = 32'hx;              // Invalid ALUControl
        endcase
    end
endmodule



/*module alu(
    a_in,
    b_in,
    ALUControl,
    result,
    aN,
    aZ,
    aC,
    aV
);
    input [31:0] a_in, b_in;
    input [4:0] ALUControl;
    output reg [31:0] result; 
    output reg aN;
    output reg aZ;
    output reg aC;
    output reg aV;

    wire N, Z, C, V;
    wire [31:0] add_sub_b;
    wire [31:0] adder_result, and_result, or_result, xor_result, SLT_result, sll_result, srl_result, sra_result;
    wire [31:0] u_adder_result;
    wire is_sub;

    assign is_sub = (ALUControl == 5'b1_0000 || ALUControl == 5'b1_0111 || ALUControl == 5'b1_1000); //sub, slt, sltu
    assign add_sub_b = (is_sub) ? ~b_in : b_in; //sub, slt, sltu

    adder u_add_32bit_add(
        .a(a_in),
        .b(add_sub_b),
        .ci(is_sub),
        .sum(adder_result),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V)
    );    
    
    assign u_adder_result = adder_result;

    always@(*)begin

	 //add, sub, slt, sltu
        if (ALUControl == 5'b0_0000 || is_sub) begin
            {aN, aZ, aC, aV} = {N, Z, C, V};
        end

        else if (ALUControl == 5'b0_0001) begin // and
            aN = and_result[31];
            aZ = (and_result == 32'h0) ? 1'b1 : 1'b0;
	        aC = 1'b0; 
            aV = 1'b0;
        end
        else if (ALUControl == 5'b0_0010) begin // or
            aN = or_result[31];
            aZ = (or_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;
            aV = 1'b0;
        end
        else if (ALUControl == 5'b0_0011) begin //xor
            aN = xor_result[31];
            aZ = (xor_result == 32'h0) ? 1'b1 : 1'b0;
            aC = 1'b0;
            aV = 1'b0;
        end
        else begin
            {aN, aZ, aC, aV} = 4'h0;	
        end
    end
    
    assign and_result = a_in & b_in;
    assign or_result = a_in | b_in;
    assign xor_result = a_in ^ b_in;
    assign SLT_result = (N != V);
    assign SLTU_result = (C == 0);
    assign sll_result = a_in << b_in[4:0];
    assign srl_result = a_in >> b_in[4:0];
    assign sra_result = $signed (a_in) >>> b_in[4:0];

    always@(*) begin
        case(ALUControl)
            5'b0_0000 : result = adder_result;        // add
            5'b1_0000 : result = adder_result;        // sub
            5'b0_0001 : result = and_result;          // and
            5'b0_0010 : result = or_result;           // or
            5'b0_0011 : result = xor_result;          // xor
            5'b1_0111 : result = SLT_result;          // SLT
            5'b1_1000 : result = SLTU_result;          // SLTU
            5'b0_0100 : result = sll_result;          // sll
            5'b0_0101 : result = srl_result;          // srl
            5'b0_0110 : result = sra_result;          // sra
            default : result = 32'h0;
        endcase
    end

endmodule*/
