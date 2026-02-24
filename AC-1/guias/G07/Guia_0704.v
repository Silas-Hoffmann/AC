module Guia_0704;

    // Entradas
    reg a, b;
    reg sel1, sel0;  // seletor de 2 bits

    // Saída
    wire y;

    // Fios internos para as operações
    wire or_out, nor_out, xor_out, xnor_out;
    wire not_sel1, not_sel0;
    wire s00, s01, s10, s11;
    wire y0, y1, y2, y3;

    // Operações lógicas
    or   (or_out, a, b);
    nor  (nor_out, a, b);
    xor  (xor_out, a, b);
    xnor (xnor_out, a, b);

    // Complemento dos seletores
    not (not_sel1, sel1);
    not (not_sel0, sel0);

    // Decodificador 2x4
    and (s00, not_sel1, not_sel0);  // 00
    and (s01, not_sel1, sel0);      // 01
    and (s10, sel1, not_sel0);      // 10
    and (s11, sel1, sel0);          // 11

    // Seleção do resultado (MUX 4x1)
    and (y0, xnor_out, s00);
    and (y1, xor_out, s01);
    and (y2, or_out, s10);
    and (y3, nor_out, s11);
    or  (y, y0, y1, y2, y3);

    // Teste
    initial begin
        $display("a b sel1 sel0 | XNOR XOR OR NOR | y");
        $display("-------------------------------------");
        a=0; b=0;

        sel1=0; sel0=0; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=0; sel0=1; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=1; sel0=0; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=1; sel0=1; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);

        a=0; b=1;

        sel1=0; sel0=0; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=0; sel0=1; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=1; sel0=0; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=1; sel0=1; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);

        a=1; b=0;

        sel1=0; sel0=0; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=0; sel0=1; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=1; sel0=0; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=1; sel0=1; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);

        a=1; b=1;

        sel1=0; sel0=0; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=0; sel0=1; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=1; sel0=0; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);
        sel1=1; sel0=1; #1 $display("%b %b   %b    %b  |   %b     %b   %b   %b  | %b", a,b,sel1,sel0,xnor_out,xor_out,or_out,nor_out,y);

        $finish;
    end

endmodule
