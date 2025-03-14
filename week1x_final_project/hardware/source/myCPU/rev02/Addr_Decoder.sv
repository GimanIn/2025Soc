module Addr_Decoder (
    input [31:0] Addr,
    output reg CS_DMEM_N,
    output reg CS_TBMAN_N
);

    always @(*) begin
        // 기본값 설정: 모든 장치를 비활성화 (로우 액티브)
        CS_DMEM_N = 1'b1;
        CS_TBMAN_N = 1'b1;

        if (Addr[31:28] == 4'h1) begin
            CS_DMEM_N = 1'b0;   // CS_DMEM_N 활성화 (로우 액티브)
            CS_TBMAN_N = 1'b1;  // CS_TBMAN_N 비활성화
        end
        else if (Addr[31:12] == 20'h8000F) begin
            CS_DMEM_N = 1'b1;   // CS_DMEM_N 비활성화
            CS_TBMAN_N = 1'b0;  // CS_TBMAN_N 활성화 (로우 액티브)
        end
    end

endmodule
