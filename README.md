Projet A22 : Les gladiateurs
============================

Nous modélisons la version du jeu *avec joueurs* : l'éditeur et le laniste
seront des joueurs humains, et les gladiateurs seront des PNJ.

DCc
---
### La méthode `Mirmillon::estFrappe`
C'est une méthode polymorphique définie dans `Gladiateur`.  Elle n'a aucun effet
initialement, mais elle est redéfinie (`@Override` en Java) dans `Mirmillon`
afin que chaque instance de `Mirmillon` ajoute une référence vers chacun de ses
agresseurs dans un attribut privé de type `Collection`.  Par exemple :
```java
private void estFrappe(Gladiateur agresseur) {
    this.agresseurs.add(agresseur);
}
```

De plus, on redéfinira `Gladiateur::donnerRapport` dans `Mirmillon` de telle
sorte à ce que chaque mirmillon donne la liste des gladiateurs qui ont réussi à
le frapper, comme ceci :
```java
public String donnerRapport() {
    return super.donnerRapport() + "\nAgresseurs : " +
           Arrays.toString(agresseurs.toArray());
}
```

### La méthode `Retiaire::getModificateurCoupRecu`
Dans le sujet, il est indiqué que les coups portés à un rétiaire voient leur
force diminuer d'une valeur égale à son agilité.  On aurait pu utiliser un
attribut `modificateurCoupRecu` dont la valeur serait initialisée à l'agilité
du rétiaire dans le constructeur.  Mais si son agilité venait à changer pour une
quelconque raison, il faudrait également mettre à jour cet attribut, et il est
donc plus simple d'avoir une méthode comme ceci :
```java
protected int getModificateurCoupRecu() {
     return -agilite;
}
```
Dans `Gladiateur` (et par extension `Mirmillon`), on se contentera de retourner
0.

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


Pour aller plus loin
--------------------
Il aurait été possible, pour avoir une gestion plus fine des permissions sur les
méthodes des gladiateurs, des ethnies,  etc., d'utiliser la notion de
"contrôleur" : par exemple, des interfaces `LanisteGladiateurView` ou
`EditeurGladiateurView` qui contiendraient respectivement les déclarations des
méthodes que le laniste et l'éditeur peuvent effectuer sur les gladiateurs.
`Gladiateur` implémenterait alors toutes ses vues.
