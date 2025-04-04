verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "run.f"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "145" "51" "1440" "933"
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
schPopViewUp -win $_nSchema2
schSelect -win $_nSchema2 -inst "icpu"
schPushViewIn -win $_nSchema2
schSelect -win $_nSchema2 -inst "i_datapath"
schPushViewIn -win $_nSchema2
schZoom {86428} {-1973} {101991} {15894} -win $_nSchema2
schSelect -win $_nSchema2 -signal "ALUControlE\[4:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 52.897638 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
schSelect -win $_nSchema2 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
verdiSetActWin -win $_nSchema_2
wvSetCursor -win $_nWave3 537.612730 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
verdiSetActWin -win $_nSchema_2
schDeselectAll -win $_nSchema2
schPopViewUp -win $_nSchema2
schSelect -win $_nSchema2 -inst "i_datapath"
schPushViewIn -win $_nSchema2
schSelect -win $_nSchema2 -signal "RegWriteW"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 563.521777 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -signal "ResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 595.188391 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
schSelect -win $_nSchema2 -inst "u_ID_EX"
verdiSetActWin -win $_nSchema_2
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSetCursor -win $_nWave3 577.915693 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
