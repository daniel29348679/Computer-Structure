`timescale 1ns / 1ns
module Cpu_tb ();
    reg clka, clkb;


    initial begin
        clka = 1'b0;
        forever begin
            #4 clka = ~clka;
            #76 clka = ~clka;
        end
    end

    initial begin
        clkb = 1'b0;
        forever begin
            #1 clkb = ~clkb;
            #1 clkb = ~clkb;
        end
    end



    initial begin
        $dumpfile("test.vcd");
        $dumpvars(3, cpu);
        $readmemh("instr_mem.txt", cpu.ram);
        //$readmemb("instr_mem_old.txt", cpu.ram);
        $readmemh("reg.txt", cpu.register);
        $readmemh("data_mem.txt", cpu.memory.mem_array);

        #3300 $finish;
    end

    always @(posedge clka) begin
        #1;
        $display("time = %d ", $time);

        $display(
            "instruction_0 = %d, instruction_1 = %d, instruction_2 = %d, \ninstruction_3 = %d, instruction_4 = %d",
            cpu.instruction[0], cpu.instruction[1], cpu.instruction[2], cpu.instruction[3],
            cpu.instruction[4]);

        $display(
            "reg_00 = %d, reg_01 = %d, reg_02 = %d, reg_03 = %d,\nreg_04 = %d, reg_05 = %d, reg_06 = %d, reg_07 = %d,\nreg_08 = %d, reg_09 = %d, reg_10 = %d, reg_11 = %d,\nreg_12 = %d, reg_13 = %d, reg_14 = %d, reg_15 = %d,\nreg_16 = %d, reg_17 = %d, reg_18 = %d, reg_19 = %d,\nreg_20 = %d, reg_21 = %d, reg_22 = %d, reg_23 = %d,\nreg_24 = %d, reg_25 = %d, reg_26 = %d, reg_27 = %d,\nreg_28 = %d, reg_29 = %d, reg_30 = %d, reg_31 = %d",
            cpu.register[0], cpu.register[1], cpu.register[2], cpu.register[3], cpu.register[4],
            cpu.register[5], cpu.register[6], cpu.register[7], cpu.register[8], cpu.register[9],
            cpu.register[10], cpu.register[11], cpu.register[12], cpu.register[13],
            cpu.register[14], cpu.register[15], cpu.register[16], cpu.register[17],
            cpu.register[18], cpu.register[19], cpu.register[20], cpu.register[21],
            cpu.register[22], cpu.register[23], cpu.register[24], cpu.register[25],
            cpu.register[26], cpu.register[27], cpu.register[28], cpu.register[29],
            cpu.register[30], cpu.register[31]);
        $display("\n\n---------------------------------------------");
    end








    Cpu cpu (
        clka,
        clkb
    );

endmodule
