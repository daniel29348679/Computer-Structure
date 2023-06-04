module Cpu (
    clka,
    clkb
);
    input wire clka, clkb, clkc;
    //reg [31:0] ram[127:0];
    reg [7:0] ram[511:0];
    reg [31:0] register[31:0];


    reg [31:0] instruction[4:0];
    // instruction[0] IF
    // instruction[1] ID
    // instruction[2] EX
    // instruction[3] MEM
    // instruction[4] WB

    wire [31:0] rdans;

    wire [8:0] pc;
    assign pc = register[31][8:0];

    reg [31:0] aludataOut_delaytemp;
    reg [31:0] immediate, immediate_delay1, immediate_delay2, immediate_delay3;
    reg iszero_delay1, iszero_delay2, iszero_delay3;
    wire [31:0] alusrc;
    assign alusrc = (instruction[1][31:26] == 0 || instruction[1][31:26] == 4||instruction[1][31:26] == 28) ? rt : {32'b0, immediate};

    reg [4:0] hazard_0, hazard_1, hazard_2;

    reg [31:0] rt_delaytemp;

    always @(negedge clka) begin
        if (instruction[0] == 0);
        else if(instruction[0][31:26] == 0 && instruction[0][5:0] != 16 && instruction[0][5:0] != 18) begin //r type
            if ((instruction[0][25:21] == hazard_0 || instruction[0][20:16] == hazard_0) && hazard_0 != 0 ) begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end
            else if ((instruction[0][25:21] == hazard_1 || instruction[0][20:16] == hazard_1)&& hazard_1 != 0 )begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end
            else if ((instruction[0][25:21] == hazard_2 || instruction[0][20:16] == hazard_2)&& hazard_2 != 0 )begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end
        end
        else if((instruction[0][31:26] == 28 && instruction[0][5:0] == 4)
        || (instruction[0][31:26] == 4 )
        || (instruction[0][31:26] == 43 ) ) begin //maddu || beq || sw
            if ((instruction[0][25:21] == hazard_0 || instruction[0][20:16] == hazard_0)&& hazard_0 != 0 ) begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end
            else if ((instruction[0][25:21] == hazard_1 || instruction[0][20:16] == hazard_1)&& hazard_1 != 0 )begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end
            else if ((instruction[0][25:21] == hazard_2 || instruction[0][20:16] == hazard_2)&& hazard_2 != 0 )begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end
        end

        else if((instruction[0][31:26] == 35 )
        || (instruction[0][31:26] == 9 ) ) begin //lw ||addiu 
            if (instruction[0][20:16] == hazard_0 && hazard_0 != 0) begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end else if (instruction[0][20:16] == hazard_1 && hazard_1 != 0) begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end else if (instruction[0][20:16] == hazard_2 && hazard_2 != 0) begin
                instruction[0] <= 0;
                register[31]   <= register[31] - 4;
            end
        end


    end


    always @(posedge clka) begin
        // ram to IF
        instruction[0] <= {ram[pc+3], ram[pc+2], ram[pc+1], ram[pc]};

        // IF to ID
        instruction[1] <= instruction[0];
        rs             <= register[instruction[0][25:21]];
        rt             <= register[instruction[0][20:16]];
        shamt          <= instruction[0][10:6];
        Signal         <= instruction[0][5:0];
        immediate      <= {{16{instruction[0][15]}}, instruction[0][15:0]};


        //hazard detection
        if (instruction[0][31:26] == 0 && instruction[0][5:0] == 32) begin  //add
            hazard_0 <= instruction[0][15:11];
        end else if (instruction[0][31:26] == 0 && instruction[0][5:0] == 34) begin  //sub
            hazard_0 <= instruction[0][15:11];
        end else if (instruction[0][31:26] == 0 && instruction[0][5:0] == 36) begin  //and
            hazard_0 <= instruction[0][15:11];
        end else if (instruction[0][31:26] == 0 && instruction[0][5:0] == 37) begin  //or
            hazard_0 <= instruction[0][15:11];
        end else if (instruction[0][31:26] == 0 && instruction[0][5:0] == 2) begin  //srl
            hazard_0 <= instruction[0][15:11];
        end else if (instruction[0][31:26] == 0 && instruction[0][5:0] == 42) begin  //slt
            hazard_0 <= instruction[0][15:11];
        end else if (instruction[0][31:26] == 0 && instruction[0][5:0] == 16) begin  //mfhi
            hazard_0 <= instruction[0][15:11];
        end else if (instruction[0][31:26] == 0 && instruction[0][5:0] == 17) begin  //mflo
            hazard_0 <= instruction[0][15:11];
        end else if (instruction[0][31:26] == 43) begin  //sw
            hazard_0 <= instruction[0][20:16];
        end else if (instruction[0][31:26] == 9) begin  //addiu
            hazard_0 <= instruction[0][20:16];
        end else hazard_0 <= 0;

        hazard_1             <= hazard_0;
        hazard_2             <= hazard_1;


        // ID to EX
        instruction[2]       <= instruction[1];
        rt_delaytemp         <= rt;
        immediate_delay1     <= immediate;

        // EX to MEM
        instruction[3]       <= instruction[2];
        aludataOut_delaytemp <= aludataOut;
        immediate_delay2     <= immediate_delay1;
        iszero_delay1        <= iszero;


        // MEM to WB
        instruction[4]       <= instruction[3];
        if (instruction[3] != 0 && (instruction[3][31:26] == 0 || instruction[3][31:26] == 35 || instruction[3][31:26] == 9)&&(!(instruction[3][5:0] == 25 && instruction[3][31:26] == 0))) begin
            if (instruction[3][31:26] == 35) register[instruction[3][20:16]] <= memoryrd;
            else if (instruction[3][31:26] == 9)
                register[instruction[3][20:16]] <= aludataOut_delaytemp;
            else register[instruction[3][15:11]] <= aludataOut_delaytemp;
        end
        // pc += 4
        //register[31] <= register[31] + 4;
        if ((instruction[3][31:26] == 4) && (iszero_delay1 == 1)) begin
            //$display("beq, time = %d, immediate_delay = %d !!!!!!!!!!!!!\n", $time,
            //immediate_delay2);
            register[31] <= (register[31] + 4) + (immediate_delay2 << 2);
        end else if (instruction[3][31:26] == 2) begin
            register[31][27:2] <= instruction[3][25:0];
            register[31][1:0]  <= 2'b00;
        end else register[31] <= register[31] + 4;
    end



    reg [31:0] rs, rt;
    reg [4:0] shamt;
    wire [63:0] hilo;
    reg [5:0] Signal;
    wire [31:0] aludataOut;
    wire iszero;
    ALU alu (
        clka,
        (instruction[2][31:26] == 35 || instruction[2][31:26] == 43 || instruction[2][31:26] == 4|| instruction[2][31:26] == 9),
        rs,
        alusrc,
        Signal,
        shamt,
        hilo,
        aludataOut,
        iszero
    );

    wire [31:0] memoryrd;

    Memory memory (
        clka,
        (instruction[2][31:26] == 35),
        (instruction[2][31:26] == 43),
        rt_delaytemp,
        aludataOut,
        memoryrd
    );


    Mul mul (
        clka,
        clkb,
        rs,
        rt,
        instruction[1],
        hilo
    );

    integer i;
    initial begin
        //register[31] = 0;
        /*
        ram[0] = 32'b000000_00000_00001_00010_00000_100000;  // add $2, $0, $1
        ram[1] = 32'b000000_00100_00101_00110_00000_100000;  // add $6, $4, $5 
        ram[2] = 32'b000000_01001_01000_01010_00000_100010;  // sub $10, $9, $8
        ram[3] = 32'b000000_00000_01011_01011_00010_000010;  // srl $11, 2
        ram[4] = 32'b000000_00000_00000_01100_00000_010000;  // mohi $12
        ram[5] = 32'b000000_00000_00000_01101_00000_010010;  // molo $13  
        ram[6] = 32'b101011_00111_00011_0000000000001111;  // sw $3 0x000f $7
        ram[7] = 32'b101011_00000_01100_0000000000000000;  // sw $t4 0x0000 $zero | sw $12 0x0000 $0
        ram[8] = 32'b101011_00000_01100_0000000000000000;  // sw $t4 0x0000 $zero | sw $12 0x0000 $0
        ram[9] = 32'b100011_00000_01110_0000000000000000;  //lw $14 0x0000 $0
        ram[10] = 32'b100011_00000_01111_0000000000010110;  //lw $15 0x0000 $0
        ram[11] = 32'b001001_11110_11110_0000000100000000; //addiu $fp, $fp, 0x00100 | addiu $30, $30, 0x00100
        ram[12] = 32'b000100_00001_00010_0000000000000001;  //beq $1, $2, 1
        ram[13] = 32'b00000000000000000000000000000000;  //nop
        ram[14] = 32'b00000000000000000000000000000000;  //nop
        ram[15] = 32'b00000000000000000000000000000000;  //nop
        ram[16] = 32'b00000000000000000000000000000000;  //nop
        ram[17] = 32'b000100_00001_01011_0000000000000011;  //beq $1, $11, 3
        ram[18] = 32'b000000_00101_00110_0000000000_011001;  //mul $5, $6
        ram[19] = 32'b000000_00000_00000_10100_00000_010010;  // movlo $20 
        ram[20] = 32'b000000_00000_00000_10101_00000_010000;  // movhi $21
        ram[21] = 32'b011100_00101_00110_0000000000_000100;  //maddu $5, $6
        ram[22] = 32'b000000_00000_00000_10110_00000_010010;  // movlo $22 
        ram[23] = 32'b000000_00000_00000_10111_00000_010000;  // movhi $23
        //ram[18] = 32'b00001000000000000000000000010000;
        */

    end


    //test--------------------------------------------------------------
    /*
    always @(posedge clka) begin
        #1;
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
        $display("\n\n---------------------------------------------");
    end
    */

    //end test----------------------------------------------------------

endmodule
