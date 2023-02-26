`timescale 1ns/10ps
module simple_tb;
reg clk;
wire[7:0] sum;
initial
	begin
		//$dumpfile("simple.vcd");
		//$dumpvars(0, s);
		clk = 0;
		$monitor("sum = %d ",sum);
		#50 $finish;
	end

	always #5 clk = ~clk;
	simple s( clk, sum);
endmodule