module SMU_RV32I_System (
  input         CLOCK_50,
  input   [2:0] BUTTON,
  input   [9:0] SW,
  output  [6:0] HEX3,
  output  [6:0] HEX2,
  output  [6:0] HEX1,
  output  [6:0] HEX0,
  output  [9:0] LEDR,

  output        UART_TXD,
  input         UART_RXD
);

  parameter RESET_PC = 32'h1000_0000;
  parameter CLOCK_FREQ = 125_000_000;
  parameter BAUD_RATE = 115_200;
  parameter MIF_HEX = "";
  parameter MIF_BIOS_HEX = "";
  parameter DWIDTH = 32;
  parameter AWIDTH = 12;

  wire [31:0] PC, Instr;
  wire [31:0] WriteData, DataAdr;
  wire MemWrite;
  wire [31:0] ReadData;

  wire reset;
  wire reset_poweron;
  reg  reset_ff;

  wire [31:0] data_addr;
  wire [31:0] write_data;
  wire [31:0] BE_WD;
  wire [3:0]  ByteEnable;
  wire [31:0] read_data;
  wire        cs_dmem_n;
  wire        cs_tbman_n;
  wire        cs_mem_n;
  wire        data_we;

  wire clk = CLOCK_50;
  wire clkb;

  wire data_re;

  // reset =  BUTTON[0]
  // if BUTTON[0] is pressed, the reset goes down to "0"
  // reset is a low-active signal
  assign  reset_poweron = BUTTON[0];
  assign  reset = reset_poweron;

  always @(posedge clk)
    reset_ff <= reset;

  assign clkb = ~clk;

  wire n_rst = reset_ff;

  riscvpipeline #(
      .RESET_PC(RESET_PC)
    ) icpu (
    .clk(clk),
    .n_rst(n_rst),
    .PC(PC),
    .Instr(Instr),
    .MemWrite(MemWrite),
    .ALUResult(DataAdr),
    .ReadData(read_data),
    .ByteEnable(ByteEnable),
    .BE_WD(BE_WD)
  );

  ASYNC_RAM_DP_WBE #(
      .DWIDTH (DWIDTH),
      .AWIDTH (AWIDTH),
      .MIF_HEX (MIF_HEX)
  ) imem (
    .clk      (clk),
    .addr0    (PC[AWIDTH+2-1:2]),
    .addr1    (DataAdr[AWIDTH+2-1:2]),
    .wbe0     (4'd0),
    .wbe1     (ByteEnable),
    .d0       (32'd0),
    .d1       (BE_WD),
    .wen0     (1'b0),
    .wen1     (MemWrite & ~cs_dmem_n),
    .q0       (Instr),
    .q1       (ReadData)
  );

  // Instantiate Address Decoder
  Addr_Decoder addr_decoder (
    .Addr(DataAdr),
    .CS_DMEM_N(cs_dmem_n),
    .CS_TBMAN_N(cs_tbman_n)
  );

  // Instantiate Data Multiplexer
  data_mux data_multiplexer (
    .cs_dmem_n(cs_dmem_n),
    .read_data_dmem(ReadData),
    .cs_tbman_n(cs_tbman_n),
    .read_data_tbman(tbman_rdata), // 연결된 tbman의 읽기 데이터
    .read_data(read_data)
  );

  // Instantiate tbman_wrap
  tbman_wrap tbman (
    .clk          (clk),
    .rst_n        (n_rst),
    .tbman_sel    (~cs_tbman_n),      // CS_TBMAN_N가 low일 때 활성화
    .tbman_write  (MemWrite),         // 쓰기 신호
    .tbman_addr   (DataAdr[15:0]),    // tbman_addr을 16비트로 연결
    .tbman_wdata  (BE_WD),            // tbman으로 보낼 데이터
    .tbman_rdata  (tbman_rdata)       // tbman의 읽기 데이터
  );
  /*TimerCounter u_TimerCounter (
    .clk (clk),
    .reset (~n_rst),
    .CS_N (cs_timer_n),
    .RD_N (MemWrite),//~data_re
    .WR_N (~MemWrite),//~data_we
    .Adder (DataAdr[11:0]),
    .DataIn (write_Data),
    Intr ()
  )*/

endmodule
