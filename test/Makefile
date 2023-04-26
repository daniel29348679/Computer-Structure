VERILOG = iverilog
TARGET = tb_ALU.vcd

$(TARGET) : tb_ALU.vvp
	vvp tb_ALU.vvp
	-del -f tb_ALU.vvp

tb_ALU.vvp:
	$(VERILOG) -o tb_ALU.vvp *.v

clean:
	-del -f $(TARGET) tb_ALU.vvp