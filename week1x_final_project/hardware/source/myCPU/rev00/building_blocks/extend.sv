module extend(
    ImmSrc,
    in,
    out
);
    input [2:0] ImmSrc;       // 변경: ImmSrc를 3비트로 확장
    input [24:0] in;          // from instruction[31:7]
    output reg [31:0] out;

    // ImmSrc 000 = I-type
    // ImmSrc 001 = S-type
    // ImmSrc 010 = B-type
    // ImmSrc 011 = J-type
    // ImmSrc 100 = U-type

    always @(*) begin
        if (ImmSrc == 3'b000)                                         // I-type
            out = {{20{in[24]}}, in[24:13]};		 
        else if (ImmSrc == 3'b001)                                    // S-type
            out = {{20{in[24]}}, in[24:18], in[4:0]};		
        else if (ImmSrc == 3'b010)                                    // B-type	
            out = {{20{in[24]}}, in[0], in[23:18], in[4:1], 1'b0};	 
        else if (ImmSrc == 3'b011)                                    // J-type
            out = {{12{in[24]}}, in[12:5], in[13], in[23:14], 1'b0};  
        else if (ImmSrc == 3'b100)                                    // U-type
            out = {in[24:5], 12'b0};                                   // 상위 20비트 사용, 하위 12비트는 0
        else
            out = 32'hx;
    end

endmodule
