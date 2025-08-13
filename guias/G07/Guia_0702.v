module Guia_0702;

    // Entradas
    reg a, b, sel;

    // Saídas
    wire or_out, nor_out, y;

    // Portas lógicas
    or (or_out, a, b);
    nor (nor_out, a, b);

    wire not_sel, or_y, nor_y;

    not (not_sel, sel);     
    and (or_y, or_out, not_sel);
    and (nor_y, nor_out, sel);
    or (y, or_y, nor_y);

    // Teste
    initial begin
        $display("a b sel | OR NOR | y");
        $display("----------------------");
        a = 0; b = 0; sel = 0; #1 $display("%b %b  %b  |  %b  %b  | %b", a, b, sel, or_out, nor_out, y);
        a = 0; b = 1; sel = 0; #1 $display("%b %b  %b  |  %b  %b  | %b", a, b, sel, or_out, nor_out, y);
        a = 1; b = 0; sel = 0; #1 $display("%b %b  %b  |  %b  %b  | %b", a, b, sel, or_out, nor_out, y);
        a = 1; b = 1; sel = 0; #1 $display("%b %b  %b  |  %b  %b  | %b", a, b, sel, or_out, nor_out, y);

        a = 0; b = 0; sel = 1; #1 $display("%b %b  %b  |  %b  %b  | %b", a, b, sel, or_out, nor_out, y);
        a = 0; b = 1; sel = 1; #1 $display("%b %b  %b  |  %b  %b  | %b", a, b, sel, or_out, nor_out, y);
        a = 1; b = 0; sel = 1; #1 $display("%b %b  %b  |  %b  %b  | %b", a, b, sel, or_out, nor_out, y);
        a = 1; b = 1; sel = 1; #1 $display("%b %b  %b  |  %b  %b  | %b", a, b, sel, or_out, nor_out, y);
        $finish;
    end

endmodule

