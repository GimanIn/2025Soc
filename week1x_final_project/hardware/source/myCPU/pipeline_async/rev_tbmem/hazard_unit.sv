/*module hazard_unit(
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
    // 보통 Decode 단계에서 Branch 비교 등에 최신 레지스터 값을 사용해야 할 경우
    // MEM/WB 단계 결과를 가져올 수 있도록 포워딩.
    // (설계에 따라 이 로직이 필요 없으면 2'b00으로 고정할 수도 있음)
    always @(*) begin
        if ((Rs1D == RdM) && RegWriteM && (Rs1D != 5'd0))
            ForwardAD = 2'b10;  // 가져올 값이 MEM 단계 결과
        else if ((Rs1D == RdW) && RegWriteW && (Rs1D != 5'd0))
            ForwardAD = 2'b01;  // 가져올 값이 WB 단계 결과
        else
            ForwardAD = 2'b00;  // 포워딩 없음
    end

    always @(*) begin
        if ((Rs2D == RdM) && RegWriteM && (Rs2D != 5'd0))
            ForwardBD = 2'b10;  // MEM 단계 결과
        else if ((Rs2D == RdW) && RegWriteW && (Rs2D != 5'd0))
            ForwardBD = 2'b01;  // WB 단계 결과
        else
            ForwardBD = 2'b00;
    end

    //--------------------------------------------------------------------------
    // 2) Execute 단계 포워딩(ForwardAE, ForwardBE)
    //--------------------------------------------------------------------------
    // ALU 입력(A, B)에 대해 MEM, WB 단계의 결과를 직접 연결
    always @(*) begin
        if ((Rs1E == RdM) && RegWriteM && (Rs1E != 5'd0))
            ForwardAE = 2'b10;  // MEM 단계 결과
        else if ((Rs1E == RdW) && RegWriteW && (Rs1E != 5'd0))
            ForwardAE = 2'b01;  // WB 단계 결과
        else
            ForwardAE = 2'b00;  // 포워딩 없음
    end

    always @(*) begin
        if ((Rs2E == RdM) && RegWriteM && (Rs2E != 5'd0))
            ForwardBE = 2'b10;  // MEM 단계 결과
        else if ((Rs2E == RdW) && RegWriteW && (Rs2E != 5'd0))
            ForwardBE = 2'b01;  // WB 단계 결과
        else
            ForwardBE = 2'b00;
    end

    //--------------------------------------------------------------------------
    // 3) Load-use Hazard (lwStall)
    //--------------------------------------------------------------------------
    // EX 단계에 있는 명령이 lw라면(ResultSrcE=1),
    // Decode 단계에서 Rs1D 혹은 Rs2D가 EX의 RdE와 같으면 다음 명령어가 종속
    // => 한 사이클 stall
    always @(*) begin
        if (ResultSrcE && ((Rs1D == RdE) || (Rs2D == RdE)))
            lwStall = 1'b1;
        else
            lwStall = 1'b0;
    end

    //--------------------------------------------------------------------------
    // 4) Control Hazard
    //--------------------------------------------------------------------------
    // Decode 단계 Flush: 분기 성공(PCSrcE == 2'b01 등) 시 
    // Decode에 들어온 명령어를 무효화
    always @(*) begin
        if (PCSrcE == 2'b01)
            FlushD = 1'b1;
        else
            FlushD = 1'b0;
    end

    // Execute 단계 Flush: 로드-유즈 하자드 발생 시(ex: 이번 cycle에는 EX명령어 진행),
    // 또는 분기 성공 시 EX 단계의 명령어 무효화
    always @(*) begin
        if (lwStall || (PCSrcE == 2'b01))
            FlushE = 1'b1;
        else
            FlushE = 1'b0;
    end

endmodule*/

