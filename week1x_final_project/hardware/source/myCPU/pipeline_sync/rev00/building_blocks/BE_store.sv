module BE_store (
    input [1:0] AddrLast2,
    input [2:0] funct3,
    input [31:0] WD,
    output reg [3:0] BE,
    output reg [31:0] BE_WD
);



always @(*)begin
        case(funct3)
            3'b010: BE = 4'hF;

            3'b001: begin
                case(AddrLast2)
                    2'b00: BE = 4'b0011;
                    2'b10: BE = 4'b1100;
                    default: BE = 4'h0;
                endcase
            end

            3'b000: begin
                case(AddrLast2)
                    2'b00: BE = 4'b0001;
                    2'b01: BE = 4'b0010;
                    2'b10: BE = 4'b0100;
                    2'b11: BE = 4'b1000;
                    default: BE = 4'h0;
                endcase
            end

            default: BE = 4'h0;
        endcase
    end

    //dmem write data
    always @(*) begin
        case(funct3)
           3'b000: BE_WD = {4{WD[7:0]}};
           3'b001: BE_WD = {2{WD[15:0]}}; 
           3'b010: BE_WD = WD;
           default: BE_WD = 32'h0;
        endcase
     end

    
endmodule