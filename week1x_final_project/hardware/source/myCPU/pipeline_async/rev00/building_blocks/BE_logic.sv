module BE_logic (
    input clk,
    input n_rst,
    
    input [1:0] AddrLast2,
    input [2:0] funct3,
    input [31:0] WD,
    input [31:0] RD,
    output reg [31:0] BE_WD,
    output reg [31:0] BE_RD,
    output reg [3:0] BE  
);

    // Internal delayed signals
    reg [31:0] WD_d;
    //assign WD = WD_d1;
    

    reg [1:0] AddrLast2_d;
    reg [2:0] funct3_d;


    

    // One-cycle delay for WD and AddrLast2
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            
            WD_d <= 32'b0;
            AddrLast2_d <= 2'b00;
            funct3_d<=3'b0;
        end else begin
            
            WD_d <= WD;
            AddrLast2_d <= AddrLast2;
            funct3_d<=funct3;
        end
    end
    

    // BE 로직 (Byte Enable 설정)
    always @(*) begin
        BE = 4'b0000;  // 기본값

        case (funct3)
            3'b000: begin  // SB
                case (AddrLast2)
                    2'b00: BE = 4'b0001;
                    2'b01: BE = 4'b0010;
                    2'b10: BE = 4'b0100;
                    2'b11: BE = 4'b1000;
                endcase
            end
            3'b001: begin  // SH
                case (AddrLast2[1])
                    1'b0: BE = 4'b0011;
                    1'b1: BE = 4'b1100;
                endcase
            end
            3'b010: begin  // SW
                BE = 4'b1111;
            end
            default: BE = 4'b0000;
        endcase
    end

    // Store 로직
    always @(*) begin
        BE_WD = 32'b0;

        case (funct3)
            3'b000: begin  // SB
                case (AddrLast2)
                    2'b00: BE_WD = {24'b0, WD[7:0]};
                    2'b01: BE_WD = {16'b0, WD[7:0], 8'b0};
                    2'b10: BE_WD = {8'b0, WD[7:0], 16'b0};
                    2'b11: BE_WD = {WD[7:0], 24'b0};
                endcase
            end
            3'b001: begin  // SH
                case (AddrLast2[1])
                    1'b0: BE_WD = {16'b0, WD[15:0]};
                    1'b1: BE_WD = {WD[15:0], 16'b0};
                endcase
            end
            3'b010: begin  // SW
                BE_WD = WD;
            end
        endcase
    end

    // Load 로직 (이건 그대로 써도 됨 — 이미 WB 시점이니까)
    always @(*) begin
        BE_RD = 32'b0;

        case (funct3_d)
            3'b000: begin  // LB
                case (AddrLast2_d)
                    2'b00: BE_RD = {{24{RD[7]}}, RD[7:0]};
                    2'b01: BE_RD = {{24{RD[15]}}, RD[15:8]};
                    2'b10: BE_RD = {{24{RD[23]}}, RD[23:16]};
                    2'b11: BE_RD = {{24{RD[31]}}, RD[31:24]};
                endcase
            end
            3'b100: begin  // LBU
                case (AddrLast2_d)
                    2'b00: BE_RD = {24'b0, RD[7:0]};
                    2'b01: BE_RD = {24'b0, RD[15:8]};
                    2'b10: BE_RD = {24'b0, RD[23:16]};
                    2'b11: BE_RD = {24'b0, RD[31:24]};
                endcase
            end
            3'b001: begin  // LH
                case (AddrLast2_d[1])
                    1'b0: BE_RD = {{16{RD[15]}}, RD[15:0]};
                    1'b1: BE_RD = {{16{RD[31]}}, RD[31:16]};
                endcase
            end
            3'b101: begin  // LHU
                case (AddrLast2_d[1])
                    1'b0: BE_RD = {16'b0, RD[15:0]};
                    1'b1: BE_RD = {16'b0, RD[31:16]};
                endcase
            end
            3'b010: begin  // LW
                BE_RD = RD;
            end
        endcase
    end

endmodule


/*module BE_logic(
    WD,
    RD,
    funct3,
    AddrLast2,
    BE, //do you want to die? why did you missed this signal?   
    BE_RD,
    BE_WD
);
    input [31:0] WD, RD;
    input [1:0] AddrLast2;
    input [2:0] funct3;
    
    output reg [3:0] BE; //do you want to die? why did you missed this signal?   
    output reg [31:0] BE_RD;
    output reg [31:0] BE_WD;
    
    /*
    * TA's comment:
    *  When you write HDL code(or some other codes..), you must consider READ-ABILITY.
    *  These codes are hard to read.
    *  This is why you're always stucked in debugging process and struggling with it.
    */

    //TA edit logic
    //----------------------------------------------
    //funct3 - data type mapped parameter
    /*localparam F3_BYTE = 3'b000;
    localparam F3_HFWD = 3'b001;
    localparam F3_WORD = 3'b010;
    localparam F3_BTUN = 3'b100;
    localparam F3_HWUN = 3'b101;

    //byte enable logic
    always @(*)begin
        case(funct3)
            F3_WORD: BE = 4'hF;

            F3_HFWD: begin
                case(AddrLast2)
                    2'b00: BE = 4'b0011;
                    2'b10: BE = 4'b1100;
                    default: BE = 4'h0;
                endcase
            end

            F3_BYTE: begin
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
           F3_BYTE: BE_WD = {4{WD[7:0]}};
           F3_HFWD: BE_WD = {2{WD[15:0]}}; 
           F3_WORD: BE_WD = WD;
           default: BE_WD = 32'h0;
        endcase
     end

    //dmem read data
    always @(*) begin
        case (funct3)
            F3_BYTE: begin
                case (AddrLast2)
                    2'b00: BE_RD = {{24{RD[7]}}, RD[7:0]};
                    2'b01: BE_RD = {{24{RD[15]}}, RD[15:8]};
                    2'b10: BE_RD = {{24{RD[23]}}, RD[23:16]};
                    2'b11: BE_RD = {{24{RD[31]}}, RD[31:24]};
                    default: BE_RD = 32'h0; 
                endcase
            end

            F3_HFWD: begin
                case (AddrLast2[1])
                    1'b0: BE_RD = {{16{RD[15]}}, RD[15:0]};
                    1'b1: BE_RD = {{16{RD[31]}}, RD[31:16]};
                    default: BE_RD = 32'h0; 
                endcase
            end

            F3_WORD: begin
                BE_RD = RD; // LW
            end

            F3_BTUN: begin // LBU
                case (AddrLast2)
                    2'b00: BE_RD = {{24{1'b0}}, RD[7:0]};
                    2'b01: BE_RD = {{24{1'b0}}, RD[15:8]};
                    2'b10: BE_RD = {{24{1'b0}}, RD[23:16]};
                    2'b11: BE_RD = {{24{1'b0}}, RD[31:24]};
                    default: BE_RD = 32'h0; 
                endcase
            end

            F3_HWUN: begin // LHU
                case (AddrLast2[1])
                    1'b0: BE_RD = {{16{1'b0}}, RD[15:0]};
                    1'b1: BE_RD = {{16{1'b0}}, RD[31:16]};
                    default: BE_RD = 32'h0;
                endcase
            end

            default: begin
                BE_RD = 32'h0;
            end
        endcase
    end

    
endmodule*/





