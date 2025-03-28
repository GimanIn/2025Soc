verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "run.f"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "331" "62" "1482" "905"
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBTreeAction -win $_nTrace1 -path "SMU_RV32I_System"
verdiSetActWin -dock widgetDock_<Decl._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU"
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -inst "icpu"
schPushViewIn -win $_nSchema2
schSelect -win $_nSchema2 -inst "i_datapath"
schPushViewIn -win $_nSchema2
schZoom {26747} {5292} {49232} {27691} -win $_nSchema2
schSelect -win $_nSchema2 -signal "ALUResultM\[1:0\]"
wvCreateWindow
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/01.RV32I_Integrated_Test_partial_type/sim/func_sim/wave.fsdb}
schSelect -win $_nSchema2 -signal "ALUResultM\[31:0\]"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 104.013982 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvZoomAll -win $_nWave3
schSelect -win $_nSchema2 -signal "ReadDataW\[31:0\]"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema2 -signal "ReadDataW\[31:0\]"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvScrollDown -win $_nWave3 1
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 997.345492 -snap {("G1" 2)}
wvSetCursor -win $_nWave3 1011.610267 -snap {("G1" 2)}
verdiWindowResize -win $_Verdi_1 "11" "62" "1802" "905"
wvSetCursor -win $_nWave3 1238.347826 -snap {("G1" 2)}
wvZoomAll -win $_nWave3
wvSetCursor -win $_nWave3 991.616403 -snap {("G1" 2)}
srcActiveTrace "cpu_tb.CPU.icpu.i_datapath.ReadDataW\[31:0\]" -TraceByDConWave \
           -TraceTime 930 -TraceValue 00000000000000001010000100000011 -win \
           $_nTrace1
wvSetCursor -win $_nWave3 999.121542 -snap {("G1" 2)}
schCreateWindow -delim "." -win $_nSchema1 -scope \
           "cpu_tb.CPU.icpu.i_datapath.u_MEM_WB"
verdiSetActWin -win $_nSchema_4
schPopViewUp -win $_nSchema4
schDeselectAll -win $_nSchema4
schZoom {29325} {1728} {56094} {24093} -win $_nSchema4
schSelect -win $_nSchema4 -signal "BE_RDW\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema4 -signal "BE_WD\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
wvZoomAll -win $_nWave3
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 708.297431 -snap {("G1" 4)}
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvSetCursor -win $_nWave3 650.132609 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 744.884980 -snap {("G2" 0)}
wvZoomAll -win $_nWave3
schSelect -win $_nSchema4 -signal "ALUResultM\[1:0\]"
verdiSetActWin -win $_nSchema_4
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
wvZoomAll -win $_nWave3
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 406.215613 -snap {("G2" 0)}
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 5 )} 
wvSetCursor -win $_nWave3 93.814229 -snap {("G2" 0)}
schSelect -win $_nSchema4 -signal "RdE\[4:0\]"
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 522.545257 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvZoomAll -win $_nWave3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
verdiSetActWin -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
verdiSetActWin -win $_nSchema_4
schZoom {27677} {10347} {38284} {21297} -win $_nSchema4
schSelect -win $_nSchema4 -signal "InstrM\[14:12\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 792.730237 -snap {("G1" 1)}
verdiSetActWin -win $_nWave3
wvZoomAll -win $_nWave3
wvSetCursor -win $_nWave3 1454.246970 -snap {("G2" 0)}
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSetRadix -win $_nWave3 -format Bin
wvSetCursor -win $_nWave3 986.652899 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 1301.323123 -snap {("G2" 0)}
schSelect -win $_nSchema4 -signal "ByteEnable\[3:0\]"
verdiSetActWin -win $_nSchema_4
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
verdiSetActWin -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 2 )} 
wvSetRadix -win $_nWave3 -format Bin
schSelect -win $_nSchema4 -signal "BE_RDW\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -signal "BE_WD\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave3
