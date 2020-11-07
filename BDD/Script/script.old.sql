 /*Creation de la Table Entrainement*/
DROP TABLE IF EXISTS "Entrainement" ;
CREATE TABLE IF NOT EXISTS "Entrainement" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Lieu_Entrainement"	TEXT,
	"Date_Entrainement"	NUMERIC,
	"Commentaire_Entrainement"	TEXT
);

/*Creation de la Table TagEntrainement*/
DROP TABLE IF EXISTS "TagEntrainement" ;
CREATE TABLE IF NOT EXISTS "TagEntrainement" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Nom"	TEXT
);

/*Creation de la Table Warmup*/
DROP TABLE IF EXISTS "Warmup" ;
CREATE TABLE IF NOT EXISTS "Warmup" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Nom"	TEXT
);

/*Creation de la Table Mouvement*/
DROP TABLE IF EXISTS "Mouvement" ;
CREATE TABLE IF NOT EXISTS "Mouvement" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Nom"	TEXT,
	"Argument"	TEXT
);

/*Creation de la Table Question*/
DROP TABLE IF EXISTS "Question" ;
CREATE TABLE IF NOT EXISTS "Question" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Mouvement_id"	INTEGER NOT NULL,

	FOREIGN KEY("Mouvement_id") 
		REFERENCES "Mouvement"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);

/*Creation de la Table Repetition*/
DROP TABLE IF EXISTS "Repetition" ;
CREATE TABLE IF NOT EXISTS "Repetition" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Nombre"	INTEGER,
	"Argument"	TEXT
);

/*Creation de la Table TypeExercice*/
DROP TABLE IF EXISTS "TypeExercice" ;
CREATE TABLE IF NOT EXISTS "TypeExercice" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Nom"	TEXT
);

/*Creation de la Table Exercice*/
DROP TABLE IF EXISTS "Exercice" ;
CREATE TABLE IF NOT EXISTS "Exercice" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Nom"	TEXT,
	"TypeExercice_id"	INTEGER NOT NULL,

	FOREIGN KEY("TypeExercice_id")
		REFERENCES "TypeExercice"("id")
			ON DELETE CASCADE
			ON UPDATE NO ACTION
);

/*Creation de la Table TagExercice*/
DROP TABLE IF EXISTS "TagExercice" ;
CREATE TABLE IF NOT EXISTS "TagExercice" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Nom"	TEXT
);

/*Creation de la Table ArgumentExercice*/
DROP TABLE IF EXISTS "ArgumentExercice" ;
CREATE TABLE IF NOT EXISTS "ArgumentExercice" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Nom"	TEXT
);

