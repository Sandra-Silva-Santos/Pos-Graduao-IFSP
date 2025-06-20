#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int jogador = 0, computador = 0;
    char escolha = 's';
    int dado;
    
    // Inicializa gerador de números aleatórios
    srand(time(NULL)); 

    printf("=== CORRIDA DOS DADOS ===\n");
    printf("Objetivo: Chegar a exatamente 21 pontos. Quem passar perde!\n\n");

    while (escolha == 's' && jogador < 21) {
        // Jogador decide jogar
        printf("Deseja jogar o dado? (s/n): ");
        scanf(" %c", &escolha);

        if (escolha == 's') {
            dado = (rand() % 6) + 1;
            jogador += dado;
            printf("Voce tirou %d. Total: %d pontos\n", dado, jogador);
        } else {
            printf("Voce parou com %d pontos.\n", jogador);
            break;
        }

        if (jogador >= 21) {
            break;
        }

        // Computador joga automaticamente
        if (computador < 17) { // Estrategicamente joga até 17
            dado = (rand() % 6) + 1;
            computador += dado;
            printf("Computador jogou e tirou %d. Total: %d pontos\n", dado, computador);
        } else {
            printf("Computador decidiu parar com %d pontos.\n", computador);
        }

        printf("------------------------------\n");
    }

    // Resultado final
    printf("\n=== RESULTADO FINAL ===\n");
    printf("Sua pontuacao: %d\n", jogador);
    printf("Pontuacao do computador: %d\n", computador);

    if (jogador > 21 && computador > 21) {
        printf("Ambos ultrapassaram! Empate.\n");
    } else if (jogador > 21) {
        printf("Voce ultrapassou 21! Computador vence.\n");
    } else if (computador > 21) {
        printf("Computador ultrapassou 21! Voce venceu!\n");
    } else if (jogador == computador) {
        printf("Empate!\n");
    } else if (jogador > computador) {
        printf("Voce venceu!\n");
    } else {
        printf("Computador venceu.\n");
    }

    return 0;
}
