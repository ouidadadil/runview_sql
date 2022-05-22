-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: COMPTABILITE
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cpt_ecriture`
--

DROP TABLE IF EXISTS `cpt_ecriture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpt_ecriture` (
  `id_ecriture` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` text,
  PRIMARY KEY (`id_ecriture`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpt_ecriture`
--

LOCK TABLES `cpt_ecriture` WRITE;
/*!40000 ALTER TABLE `cpt_ecriture` DISABLE KEYS */;
INSERT INTO `cpt_ecriture` VALUES (1,'ecriture 1'),(2,'ecriture 2'),(3,'ecriture 3'),(5,'ecriture 5');
/*!40000 ALTER TABLE `cpt_ecriture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpt_forunisseur`
--

DROP TABLE IF EXISTS `cpt_forunisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpt_forunisseur` (
  `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` text NOT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpt_forunisseur`
--

LOCK TABLES `cpt_forunisseur` WRITE;
/*!40000 ALTER TABLE `cpt_forunisseur` DISABLE KEYS */;
INSERT INTO `cpt_forunisseur` VALUES (1,'fournisseur 1'),(2,'fournisseur 2'),(3,'fournisseur 3');
/*!40000 ALTER TABLE `cpt_forunisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpt_mouvement`
--

DROP TABLE IF EXISTS `cpt_mouvement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpt_mouvement` (
  `montant_signe` bigint(20) NOT NULL,
  `fk_id_ecriture` int(11) NOT NULL,
  `fk_id_plan_comptable` int(11) NOT NULL,
  `fk_id_fournisseur` int(11) DEFAULT NULL,
  KEY `cpt_mouvement_ecriture_fk` (`fk_id_ecriture`),
  KEY `cpt_mouvement_plan_comptable_fk` (`fk_id_plan_comptable`),
  KEY `cpt_mouvement_fournisseur_fk` (`fk_id_fournisseur`),
  CONSTRAINT `cpt_mouvement_ecriture_fk` FOREIGN KEY (`fk_id_ecriture`) REFERENCES `cpt_ecriture` (`id_ecriture`),
  CONSTRAINT `cpt_mouvement_fournisseur_fk` FOREIGN KEY (`fk_id_fournisseur`) REFERENCES `cpt_forunisseur` (`id_fournisseur`),
  CONSTRAINT `cpt_mouvement_plan_comptable_fk` FOREIGN KEY (`fk_id_plan_comptable`) REFERENCES `cpt_plan_comptable` (`id_plan_comptable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpt_mouvement`
--

LOCK TABLES `cpt_mouvement` WRITE;
/*!40000 ALTER TABLE `cpt_mouvement` DISABLE KEYS */;
INSERT INTO `cpt_mouvement` VALUES (200,1,1,1),(100,2,2,2),(100,2,3,3),(-200,1,1,1),(200,3,4,NULL),(300,5,1,1);
/*!40000 ALTER TABLE `cpt_mouvement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpt_plan_comptable`
--

DROP TABLE IF EXISTS `cpt_plan_comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpt_plan_comptable` (
  `id_plan_comptable` int(11) NOT NULL AUTO_INCREMENT,
  `numero_plan_comptable` int(11) NOT NULL,
  `libelle` text,
  PRIMARY KEY (`id_plan_comptable`),
  KEY `cpt_plan_comptable_numero_plan_comptable_index` (`numero_plan_comptable`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpt_plan_comptable`
--

LOCK TABLES `cpt_plan_comptable` WRITE;
/*!40000 ALTER TABLE `cpt_plan_comptable` DISABLE KEYS */;
INSERT INTO `cpt_plan_comptable` VALUES (1,404000,'Plan comptable fournsseur'),(2,404100,'Sous Plan comptable fournsseur - 100'),(3,404200,'Sous Plan comptable fournsseur - 200'),(4,500000,'Plan comptable 500000');
/*!40000 ALTER TABLE `cpt_plan_comptable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-22 11:37:46
