verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "run.f"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
schCreateWindow -delim "." -win $_nSchema1 -scope "flopr"
verdiSetActWin -win $_nSchema_2
verdiQtPrefEnv -show
verdiQtPrefEnv -setCurPg "Schematics.Display Options"
schSetPreference -portName on -pinName on -pinNameOldLayout on \
           -boundaryCellNameDown on -stickyLocator on -selectionToolbar on \
           -instName on -localNetName on -completeName on -parameterList on \
           -highContrastMode on -modulePortName on
srcSetPreference -cfiletype \
           {Source files (*.v; *.vlg; *.vl; *.vr; *.vrh; *.sv; *.svh; *.ova; *.vhd; *.vhdl; *.psl; *.vu; *.e;*.c; *.cpp; *.cxx; *.cc; *.h; *.hpp; *.hxx; *.hh; *.tcl; *.tk; *.do; *.upf; *.cpf);;HDL files (*.v; *.vlg; *.vl; *.vr; *.vrh; *.sv; *.svh; *.ova; *.vhd; *.vhdl; *.psl; *.vu; *.e);;C/C++ files (*.c; *.cpp; *.cxx; *.cc; *.h; *.hpp; *.hxx; *.hh);;Tcl files (*.tcl; *.tk; *.do);;Power files (*.upf;*.cpf) }
