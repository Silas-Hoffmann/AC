#include <stdio.h>
#include <string.h>

static char hex_char(int v) {
    if (v >= 0 && v <= 9) return (char)('0' + v);
    if (v >= 10 && v <= 15) return (char)('A' + (v - 10));
    return '?';
}

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
        {"CopiaA", 0x0},
        {"B", 0x1},
        {"CopiaB", 0x1},
        {"AxB", 0x2},
        {"nAxnB", 0x3},
        {"AeBn", 0x4},
        {"nB", 0x5},
        {"nAonB", 0x6},
        {"nA", 0x7},
        {"AonB", 0x8},
        {"UmL", 0x9},
        {"0", 0xA},
        {"ZeroL", 0xA},
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
    freopen("TESTEULA.ULA", "r", stdin);
    freopen("testeula.hex", "w", stdout);

    char str[100];
    int x = -1, y = -1;
    char w[32];

    while (fgets(str, sizeof(str), stdin) != NULL) {
        if (strncmp(str, "fim", 3) == 0) {
            break;
        }

        if (sscanf(str, " X=%d", &x) == 1) {
            continue;
        }

        if (sscanf(str, " Y=%d", &y) == 1) {
            continue;
        }

        if (sscanf(str, " W=%31[^; \t\r\n]", w) == 1) {
            int codigo_w = decodificador(w); // encontrar o codigo correspondente ao mnemonico lido

            printf("%c%c", hex_char(x), hex_char(y));
            if (codigo_w >= 0) {
                printf("%X\n", codigo_w); // exibicao do codigo do mnemonico
            } else {
                printf("w = %s\tcodigo invalido\n", w); // nao encontrou o codigo
            }
        }
    }

    return 0;
}