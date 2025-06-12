module stall_1d (
    input clk,
    input stall,
    output reg stall_1d
);

always @(posedge clk) begin
    stall_1d <= stall; 
end

endmodule