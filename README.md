Projet A22 : Les gladiateurs
============================

Nous modélisons la version du jeu *avec joueurs* : l'éditeur et le laniste
seront des joueurs humains, et les gladiateurs seront des PNJ.

DCU
---
Le cas d'utilisation "déclarer la fin du combat" `<<include>>` "demander
rapports aux gladiateurs", car l'éditeur et le laniste ne peuvent demander aux
gladiateurs de faire un rapport avant la fin du combat.

Idem pour l'ethnie vainqueur ; il ne peut y avoir de vainqueur que lorsque les
combats sont terminés.

Le cas d'utilisation "déclencher le début des combats" `<<include>>` "décider
des armes" : le laniste doit attendre que l'éditeur commence le combat pour
pouvoir choisir les armes de ses gladiateurs.

DCa
---
Les rétiaires et les mirmillons sont des gladiateurs.  Les classes `Retiaire`
et `Mirmillon` héritent donc de la classe `Gladiateur`, car ils partagent des
attributs et des comportements communs.
