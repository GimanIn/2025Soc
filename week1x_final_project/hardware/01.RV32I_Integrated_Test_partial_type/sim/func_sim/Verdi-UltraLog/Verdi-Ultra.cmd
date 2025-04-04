verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "run.f"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBBTreeSelect -win $_nTrace1 -path "SMU_RV32I_System"
srcTBTreeAction -win $_nTrace1 -path "SMU_RV32I_System"
verdiSetActWin -dock widgetDock_<Decl._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "cpu_tb.CPU"
verdiSetActWin -win $_nSchema_2
verdiQtPrefEnv -show
verdiQtPrefEnv -setCurPg "Schematics.Display Options"
verdiQtPrefEnv -setCurPg "Schematics.RTL"
verdiWindowResize -win $_Verdi_1 -103 "92" "1440" "752"
verdiWindowResize -win $_Verdi_1 -171 "91" "791" "752"
verdiQtPrefEnv -setCurPg "Schematics"
verdiQtPrefEnv -setCurPg "Schematics.RTL"
verdiQtPrefEnv -setCurPg "Schematics.Symbol Map"
verdiQtPrefEnv -setCurPg "Schematics.Symbol Library"
verdiQtPrefEnv -setCurPg "Schematics.Miscellaneous"
verdiQtPrefEnv -setCurPg "Schematics.Display Options"
verdiQtPrefEnv -setCurPg "Schematics.Select"
verdiQtPrefEnv -setCurPg "Schematics.SDF"
verdiQtPrefEnv -setCurPg "Schematics.Trace"
verdiQtPrefEnv -setCurPg "Schematics.Clock"
verdiQtPrefEnv -setCurPg "Schematics.ECO"
verdiQtPrefEnv -setCurPg "Schematics.EditSchematic"
verdiQtPrefEnv -setCurPg "Schematics.RTL"
verdiQtPrefEnv -setCurPg "Schematics"
verdiQtPrefEnv -ok
schZoom {18260} {-3231} {50351} {14827} -win $_nSchema2
debExit
