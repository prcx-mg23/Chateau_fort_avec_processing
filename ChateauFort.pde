
//Variables por la Camera
float zoom = 1400;
float rotY = 0;
float rotX = -PI/6;

// Variables pour le chateau
float distanceEntreTours = 1000;
  int LargeurTour = 12;
  int HauteurTour = 40;
  float largeurDemiBrique = 20;
  float hauteurBrique = 20;
  float epaisseurBrique = 20;
  int hauteurPorte = 10;
  int largeurPorte = 2;
  int hauteurMurEnceinte = 25;
  int hateurMeurtriere=3;
  
 //Variables pour le sol 
 
 float LargeurSol=5000;
 float HauteurSol=2;
 float ProfondeurSol=5000;
 int  sColRed=40;
 int  sColBlue=70;
 int  sColGreen=40;
 
void setup() {
  size(1000, 600, P3D);
}

void draw() {
  background(135, 206, 235);// Ciel
  lights();// l'éclairage 
  
  // Placement de la scène
  translate(width/2, height/2 + 150, 0);
  translate(0, 0, -zoom); // Applique le recul de la caméra
  rotateX(rotX);    // Applique l'inclinaison verticale      
  rotateY(rotY);  // Applique la rotation orbitale        
  
  dessinerSol( LargeurSol, 
               HauteurSol, 
               ProfondeurSol,
               sColRed,
               sColBlue, 
               sColGreen,
               hauteurBrique);
               
  dessinerChateau(distanceEntreTours, 
                  LargeurTour, 
                  HauteurTour, 
                  largeurDemiBrique, 
                  hauteurBrique, 
                  epaisseurBrique, 
                  hauteurPorte, 
                  largeurPorte, 
                  hauteurMurEnceinte,
                  hateurMeurtriere);
}

 /*
   Permet de faire tourner la caméra autour du château
   Clic gauche + glisser la souris
 */
void mouseDragged() {
  if (mouseButton == LEFT) { 
    // On convertit le mouvement de la souris en angle de rotation
        rotY += (mouseX - pmouseX) * 0.01; 
        rotX -= (mouseY - pmouseY) * 0.01; 
      }
      
 }
 
 /*
   Gère le zoom avant/arrière
   Utilise la molette de la souris(en avant pour zoomer,en arrire pour dézoomer)
 */
void mouseWheel(MouseEvent event) {
    zoom += event.getCount() * 30; 
}
