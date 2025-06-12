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
  parameter MIF_HEX = "code.hex";
  parameter MIF_BIOS_HEX = "";
  parameter DWIDTH = 32;
  parameter AWIDTH = 12;

  wire [31:0] PC, Instr;
  wire [31:0] ReadData_timer;
  wire [31:0] ReadData_dmem;
  wire [31:0] WriteData_d, DataAdr;
  wire MemWriteM;
  wire [31:0] ReadData;
  wire [31:0] tbman_rdata;

  wire reset;
  wire reset_poweron;
  reg  reset_ff;

  wire [31:0] data_addr;
  wire [31:0] write_data;
  wire [31:0] BE_WD;
  wire [3:0]  ByteEnable;
  wire  [31:0] read_data;
  wire        cs_dmem_n;
  wire        cs_mem_n;
  wire        cs_tbman_n;
  wire        cs_timer_n;
  wire        cs_gpio_n;
  wire        cs_uart_n;
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
    .MemWriteM(MemWriteM),
    .ALUResult(DataAdr),
    .ReadData(ReadData),
    .ByteEnable(ByteEnable),
    .WriteData_d(WriteData_d)
    //.BE_WD(BE_WD)
  );

  // imem imem(
  // 	.a(PC), 
  // 	.rd(Instr)
  // );

   /*dmem dmem(
   	.clk(clk),
   	.wen0(MemWrite),
   	.addr0(DataAdr),
   	.d0(WriteData),
   	.q0(ReadData)
   );*/
   reg MemWrite_d;



    /*ASYNC_RAM_DP_WBE #(
        .DWIDTH (DWIDTH),
        .AWIDTH (AWIDTH),
        .MIF_HEX (MIF_HEX)
    ) imem (
      .clk      (clk),
      .addr0    (PC[AWIDTH+2-1:2]),
      .addr1    (DataAdr[AWIDTH+2-1:2]),
      .wbe0     (4'd0),
      .wbe1     (ByteEnable),
      //.wbe1     (4'hF),
      .d0       (32'd0),
      .d1       (WriteData_d),
      //.d1   (BE_WD),
      .wen0     (1'b0),
      .wen1      (MemWriteM),//~cs_mem_n &
      .q0       (Instr),
      .q1       (ReadData)
    );*/
   
    dualport_mem_synch_rw_dualclk #(
      .DATA_WIDTH(DWIDTH),
      .ADDRESS_WIDTH(AWIDTH),
      .MIF_HEX (MIF_HEX)
    )imem (
        .clk1(clk),
        .clk2(clk),
        .addr1(PC[AWIDTH+2-1:2]),
        .addr2(DataAdr[AWIDTH+2-1:2]),
        .be1(4'd0),
        .be2(ByteEnable),
        .data_in1(32'd0),
        .data_in2(WriteData_d),
        .we1(1'b0),
        .we2(~cs_dmem_n & MemWriteM),
        .data_out1(Instr),
        .data_out2(ReadData_dmem)
    );

    Addr_Decoder addr_decoder (  
      .Addr(DataAdr),
      .cs_dmem_n(cs_dmem_n),
      .cs_timer_n(cs_timer_n),
      .cs_tbman_n(cs_tbman_n)
    );
    data_mux data_multiplexer (
      //.cs_dmem_n(cs_dmem_n),
      .clk(clk),
      .read_data_mem(ReadData_dmem),
      .cs_tbman_n(cs_tbman_n),
      .read_data_tbman(tbman_rdata), // 연결된 tbman의 읽기 데이터\
      .cs_timer_n(cs_timer_n),
      .read_data_timer(ReadData_timer),
      .read_data(ReadData)
    );

    tbman_wrap tbman (
      .clk          (clk),
      .rst_n        (n_rst),
      .tbman_sel    (~cs_tbman_n),      // CS_TBMAN_N가 low일 때 활성화
      .tbman_write  (MemWriteM),         // 쓰기 신호
      .tbman_addr   (DataAdr[15:0]),    // tbman_addr을 16비트로 연결
      .tbman_wdata  (WriteData_d),            // tbman으로 보낼 데이터
      .tbman_rdata  (tbman_rdata)       // tbman의 읽기 데이터
    );




    
     TimerCounter u_TimerCounter (
    .clk (clk),
    .reset (~n_rst),
    .CS_N (cs_timer_n),
    .RD_N (MemWriteM),//~data_re
    .WR_N (~MemWriteM),//~data_we
    .Addr (DataAdr[11:0]),
    .DataIn (WriteData_d),
    .DataOut(ReadData_timer),
    .Intr ()
  );
   /*
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
  );*/

endmodule
