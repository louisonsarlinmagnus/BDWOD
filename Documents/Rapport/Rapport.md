#<center>BDWOD</center>
##<center>Rapport de suivi de projet</center>
#####<center>LOUISON SARLIN--MAGNUS</center>
######<center><font size="-1">Avec la participation de : ARTHUR DURAND</font></center> 


<br>
<br>

***

###<center>Sommaire</center>
####<a id= "titreDescription" href="#chapDescription"><span style="color:black">1. Description du projet</span></a>  

####<a id= "titreAnalyse" href="#chapAnalyse"><span style="color:black">2. Analyse du besoin</span></a>  

####<a id="titreApprocheTech" href="#chapApprocheTech"><span style="color:black">3. Approche technique</span></a>  

####&emsp;&emsp;&emsp;<a id="titreBaseDeDonne"href="#chapBaseDeDonnee"><span style="color:black">3.1 La base de données</span></a>  

####&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="titreBDDModels" href="#chapBDDModels"><span style="color:black">3.1.1 Les modèles de données</span></a>  

####&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="titreBDDMCD" href="#chapBDDMCD"><span style="color:black">3.1.1.1 Le MCD</span></a>

####&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="titreBDDMPD" href="#chapBDDMPD"><span style="color:black">3.1.1.2 Le MPD</span></a>  

####&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="titreBDDMLD" href="#chapBDDMLD"><span style="color:black">3.1.1.3 Le MLD</span></a>  

####&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="titreBDDscript" href="#chapBDDscript"><span style="color:black">3.1.2 Le Script</span></a>  

####&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="titreBDDremplir" href="#chapBDDremplir"><span style="color:black">3.1.3 Remplir la base de données</span></a>  

####<a id="titreLiens" href="#chapLiens"><span style="color:black">W. Liens utiles</span></a>  

####<a id="titreGlossaire" href="#chapGlossaire"><span style="color:black">X. Glossaire</span></a>  


####<a id="titreAnnexes" href="#chapAnnexes"><span style="color:black">Y. Annexes</span></a>  

####&emsp;&emsp;&emsp;<a id="titreEXPBDD" href="#chapEXPBDD"><span style="color:black">Y.1. Expérimentations en base de données</span></a>  

<br>
<br>
<br>
<br>

***
###<a id="chapDescription" href="#titreDescription"><span style="color:black">1. Description du projet</span></a>

Pour facilité la création d’entraînement on souhaite constitué dans un premier temps une base de donnée d’exercices. Cette base de donnée pourra par la suite être exploité par un logiciel ou une application mobile. Il n'est pour l'instant pas envisagé de créer un *créateur de WOD<a href="#noteWOD1" id="noteWOD1ref"><sup>1</sup></a>*, mais plutôt un **moteur de recherche de WOD**.

