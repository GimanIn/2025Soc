verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "run.f"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "isa_testbench" -win $_nTrace1
srcSetScope "isa_testbench" -delim "." -win $_nTrace1
srcHBSelect "isa_testbench" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "isa_testbench.CPU" -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "isa_testbench"
verdiSetActWin -win $_nSchema_2
verdiQtPrefEnv -show
schResetDisplayAttr -default
schResetDisplayAttr -white
schResetDisplayAttr -black
schResetDisplayAttr -default
verdiQtPrefEnv -setCurPg "Simulation"
verdiQtPrefEnv -setCurPg "Schematics"
verdiQtPrefEnv -setCurPg "Schematics.Display Options"
schSetPreference -portName on -pinName on -stickyLocator on -selectionToolbar on \
           -instName on -localNetName on -completeName on -parameterList on \
           -highContrastMode on
srcSetPreference -cfiletype \
           {Source files (*.v; *.vlg; *.vl; *.vr; *.vrh; *.sv; *.svh; *.ova; *.vhd; *.vhdl; *.psl; *.vu; *.e;*.c; *.cpp; *.cxx; *.cc; *.h; *.hpp; *.hxx; *.hh; *.tcl; *.tk; *.do; *.upf; *.cpf);;HDL files (*.v; *.vlg; *.vl; *.vr; *.vrh; *.sv; *.svh; *.ova; *.vhd; *.vhdl; *.psl; *.vu; *.e);;C/C++ files (*.c; *.cpp; *.cxx; *.cc; *.h; *.hpp; *.hxx; *.hh);;Tcl files (*.tcl; *.tk; *.do);;Power files (*.upf;*.cpf) }
srcSetPreference -profileTime off
simSetInteractiveFsdbFile inter.fsdb
simSetNoAppendOption on
simSetSvtbMode on
verdiQtPrefEnv -ok
schSelect -win $_nSchema2 -inst "CPU"
schPushViewIn -win $_nSchema2
schSelect -win $_nSchema2 -inst "icpu"
schPushViewIn -win $_nSchema2
schCreateWindow -delim "." -win $_nSchema1 -scope "isa_testbench"
verdiSetActWin -win $_nSchema_3
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/11.RV32I_isa_tests/sim/func_sim/wave.fsdb}
schSelect -win $_nSchema3 -inst "CPU"
schPushViewIn -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "imem"
schPushViewIn -win $_nSchema3
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {17827} {11609} {57094} {38454} -win $_nSchema3
schSelect -win $_nSchema3 -instport "rf" "clk"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCD\[31:0\]"
schSelect -win $_nSchema3 -signal "PCE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "Instr\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "lwStall"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "FlushE"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -port "MemWriteM"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -port "WriteData_d\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schFit -win $_nSchema3
schZoom {75032} {4001} {93394} {35009} -win $_nSchema3
schSelect -win $_nSchema3 -signal "ForwardAE\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ForwardBE\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvZoomAll -win $_nWave4
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_3
wvSetCursor -win $_nWave4 2788.809196 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
debExit
