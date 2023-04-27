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
                //assign temp[i+1][j] = temp[i][j+2**(i)] & dataB[i] | temp[i][j] & ~dataB[i];
                Mux_2to1 mux2to1 (
                    temp[i+1][j],
                    dataB[i],
                    temp[i][j],
                    temp[i][j+2**(i)]
                );
            end
            for (j = 32 - 2 ** (i); j < 32; j = j + 1) begin
                //assign temp[i+1][j] = temp[i][j] & ~dataB[i];
                Mux_2to1 mux2to1 (
                    temp[i+1][j],
                    dataB[i],
                    temp[i][j],
                    1'b0
                );
            end
        end
    endgenerate

    assign dataOut = temp[5];


endmodule
