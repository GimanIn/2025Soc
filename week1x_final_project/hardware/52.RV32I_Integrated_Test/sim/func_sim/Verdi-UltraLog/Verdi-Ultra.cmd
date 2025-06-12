debImport "-sv" "-f" "run.f"
verdiWindowResize -win $_Verdi_1 "1879" "38" "1920" "2032"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
verdiSetActWin -dock widgetDock_<Decl._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "flopr"
verdiSetActWin -win $_nSchema_2
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBTreeAction -win $_nTrace1 -path "SMU_RV32I_System"
verdiSetActWin -dock widgetDock_<Decl._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "data_multiplexer"
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {44716} {30268} {61697} {51024} -win $_nSchema3
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/52.RV32I_Integrated_Test/sim/func_sim/wave.fsdb}
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 503.364882 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvZoomAll -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSetCursor -win $_nWave4 112.660909 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 151.637727 -snap {("G2" 0)}
wvZoomAll -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {79754} {-7285} {105704} {32668} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_ID_EX" "Rs1D\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSetRadix -win $_nWave4 -format Bin
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
schZoom {49738} {31468} {65165} {48265} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_Instr_mux3" "sel\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_Instr_mux3" "in0\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_Instr_mux3" "in1\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_Instr_mux3" "in2\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_Instr_mux3" "sel\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_Instr_mux3" "out\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 1512.160566
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {87646} {-13164} {106421} {25949} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_ID_EX" "RD1D_w\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_ID_EX" "ImmExtD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_ID_EX" "RD2D_w\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
schZoom {12787} {2553} {38498} {31348} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_EX_MEM" "WriteDataE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_EX_MEM" "WriteDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schZoom {101279} {-9924} {110367} {30508} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_ID_EX" "Rs2E\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 6 )} 
verdiSetActWin -win $_nWave4
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 0)}
wvSetPosition -win $_nWave4 {("G1" 5)}
schSelect -win $_nSchema3 -instport "u_ID_EX" "RD2E_w\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 5)}
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 4)}
wvSetPosition -win $_nWave4 {("G1" 3)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 3)}
wvSetPosition -win $_nWave4 {("G1" 4)}
wvSetCursor -win $_nWave4 1435.354210 -snap {("G2" 0)}
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
wvSelectSignal -win $_nWave4 {( "G1" 5 )} 
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "RD2E_w2\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
verdiSetActWin -win $_nWave4
wvSelectGroup -win $_nWave4 {G2}
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {57033} {-926} {85374} {19830} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_EX_MEM" "MemWriteM"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 7)}
wvSetPosition -win $_nWave4 {("G1" 8)}
wvSetPosition -win $_nWave4 {("G2" 0)}
verdiSetActWin -win $_nWave4
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 1)}
wvSetPosition -win $_nWave4 {("G2" 1)}
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSetCursor -win $_nWave4 31.399303 -snap {("G3" 0)}
verdiSetActWin -win $_nWave4
wvZoomAll -win $_nWave4
wvZoomIn -win $_nWave4
wvSetCursor -win $_nWave4 436.811955 -snap {("G3" 0)}
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {162027} {27269} {178052} {42386} -win $_nSchema3
schSelect -win $_nSchema3 -instpin "u_be_store" "BE_WD\[31:0\]"
schSelect -win $_nSchema3 -instport "u_be_store" "BE_WD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 1)}
wvSetPosition -win $_nWave4 {("G2" 0)}
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 7)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 7)}
wvSetPosition -win $_nWave4 {("G1" 8)}
wvSetCursor -win $_nWave4 311.867995 -snap {("G3" 0)}
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schPopViewUp -win $_nSchema3
schZoom {43636} {6881} {65679} {22898} -win $_nSchema3
schFit -win $_nSchema3
schZoom {65077} {10232} {73627} {24238} -win $_nSchema3
schSelect -win $_nSchema3 -signal "cs_dmem_n"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "addr_decoder" "Addr\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {21158} {24749} {60381} {58223} -win $_nSchema3
schFit -win $_nSchema3
schZoom {71981} {1714} {108454} {27509} -win $_nSchema3
schFit -win $_nSchema3
schZoom {3938} {5433} {57153} {42506} -win $_nSchema3
schPopViewUp -win $_nSchema3
schPopViewUp -win $_nSchema3
schDeselectAll -win $_nSchema3
schZoom {67282} {11304} {76566} {24506} -win $_nSchema3
schFit -win $_nSchema3
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schFit -win $_nSchema3
schZoom {112639} {-8964} {151026} {24029} -win $_nSchema3
schSelect -win $_nSchema3 -signal "ALUControlE\[4:0\]"
schDeselectAll -win $_nSchema3
debExit
