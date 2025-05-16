module mux3(
	in0,
	in1,
	in2,
	sel,
	out
);
	input [31:0] in0, in1, in2; 
	input [1:0] sel;
	output reg [31:0] out;
	
	always@(*)begin
		if(sel == 2'b00)
			out = in0;
		else if(sel == 2'b01)
			out = in1;
		else if(sel == 2'b10)
			out = in2;
		else
			out = 32'h0;
	end
	/*always@(*)begin
		$display("sel: %b, in0: %h, in1: %h, in2: %h, out: %h", sel, in0, in1, in2, out);
		end*/
endmodule
