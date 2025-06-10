module alu(
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

endmodule