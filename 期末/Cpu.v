module Cpu (
    clka,
    clkb,
    clkc
);
    input wire clka, clkb, clkc;
    reg [31:0] ram[127:0];
    reg [31:0] register[31:0];


    reg [31:0] instruction[0:4];
    // instruction[0] IF
    // instruction[1] ID
    // instruction[2] EX
    // instruction[3] MEM
    // instruction[4] WB

    wire [31:0] rdans;

    wire [6:0] pc;
    assign pc = register[31][8:2];


    always @(posedge clka) begin
        // ram to IF
        instruction[0] <= ram[pc];

        // IF to ID
        instruction[1] <= instruction[0];
        rs <= register[instruction[0][25:21]];
        rt <= register[instruction[0][20:16]];
        shamt <= instruction[0][10:6];
        Signal <= instruction[0][5:0];

        // ID to EX
        instruction[2] <= instruction[1];

        // EX to MEM
        instruction[3] <= instruction[2];

        // MEM to WB
        instruction[4] <= instruction[3];
        if ((instruction[3][31:26] == 0) && instruction[3][5:0] != 0)
            register[instruction[3][15:11]] <= aludataOut;

        // pc += 4
        register[31] <= register[31] + 4;
    end

    reg [31:0] rs, rt;
    reg  [ 4:0] shamt;
    wire [63:0] hilo;
    assign hilo = 64'b11111111111111111111111111111111_00000000000000000000000000000111;
    reg  [ 5:0] Signal;
    wire [31:0] aludataOut;

    ALU alu (
        clka,
        rs,
        rt,
        Signal,
        shamt,
        hilo,
        aludataOut
    );




    integer i;
    initial begin
        for (i = 0; i < 128; i = i + 1) begin
            ram[i] = 0;
        end
        for (i = 0; i < 31; i = i + 1) begin
            register[i] = i;
        end
        register[31] = 0;

        ram[0] = 32'b000000_00000_00001_00010_00000_100000;  // add $2, $0, $1
        ram[1] = 32'b000000_00100_00101_00110_00000_100000;  // add $6, $4, $5 
        ram[2] = 32'b000000_01001_01000_01010_00000_100010;  // sub $10, $9, $8
        ram[3] = 32'b000000_00000_01011_01011_00010_000010;  // srl $11, 2
        ram[4] = 32'b000000_00000_00000_01100_00000_010000;  // mohi $12
        ram[5] = 32'b000000_00000_00000_01101_00000_010010;  // molo $13  

    end


    //test--------------------------------------------------------------
    always @(posedge clka) begin

        $display("\n\n---------------------------------------------");
        $display("time = %d ", $time);

        $display(
            "instruction_0 = %d, instruction_1 = %d, instruction_2 = %d, \ninstruction_3 = %d, instruction_4 = %d",
            instruction[0], instruction[1], instruction[2], instruction[3], instruction[4]);

        $display(
            "reg_00 = %d, reg_01 = %d, reg_02 = %d, reg_03 = %d,\nreg_04 = %d, reg_05 = %d, reg_06 = %d, reg_07 = %d,\nreg_08 = %d, reg_09 = %d, reg_10 = %d, reg_11 = %d,\nreg_12 = %d, reg_13 = %d, reg_14 = %d, reg_15 = %d,\nreg_16 = %d, reg_17 = %d, reg_18 = %d, reg_19 = %d,\nreg_20 = %d, reg_21 = %d, reg_22 = %d, reg_23 = %d,\nreg_24 = %d, reg_25 = %d, reg_26 = %d, reg_27 = %d,\nreg_28 = %d, reg_29 = %d, reg_30 = %d, reg_31 = %d",
            register[0], register[1], register[2], register[3], register[4], register[5],
            register[6], register[7], register[8], register[9], register[10], register[11],
            register[12], register[13], register[14], register[15], register[16], register[17],
            register[18], register[19], register[20], register[21], register[22], register[23],
            register[24], register[25], register[26], register[27], register[28], register[29],
            register[30], register[31]);
    end

    //end test----------------------------------------------------------

endmodule
