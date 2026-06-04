CREATE DATABASE  IF NOT EXISTS `animal_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `animal_db`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: animal_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goats`
--

DROP TABLE IF EXISTS `goats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goats` (
  `goat_id` int NOT NULL AUTO_INCREMENT,
  `tag_number` varchar(50) NOT NULL,
  `breed` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `birth_date` date DEFAULT NULL,
  `acquisition_date` date DEFAULT NULL,
  `weight_kg` decimal(6,2) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `purpose` enum('Meat','Milk','Breeding') DEFAULT 'Meat',
  `status` enum('Active','Sold','Dead','Sick') DEFAULT 'Active',
  `farmer_id` int DEFAULT NULL,
  PRIMARY KEY (`goat_id`),
  UNIQUE KEY `tag_number` (`tag_number`),
  KEY `farmer_id` (`farmer_id`),
  CONSTRAINT `goats_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`farmer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goats`
--

LOCK TABLES `goats` WRITE;
/*!40000 ALTER TABLE `goats` DISABLE KEYS */;
INSERT INTO `goats` VALUES (101,'GOAT-001','Boer','Male','2023-01-10','2023-06-01',32.50,'White','Meat','Active',1),(102,'GOAT-002','Saanen','Female','2023-02-12','2023-06-03',28.00,'White','Milk','Active',2),(103,'GOAT-003','WAD','Female','2023-03-05','2023-06-05',22.50,'Brown','Breeding','Active',3),(104,'GOAT-004','Kalahari','Male','2023-01-20','2023-06-07',35.00,'Red','Meat','Active',4),(105,'GOAT-005','Boer','Female','2023-04-11','2023-06-10',26.20,'White','Milk','Active',5),(106,'GOAT-006','WAD','Male','2023-02-14','2023-06-12',24.80,'Black','Meat','Active',6),(107,'GOAT-007','Saanen','Female','2023-03-18','2023-06-15',27.50,'White','Milk','Active',7),(108,'GOAT-008','Boer','Male','2023-01-25','2023-06-18',36.10,'White','Meat','Active',8),(109,'GOAT-009','WAD','Female','2023-04-02','2023-06-20',23.00,'Brown','Breeding','Active',9),(110,'GOAT-010','Kalahari','Female','2023-03-28','2023-06-22',25.70,'Red','Milk','Active',10),(111,'GOAT-011','Boer','Male','2023-02-01','2023-06-25',34.20,'White','Meat','Active',1),(112,'GOAT-012','Saanen','Female','2023-02-08','2023-06-27',29.10,'White','Milk','Active',2),(113,'GOAT-013','WAD','Male','2023-03-10','2023-06-28',25.30,'Black','Meat','Active',3),(114,'GOAT-014','Boer','Female','2023-01-30','2023-07-01',27.80,'White','Milk','Active',4),(115,'GOAT-015','Kalahari','Male','2023-02-20','2023-07-03',33.00,'Red','Meat','Active',5),(116,'GOAT-016','WAD','Female','2023-03-15','2023-07-05',21.90,'Brown','Breeding','Active',6),(117,'GOAT-017','Saanen','Female','2023-04-01','2023-07-07',28.60,'White','Milk','Active',7),(118,'GOAT-018','Boer','Male','2023-01-18','2023-07-09',37.40,'White','Meat','Active',8),(119,'GOAT-019','WAD','Female','2023-02-25','2023-07-10',22.70,'Black','Breeding','Active',9),(120,'GOAT-020','Kalahari','Female','2023-03-22','2023-07-12',26.30,'Red','Milk','Active',10),(121,'GOAT-021','Boer','Male','2023-02-10','2023-07-15',33.80,'White','Meat','Active',1),(122,'GOAT-022','Saanen','Female','2023-03-01','2023-07-18',28.90,'White','Milk','Active',2),(123,'GOAT-023','WAD','Male','2023-03-12','2023-07-20',24.50,'Brown','Meat','Active',3),(124,'GOAT-024','Kalahari','Female','2023-01-14','2023-07-22',26.10,'Red','Milk','Active',4),(125,'GOAT-025','Boer','Female','2023-02-28','2023-07-25',27.40,'White','Milk','Active',5),(126,'GOAT-026','WAD','Male','2023-03-18','2023-07-27',25.00,'Black','Meat','Active',6),(127,'GOAT-027','Saanen','Female','2023-04-05','2023-07-30',29.30,'White','Milk','Active',7),(128,'GOAT-028','Boer','Male','2023-01-22','2023-08-01',36.00,'White','Meat','Active',8),(129,'GOAT-029','WAD','Female','2023-02-15','2023-08-03',22.40,'Brown','Breeding','Active',9),(130,'GOAT-030','Kalahari','Male','2023-03-25','2023-08-05',34.10,'Red','Meat','Active',10),(131,'GOAT-031','Boer','Female','2023-02-08','2023-08-07',26.90,'White','Milk','Active',1),(132,'GOAT-032','Saanen','Male','2023-03-03','2023-08-10',30.20,'White','Meat','Active',2),(133,'GOAT-033','WAD','Female','2023-01-28','2023-08-12',23.50,'Black','Breeding','Active',3),(134,'GOAT-034','Boer','Male','2023-02-19','2023-08-14',35.50,'White','Meat','Active',4),(135,'GOAT-035','Kalahari','Female','2023-03-10','2023-08-16',27.00,'Red','Milk','Active',5),(136,'GOAT-036','WAD','Male','2023-04-01','2023-08-18',24.90,'Brown','Meat','Active',6),(137,'GOAT-037','Saanen','Female','2023-02-25','2023-08-20',28.70,'White','Milk','Active',7),(138,'GOAT-038','Boer','Male','2023-01-16','2023-08-22',37.20,'White','Meat','Active',8),(139,'GOAT-039','WAD','Female','2023-03-05','2023-08-24',22.80,'Black','Breeding','Active',9),(140,'GOAT-040','Kalahari','Female','2023-02-21','2023-08-26',25.90,'Red','Milk','Active',10),(141,'GOAT-041','Boer','Male','2023-03-08','2023-08-28',34.60,'White','Meat','Active',1),(142,'GOAT-042','Saanen','Female','2023-01-20','2023-08-30',29.00,'White','Milk','Active',2),(143,'GOAT-043','WAD','Male','2023-02-14','2023-09-01',25.20,'Black','Meat','Active',3),(144,'GOAT-044','Boer','Female','2023-03-22','2023-09-03',27.60,'White','Milk','Active',4),(145,'GOAT-045','Kalahari','Male','2023-01-30','2023-09-05',33.90,'Red','Meat','Active',5),(146,'GOAT-046','WAD','Female','2023-02-18','2023-09-07',22.30,'Brown','Breeding','Active',6),(147,'GOAT-047','Saanen','Male','2023-03-27','2023-09-09',31.00,'White','Meat','Active',7),(148,'GOAT-048','Boer','Female','2023-01-12','2023-09-11',26.80,'White','Milk','Active',8),(149,'GOAT-049','WAD','Male','2023-02-26','2023-09-13',24.60,'Black','Meat','Active',9),(150,'GOAT-050','Kalahari','Female','2023-03-14','2023-09-15',25.50,'Red','Milk','Active',10),(151,'GOAT-051','Boer','Male','2023-01-18','2023-09-17',36.40,'White','Meat','Active',1),(152,'GOAT-052','Saanen','Female','2023-02-09','2023-09-19',28.40,'White','Milk','Active',2),(153,'GOAT-053','WAD','Female','2023-03-06','2023-09-21',23.10,'Brown','Breeding','Active',3),(154,'GOAT-054','Boer','Male','2023-02-22','2023-09-23',35.00,'White','Meat','Active',4),(155,'GOAT-055','Kalahari','Female','2023-01-25','2023-09-25',26.70,'Red','Milk','Active',5),(156,'GOAT-056','WAD','Male','2023-03-11','2023-09-27',25.40,'Black','Meat','Active',6),(157,'GOAT-057','Saanen','Female','2023-02-17','2023-09-29',29.60,'White','Milk','Active',7),(158,'GOAT-058','Boer','Male','2023-01-21','2023-10-01',37.00,'White','Meat','Active',8),(159,'GOAT-059','WAD','Female','2023-03-02','2023-10-03',22.90,'Black','Breeding','Active',9),(160,'GOAT-060','Kalahari','Male','2023-02-28','2023-10-05',34.30,'Red','Meat','Active',10),(161,'GOAT-061','Boer','Female','2023-02-05','2023-10-07',27.10,'White','Milk','Active',1),(162,'GOAT-062','Saanen','Male','2023-03-09','2023-10-09',30.50,'White','Meat','Active',2),(163,'GOAT-063','WAD','Female','2023-01-27','2023-10-11',23.80,'Brown','Breeding','Active',3),(164,'GOAT-064','Boer','Male','2023-02-16','2023-10-13',35.80,'White','Meat','Active',4),(165,'GOAT-065','Kalahari','Female','2023-03-04','2023-10-15',26.40,'Red','Milk','Active',5),(166,'GOAT-066','WAD','Male','2023-01-19','2023-10-17',24.10,'Black','Meat','Active',6),(167,'GOAT-067','Saanen','Female','2023-02-24','2023-10-19',29.80,'White','Milk','Active',7),(168,'GOAT-068','Boer','Male','2023-03-13','2023-10-21',36.70,'White','Meat','Active',8),(169,'GOAT-069','WAD','Female','2023-01-23','2023-10-23',22.60,'Brown','Breeding','Active',9),(170,'GOAT-070','Kalahari','Male','2023-02-11','2023-10-25',33.60,'Red','Meat','Active',10),(171,'GOAT-071','Boer','Female','2023-03-01','2023-10-27',27.90,'White','Milk','Active',1),(172,'GOAT-072','Saanen','Male','2023-01-15','2023-10-29',31.20,'White','Meat','Active',2),(173,'GOAT-073','WAD','Female','2023-02-07','2023-10-31',23.30,'Black','Breeding','Active',3),(174,'GOAT-074','Boer','Male','2023-03-19','2023-11-02',35.10,'White','Meat','Active',4),(175,'GOAT-075','Kalahari','Female','2023-01-29','2023-11-04',26.00,'Red','Milk','Active',5),(176,'GOAT-076','WAD','Male','2023-02-13','2023-11-06',25.60,'Brown','Meat','Active',6),(177,'GOAT-077','Saanen','Female','2023-03-26','2023-11-08',29.40,'White','Milk','Active',7),(178,'GOAT-078','Boer','Male','2023-01-11','2023-11-10',37.50,'White','Meat','Active',8),(179,'GOAT-079','WAD','Female','2023-02-20','2023-11-12',22.20,'Black','Breeding','Active',9),(180,'GOAT-080','Kalahari','Male','2023-03-07','2023-11-14',34.80,'Red','Meat','Active',10),(181,'GOAT-081','Boer','Female','2023-01-26','2023-11-16',27.30,'White','Milk','Active',1),(182,'GOAT-082','Saanen','Male','2023-02-18','2023-11-18',30.90,'White','Meat','Active',2),(183,'GOAT-083','WAD','Female','2023-03-15','2023-11-20',23.60,'Brown','Breeding','Active',3),(184,'GOAT-084','Boer','Male','2023-01-17','2023-11-22',36.30,'White','Meat','Active',4),(185,'GOAT-085','Kalahari','Female','2023-02-09','2023-11-24',26.60,'Red','Milk','Active',5),(186,'GOAT-086','WAD','Male','2023-03-03','2023-11-26',24.70,'Black','Meat','Active',6),(187,'GOAT-087','Saanen','Female','2023-01-21','2023-11-28',29.10,'White','Milk','Active',7),(188,'GOAT-088','Boer','Male','2023-02-25','2023-11-30',37.80,'White','Meat','Active',8),(189,'GOAT-089','WAD','Female','2023-03-10','2023-12-02',22.50,'Black','Breeding','Active',9),(190,'GOAT-090','Kalahari','Male','2023-01-13','2023-12-04',34.00,'Red','Meat','Active',10),(191,'GOAT-091','Boer','Female','2023-02-06','2023-12-06',27.70,'White','Milk','Active',1),(192,'GOAT-092','Saanen','Male','2023-03-21','2023-12-08',31.50,'White','Meat','Active',2),(193,'GOAT-093','WAD','Female','2023-01-24','2023-12-10',23.20,'Brown','Breeding','Active',3),(194,'GOAT-094','Boer','Male','2023-02-12','2023-12-12',35.60,'White','Meat','Active',4),(195,'GOAT-095','Kalahari','Female','2023-03-28','2023-12-14',26.80,'Red','Milk','Active',5),(196,'GOAT-096','WAD','Male','2023-01-18','2023-12-16',24.30,'Black','Meat','Active',6),(197,'GOAT-097','Saanen','Female','2023-02-22','2023-12-18',29.70,'White','Milk','Active',7),(198,'GOAT-098','Boer','Male','2023-03-06','2023-12-20',37.10,'White','Meat','Active',8),(199,'GOAT-099','WAD','Female','2023-01-28','2023-12-22',22.70,'Black','Breeding','Active',9),(200,'GOAT-100','Kalahari','Male','2023-02-15','2023-12-24',34.50,'Red','Meat','Active',10);
/*!40000 ALTER TABLE `goats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-04  2:14:38
