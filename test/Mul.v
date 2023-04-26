`timescale 1ns / 1ns
module Mul (
    firstart,
    clk,
    dataA,
    dataB,
    Signal,
    dataOut,
    reset
);
    input firstart;
    input clk;
    input reset;
    input [31:0] dataA;
    input [31:0] dataB;
    input [5:0] Signal;
    output [63:0] dataOut;

    wire [31:0] hi, lo;
    assign {hi, lo} = temp;
    reg [63:0] temp, mcnd;
    reg [31:0] mpr;




    always @(posedge firstart) begin
        temp <= 0;
        mpr  <= dataB;
        mcnd <= dataA;
    end

    always @(negedge clk) begin

        if (mpr[0]) temp = temp + mcnd;
        mcnd <= mcnd << 1;
        mpr  <= mpr >> 1;
    end

    assign dataOut = temp;


endmodule
