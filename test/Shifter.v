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


    wire [5:0] temp [31:0];

    assign temp[0] = dataA;


    genvar i, j;
    generate
        /*
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
        */
        Mux_shift muxShift ( temp[1][0], dataB[0], temp[0][0], temp[0][0 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][1], dataB[0], temp[0][1], temp[0][1 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][2], dataB[0], temp[0][2], temp[0][2 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][3], dataB[0], temp[0][3], temp[0][3 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][4], dataB[0], temp[0][4], temp[0][4 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][5], dataB[0], temp[0][5], temp[0][5 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][6], dataB[0], temp[0][6], temp[0][6 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][7], dataB[0], temp[0][7], temp[0][7 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][8], dataB[0], temp[0][8], temp[0][8 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][9], dataB[0], temp[0][9], temp[0][9 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][10], dataB[0], temp[0][10], temp[0][10 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][11], dataB[0], temp[0][11], temp[0][11 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][12], dataB[0], temp[0][12], temp[0][12 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][13], dataB[0], temp[0][13], temp[0][13 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][14], dataB[0], temp[0][14], temp[0][14 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][15], dataB[0], temp[0][15], temp[0][15 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][16], dataB[0], temp[0][16], temp[0][16 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][17], dataB[0], temp[0][17], temp[0][17 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][18], dataB[0], temp[0][18], temp[0][18 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][19], dataB[0], temp[0][19], temp[0][19 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][20], dataB[0], temp[0][20], temp[0][20 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][21], dataB[0], temp[0][21], temp[0][21 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][22], dataB[0], temp[0][22], temp[0][22 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][23], dataB[0], temp[0][23], temp[0][23 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][24], dataB[0], temp[0][24], temp[0][24 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][25], dataB[0], temp[0][25], temp[0][25 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][26], dataB[0], temp[0][26], temp[0][26 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][27], dataB[0], temp[0][27], temp[0][27 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][28], dataB[0], temp[0][28], temp[0][28 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][29], dataB[0], temp[0][29], temp[0][29 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][30], dataB[0], temp[0][30], temp[0][30 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[1][31], dataB[0], temp[0][31], temp[0][31 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][0], dataB[1], temp[1][0], temp[1][0 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][1], dataB[1], temp[1][1], temp[1][1 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][2], dataB[1], temp[1][2], temp[1][2 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][3], dataB[1], temp[1][3], temp[1][3 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][4], dataB[1], temp[1][4], temp[1][4 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][5], dataB[1], temp[1][5], temp[1][5 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][6], dataB[1], temp[1][6], temp[1][6 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][7], dataB[1], temp[1][7], temp[1][7 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][8], dataB[1], temp[1][8], temp[1][8 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][9], dataB[1], temp[1][9], temp[1][9 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][10], dataB[1], temp[1][10], temp[1][10 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][11], dataB[1], temp[1][11], temp[1][11 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][12], dataB[1], temp[1][12], temp[1][12 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][13], dataB[1], temp[1][13], temp[1][13 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][14], dataB[1], temp[1][14], temp[1][14 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][15], dataB[1], temp[1][15], temp[1][15 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][16], dataB[1], temp[1][16], temp[1][16 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][17], dataB[1], temp[1][17], temp[1][17 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][18], dataB[1], temp[1][18], temp[1][18 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][19], dataB[1], temp[1][19], temp[1][19 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][20], dataB[1], temp[1][20], temp[1][20 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][21], dataB[1], temp[1][21], temp[1][21 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][22], dataB[1], temp[1][22], temp[1][22 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][23], dataB[1], temp[1][23], temp[1][23 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][24], dataB[1], temp[1][24], temp[1][24 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][25], dataB[1], temp[1][25], temp[1][25 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][26], dataB[1], temp[1][26], temp[1][26 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][27], dataB[1], temp[1][27], temp[1][27 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][28], dataB[1], temp[1][28], temp[1][28 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][29], dataB[1], temp[1][29], temp[1][29 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[2][30], dataB[1], temp[1][30], 1'b0 ) ;
        Mux_shift muxShift ( temp[2][31], dataB[1], temp[1][31], 1'b0 ) ;
        Mux_shift muxShift ( temp[3][0], dataB[2], temp[2][0], temp[2][0 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][1], dataB[2], temp[2][1], temp[2][1 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][2], dataB[2], temp[2][2], temp[2][2 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][3], dataB[2], temp[2][3], temp[2][3 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][4], dataB[2], temp[2][4], temp[2][4 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][5], dataB[2], temp[2][5], temp[2][5 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][6], dataB[2], temp[2][6], temp[2][6 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][7], dataB[2], temp[2][7], temp[2][7 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][8], dataB[2], temp[2][8], temp[2][8 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][9], dataB[2], temp[2][9], temp[2][9 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][10], dataB[2], temp[2][10], temp[2][10 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][11], dataB[2], temp[2][11], temp[2][11 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][12], dataB[2], temp[2][12], temp[2][12 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][13], dataB[2], temp[2][13], temp[2][13 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][14], dataB[2], temp[2][14], temp[2][14 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][15], dataB[2], temp[2][15], temp[2][15 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][16], dataB[2], temp[2][16], temp[2][16 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][17], dataB[2], temp[2][17], temp[2][17 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][18], dataB[2], temp[2][18], temp[2][18 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][19], dataB[2], temp[2][19], temp[2][19 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][20], dataB[2], temp[2][20], temp[2][20 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][21], dataB[2], temp[2][21], temp[2][21 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][22], dataB[2], temp[2][22], temp[2][22 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][23], dataB[2], temp[2][23], temp[2][23 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][24], dataB[2], temp[2][24], temp[2][24 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][25], dataB[2], temp[2][25], temp[2][25 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][26], dataB[2], temp[2][26], temp[2][26 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][27], dataB[2], temp[2][27], temp[2][27 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[3][28], dataB[2], temp[2][28], 1'b0 ) ;
        Mux_shift muxShift ( temp[3][29], dataB[2], temp[2][29], 1'b0 ) ;
        Mux_shift muxShift ( temp[3][30], dataB[2], temp[2][30], 1'b0 ) ;
        Mux_shift muxShift ( temp[3][31], dataB[2], temp[2][31], 1'b0 ) ;
        Mux_shift muxShift ( temp[4][0], dataB[3], temp[3][0], temp[3][0 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][1], dataB[3], temp[3][1], temp[3][1 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][2], dataB[3], temp[3][2], temp[3][2 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][3], dataB[3], temp[3][3], temp[3][3 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][4], dataB[3], temp[3][4], temp[3][4 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][5], dataB[3], temp[3][5], temp[3][5 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][6], dataB[3], temp[3][6], temp[3][6 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][7], dataB[3], temp[3][7], temp[3][7 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][8], dataB[3], temp[3][8], temp[3][8 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][9], dataB[3], temp[3][9], temp[3][9 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][10], dataB[3], temp[3][10], temp[3][10 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][11], dataB[3], temp[3][11], temp[3][11 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][12], dataB[3], temp[3][12], temp[3][12 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][13], dataB[3], temp[3][13], temp[3][13 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][14], dataB[3], temp[3][14], temp[3][14 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][15], dataB[3], temp[3][15], temp[3][15 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][16], dataB[3], temp[3][16], temp[3][16 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][17], dataB[3], temp[3][17], temp[3][17 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][18], dataB[3], temp[3][18], temp[3][18 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][19], dataB[3], temp[3][19], temp[3][19 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][20], dataB[3], temp[3][20], temp[3][20 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][21], dataB[3], temp[3][21], temp[3][21 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][22], dataB[3], temp[3][22], temp[3][22 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][23], dataB[3], temp[3][23], temp[3][23 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][24], dataB[3], temp[3][24], temp[3][24 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][25], dataB[3], temp[3][25], temp[3][25 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[4][26], dataB[3], temp[3][26], 1'b0 ) ;
        Mux_shift muxShift ( temp[4][27], dataB[3], temp[3][27], 1'b0 ) ;
        Mux_shift muxShift ( temp[4][28], dataB[3], temp[3][28], 1'b0 ) ;
        Mux_shift muxShift ( temp[4][29], dataB[3], temp[3][29], 1'b0 ) ;
        Mux_shift muxShift ( temp[4][30], dataB[3], temp[3][30], 1'b0 ) ;
        Mux_shift muxShift ( temp[4][31], dataB[3], temp[3][31], 1'b0 ) ;
        Mux_shift muxShift ( temp[5][0], dataB[4], temp[4][0], temp[4][0 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][1], dataB[4], temp[4][1], temp[4][1 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][2], dataB[4], temp[4][2], temp[4][2 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][3], dataB[4], temp[4][3], temp[4][3 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][4], dataB[4], temp[4][4], temp[4][4 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][5], dataB[4], temp[4][5], temp[4][5 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][6], dataB[4], temp[4][6], temp[4][6 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][7], dataB[4], temp[4][7], temp[4][7 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][8], dataB[4], temp[4][8], temp[4][8 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][9], dataB[4], temp[4][9], temp[4][9 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][10], dataB[4], temp[4][10], temp[4][10 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][11], dataB[4], temp[4][11], temp[4][11 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][12], dataB[4], temp[4][12], temp[4][12 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][13], dataB[4], temp[4][13], temp[4][13 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][14], dataB[4], temp[4][14], temp[4][14 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][15], dataB[4], temp[4][15], temp[4][15 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][16], dataB[4], temp[4][16], temp[4][16 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][17], dataB[4], temp[4][17], temp[4][17 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][18], dataB[4], temp[4][18], temp[4][18 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][19], dataB[4], temp[4][19], temp[4][19 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][20], dataB[4], temp[4][20], temp[4][20 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][21], dataB[4], temp[4][21], temp[4][21 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][22], dataB[4], temp[4][22], temp[4][22 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][23], dataB[4], temp[4][23], temp[4][23 + 2 ** i ] ) ;
        Mux_shift muxShift ( temp[5][24], dataB[4], temp[4][24], 1'b0 ) ;
        Mux_shift muxShift ( temp[5][25], dataB[4], temp[4][25], 1'b0 ) ;
        Mux_shift muxShift ( temp[5][26], dataB[4], temp[4][26], 1'b0 ) ;
        Mux_shift muxShift ( temp[5][27], dataB[4], temp[4][27], 1'b0 ) ;
        Mux_shift muxShift ( temp[5][28], dataB[4], temp[4][28], 1'b0 ) ;
        Mux_shift muxShift ( temp[5][29], dataB[4], temp[4][29], 1'b0 ) ;
        Mux_shift muxShift ( temp[5][30], dataB[4], temp[4][30], 1'b0 ) ;
        Mux_shift muxShift ( temp[5][31], dataB[4], temp[4][31], 1'b0 ) ;
    endgenerate

    assign dataOut = temp[5];


endmodule
