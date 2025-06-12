verdiSetActWin -win $_OneSearch
debImport "-sv" "-f" "run.f"
verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Decl._Tree>
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
schCreateWindow -delim "." -win $_nSchema1 -scope "flopr"
verdiSetActWin -win $_nSchema_2
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBTreeAction -win $_nTrace1 -path "SMU_RV32I_System"
verdiSetActWin -dock widgetDock_<Decl._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU"
verdiSetActWin -win $_nSchema_3
verdiQtPrefEnv -show
verdiQtPrefEnv -setCurPg "Schematics.Display Options"
schSetPreference -portName on -pinName on -stickyLocator on -selectionToolbar on \
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
schZoom {28704} {12243} {34576} {18870} -win $_nSchema3
schFit -win $_nSchema3
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
schZoom {23154} {17455} {30154} {28412} -win $_nSchema3
schFit -win $_nSchema3
schZoom {11263} {9067} {29401} {27581} -win $_nSchema3
schFit -win $_nSchema3
schZoom {162018} {1057} {186027} {49192} -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "PCF\[31:0\]"
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema3 -signal "PCF\[31:0\]"
verdiSetActWin -win $_nSchema_3
schZoom {78774} {11393} {87355} {27435} -win $_nSchema3
schFit -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
debReload
schSelect -win $_nSchema3 -signal "PCPlus4F\[31:0\]"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "FlushD"
schSelect -win $_nSchema3 -signal "lwStall"
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
schSelect -win $_nSchema3 -signal "PCF\[31:0\]"
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nSchema_3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
debReload
debReload
verdiSetActWin -win $_nSchema_3
verdiSetActWin -dock widgetDock_<Decl._Tree>
schZoom {25437} {14110} {31366} {19183} -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schZoom {25114} {12011} {39534} {22869} -win $_nSchema3
verdiSetActWin -win $_nSchema_3
verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -dock widgetDock_<Message>
nsMsgSelect -range {0 0-1} {0-0}
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -dock widgetDock_<Message>
nsMsgSelect -range {0 0-1}
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nSchema_3
verdiSetActWin -dock widgetDock_<Decl._Tree>
schSelect -win $_nSchema3 -signal "Instr_sel"
verdiSetActWin -win $_nSchema_3
verdiSetActWin -dock widgetDock_<Decl._Tree>
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 \
           {/home1/socuser10/2025Soc/week1x_final_project/hardware/52.RV32I_Integrated_Test/sim/func_sim/wave.fsdb}
