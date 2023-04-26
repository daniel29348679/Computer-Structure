module FA (
    a,
    b,
    cin,
    cout,
    sum
);
    input a, b, cin;
    output cout, sum;

    wire cout_0, cout_1, cout_2, cout_3;
    and (cout_0, a, b);
    and (cout_1, a, cin);
    and (cout_2, b, cin);
    or (cout_3, cout_0, cout_1);
    or (cout, cout_3, cout_2);


    wire sum_0;
    xor (sum_0, a, b);
    xor (sum, sum_0, cin);
endmodule
