module simple(
	input	clk,
	output	reg[7:0]sum
	);
	initial
		begin
			sum <=0; 
		end

	always@(posedge clk)begin
		sum <= sum+1;
	end
endmodule