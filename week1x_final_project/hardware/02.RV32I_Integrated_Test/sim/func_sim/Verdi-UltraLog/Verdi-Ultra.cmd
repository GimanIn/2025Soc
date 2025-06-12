debImport "-sv" "-f" "run.f"
verdiWindowResize -win $_Verdi_1 -10 "19" "1920" "2096"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBTreeAction -win $_nTrace1 -path "SMU_RV32I_System"
verdiSetActWin -dock widgetDock_<Decl._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU"
verdiSetActWin -win $_nSchema_2
wvCreateWindow
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/02.RV32I_Integrated_Test/sim/func_sim/wave.fsdb}
schSelect -win $_nSchema2 -inst "imem"
schPushViewIn -win $_nSchema2
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -inst \
          "ASYNC_RAM_DP_WBE\(@1\):SigOp0:64:64:ComboMemory_mem\[0:4095\]"
schPushViewIn -win $_nSchema2
srcSetScope "cpu_tb.CPU.imem" -delim "." -win $_nTrace1
srcSelect -win $_nTrace1 -range {64 64 1 10 1 1}
verdiSetActWin -win $_nWave3
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {97 97 4 5 1 1}
srcHBSelect "cpu_tb.CPU" -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU"
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -inst "icpu"
schPushViewIn -win $_nSchema4
schSelect -win $_nSchema4 -inst "i_datapath"
schPushViewIn -win $_nSchema4
schZoom {96250} {-25441} {125877} {33421} -win $_nSchema4
schZoom {103341} {1308} {115989} {23700} -win $_nSchema4
schSelect -win $_nSchema4 -instport "u_ID_EX" "MemWriteE"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schFit -win $_nSchema4
schZoom {59562} {8245} {84213} {26661} -win $_nSchema4
schSelect -win $_nSchema4 -instport "u_EX_MEM" "MemWriteM"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -instport "u_EX_MEM" "WriteDataE\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -instport "u_EX_MEM" "WriteDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -instport "u_EX_MEM" "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -instport "u_EX_MEM" "ALUResultM\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schFit -win $_nSchema4
schZoom {23222} {6962} {44401} {28642} -win $_nSchema4
schSelect -win $_nSchema4 -instport "u_BE_logic" "BE\[3:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -instport "u_BE_logic" "funct3\[2:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -instport "u_BE_logic" "AddrLast2\[1:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -instport "u_BE_logic" "BE_WD\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 106.707923 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 8 )} 
wvSelectSignal -win $_nWave3 {( "G1" 7 )} 
wvSelectSignal -win $_nWave3 {( "G1" 7 8 9 )} 
wvSelectSignal -win $_nWave3 {( "G1" 7 8 9 )} 
wvSetRadix -win $_nWave3 -format Bin
wvSetCursor -win $_nWave3 431.878962 -snap {("G2" 0)}
schPopViewUp -win $_nSchema4
verdiSetActWin -win $_nSchema_4
schPopViewUp -win $_nSchema4
schSelect -win $_nSchema4 -signal "WriteData_d\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schDeselectAll -win $_nSchema4
schSelect -win $_nSchema4 -instport "icpu" "ReadData\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -signal "ReadData\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -signal "Instr\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schDeselectAll -win $_nSchema4
schSelect -win $_nSchema4 -inst "icpu"
schPushViewIn -win $_nSchema4
schSelect -win $_nSchema4 -instport "i_datapath" "ReadDataM\[31:0\]"
schSelect -win $_nSchema4 -inst "i_datapath"
schPushViewIn -win $_nSchema4
schFit -win $_nSchema4
schZoom {7366} {-2712} {30050} {22698} -win $_nSchema4
schSelect -win $_nSchema4 -port "ReadDataM\[31:0\]"
schSelect -win $_nSchema4 -signal "ReadDataW\[31:0\]"
schSelect -win $_nSchema4 -signal "BE_RD\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -inst "u_BE_logic"
schPushViewIn -win $_nSchema4
schSelect -win $_nSchema4 -inst "BE_logic:Always3:197:233:Combo"
schPushViewIn -win $_nSchema4
srcSetScope "cpu_tb.CPU.icpu.i_datapath.u_BE_logic" -delim "." -win $_nTrace1
srcSelect -win $_nTrace1 -range {197 233 1 3 1 1}
verdiSetActWin -win $_nWave3
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetCursor -win $_nWave3 538.503082 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 498.846392 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 544.863117 -snap {("G2" 0)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
