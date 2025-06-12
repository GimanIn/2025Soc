module hazard_unit(
    //--------------------------------------------------------------------------
    // 입력 (Input)
    //--------------------------------------------------------------------------
    // 데이터 해저드(Forwarding) 관련
    input [4:0] Rs1E, // Execute 단계 소스 레지스터 1
    input [4:0] Rs2E, // Execute 단계 소스 레지스터 2
    input [4:0] RdM,  // Memory 단계 목적 레지스터
    input [4:0] RdW,  // Write Back 단계 목적 레지스터
    input       RegWriteM, // Memory 단계에서 레지스터 쓰기
    input       RegWriteW, // Write Back 단계에서 레지스터 쓰기

    // lw 의존성 (로드‑유즈 해저드)
    input [4:0] Rs1D,    // Decode 단계 소스 레지스터 1
    input [4:0] Rs2D,    // Decode 단계 소스 레지스터 2
    input [4:0] RdE,     // Execute 단계 목적 레지스터
    input       ResultSrcE, // Execute 단계 명령어가 lw일 때 1

    // 컨트롤 해저드 (분기)
    input [1:0] PCSrcE,  // 분기 성공(또는 점프) 여부 (예: 2'b01 등)

    //--------------------------------------------------------------------------
    // 출력 (Output)
    //--------------------------------------------------------------------------
    // 데이터 해저드(Forwarding)
    output reg [1:0] ForwardAD, // Decode 단계 포워딩 제어(A)
    output reg [1:0] ForwardBD, // Decode 단계 포워딩 제어(B)
    output reg [1:0] ForwardAE, // Execute 단계 포워딩 제어(A)
    output reg [1:0] ForwardBE, // Execute 단계 포워딩 제어(B)

    // lw 의존성
    output reg       lwStall,   // 로드‑유즈 스톨 신호

    // 컨트롤 해저드
    output reg       FlushD,    // Decode 단계 Flush
    output reg       FlushE     // Execute 단계 Flush
);
    //--------------------------------------------------------------------------
    // 1) Decode 단계 포워딩(ForwardAD, ForwardBD)
    //--------------------------------------------------------------------------
    always @(*) begin
        if (((Rs1D == RdM) && RegWriteM) && (Rs1D != 5'd0))
            ForwardAD = 2'b10;
        else if (((Rs1D == RdW) && RegWriteW) && (Rs1D != 5'd0))// 두번째부터 RDM을 RDW로 바꿈꿈
            ForwardAD = 2'b01;
        else
            ForwardAD = 2'b00;
    end

    always @(*) begin
        if (((Rs2D == RdM) && RegWriteM) && (Rs2D != 5'd0))
            ForwardBD = 2'b10;
        else if (((Rs2D == RdW) && RegWriteW) && (Rs2D != 5'd0)) // 두번째부터 RDM을 RDW로 바꿈꿈
            ForwardBD = 2'b01;
        else
            ForwardBD = 2'b00;
    end

    //--------------------------------------------------------------------------
    // 2) Execute 단계 포워딩(ForwardAE, ForwardBE)
    //--------------------------------------------------------------------------
    always @(*) begin
        if (((Rs1E == RdM) && RegWriteM) && (Rs1E != 5'd0))
            ForwardAE = 2'b10;
        else if (((Rs1E == RdW) && RegWriteW) && (Rs1E != 5'd0))
            ForwardAE = 2'b01;
        else
            ForwardAE = 2'b00;
    end

    always @(*) begin
        if (((Rs2E == RdM) && RegWriteM) && (Rs2E != 5'd0))
            ForwardBE = 2'b10;
        else if (((Rs2E == RdW) && RegWriteW) && (Rs2E != 5'd0))
            ForwardBE = 2'b01;
        else
            ForwardBE = 2'b00;
    end

    //--------------------------------------------------------------------------
    // 3) Load-use Hazard (lwStall)
    //--------------------------------------------------------------------------
    always @(*) begin
        if (((Rs1D == RdE) || (Rs2D == RdE)) && ResultSrcE && (RdE != 5'd0)) //&& (RdE != 5'd0) 추가
            lwStall = 1'b1;
        else
            lwStall = 1'b0;
    end

    //--------------------------------------------------------------------------
    // 4) Control Hazard (FlushD, FlushE)
    //--------------------------------------------------------------------------
    always @(*) begin
        if (PCSrcE == 2'b01 || PCSrcE == 2'b10) // 분기, 점프, 점프-레지스터 포함(PCSrcE == 2'b01)
            FlushD = 1'b1;
        else
            FlushD = 1'b0;
    end
    

    always @(*) begin
        if (lwStall || (PCSrcE == 2'b01) || PCSrcE == 2'b10) 
            FlushE = 1'b1; 
        else
            FlushE = 1'b0; 
    end


endmodule

/*always @(*) begin
    if (((Rs1D == RdE) || (Rs2D == RdE)) && ResultSrcE) 
        lwStall = 1'b1; 
    else
        lwStall = 1'b0; 
end


// control hazard
always @(*) begin
    if (PCSrcE == 2'b01) 
        FlushD = 1'b1; 
    else
        FlushD = 1'b0; 
end

always @(*) begin
    if (lwStall || (PCSrcE == 2'b01)) 
        FlushE = 1'b1; 
    else
        FlushE = 1'b0; 
end*/