/*module hazard_unit(
    // 입력 신호
    input [4:0] Rs1D,          // Decode 단계 소스 레지스터 1
    input [4:0] Rs2D,          // Decode 단계 소스 레지스터 2
    input [4:0] Rs1E,          // Execute 단계 소스 레지스터 1
    input [4:0] Rs2E,          // Execute 단계 소스 레지스터 2
    input [4:0] RdE,           // Execute 단계 목적 레지스터
    input [4:0] RdM,           // Memory 단계 목적 레지스터
    input [4:0] RdW,           // Write Back 단계 목적 레지스터
    input RegWriteM,           // Memory 단계에서 레지스터 쓰기 제어
    input RegWriteW,           // Write Back 단계에서 레지스터 쓰기 제어
    input ResultSrcE,          // Execute 단계 결과 소스 제어 (1이면 lw)
    input [1:0] PCSrc,         // 분기 성공 여부 (예: 2'b01이면 branch taken)

    // 출력 신호
    output reg StallF,         // Fetch 단계 Stall 신호
    output reg StallD,         // Decode 단계 Stall 신호
    output reg FlushD,         // Decode 단계 Flush 신호
    output reg FlushE,         // Execute 단계 Flush 신호
    output reg [1:0] ForwardAE, // Execute 단계 포워딩 제어 (A 포트)
    output reg [1:0] ForwardBE  // Execute 단계 포워딩 제어 (B 포트)
);

    //--------------------------------------------------------------------------
    // 1. Execute 단계 포워딩 제어 (ForwardAE, ForwardBE)
    //--------------------------------------------------------------------------
    always @(*) begin
        if ((Rs1E == RdM) && RegWriteM && (Rs1E != 5'd0))
            ForwardAE = 2'b10;  // MEM 단계에서 포워딩
        else if ((Rs1E == RdW) && RegWriteW && (Rs1E != 5'd0))
            ForwardAE = 2'b01;  // WB 단계에서 포워딩
        else
            ForwardAE = 2'b00;  // 포워딩 없음
    end

    always @(*) begin
        if ((Rs2E == RdM) && RegWriteM && (Rs2E != 5'd0))
            ForwardBE = 2'b10;  // MEM 단계에서 포워딩
        else if ((Rs2E == RdW) && RegWriteW && (Rs2E != 5'd0))
            ForwardBE = 2'b01;  // WB 단계에서 포워딩
        else
            ForwardBE = 2'b00;  // 포워딩 없음
    end

    //--------------------------------------------------------------------------
    // 2. Load-use hazard 감지 및 Stall 신호 생성
    //--------------------------------------------------------------------------
    // 로드(use) 위험: Execute 단계의 명령이 lw일 때, Decode 단계에 있는 명령이 
    // Execute 단계의 목적 레지스터(RdE)를 소스로 사용하면 위험 발생.
    reg lwStall_internal;
    always @(*) begin
        if (ResultSrcE && ((Rs1D == RdE) || (Rs2D == RdE)))
            lwStall_internal = 1'b1;
        else
            lwStall_internal = 1'b0;
    end

    // Stall: 로드‑유즈 위험이 발생하면 Fetch와 Decode 단계가 stall됨.
    always @(*) begin
        StallF = lwStall_internal;
        StallD = lwStall_internal;
    end

    //--------------------------------------------------------------------------
    // 3. Control hazard (분기) 관련 Flush 신호 생성
    //--------------------------------------------------------------------------
    // Decode 단계 Flush: 분기 성공 시 (PCSrc == 2'b01) Flush 활성화
    always @(*) begin
        if (PCSrc == 2'b01)
            FlushD = 1'b1;
        else
            FlushD = 1'b0;
    end

    // Execute 단계 Flush: 로드‑유즈 위험 발생 또는 분기 성공 시 Flush 활성화
    always @(*) begin
        if (lwStall_internal || (PCSrc == 2'b01))
            FlushE = 1'b1;
        else
            FlushE = 1'b0;
    end

endmodule*/


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
        else if (((Rs1D == RdM) && RegWriteW) && (Rs1D != 5'd0))
            ForwardAD = 2'b01;
        else
            ForwardAD = 2'b00;
    end

    always @(*) begin
        if (((Rs2D == RdM) && RegWriteM) && (Rs2D != 5'd0))
            ForwardBD = 2'b10;
        else if (((Rs2D == RdM) && RegWriteW) && (Rs2D != 5'd0))
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
        if (((Rs1D == RdE) || (Rs2D == RdE)) && ResultSrcE) 
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
