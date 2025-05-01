/*module ID_EX(
    input clk,
    input n_rst,             // Active low reset
    input FlushE,
    input [31:0] PCPlus4D,   // PC+4 from ID stage
    //input [31:0] RD1D,       // Source register 1 data
    //input [31:0] RD2D,       // Source register 2 data
    input [31:0] RD1D_w, RD2D_w,
    input [31:0] ImmExtD,    // Immediate value
    input [31:0] PCD,        // PC value from ID stage
    input [31:0] InstrD,     // Instruction from ID stage
    input [4:0] RdD,         // Destination register
    input [4:0] Rs1D,        // Source register 1
    input [4:0] Rs2D,        // Source register 2
    input [4:0] ALUControlD, // ALU control signals
    input [1:0] ALUSrcAD,    // ALU source A control
    input ALUSrcBD,          // ALU source B control
    input MemWriteD,         // Memory write control
    input RegWriteD,         // Register write control
    input [1:0] ResultSrcD,  // Memory to register control
    //input [2:0] ImmSrcD,     // Immediate source control
    input BranchD,           // Branch control
    input JalD,              // JAL control signal
    input JalrD,             // JALR control signal

    output reg [31:0] PCPlus4E,
    output reg [31:0] RD1E_w, RD2E_w,
    //output reg [31:0] RD1E,
    //output reg [31:0] RD2E,
    output reg [31:0] ImmExtE,
    output reg [31:0] PCE,         // PC value to EX stage
    output reg [31:0] InstrE,      // Instruction to EX stage
    output reg [4:0] RdE,
    output reg [4:0] Rs1E,
    output reg [4:0] Rs2E,
    output reg [4:0] ALUControlE,  // ALU control signals to EX stage
    output reg [1:0] ALUSrcAE,     // ALU source A control to EX stage
    output reg ALUSrcBE,           // ALU source B control to EX stage
    output reg MemWriteE,
    output reg RegWriteE,
    output reg [1:0] ResultSrcE,   // Memory to register control to EX stage
    //output reg [2:0] ImmSrcE,      // Immediate source control to EX stage
    output reg BranchE,
    output reg JalE,               // JAL control signal to EX stage
    output reg JalrE               // JALR control signal to EX stage
);

    always @(posedge clk or negedge n_rst) begin//posedge clk or
        if (FlushE) begin
            //PCPlus4E <= 0;
            //RD1E_w <= 0;
            //RD2E_w <= 0;
            //ImmExtE <= 0;
            //PCE <= 0;
            InstrE <= 0;
            RdE <= 0;
            //Rs1E <= 0;
            //Rs2E <= 0;
            ALUControlE <= 0;
            ALUSrcAE <= 0;
            ALUSrcBE <= 0;
            MemWriteE <= 0;
            RegWriteE <= 0;
            ResultSrcE <= 0;
            BranchE <= 0;
            JalE <= 0;
            JalrE <= 0;
        end else begin
            PCPlus4E <= PCPlus4D;
            
            RD1E_w <= RD1D_w;
            RD2E_w <= RD2D_w;
            ImmExtE <= ImmExtD;
            PCE <= PCD;
            InstrE <= InstrD;
            RdE <= RdD;
            Rs1E <= Rs1D;
            Rs2E <= Rs2D;
            ALUControlE <= ALUControlD;
            ALUSrcAE <= ALUSrcAD;
            ALUSrcBE <= ALUSrcBD;
            MemWriteE <= MemWriteD;
            RegWriteE <= RegWriteD;
            ResultSrcE <= ResultSrcD;
            //ImmSrcE <= ImmSrcD;
            BranchE <= BranchD;
            JalE <= JalD;
            JalrE <= JalrD;
        end
    end
endmodule*/
/*module ID_EX(
    input         clk,
    input         n_rst,        // Active‑low reset
    input         StallE,       // [ADD] Stall signal from hazard unit
    input         FlushE,       // Flush signal from hazard unit

    // --- ID stage inputs ---
    input  [31:0] PCPlus4D,     // PC+4 from ID
    input  [31:0] RD1D_w,       // Decode‑stage forwarded src1
    input  [31:0] RD2D_w,       // Decode‑stage forwarded src2
    input  [31:0] ImmExtD,      // Extended immediate
    input  [31:0] PCD,          // PC from ID
    input  [31:0] InstrD,       // Instruction from ID
    input  [4:0]  RdD,          // rd field
    input  [4:0]  Rs1D,         // rs1 field
    input  [4:0]  Rs2D,         // rs2 field
    input  [4:0]  ALUControlD,  // ALU control
    input  [1:0]  ALUSrcAD,     // ALU srcA sel
    input         ALUSrcBD,     // ALU srcB sel
    input         MemWriteD,    // store enable
    input         RegWriteD,    // write‑back enable
    input  [1:0]  ResultSrcD,   // write‑back mux sel
    input         BranchD,      // branch flag
    input         JalD,         // JAL flag
    input         JalrD,        // JALR flag

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

    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            // Reset → 모두 0
            PCPlus4E   <= 32'b0;
            RD1E_w     <= 32'b0;
            RD2E_w     <= 32'b0;
            ImmExtE    <= 32'b0;
            PCE        <= 32'b0;
            InstrE     <= 32'b0;
            RdE        <= 5'b0;
            Rs1E       <= 5'b0;
            Rs2E       <= 5'b0;
            ALUControlE<= 5'b0;
            ALUSrcAE   <= 2'b0;
            ALUSrcBE   <= 1'b0;
            MemWriteE  <= 1'b0;
            RegWriteE  <= 1'b0;
            ResultSrcE <= 2'b0;
            BranchE    <= 1'b0;
            JalE       <= 1'b0;
            JalrE      <= 1'b0;
        end
        else if (FlushE) begin
            // Flush → NOP
            PCPlus4E   <= 32'b0;
            RD1E_w     <= 32'b0;
            RD2E_w     <= 32'b0;
            ImmExtE    <= 32'b0;
            PCE        <= 32'b0;
            InstrE     <= 32'b0;
            RdE        <= 5'b0;
            Rs1E       <= 5'b0;
            Rs2E       <= 5'b0;
            ALUControlE<= 5'b0;
            ALUSrcAE   <= 2'b0;
            ALUSrcBE   <= 1'b0;
            MemWriteE  <= 1'b0;
            RegWriteE  <= 1'b0;
            ResultSrcE <= 2'b0;
            BranchE    <= 1'b0;
            JalE       <= 1'b0;
            JalrE      <= 1'b0;
        end
        else if (!StallE)  begin
            // Normal → ID inputs 그대로 EX로 전달 
            PCPlus4E    <= PCPlus4D;
            RD1E_w      <= RD1D_w;
            RD2E_w      <= RD2D_w;
            ImmExtE     <= ImmExtD;
            PCE         <= PCD;
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
        // else StallE == 1 → hold current EX registers
    end

endmodule*/
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


