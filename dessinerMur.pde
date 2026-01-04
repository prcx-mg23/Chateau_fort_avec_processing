/*
  Dessine un mur reliant deux tours
  
  paramètres :
  Gère la découpe de la porte principale si nécessaire
  longM=Longueur du mur (distance entre les tours)
  hM = Hauteur du mur en nombre de briques
  H=Hauteur d'une brique (en pixels)
  E=Épaisseur du mur
  aPorte=Vrai si ce mur doit comporter la porte principale du château
  hP=Hauteur de l'ouverture de la porte
  lP=Largeur de la porte (en nombre de briques)
  unit=Unité de largeur de base
 */


void dessinerMurEnceinte(float longM, int hM, float H, float E, boolean aPorte, int hP, int lP, float unit) {
  fill(160, 165, 170); 
  stroke(100);
  float hautTotal = hM * H;

// Murs sans porte
  if (!aPorte) {
    pushMatrix();
    // On centre le bloc verticalement (Y) pour que sa base touche le sol
    translate(0, -hautTotal/2 + H/2, 0);
    box(longM, hautTotal, E);
    popMatrix();
  } 
  
  //Mur avec porte
  else {
    // Mur avec porte centrale
    float largPorte = lP * 2 * unit;
    float coteMur = (longM - largPorte) / 2;
    float hautPorte = hP * H;

    // Bloc Gauche du bord gauche jusqu'à l'ouverture
    pushMatrix();
    translate(-longM/2 + coteMur/2, -hautTotal/2 + H/2, 0);
    box(coteMur, hautTotal, E);
    popMatrix();

    // Bloc Droit du bord droit jusqu'à l'ouverture
    pushMatrix();
    translate(longM/2 - coteMur/2, -hautTotal/2 + H/2, 0);
    box(coteMur, hautTotal, E);
    popMatrix();

    // Bloc Haut relie les deux blocs au-dessus de la porte
    float hReste = hautTotal - hautPorte;
    pushMatrix();
    // On le place tout en haut de la structure
    translate(0, -hautTotal + hReste/2 + H/2, 0);
    box(largPorte, hReste, E);
    popMatrix();

    //Texture de la porte
    fill(92, 64, 51);
    pushMatrix();
    translate(0, -hautPorte/2 + H/2, 0);
    box(largPorte, hautPorte, E/2);
    popMatrix();
  }
}
