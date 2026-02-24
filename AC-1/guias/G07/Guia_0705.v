module Guia_0705;

    // Entradas
    reg a, b;
    reg [2:0] sel;
    reg inv_b;

    // Fios intermediários
    wire b_mod;
    wire not_a, and_out, nand_out, or_out, nor_out, xor_out, xnor_out;
    wire s0n, s1n, s2n;
    wire f0, f1, f2, f3, f4, f5, f6;

    // Inversão opcional de b
    not(b_inv, b);
    and(b_mod_and, b, ~inv_b);    // b when inv_b == 0
    and(b_inv_and, b_inv, inv_b); // ~b when inv_b == 1
    or(b_mod, b_mod_and, b_inv_and);

    // Operações lógicas
    not (not_a, a);
    and (and_out, a, b_mod);
    nand(nand_out, a, b_mod);
    or  (or_out, a, b_mod);
    nor (nor_out, a, b_mod);
    xor (xor_out, a, b_mod);
    xnor(xnor_out, a, b_mod);

    // Inversores da seleção
    not(s0n, sel[0]);
    not(s1n, sel[1]);
    not(s2n, sel[2]);

    // Multiplexador 7x1
    and(f0, not_a,  s2n, s1n, s0n);   // 000
    and(f1, and_out, s2n, s1n, sel[0]);   // 001
    and(f2, nand_out, s2n, sel[1], s0n);  // 010
    and(f3, or_out,   s2n, sel[1], sel[0]); // 011
    and(f4, nor_out,  sel[2], s1n, s0n);  // 100
    and(f5, xor_out,  sel[2], s1n, sel[0]); // 101
    and(f6, xnor_out, sel[2], sel[1], s0n); // 110

    // Saída combinada
    wire y;
    or(y, f0, f1, f2, f3, f4, f5, f6);

    // Testes
    initial begin
        $display("a b inv_b sel | NOT AND NAND OR NOR XOR XNOR | y");
        $display("-------------------------------------------------------");
        for (integer i = 0; i < 8; i = i + 1) begin
            for (integer j = 0; j < 2; j = j + 1) begin
                for (integer m = 0; m < 2; m = m + 1) begin
                    a = m[0];
                    b = m[1];
                    sel = i[2:0];
                    inv_b = j[0];
                    #1 $display("%b %b   %b   %03b |  %b   %b    %b   %b   %b   %b    %b  | %b",
                        a, b, inv_b, sel,
                        not_a, and_out, nand_out, or_out, nor_out, xor_out, xnor_out,
                        y);
                end
            end
        end
        $finish;
    end

endmodule
