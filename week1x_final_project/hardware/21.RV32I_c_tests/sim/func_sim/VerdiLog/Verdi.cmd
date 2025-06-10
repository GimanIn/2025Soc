verdiSetActWin -dock widgetDock_<Message>
debImport "-f" "run.f"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "221" "129" "900" "700"
verdiWindowResize -win $_Verdi_1 "221" "129" "900" "700"
verdiWindowResize -win $_Verdi_1 "221" "129" "1547" "886"
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "c_tests_tb" -win $_nTrace1
srcSetScope "c_tests_tb" -delim "." -win $_nTrace1
srcHBSelect "c_tests_tb" -win $_nTrace1
schCreateWindow -delim "." -win $_nSchema1 -scope "c_tests_tb"
verdiSetActWin -win $_nSchema_2
verdiQtPrefEnv -show
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
verdiQtPrefEnv -apply
verdiQtPrefEnv -ok
verdiSetActWin -dock widgetDock_<Message>
schSelect -win $_nSchema2 -inst "CPU"
schPushViewIn -win $_nSchema2
verdiSetActWin -win $_nSchema_2
verdiWindowResize -win $_Verdi_1 "221" "62" "1613" "953"
schSelect -win $_nSchema2 -inst "icpu"
schPushViewIn -win $_nSchema2
schSelect -win $_nSchema2 -inst "i_datapath"
schPushViewIn -win $_nSchema2
schZoom {33551} {-20309} {122225} {49925} -win $_nSchema2
schZoom {73456} {-7594} {103882} {36968} -win $_nSchema2
schZoom {19446} {3470} {51671} {31897} -win $_nSchema2
schSelect -win $_nSchema2 -signal "BE_RD\[31:0\]"
wvCreateWindow
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/21.RV32I_c_tests/sim/func_sim/wave.fsdb}
schSelect -win $_nSchema2 -signal "BE_RD\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
verdiSetActWin -win $_nSchema_2
wvSetCursor -win $_nWave3 1157.881899 -snap {("G1" 1)}
verdiSetActWin -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
verdiSetActWin -win $_nSchema_2
schZoom {19761} {11802} {37439} {25906} -win $_nSchema2
schSelect -win $_nSchema2 -signal "WriteDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "ReadDataW\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "InstrM\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "ALUResultM\[1:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
verdiSetActWin -win $_nWave3
wvScrollUp -win $_nWave3 2
wvScrollDown -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
schSelect -win $_nSchema2 -signal "ReadDataW\[31:0\]"
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -signal "ReadDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schFit -win $_nSchema2
schSelect -win $_nSchema2 -port "ReadDataM\[31:0\]"
schPopViewUp -win $_nSchema2
schSelect -win $_nSchema2 -port "ReadData\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -port "ReadData\[31:0\]"
schPopViewUp -win $_nSchema2
schZoom {28686} {-1546} {52120} {23720} -win $_nSchema2
schSelect -win $_nSchema2 -instport "data_multiplexer" "read_data\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schZoom {30428} {1136} {39875} {17176} -win $_nSchema2
schSelect -win $_nSchema2 -signal "cs_dmem_n"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "ReadData_dmem\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "imem" "q1\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "PC\[13:2\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "1'b0"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "WriteData_d\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "DataAdr\[13:2\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "_ExprNet__:imem:0:wen1"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schZoom {19437} {2207} {24027} {7554} -win $_nSchema2
schFit -win $_nSchema2
schZoom {10598} {-5350} {40536} {9049} -win $_nSchema2
schSelect -win $_nSchema2 -signal "_ExprNet__:imem:0:wen1"
schSelect -win $_nSchema2 -signal "MemWriteM"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "_ExprNet__:imem:0:wen1"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "imem" "wen1"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "ByteEnable\[3:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "clk"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "imem" "q1\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schZoom {22589} {8504} {26108} {14068} -win $_nSchema2
schFit -win $_nSchema2
schZoom {20221} {-3267} {28329} {16837} -win $_nSchema2
wvSelectSignal -win $_nWave3 {( "G1" 14 )} 
verdiSetActWin -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 14 15 16 17 18 19 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 13)}
wvSelectSignal -win $_nWave3 {( "G1" 10 )} 
wvSelectSignal -win $_nWave3 {( "G1" 10 11 12 13 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 9)}
wvSelectSignal -win $_nWave3 {( "G1" 5 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 7 8 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 3 4 5 6 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 2 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
schSelect -win $_nSchema2 -signal "WriteData_d\[31:0\]"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "DataAdr\[13:2\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "_ExprNet__:imem:0:wen1"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "MemWriteM"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "cs_dmem_n"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "_ExprNet__:imem:0:wen1"
schSelect -win $_nSchema2 -instport "imem" "wen1"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "ReadData_dmem\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "imem" "q1\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schDeselectAll -win $_nSchema2
wvSetCursor -win $_nWave3 1018.151915 -snap {("G1" 5)}
wvScrollDown -win $_nWave3 1
verdiSetActWin -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
verdiSetActWin -win $_nSchema_2
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
verdiSetActWin -win $_nWave3
wvScrollUp -win $_nWave3 1
schSelect -win $_nSchema2 -instport "imem" "q1\[31:0\]"
verdiSetActWin -win $_nSchema_2
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 1034.418987 -snap {("G2" 0)}
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -inst "icpu"
schPushViewIn -win $_nSchema2
srcShowCalling -win $_nTrace1
schSelect -win $_nSchema2 -inst "i_datapath"
schPushViewIn -win $_nSchema2
schZoom {22664} {8239} {82341} {40314} -win $_nSchema2
schZoom {22636} {12170} {44775} {24410} -win $_nSchema2
schSelect -win $_nSchema2 -signal "ByteEnable\[3:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "BE_RD\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "WriteDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "ReadDataW\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_MEM_WB" "ReadDataW\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
verdiWindowResize -win $_Verdi_1 "31" "42" "1739" "953"
schSelect -win $_nSchema2 -instport "u_MEM_WB" "ReadDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schFit -win $_nSchema2
schZoom {7506} {3733} {35450} {25543} -win $_nSchema2
schSelect -win $_nSchema2 -signal "ReadDataM\[31:0\]"
schSelect -win $_nSchema2 -signal "ByteEnable\[3:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schZoom {23478} {14061} {38285} {23477} -win $_nSchema2
schSelect -win $_nSchema2 -signal "ALUResultM\[1:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_BE_logic" "AddrLast2\[1:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_BE_logic" "funct3\[2:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schDeselectAll -win $_nSchema2
wvSelectSignal -win $_nWave3 {( "G1" 7 )} 
verdiSetActWin -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 7 8 9 10 11 12 13 14 15 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetCursor -win $_nWave3 1091.796190 -snap {("G2" 0)}
wvZoomAll -win $_nWave3
wvSetCursor -win $_nWave3 8368.084884 -snap {("G2" 0)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
verdiWindowResize -win $_Verdi_1 "950" "19" "960" "1016"
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 433.119799 -snap {("G2" 0)}
wvZoomAll -win $_nWave3
wvSetCursor -win $_nWave3 11445.953056 -snap {("G2" 0)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
schSelect -win $_nSchema2 -signal "ALUResultM\[1:0\]"
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -signal "ALUResultM\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 4296.325906 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 4576.968786 -snap {("G2" 0)}
wvZoomAll -win $_nWave3
wvSetCursor -win $_nWave3 10489.552666 -snap {("G2" 0)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
verdiSetActWin -win $_nSchema_2
wvSetCursor -win $_nWave3 4257.859660 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
schSelect -win $_nSchema2 -signal "ALUResultM\[1:0\]"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 3)}
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetCursor -win $_nWave3 4153.915590 -snap {("G2" 0)}
verdiSetActWin -win $_nSchema_2
schFit -win $_nSchema2
schZoom {96497} {-6994} {159080} {40303} -win $_nSchema2
schZoom {125788} {4731} {142173} {25547} -win $_nSchema2
schSelect -win $_nSchema2 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 4130.051399 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetCursor -win $_nWave3 4074.686477 -snap {("G3" 0)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetCursor -win $_nWave3 4169.188672 -snap {("G3" 0)}
schSelect -win $_nSchema2 -signal "SrcAE\[31:0\]"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "SrcBE\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "ALUControlE\[4:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 13138.490438
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -signal "clk"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvZoomIn -win $_nWave3
verdiSetActWin -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 8 )} 
wvSelectSignal -win $_nWave3 {( "G1" 8 )} 
wvSetRadix -win $_nWave3 -format Bin
wvSetCursor -win $_nWave3 4277.293455 -snap {("G3" 0)}
wvSetCursor -win $_nWave3 4348.408742 -snap {("G3" 0)}
schDeselectAll -win $_nSchema2
verdiSetActWin -win $_nSchema_2
schPopViewUp -win $_nSchema2
schSelect -win $_nSchema2 -inst "u_controller"
schPushViewIn -win $_nSchema2
schSelect -win $_nSchema2 -instport "adec" "ALUop\[1:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 4578.029984 -snap {("G3" 0)}
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 4642.343977 -snap {("G3" 0)}
wvSetCursor -win $_nWave3 4664.633131 -snap {("G3" 0)}
wvSetCursor -win $_nWave3 4695.179295 -snap {("G3" 0)}
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
wvSetCursor -win $_nWave3 4682.292631 -snap {("G3" 0)}
verdiSetActWin -win $_nWave3
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
verdiSetActWin -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
schSelect -win $_nSchema2 -port "opcode\[6:0\]"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 0)}
verdiSetActWin -win $_nWave3
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSetCursor -win $_nWave3 4575.858342 -snap {("G3" 0)}
wvSetCursor -win $_nWave3 1145525.296161 -snap {("G3" 0)}
wvSetCursor -win $_nWave3 1150423.421262 -snap {("G3" 0)}
schSelect -win $_nSchema2 -inst "mdec"
verdiSetActWin -win $_nSchema_2
schDeselectAll -win $_nSchema2
schPopViewUp -win $_nSchema2
schSelect -win $_nSchema2 -inst "i_datapath"
schPushViewIn -win $_nSchema2
schZoom {44565} {-7301} {104264} {43436} -win $_nSchema2
schZoom {45125} {20696} {63352} {37750} -win $_nSchema2
schSelect -win $_nSchema2 -signal "FlushD"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 4)}
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 4)}
schSelect -win $_nSchema2 -signal "StallD"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "lwStall"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "InstrD\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetCursor -win $_nWave3 1150394.784234 -snap {("G3" 0)}
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 1150477.354333 -snap {("G3" 0)}
wvSetCursor -win $_nWave3 1150403.375342 -snap {("G1" 7)}
wvSetCursor -win $_nWave3 1150422.466695 -snap {("G3" 0)}
wvSetCursor -win $_nWave3 1150438.217060 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 1150425.330397 -snap {("G3" 0)}
wvSelectGroup -win $_nWave3 {G3}
wvSetCursor -win $_nWave3 1150311.736851 -snap {("G3" 0)}
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSetRadix -win $_nWave3 -format Bin
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 1150389.892074 -snap {("G1" 0)}
verdiSetActWin -win $_nSchema_2
schFit -win $_nSchema2
schZoom {120079} {-2068} {165522} {33880} -win $_nSchema2
schZoom {147088} {852} {166312} {25321} -win $_nSchema2
schZoom {147004} {6609} {153311} {23675} -win $_nSchema2
schSelect -win $_nSchema2 -signal "PCSrc\[1:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
verdiSetActWin -win $_nWave3
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
wvSetCursor -win $_nWave3 1150489.465410 -snap {("G3" 0)}
verdiSetActWin -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 1150499.369048 -snap {("G3" 0)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 1150445.078015 -snap {("G2" 0)}
verdiSetActWin -win $_nSchema_2
wvSetCursor -win $_nWave3 30851.354151 -snap {("G3" 0)}
verdiSetActWin -win $_nWave3
schSelect -win $_nSchema2 -instport "u_branch_logic" "Branch"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_branch_logic" "jalE"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_branch_logic" "N_flag"
schSelect -win $_nSchema2 -instport "u_branch_logic" "jalrE"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_branch_logic" "N_flag"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_branch_logic" "Z_flag"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_branch_logic" "C_flag"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_branch_logic" "V_flag"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_branch_logic" "funct3\[2:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 12 )} 
verdiSetActWin -win $_nWave3
schSelect -win $_nSchema2 -signal "N_flagE"
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -instport "u_ALU" "aN"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_ALU" "a_in\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_ALU" "b_in\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -instport "u_ALU" "ALUControl\[4:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
verdiSetActWin -win $_nWave3
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "G1" 2 )} 
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 9)}
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSetPosition -win $_nWave3 {("G1" 11)}
wvSetPosition -win $_nWave3 {("G1" 12)}
wvSetPosition -win $_nWave3 {("G1" 13)}
wvSetPosition -win $_nWave3 {("G1" 14)}
wvSetPosition -win $_nWave3 {("G1" 15)}
wvSetPosition -win $_nWave3 {("G1" 16)}
wvSetPosition -win $_nWave3 {("G1" 17)}
wvSetPosition -win $_nWave3 {("G1" 18)}
wvSetPosition -win $_nWave3 {("G1" 20)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G3" 0)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G1" 20)}
wvSetPosition -win $_nWave3 {("G1" 19)}
wvSetPosition -win $_nWave3 {("G1" 18)}
wvSetPosition -win $_nWave3 {("G1" 17)}
wvSetPosition -win $_nWave3 {("G1" 16)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 16)}
wvSetCursor -win $_nWave3 30835.126502 -snap {("G3" 0)}
wvSelectSignal -win $_nWave3 {( "G1" 18 )} 
wvSetCursor -win $_nWave3 30902.662161 -snap {("G3" 0)}
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 31230.770916 -snap {("G1" 17)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
schSelect -win $_nSchema2 -signal "ALUResultE\[31:0\]"
verdiSetActWin -win $_nSchema_2
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
verdiSetActWin -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "G1" 11 )} 
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -instport "u_ALU" "aN"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "N_flagE"
schSelect -win $_nSchema2 -signal "Z_flagE"
schSelect -win $_nSchema2 -port "Z_flagE"
schPopViewUp -win $_nSchema2
schZoom {23559} {8719} {31276} {16335} -win $_nSchema2
schFit -win $_nSchema2
verdiSetActWin -dock widgetDock_<Inst._Tree>
debReload
schSelect -win $_nSchema2 -inst "i_datapath"
schPushViewIn -win $_nSchema2
verdiSetActWin -win $_nSchema_2
schZoom {26582} {-820} {77424} {31754} -win $_nSchema2
schZoom {129870} {5918} {143091} {19148} -win $_nSchema2
schSelect -win $_nSchema2 -signal "Z_flagE"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "N_flagE"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "sltu_result"
schSelect -win $_nSchema2 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 23 )} 
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 23)}
wvSetPosition -win $_nWave3 {("G1" 22)}
wvSetPosition -win $_nWave3 {("G1" 21)}
wvSetPosition -win $_nWave3 {("G1" 20)}
wvSetPosition -win $_nWave3 {("G1" 19)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 19)}
wvSetPosition -win $_nWave3 {("G1" 20)}
wvSelectSignal -win $_nWave3 {( "G1" 22 )} 
wvSelectSignal -win $_nWave3 {( "G1" 21 )} 
wvSelectSignal -win $_nWave3 {( "G1" 22 )} 
wvSelectSignal -win $_nWave3 {( "G1" 21 )} 
wvScrollUp -win $_nWave3 4
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 7 8 9 10 11 12 13 14 15 16 17 18 19 )} \
           
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave3 {( "G1" 11 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSelectGroup -win $_nWave3 {G3}
schDeselectAll -win $_nSchema2
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -signal "SrcAE\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
schSelect -win $_nSchema2 -signal "SrcBE\[31:0\]"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
verdiSetActWin -win $_nWave3
verdiSetActWin -win $_nSchema_2
verdiSetActWin -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 183.634946 -snap {("G3" 0)}
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 238.164621 -snap {("G3" 0)}
wvSetCursor -win $_nWave3 256.778690 -snap {("G1" 2)}
wvSetCursor -win $_nWave3 268.710785 -snap {("G1" 2)}
verdiSetActWin -win $_nSchema_2
schSelect -win $_nSchema2 -signal "clk"
schAddSelectedToWave -win $_nSchema2 -clipboard
wvDrop -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 0)}
verdiSetActWin -win $_nWave3
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetCursor -win $_nWave3 395.262587 -snap {("G3" 0)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 390.084058 -snap {("G1" 3)}
verdiSetActWin -win $_nSchema_2
verdiSetActWin -dock widgetDock_<Inst._Tree>
debExit
