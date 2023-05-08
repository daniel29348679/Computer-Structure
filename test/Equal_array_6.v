module Equal_array_6 (
    equ,
    a,
    b
);
    input [5:0] a, b;
    output equ;

    wire [5:0] eor;

    genvar i;
    /*
    for (i = 0; i < 6; i = i + 1) begin
        xor (eor[i], a[i], b[i]);
    end
    */
    xor (eor[0], a[0], b[0]);
    xor (eor[1], a[1], b[1]);
    xor (eor[2], a[2], b[2]);
    xor (eor[3], a[3], b[3]);
    xor (eor[4], a[4], b[4]);
    xor (eor[5], a[5], b[5]);

    wire [5:0] eq;

    or (eq[0], eor[0], eor[1]);
    or (eq[1], eor[2], eor[3]);
    or (eq[2], eor[4], eor[5]);
    or (eq[3], eq[0], eq[1]);
    or (eq[4], eq[2], eq[3]);
    not (equ, eq[4]);
endmodule
