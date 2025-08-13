module Guia_0701;

    // Entradas
    reg a, b, sel;

    // Saídas
    wire and_out, nand_out, y;

    // Portas lógicas
    and (and_out, a, b);
    nand (nand_out, a, b);

    wire not_sel, and_y, nand_y;

    not (not_sel, sel);
    and (and_y, and_out, not_sel);
    and (nand_y, nand_out, sel);
    or (y, and_y, nand_y);

    // Teste
    initial begin
        $display("a b sel | AND NAND | y");
        $display("-------------------------");
        a = 0; b = 0; sel = 0; #1 $display("%b %b  %b  |  %b    %b  | %b", a, b, sel, and_out, nand_out, y);
        a = 0; b = 1; sel = 0; #1 $display("%b %b  %b  |  %b    %b  | %b", a, b, sel, and_out, nand_out, y);
        a = 1; b = 0; sel = 0; #1 $display("%b %b  %b  |  %b    %b  | %b", a, b, sel, and_out, nand_out, y);
        a = 1; b = 1; sel = 0; #1 $display("%b %b  %b  |  %b    %b  | %b", a, b, sel, and_out, nand_out, y);

        a = 0; b = 0; sel = 1; #1 $display("%b %b  %b  |  %b    %b  | %b", a, b, sel, and_out, nand_out, y);
        a = 0; b = 1; sel = 1; #1 $display("%b %b  %b  |  %b    %b  | %b", a, b, sel, and_out, nand_out, y);
        a = 1; b = 0; sel = 1; #1 $display("%b %b  %b  |  %b    %b  | %b", a, b, sel, and_out, nand_out, y);
        a = 1; b = 1; sel = 1; #1 $display("%b %b  %b  |  %b    %b  | %b", a, b, sel, and_out, nand_out, y);
        $finish;
    end

endmodule
