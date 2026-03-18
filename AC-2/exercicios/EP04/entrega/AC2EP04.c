#include <stdio.h>
#include <string.h>

int decodificador (char w [10]){
    /*
    A -> W=X -> 0
    B -> W=Y -> 1
    AxB -> W=X⊕Y -> 2
    nAxnB -> W=X’⊕ Y’ -> 3
    AeBn -> W=(X.Y)’ -> 4
    nB -> W=Y’ -> 5
    nAonB -> W=X’+Y’ -> 6
    nA -> W=X’ -> 7
    AonB -> W=X +Y’ -> 8
    UmL -> W=F -> 9
    0 -> W=0 -> A
    AeB -> W=X.Y -> B
    nAeB -> W=X’.Y -> C
    AenB -> W=X.Y’ -> D
    AoB -> W=X+Y -> E
    nAenB -> W=X’.Y’ -> F
    */
    struct { // struct com mnemonico e codigo correspondente
        const char *mnemonico;
        int codigo;
    } tabela[] = { // tabela que preenche o struct
        {"A", 0x0},
        {"B", 0x1},
        {"AxB", 0x2},
        {"nAxnB", 0x3},
        {"AeBn", 0x4},
        {"nB", 0x5},
        {"nAonB", 0x6},
        {"nA", 0x7},
        {"AonB", 0x8},
        {"UmL", 0x9},
        {"0", 0xA},
        {"AeB", 0xB},
        {"nAeB", 0xC},
        {"AenB", 0xD},
        {"AoB", 0xE},
        {"nAenB", 0xF}
    };

    int total = (int)(sizeof(tabela) / sizeof(tabela[0]));
    int i;
    for (i = 0; i < total; i++) {
        if (strcmp(w, tabela[i].mnemonico) == 0) { // encontra o mnemonico na tabela
            return tabela[i].codigo; // retorna o codigo correspondente
        }
    }

    return -1;
}


int main() {
    char str[100];
    int x = -1, y = -1;
    char w[10] = "buffer";
    scanf("%s", str);
    while (scanf(" %c", &str[0]) == 1 && str[0] != 'f') { // ate encontrar o 'f' de "fim" ou acabar a entrada
        while (str[0] != 'W') { // ler o 'X' e 'Y' ate achar a instrucao 'W'
            if (str[0] == 'X') { // se for 'X', ler o valor de X
                scanf("=%d;", &x);
            }
            if (str[0] == 'Y') { // se for 'Y', ler o valor de Y
                scanf("=%d;", &y);
            }
            if (scanf(" %c", &str[0]) != 1 || str[0] == 'f') { // se encontrar alguma irregularidade, encerrar o programa
                return 0;
            }
        }
        scanf("=%9[^;];", w);
        if (x > 9) {
            printf("%c", x+55); // exibicao como caractere hexadecimal codificado na tabela ASCII
        } else {
            printf("%c", x+48); // exibicao como caractere hexadecimal codificado na tabela ASCII
        }
        if (y > 9) {
            printf("%c", y+55); // exibicao como caractere hexadecimal codificado na tabela ASCII
        } else {
            printf("%c", y+48); // exibicao como caractere hexadecimal codificado na tabela ASCII
        }

        int codigo_w = decodificador(w); // encontrar o codigo correspondente ao mnemonico lido
        if (codigo_w >= 0) {
            printf("%X\n", codigo_w); // exibicao do codigo do mnemonico
        } else {
            printf("w = %s\tcodigo = invalido\n", w); // nao encontrou o codigo
        }
    
        w[0] = '\0'; // limpar o buffer para a proxima leitura
    }
    return 0;
}