`timescale 1ns / 1ns
module ALU (
    clk,
    itype,
    dataA,
    dataB,
    Signal,
    shamt,
    hilo,
    dataOut,
    zero
);
    input clk, itype;
    input [31:0] dataA;
    input [31:0] dataB;
    input [5:0] Signal;
    input [4:0] shamt;
    input [63:0] hilo;
    output reg [31:0] dataOut;
    output zero;
    assign zero = iszero;

    //   Signal ( 6-bits)?
    //   AND  : 36
    //   OR   : 37
    //   ADD  : 32
    //   SUB  : 34
    //   SLT  : 42
    reg iszero;
    reg [31:0] temp;

    parameter AND = 6'b100100;
    parameter OR = 6'b100101;
    parameter ADD = 6'b100000;
    parameter SUB = 6'b100010;
    parameter SLT = 6'b101010;


    wire [31:0] a, b;
    wire [31:0] sum, wireand, wireor, ans;
    wire [32:0] carry;
    wire [31:0] sltsignal;
    Mux_2to1_array mux_2to1_array (
        sltsignal,
        sum[31],
        32'b0,
        32'b1
    );

    assign a = dataA;
    wire isadd, issub, isor, isand, isslt;
    assign carry[0] = issub;


    assign isadd = (Signal == ADD) || itype;
    /*
    Equal_array_6 equal_array_6_0 (
        isadd,
        Signal,
        ADD
    );
    */

    //assign issub = (Signal == SUB) || (Signal == SLT);
    wire isjustsub;
    Equal_array_6 equal_array_6_1 (
        isjustsub,
        Signal,
        SUB
    );
    or (issub, isjustsub, isslt);

    //assign isor  = (Signal == OR);
    Equal_array_6 equal_array_6_2 (
        isor,
        Signal,
        OR
    );

    //assign isand = (Signal == AND);
    Equal_array_6 equal_array_6_3 (
        isand,
        Signal,
        AND
    );

    //assign isslt = (Signal == SLT);
    Equal_array_6 equal_array_6_4 (
        isslt,
        Signal,
        SLT
    );

    wire [1:0] select;
    //assign select = isslt ? 3 : (isadd || issub) ? 0 : isor ? 1 : 2;
    or (select[1], isslt, isand);
    or (select[0], isslt, isor);


    /*
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin
            FA fa (
                a[i],
                b[i],
                carry[i],
                carry[i+1],
                sum[i]
            );
            xor (b[i], dataB[i], issub);
            and (wireand[i], a[i], b[i]);
            or (wireor[i], a[i], b[i]);
        end
    endgenerate
    */

    /* python
        i = 0
    while i < 32:
        print(f"//bit{i}")
        print(f"FA fa_{i}(a[{i}],b[{i}],carry[{i}],carry[{i+1}],sum[{i}]);")
        print(f"xor (b[{i}], dataB[{i}], issub);")
        print(f"and (wireand[{i}], a[{i}], b[{i}]);")
        print(f"or (wireor[{i}], a[{i}], b[{i}]);")
    i = i + 1
    */


    //------------------------------------------------
    //bit0
    FA fa_0 (
        a[0],
        b[0],
        carry[0],
        carry[1],
        sum[0]
    );
    xor (b[0], dataB[0], issub);
    and (wireand[0], a[0], b[0]);
    or (wireor[0], a[0], b[0]);
    //bit1
    FA fa_1 (
        a[1],
        b[1],
        carry[1],
        carry[2],
        sum[1]
    );
    xor (b[1], dataB[1], issub);
    and (wireand[1], a[1], b[1]);
    or (wireor[1], a[1], b[1]);
    //bit2
    FA fa_2 (
        a[2],
        b[2],
        carry[2],
        carry[3],
        sum[2]
    );
    xor (b[2], dataB[2], issub);
    and (wireand[2], a[2], b[2]);
    or (wireor[2], a[2], b[2]);
    //bit3
    FA fa_3 (
        a[3],
        b[3],
        carry[3],
        carry[4],
        sum[3]
    );
    xor (b[3], dataB[3], issub);
    and (wireand[3], a[3], b[3]);
    or (wireor[3], a[3], b[3]);
    //bit4
    FA fa_4 (
        a[4],
        b[4],
        carry[4],
        carry[5],
        sum[4]
    );
    xor (b[4], dataB[4], issub);
    and (wireand[4], a[4], b[4]);
    or (wireor[4], a[4], b[4]);
    //bit5
    FA fa_5 (
        a[5],
        b[5],
        carry[5],
        carry[6],
        sum[5]
    );
    xor (b[5], dataB[5], issub);
    and (wireand[5], a[5], b[5]);
    or (wireor[5], a[5], b[5]);
    //bit6
    FA fa_6 (
        a[6],
        b[6],
        carry[6],
        carry[7],
        sum[6]
    );
    xor (b[6], dataB[6], issub);
    and (wireand[6], a[6], b[6]);
    or (wireor[6], a[6], b[6]);
    //bit7
    FA fa_7 (
        a[7],
        b[7],
        carry[7],
        carry[8],
        sum[7]
    );
    xor (b[7], dataB[7], issub);
    and (wireand[7], a[7], b[7]);
    or (wireor[7], a[7], b[7]);
    //bit8
    FA fa_8 (
        a[8],
        b[8],
        carry[8],
        carry[9],
        sum[8]
    );
    xor (b[8], dataB[8], issub);
    and (wireand[8], a[8], b[8]);
    or (wireor[8], a[8], b[8]);
    //bit9
    FA fa_9 (
        a[9],
        b[9],
        carry[9],
        carry[10],
        sum[9]
    );
    xor (b[9], dataB[9], issub);
    and (wireand[9], a[9], b[9]);
    or (wireor[9], a[9], b[9]);
    //bit10
    FA fa_10 (
        a[10],
        b[10],
        carry[10],
        carry[11],
        sum[10]
    );
    xor (b[10], dataB[10], issub);
    and (wireand[10], a[10], b[10]);
    or (wireor[10], a[10], b[10]);
    //bit11
    FA fa_11 (
        a[11],
        b[11],
        carry[11],
        carry[12],
        sum[11]
    );
    xor (b[11], dataB[11], issub);
    and (wireand[11], a[11], b[11]);
    or (wireor[11], a[11], b[11]);
    //bit12
    FA fa_12 (
        a[12],
        b[12],
        carry[12],
        carry[13],
        sum[12]
    );
    xor (b[12], dataB[12], issub);
    and (wireand[12], a[12], b[12]);
    or (wireor[12], a[12], b[12]);
    //bit13
    FA fa_13 (
        a[13],
        b[13],
        carry[13],
        carry[14],
        sum[13]
    );
    xor (b[13], dataB[13], issub);
    and (wireand[13], a[13], b[13]);
    or (wireor[13], a[13], b[13]);
    //bit14
    FA fa_14 (
        a[14],
        b[14],
        carry[14],
        carry[15],
        sum[14]
    );
    xor (b[14], dataB[14], issub);
    and (wireand[14], a[14], b[14]);
    or (wireor[14], a[14], b[14]);
    //bit15
    FA fa_15 (
        a[15],
        b[15],
        carry[15],
        carry[16],
        sum[15]
    );
    xor (b[15], dataB[15], issub);
    and (wireand[15], a[15], b[15]);
    or (wireor[15], a[15], b[15]);
    //bit16
    FA fa_16 (
        a[16],
        b[16],
        carry[16],
        carry[17],
        sum[16]
    );
    xor (b[16], dataB[16], issub);
    and (wireand[16], a[16], b[16]);
    or (wireor[16], a[16], b[16]);
    //bit17
    FA fa_17 (
        a[17],
        b[17],
        carry[17],
        carry[18],
        sum[17]
    );
    xor (b[17], dataB[17], issub);
    and (wireand[17], a[17], b[17]);
    or (wireor[17], a[17], b[17]);
    //bit18
    FA fa_18 (
        a[18],
        b[18],
        carry[18],
        carry[19],
        sum[18]
    );
    xor (b[18], dataB[18], issub);
    and (wireand[18], a[18], b[18]);
    or (wireor[18], a[18], b[18]);
    //bit19
    FA fa_19 (
        a[19],
        b[19],
        carry[19],
        carry[20],
        sum[19]
    );
    xor (b[19], dataB[19], issub);
    and (wireand[19], a[19], b[19]);
    or (wireor[19], a[19], b[19]);
    //bit20
    FA fa_20 (
        a[20],
        b[20],
        carry[20],
        carry[21],
        sum[20]
    );
    xor (b[20], dataB[20], issub);
    and (wireand[20], a[20], b[20]);
    or (wireor[20], a[20], b[20]);
    //bit21
    FA fa_21 (
        a[21],
        b[21],
        carry[21],
        carry[22],
        sum[21]
    );
    xor (b[21], dataB[21], issub);
    and (wireand[21], a[21], b[21]);
    or (wireor[21], a[21], b[21]);
    //bit22
    FA fa_22 (
        a[22],
        b[22],
        carry[22],
        carry[23],
        sum[22]
    );
    xor (b[22], dataB[22], issub);
    and (wireand[22], a[22], b[22]);
    or (wireor[22], a[22], b[22]);
    //bit23
    FA fa_23 (
        a[23],
        b[23],
        carry[23],
        carry[24],
        sum[23]
    );
    xor (b[23], dataB[23], issub);
    and (wireand[23], a[23], b[23]);
    or (wireor[23], a[23], b[23]);
    //bit24
    FA fa_24 (
        a[24],
        b[24],
        carry[24],
        carry[25],
        sum[24]
    );
    xor (b[24], dataB[24], issub);
    and (wireand[24], a[24], b[24]);
    or (wireor[24], a[24], b[24]);
    //bit25
    FA fa_25 (
        a[25],
        b[25],
        carry[25],
        carry[26],
        sum[25]
    );
    xor (b[25], dataB[25], issub);
    and (wireand[25], a[25], b[25]);
    or (wireor[25], a[25], b[25]);
    //bit26
    FA fa_26 (
        a[26],
        b[26],
        carry[26],
        carry[27],
        sum[26]
    );
    xor (b[26], dataB[26], issub);
    and (wireand[26], a[26], b[26]);
    or (wireor[26], a[26], b[26]);
    //bit27
    FA fa_27 (
        a[27],
        b[27],
        carry[27],
        carry[28],
        sum[27]
    );
    xor (b[27], dataB[27], issub);
    and (wireand[27], a[27], b[27]);
    or (wireor[27], a[27], b[27]);
    //bit28
    FA fa_28 (
        a[28],
        b[28],
        carry[28],
        carry[29],
        sum[28]
    );
    xor (b[28], dataB[28], issub);
    and (wireand[28], a[28], b[28]);
    or (wireor[28], a[28], b[28]);
    //bit29
    FA fa_29 (
        a[29],
        b[29],
        carry[29],
        carry[30],
        sum[29]
    );
    xor (b[29], dataB[29], issub);
    and (wireand[29], a[29], b[29]);
    or (wireor[29], a[29], b[29]);
    //bit30
    FA fa_30 (
        a[30],
        b[30],
        carry[30],
        carry[31],
        sum[30]
    );
    xor (b[30], dataB[30], issub);
    and (wireand[30], a[30], b[30]);
    or (wireor[30], a[30], b[30]);
    //bit31
    FA fa_31 (
        a[31],
        b[31],
        carry[31],
        carry[32],
        sum[31]
    );
    xor (b[31], dataB[31], issub);
    and (wireand[31], a[31], b[31]);
    or (wireor[31], a[31], b[31]);

    //------------------------------------------------


    Mux_4to1_array mux_4to1_array (
        ans,
        select,
        sum,
        wireor,
        wireand,
        sltsignal
    );

    wire [31:0] shifterans;
    Shifter shifter (
        dataB,
        shamt,
        shifterans
    );

    wire [31:0] ans1;
    assign ans1 =   (Signal == 2) ? shifterans :
                    (Signal == 16)? hilo[63:32]:
                    (Signal == 18)?hilo[31:0]:ans;

    wire [31:0] ans2;

    assign ans2 = itype ? sum : ans1;

    always @(posedge clk) begin
        dataOut <= ans1;
        iszero  <= (dataA == dataB);
        //if (itype) $display("itype!!!!!!!!!!!!!!!!\n");
    end

endmodule
