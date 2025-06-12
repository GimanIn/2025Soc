module BE_load (
    input [1:0] AddrLast2,
    input [2:0] funct3,
    input [31:0] RD,
    output reg [31:0] BE_RD
);

    always @(*) begin
        BE_RD = 32'b0;

        case (funct3)
            3'b000: begin // LB
                case (AddrLast2)
                    2'b00: BE_RD = {{24{RD[7]}}, RD[7:0]};
                    2'b01: BE_RD = {{24{RD[15]}}, RD[15:8]};
                    2'b10: BE_RD = {{24{RD[23]}}, RD[23:16]};
                    2'b11: BE_RD = {{24{RD[31]}}, RD[31:24]};
                endcase
            end
            3'b100: begin // LBU
                case (AddrLast2)
                    2'b00: BE_RD = {24'b0, RD[7:0]};
                    2'b01: BE_RD = {24'b0, RD[15:8]};
                    2'b10: BE_RD = {24'b0, RD[23:16]};
                    2'b11: BE_RD = {24'b0, RD[31:24]};
                endcase
            end
            3'b001: begin // LH
                case (AddrLast2[1])
                    1'b0: BE_RD = {{16{RD[15]}}, RD[15:0]};
                    1'b1: BE_RD = {{16{RD[31]}}, RD[31:16]};
                endcase
            end
            3'b101: begin // LHU
                case (AddrLast2[1])
                    1'b0: BE_RD = {16'b0, RD[15:0]};
                    1'b1: BE_RD = {16'b0, RD[31:16]};
                endcase
            end
            3'b010: begin // LW
                BE_RD = RD;
            end
        endcase
    end

endmodule
