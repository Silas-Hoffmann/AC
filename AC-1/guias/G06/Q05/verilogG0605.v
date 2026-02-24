module expr_logica (
    input x, y, z,
    output f
);
    assign f = x & (~y | ~z);
endmodule

module tb_expr_logica;
    reg x, y, z;
    wire f;

    expr_logica uut (
        .x(x), 
        .y(y), 
        .z(z), 
        .f(f)
    );

    initial begin
        $monitor("x=%b y=%b z=%b | f=%b",x, y, z, f);
        x = 0; y = 0; z = 0; #10;
        x = 0; y = 0; z = 1; #10;
        x = 0; y = 1; z = 0; #10;
        x = 0; y = 1; z = 1; #10;
        x = 1; y = 0; z = 0; #10;
        x = 1; y = 0; z = 1; #10;
        x = 1; y = 1; z = 0; #10;
        x = 1; y = 1; z = 1; #10;
        $finish;
    end
endmodule
