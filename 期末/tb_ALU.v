`timescale 1ns / 1ns
module tb_ALU ();
    reg clka, clkb, clkc;


    initial begin
        clka = 1'b1;
        forever begin
            #4 clka = ~clka;
            #21 clka = ~clka;
        end
    end

    initial begin
        clkb = 1'b1;
        #6
            forever begin
                #4 clkb = ~clkb;
                #21 clkb = ~clkb;
            end
    end

    initial begin
        clkc = 1'b1;
        #12
            forever begin
                #4 clkc = ~clkc;
                #21 clkc = ~clkc;
            end
    end


    reg [31:0] ram[127:0];





    initial begin
        $dumpfile("test.vcd");
        $dumpvars(3, cpu);
        #500 $finish;
    end

    Cpu cpu (
        clka,
        clkb,
        clkc
    );

endmodule
