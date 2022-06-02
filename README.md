# PARTIE SQL

Le projet comporte deux scripts :
* init_database.sql pour l'intialisation de la base mysql :  Le script contient les commandes pour la création des tables, indexe (numero_plan_comptable) sur le champ numero_plan, primary keys, foreign keys, autoincrements + données
* requetes.sql contient trois requetes pour la récupération des :
    * Ecritures non équilibrées 
    * Ecritures dont la plan comptable commence par 404
    * Ecritures dont tous les mouvements sont liés au même numéro de compte
