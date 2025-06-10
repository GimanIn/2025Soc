verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "run.f"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Decl._Tree>
srcTBBTreeSelect -win $_nTrace1 -path "riscvpipeline"
schCreateWindow -delim "." -win $_nSchema1 -scope "flopr"
verdiSetActWin -win $_nSchema_2
schPopViewUp -win $_nSchema2
srcTBBTreeSelect -win $_nTrace1 -path "riscvpipeline"
srcTBBTreeSelect -win $_nTrace1 -path "riscvpipeline"
srcTBBTreeSelect -win $_nTrace1 -path "riscvpipeline"
srcTBTreeAction -win $_nTrace1 -path "riscvpipeline"
verdiSetActWin -dock widgetDock_<Decl._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU.icpu"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "u_controller"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "mdec"
schPushViewIn -win $_nSchema3
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/02.RV32I_Integrated_Test/sim/func_sim/wave.fsdb}
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/cpu_tb"
schPopViewUp -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {11702} {10954} {56032} {39556} -win $_nSchema3
schSelect -win $_nSchema3 -signal "PC_nextF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema3 -signal "RdW\[4:0\]"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "PC_nextF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 36.293615 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvZoomAll -win $_nWave4
wvSetCursor -win $_nWave4 483.739026 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 417.271068 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 419.381162 -snap {("G1" 4)}
wvZoomAll -win $_nWave4
wvSetCursor -win $_nWave4 498.509683 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 580.275822 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 558.647359 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 382.454519 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 447.339906 -snap {("G2" 0)}
wvZoomAll -win $_nWave4
wvSetCursor -win $_nWave4 517.500528 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 551.262031 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 604.014378 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 568.670305 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 548.624413 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 511.697770 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 492.179401 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 468.968369 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 416.743545 -snap {("G1" 4)}
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "ALUControlE\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 5 )} 
wvSetRadix -win $_nWave4 -format Bin
wvSetCursor -win $_nWave4 448.922477 -snap {("G1" 5)}
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomAll -win $_nWave4
wvSetCursor -win $_nWave4 510.862031 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 510.393779 -snap {("G1" 2)}
verdiWindowResize -win $_Verdi_1 "353" "110" "1440" "752"
verdiSetActWin -win $_nSchema_3
verdiQtPrefEnv -show
verdiQtPrefEnv -setCurPg "Schematics.Symbol Library"
verdiQtPrefEnv -setCurPg "Schematics.Symbol Map"
verdiQtPrefEnv -setCurPg "Schematics.RTL"
verdiQtPrefEnv -setCurPg "Schematics.Miscellaneous"
verdiQtPrefEnv -setCurPg "Schematics.Display Options"
verdiQtPrefEnv -cancel
verdiWindowResize -win $_Verdi_1 "353" "110" "1440" "827"
wvSetCursor -win $_nWave4 432.362593 -snap {("G1" 4)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 447.871251 -snap {("G1" 3)}
wvSetCursor -win $_nWave4 468.549462 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 494.397226 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 516.015356 -snap {("G1" 3)}
wvSetCursor -win $_nWave4 312.522961 -snap {("G2" 0)}
wvZoomIn -win $_nWave4
verdiWindowResize -win $_Verdi_1 "64" "188" "1440" "827"
verdiWindowResize -win $_Verdi_1 "99" "75" "1440" "827"
verdiWindowResize -win $_Verdi_1 "99" "75" "1440" "645"
verdiWindowResize -win $_Verdi_1 "99" "75" "1440" "685"
wvSetCursor -win $_nWave4 388.863206 -snap {("G1" 3)}
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "ALUControlD\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUControlE\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 6 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 6 )} 
wvSetRadix -win $_nWave4 -format Bin
schSelect -win $_nSchema3 -signal "ALUControlD\[4:0\]"
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
schZoom {-419} {-5011} {5582} {4364} -win $_nSchema3
schSelect -win $_nSchema3 -port "ALUControlD\[4:0\]"
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_controller" "ALUControl\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -inst "u_controller"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -port "ALUControl\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "adec" "ALUControl\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 6 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 5)}
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 )} 
wvSelectSignal -win $_nWave4 {( "G1" 5 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 1)}
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {24086} {-10292} {82489} {43711} -win $_nSchema3
schZoom {21621} {14346} {64505} {38197} -win $_nSchema3
schFit -win $_nSchema3
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_controller" "opcode\[6:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema3 -instport "u_controller" "opcode\[6:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSetRadix -win $_nWave4 -format Bin
wvSetCursor -win $_nWave4 717.365420 -snap {("G2" 0)}
wvZoomAll -win $_nWave4
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {19864} {-838} {63068} {40130} -win $_nSchema3
schSelect -win $_nSchema3 -signal "PC_nextF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schZoom {29182} {18622} {49306} {34156} -win $_nSchema3
schSelect -win $_nSchema3 -signal "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 729.387148 -snap {("G1" 5)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 745.165434 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 307.676585 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 332.061209 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 349.273885 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 369.355340 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 384.416432 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 404.497887 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 460.439085 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 499.167606 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 619.656338 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 739.427876 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 768.832864 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 730.821538 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 746.599824 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 768.115669 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 786.045540 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 813.298944 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 830.511620 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 848.441491 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 728.669953 -snap {("G1" 5)}
wvSetCursor -win $_nWave4 509.925528 -snap {("G1" 5)}
verdiSetActWin -win $_nSchema_3
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -signal "ResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 428.165317 -snap {("G1" 6)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 512.794308 -snap {("G1" 6)}
wvSetCursor -win $_nWave4 730.821538 -snap {("G1" 6)}
wvSetCursor -win $_nWave4 593.120129 -snap {("G1" 6)}
wvSetCursor -win $_nWave4 611.767195 -snap {("G1" 6)}
wvSetCursor -win $_nWave4 826.208451 -snap {("G1" 6)}
wvSetCursor -win $_nWave4 847.724296 -snap {("G1" 6)}
wvSetCursor -win $_nWave4 865.654167 -snap {("G1" 6)}
wvSetCursor -win $_nWave4 759.509331 -snap {("G1" 6)}
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 4 5 6 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
schSelect -win $_nSchema3 -signal "clk"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -instport "rf" "clk"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "rf" "we"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "rf" "ra1\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "rf" "ra2\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "rf" "wa\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "rf" "wd\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 3 )} 
wvSelectSignal -win $_nWave4 {( "G1" 3 4 5 6 )} 
wvSelectSignal -win $_nWave4 {( "G1" 3 4 5 6 )} 
wvSetRadix -win $_nWave4 -format Bin
schSelect -win $_nSchema3 -signal "RegWriteW"
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
schZoom {9169} {-11295} {168757} {48009} -win $_nSchema3
schZoom {11944} {-7325} {39320} {21439} -win $_nSchema3
schSelect -win $_nSchema3 -signal "RegWriteM"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schZoom {46040} {-552} {82489} {25806} -win $_nSchema3
schSelect -win $_nSchema3 -signal "RegWriteE"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schFit -win $_nSchema3
schZoomOut -win $_nSchema3
schZoom {40763} {-11582} {105499} {37409} -win $_nSchema3
schZoom {81604} {-3519} {94639} {19649} -win $_nSchema3
schSelect -win $_nSchema3 -signal "RegWriteD"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -toggle -signal "RegWriteE"
schFit -win $_nSchema3
schZoom {54625} {10908} {74608} {38984} -win $_nSchema3
schSelect -win $_nSchema3 -signal "ResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "RegWriteW"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
verdiSetActWin -win $_nWave4
wvScrollDown -win $_nWave4 0
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 1
verdiSetActWin -win $_nSchema_3
schDeselectAll -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSetCursor -win $_nWave4 413.465786 -snap {("G1" 10)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 427.045070 -snap {("G1" 10)}
wvSetCursor -win $_nWave4 492.131984 -snap {("G1" 11)}
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 1
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvScrollDown -win $_nWave4 5
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 6 7 8 9 10 11 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 1)}
wvSetCursor -win $_nWave4 143.753110 -snap {("G2" 0)}
schSelect -win $_nSchema3 -signal "ResultW\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 412.061033 -snap {("G1" 2)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 432.664085 -snap {("G1" 2)}
wvSetCursor -win $_nWave4 453.735387 -snap {("G1" 2)}
wvSetCursor -win $_nWave4 469.187676 -snap {("G1" 2)}
wvSetCursor -win $_nWave4 412.529284 -snap {("G1" 2)}
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "SrcAE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "SrcBE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiSetActWin -win $_nSchema_3
schZoom {55392} {19996} {71424} {37251} -win $_nSchema3
schDeselectAll -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
schZoom {115842} {-1411} {140892} {30246} -win $_nSchema3
schSelect -win $_nSchema3 -signal "RD2E_w2\[31:0\]"
schSelect -win $_nSchema3 -signal "RD2E_w\[31:0\]"
schSelect -win $_nSchema3 -toggle -signal "ForwardBE\[1:0\]"
schSelect -win $_nSchema3 -toggle -signal "ALUResultM\[31:0\]"
schFit -win $_nSchema3
schDeselectAll -win $_nSchema3
schZoom {123864} {165} {144833} {25949} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_ALU" "result\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUControlE\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 333.394836 -snap {("G1" 7)}
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 4 5 6 7 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema3 -signal "SrcAE\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "SrcBE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUControlE\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 3 )} 
wvSetRadix -win $_nWave4 -format Bin
schSelect -win $_nSchema3 -signal "ALUResultE\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 374.600939 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 420.957805 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 443.902113 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 381.624707 -snap {("G1" 4)}
wvSetCursor -win $_nWave4 379.283451 -snap {("G1" 4)}
wvZoomIn -win $_nWave4
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schFit -win $_nSchema3
schFit -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
verdiSetActWin -win $_nWave4
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {11514} {933} {29624} {23701} -win $_nSchema3
schSelect -win $_nSchema3 -signal "RegWriteW"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "RdW\[4:0\]"
wvSetCursor -win $_nWave4 386.191315 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 3 )} 
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "datapath\(@1\):SigOp3:832:832:Combo"
schPushViewIn -win $_nSchema3
srcSetScope "cpu_tb.CPU.icpu.i_datapath" -delim "." -win $_nTrace1
srcSelect -win $_nTrace1 -range {832 832 1 16 1 1}
verdiSetActWin -win $_nWave4
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {125 125 4 5 1 1}
srcHBSelect "cpu_tb.CPU.icpu" -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU.icpu"
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -inst "i_datapath"
schPushViewIn -win $_nSchema5
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_5
schZoom {154695} {10988} {172239} {32369} -win $_nSchema5
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nSchema_5