schSelect -win $_nSchema3 -signal "InstrE\[31:0\]"
verdiSetActWin -win $_nSchema_3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_3
schZoom {2318} {15164} {30515} {43037} -win $_nSchema3
schSelect -win $_nSchema3 -signal "PC_nextF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCF\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schZoom {34652} {25317} {70182} {52157} -win $_nSchema3
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 9.752354 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvZoomAll -win $_nWave4
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {114677} {-7704} {136205} {19637} -win $_nSchema3
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -signal "SrcAE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "SrcBE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 293.882598 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvZoomAll -win $_nWave4
wvSetCursor -win $_nWave4 336.740477 -snap {("G2" 0)}
schSelect -win $_nSchema3 -signal "ALUResultE\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schSelect -win $_nSchema3 -signal "ALUResultM\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schZoom {56789} {18356} {66529} {24481} -win $_nSchema3
schSelect -win $_nSchema3 -instport "rf" "wd\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 3 )} 
wvSelectSignal -win $_nWave4 {( "G1" 3 )} 
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
schSelect -win $_nSchema3 -signal "Instr\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "Instr_1d"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "NOP"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "Instr_sel"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 11 )} 
verdiSetActWin -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSelectSignal -win $_nWave4 {( "G1" 13 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 12 )} 
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSelectSignal -win $_nWave4 {( "G1" 13 )} 
verdiSetActWin -win $_nWave4
schZoom {34044} {38960} {41404} {47535} -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
schSelect -win $_nSchema3 -signal "NOP"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schZoom {46477} {17142} {54659} {23078} -win $_nSchema3
schFit -win $_nSchema3
schSelect -win $_nSchema3 -instpin "datapath\(@1\):SigTap0:34:34:Combo" "O0"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schDeselectAll -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
schSelect -win $_nSchema3 -signal "NOP"
verdiSetActWin -win $_nSchema_3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSelectSignal -win $_nWave4 {( "G1" 14 )} 
verdiSetActWin -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
schSelect -win $_nSchema3 -signal "Instr_sel"
verdiSetActWin -win $_nSchema_3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSelectSignal -win $_nWave4 {( "G1" 16 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 15 )} 
wvSelectSignal -win $_nWave4 {( "G1" 16 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 0)}
wvSetPosition -win $_nWave4 {("G1" 15)}
wvSelectSignal -win $_nWave4 {( "G1" 15 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 0)}
wvSetPosition -win $_nWave4 {("G1" 14)}
verdiSetActWin -dock widgetDock_<Decl._Tree>
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
verdiSetActWin -win $_nWave4
verdiWindowResize -win $_Verdi_1 "380" "167" "2880" "2057"
verdiWindowResize -win $_Verdi_1 "594" "65" "2880" "2057"
verdiWindowResize -win $_Verdi_1 "1919" "26" "1920" "2096"
wvSetCursor -win $_nWave4 69.041377 -snap {("G2" 0)}
wvSelectSignal -win $_nWave4 {( "G1" 12 )} 
wvSelectSignal -win $_nWave4 {( "G1" 10 )} 
wvSelectSignal -win $_nWave4 {( "G1" 5 )} 
wvSelectSignal -win $_nWave4 {( "G1" 6 )} 
verdiSetActWin -win $_nSchema_3
verdiQtPrefEnv -show
verdiQtPrefEnv -setCurPg "Schematics.Display Options"
verdiQtPrefEnv -apply
verdiQtPrefEnv -ok
schZoom {110937} {-13822} {144962} {21990} -win $_nSchema3
schSelect -win $_nSchema3 -signal "RD1E_w2\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUSrcAE\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 14 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 15 )} 
wvSelectSignal -win $_nWave4 {( "G1" 15 )} 
wvSelectSignal -win $_nWave4 {( "G1" 15 16 17 )} 
wvSetPosition -win $_nWave4 {("G1" 15)}
wvSetPosition -win $_nWave4 {("G1" 16)}
wvSetPosition -win $_nWave4 {("G1" 17)}
wvSetPosition -win $_nWave4 {("G2" 0)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 3)}
wvSetPosition -win $_nWave4 {("G2" 3)}
wvSelectGroup -win $_nWave4 {G3}
wvSelectSignal -win $_nWave4 {( "G2" 1 )} 
wvSelectSignal -win $_nWave4 {( "G2" 2 )} 
wvSelectSignal -win $_nWave4 {( "G2" 1 )} 
schSelect -win $_nSchema3 -instport "u_hazard_RD1E" "in0\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_hazard_RD1E" "in1\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_hazard_RD1E" "in2\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_hazard_RD1E" "sel\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G2" 4 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G2" 4 5 6 7 )} 
wvSetPosition -win $_nWave4 {("G2" 4)}
wvSetPosition -win $_nWave4 {("G2" 5)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 5)}
wvSetPosition -win $_nWave4 {("G2" 7)}
wvSetPosition -win $_nWave4 {("G2" 4)}
wvSetPosition -win $_nWave4 {("G2" 5)}
wvSetPosition -win $_nWave4 {("G2" 6)}
wvSetPosition -win $_nWave4 {("G2" 7)}
wvSetPosition -win $_nWave4 {("G3" 0)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G3" 4)}
wvSetPosition -win $_nWave4 {("G3" 4)}
wvSelectGroup -win $_nWave4 {G4}
wvSetCursor -win $_nWave4 311.990768 -snap {("G3" 1)}
wvSetCursor -win $_nWave4 224.259847 -snap {("G4" 0)}
wvSetCursor -win $_nWave4 381.471899 -snap {("G3" 4)}
wvSetCursor -win $_nWave4 376.414728 -snap {("G3" 4)}
wvSelectSignal -win $_nWave4 {( "G3" 4 )} 
schSelect -win $_nSchema3 -inst "u_hazard_RD1E"
verdiSetActWin -win $_nSchema_3
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -signal "ALUSrcBE"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ALUSrcAE\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 \
           {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 )} {( "G2" \
           1 2 3 )} {( "G3" 1 2 3 4 5 6 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G3" 0)}
wvSelectGroup -win $_nWave4 {G1}
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "ResultW\[31:0\]"
schFit -win $_nSchema3
schZoom {22395} {-18066} {140249} {60964} -win $_nSchema3
schZoom {40037} {2141} {116035} {50787} -win $_nSchema3
schSelect -win $_nSchema3 -signal "ForwardBE\[1:0\]"
schSelect -win $_nSchema3 -signal "RD2E_w2\[31:0\]"
schSelect -win $_nSchema3 -signal "RD1E_w\[31:0\]"
schSelect -win $_nSchema3 -signal "ALUResultM\[31:0\]"
schSelect -win $_nSchema3 -signal "ResultW\[31:0\]"
schFit -win $_nSchema3
schZoom {31076} {3589} {56227} {26695} -win $_nSchema3
schSelect -win $_nSchema3 -signal "ALUResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "BE_RD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCPlus4W\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ResultSrcW\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -signal "ALUResultW\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "InstrW\[14:12\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ReadDataW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G3" 5 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G3" 5 6 7 )} 
wvSetPosition -win $_nWave4 {("G3" 6)}
wvSetPosition -win $_nWave4 {("G3" 7)}
wvSetPosition -win $_nWave4 {("G4" 0)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G4" 3)}
wvSetPosition -win $_nWave4 {("G4" 3)}
wvSelectSignal -win $_nWave4 {( "G4" 3 )} 
wvSetPosition -win $_nWave4 {("G4" 2)}
wvSetPosition -win $_nWave4 {("G4" 1)}
wvSetPosition -win $_nWave4 {("G4" 0)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G4" 0)}
wvSetPosition -win $_nWave4 {("G4" 1)}
wvSelectGroup -win $_nWave4 {G5}
wvSelectSignal -win $_nWave4 {( "G4" 2 )} 
wvSelectSignal -win $_nWave4 {( "G4" 3 )} 
wvSetPosition -win $_nWave4 {("G4" 3)}
wvSetPosition -win $_nWave4 {("G4" 2)}
wvSetPosition -win $_nWave4 {("G4" 1)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G4" 1)}
wvSetPosition -win $_nWave4 {("G4" 2)}
wvSelectSignal -win $_nWave4 {( "G4" 3 )} 
wvSetCursor -win $_nWave4 238.771729 -snap {("G5" 0)}
wvZoomAll -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G4" 1 )} 
wvSetCursor -win $_nWave4 235.494770 -snap {("G5" 0)}
wvZoomIn -win $_nWave4
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "ReadDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetPosition -win $_nWave4 {("G4" 2)}
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G4" 1)}
wvSetPosition -win $_nWave4 {("G4" 0)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G4" 0)}
wvSetPosition -win $_nWave4 {("G4" 1)}
wvSetCursor -win $_nWave4 281.615816 -snap {("G5" 0)}
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -port "ReadDataM\[31:0\]"
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -port "ReadData\[31:0\]"
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSetCursor -win $_nWave4 321.952055 -snap {("G5" 0)}
verdiSetActWin -win $_nWave4
schSelect -win $_nSchema3 -inst "i_datapath"
schPushViewIn -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {20994} {9424} {38640} {22671} -win $_nSchema3
schFit -win $_nSchema3
schZoom {820} {16180} {10030} {23992} -win $_nSchema3
schFit -win $_nSchema3
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSetCursor -win $_nWave4 312.605853 -snap {("G5" 0)}
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 505.962431 -snap {("G4" 4)}
wvSelectSignal -win $_nWave4 {( "G4" 2 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G4" 1)}
wvSelectSignal -win $_nWave4 {( "G4" 2 )} 
wvSelectSignal -win $_nWave4 {( "G4" 2 )} 
wvSelectSignal -win $_nWave4 {( "G4" 3 )} 
schZoom {120542} {2450} {141086} {19257} -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetPosition -win $_nWave4 {("G4" 3)}
wvSetPosition -win $_nWave4 {("G4" 4)}
wvSetPosition -win $_nWave4 {("G5" 0)}
verdiSetActWin -win $_nWave4
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G5" 1)}
wvSetPosition -win $_nWave4 {("G5" 1)}
wvSetCursor -win $_nWave4 342.262512 -snap {("G6" 0)}
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {53944} {-3307} {79894} {27123} -win $_nSchema3
schSelect -win $_nSchema3 -signal "ALUResultM\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schZoom {9663} {9581} {35970} {33328} -win $_nSchema3
schSelect -win $_nSchema3 -signal "ALUResultW\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G3" 1 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G3" 1 2 3 4 )} {( "G4" 1 2 3 )} 
wvSelectSignal -win $_nWave4 {( "G3" 1 2 3 4 )} {( "G4" 1 2 3 )} {( "G5" 1 2 3 \
           )} 
wvSelectSignal -win $_nWave4 {( "G3" 1 2 3 4 )} {( "G4" 1 2 3 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G5" 3)}
schSelect -win $_nSchema3 -signal "RegWriteW"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "RdW\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schZoom {78346} {-18462} {109177} {26049} -win $_nSchema3
schSelect -win $_nSchema3 -signal "RD1D_w\[31:0\]"
schFit -win $_nSchema3
schZoom {68823} {19963} {83346} {41324} -win $_nSchema3
schSelect -win $_nSchema3 -signal "RD1D\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "RD2D\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 311.518428 -snap {("G5" 7)}
verdiSetActWin -win $_nWave4
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {82632} {-9512} {108819} {34641} -win $_nSchema3
schSelect -win $_nSchema3 -signal "PCE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema3 -signal "PCE\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "PCD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "RdE\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_ID_EX" "RdD\[4:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "RdD"
schSelect -win $_nSchema3 -signal "InstrD\[11:7\]"
schSelect -win $_nSchema3 -signal "InstrD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 1 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave4 {( "G5" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G5" 0)}
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {158036} {24638} {177101} {45553} -win $_nSchema3
schSelect -win $_nSchema3 -signal "ALUResultM\[31:0\]"
schFit -win $_nSchema3
schDeselectAll -win $_nSchema3
schZoom {91369} {-14430} {116069} {28484} -win $_nSchema3
schSelect -win $_nSchema3 -signal "MemWriteE"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schZoom {59114} {-3130} {79858} {18507} -win $_nSchema3
schSelect -win $_nSchema3 -signal "MemWriteM"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvZoomAll -win $_nWave4
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -instport "u_EX_MEM" "WriteDataE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_EX_MEM" "WriteDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 1705.365504 -snap {("G6" 0)}
verdiSetActWin -win $_nWave4
schFit -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schZoom {58874} {-1808} {75541} {23796} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_EX_MEM" "ALUResultE\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_EX_MEM" "ALUResultM\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schZoom {158876} {22714} {172305} {43510} -win $_nSchema3
schSelect -win $_nSchema3 -instport "u_be_store" "BE\[3:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 7 )} 
wvSetRadix -win $_nWave4 -format Bin
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
schSelect -win $_nSchema3 -signal "InstrM\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_be_store" "funct3\[2:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 8 )} 
verdiSetActWin -win $_nWave4
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G6" 0)}
wvSetPosition -win $_nWave4 {("G5" 8)}
wvSelectSignal -win $_nWave4 {( "G5" 8 )} 
wvSelectSignal -win $_nWave4 {( "G5" 8 )} 
wvSetRadix -win $_nWave4 -format Bin
wvSetCursor -win $_nWave4 1708.203321 -snap {("G6" 0)}
schSelect -win $_nSchema3 -instport "u_be_store" "AddrLast2\[1:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -instport "u_be_store" "BE_WD\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 1682.424989 -snap {("G6" 0)}
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 6 )} 
wvSelectSignal -win $_nWave4 {( "G5" 7 )} 
wvSelectSignal -win $_nWave4 {( "G5" 9 )} 
wvSelectSignal -win $_nWave4 {( "G5" 9 )} 
wvSetRadix -win $_nWave4 -format Bin
wvSetCursor -win $_nWave4 1608.312287 -snap {("G6" 0)}
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave4 33.038823 -snap {("G6" 0)}
wvZoomAll -win $_nWave4
wvSetCursor -win $_nWave4 280.705791 -snap {("G6" 0)}
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schPopViewUp -win $_nSchema3
schZoom {50452} {-816} {72189} {24441} -win $_nSchema3
schSelect -win $_nSchema3 -signal "WriteData_d\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema3 -signal "ReadData\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
schFit -win $_nSchema3
schZoom {33235} {251} {68134} {27239} -win $_nSchema3
schSelect -win $_nSchema3 -instport "icpu" "ReadData\[31:0\]"
schSelect -win $_nSchema3 -inst "icpu"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -instport "i_datapath" "ReadDataM\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave4
wvSetCursor -win $_nWave4 310.018431 -snap {("G6" 0)}
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 12 )} 
verdiSetActWin -win $_nSchema_3
schFit -win $_nSchema3
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {57 57 4 5 1 1}
srcHBSelect "cpu_tb" -win $_nTrace1
verdiSetActWin -win $_nWave4
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb"
verdiSetActWin -win $_nSchema_5
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb"
verdiSetActWin -win $_nSchema_6
schSelect -win $_nSchema6 -inst "CPU"
schPushViewIn -win $_nSchema6
schZoom {35629} {2582} {57033} {26041} -win $_nSchema6
schSelect -win $_nSchema6 -signal "ReadData_dmem\[31:0\]"
schAddSelectedToWave -win $_nSchema6 -clipboard
wvDrop -win $_nWave4
schSelect -win $_nSchema6 -signal "Instr\[31:0\]"
schAddSelectedToWave -win $_nSchema6 -clipboard
wvDrop -win $_nWave4
schDeselectAll -win $_nSchema6
schSelect -win $_nSchema6 -signal "ReadData_dmem\[31:0\]"
schSelect -win $_nSchema6 -inst "data_multiplexer"
schPushViewIn -win $_nSchema6
schPopViewUp -win $_nSchema6
schSelect -win $_nSchema6 -signal "ReadData_dmem\[31:0\]"
schSelect -win $_nSchema6 -instport "icpu" "ReadData\[31:0\]"
schSelect -win $_nSchema6 -inst "icpu"
schPushViewIn -win $_nSchema6
schSelect -win $_nSchema6 -port "ReadData\[31:0\]"
schSelect -win $_nSchema6 -instport "i_datapath" "ReadDataM\[31:0\]"
schSelect -win $_nSchema6 -inst "i_datapath"
schPushViewIn -win $_nSchema6
schZoom {160674} {15381} {176982} {48682} -win $_nSchema6
schFit -win $_nSchema6
schZoom {-2518} {7567} {17866} {24157} -win $_nSchema6
schFit -win $_nSchema6
schSelect -win $_nSchema6 -signal "ReadDataM\[31:0\]"
schZoom {18946} {8168} {42807} {24638} -win $_nSchema6
schSelect -win $_nSchema6 -signal "BE_RD\[31:0\]"
schAddSelectedToWave -win $_nSchema6 -clipboard
wvDrop -win $_nWave4
schDeselectAll -win $_nSchema6
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nSchema_6
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema6 -instport "u_be_load" "RD\[31:0\]"
verdiSetActWin -win $_nSchema_6
schAddSelectedToWave -win $_nSchema6 -clipboard
wvDrop -win $_nWave4
wvSetPosition -win $_nWave4 {("G5" 16)}
wvSetPosition -win $_nWave4 {("G5" 15)}
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G5" 14)}
wvSetPosition -win $_nWave4 {("G5" 13)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G5" 13)}
wvSetPosition -win $_nWave4 {("G5" 14)}
wvSelectSignal -win $_nWave4 {( "G5" 15 )} 
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
verdiSetActWin -win $_nSchema_6
schFit -win $_nSchema6
schZoom {156811} {19712} {178994} {53432} -win $_nSchema6
schPopViewUp -win $_nSchema6
srcShowCalling -win $_nTrace1
schPopViewUp -win $_nSchema6
schDeselectAll -win $_nSchema6
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
schSelect -win $_nSchema6 -signal "ReadData\[31:0\]"
verdiSetActWin -win $_nSchema_6
schAddSelectedToWave -win $_nSchema6 -clipboard
wvDrop -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 13 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 14 )} 
wvSelectSignal -win $_nWave4 {( "G5" 15 )} 
wvSelectSignal -win $_nWave4 {( "G5" 14 )} 
wvSelectSignal -win $_nWave4 {( "G5" 15 )} 
wvSelectSignal -win $_nWave4 {( "G5" 14 )} 
wvSelectSignal -win $_nWave4 {( "G5" 15 )} 
schDeselectAll -win $_nSchema6
verdiSetActWin -win $_nSchema_6
verdiSetActWin -dock widgetDock_<Decl._Tree>
debReload
wvSelectSignal -win $_nWave4 {( "G5" 14 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 15 )} 
wvSelectSignal -win $_nWave4 {( "G5" 16 )} 
wvSelectSignal -win $_nWave4 {( "G5" 17 )} 
wvSelectSignal -win $_nWave4 {( "G5" 18 )} 
wvSetPosition -win $_nWave4 {("G5" 18)}
wvExpandBus -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G5" 47 )} 
wvSelectSignal -win $_nWave4 {( "G5" 33 )} 
wvScrollUp -win $_nWave4 5
wvScrollUp -win $_nWave4 21
wvSelectSignal -win $_nWave4 {( "G5" 9 )} 
wvScrollDown -win $_nWave4 1
wvSelectSignal -win $_nWave4 {( "G5" 19 )} 
wvScrollDown -win $_nWave4 26
wvSelectSignal -win $_nWave4 {( "G5" 19 20 21 22 23 24 25 26 27 28 29 30 31 32 \
           33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G5" 18)}
verdiSetActWin -win $_nSchema_6
schZoom {37091} {-2750} {76510} {27375} -win $_nSchema6
schSelect -win $_nSchema6 -signal "cs_tbman_n"
