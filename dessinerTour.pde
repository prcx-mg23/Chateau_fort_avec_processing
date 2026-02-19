/*
  Construit une tour brique par brique avec gestion du décalage(offset)
  et des ouvertures (porte, meurtrières, créneaux)
 
   Paramètres :
   
   n=largeur de la tour en brique pleine
   hautr= hauteur de la tour
   unit= largeur d'une demi-brique
   H=hauteur de la brique
   E=epaiseur de la brique
   porte= pour vérifier si on doit mettre une porte sur une face
   hp=hauteur de la porte
   
 
 */


void dessinerTour(int n, int hautr, float unit, float H, float E, boolean porte, int hP, int lP,int hMrt) {
  float largeM = n * 2 * unit;// Calcul de la largeur d'une face //1 unit = largeur d une démi brique demi brique, unit*2= brique pleine
  
  for (int cote = 0; cote < 4; cote++) {
    pushMatrix();
    rotateY(HALF_PI * cote);// Rotation pour changer de face
    // On se place sur le bord extérieur de la tour pour dessiner la face
    translate(0, 0, largeM/2.0 - E/2.0);
    
    // Boucle de construction étage par étage
    for (int h = 0; h < hautr; h++) {
      // logique de décalage: un étage sur deux est décalé d'une demi-unité (offset = 1)
      // On n'applique pas d'offset sur les deux derniers étages (créneaux)
      int offset = (h % 2 != 0 && h < hautr - 2) ? 1 : 0;
      int nSlots = n * 2; // Nombre de positions de demi-brique disponibles
      
      // Boucle de remplissage de la ligne (chaque slot = largeur 'unit')
      for (int c = 0; c < nSlots; c++) { 
        // Teste si la case actuelle doit rester vide (porte, meurtrière ou vide entre créneaux)
        if (espaceVide(c, h, nSlots, (porte && cote==0), hautr, hP, lP,hMrt)) continue;
        
        // Calcul de la position X de la brique (centrage sur la face)
        float x = (c - nSlots/2.0 + 0.5) * unit;
        fill(180, 185, 190); 
        stroke(110);
        
        // Llogique de pose de brique pleines :
        // si (c+offset) est pair, on essaie de poser une brique entière (2 units)
        // Mais on vérifie d'abord si la case suivante (c+1) ne doit pas être vide
        pushMatrix();
        if ((c + offset) % 2 == 0 && c < nSlots-1 && !espaceVide(c+1, h, nSlots, (porte && cote==0), hautr, hP, lP,hMrt)) {
            translate(x + unit/2.0, -h * H, 0); // Décale le centre vers la droite pour la brique double
            box(unit * 2, H, E); // Poser une brique pleine
            c++;// On saute la colonne suivante puisqu'on vient de la remplir
        } 
        
        else {
          // Sinon, on pose une demi-brique (fin de mur, bordure d'ouverture ou décalage)
            translate(x, -h * H, 0); 
            box(unit, H, E);
        }
        popMatrix();
      }
    }
    popMatrix();
  }
  // Ajout des éléments (toit et porte)  sur la tour
  dessinerToit(n, hautr, unit, H, E);
  if (porte) dessinerPorte(n, unit, H, E, hP, lP);
}
