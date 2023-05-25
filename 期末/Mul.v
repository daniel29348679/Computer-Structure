`timescale 1ns / 1ns
module Mul (
    clka,
    clkb,
    dataA,
    dataB,
    Signal,
    dataOut
);
    input clka, clkb;
    input [31:0] dataA;
    input [31:0] dataB;
    input [31:0] Signal;
    output [63:0] dataOut;


    reg [6:0] count;

    reg [63:0] temp, mcnd;
    reg [31:0] mpr;

    initial begin
        temp  = 64'b00000000000000000000000000000000;
        count = 0;
    end

    always @(posedge clka) begin
        if (Signal[31:26] == 0 && Signal[5:0] == 25) begin  //multu
            mcnd  <= {{32{1'b0}}, dataA};
            mpr   <= dataB;
            temp  <= 0;
            count <= 32;
        end

        if (Signal[31:26] == 28 && Signal[5:0] == 4) begin  //maddu
            mcnd  <= {{32{1'b0}}, dataA};
            mpr   <= dataB;
            count <= 32;
        end
    end

    always @(posedge clkb) begin
        if (count > 0) begin
            //if (mpr[0]) temp = temp + mcnd;
            temp = temp + (mcnd & {64{mpr[0]}});
            count <= count - 1;
            mcnd  <= mcnd << 1;
            mpr   <= mpr >> 1;
        end
    end

    assign dataOut = temp;


endmodule
