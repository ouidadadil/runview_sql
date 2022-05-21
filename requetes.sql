/*Ecritures non équilibrées*/
SELECT ec.id_ecriture, SUM(mvt.montant_signe) FROM cpt_ecriture ec
INNER JOIN cpt_mouvement mvt on ec.id_ecriture=mvt.fk_id_ecriture
GROUP BY ec.id_ecriture
HAVING SUM(mvt.montant_signe) > 0;

/*Ecritures dont la plan comptable commence par 404*/
SELECT DISTINCT ec.id_ecriture FROM cpt_ecriture ec
INNER JOIN cpt_mouvement mvt on ec.id_ecriture=mvt.fk_id_ecriture
WHERE exists (SELECT 'X' FROM cpt_plan_comptable plan WHERE plan.numero_plan_comptable like '404%' AND plan.id_plan_comptable=mvt.fk_id_plan_comptable);
