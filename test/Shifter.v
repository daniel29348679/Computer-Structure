`timescale 1ns / 1ns
module Shifter (
    dataA,
    dataB,
    Signal,
    dataOut,
    reset
);
    input reset;
    input [31:0] dataA;
    input [31:0] dataB;
    input [5:0] Signal;
    output [31:0] dataOut;


    wire [5:0][31:0] temp;

    assign temp[0] = dataA;


    genvar i, j;
    generate
        for (i = 0; i < 5; i = i + 1) begin
            for (j = 0; j + 2 ** (i) < 32; j = j + 1) begin
                assign temp[i+1][j] = temp[i][j+2**(i)] & dataB[i] | temp[i][j] & ~dataB[i];
            end
            for (j = 32 - 2 ** (i); j < 32; j = j + 1) begin
                assign temp[i+1][j] = temp[i][j] & ~dataB[i];
            end
        end
    endgenerate

    assign dataOut = temp[5];
    /*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule
/*
		for(i = 0 ; i < 5;i=i+1)begin
			for(j = 0 ; j+k < 32;j=j+1)begin
				assign temp[i+1][j] = temp[i][j+k];
			end
			for(j = j; j< 32;j=j+1)begin	
				assign temp[i+1][j] = temp[i][31];
			end
			k = k * 2;
		end
		*/