/*Creation de la Table TagEntrainementIdentifieEntrainement*/
DROP TABLE IF EXISTS "TagEntrainementIdentifieEntrainement" ;
CREATE TABLE IF NOT EXISTS "TagEntrainementIdentifieEntrainement" (
	"Entrainement_id"	INTEGER NOT NULL,
	"TagEntrainement_id"	INTEGER NOT NULL,

	FOREIGN KEY("Entrainement_id")
		REFERENCES "Entrainement"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION,

	FOREIGN KEY("TagEntrainement_id")
		REFERENCES "TagEntrainement"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX IF NOT EXISTS "i_Identifie" ON "TagEntrainementIdentifieEntrainement" (
	"Entrainement_id",
	"TagEntrainement_id"
);

/*Creation de la Table WarmupPrepareEntrainement*/
DROP TABLE IF EXISTS "WarmupPrepareEntrainement" ;
CREATE TABLE IF NOT EXISTS "WarmupPrepareEntrainement" (
	"Entrainement_id"	INTEGER NOT NULL,
	"Warmup_id"	INTEGER NOT NULL,

	FOREIGN KEY("Entrainement_id")
		REFERENCES "Entrainement"("id")
			ON DELETE CASCADE 
			ON UPDATE NO ACTION,

	FOREIGN KEY("Warmup_id")
		REFERENCES "Warmup"("id")
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX IF NOT EXISTS "i_Prepare" ON "WarmupPrepareEntrainement" (
	"Entrainement_id",
	"Warmup_id"
);


/*Creation de la Table QuestionConstitueWarmup*/
DROP TABLE IF EXISTS "QuestionConstitueWarmup" ;
CREATE TABLE IF NOT EXISTS "QuestionConstitueWarmup" (
	"Warmup_id"	INTEGER NOT NULL,
	"Question_id"	INTEGER NOT NULL,

	FOREIGN KEY("Warmup_id")
		REFERENCES "Warmup"("id")
			ON DELETE CASCADE 
			ON UPDATE NO ACTION,

	FOREIGN KEY("Question_id")
		REFERENCES "Question"("id")
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX IF NOT EXISTS "i_Constitue" ON "QuestionConstitueWarmup" (
	"Warmup_id",
	"Question_id"
);


/*Creation de la Table RepetitionQuantifieQuestion*/
DROP TABLE IF EXISTS "RepetitionQuantifieQuestion" ;
CREATE TABLE IF NOT EXISTS "RepetitionQuantifieQuestion" (
	"Question_id"	INTEGER NOT NULL,
	"Repetition_id"	INTEGER NOT NULL,

	FOREIGN KEY("Question_id")
		REFERENCES "Question"("id")
			ON DELETE CASCADE 
			ON UPDATE NO ACTION,

	FOREIGN KEY("Repetition_id")
		REFERENCES "Repetition"("id")
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX IF NOT EXISTS "i_Quantifie" ON "RepetitionQuantifieQuestion" (
	"Question_id",
	"Repetition_id"
);

/*Creation de la Table QuestionFormeExercice*/
DROP TABLE IF EXISTS "QuestionFormeExercice" ;
CREATE TABLE IF NOT EXISTS "QuestionFormeExercice" (
	"Exercice_id"	INTEGER NOT NULL,
	"Question_id"	INTEGER NOT NULL,

	FOREIGN KEY("Question_id") 
		REFERENCES "Question"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION,
	FOREIGN KEY("Exercice_id") 
		REFERENCES "Exercice"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);


CREATE UNIQUE INDEX IF NOT EXISTS "i_Forme" ON "QuestionFormeExercice" (
	"Exercice_id",
	"Question_id"
);

/*Creation de la Table TagExerciceRepereExercice*/
DROP TABLE IF EXISTS "TagExerciceRepereExercice" ;
CREATE TABLE IF NOT EXISTS "TagExerciceRepereExercice" (
	"TagExercice_id"	INTEGER NOT NULL,
	"Exercice_id"	INTEGER NOT NULL,

	FOREIGN KEY("TagExercice_id") 
		REFERENCES "TagExercice"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION,
	FOREIGN KEY("Exercice_id") 
		REFERENCES "Exercice"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX IF NOT EXISTS "i_Repere" ON "TagExerciceRepereExercice" (
	"TagExercice_id",
	"Exercice_id"
);



/*Creation de la Table ArgumentExerciceDetailExercice*/
DROP TABLE IF EXISTS "ArgumentExerciceDetailExercice" ;
CREATE TABLE IF NOT EXISTS "ArgumentExerciceDetailExercice" (
	"ArgumentExercice_id"	INTEGER NOT NULL,
	"Exercice_id"	INTEGER NOT NULL,

	FOREIGN KEY("ArgumentExercice_id") 
		REFERENCES "ArgumentExercice"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION,
	FOREIGN KEY("Exercice_id") 
		REFERENCES "Exercice"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX IF NOT EXISTS "i_Detail" ON "ArgumentExerciceDetailExercice" (
	"ArgumentExercice_id",
	"Exercice_id"
);


/*Creation de la Table Fait*/
DROP TABLE IF EXISTS "ExerciceFaitEntrainement" ;
CREATE TABLE IF NOT EXISTS "ExerciceFaitEntrainement" (
	"Exercice_id"	INTEGER NOT NULL,
	"Entrainement_id"	INTEGER NOT NULL,

	FOREIGN KEY("Exercice_id") 
		REFERENCES "Exercice"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION,
	FOREIGN KEY("Entrainement_id") 
		REFERENCES "Entrainement"("id") 
			ON DELETE CASCADE 
			ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX "i_Fait" ON "ExerciceFaitEntrainement" (
	"Exercice_id",
	"Entrainement_id"
);