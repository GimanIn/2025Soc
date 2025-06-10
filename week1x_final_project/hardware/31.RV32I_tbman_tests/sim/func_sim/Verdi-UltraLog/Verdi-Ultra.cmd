verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec "./simv" -args "+hex_file=tbman_printf.hex"
debImport "-sv" "-dbdir" "./simv.daidir" "-f" "run.f"
debLoadSimResult \
           /home1/socuser10/2025Soc/week1x_final_project/hardware/31.RV32I_tbman_tests/sim/func_sim/wave.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "c_tests_tb" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "c_tests_tb" -win $_nTrace1
srcSetScope "c_tests_tb" -delim "." -win $_nTrace1
srcHBSelect "c_tests_tb" -win $_nTrace1
srcHBSelect "c_tests_tb.CPU" -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "c_tests_tb"
verdiSetActWin -win $_nSchema_3
verdiWindowResize -win $_Verdi_1 "389" "88" "1440" "752"
verdiWindowResize -win $_Verdi_1 "959" "26" "960" "1016"
schSelect -win $_nSchema3 -inst "CPU"
schPushViewIn -win $_nSchema3
schZoom {29535} {-14396} {85921} {38619} -win $_nSchema3
schZoom {25349} {-5041} {67420} {22469} -win $_nSchema3
schSelect -win $_nSchema3 -signal "tbman_rdata\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 3631.686144 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 6184.653632 -snap {("G2" 0)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 6982.455972 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 6447.591304 -snap {("G2" 0)}
wvZoomAll -win $_nWave2
schSelect -win $_nSchema3 -signal "WriteData_d\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 156007.071464 -snap {("G2" 0)}
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "PC\[18:2\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "imem"
schPushViewIn -win $_nSchema3
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {140417} {3604} {179544} {46430} -win $_nSchema3
schZoom {143254} {10352} {183289} {37883} -win $_nSchema3
schSelect -win $_nSchema3 -signal "Csr"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
schSelect -win $_nSchema3 -signal "Csr"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 153157.869151 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 182848.790438
schSelect -win $_nSchema3 -signal "InstrE\[14:12\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
schSelect -win $_nSchema3 -signal "ForwardBD\[1:0\]"
schSelect -win $_nSchema3 -signal "RD1E_w2\[31:0\]"
schFit -win $_nSchema3
schZoom {19813} {-7105} {74591} {39915} -win $_nSchema3
verdiSetActWin -dock widgetDock_<Inst._Tree>
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schPopViewUp -win $_nSchema3
schZoom {60963} {5501} {72188} {25267} -win $_nSchema3
schSelect -win $_nSchema3 -signal "DataAdr\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 80330.185826 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
schSelect -win $_nSchema3 -signal "MemWriteM"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "MemWriteM"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 179981.707921 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 157092.181734 -snap {("G2" 0)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 157451.457208 -snap {("G1" 2)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
verdiSetActWin -dock widgetDock_<Inst._Tree>
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
schZoom {19235} {-1177} {47494} {27804} -win $_nSchema3
schZoom {26896} {6037} {49444} {25419} -win $_nSchema3
schSelect -win $_nSchema3 -signal "WriteData_d\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
schSelect -win $_nSchema3 -signal "clk"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
verdiSetActWin -win $_nWave2
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 157601.639959 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 157498.465394 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 157502.716032 -snap {("G1" 4)}
debExit
