
/*
  Construit l'ensemble du château : assemble les 4 tours
  
  Paramètres: 
 
 dist =distance entre  des tours
 nB= nombre de briques en largeur pour une tour
 nE= nombre d'étages d'une tour
 unit= largeur d'une brique
 H= hauteur d'une brique
 E= épaisseur des murs
 hP= hauteur de la porte
 lP= largeur de la porte (en briques)
 hMur= hauteur du mur d'enceinte
 hMrt= hauteur des meurtrières
 */



void dessinerChateau(float dist, int nB, int nE, float unit, float H, float E, int hP, int lP, int hMur, int hMrt) {
  // calcul largeur total d'une tour pour gérer les collisions entre les murs
  float largeT = nB * 2 * unit; 

  //les 4 tours
  // On utilise une double boucle pour parcourir les coordonnées (x, z) : (-1,-1), (-1,1), (1,-1), (1,1)
  for (int x = -1; x <= 1; x += 2) {
    for (int z = -1; z <= 1; z += 2) {
      pushMatrix();
      translate(x * dist/2, 0, z * dist/2);
      
      // On oriente les tours pour que les porte des soient toutes à l'interieur de la cour
      
      if (x == 1 && z == 1) rotateY(PI + HALF_PI); 
      else if (x == -1 && z == 1) rotateY(PI);     
      else if (x == -1 && z == -1) rotateY(HALF_PI); 
      else if (x == 1 && z == -1) rotateY(0);      
      
      
      dessinerTour(nB, nE, unit, H, E, true, hP, lP,hMrt);
      popMatrix();
    }
  }

 // La longueur du mur est ajustée pour qu'il s'arrête pile aux parois latérales des tours
  float longM = dist - largeT; 
  
  // On crée 4 murs en tournant de 90° (HALF_PI) à chaque fois
  for (int i = 0; i < 4; i++) {
    pushMatrix();
    rotateY(HALF_PI * i);
    
    /* On part du centre, on avance jusqu'à l'ax des tours (dist/2), on ajoute la demi-largeur
     de la tour pour atteindre le bord, et on retire E/2 pour que l'épaisseur soit vers l'intérieur*/
    float decalageExterieur = (dist/2) + (largeT/2) - (E/2);
    translate(0, 0, decalageExterieur);
    
    // Dessine le mur. Si i == 0, c'est le mur de façade, donc on y ajoute une porte centrale.
    dessinerMurEnceinte(longM, hMur, H, E, (i == 0), hP, lP, unit);
    popMatrix();
  }
}
