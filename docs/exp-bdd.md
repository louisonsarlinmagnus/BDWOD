# Expérimentations en base de données

En utilisant une base de données bien plus simple (figure Y.1.5) pour faire des tests j'ai pu me rendre compte de certain problèmes dans notre base (qui seront réglés plus tard).  
Ça m'a aussi permis de comprendre plusieurs choses expliquées dans la suite.

<center>
  <figure>
    <img src="https://i.imgur.com/yidJKKM.png"
    width="800"
    >
    <figcaption><i>Figure Y.1.5: Base de données de cuisine</i></figcaption>
  </figure>
</center>  

Pour créer cette base de données il faut le script suivant:

```sql
  DROP TABLE IF EXISTS "Ingredient" ;
  CREATE TABLE IF NOT EXISTS "Ingredient" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Nom_Ingredient" TEXT UNIQUE
  );

  DROP TABLE IF EXISTS "Recette";
  CREATE TABLE IF NOT EXISTS "Recette" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Nom_Recette" TEXT UNIQUE
  );

  DROP TABLE IF EXISTS "Constitue";
  CREATE TABLE IF NOT EXISTS "Constitue" (
    "Recette_id" INTEGER NOT NULL,
    "Ingredient_id"  INTEGER NOT NULL,
    FOREIGN KEY (Recette_id)
      REFERENCES Recette (id)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,

    FOREIGN KEY (Ingredient_id)
      REFERENCES Ingredient (id)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
  );
```

On remarque déjà que nous avons omis la contrainte `UNIQUE` pour certain attributs qui permettent d'éviter les doublons.

Ensuite nous avons simplement ajouter *a la main* des ingrédients avec le script suivant:

```sql
  INSERT OR IGNORE INTO Ingredient(Nom_Ingredient)
  VALUES ("Oeuf");

  INSERT OR IGNORE INTO Ingredient(Nom_Ingredient)
  VALUES ("Farine");

  INSERT OR IGNORE INTO Ingredient(Nom_Ingredient)
  VALUES ("Beurre");
```


Puis c'est le tour d'une recette:

```sql
  INSERT OR IGNORE INTO Recette(Nom_Recette)
  VALUES ("Pâte a crêpes");
```

A cette étape nous avons plusieurs ingrédients a notre disposition et une recette mais il n'y a aucun lien entre eux.

En effet le lien se fera via la table `Constitue`. Cette table permet de stocker le lien entre un recette et des ingrédients. Pour créer ces liens entre recette et ingrédients nous avons donc besoin du script suivant:

```sql

  INSERT OR IGNORE INTO Constitue(Recette_id,Ingredient_id)
  VALUES (1,1);

  INSERT OR IGNORE INTO Constitue(Recette_id,Ingredient_id)
  VALUES (1,2);

  INSERT OR IGNORE INTO Constitue(Recette_id,Ingredient_id)
  VALUES (1,3);
```

Via ce script on viens de faire le lien entre la recette portant l'id **1** et les ingrédients portant les ids **1**, **2** et **3**. On rappelle que les ids sont créés automatiquement et ne peuvent pas être modifié, ce qui renforce la sécurité de notre base de donnée tout en évitant encore les doublons.

Je concède que pour l'instant on ne voit pas bien le lien qu'on a créer. Pour le visualiser plus simplement on peut exécuter le script suivant:

```sql

  SELECT Nom_Recette, Nom_Incrédient 
  FROM Constitue
  JOIN Recette
  ON Constitue.Recette_id=Recette.id
  JOIN Ingredient
  ON Constitue.Ingredient_id=Ingredient.id;
```

Si on le décrypte on trouve:


1. On affiche les colonnes `Nom_Recette` et `Nom_Ingredient`
2. Venant de la table `Constitue`
3. On accole la table `Recette`
4. Où la colonne `Constitue.Recette_id` est égale à la colonne `Recette.id`
5. On accole la table `Ingredient`
6. Où la colonne `Constitue.Ingredient_id` est égale à la colonne `Ingredient.id`


Via les `JOIN` on fait donc les liens entre des tables. Pour notre sujet il nous faudra donc littéralement moult `JOIN`.

On remarque aussi qu'il faudrait rajouter un argument pour les Exercices dans un Entrainement. En effet de la manière dont la base a été faite il n'est pas possible de trier les exercices d'un entraînement.


On en déduit des scripts précédents que pour l'ajout d'une nouvelle recette nous pourrons enchaîner des `INSERT` si la `VALUES` n'existe pas encore dans la table.

Tentons d'écrire un seul script qui puisse nous permettre :

- D'ajouter une recette du nom de *"Gâteau a la vanille"*  
- Créer les `VALUES` nécessaires **SI ELLE N'EXISTENT PAS**  
- Créer les liens entre la recette et les ingrédients dans la Table `constitue`  
On prendra en recette de ce gâteau uniquement de l’œuf et de la vanille.

```sql
INSERT OR IGNORE INTO Ingredient(Nom_Ingredient)
  VALUES ("Oeuf");

  INSERT OR IGNORE INTO Ingredient(Nom_Ingredient)
  VALUES ("Vanille");

  INSERT OR IGNORE INTO Recette(Nom_Recette)
  VALUES ("Gâteau à la Vanille");

  INSERT OR IGNORE INTO Constitue(Recette_id, Ingredient_id)
  VALUES(
    (SELECT Recette.id FROM Recette WHERE Recette.Nom_Recette LIKE "Gâteau à la Vanille"),
    (SELECT id FROM Ingredient WHERE Ingredient.Nom_Ingredient LIKE "Oeuf")
  );

  INSERT OR IGNORE INTO Constitue(Recette_id, Ingredient_id)
  VALUES(
    (SELECT Recette.id FROM Recette WHERE Recette.Nom_Recette LIKE "Gâteau à la Vanille"),
    (SELECT id FROM Ingredient WHERE Ingredient.Nom_Ingredient LIKE "Vanille")
  );
```



Or on remarque bien qu'il est possible d’exécuter plusieurs fois ce script et on obtient une multitude d'enregistrement identique. Il faudra donc créer un index qui permettra d'ignorer l'ajout si la ligne existe déjà:


```sql
CREATE UNIQUE "DoubleConstitue" ON "Constitue" (
  "Recette_id"
  "Ingredient_id"
);
```