/*
  Dessine un toit pyramidal au sommet de la tour en utilisant des triangles
  
  paramètres :
  
  n=nombre de briques en largeur
  etages= Hauteur totale de la tour 
  unit= largeur d'1 demi-brique
  H=Hauteur d'une brique.
  E=Épaisseur des murs(brique).
 */


void dessinerToit(int n, int etages, float unit, float H, float E) {
  // On calcule la largeur de la base du toit pour qu'il repose sur l'intérieur des murs
  float base = (n * 2 * unit)/2 - E;
  // On définit une hauteur fixe pour la pointe du toit (8 fois la hauteur d'une brique)
  float hT = H * 8;
  pushMatrix();
  // On déplace le toit tout en haut de la tour. 
  // Le "+ H*2" permet de l'ajuster par rapport aux créneaux.
  translate(0, -etages * H + H*2, 0);
  
  //Texture du toit
  fill(50, 60, 80); 
  stroke(30);
  
  // Construction de la pyramide face par face avec des triangles
  beginShape(TRIANGLES);
  // Face AVANT
  vertex(-base,0,base); 
  vertex(base,0,base); 
  vertex(0,-hT,0);
  
  // Face ARRIÈRE
  vertex(-base,0,-base); 
  vertex(base,0,-base); 
  vertex(0,-hT,0);
  
  // Face GAUCHE
  vertex(-base,0,-base); 
  vertex(-base,0,base); 
  vertex(0,-hT,0);
  
  // Face DROITE
  vertex(base,0,-base); 
  vertex(base,0,base); 
  vertex(0,-hT,0);
  endShape();
  popMatrix();
}
