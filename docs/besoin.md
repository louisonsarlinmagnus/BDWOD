# Analyse du besoin

Dans cette partie on se questionnera sur les fonctionnalité voulue et le fonctionnement global.  

## Enoncé des conditions

Faire une base de donnée d'entrainement de sport (Entrainement)  
Un entrainement peut avoir un lieu  
Un entrainement a une date  
Un entrainement peut être localisé  
Un entrainement est constitué d'au moins un exercice (Exercice)  
Un exercice peut avoir un nom  
Un exercice peut être un échauffement  
Un exercice peut être un Benchmark  
Un exercice a un Type (Type)  
etc.


## Décomposition
Un **entraînement**:

- Un nom (optionnel)
- Une date
- Un lieu (optionnel)
- Un échauffement
- Un exercice

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