#include <stdio.h>

// Fonction pour d�finir la couleur du texte dans la console
void setColor(int r, int g, int b) {
    // Codes ANSI pour les couleurs du texte
    // 38;2;#;#;# sp�cifie une couleur RGB pour le texte
    printf("\x1b[38;2;%d;%d;%dm", r, g, b);
}
/*
int main() {
    // Utilisation de la fonction pour d�finir la couleur du texte en orange (255, 165, 0)
    setColor(255, 165, 0);

    // Affichage du texte color�
    printf("Ceci est du texte orange!\n");

    // R�initialisation de la couleur du texte � la couleur par d�faut
    printf("\x1b[0m");

    // Affichage du texte sans couleur
    printf("Ceci est du texte sans couleur.\n");

    return 0;
}
*/
