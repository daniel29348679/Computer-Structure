`timescale 1ns / 1ns
module tb_ALU ();
    reg clka, clkb;


    initial begin
        clka = 1'b1;
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



    reg [31:0] ram[127:0];





    initial begin
        $dumpfile("test.vcd");
        $dumpvars(3, cpu);
        #2300 $finish;
    end

    Cpu cpu (
        clka,
        clkb
    );

endmodule
