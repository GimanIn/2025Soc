module instr_dec(
    input FlushD_1d,
    input Stall_1d,
    input [31:0] PCF,
    output reg [1:0] instr_sel
);

parameter RESET_PC = 32'h0000_0000;
parameter RESET_PC_4 = 32'h0000_0000;

always@(*) begin
    if (PCF == RESET_PC || PCF == RESET_PC_4 || FlushD_1d) 
        instr_sel = 2'b10;
    else if (Stall_1d)
        instr_sel = 2'b01;
    else
        instr_sel = 2'b00;
end

endmodule

