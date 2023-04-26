VERILOG = iverilog
TARGET = midterm.vcd

$(TARGET) : midterm.vvp
	vvp midterm.vvp

midterm.vvp:
	$(VERILOG) -o midterm.vvp *.v

clean:
	rm $(TARGET)