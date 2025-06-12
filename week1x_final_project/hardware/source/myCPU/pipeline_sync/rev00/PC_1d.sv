module PC_1d (
    input clk,
    input stall,
    input [31:0] PC,
    output reg [31:0] PC_1d
);

always @(posedge clk) begin
    if (stall)
        PC_1d <= PC_1d; 
    else
        PC_1d <= PC;
end

endmodule