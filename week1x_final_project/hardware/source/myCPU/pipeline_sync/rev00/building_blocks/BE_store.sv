module BE_store (
    input [1:0] AddrLast2,
    input [2:0] funct3,
    input [31:0] WD,
    output reg [3:0] BE,
    output reg [31:0] BE_WD
);

    // Byte Enable 설정
    always @(*) begin
        BE = 4'b0000;
        case (funct3)
            3'b000: begin // SB
                case (AddrLast2)
                    2'b00: BE = 4'b0001;
                    2'b01: BE = 4'b0010;
                    2'b10: BE = 4'b0100;
                    2'b11: BE = 4'b1000;
                endcase
            end
            3'b001: begin // SH
                case (AddrLast2[1])
                    1'b0: BE = 4'b0011;
                    1'b1: BE = 4'b1100;
                endcase
            end
            3'b010: begin // SW
                BE = 4'b1111;
            end
        endcase
    end

    // Write Data Masking
    always @(*) begin
        BE_WD = 32'b0;
        case (funct3)
            3'b000: begin // SB
                case (AddrLast2)
                    2'b00: BE_WD = {24'b0, WD[7:0]};
                    2'b01: BE_WD = {16'b0, WD[7:0], 8'b0};
                    2'b10: BE_WD = {8'b0, WD[7:0], 16'b0};
                    2'b11: BE_WD = {WD[7:0], 24'b0};
                endcase
            end
            3'b001: begin // SH
                case (AddrLast2[1])
                    1'b0: BE_WD = {16'b0, WD[15:0]};
                    1'b1: BE_WD = {WD[15:0], 16'b0};
                endcase
            end
            3'b010: begin // SW
                BE_WD = WD;
            end
        endcase
    end

endmodule
