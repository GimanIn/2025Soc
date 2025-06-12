module flush_1d (
    input clk,
    input flush,
    output reg flush_1d
);

always @(posedge clk) begin
    flush_1d <= flush; 
end

endmodule