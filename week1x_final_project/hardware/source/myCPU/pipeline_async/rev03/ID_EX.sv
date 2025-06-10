module ID_EX(
    input         clk,
    input         n_rst,        // Active‑low reset
    input         StallE,       // Stall signal from hazard unit
    input         FlushE,       // Flush signal from hazard unit

    // --- ID stage inputs ---
    input  [31:0] PCPlus4D,
    input  [31:0] RD1D_w,
    input  [31:0] RD2D_w,
    input  [31:0] ImmExtD,
    input  [31:0] PCD,
    input  [31:0] InstrD,
    input  [4:0]  RdD,
    input  [4:0]  Rs1D,
    input  [4:0]  Rs2D,
    input  [4:0]  ALUControlD,
    input  [1:0]  ALUSrcAD,
    input         ALUSrcBD,
    input         MemWriteD,
    input         RegWriteD,
    input  [1:0]  ResultSrcD,
    input         BranchD,
    input         JalD,
    input         JalrD,

    // --- EX stage outputs ---
    output reg [31:0] PCPlus4E,
    output reg [31:0] RD1E_w,
    output reg [31:0] RD2E_w,
    output reg [31:0] ImmExtE,
    output reg [31:0] PCE,
    output reg [31:0] InstrE,
    output reg [4:0]  RdE,
    output reg [4:0]  Rs1E,
    output reg [4:0]  Rs2E,
    output reg [4:0]  ALUControlE,
    output reg [1:0]  ALUSrcAE,
    output reg        ALUSrcBE,
    output reg        MemWriteE,
    output reg        RegWriteE,
    output reg [1:0]  ResultSrcE,
    output reg        BranchE,
    output reg        JalE,
    output reg        JalrE
);
parameter RESET_VALUE = 32'h0000_0000;
always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        PCPlus4E    <= 32'b0;
        RD1E_w      <= 32'b0;
        RD2E_w      <= 32'b0;
        ImmExtE     <= 32'b0;
        PCE <= RESET_VALUE;
        InstrE <= 32'h00000013;
        RdE         <= 5'b0;
        Rs1E        <= 5'b0;
        Rs2E        <= 5'b0;
        ALUControlE <= 5'b0;
        ALUSrcAE    <= 2'b0;
        ALUSrcBE    <= 1'b0;
        MemWriteE   <= 1'b0;
        RegWriteE   <= 1'b0;
        ResultSrcE  <= 2'b0;
        BranchE     <= 1'b0;
        JalE        <= 1'b0;
        JalrE       <= 1'b0;
    end 
    else begin
         if (FlushE) begin
        // Flush → NOP
        //PCPlus4E    <= 32'b0;
        //RD1E_w      <= 32'b0;
        //RD2E_w      <= 32'b0;
        //ImmExtE     <= 32'b0;
        //PCE         <= 32'b0;
            InstrE <= 32'h00000013;
            RdE <= 5'b0_0000;
        //Rs1E        <= 5'b0;
        //Rs2E        <= 5'b0;
            ALUControlE <= 5'b0;
            ALUSrcAE    <= 2'b0;
            ALUSrcBE    <= 1'b0;
            MemWriteE   <= 1'b0;
            RegWriteE   <= 1'b0;
            ResultSrcE  <= 2'b0;
            BranchE     <= 1'b0;
            JalE        <= 1'b0;
            JalrE       <= 1'b0;
        end 
        else  begin//if (!StallE)
        // 정상 동작
            PCPlus4E    <= PCPlus4D;
            RD1E_w      <= RD1D_w;
            RD2E_w      <= RD2D_w;
            ImmExtE     <= ImmExtD;
            PCE <= PCD;
            InstrE      <= InstrD;
            RdE         <= RdD;
            Rs1E        <= Rs1D;
            Rs2E        <= Rs2D;
            ALUControlE <= ALUControlD;
            ALUSrcAE    <= ALUSrcAD;
            ALUSrcBE    <= ALUSrcBD;
            MemWriteE   <= MemWriteD;
            RegWriteE   <= RegWriteD;
            ResultSrcE  <= ResultSrcD;
            BranchE     <= BranchD;
            JalE        <= JalD;
            JalrE       <= JalrD;
        end
    // StallE == 1 → 모든 값 유지됨 (레지스터 유지)
    end
end

endmodule