Le produit final sera une application mobile [Android](https://fr.wikipedia.org/wiki/Application_mobile).  



<br>
<br>

***
###<a id="chapAnalyse" href="#titreAnalyse"><span style="color:black">2. Analyse du besoin</span></a>

Dans cette partie on se questionnera sur les fonctionnalité voulue et le fonctionnement global.
<br>

On souhaite qu'il soit possible de créer un entraînement qui ne comporterais qu'un échauffement ou qu'un exercice. Un échauffement est un exercice avec un label échauffement supplémentaire.

Un **entraînement**:

- Un nom (optionnel)
- Une date (optionnelle)
- Un lieu (optionnel)
- Un échauffement (optionnel)
- Un exercice (optionnel)

Un **exercice** (ou échauffement):

- Nom  (optionnel)
- Est un échauffement? (oui/non)
- Est un Benchmark? (oui/non)
- Type d'exercice (For Time, AMRAP, EMOM, TABATA)

Un **AMRAP**:

- A un cash-in? (oui/non)
- A un cash-out? (oui/non)
- Temps
- Repos entre tours (optionnel)
- Mouvement(s)

Un **For Time**:

- A un cash-in? (oui/non)
- A un cash-out? (oui/non)
- A les mêmes répétition pour les mouvement? (oui/non)
- Si (A les mêmes répétition pour les mouvement?) Évolution des reps
- Nombre de tours (Au moins 1)
- Time Cap (optionnel)
- Repos entre tours (optionnel)
- Mouvement(s)

Un **EMOM**:

- Intervalle (défaut=1)
- Un ou plusieurs mouvement par intervalle? (oui/non)
- Mouvement alterné à chaque intervalle (oui/non)


Un **TABATA**:

- Temps de travail
- Temps de repos
- Un ou plusieurs mouvement par intervalle? (oui/non)
- Mouvement alterné à chaque intervalle (oui/non)


Un **mouvement**:

- Un mouvement physique
- Un nombre de reps (optionnel) \[Sauf Tabata]
- Un poids (optionnel)
- Une distance (optionnel) \[Sauf Tabata]
- Une hauteur (optionnel)
- Un temps (optionnel) \[Sauf Tabata]

Si on prend un exemple concret on peut avoir:
<br>
<br>


<table style="font-size:75%">
<tr>
  <td>
    <b>Description Entrainement:</b><br>
    &emsp;<span style="color:grey">CrossFit Terrasse<br>
    &emsp;01/05/2020<br>
    &emsp;Entrainement complet</span><br><br>
  </td>
  <td>
    On retrouve la description<br>
    Le lieu de l’entraînement<br>
    La date<br>
    Un commentaire<br><br>
  </td>
  <td>
    <br>
    Text lieuEntrainement="CrossFit-Terrasse"<br>
    Date dateEntrainement="01/05/2020"<br>
    Text descriptionEntrainement="Entrainement complet"<br><br>
  </td>
</tr>

<tr>
  <td>
    <b>Warmup</b>: <span style="color:#c239d4">3 Rounds</span><br> 
    &emsp;<span style="color:blue">3</span>
    <span style="color:green">Tiger Push-ups</span><br>
    &emsp;<span style="color:blue">6</span>
    <span style="color:green">V-ups</span><br>
    &emsp;<span style="color:blue">9</span>
    <span style="color:green">Sumo Squats</span><br><br>
  </td>
  <td>
    Le Warmup est un For Time<br>
    On a un nombre de répétition simple<br>
    On a ni cash-in/cash-out, ni nombre de répétition évolutif<br>
    On fait 3 tours sans Time Cap<br><br>
  </td>
  <td>
    new ForTime ;isWarmup=true; Label="Warmup"<br>
    isReps=true;int nbrRep=3;Text mvt="Tiger Push-ups"<br>
    <br>
    isReps=true;int nbrRep=9;Text mvt="Sumo Squats"<br><br>
  </td>
</tr>

<tr>
  <td>
    <b>For Time</b>: <span style="color:#c239d4">4 Rounds, TC: 20’</span><br> 
    &emsp;<span style="color:orange">Cash-in </span>
    <span style="color:blue">50</span>
    <span style="color:green">DU</span><br>
    &emsp;<span style="color:blue">10</span>
    <span style="color:green">Pull-ups</span><br>
    &emsp;<span style="color:blue">20</span>
    <span style="color:green">Squat Snatches</span><br> 
    &emsp;<span style="color:blue">30"</span>
    <span style="color:green">Gainage</span><br>
    &emsp;<span style="color:orange">Cash-out </span>
    <span style="color:blue">50</span>
    <span style="color:green">DU</span><br><br>
  </td>
  <td>
    L'exercice est un For Time de 4 tours en 20 minutes<br>
    On a un cash-in et un cash-out<br>
    <br>
    On fait 30 secondes de gainage<br>
    <br><br>
  </td>
  <td>
    new ForTime ; nbrRound=4; TimeCap=20m<br>
    isCashIn=true;isCashOut=true<br>
    mvtCashIn="DU"; repsCashIn=50<br>
    <br>
    isTime=true; time=30s<br>
    mvtCashIn="DU"; repsCashIn=50<br><br>
  </td>
</tr>

<tr>
  <td>
    <b>EMOM</b>: <span style="color:#c239d4">12'</span><br> 
    &emsp;<span style="color:blue">10</span>
    <span style="color:green">Leg Raise</span><br>
    &emsp;<span style="color:blue">20</span>
    <span style="color:green">Sit-ups</span><br><br>
  </td>
  <td>
    On fait un EMOM avec 1 minute en intervalle (=défaut)<br>
    On alterne le mouvement à chaque intervalle<br>
    <br><br>
  </td>
  <td>
    new Emom; timeEmom=12m; isAltern=true; isMememvt=false <br>
    <br>
    isReps=true;int nbrRep=20;Text mvt="Sit-ups"<br><br>
  </td>
</tr>

</table>


On voit a partir de ce table le fonctionnement qu'aurait l'application.

***

Dans la continuité de l'analyse précédente je propose une architecture *[JSON](https://fr.wikipedia.org/wiki/JavaScript_Object_Notation)*. Ce format pourrait être utiliser pour envoyer les données vers l'application dans l'éventualité d'un serveur distant.


<table><tr><td><pre style="margin: 0; line-height: 125%">
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12
  13
  14
  15
  16
  17
  18
  19
  20
  21
  22
  23
  24
  25
  26
  27
  28
  29
  30
  31
  32
  33
  34
  35
  36
  37</pre></td><td><pre style="margin: 0; line-height: 125%">{
  <span style="color: #007700">&quot;Entrainement&quot;</span> : {
    <span style="color: #007700">&quot;nom&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span> ,
    <span style="color: #007700">&quot;date&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span> ,
    <span style="color: #007700">&quot;lieu&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span> ,
    <span style="color: #007700">&quot;commentaire&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span>,
    <span style="color: #007700">&quot;Exercice&quot;</span> : 
    [
      {
        <span style="color: #007700">&quot;nom&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span> ,
        <span style="color: #007700">&quot;type&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span>,
        <span style="color: #007700">&quot;cash-in&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span> ,
        <span style="color: #007700">&quot;temps&quot;</span> : <span style="color: #0000DD; font-weight: bold">0</span> ,
        <span style="color: #007700">&quot;evolution_reps&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span> ,
        <span style="color: #007700">&quot;nombre_tours&quot;</span> : <span style="color: #0000DD; font-weight: bold">1</span> ,
        <span style="color: #007700">&quot;time_cap&quot;</span> : <span style="color: #0000DD; font-weight: bold">900</span> ,
        <span style="color: #007700">&quot;durée_intervalle&quot;</span> : <span style="color: #0000DD; font-weight: bold">1</span> ,
        <span style="color: #007700">&quot;plusieur_mvt_par_intervalle&quot;</span> : <span style="color: #008800; font-weight: bold">false</span> ,
        <span style="color: #007700">&quot;mouvement_alterné&quot;</span> : <span style="color: #008800; font-weight: bold">true</span> ,
        <span style="color: #007700">&quot;temps_travail&quot;</span> : <span style="color: #0000DD; font-weight: bold">20</span>,
        <span style="color: #007700">&quot;temps_repos&quot;</span> : <span style="color: #0000DD; font-weight: bold">10</span>,
        <span style="color: #007700">&quot;cash-out&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span>,
        <span style="color: #007700">&quot;mouvement&quot;</span> : 
        [
          {
            <span style="color: #007700">&quot;nom&quot;</span> : <span style="background-color: #fff0f0">&quot;&quot;</span> ,
            <span style="color: #007700">&quot;nbr_reps&quot;</span> : <span style="color: #0000DD; font-weight: bold">1</span> ,
            <span style="color: #007700">&quot;poids&quot;</span> : <span style="color: #0000DD; font-weight: bold">0</span> ,
            <span style="color: #007700">&quot;distance&quot;</span> : <span style="color: #0000DD; font-weight: bold">0</span> ,
            <span style="color: #007700">&quot;hauteur&quot;</span> : <span style="color: #0000DD; font-weight: bold">0</span>,
            <span style="color: #007700">&quot;temps&quot;</span> : <span style="color: #0000DD; font-weight: bold">0</span> ,
          },
        ],
      },
    ],
  },
}
</pre></td></tr></table>

On voit plus précisément le modèle qu'adoptera la donnée. Évidement les attributs seront utilisable sous certaines conditions par exemple l'attribut <span style="color: #007700">&quot;temps_travail&quot;</span> sera disponible uniquement pour un exercice de type "Tabata".


<br>
<br>

***
###<a id="chapApprocheTech" href="#titreApprocheTech"><span style="color:black">3. Approche technique</span></a>

On suppose a ce stade que le projet s'articulera donc par une base de donnée d'un côté et une API<a href="#noteAPI6" id="noteAPI6ref"><sup>6</sup></a> de l'autre.

####&emsp;&emsp;&emsp;<a id="chapBaseDeDonnee" href="#titreBaseDeDonne"><span style="color:black">3.1 La base de données</span></a>

Pour stocker les exercices nous avons chercher un moyen simple, léger, efficace et portable. Les recherches on mené a éliminer les services de serveur de base de données relationnelles tels que *MySQL* et *PostgreSQL*, en effet ces technologie ne sont pas portable et complexe.  
Puis les données formaté tels que *[XML](https://fr.wikipedia.org/wiki/Extensible_Markup_Language)* et *[JSON](https://fr.wikipedia.org/wiki/JavaScript_Object_Notation)* ont été écarté pour des raisons de fiabilité et de simplicité.  

Nous avons donc choisi de travailler avec [**SQLite**](https://www.sqlite.org/index.html), en effet ce service permet de gérer un BDD de type *SQL<a href="#noteSQL7" id="noteSQL7ref"><sup>7</sup></a>* tout en restant portable et simple à mettre ne œuvre.

En effet SQLite ne demande pas la mise en place d'un serveur de BDD, les données sont stockées sur un seul fichier. C'est donc une solution portable que l'on retrouve dans beaucoup d'appareil et notamment dans l'OS Android.


<br>


####&emsp;&emsp;&emsp;&emsp;&emsp;<a id="chapBDDModels" href="#titreBDDModels"><span style="color:black">3.1.1 Les modèles de données</span></a>  

La technologie ayant été choisi il est temps de s'y mettre. La première étape est bien évidement la recherche d'informations. C'est ainsi qu'on a décidé d'appliqué un modèle de conception de base de donnée, le modèle *"[Merise](https://www.base-de-donnees.com/merise/)"*.

On retiendra donc que Merise permet de :

- décrire les données grâce au MCD<a href="#noteMCD3" id="noteMCD3ref"><sup>3</sup></a> : quelles sont les relations et les dépendances entres les différents acteurs.  
- d'implémenter logiquement grâce au MLD<a href="#noteMLD5" id="noteMLD5ref"><sup>5</sup></a> du point précédent.  
- Proposer une construction concrète et utilisable du point précédent grâce au MPD<a href="#noteMPD4" id="noteMPD4ref"><sup>4</sup></a>

<br>

######&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="chapBDDMCD" href="#titreBDDMCD"><span style="color:grey">3.1.1.1 Le MCD</span></a>  

Le *MCD<a href="#noteMCD3" id="noteMCD3ref"><sup>3</sup></a>* est constitué des éléments suivants:

- Les entités (1 rectangle = 1 objet)
- Les propriétés (la liste des données de l’entité)
- Les relations qui expliquent et précisent comment les entités sont reliées entre elles (les ovales)
- Les cardinalités (les petits chiffres au dessus des "pattes")


<center>
  <figure>
    <img src="https://i.imgur.com/cfuxpd1.png"
    width="1000"
    >
    <figcaption>*Figure 2: Modèle Conceptuel de Donnée a faire*</figcaption>
  </figure>
</center>
<br>

######&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="chapBDDMPD" href="#titreBDDMPD"><span style="color:grey">3.1.1.2 Le MPD</span></a>

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
    <figcaption>*Figure 3: Modèle Physique de Donnée à faire*</figcaption>
  </figure>
</center>  



<br>

######&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="chapBDDMLD" href="#titreBDDMLD"><span style="color:grey">3.1.1.3 Le MLD</span></a>

On représente ainsi les données issues de la modélisation Merise sous la forme suivante :

- Chaque ligne représente une table
- C’est toujours le nom de la table qui est écrit en premier
- Les champs sont listés entre parenthèses et séparés par des virgules
- Les clés primaires sont soulignées et placées au début de la liste des champs
- Les clés étrangères sont préfixées par un dièse

Cette étape ne porte pas d'intérêt dans le cadre de notre projet, elle a donc été sautée.

<br>

***
####&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="chapBDDscript" href="#titreBDDscript"><span style="color:black">3.1.2 Le Script</span></a>

Une fois les modèles conceptuels et physiques crées, il reste a créer le script de création de la base de données modélisée. Pour ceci nous allons devoir nous pencher sur le langage SQL<a href="#noteSQL7" id="noteSQL7ref"><sup>7</sup></a>.  

Chaque [SGBD](https://fr.wikipedia.org/wiki/Syst%C3%A8me_de_gestion_de_base_de_donn%C3%A9es) (Système de Gestion de Base de Données) possède ses propres spécificités et caractéristiques. Nous allons devoir donc créer un script SQL respectant les notations et caractéristiques de SQlite.

On se retrouve donc avec le script suivant:  


<pre>
  <span style='color:#7f0055; font-weight:bold; '>DROP</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Entrainement"</span> ;
  <span style='color:#7f0055; font-weight:bold; '>CREATE</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> NOT <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Entrainement"</span> (
    <span style='color:#2a00ff; '>"id"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span> NOT NULL <span style='color:#7f0055; font-weight:bold; '>PRIMARY</span> <span style='color:#7f0055; font-weight:bold; '>KEY</span> AUTOINCREMENT,
    <span style='color:#2a00ff; '>"nom"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>,
    <span style='color:#2a00ff; '>"date"</span> <span style='color:#7f0055; font-weight:bold; '>NUMERIC</span>,
    <span style='color:#2a00ff; '>"lieu"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>,
    <span style='color:#2a00ff; '>"commentaire"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>
  );

  <span style='color:#3f7f59; '>/*Creation de la Table Exercice*/</span>
  <span style='color:#7f0055; font-weight:bold; '>DROP</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Exercice"</span> ;
  <span style='color:#7f0055; font-weight:bold; '>CREATE</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> NOT <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Exercice"</span> (
    <span style='color:#2a00ff; '>"id"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span> NOT NULL <span style='color:#7f0055; font-weight:bold; '>PRIMARY</span> <span style='color:#7f0055; font-weight:bold; '>KEY</span> AUTOINCREMENT,
    <span style='color:#2a00ff; '>"nom"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>,
    <span style='color:#2a00ff; '>"type"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>,
    <span style='color:#2a00ff; '>"cashin"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>,
    <span style='color:#2a00ff; '>"temps"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"evolution_reps"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>,
    <span style='color:#2a00ff; '>"nombre_tours"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"time_cap"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"durée_intervalle"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"plusieur_mvt_par_intervalle"</span> <span style='color:#7f0055; font-weight:bold; '>NUMERIC</span>,
    <span style='color:#2a00ff; '>"mouvement_alterné"</span> <span style='color:#7f0055; font-weight:bold; '>NUMERIC</span>,
    <span style='color:#2a00ff; '>"temps_travail"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"temps_repos"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"cash-out"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>
  );

  <span style='color:#3f7f59; '>/*Creation de la Table Mouvement*/</span>
  <span style='color:#7f0055; font-weight:bold; '>DROP</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Mouvement"</span> ;
  <span style='color:#7f0055; font-weight:bold; '>CREATE</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> NOT <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Mouvement"</span> (
    <span style='color:#2a00ff; '>"id"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span> NOT NULL <span style='color:#7f0055; font-weight:bold; '>PRIMARY</span> <span style='color:#7f0055; font-weight:bold; '>KEY</span> AUTOINCREMENT,
    <span style='color:#2a00ff; '>"nom"</span> <span style='color:#7f0055; font-weight:bold; '>TEXT</span>,
    <span style='color:#2a00ff; '>"nbr_reps"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"poids"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"distance"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>,
    <span style='color:#2a00ff; '>"hauteur"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>
    <span style='color:#2a00ff; '>"temps"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span>
  );

  <span style='color:#3f7f59; '>/*Creation de la Table Constitue*/</span>
  <span style='color:#7f0055; font-weight:bold; '>DROP</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Constitue"</span> ;
  <span style='color:#7f0055; font-weight:bold; '>CREATE</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> NOT <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Constitue"</span> (
    <span style='color:#2a00ff; '>"ExerciceId"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span> NOT NULL,
    <span style='color:#2a00ff; '>"EntrainementId"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span> NOT NULL,

    <span style='color:#7f0055; font-weight:bold; '>FOREIGN</span> <span style='color:#7f0055; font-weight:bold; '>KEY</span>(<span style='color:#2a00ff; '>"ExerciceId"</span>)
      <span style='color:#7f0055; font-weight:bold; '>REFERENCES</span> <span style='color:#2a00ff; '>"Exercice"</span>(<span style='color:#2a00ff; '>"id"</span>) 
        <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#7f0055; font-weight:bold; '>DELETE</span> <span style='color:#7f0055; font-weight:bold; '>CASCADE</span> 
        <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#7f0055; font-weight:bold; '>UPDATE</span> <span style='color:#7f0055; font-weight:bold; '>NO</span> <span style='color:#7f0055; font-weight:bold; '>ACTION</span>,

    <span style='color:#7f0055; font-weight:bold; '>FOREIGN</span> <span style='color:#7f0055; font-weight:bold; '>KEY</span>(<span style='color:#2a00ff; '>"EntrainementId"</span>)
      <span style='color:#7f0055; font-weight:bold; '>REFERENCES</span> <span style='color:#2a00ff; '>"Entrainement"</span>(<span style='color:#2a00ff; '>"id"</span>) 
        <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#7f0055; font-weight:bold; '>DELETE</span> <span style='color:#7f0055; font-weight:bold; '>CASCADE</span> 
        <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#7f0055; font-weight:bold; '>UPDATE</span> <span style='color:#7f0055; font-weight:bold; '>NO</span> <span style='color:#7f0055; font-weight:bold; '>ACTION</span>
  );

  <span style='color:#7f0055; font-weight:bold; '>CREATE</span> <span style='color:#7f0055; font-weight:bold; '>UNIQUE</span> <span style='color:#7f0055; font-weight:bold; '>INDEX</span> <span style='color:#2a00ff; '>"iConstitue"</span> <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#2a00ff; '>"Constitue"</span> (
    <span style='color:#2a00ff; '>"ExerciceId"</span>,
    <span style='color:#2a00ff; '>"EntrainementId"</span>
  );

  <span style='color:#3f7f59; '>/*Creation de la Table Fait*/</span>
  <span style='color:#7f0055; font-weight:bold; '>DROP</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Fait"</span> ;
  <span style='color:#7f0055; font-weight:bold; '>CREATE</span> <span style='color:#7f0055; font-weight:bold; '>TABLE</span> <span style='color:#7f0055; font-weight:bold; '>IF</span> NOT <span style='color:#7f0055; font-weight:bold; '>EXISTS</span> <span style='color:#2a00ff; '>"Fait"</span> (
    <span style='color:#2a00ff; '>"MouvementId"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span> NOT NULL,
    <span style='color:#2a00ff; '>"ExerciceId"</span> <span style='color:#7f0055; font-weight:bold; '>INTEGER</span> NOT NULL,

    <span style='color:#7f0055; font-weight:bold; '>FOREIGN</span> <span style='color:#7f0055; font-weight:bold; '>KEY</span>(<span style='color:#2a00ff; '>"MouvementId"</span>)
      <span style='color:#7f0055; font-weight:bold; '>REFERENCES</span> <span style='color:#2a00ff; '>"Mouvement"</span>(<span style='color:#2a00ff; '>"id"</span>) 
        <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#7f0055; font-weight:bold; '>DELETE</span> <span style='color:#7f0055; font-weight:bold; '>CASCADE</span> 
        <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#7f0055; font-weight:bold; '>UPDATE</span> <span style='color:#7f0055; font-weight:bold; '>NO</span> <span style='color:#7f0055; font-weight:bold; '>ACTION</span>,

    <span style='color:#7f0055; font-weight:bold; '>FOREIGN</span> <span style='color:#7f0055; font-weight:bold; '>KEY</span>(<span style='color:#2a00ff; '>"ExerciceId"</span>)
      <span style='color:#7f0055; font-weight:bold; '>REFERENCES</span> <span style='color:#2a00ff; '>"Exercice"</span>(<span style='color:#2a00ff; '>"id"</span>) 
        <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#7f0055; font-weight:bold; '>DELETE</span> <span style='color:#7f0055; font-weight:bold; '>CASCADE</span> 
        <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#7f0055; font-weight:bold; '>UPDATE</span> <span style='color:#7f0055; font-weight:bold; '>NO</span> <span style='color:#7f0055; font-weight:bold; '>ACTION</span>
  );

  <span style='color:#7f0055; font-weight:bold; '>CREATE</span> <span style='color:#7f0055; font-weight:bold; '>UNIQUE</span> <span style='color:#7f0055; font-weight:bold; '>INDEX</span> <span style='color:#2a00ff; '>"iFait"</span> <span style='color:#7f0055; font-weight:bold; '>ON</span> <span style='color:#2a00ff; '>"Fait"</span> (
    <span style='color:#2a00ff; '>"MouvementId"</span>,
    <span style='color:#2a00ff; '>"ExerciceId"</span> 
  );
