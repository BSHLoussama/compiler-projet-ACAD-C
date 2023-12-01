#include <stdio.h>

// Fonction pour définir la couleur du texte dans la console
void setColor(int r, int g, int b) {
    // Codes ANSI pour les couleurs du texte
    // 38;2;#;#;# spécifie une couleur RGB pour le texte
    printf("\x1b[38;2;%d;%d;%dm", r, g, b);
}
/*
int main() {
    // Utilisation de la fonction pour définir la couleur du texte en orange (255, 165, 0)
    setColor(255, 165, 0);

    // Affichage du texte coloré
    printf("Ceci est du texte orange!\n");

    // Réinitialisation de la couleur du texte à la couleur par défaut
    printf("\x1b[0m");

    // Affichage du texte sans couleur
    printf("Ceci est du texte sans couleur.\n");

    return 0;
}
*/
