#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Função para converter inteiro (0-15) em caractere Hexadecimal
static char hex_char(int v) {
    if (v >= 0 && v <= 9) return (char)('0' + v);
    if (v >= 10 && v <= 15) return (char)('A' + (v - 10));
    return '?';
}

// Retorna o codigo hexadecimal correspondente ao mnemonico da ULA
int decodificador(char w[]) {
    // Tabela
    struct {
        const char *mnemonico;
        int codigo;
    } tabela[] = {
        {"nA", 0x0},
        {"AoBn", 0x1},
        {"nAeB", 0x2},
        {"zeroL", 0x3},
        {"AeBn", 0x4},
        {"nB", 0x5},
        {"AxB", 0x6},
        {"AenB", 0x7},
        {"nAoB", 0x8},
        {"AxBn", 0x9},
        {"copiaB", 0xA},
        {"AeB", 0xB},
        {"umL", 0xC},
        {"AonB", 0xD},
        {"AoB", 0xE},
        {"copiaA", 0xF}
    };

    int total = (int)(sizeof(tabela) / sizeof(tabela[0]));
    for (int i = 0; i < total; i++) {
        // Procura correspondencia exata do mnemonico
        if (strcmp(w, tabela[i].mnemonico) == 0) {
            return tabela[i].codigo;
        }
    }
    
    // Retorna -1 se o mnemonico contiver erro de digitacao
    return -1;
}

int main() {
    FILE *entrada = fopen("TESTEULA.ULA", "r");
    FILE *saida = fopen("TESTEULA.HEX", "w");

    if (entrada == NULL) {
        printf("Erro Crítico: Nao foi possivel abrir TESTEULA.ULA\n");
        return 1;
    }

    char str[100];
    int x = -1, y = -1;
    char w[32];
    int numero_linha = 0;

    printf("Iniciando a geracao do arquivo .hex...\n");

    // Varre o arquivo linha a linha sem interromper a execucao
    while (fgets(str, sizeof(str), entrada) != NULL) {
        numero_linha++;
        
        // Verificacao de Erro: Linhas em Branco
        int apenas_espacos = 1;
        for (int i = 0; str[i] != '\0'; i++) {
            if (!isspace(str[i])) {
                apenas_espacos = 0;
                break;
            }
        }
        
        if (apenas_espacos) {
            printf("Aviso (Linha %d): Linha em branco ignorada.\n", numero_linha);
            continue;
        }

        // Remove quebras de linha residuais para melhorar o log de erro de sintaxe
        str[strcspn(str, "\r\n")] = 0;

        // Controle de escopo do programa
        if (strncmp(str, "inicio:", 7) == 0) continue;
        if (strncmp(str, "fim.", 4) == 0) break;

        // Leitura de variaveis de entrada
        if (sscanf(str, "X=%d;", &x) == 1) continue;
        if (sscanf(str, "Y=%d;", &y) == 1) continue;

        // Leitura da operacao e gravacao no .HEX
        if (sscanf(str, "W=%31[^;];", w) == 1) {
            int codigo_w = decodificador(w);

            if (codigo_w >= 0 && x >= 0 && y >= 0) {
                fprintf(saida, "%c%c%X\n", hex_char(x), hex_char(y), codigo_w);
            } else {
                printf("Erro de Sintaxe (Linha %d): Mnemonico '%s' invalido ou X/Y nao inicializados.\n", numero_linha, w);
            }
            continue;
        }

        // 2. Verificacao de Erro: Sintaxe Errada (Qualquer estrutura que falhou nos sscanf acima)
        printf("Erro de Sintaxe (Linha %d): Comando '%s' nao reconhecido.\n", numero_linha, str);
    }

    fclose(entrada);
    fclose(saida);

    printf("Processo concluido. Arquivo TESTEULA.HEX salvo com sucesso.\n");
    return 0;
}