/*
  Dessine les battants en bois de la porte d'une tour
  
  paramètres :
  n=Nombre de briques en largeur de la tour
  unit=Unité de largeur (demi-brique)
  H= Hauteur d'une brique
  E=Épaisseur du mur de la tour
  hP=Hauteur de la porte (en nombre de briques)
  lP=Largeur de la porte (en nombre de briques de chaque côté du centre)
 */

void dessinerPorte(int n, float unit, float H, float E, int hP, int lP) {
  // Calcul de la hauteur totale de la porte en pixels
  float hautP = hP * H;
  pushMatrix();
  // positionnement  
  //On centre verticalement le panneau de bois par rapport à l'ouverture.
  //On le place sur l'axe Z juste un peu en retrait ( - E) pour qu'il soit à l'intérieur du mur.
  translate(0, -hautP/2 + H/2, (n * 2 * unit)/2.0 - E); 
  
  // On dessine la porte planche par planche (chaque planche fait la largeur d'une brique simple)
  for (int i = 0; i < lP*2; i++) {
    fill(92, 64, 51); stroke(40);
    pushMatrix();
    // On aligne chaque planche côte à côte pour remplir toute la largeur (lP * 2)
    translate((i - lP + 0.5) * unit, 0, 0);
    // Le panneau de bois est moins épais que le mur (E/2) pour créer du relief
    box(unit, hautP, E/2);
    popMatrix();
  }
  popMatrix();
}
