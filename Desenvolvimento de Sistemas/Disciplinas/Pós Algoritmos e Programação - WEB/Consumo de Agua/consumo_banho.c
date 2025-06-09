#include <stdio.h>

int main() {
    int tempo;
    int agua_gasta;

    printf("Digite o tempo de seu banho em minutos: ");
    scanf("%d", &tempo);

    // Calcula o consumo de água (12 litros por minuto)
    agua_gasta = tempo * 12;

    printf("\nQuantidade de agua gasta: %d litros\n", agua_gasta);

    if (tempo <= 3) {
        printf("Classificacao: Otimo\n");
        printf("Parabens! Voce esta economizando agua.\n");
    } else if (tempo <= 5) {
        printf("Classificacao: Razoavel\n");
        printf("Voce pode reduzir ainda mais seu tempo para economizar mais.\n");
    } else if (tempo <= 10) {
        printf("Classificacao: Excessivo\n");
        printf("Tente diminuir o tempo de banho para menos de 5 minutos.\n");
    } else {
        printf("Classificacao: Critico\n");
        printf("Seu consumo e muito alto. Pense no planeta na proxima vez.\n");
    }

    return 0;
}