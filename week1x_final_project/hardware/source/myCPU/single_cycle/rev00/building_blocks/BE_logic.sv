module BE_logic (
    input [1:0] AddrLast2,
    input [2:0] funct3,
    input [31:0] WD,
    input [31:0] RD,
    output reg [31:0] BE_WD,
    output reg [31:0] BE_RD,
    output reg [3:0] BE  
);

    // BE 로직 (Byte Enable 설정)
    always @(*) begin
        BE = 4'b0000;  // 기본값 (초기화)

        case (funct3)
            3'b000: begin  // SB (Store Byte)
                case (AddrLast2)
                    2'b00: BE = 4'b0001;
                    2'b01: BE = 4'b0010;
                    2'b10: BE = 4'b0100;
                    2'b11: BE = 4'b1000;
                endcase
            end
            3'b001: begin  // SH (Store Halfword)
                case (AddrLast2[1])
                    1'b0: BE = 4'b0011;
                    1'b1: BE = 4'b1100;
                endcase
            end
            3'b010: begin  // SW (Store Word)
                BE = 4'b1111;
            end
            default: BE = 4'b0000;  // 기본값
        endcase
    end

    // Store 로직
    always @(*) begin
        BE_WD = 32'b0;  // 기본값 (초기화)

        case (funct3)
            3'b000: begin  // SB (Store Byte)
                case (AddrLast2)
                    2'b00: BE_WD = {24'b0, WD[7:0]};
                    2'b01: BE_WD = {16'b0, WD[7:0], 8'b0};
                    2'b10: BE_WD = {8'b0, WD[7:0], 16'b0};
                    2'b11: BE_WD = {WD[7:0], 24'b0};
                endcase
            end
            3'b001: begin  // SH (Store Halfword)
                case (AddrLast2[1])
                    1'b0: BE_WD = {16'b0, WD[15:0]};
                    1'b1: BE_WD = {WD[15:0], 16'b0};
                endcase
            end
            3'b010: begin  // SW (Store Word)
                BE_WD = WD;
            end
        endcase
    end

    // Load 로직
    always @(*) begin
        BE_RD = 32'b0;  // 기본값 (초기화)

        case (funct3)
            3'b000: begin  // LB (Load Byte - Sign Extend)
                case (AddrLast2)
                    2'b00: BE_RD = {{24{RD[7]}}, RD[7:0]};
                    2'b01: BE_RD = {{24{RD[15]}}, RD[15:8]};
                    2'b10: BE_RD = {{24{RD[23]}}, RD[23:16]};
                    2'b11: BE_RD = {{24{RD[31]}}, RD[31:24]};
                endcase
            end
            3'b100: begin  // LBU (Load Byte Unsigned)
                case (AddrLast2)
                    2'b00: BE_RD = {24'b0, RD[7:0]};
                    2'b01: BE_RD = {24'b0, RD[15:8]};
                    2'b10: BE_RD = {24'b0, RD[23:16]};
                    2'b11: BE_RD = {24'b0, RD[31:24]};
                endcase
            end
            3'b001: begin  // LH (Load Halfword - Sign Extend)
                case (AddrLast2[1])
                    1'b0: BE_RD = {{16{RD[15]}}, RD[15:0]};
                    1'b1: BE_RD = {{16{RD[31]}}, RD[31:16]};
                endcase
            end
            3'b101: begin  // LHU (Load Halfword Unsigned)
                case (AddrLast2[1])
                    1'b0: BE_RD = {16'b0, RD[15:0]};
                    1'b1: BE_RD = {16'b0, RD[31:16]};
                endcase
            end
            3'b010: begin  // LW (Load Word)
                BE_RD = RD;
            end
        endcase
    end

endmodule
