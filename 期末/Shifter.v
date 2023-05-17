`timescale 1ns / 1ns
module Shifter (
    dataA,
    dataB,
    dataOut
);
    input [31:0] dataA;
    input [4:0] dataB;
    output [31:0] dataOut;


    wire [31:0] temp[5:0];

    assign temp[0] = dataA;

    /*
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
   */

    /* python
    i = 0
    while i < 5:
        j = 0
        while j + 2**i < 32:
            print(
                f"Mux_2to1 mux2to1_{i}_{j}(temp[{i+1}][{j}],dataB[{i}],temp[{i}][{j}],temp[{i}][{j+2**(i)}]);"
            )
            j = j + 1

        while j < 32:
            print(
                f"Mux_2to1 mux2to1_{i}_{j}(temp[{i+1}][{j}],dataB[{i}],temp[{i}][{j}],1'b0);"
            )
            j = j + 1
        i = i + 1
    */

    Mux_2to1 mux2to1_0_0 (
        temp[1][0],
        dataB[0],
        temp[0][0],
        temp[0][1]
    );
    Mux_2to1 mux2to1_0_1 (
        temp[1][1],
        dataB[0],
        temp[0][1],
        temp[0][2]
    );
    Mux_2to1 mux2to1_0_2 (
        temp[1][2],
        dataB[0],
        temp[0][2],
        temp[0][3]
    );
    Mux_2to1 mux2to1_0_3 (
        temp[1][3],
        dataB[0],
        temp[0][3],
        temp[0][4]
    );
    Mux_2to1 mux2to1_0_4 (
        temp[1][4],
        dataB[0],
        temp[0][4],
        temp[0][5]
    );
    Mux_2to1 mux2to1_0_5 (
        temp[1][5],
        dataB[0],
        temp[0][5],
        temp[0][6]
    );
    Mux_2to1 mux2to1_0_6 (
        temp[1][6],
        dataB[0],
        temp[0][6],
        temp[0][7]
    );
    Mux_2to1 mux2to1_0_7 (
        temp[1][7],
        dataB[0],
        temp[0][7],
        temp[0][8]
    );
    Mux_2to1 mux2to1_0_8 (
        temp[1][8],
        dataB[0],
        temp[0][8],
        temp[0][9]
    );
    Mux_2to1 mux2to1_0_9 (
        temp[1][9],
        dataB[0],
        temp[0][9],
        temp[0][10]
    );
    Mux_2to1 mux2to1_0_10 (
        temp[1][10],
        dataB[0],
        temp[0][10],
        temp[0][11]
    );
    Mux_2to1 mux2to1_0_11 (
        temp[1][11],
        dataB[0],
        temp[0][11],
        temp[0][12]
    );
    Mux_2to1 mux2to1_0_12 (
        temp[1][12],
        dataB[0],
        temp[0][12],
        temp[0][13]
    );
    Mux_2to1 mux2to1_0_13 (
        temp[1][13],
        dataB[0],
        temp[0][13],
        temp[0][14]
    );
    Mux_2to1 mux2to1_0_14 (
        temp[1][14],
        dataB[0],
        temp[0][14],
        temp[0][15]
    );
    Mux_2to1 mux2to1_0_15 (
        temp[1][15],
        dataB[0],
        temp[0][15],
        temp[0][16]
    );
    Mux_2to1 mux2to1_0_16 (
        temp[1][16],
        dataB[0],
        temp[0][16],
        temp[0][17]
    );
    Mux_2to1 mux2to1_0_17 (
        temp[1][17],
        dataB[0],
        temp[0][17],
        temp[0][18]
    );
    Mux_2to1 mux2to1_0_18 (
        temp[1][18],
        dataB[0],
        temp[0][18],
        temp[0][19]
    );
    Mux_2to1 mux2to1_0_19 (
        temp[1][19],
        dataB[0],
        temp[0][19],
        temp[0][20]
    );
    Mux_2to1 mux2to1_0_20 (
        temp[1][20],
        dataB[0],
        temp[0][20],
        temp[0][21]
    );
    Mux_2to1 mux2to1_0_21 (
        temp[1][21],
        dataB[0],
        temp[0][21],
        temp[0][22]
    );
    Mux_2to1 mux2to1_0_22 (
        temp[1][22],
        dataB[0],
        temp[0][22],
        temp[0][23]
    );
    Mux_2to1 mux2to1_0_23 (
        temp[1][23],
        dataB[0],
        temp[0][23],
        temp[0][24]
    );
    Mux_2to1 mux2to1_0_24 (
        temp[1][24],
        dataB[0],
        temp[0][24],
        temp[0][25]
    );
    Mux_2to1 mux2to1_0_25 (
        temp[1][25],
        dataB[0],
        temp[0][25],
        temp[0][26]
    );
    Mux_2to1 mux2to1_0_26 (
        temp[1][26],
        dataB[0],
        temp[0][26],
        temp[0][27]
    );
    Mux_2to1 mux2to1_0_27 (
        temp[1][27],
        dataB[0],
        temp[0][27],
        temp[0][28]
    );
    Mux_2to1 mux2to1_0_28 (
        temp[1][28],
        dataB[0],
        temp[0][28],
        temp[0][29]
    );
    Mux_2to1 mux2to1_0_29 (
        temp[1][29],
        dataB[0],
        temp[0][29],
        temp[0][30]
    );
    Mux_2to1 mux2to1_0_30 (
        temp[1][30],
        dataB[0],
        temp[0][30],
        temp[0][31]
    );
    Mux_2to1 mux2to1_0_31 (
        temp[1][31],
        dataB[0],
        temp[0][31],
        1'b0
    );
    Mux_2to1 mux2to1_1_0 (
        temp[2][0],
        dataB[1],
        temp[1][0],
        temp[1][2]
    );
    Mux_2to1 mux2to1_1_1 (
        temp[2][1],
        dataB[1],
        temp[1][1],
        temp[1][3]
    );
    Mux_2to1 mux2to1_1_2 (
        temp[2][2],
        dataB[1],
        temp[1][2],
        temp[1][4]
    );
    Mux_2to1 mux2to1_1_3 (
        temp[2][3],
        dataB[1],
        temp[1][3],
        temp[1][5]
    );
    Mux_2to1 mux2to1_1_4 (
        temp[2][4],
        dataB[1],
        temp[1][4],
        temp[1][6]
    );
    Mux_2to1 mux2to1_1_5 (
        temp[2][5],
        dataB[1],
        temp[1][5],
        temp[1][7]
    );
    Mux_2to1 mux2to1_1_6 (
        temp[2][6],
        dataB[1],
        temp[1][6],
        temp[1][8]
    );
    Mux_2to1 mux2to1_1_7 (
        temp[2][7],
        dataB[1],
        temp[1][7],
        temp[1][9]
    );
    Mux_2to1 mux2to1_1_8 (
        temp[2][8],
        dataB[1],
        temp[1][8],
        temp[1][10]
    );
    Mux_2to1 mux2to1_1_9 (
        temp[2][9],
        dataB[1],
        temp[1][9],
        temp[1][11]
    );
    Mux_2to1 mux2to1_1_10 (
        temp[2][10],
        dataB[1],
        temp[1][10],
        temp[1][12]
    );
    Mux_2to1 mux2to1_1_11 (
        temp[2][11],
        dataB[1],
        temp[1][11],
        temp[1][13]
    );
    Mux_2to1 mux2to1_1_12 (
        temp[2][12],
        dataB[1],
        temp[1][12],
        temp[1][14]
    );
    Mux_2to1 mux2to1_1_13 (
        temp[2][13],
        dataB[1],
        temp[1][13],
        temp[1][15]
    );
    Mux_2to1 mux2to1_1_14 (
        temp[2][14],
        dataB[1],
        temp[1][14],
        temp[1][16]
    );
    Mux_2to1 mux2to1_1_15 (
        temp[2][15],
        dataB[1],
        temp[1][15],
        temp[1][17]
    );
    Mux_2to1 mux2to1_1_16 (
        temp[2][16],
        dataB[1],
        temp[1][16],
        temp[1][18]
    );
    Mux_2to1 mux2to1_1_17 (
        temp[2][17],
        dataB[1],
        temp[1][17],
        temp[1][19]
    );
    Mux_2to1 mux2to1_1_18 (
        temp[2][18],
        dataB[1],
        temp[1][18],
        temp[1][20]
    );
    Mux_2to1 mux2to1_1_19 (
        temp[2][19],
        dataB[1],
        temp[1][19],
        temp[1][21]
    );
    Mux_2to1 mux2to1_1_20 (
        temp[2][20],
        dataB[1],
        temp[1][20],
        temp[1][22]
    );
    Mux_2to1 mux2to1_1_21 (
        temp[2][21],
        dataB[1],
        temp[1][21],
        temp[1][23]
    );
    Mux_2to1 mux2to1_1_22 (
        temp[2][22],
        dataB[1],
        temp[1][22],
        temp[1][24]
    );
    Mux_2to1 mux2to1_1_23 (
        temp[2][23],
        dataB[1],
        temp[1][23],
        temp[1][25]
    );
    Mux_2to1 mux2to1_1_24 (
        temp[2][24],
        dataB[1],
        temp[1][24],
        temp[1][26]
    );
    Mux_2to1 mux2to1_1_25 (
        temp[2][25],
        dataB[1],
        temp[1][25],
        temp[1][27]
    );
    Mux_2to1 mux2to1_1_26 (
        temp[2][26],
        dataB[1],
        temp[1][26],
        temp[1][28]
    );
    Mux_2to1 mux2to1_1_27 (
        temp[2][27],
        dataB[1],
        temp[1][27],
        temp[1][29]
    );
    Mux_2to1 mux2to1_1_28 (
        temp[2][28],
        dataB[1],
        temp[1][28],
        temp[1][30]
    );
    Mux_2to1 mux2to1_1_29 (
        temp[2][29],
        dataB[1],
        temp[1][29],
        temp[1][31]
    );
    Mux_2to1 mux2to1_1_30 (
        temp[2][30],
        dataB[1],
        temp[1][30],
        1'b0
    );
    Mux_2to1 mux2to1_1_31 (
        temp[2][31],
        dataB[1],
        temp[1][31],
        1'b0
    );
    Mux_2to1 mux2to1_2_0 (
        temp[3][0],
        dataB[2],
        temp[2][0],
        temp[2][4]
    );
    Mux_2to1 mux2to1_2_1 (
        temp[3][1],
        dataB[2],
        temp[2][1],
        temp[2][5]
    );
    Mux_2to1 mux2to1_2_2 (
        temp[3][2],
        dataB[2],
        temp[2][2],
        temp[2][6]
    );
    Mux_2to1 mux2to1_2_3 (
        temp[3][3],
        dataB[2],
        temp[2][3],
        temp[2][7]
    );
    Mux_2to1 mux2to1_2_4 (
        temp[3][4],
        dataB[2],
        temp[2][4],
        temp[2][8]
    );
    Mux_2to1 mux2to1_2_5 (
        temp[3][5],
        dataB[2],
        temp[2][5],
        temp[2][9]
    );
    Mux_2to1 mux2to1_2_6 (
        temp[3][6],
        dataB[2],
        temp[2][6],
        temp[2][10]
    );
    Mux_2to1 mux2to1_2_7 (
        temp[3][7],
        dataB[2],
        temp[2][7],
        temp[2][11]
    );
    Mux_2to1 mux2to1_2_8 (
        temp[3][8],
        dataB[2],
        temp[2][8],
        temp[2][12]
    );
    Mux_2to1 mux2to1_2_9 (
        temp[3][9],
        dataB[2],
        temp[2][9],
        temp[2][13]
    );
    Mux_2to1 mux2to1_2_10 (
        temp[3][10],
        dataB[2],
        temp[2][10],
        temp[2][14]
    );
    Mux_2to1 mux2to1_2_11 (
        temp[3][11],
        dataB[2],
        temp[2][11],
        temp[2][15]
    );
    Mux_2to1 mux2to1_2_12 (
        temp[3][12],
        dataB[2],
        temp[2][12],
        temp[2][16]
    );
    Mux_2to1 mux2to1_2_13 (
        temp[3][13],
        dataB[2],
        temp[2][13],
        temp[2][17]
    );
    Mux_2to1 mux2to1_2_14 (
        temp[3][14],
        dataB[2],
        temp[2][14],
        temp[2][18]
    );
    Mux_2to1 mux2to1_2_15 (
        temp[3][15],
        dataB[2],
        temp[2][15],
        temp[2][19]
    );
    Mux_2to1 mux2to1_2_16 (
        temp[3][16],
        dataB[2],
        temp[2][16],
        temp[2][20]
    );
    Mux_2to1 mux2to1_2_17 (
        temp[3][17],
        dataB[2],
        temp[2][17],
        temp[2][21]
    );
    Mux_2to1 mux2to1_2_18 (
        temp[3][18],
        dataB[2],
        temp[2][18],
        temp[2][22]
    );
    Mux_2to1 mux2to1_2_19 (
        temp[3][19],
        dataB[2],
        temp[2][19],
        temp[2][23]
    );
    Mux_2to1 mux2to1_2_20 (
        temp[3][20],
        dataB[2],
        temp[2][20],
        temp[2][24]
    );
    Mux_2to1 mux2to1_2_21 (
        temp[3][21],
        dataB[2],
        temp[2][21],
        temp[2][25]
    );
    Mux_2to1 mux2to1_2_22 (
        temp[3][22],
        dataB[2],
        temp[2][22],
        temp[2][26]
    );
    Mux_2to1 mux2to1_2_23 (
        temp[3][23],
        dataB[2],
        temp[2][23],
        temp[2][27]
    );
    Mux_2to1 mux2to1_2_24 (
        temp[3][24],
        dataB[2],
        temp[2][24],
        temp[2][28]
    );
    Mux_2to1 mux2to1_2_25 (
        temp[3][25],
        dataB[2],
        temp[2][25],
        temp[2][29]
    );
    Mux_2to1 mux2to1_2_26 (
        temp[3][26],
        dataB[2],
        temp[2][26],
        temp[2][30]
    );
    Mux_2to1 mux2to1_2_27 (
        temp[3][27],
        dataB[2],
        temp[2][27],
        temp[2][31]
    );
    Mux_2to1 mux2to1_2_28 (
        temp[3][28],
        dataB[2],
        temp[2][28],
        1'b0
    );
    Mux_2to1 mux2to1_2_29 (
        temp[3][29],
        dataB[2],
        temp[2][29],
        1'b0
    );
    Mux_2to1 mux2to1_2_30 (
        temp[3][30],
        dataB[2],
        temp[2][30],
        1'b0
    );
    Mux_2to1 mux2to1_2_31 (
        temp[3][31],
        dataB[2],
        temp[2][31],
        1'b0
    );
    Mux_2to1 mux2to1_3_0 (
        temp[4][0],
        dataB[3],
        temp[3][0],
        temp[3][8]
    );
    Mux_2to1 mux2to1_3_1 (
        temp[4][1],
        dataB[3],
        temp[3][1],
        temp[3][9]
    );
    Mux_2to1 mux2to1_3_2 (
        temp[4][2],
        dataB[3],
        temp[3][2],
        temp[3][10]
    );
    Mux_2to1 mux2to1_3_3 (
        temp[4][3],
        dataB[3],
        temp[3][3],
        temp[3][11]
    );
    Mux_2to1 mux2to1_3_4 (
        temp[4][4],
        dataB[3],
        temp[3][4],
        temp[3][12]
    );
    Mux_2to1 mux2to1_3_5 (
        temp[4][5],
        dataB[3],
        temp[3][5],
        temp[3][13]
    );
    Mux_2to1 mux2to1_3_6 (
        temp[4][6],
        dataB[3],
        temp[3][6],
        temp[3][14]
    );
    Mux_2to1 mux2to1_3_7 (
        temp[4][7],
        dataB[3],
        temp[3][7],
        temp[3][15]
    );
    Mux_2to1 mux2to1_3_8 (
        temp[4][8],
        dataB[3],
        temp[3][8],
        temp[3][16]
    );
    Mux_2to1 mux2to1_3_9 (
        temp[4][9],
        dataB[3],
        temp[3][9],
        temp[3][17]
    );
    Mux_2to1 mux2to1_3_10 (
        temp[4][10],
        dataB[3],
        temp[3][10],
        temp[3][18]
    );
    Mux_2to1 mux2to1_3_11 (
        temp[4][11],
        dataB[3],
        temp[3][11],
        temp[3][19]
    );
    Mux_2to1 mux2to1_3_12 (
        temp[4][12],
        dataB[3],
        temp[3][12],
        temp[3][20]
    );
    Mux_2to1 mux2to1_3_13 (
        temp[4][13],
        dataB[3],
        temp[3][13],
        temp[3][21]
    );
    Mux_2to1 mux2to1_3_14 (
        temp[4][14],
        dataB[3],
        temp[3][14],
        temp[3][22]
    );
    Mux_2to1 mux2to1_3_15 (
        temp[4][15],
        dataB[3],
        temp[3][15],
        temp[3][23]
    );
    Mux_2to1 mux2to1_3_16 (
        temp[4][16],
        dataB[3],
        temp[3][16],
        temp[3][24]
    );
    Mux_2to1 mux2to1_3_17 (
        temp[4][17],
        dataB[3],
        temp[3][17],
        temp[3][25]
    );
    Mux_2to1 mux2to1_3_18 (
        temp[4][18],
        dataB[3],
        temp[3][18],
        temp[3][26]
    );
    Mux_2to1 mux2to1_3_19 (
        temp[4][19],
        dataB[3],
        temp[3][19],
        temp[3][27]
    );
    Mux_2to1 mux2to1_3_20 (
        temp[4][20],
        dataB[3],
        temp[3][20],
        temp[3][28]
    );
    Mux_2to1 mux2to1_3_21 (
        temp[4][21],
        dataB[3],
        temp[3][21],
        temp[3][29]
    );
    Mux_2to1 mux2to1_3_22 (
        temp[4][22],
        dataB[3],
        temp[3][22],
        temp[3][30]
    );
    Mux_2to1 mux2to1_3_23 (
        temp[4][23],
        dataB[3],
        temp[3][23],
        temp[3][31]
    );
    Mux_2to1 mux2to1_3_24 (
        temp[4][24],
        dataB[3],
        temp[3][24],
        1'b0
    );
    Mux_2to1 mux2to1_3_25 (
        temp[4][25],
        dataB[3],
        temp[3][25],
        1'b0
    );
    Mux_2to1 mux2to1_3_26 (
        temp[4][26],
        dataB[3],
        temp[3][26],
        1'b0
    );
    Mux_2to1 mux2to1_3_27 (
        temp[4][27],
        dataB[3],
        temp[3][27],
        1'b0
    );
    Mux_2to1 mux2to1_3_28 (
        temp[4][28],
        dataB[3],
        temp[3][28],
        1'b0
    );
    Mux_2to1 mux2to1_3_29 (
        temp[4][29],
        dataB[3],
        temp[3][29],
        1'b0
    );
    Mux_2to1 mux2to1_3_30 (
        temp[4][30],
        dataB[3],
        temp[3][30],
        1'b0
    );
    Mux_2to1 mux2to1_3_31 (
        temp[4][31],
        dataB[3],
        temp[3][31],
        1'b0
    );
    Mux_2to1 mux2to1_4_0 (
        temp[5][0],
        dataB[4],
        temp[4][0],
        temp[4][16]
    );
    Mux_2to1 mux2to1_4_1 (
        temp[5][1],
        dataB[4],
        temp[4][1],
        temp[4][17]
    );
    Mux_2to1 mux2to1_4_2 (
        temp[5][2],
        dataB[4],
        temp[4][2],
        temp[4][18]
    );
    Mux_2to1 mux2to1_4_3 (
        temp[5][3],
        dataB[4],
        temp[4][3],
        temp[4][19]
    );
    Mux_2to1 mux2to1_4_4 (
        temp[5][4],
        dataB[4],
        temp[4][4],
        temp[4][20]
    );
    Mux_2to1 mux2to1_4_5 (
        temp[5][5],
        dataB[4],
        temp[4][5],
        temp[4][21]
    );
    Mux_2to1 mux2to1_4_6 (
        temp[5][6],
        dataB[4],
        temp[4][6],
        temp[4][22]
    );
    Mux_2to1 mux2to1_4_7 (
        temp[5][7],
        dataB[4],
        temp[4][7],
        temp[4][23]
    );
    Mux_2to1 mux2to1_4_8 (
        temp[5][8],
        dataB[4],
        temp[4][8],
        temp[4][24]
    );
    Mux_2to1 mux2to1_4_9 (
        temp[5][9],
        dataB[4],
        temp[4][9],
        temp[4][25]
    );
    Mux_2to1 mux2to1_4_10 (
        temp[5][10],
        dataB[4],
        temp[4][10],
        temp[4][26]
    );
    Mux_2to1 mux2to1_4_11 (
        temp[5][11],
        dataB[4],
        temp[4][11],
        temp[4][27]
    );
    Mux_2to1 mux2to1_4_12 (
        temp[5][12],
        dataB[4],
        temp[4][12],
        temp[4][28]
    );
    Mux_2to1 mux2to1_4_13 (
        temp[5][13],
        dataB[4],
        temp[4][13],
        temp[4][29]
    );
    Mux_2to1 mux2to1_4_14 (
        temp[5][14],
        dataB[4],
        temp[4][14],
        temp[4][30]
    );
    Mux_2to1 mux2to1_4_15 (
        temp[5][15],
        dataB[4],
        temp[4][15],
        temp[4][31]
    );
    Mux_2to1 mux2to1_4_16 (
        temp[5][16],
        dataB[4],
        temp[4][16],
        1'b0
    );
    Mux_2to1 mux2to1_4_17 (
        temp[5][17],
        dataB[4],
        temp[4][17],
        1'b0
    );
    Mux_2to1 mux2to1_4_18 (
        temp[5][18],
        dataB[4],
        temp[4][18],
        1'b0
    );
    Mux_2to1 mux2to1_4_19 (
        temp[5][19],
        dataB[4],
        temp[4][19],
        1'b0
    );
    Mux_2to1 mux2to1_4_20 (
        temp[5][20],
        dataB[4],
        temp[4][20],
        1'b0
    );
    Mux_2to1 mux2to1_4_21 (
        temp[5][21],
        dataB[4],
        temp[4][21],
        1'b0
    );
    Mux_2to1 mux2to1_4_22 (
        temp[5][22],
        dataB[4],
        temp[4][22],
        1'b0
    );
    Mux_2to1 mux2to1_4_23 (
        temp[5][23],
        dataB[4],
        temp[4][23],
        1'b0
    );
    Mux_2to1 mux2to1_4_24 (
        temp[5][24],
        dataB[4],
        temp[4][24],
        1'b0
    );
    Mux_2to1 mux2to1_4_25 (
        temp[5][25],
        dataB[4],
        temp[4][25],
        1'b0
    );
    Mux_2to1 mux2to1_4_26 (
        temp[5][26],
        dataB[4],
        temp[4][26],
        1'b0
    );
    Mux_2to1 mux2to1_4_27 (
        temp[5][27],
        dataB[4],
        temp[4][27],
        1'b0
    );
    Mux_2to1 mux2to1_4_28 (
        temp[5][28],
        dataB[4],
        temp[4][28],
        1'b0
    );
    Mux_2to1 mux2to1_4_29 (
        temp[5][29],
        dataB[4],
        temp[4][29],
        1'b0
    );
    Mux_2to1 mux2to1_4_30 (
        temp[5][30],
        dataB[4],
        temp[4][30],
        1'b0
    );
    Mux_2to1 mux2to1_4_31 (
        temp[5][31],
        dataB[4],
        temp[4][31],
        1'b0
    );



    assign dataOut = temp[5];


endmodule
