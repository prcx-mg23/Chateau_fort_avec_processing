/*
  Dessine une immense plateforme pour représenter le sol (herbe)
  Le sol est légèrement décalé pour ne pas chevaucher la base des murs
  
  Paramètres :
  sW=Largeur du sol
  sH= Hauteur 
  sD=Profondeur
  sR= composante rouge pour la couleur su sol
  sG= composante verte pour la couleur su sol
  sB= composante bleue pour la couleur su sol
  HBr=Hauteur de la brique
 */
 
 

void dessinerSol(float sW, float sH, float sD, int sR, int sG, int sB,float HBr) {
  pushMatrix(); 
  fill(sR, sG, sB); 
  noStroke(); 
  
  // POSITIONNEMENT : 
  // On décale le sol de la moitié de la hauteur d'une brique vers le bas.
  // Cela permet à la première rangée de briques de reposer sur le sol 
  // sans scintillement visuel (z-fighting).
  translate(0,HBr/2, 0); 
  
  // On dessine un cube extrêmement large et plat
  // L'épaisseur évite qu'il soit invisible de profil.
  box(sW, sH, sD); 
  popMatrix();
}
