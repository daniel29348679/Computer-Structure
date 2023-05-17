`timescale 1ns / 1ns
module MUX (
    ALUOut,
    HiOut,
    LoOut,
    Shifter,
    Signal,
    dataOut
);
    input [31:0] ALUOut;
    input [31:0] HiOut;
    input [31:0] LoOut;
    input [31:0] Shifter;
    input [5:0] Signal;
    output [31:0] dataOut;


    wire [31:0] temp;

    parameter AND = 6'b100100;
    parameter OR = 6'b100101;
    parameter ADD = 6'b100000;
    parameter SUB = 6'b100010;
    parameter SLT = 6'b101010;

    parameter SRL = 6'b000010;

    parameter DIVU = 6'b011011;
    parameter MFHI = 6'b010000;
    parameter MFLO = 6'b010010;

    wire alu, hi, lo, shif;

    assign alu  = Signal == AND | Signal == OR | Signal == ADD | Signal == SUB | Signal == SLT;
    assign hi   = Signal == MFHI;
    assign lo   = Signal == MFLO;
    assign shif = Signal == SRL;

    wire [1:0] select;
    assign select = alu ? 0 : (hi ? 1 : (lo ? 2 : 3));


    /*
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin
            assign temp[i] = ALUOut[i] & alu | HiOut[i] & hi | LoOut[i] & lo | Shifter[i] & shif;
        end
    endgenerate
    */

    Mux_4to1_array mux_4to1_array (
        temp,
        select,
        ALUOut,
        HiOut,
        LoOut,
        Shifter
    );

    assign dataOut = temp;


endmodule
