module Guia_0703;

    // Entradas
    reg a, b, sel_p, sel_g;

    // Saída
    wire y;

    // Sinais intermediários
    wire and_out, nand_out, or_out, nor_out;
    wire not_sel_p, not_sel_g;
    wire and_sel_and, and_sel_nand, and_sel_or, and_sel_nor;
    wire group1, group2;

    // Portas básicas
    and  (and_out, a, b);
    nand (nand_out, a, b);
    or   (or_out, a, b);
    nor  (nor_out, a, b);

    not (not_sel_p, sel_p);
    not (not_sel_g, sel_g);

    and (and_sel_and, and_out, not_sel_p, not_sel_g);   // sel_p=0, sel_g=0
    and (and_sel_nand, nand_out, sel_p, not_sel_g);     // sel_p=1, sel_g=0
    and (and_sel_or, or_out, not_sel_p, sel_g);         // sel_p=0, sel_g=1
    and (and_sel_nor, nor_out, sel_p, sel_g);           // sel_p=1, sel_g=1

    or (group1, and_sel_and, and_sel_nand);
    or (group2, and_sel_or, and_sel_nor);
    or (y, group1, group2);

    // Teste
    initial begin
        $display("a b sel_p sel_g | AND NAND OR NOR | y");
        $display("--------------------------------------------");

        a=0; b=0; sel_p=0; sel_g=0; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=0; b=1; sel_p=0; sel_g=0; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=1; b=0; sel_p=0; sel_g=0; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=1; b=1; sel_p=0; sel_g=0; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);

        a=0; b=0; sel_p=1; sel_g=0; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=0; b=1; sel_p=1; sel_g=0; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=1; b=0; sel_p=1; sel_g=0; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=1; b=1; sel_p=1; sel_g=0; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);

        a=0; b=0; sel_p=0; sel_g=1; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=0; b=1; sel_p=0; sel_g=1; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=1; b=0; sel_p=0; sel_g=1; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=1; b=1; sel_p=0; sel_g=1; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);

        a=0; b=0; sel_p=1; sel_g=1; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=0; b=1; sel_p=1; sel_g=1; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=1; b=0; sel_p=1; sel_g=1; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);
        a=1; b=1; sel_p=1; sel_g=1; #1 $display("%b %b  %b     %b    |  %b   %b   %b   %b  | %b", a,b,sel_p,sel_g,and_out,nand_out,or_out,nor_out,y);

        $finish;
    end

endmodule






