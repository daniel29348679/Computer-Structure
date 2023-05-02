`timescale 1ns / 1ns
module ALU (
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

    //   Signal ( 6-bits)?
    //   AND  : 36
    //   OR   : 37
    //   ADD  : 32
    //   SUB  : 34
    //   SLT  : 42

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

    assign carry[0] = issub;


    wire isadd, issub, isor, isand, isslt;
    //assign isadd = (Signal == ADD);
    Equal_array_6 equal_array_6_0 (
        isadd,
        Signal,
        ADD
    );

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

    Mux_4to1_array mux_4to1_array (
        ans,
        select,
        sum,
        wireor,
        wireand,
        sltsignal
    );

    assign dataOut = ans;

endmodule
