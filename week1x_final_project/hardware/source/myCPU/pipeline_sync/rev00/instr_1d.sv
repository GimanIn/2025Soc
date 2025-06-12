module instr_1d (
    input clk,
    input [31:0] instr,
    output reg [31:0] instr_1d
);

always @(posedge clk) begin
    instr_1d <= instr; 
end

endmodule