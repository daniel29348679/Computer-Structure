VERILOG = iverilog
TARGET = tb_SingleCycle.vcd

$(TARGET) : tb_SingleCycle.vvp
	vvp tb_SingleCycle.vvp
	-del -f tb_SingleCycle.vvp

tb_SingleCycle.vvp:
	$(VERILOG) -o tb_SingleCycle.vvp *.v

clean:
	-del -f $(TARGET) tb_SingleCycle.vvp