verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "run.f"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 -10 "83" "791" "752"
verdiWindowResize -win $_Verdi_1 "773" "109" "791" "715"
verdiWindowResize -win $_Verdi_1 "773" "71" "791" "752"
verdiShowWindow -win $_Verdi_1 -switchFS
srcDeselectAll -win $_nTrace1
verdiShowWindow -win $_Verdi_1 -switchFS
verdiWindowResize -win $_Verdi_1 "1556" "150" "791" "752"
verdiWindowResize -win $_Verdi_1 "1556" "150" "1440" "1723"
verdiWindowResize -win $_Verdi_1 "368" "150" "2628" "1723"
srcTBBTreeSelect -win $_nTrace1 -path "riscvpipeline"
verdiSetActWin -dock widgetDock_<Decl._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "flopr"
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -inst "flopr\(@1\):Always0:14:21:Reg"
schPushViewIn -win $_nSchema2
srcSelect -win $_nTrace1 -range {14 21 1 3 1 1}
verdiSetActWin -dock widgetDock_<Decl._Tree>
srcTBBTreeSelect -win $_nTrace1 -path "riscvpipeline"
srcTBBTreeSelect -win $_nTrace1 -path "riscvpipeline"
srcTBBTreeSelect -win $_nTrace1 -path "riscvpipeline"
srcTBTreeAction -win $_nTrace1 -path "riscvpipeline"
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU.icpu"
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schPopViewUp -win $_nSchema3
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/01.RV32I_Integrated_Test_partial_type/sim/func_sim/wave.fsdb}
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/cpu_tb"
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema3 -port "PC\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {41477} {13201} {58676} {47165} -win $_nSchema3
schSelect -win $_nSchema3 -signal "Instr\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "FlushD"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCSrc\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "JalrD"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 25.886768 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvZoomAll -win $_nWave4
wvSetCursor -win $_nWave4 722.156689 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 450.945251 -snap {("G2" 0)}
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomOut -win $_nWave4
verdiWindowResize -win $_Verdi_1 "179" "71" "1920" "1016"
verdiWindowResize -win $_Verdi_1 "368" "150" "2628" "1723"
wvSetCursor -win $_nWave4 1006.291993 -snap {("G2" 0)}
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
schPopViewUp -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
debReload
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -port "Instr\[31:0\]"
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "imem"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -port "q0\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -port "q1\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -port "addr0\[11:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -port "d0\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -port "wbe0\[3:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -port "wen0"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -port "addr0\[11:0\]"
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -instport "icpu" "PC\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -port "PC\[31:0\]"
schSelect -win $_nSchema3 -instport "i_datapath" "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {21384} {18625} {40320} {40408} -win $_nSchema3
schSelect -win $_nSchema3 -signal "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PC_nextF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 1)}
verdiWindowResize -win $_Verdi_1 -82 "216" "2541" "1723"
schSelect -win $_nSchema3 -signal "PCPlus4F\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PC_targetE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCSrc\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCPlus4F\[31:0\]"
schSelect -win $_nSchema3 -toggle -signal "PC_targetE\[31:0\]"
schSelect -win $_nSchema3 -toggle -signal "ALUResultE\[31:0\]"
schSelect -win $_nSchema3 -toggle -signal "PCSrc\[1:0\]"
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
schSelect -win $_nSchema3 -signal "PCSrc\[1:0\]"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "PCSrc\[1:0\]"
schFit -win $_nSchema3
schZoom {160128} {15870} {174657} {30186} -win $_nSchema3
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -inst "datapath\(@1\):SigOp3:832:832:Combo"
schSelect -win $_nSchema3 -inst "datapath\(@1\):SigOp3:832:832:Combo"
schPushViewIn -win $_nSchema3
srcSetScope "cpu_tb.CPU.icpu.i_datapath" -delim "." -win $_nTrace1
srcSelect -win $_nTrace1 -range {832 832 1 16 1 1}
verdiSetActWin -win $_nWave4
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU.icpu.i_datapath"
verdiSetActWin -win $_nSchema_5
wvSetCursor -win $_nWave4 3850.744823 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_5
schZoom {132181} {-430} {148420} {22942} -win $_nSchema5
wvSetCursor -win $_nWave4 3672.296131 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -signal "JalE"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema5 -signal "JalE"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "JalrE"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -instport "u_ID_EX" "JalrE"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -instport "u_ID_EX" "JalrD"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "JalrD"
schSelect -win $_nSchema5 -port "JalrD"
schPopViewUp -win $_nSchema5
schSelect -win $_nSchema5 -instport "u_controller" "Jalr"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -inst "u_controller"
schPushViewIn -win $_nSchema5
schSelect -win $_nSchema5 -port "Branch"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "Jalr"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
schSelect -win $_nSchema5 -port "Btaken"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "Jal"
schSelect -win $_nSchema5 -port "Jalr"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema5 -signal "funct3\[2:0\]"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "opcode\[6:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -port "funct7\[6:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -port "opcode\[6:0\]"
schPopViewUp -win $_nSchema5
wvSelectSignal -win $_nWave4 {( "G1" 5 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 5 6 7 8 9 10 11 12 13 14 15 16 17 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 4)}
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
schSelect -win $_nSchema5 -instport "i_datapath" "Instr\[31:0\]"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -port "Instr\[31:0\]"
schPopViewUp -win $_nSchema5
schSelect -win $_nSchema5 -signal "PC\[13:2\]"
schSelect -win $_nSchema5 -inst "icpu"
schPushViewIn -win $_nSchema5
schSelect -win $_nSchema5 -inst "i_datapath"
schPushViewIn -win $_nSchema5
schZoom {11333} {10695} {50135} {39673} -win $_nSchema5
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
verdiSetActWin -win $_nWave4
schSelect -win $_nSchema5 -signal "PC_targetE\[31:0\]"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 3929.568515 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 3815.533121 -snap {("G2" 0)}
schSelect -win $_nSchema5 -signal "PCE\[31:0\]"
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -signal "lwStall"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "PC_nextF\[31:0\]"
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
wvZoom -win $_nWave4 221.650495 873.563714
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -signal "PCSrc\[1:0\]"
schFit -win $_nSchema5
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 3621.439111 -snap {("G1" 7)}
wvSetCursor -win $_nWave4 228.751692 -snap {("G1" 7)}
wvSetCursor -win $_nWave4 211.871797 -snap {("G1" 8)}
wvSetCursor -win $_nWave4 314.315303 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 477.875673 -snap {("G2" 0)}
wvSetCursor -win $_nWave4 607.676252 -snap {("G1" 1)}
schSelect -win $_nSchema5 -toggle -signal "PCPlus4F\[31:0\]"
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -toggle -signal "PC_targetE\[31:0\]"
schSelect -win $_nSchema5 -toggle -signal "ImmExtE\[31:0\]"
schDeselectAll -win $_nSchema5
schSelect -win $_nSchema5 -signal "ImmExtE\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_5
schZoom {81158} {-8452} {102439} {33550} -win $_nSchema5
schSelect -win $_nSchema5 -signal "ImmExtD\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "InstrD\[31:7\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "ImmSrcD\[2:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
debReload
schSelect -win $_nSchema5 -signal "InstrD\[11:7\]"
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -signal "PCF\[31:0\]"
schSelect -win $_nSchema5 -signal "PC_nextF\[31:0\]"
verdiSetActWin -win $_nWave4
schSelect -win $_nSchema5 -signal "InstrD\[31:0\]"
verdiSetActWin -win $_nSchema_5
schDeselectAll -win $_nSchema5
schSelect -win $_nSchema5 -signal "FlushD"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "n_rst"
schSelect -win $_nSchema5 -signal "n_rst"
schSelect -win $_nSchema5 -signal "n_rst"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
schSelect -win $_nSchema5 -signal "InstrD\[31:0\]"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 11 )} 
verdiSetActWin -win $_nWave4
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 0)}
wvSetPosition -win $_nWave4 {("G1" 14)}
wvSelectSignal -win $_nWave4 {( "G1" 14 )} 
wvSetPosition -win $_nWave4 {("G1" 13)}
wvSetPosition -win $_nWave4 {("G1" 12)}
wvSetPosition -win $_nWave4 {("G1" 11)}
wvSetPosition -win $_nWave4 {("G1" 10)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 10)}
wvSetPosition -win $_nWave4 {("G1" 11)}
wvSetCursor -win $_nWave4 392.140085 -snap {("G2" 0)}
schSelect -win $_nSchema5 -signal "lwStall"
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -signal "lwStall"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
schSelect -win $_nSchema5 -signal "clk"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema5 -signal "clk"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "PC_nextF\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "PCSrc\[1:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "PC_targetE\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "PCPlus4F\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "lwStall"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "InstrD\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 6 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 6 7 8 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 6 7 8 9 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 1)}
schSelect -win $_nSchema5 -signal "PCSrc\[1:0\]"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "PC_nextF\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "SrcAE\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "SrcBE\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "ALUResultE\[31:0\]"
schSelect -win $_nSchema5 -signal "ALUControlE\[4:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "Rs1E\[4:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "Rs2E\[4:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "InstrD\[19:15\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "InstrD\[24:20\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -instport "u_hazard_unit" "Rs1D\[4:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -instport "u_hazard_unit" "Rs2D\[4:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 10 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 10 11 12 13 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 9)}
schSelect -win $_nSchema5 -signal "FlushE"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schDeselectAll -win $_nSchema5
schSelect -win $_nSchema5 -signal "FlushD"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "lwStall"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 6 7 8 9 10 11 12 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 1)}
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -signal "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -signal "n_rst"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiWindowResize -win $_Verdi_1 "894" "723" "1729" "1110"
schDeselectAll -win $_nSchema5
verdiSetActWin -win $_nSchema_5
wvSetCursor -win $_nWave4 628.906776 -snap {("G1" 3)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 1132.737367
wvZoomAll -win $_nWave4
verdiSetActWin -win $_nSchema_5
schZoom {25027} {20484} {51639} {41817} -win $_nSchema5
schZoom {9863} {24625} {30774} {36423} -win $_nSchema5
schSelect -win $_nSchema5 -signal "PCE\[31:0\]"
wvSetCursor -win $_nWave4 477.488573 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 502.473440 -snap {("G2" 0)}
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
schDeselectAll -win $_nSchema5
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -signal "PCE\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 1979.171170 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -instport "u_IF_ID" "PCD\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema5 -inst "u_IF_ID"
verdiSetActWin -win $_nSchema_5
schFit -win $_nSchema5
schZoom {33287} {21818} {57414} {44233} -win $_nSchema5
schZoom {25383} {32544} {33746} {43675} -win $_nSchema5
schSelect -win $_nSchema5 -signal "PCE\[31:0\]"
schZoom {19845} {37368} {24195} {42317} -win $_nSchema5
schFit -win $_nSchema5
schZoom {39411} {11926} {69416} {44233} -win $_nSchema5
schSelect -win $_nSchema5 -signal "PCF\[31:0\]"
schSelect -win $_nSchema5 -signal "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
wvSetCursor -win $_nWave4 1975.048255 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 3990.181555 -snap {("G2" 0)}
schDeselectAll -win $_nSchema5
verdiSetActWin -win $_nSchema_5
verdiSetActWin -win $_nWave4
wvZoomAll -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
schZoomOut -win $_nSchema5 -pos 53806 22136
schZoomOut -win $_nSchema5 -pos 53806 22136
verdiSetActWin -win $_nSchema_5
schZoomIn -win $_nSchema5 -pos 63389 16956
schZoomIn -win $_nSchema5 -pos 63389 16956
schZoomIn -win $_nSchema5 -pos 108121 19026
schZoomIn -win $_nSchema5 -pos 108121 19026
schSelect -win $_nSchema5 -inst "u_ID_EX"
schPushViewIn -win $_nSchema5
schZoomIn -win $_nSchema5 -pos 10431 14747
schZoomIn -win $_nSchema5 -pos 10431 14746
schZoomIn -win $_nSchema5 -pos 10431 14746
schZoomOut -win $_nSchema5 -pos 10430 14746
schZoomOut -win $_nSchema5 -pos 10429 14745
schZoomIn -win $_nSchema5 -pos 7072 11276
schSelect -win $_nSchema5 -port "JalD"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
schSelect -win $_nSchema5 -port "JalrD"
verdiSetActWin -win $_nSchema_5
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
schSelect -win $_nSchema5 -port "InstrD\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema5 -toggle -port "InstrE\[31:0\]"
schAddSelectedToWave -win $_nSchema5 -clipboard
wvDrop -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_5
debExit