</pre>


Il faut chercher si on ajoute des unique quelque part ou si ça sert a rien.

Nous avons donc ajouter des UNIQUE et des INDEX<a href="#noteINDEX8" id="noteINDEX8ref"><sup>8</sup></a>.

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






<br>

***
####&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="chapBDDremplir" href="#titreBDDremplir"><span style="color:black">3.1.3 Remplir la base de donnée</span></a>

Une fois la base de données crée il faut y rentrer les données en question. Pour cela nous allons devoir créer un autre script SQL. Mais avant de commencer a coder nous pouvons nous pencher sur l'**<a href="#chapEXPBDD"><span style="color:black"><ins>annexe 1</ins></span></a>**.  

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

**Je me demande a ce stade si la séparation d'un mouvement en une multitude d'éléments était une bonne idée. Finalement ça n'apporte pas grand chose et ça complexifie énormément le code a réaliser ainsi que la base de donnée a réaliser.**










<br>
<br>

***
###<a id="chapLiens" href="#titreLiens"><span style="color:black">W. Liens utiles</span></a>

**TESTS**:

- Outil de requête en ligne: [sqliteonline.com](https://sqliteonline.com/)
- Outil de requête en ligne: [dbdiagram.io](https://dbdiagram.io/home)

**BDD**:

- Vocabulaire et méthodologie : [base-de-donnees.com](https://www.base-de-donnees.com/)
- Vocabulaire et technologies : [wikipedia.org](https://fr.wikipedia.org/wiki/Base_de_donn%C3%A9es_relationnelle)
- Sqlite : [sqlite.org](https://www.sqlite.org/index.html)
- Cours, Technologie, Tutoriels : [sqlitetutorial.net](https://www.sqlitetutorial.net/)


**Outils et Logiciels**:

- Diagrammes et dessins[draw.io](https://app.diagrams.net/)  
- Modélisation de la BDD [AnalyseSI](https://launchpad.net/analysesi)  
- Coloration syntaxique : [tohtml.com](https://tohtml.com/mysql/)
- Visualisation et gestion de BDD : [DB Browser](https://sqlitebrowser.org/)




<br>
<br>

***
####<a id="chapGlossaire" href="#titreGlossaire"><span style="color:black">X. Glossaire</span></a>


<a id="noteAPI6" href="#noteAPI6ref">*API*</a> : Une [Interface de Programmation d’Application](https://fr.wikipedia.org/wiki/Interface_de_programmation) est un ensemble normalisé de classes, de méthodes, de fonctions et de constantes qui sert de façade par laquelle un logiciel offre des services à d'autres logiciels  

<a id="noteBenchmark2" href="#noteBenchmark2ref">*Benchmark*</a> : ou *Girls*, WODS de référence pour évaluer les progrès.  


<a id="noteINDEX8" href="#noteINDEX8ref">*Index*</a> : Un [index](https://www.base-de-donnees.com/index/) est un outil de performance et un raccourci qui permet d’accéder plus rapidement aux données. 


<a id="noteMCD3" href="#noteMCD3ref">*MCD*</a> : Le Modèle Conceptuel de Donnée est une représentation graphique de haut niveau qui permet facilement et simplement de comprendre comment les différents éléments sont liés entre eux à l’aide de diagrammes codifiés.  


<a id="noteMLD5" href="#noteMLD5ref">*MLD*</a> : Le Modèle Logique des Données est simplement la représentation textuelle du MPD. Il s’agit juste de la représentation en ligne du schéma représentant la structure de la base de données. Il n’y a pas de travail poussé à réaliser à cette étape, il s’agit juste d’appliquer quelques règles toutes simples. **Cette étape est parfois omise.**  


<a id="noteMPD4" href="#noteMPD4ref">*MPD*</a> : Le Modèle Physique de Donnée permet de faire évoluer sa modélisation de haut niveau pour la transformer en un schéma plus proche des contraintes des logiciels de bases de données.  



<a id="noteSQL7" href="#noteSQL7ref">*SQL*</a> : [Structured Query Language](https://fr.wikipedia.org/wiki/Structured_Query_Language) est un langage informatique normalisé servant à exploiter des bases de données relationnelles.  

<a id="noteWOD1" href="#noteWOD1ref">*WOD*</a> : Workout Of the Day.  


<br>
<br>

***
####<a id="chapAnnexes" href="#titreAnnexes"><span style="color:black">Y. Annexes</span></a>

####&emsp;&emsp;&emsp;<a id="chapEXPBDD" href="#titreEXPBDD"><span style="color:black">Y.1 Expérimentations en base de données</span></a>  

En utilisant une base de données bien plus simple (figure Y.1.5) pour faire des tests j'ai pu me rendre compte de certain problèmes dans notre base (qui seront réglés plus tard).  
Ça m'a aussi permis de comprendre plusieurs choses expliquées dans la suite.

<center>
  <figure>
    <img src="https://i.imgur.com/yidJKKM.png"
    width="800"
    >
    <figcaption>*Figure Y.1.5: Base de données de cuisine*</figcaption>
  </figure>
</center>  

Pour créer cette base de données il faut le script suivant:



<pre>
  <span style="color:#800000; font-weight:bold; ">DROP</span> <span style="color:#800000; font-weight:bold; ">TABLE</span> <span style="color:#800000; font-weight:bold; ">IF</span> <span style="color:#800000; font-weight:bold; ">EXISTS</span> <span style="color:#800000; ">"Ingredient"</span> <span style="color:#808030; ">;</span>
  <span style="color:#800000; font-weight:bold; ">CREATE</span> <span style="color:#800000; font-weight:bold; ">TABLE</span> <span style="color:#800000; font-weight:bold; ">IF</span> <span style="color:#800000; font-weight:bold; ">NOT</span> <span style="color:#800000; font-weight:bold; ">EXISTS</span> <span style="color:#800000; ">"Ingredient"</span> <span style="color:#808030; ">(</span>
    <span style="color:#800000; ">"id"</span> <span style="color:#800000; font-weight:bold; ">INTEGER</span> <span style="color:#800000; font-weight:bold; ">NOT</span> <span style="color:#800000; font-weight:bold; ">NULL</span> <span style="color:#800000; font-weight:bold; ">PRIMARY</span> <span style="color:#800000; font-weight:bold; ">KEY</span> AUTOINCREMENT<span style="color:#808030; ">,</span>
    <span style="color:#800000; ">"Nom_Ingredient"</span> TEXT <span style="color:#800000; font-weight:bold; ">UNIQUE</span>
  <span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">DROP</span> <span style="color:#800000; font-weight:bold; ">TABLE</span> <span style="color:#800000; font-weight:bold; ">IF</span> <span style="color:#800000; font-weight:bold; ">EXISTS</span> <span style="color:#800000; ">"Recette"</span><span style="color:#808030; ">;</span>
  <span style="color:#800000; font-weight:bold; ">CREATE</span> <span style="color:#800000; font-weight:bold; ">TABLE</span> <span style="color:#800000; font-weight:bold; ">IF</span> <span style="color:#800000; font-weight:bold; ">NOT</span> <span style="color:#800000; font-weight:bold; ">EXISTS</span> <span style="color:#800000; ">"Recette"</span> <span style="color:#808030; ">(</span>
    <span style="color:#800000; ">"id"</span> <span style="color:#800000; font-weight:bold; ">INTEGER</span> <span style="color:#800000; font-weight:bold; ">NOT</span> <span style="color:#800000; font-weight:bold; ">NULL</span> <span style="color:#800000; font-weight:bold; ">PRIMARY</span> <span style="color:#800000; font-weight:bold; ">KEY</span> AUTOINCREMENT<span style="color:#808030; ">,</span>
    <span style="color:#800000; ">"Nom_Recette"</span> TEXT <span style="color:#800000; font-weight:bold; ">UNIQUE</span>
  <span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">DROP</span> <span style="color:#800000; font-weight:bold; ">TABLE</span> <span style="color:#800000; font-weight:bold; ">IF</span> <span style="color:#800000; font-weight:bold; ">EXISTS</span> <span style="color:#800000; ">"Constitue"</span><span style="color:#808030; ">;</span>
  <span style="color:#800000; font-weight:bold; ">CREATE</span> <span style="color:#800000; font-weight:bold; ">TABLE</span> <span style="color:#800000; font-weight:bold; ">IF</span> <span style="color:#800000; font-weight:bold; ">NOT</span> <span style="color:#800000; font-weight:bold; ">EXISTS</span> <span style="color:#800000; ">"Constitue"</span> <span style="color:#808030; ">(</span>
    <span style="color:#800000; ">"Recette_id"</span> <span style="color:#800000; font-weight:bold; ">INTEGER</span> <span style="color:#800000; font-weight:bold; ">NOT</span> <span style="color:#800000; font-weight:bold; ">NULL</span><span style="color:#808030; ">,</span>
    <span style="color:#800000; ">"Ingredient_id"</span>  <span style="color:#800000; font-weight:bold; ">INTEGER</span> <span style="color:#800000; font-weight:bold; ">NOT</span> <span style="color:#800000; font-weight:bold; ">NULL</span><span style="color:#808030; ">,</span>
    <span style="color:#800000; font-weight:bold; ">FOREIGN</span> <span style="color:#800000; font-weight:bold; ">KEY</span> <span style="color:#808030; ">(</span>Recette_id<span style="color:#808030; ">)</span>
      <span style="color:#800000; font-weight:bold; ">REFERENCES</span> Recette <span style="color:#808030; ">(</span><span style="color:#800000; font-weight:bold; ">id</span><span style="color:#808030; ">)</span>
        <span style="color:#800000; font-weight:bold; ">ON</span> <span style="color:#800000; font-weight:bold; ">DELETE</span> <span style="color:#800000; font-weight:bold; ">CASCADE</span>
        <span style="color:#800000; font-weight:bold; ">ON</span> <span style="color:#800000; font-weight:bold; ">UPDATE</span> <span style="color:#800000; font-weight:bold; ">NO</span> <span style="color:#800000; font-weight:bold; ">ACTION</span><span style="color:#808030; ">,</span>
        
    <span style="color:#800000; font-weight:bold; ">FOREIGN</span> <span style="color:#800000; font-weight:bold; ">KEY</span> <span style="color:#808030; ">(</span>Ingredient_id<span style="color:#808030; ">)</span>
      <span style="color:#800000; font-weight:bold; ">REFERENCES</span> Ingredient <span style="color:#808030; ">(</span><span style="color:#800000; font-weight:bold; ">id</span><span style="color:#808030; ">)</span>
        <span style="color:#800000; font-weight:bold; ">ON</span> <span style="color:#800000; font-weight:bold; ">DELETE</span> <span style="color:#800000; font-weight:bold; ">CASCADE</span>
        <span style="color:#800000; font-weight:bold; ">ON</span> <span style="color:#800000; font-weight:bold; ">UPDATE</span> <span style="color:#800000; font-weight:bold; ">NO</span> <span style="color:#800000; font-weight:bold; ">ACTION</span>
  <span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>
</pre>


On remarque déjà que nous avons omis la contrainte <code><span style='color:#800000; font-weight:bold; '>UNIQUE</span></code> pour certain attributs qui permettent d'éviter les doublons.

Ensuite nous avons simplement ajouter *a la main* des ingrédients avec le script suivant:


<pre>
  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Ingredient<span style="color:#808030; ">(</span>Nom_Ingredient<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#800000; ">"Oeuf"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Ingredient<span style="color:#808030; ">(</span>Nom_Ingredient<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#800000; ">"Farine"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Ingredient<span style="color:#808030; ">(</span>Nom_Ingredient<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#800000; ">"Beurre"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>
</pre>



Puis c'est le tour d'une recette:

<pre>
  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Recette<span style="color:#808030; ">(</span>Nom_Recette<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#800000; ">"Pâte a crêpes"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>
</pre>

A cette étape nous avons plusieurs ingrédients a notre disposition et une recette mais il n'y a aucun lien entre eux.

En effet le lien se fera via la table <code><span style='color:#800000; '>Constitue</span></code>. Cette table permet de stocker le lien entre un recette et des ingrédients. Pour créer ces liens entre recette et ingrédients nous avons donc besoin du script suivant:

<pre>
  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Constitue<span style="color:#808030; ">(</span>Recette_id<span style="color:#808030; ">,</span>Ingredient_id<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#008c00; ">1</span><span style="color:#808030; ">,</span><span style="color:#008c00; ">1</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Constitue<span style="color:#808030; ">(</span>Recette_id<span style="color:#808030; ">,</span>Ingredient_id<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#008c00; ">1</span><span style="color:#808030; ">,</span><span style="color:#008c00; ">2</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Constitue<span style="color:#808030; ">(</span>Recette_id<span style="color:#808030; ">,</span>Ingredient_id<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#008c00; ">1</span><span style="color:#808030; ">,</span><span style="color:#008c00; ">3</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>
</pre>



Via ce script on viens de faire le lien entre la recette portant l'id **1** et les ingrédients portant les ids **1**, **2** et **3**. On rappelle que les ids sont créés automatiquement et ne peuvent pas être modifié, ce qui renforce la sécurité de notre base de donnée tout en évitant encore les doublons.

Je concède que pour l'instant on ne voit pas bien le lien qu'on a créer. Pour le visualiser plus simplement on peut exécuter le script suivant:

<pre>
  <span style="color:#800000; font-weight:bold; ">SELECT</span> Nom_Recette<span style="color:#808030; ">,</span> Nom_Incrédient 
  <span style="color:#800000; font-weight:bold; ">FROM</span> Constitue
  <span style="color:#800000; font-weight:bold; ">JOIN</span> Recette
  <span style="color:#800000; font-weight:bold; ">ON</span> Constitue<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">Recette_id</span><span style="color:#808030; ">=</span>Recette<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">id</span>
  <span style="color:#800000; font-weight:bold; ">JOIN</span> Ingredient
  <span style="color:#800000; font-weight:bold; ">ON</span> Constitue<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">Ingredient_id</span><span style="color:#808030; ">=</span>Ingredient<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">id</span><span style="color:#808030; ">;</span>
</pre>

Si on le décrypte on trouve:

1. On affiche les colonnes <code>Nom_Recette</code> et <code>Nom_Ingredient</code>  
2. Venant de la table <code>Constitue</code>  
3. On accole la table <code>Recette</code>  
4. Où la colonne <code>Constitue<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">Recette_id</span><span style="color:#808030; "></code> est égale à la colonne <code></span>Recette<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">id</span></code>  
5. On accole la table <code>Ingredient</code>  
6. Où la colonne <code>Constitue<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">Ingredient_id</span><span style="color:#808030; "></code> est égale à la colonne <code></span>Ingredient<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">id</span></code>  

Via les <span style="color:#800000; font-weight:bold; ">JOIN</span> on fait donc les liens entre des tables. Pour notre sujet il nous faudra donc littéralement moult <span style="color:#800000; font-weight:bold; ">JOIN</span>.

On remarque aussi qu'il faudrait rajouter un argument pour les Exercices dans un Entrainement. En effet de la manière dont la base a été faite il n'est pas possible de trier les exercices d'un entraînement.


On en déduit des scripts précédents que pour l'ajout d'une nouvelle recette nous pourrons enchaîner des <span style="color:#800000; font-weight:bold; ">INSERT</span> si la <span style="color:#800000; font-weight:bold; ">VALUES</span> n'existe pas encore dans la table.

Tentons d'écrire un seul script qui puisse nous permettre :

- D'ajouter une recette du nom de *"Gâteau a la vanille"*  
- Créer les <span style="color:#800000; font-weight:bold; ">VALUES</span> nécessaires **SI ELLE N'EXISTENT PAS**  
- Créer les liens entre la recette et les ingrédients dans la Table `constitue`  
On prendra en recette de ce gâteau uniquement de l’œuf et de la vanille.


<pre>
  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Ingredient<span style="color:#808030; ">(</span>Nom_Ingredient<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#800000; ">"Oeuf"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Ingredient<span style="color:#808030; ">(</span>Nom_Ingredient<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#800000; ">"Vanille"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Recette<span style="color:#808030; ">(</span>Nom_Recette<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span> <span style="color:#808030; ">(</span><span style="color:#800000; ">"Gâteau à la Vanille"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Constitue<span style="color:#808030; ">(</span>Recette_id<span style="color:#808030; ">,</span> Ingredient_id<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span><span style="color:#808030; ">(</span>
    <span style="color:#808030; ">(</span><span style="color:#800000; font-weight:bold; ">SELECT</span> Recette<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">id</span> <span style="color:#800000; font-weight:bold; ">FROM</span> Recette <span style="color:#800000; font-weight:bold; ">WHERE</span> Recette<span style="color:#808030; ">.</span>Nom_Recette <span style="color:#800000; font-weight:bold; ">LIKE</span> <span style="color:#800000; ">"Gâteau à la Vanille"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">,</span>
    <span style="color:#808030; ">(</span><span style="color:#800000; font-weight:bold; ">SELECT</span> <span style="color:#800000; font-weight:bold; ">id</span> <span style="color:#800000; font-weight:bold; ">FROM</span> Ingredient <span style="color:#800000; font-weight:bold; ">WHERE</span> Ingredient<span style="color:#808030; ">.</span>Nom_Ingredient <span style="color:#800000; font-weight:bold; ">LIKE</span> <span style="color:#800000; ">"Oeuf"</span><span style="color:#808030; ">)</span>
  <span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>

  <span style="color:#800000; font-weight:bold; ">INSERT</span> <span style="color:#800000; font-weight:bold; ">OR</span> IGNORE <span style="color:#800000; font-weight:bold; ">INTO</span> Constitue<span style="color:#808030; ">(</span>Recette_id<span style="color:#808030; ">,</span> Ingredient_id<span style="color:#808030; ">)</span>
  <span style="color:#800000; font-weight:bold; ">VALUES</span><span style="color:#808030; ">(</span>
    <span style="color:#808030; ">(</span><span style="color:#800000; font-weight:bold; ">SELECT</span> Recette<span style="color:#808030; ">.</span><span style="color:#800000; font-weight:bold; ">id</span> <span style="color:#800000; font-weight:bold; ">FROM</span> Recette <span style="color:#800000; font-weight:bold; ">WHERE</span> Recette<span style="color:#808030; ">.</span>Nom_Recette <span style="color:#800000; font-weight:bold; ">LIKE</span> <span style="color:#800000; ">"Gâteau à la Vanille"</span><span style="color:#808030; ">)</span><span style="color:#808030; ">,</span>
    <span style="color:#808030; ">(</span><span style="color:#800000; font-weight:bold; ">SELECT</span> <span style="color:#800000; font-weight:bold; ">id</span> <span style="color:#800000; font-weight:bold; ">FROM</span> Ingredient <span style="color:#800000; font-weight:bold; ">WHERE</span> Ingredient<span style="color:#808030; ">.</span>Nom_Ingredient <span style="color:#800000; font-weight:bold; ">LIKE</span> <span style="color:#800000; ">"Vanille"</span><span style="color:#808030; ">)</span>
  <span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>
</pre>

Or on remarque bien qu'il est possible d’exécuter plusieurs fois ce script et on obtient une multitude d'enregistrement identique. Il faudra donc créer un index qui permettra d'ignorer l'ajout si la ligne existe déjà:


<pre>
  <span style="color:#800000; font-weight:bold; ">CREATE</span> <span style="color:#800000; font-weight:bold; ">UNIQUE</span> <span style="color:#800000; font-weight:bold; ">INDEX</span> <span style="color:#800000; ">"DoubleConstitue"</span> <span style="color:#800000; font-weight:bold; ">ON</span> <span style="color:#800000; ">"Constitue"</span> <span style="color:#808030; ">(</span>
    <span style="color:#800000; ">"Recette_id"</span><span style="color:#808030; ">,</span>
    <span style="color:#800000; ">"Ingredient_id"</span>
  <span style="color:#808030; ">)</span><span style="color:#808030; ">;</span>
</pre>


***