srcSetPreference -profileTime off
simSetInteractiveFsdbFile inter.fsdb
simSetNoAppendOption on
simSetSvtbMode on
verdiQtPrefEnv -apply
verdiQtPrefEnv -ok
schSelect -win $_nSchema2 -inst "flopr\(@1\):Always0:14:21:Reg"
schPushViewIn -win $_nSchema2
srcSelect -win $_nTrace1 -range {14 21 1 3 1 1}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
schCreateWindow -delim "." -win $_nSchema1 -scope "flopr"
verdiSetActWin -win $_nSchema_3
srcHBSelect "flopr" -win $_nTrace1
srcSetScope "flopr" -delim "." -win $_nTrace1
srcHBSelect "flopr" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "cpu_tb" -win $_nTrace1
srcSetScope "cpu_tb" -delim "." -win $_nTrace1
srcHBSelect "cpu_tb" -win $_nTrace1
srcHBSelect "cpu_tb.check_result_dmem" -win $_nTrace1
srcHBSelect "cpu_tb.check_result_dmem" -win $_nTrace1
srcHBSelect "cpu_tb.CPU" -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb"
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -inst "CPU"
schPushViewIn -win $_nSchema4
schSelect -win $_nSchema4 -inst "icpu"
schPushViewIn -win $_nSchema4
schSelect -win $_nSchema4 -inst "i_datapath"
schPushViewIn -win $_nSchema4
schZoom {112078} {-5312} {148872} {36535} -win $_nSchema4
schZoom {118682} {5232} {142268} {25743} -win $_nSchema4
schZoom {129541} {7130} {142015} {20170} -win $_nSchema4
schSelect -win $_nSchema4 -signal "N_flagE"
wvCreateWindow
verdiSetActWin -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 0)}
wvOpenFile -win $_nWave5 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/03.RV32I_Integrated_Test_update/sim/func_sim/wave.fsdb}
schSelect -win $_nSchema4 -signal "N_flagE"
verdiSetActWin -win $_nSchema_4
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schSelect -win $_nSchema4 -signal "V_flagE"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvZoomAll -win $_nWave5
verdiSetActWin -win $_nWave5
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -signal "N_flagE"
schSelect -win $_nSchema4 -inst "u_branch_logic"
schSelect -win $_nSchema4 -instport "u_branch_logic" "PCSrc\[1:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvSetCursor -win $_nWave5 482.761307 -snap {("G2" 0)}
verdiSetActWin -win $_nWave5
wvZoomAll -win $_nWave5
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -instport "u_branch_logic" "jalE"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schSelect -win $_nSchema4 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nWave5
viaOneSearchClose
schSelect -win $_nSchema4 -instport "u_ALU" "ALUControl\[4:0\]"
verdiSetActWin -win $_nSchema_4
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schFit -win $_nSchema4
schPopViewUp -win $_nSchema4
schZoom {11309} {2542} {18948} {13620} -win $_nSchema4
schFit -win $_nSchema4
schPopViewUp -win $_nSchema4
schSelect -win $_nSchema4 -inst "icpu"
schSelect -win $_nSchema4 -inst "icpu"
schPushViewIn -win $_nSchema4
schSelect -win $_nSchema4 -inst "u_controller"
schPushViewIn -win $_nSchema4
schSelect -win $_nSchema4 -instport "adec" "ALUop\[1:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nWave5
debReload
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvSelectSignal -win $_nWave5 {( "G1" 1 )} 
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 1 2 3 4 5 6 )} 
wvSelectSignal -win $_nWave5 {( "G1" 1 2 3 4 5 6 7 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 0)}
schPopViewUp -win $_nSchema4
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -inst "i_datapath"
schPushViewIn -win $_nSchema4
schZoom {8364} {2626} {47208} {30307} -win $_nSchema4
schZoom {6802} {5088} {23783} {16794} -win $_nSchema4
schSelect -win $_nSchema4 -instport "u_MEM_WB" "RegWriteW"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schSelect -win $_nSchema4 -signal "ResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schFit -win $_nSchema4
schZoom {12750} {-9747} {87055} {37705} -win $_nSchema4
schZoom {23234} {194} {65239} {27014} -win $_nSchema4
schSelect -win $_nSchema4 -signal "RdW\[4:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvSetCursor -win $_nWave5 875.049046 -snap {("G2" 0)}
verdiSetActWin -win $_nWave5
wvZoomAll -win $_nWave5
wvZoomAll -win $_nWave5
wvSetCursor -win $_nWave5 646.744650 -snap {("G2" 0)}
verdiSetActWin -win $_nSchema_4
schPopViewUp -win $_nSchema4
schZoom {-1967} {-2018} {17856} {15133} -win $_nSchema4
schZoom {1838} {5063} {8682} {11086} -win $_nSchema4
schSelect -win $_nSchema4 -instport "u_controller" "funct3\[2:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSetRadix -win $_nWave5 -format Bin
wvSetCursor -win $_nWave5 354.826027 -snap {("G2" 0)}
schFit -win $_nSchema4
verdiSetActWin -win $_nSchema_4
schZoom {4142} {6311} {17206} {14560} -win $_nSchema4
schSelect -win $_nSchema4 -instport "u_controller" "ALUControl\[4:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSetRadix -win $_nWave5 -format Bin
wvZoomIn -win $_nWave5
schDeselectAll -win $_nSchema4
verdiSetActWin -win $_nSchema_4
wvSetCursor -win $_nWave5 658.711683 -snap {("G1" 5)}
verdiSetActWin -win $_nWave5
wvSetCursor -win $_nWave5 638.766628 -snap {("G2" 0)}
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -inst "i_datapath"
schPushViewIn -win $_nSchema4
schZoom {122697} {5841} {147999} {24576} -win $_nSchema4
schSelect -win $_nSchema4 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvSetCursor -win $_nWave5 634.917582 -snap {("G1" 6)}
verdiSetActWin -win $_nWave5
wvSetCursor -win $_nWave5 624.770098 -snap {("G2" 0)}
wvZoomAll -win $_nWave5
wvZoomIn -win $_nWave5
wvSetCursor -win $_nWave5 898.752169 -snap {("G1" 6)}
wvSetCursor -win $_nWave5 874.258242 -snap {("G1" 6)}
schSelect -win $_nSchema4 -instport "u_ALU" "ALUControl\[4:0\]"
verdiSetActWin -win $_nSchema_4
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 5)}
verdiSetActWin -win $_nWave5
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetCursor -win $_nWave5 26.396789
schSelect -win $_nSchema4 -signal "ALUControlE\[4:0\]"
verdiSetActWin -win $_nSchema_4
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSetCursor -win $_nWave5 325.244361 -snap {("G2" 0)}
wvSelectSignal -win $_nWave5 {( "G1" 7 )} 
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSetCursor -win $_nWave5 380.880567 -snap {("G2" 0)}
wvZoomOut -win $_nWave5
wvSetCursor -win $_nWave5 367.408907 -snap {("G2" 0)}
wvSetCursor -win $_nWave5 367.408907 -snap {("G2" 0)}
wvSetCursor -win $_nWave5 818.097166 -snap {("G1" 2)}
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -signal "BE_RD\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 8)}
verdiSetActWin -win $_nWave5
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetCursor -win $_nWave5 792.203586 -snap {("G1" 8)}
schSelect -win $_nSchema4 -instport "u_BE_logic" "WD\[31:0\]"
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -instport "u_BE_logic" "WD\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schZoom {25594} {18820} {29923} {23374} -win $_nSchema4
schSelect -win $_nSchema4 -instport "u_BE_logic" "RD\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schSelect -win $_nSchema4 -instport "u_BE_logic" "funct3\[2:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schSelect -win $_nSchema4 -instport "u_BE_logic" "AddrLast2\[1:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schFit -win $_nSchema4
schZoom {19432} {10585} {44065} {28189} -win $_nSchema4
wvSetCursor -win $_nWave5 454.887218 -snap {("G1" 8)}
verdiSetActWin -win $_nWave5
wvSetCursor -win $_nWave5 312.122614 -snap {("G1" 8)}
wvSetCursor -win $_nWave5 450.688259 -snap {("G1" 8)}
wvSelectSignal -win $_nWave5 {( "G1" 8 )} 
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
wvSelectSignal -win $_nWave5 {( "G1" 8 )} 
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvSelectSignal -win $_nWave5 {( "G1" 9 )} 
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSetRadix -win $_nWave5 -format Bin
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSetRadix -win $_nWave5 -format Bin
wvZoomIn -win $_nWave5
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 8 )} 
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSelectSignal -win $_nWave5 {( "G1" 7 )} 
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSetCursor -win $_nWave5 349.756680 -snap {("G1" 4)}
wvSetCursor -win $_nWave5 369.418219 -snap {("G1" 4)}
wvSetCursor -win $_nWave5 346.997166 -snap {("G1" 4)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvScrollUp -win $_nWave5 3
wvSelectSignal -win $_nWave5 {( "G1" 1 )} 
wvScrollDown -win $_nWave5 3
wvSelectSignal -win $_nWave5 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 0)}
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -signal "SrcAE\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schSelect -win $_nSchema4 -signal "SrcBE\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schSelect -win $_nSchema4 -signal "ALUControlE\[4:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
schSelect -win $_nSchema4 -instpin "u_ALU" "result\[31:0\]"
schSelect -win $_nSchema4 -instport "u_ALU" "result\[31:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
wvSetCursor -win $_nWave5 429.437652 -snap {("G2" 0)}
verdiSetActWin -win $_nWave5
wvSetCursor -win $_nWave5 414.950202 -snap {("G2" 0)}
wvSetCursor -win $_nWave5 453.928340 -snap {("G2" 0)}
schPopViewUp -win $_nSchema4
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -inst "u_controller"
schPushViewIn -win $_nSchema4
schSelect -win $_nSchema4 -port "ALUControl\[4:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSetRadix -win $_nWave5 -format Bin
schSelect -win $_nSchema4 -signal "opcode\[6:0\]"
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -instport "adec" "opcode\[6:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSetRadix -win $_nWave5 -format Bin
schSelect -win $_nSchema4 -instport "adec" "funct3\[2:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nSchema_4
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 7 )} 
wvSetRadix -win $_nWave5 -format Bin
schSelect -win $_nSchema4 -instport "adec" "funct7"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nSchema_4
schSelect -win $_nSchema4 -instport "adec" "ALUop\[1:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 9 )} 
wvSetRadix -win $_nWave5 -format Bin
wvSelectSignal -win $_nWave5 {( "G1" 8 )} 
verdiSetActWin -win $_nSchema_4
schZoom {10377} {-2466} {20143} {8687} -win $_nSchema4
schSelect -win $_nSchema4 -signal "funct7\[6:0\]"
schAddSelectedToWave -win $_nSchema4 -clipboard
wvDrop -win $_nWave5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 10 )} 
wvSetRadix -win $_nWave5 -format Bin
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
wvScrollDown -win $_nWave5 1
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
debExit
