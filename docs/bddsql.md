# La base de données SQL

Pour stocker les exercices nous avons chercher un moyen simple, léger, efficace et portable. Les recherches on mené a éliminer les services de serveur de base de données relationnelles tels que *MySQL* et *PostgreSQL*, en effet ces technologie ne sont pas portable et complexe.  
Puis les données formaté tels que *[XML](https://fr.wikipedia.org/wiki/Extensible_Markup_Language)* et *[JSON](https://fr.wikipedia.org/wiki/JavaScript_Object_Notation)* ont été écarté pour des raisons de fiabilité et de simplicité.  

Nous avons donc choisi de travailler avec [**SQLite**](https://www.sqlite.org/index.html), en effet ce service permet de gérer un BDD de type *SQL* tout en restant portable et simple à mettre ne œuvre.

En effet SQLite ne demande pas la mise en place d'un serveur de BDD, les données sont stockées sur un seul fichier. C'est donc une solution portable que l'on retrouve dans beaucoup d'appareil et notamment dans l'OS Android.



## Les modèles de données

La technologie ayant été choisi il est temps de s'y mettre. La première étape est bien évidement la recherche d'informations. C'est ainsi qu'on a décidé d'appliqué un modèle de conception de base de donnée, le modèle *"[Merise](https://www.base-de-donnees.com/merise/)"*.

On retiendra donc que Merise permet de :

- décrire les données grâce au MCD : quelles sont les relations et les dépendances entres les différents acteurs.  
- d'implémenter logiquement grâce au MLD du point précédent.  
- Proposer une construction concrète et utilisable du point précédent grâce au MPD


### Le MCD

Le *MCD* est constitué des éléments suivants:

- Les entités (1 rectangle = 1 objet)
- Les propriétés (la liste des données de l’entité)
- Les relations qui expliquent et précisent comment les entités sont reliées entre elles (les ovales)
- Les cardinalités (les petits chiffres au dessus des "pattes")


<center>
  <figure>
    <img src="https://i.imgur.com/cfuxpd1.png"
    width="1000"
    >
    <figcaption><i>Figure 2: Modèle Conceptuel de Donnée a faire</i></figcaption>
  </figure>
</center>

### Le MPD

Concrètement, cette étape permet de construire la structure finale de la base de données avec les différents liens entre les éléments qui la composent. Pour la peine, on change aussi de vocabulaire :

- Les entités se transforment en tables ;
- Les propriétés se transforment en attributs
- Les propriétés se trouvant au milieu d’une relation génèrent une nouvelle table.
- Les identifiants se transforment en clés et se retrouvent soulignés. Chaque table dispose d’au minimum une clé primaire
- Les relations et les cardinalités se transforment en champs parfois soulignés : il s’agit de créer des "clés étrangères" reliées à une "clé primaire" dans une autre table

<center>
  <figure>
    <img src="https://i.imgur.com/Gu9B7QB.png"
    width="1000"
    >
    <figcaption><i>Figure 3: Modèle Physique de Donnée à faire</i></figcaption>
  </figure>
</center>  


### Le MLD

On représente ainsi les données issues de la modélisation Merise sous la forme suivante :

- Chaque ligne représente une table
- C’est toujours le nom de la table qui est écrit en premier
- Les champs sont listés entre parenthèses et séparés par des virgules
- Les clés primaires sont soulignées et placées au début de la liste des champs
- Les clés étrangères sont préfixées par un dièse

Cette étape ne porte pas d'intérêt dans le cadre de notre projet, elle a donc été sautée.  
  

## 3.1.2 Le Script SQL

Une fois les modèles conceptuels et physiques crées, il reste a créer le script de création de la base de données modélisée. Pour ceci nous allons devoir nous pencher sur le langage SQL.  

Chaque [SGBD](https://fr.wikipedia.org/wiki/Syst%C3%A8me_de_gestion_de_base_de_donn%C3%A9es) (Système de Gestion de Base de Données) possède ses propres spécificités et caractéristiques. Nous allons devoir donc créer un script SQL respectant les notations et caractéristiques de SQlite.

On se retrouve donc avec le script suivant:  

```sql
  DROP TABLE IF EXISTS "Entrainement" ;
  CREATE TABLE IF NOT EXISTS "Entrainement" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom" TEXT,
    "date" NUMERIC,
    "lieu" TEXT,
    "commentaire" TEXT
  );

  /*Creation de la Table Exercice*/
  DROP TABLE IF EXISTS "Exercice" ;
  CREATE TABLE IF NOT EXISTS "Exercice" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom" TEXT,
    "type" TEXT,
    "cashin" TEXT,
    "temps" INTEGER,
    "evolution_reps" TEXT,
    "nombre_tours" INTEGER,
    "time_cap" INTEGER,
    "durée_intervalle" INTEGER,
    "plusieur_mvt_par_intervalle" NUMERIC,
    "mouvement_alterné" NUMERIC,
    "temps_travail" INTEGER,
    "temps_repos" INTEGER,
    "cash-out" TEXT
  );

  /*Creation de la Table Mouvement*/
  DROP TABLE IF EXISTS "Mouvement" ;
  CREATE TABLE IF NOT EXISTS "Mouvement" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom" TEXT,
    "nbr_reps" INTEGER,
    "poids" INTEGER,
    "distance" INTEGER,
    "hauteur" INTEGER
    "temps" INTEGER
  );

  /*Creation de la Table Constitue*/
  DROP TABLE IF EXISTS "Constitue" ;
  CREATE TABLE IF NOT EXISTS "Constitue" (
    "ExerciceId" INTEGER NOT NULL,
    "EntrainementId" INTEGER NOT NULL,

    FOREIGN KEY("ExerciceId")
      REFERENCES "Exercice"("id") 
        ON DELETE CASCADE 
        ON UPDATE NO ACTION,

    FOREIGN KEY("EntrainementId")
      REFERENCES "Entrainement"("id") 
        ON DELETE CASCADE 
        ON UPDATE NO ACTION
  );

  CREATE UNIQUE INDEX "iConstitue" ON "Constitue" (
    "ExerciceId",
    "EntrainementId"
  );

  /*Creation de la Table Fait*/
  DROP TABLE IF EXISTS "Fait" ;
  CREATE TABLE IF NOT EXISTS "Fait" (
    "MouvementId" INTEGER NOT NULL,
    "ExerciceId" INTEGER NOT NULL,

    FOREIGN KEY("MouvementId")
      REFERENCES "Mouvement"("id") 
        ON DELETE CASCADE 
        ON UPDATE NO ACTION,

    FOREIGN KEY("ExerciceId")
      REFERENCES "Exercice"("id") 
        ON DELETE CASCADE 
        ON UPDATE NO ACTION
  );

  CREATE UNIQUE INDEX "iFait" ON "Fait" (
    "MouvementId",
    "ExerciceId" 
  );
```

Il faut chercher si on ajoute des unique quelque part ou si ça sert a rien.

Nous avons donc ajouter des UNIQUE et des INDEX.

Un fois le script de création de la base de donnée complètement créer il ne reste plus qu'a le "fournir" à *SQLite* pour le transformer en base de donnée. Ce script a pour extension *".sql"*.  

Un fois SQLite été [téléchargé](https://www.sqlite.org/download.html):

- On ouvre la BDD (ou on crée la BDD si elle n'existe pas) avec la commande : `.open BDWOD.db`  
- On set la visualisation d'une requête en mode colonne : `.mode column`  
- On active l'affichage de l'entête pour des raison de visibilité : `.header on`  
- On exécute le script *.sql* de création de la base de donnée: `.read script_BDWOD.sql`  

<center>
  <figure>
    <img src="https://i.imgur.com/BZMCDXK.png"
    width="800"
    >
    <figcaption>*Figure 4: Shell SQLite pour la création d'une base de données*</figcaption>
  </figure>
</center>  


## Remplir la base de donnée

Une fois la base de données crée il faut y rentrer les données en question. Pour cela nous allons devoir créer un autre script SQL. Mais avant de commencer a coder nous pouvons nous pencher sur l'**annexe 1**.  

Il est maintenant envisageable de remplir correctement notre base de donnée. Pour cela j'ai choisi cet exemple


<center>
  <b>Description Entrainement:</b>  
  &emsp;<span style="color:grey">CrossFit Terrasse  
  &emsp;01/05/2020  
  &emsp;Entrainement complet et assez long</span>  
  <br>
  <b>Warmup</b>: <span style="color:#c239d4">3 Rounds</span>   
  &emsp;<span style="color:blue">3</span>
  <span style="color:green">Tiger Push-ups  </span>  
  &emsp;<span style="color:blue">6</span>
  <span style="color:green">V-ups</span>  
  &emsp;<span style="color:blue">9</span>
  <span style="color:#03fca5">Sumo </span>
  <span style="color:green"> Squats</span>  
  <br>
  <b>For Time</b>: <span style="color:#c239d4">4 Rounds, TC: 20’</span>   
  &emsp;<span style="color:orange">Cash-in </span>
  <span style="color:blue">50</span>
  <span style="color:green">DU</span>  
  &emsp;<span style="color:blue">10</span>
  <span style="color:green">Pull-ups</span>  
  &emsp;<span style="color:blue">20</span>
  <span style="color:#03fca5">Squat </span>
  <span style="color:green">Snatches</span>   
  &emsp;<span style="color:blue">30"</span>
  <span style="color:green">Gainage</span>  
  &emsp;<span style="color:orange">Cash-out </span>
  <span style="color:blue">50</span>
  <span style="color:green">DU</span>  
  <br>
  <b>EMOM</b>: <span style="color:#c239d4">12'</span>   
  &emsp;<span style="color:blue">10</span>
  <span style="color:green">Leg Raise</span>  
  &emsp;<span style="color:blue">20</span>
  <span style="color:green">Sit-ups</span>  
  <br>
</center>

On remarque bien que cet entraînement comporte:

- Une description avec le lieu, la date et une description
- Un "Warmup" de 3 Rounds avec plusieurs mouvement
- Un **premier** exercice de 4 Rounds et un Time Cap de 20 minutes. Composé d'un cash-in et d'un cash-out qui sont des argument du mouvement. Et enfin de mouvements.
- Un **second** exercice d'un temps de 12 minutes, plusieurs mouvements.
