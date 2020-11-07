/*Creation de la Table Entrainement*/
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
