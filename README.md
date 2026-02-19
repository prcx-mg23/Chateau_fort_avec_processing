# Château Fort 3D - Processing
## Bienvenue dans ce projet de génération procédurale d'un château fort en 3D !
Ce programme utilise l'environnement Processing pour construire une forteresse complète avec ses tours, ses murs d'enceinte, ses meurtrières et ses créneaux.



## Présentation du projetLe but de ce projet est de modéliser un château fort modulable. 
* Chaque élément (tours, murs, portes) est construit de manière logique, brique par brique, pour un rendu détaillé.
  
**Caractéristiques principales** :
* Architecture modulaire : 4 tours reliées par des murs d'enceinte.
* Détails réalistes : Présence de meurtrières, de créneaux au sommet des tours et de toits pyramidaux.
* Interaction utilisateur :
  * Rotation : Clic gauche + glisser pour tourner autour du château.
  * Zoom : Utilisation de la molette de la souris pour s'approcher ou s'éloigner.
* Gestion des textures : Alternance de briques pleines et demi-briques (offset) pour un aspect "maçonnerie".

## Structure du code
Les fichiers sont organisés comme suit 

*  ChateauFort.pde : Point d'entrée, gestion de la caméra et de la boucle principale.
* dessinerChateau.pdeAssemble les tours et les murs pour former la structure globale.
* dessinerTour.pde : Construit une tour étage par étage avec ses briques.
* dessinerMur.pde : Génère les murs d'enceinte et la porte principale.
* dessinerToit.pde : Crée le toit pyramidal en haut des tours via des triangles.
* GestionVide.pde : Logique permettant de créer les ouvertures (portes, meurtrières, créneaux).
* dessinerSol.pde : Affiche la plateforme d'herbe sous le château.
* dessinerPorte.pde : Dessine les battants en bois pour les accès aux tours.

## Configuration 
Tu peux ajuster les dimensions du château directement dans les variables globales de ChateauFort.pde:
* distanceEntreTours : Pour agrandir la cour intérieure.
* HauteurTour : Pour donner plus de verticalité.
* hauteurMurEnceinte : Pour ajuster la protection des remparts.

## Installation & Lancement

* Assure-toi d'avoir Processing installé.
* Ouvre le fichier ChateauFort.pde dans Processing.
* Appuie sur le bouton Run(play).
