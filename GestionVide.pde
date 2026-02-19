/*
 Détermine si une position donnée (colonne, étage) doit être vide
 Les paramètres: 
 c=Indice de la colonne actuelle
 h=Indice de l'étage actuel
 nS= Nombre total de slots sur la face (nSlots)
 faceP= Vrai si la face actuelle est celle qui doit avoir une porte
 totH= Hauteur totale de la tour (pour situer le sommet)
 hP=Hauteur de la porte
 lP= Largeur de la porte
 hMrt= Hauteur individuelle de chaque meurtrière (nombre de briques)
 */
 
// 1 etage = 1 brique en comptant verticalement

boolean espaceVide(int c, int h, int nS, boolean faceP, int totH, int hP, int lP,int hMrt) {
  
  // Les crénaux( au sommet de la tour)
  // On travaille sur les 2 derniers étages (totH - 2)
  if (h >=totH - 2) {
    // On laisse les coins pleins (2 briques de chaque côté)
    if (c < 2 || c >= nS - 2) return false;
    // On crée une alternance : vide sur 2 slots, plein sur 2 slots
    return (c - 2) % 4 >= 2;
  }
  
  // La porte
  // Si on est sur la face 'Porte', (h < hP) 
  // et dans les colonnes centrales (autour de nS/2)
  if (faceP && h < hP && c >= nS/2-lP && c < nS/2+lP) return true;
  
  //Les meurtrieres
  // On ne les place que sur la colonne centrale de chaque face
  if (c == nS/2) { 
    int hDebut = hP + 2; // Commence toujours 2 briques après la porte
    int espacement = 10;  // on place une meurtrière tous les 10 etages, 
    
    // Boucle pour vider plusieurs briques verticalement afin de créer une fente
    // La hauteur de la fente est définie par le paramètre hMrt
    for (int i = 0;i<hMrt; i++) { 
      // Si l'étage actuel correspond à un segment de la meurtrière
      // et qu'on ne touche pas encore le sommet de la tour
      if (h >= hDebut&&(h-hDebut) % espacement == i && h < totH - 4) {
        return true;
      }
    }
  }
  // Par défaut, la case est pleine (on pose une brique)
  return false;
}
