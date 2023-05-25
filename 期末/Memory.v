module Memory (
    clk,
    MemRead,
    MemWrite,
    wd,
    addr,
    outrd
);
    input clk, MemRead, MemWrite;
    input [31:0] addr, wd;
    output [31:0] outrd;
    reg [31:0] rd;

    assign outrd = rd;
    // Memory size: 1KB.
    reg [7:0] mem_array[0:1023];

    always @(posedge clk) begin
        if (MemRead == 1'b1) begin
            //rd[31:0] <= {mem_array[addr+3], mem_array[addr+2], mem_array[addr+1], mem_array[addr]};
            rd[7:0]   = mem_array[addr];
            rd[15:8]  = mem_array[addr+1];
            rd[23:16] = mem_array[addr+2];
            rd[31:24] = mem_array[addr+3];

            $display("%d, reading data: Mem[%d] => %d", $time, addr, rd);
        end
    end

    always @(posedge clk) begin
        if (MemWrite == 1'b1) begin
            $display("%d, writing data: Mem[%d] <= %d", $time, addr, wd);
            {mem_array[addr+3], mem_array[addr+2], mem_array[addr+1], mem_array[addr]} <= wd;
        end
    end


endmodule

