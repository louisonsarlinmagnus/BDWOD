# La base de données JSON

Dans la continuité de l'analyse précédente je propose une architecture *[JSON](https://fr.wikipedia.org/wiki/JavaScript_Object_Notation)*. Ce format pourrait être utiliser pour envoyer les données vers l'application dans l'éventualité d'un serveur distant.

```json
{
  "Entrainement" : {
    "nom" : "" ,
    "date" : "" ,
    "lieu" : "" ,
    "commentaire" : "",
    "Exercice" : 
    [
      {
        "nom" : "" ,
        "type" : "",
        "cash-in" : "" ,
        "temps" : 0 ,
        "evolution_reps" : "" ,
        "nombre_tours" : 1 ,
        "time_cap" : 900 ,
        "durée_intervalle" : 1 ,
        "plusieur_mvt_par_intervalle" : false ,
        "mouvement_alterné" : true ,
        "temps_travail" : 20,
        "temps_repos" : 10,
        "cash-out" : "",
        "mouvement" : 
        [
          {
            "nom" : "" ,
            "nbr_reps" : 1 ,
            "poids" : 0 ,
            "distance" : 0 ,
            "hauteur" : 0,
            "temps" : 0 ,
          },
        ],
      },
    ],
  },
}
```

On voit plus précisément le modèle qu'adoptera la donnée. Évidement les attributs seront utilisable sous certaines conditions par exemple l'attribut `"temps_travail"` sera disponible uniquement pour un exercice de type "Tabata".