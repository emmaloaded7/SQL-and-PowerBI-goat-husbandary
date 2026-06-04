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
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed` (
  `feed_id` int NOT NULL AUTO_INCREMENT,
  `goat_id` int NOT NULL,
  `feed_type` enum('Grass','Hay','Concentrate','Grain Mix') NOT NULL,
  `quantity_kg` decimal(6,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `feed_date` date NOT NULL,
  `week_number` int NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`feed_id`),
  KEY `goat_id` (`goat_id`),
  CONSTRAINT `feed_ibfk_1` FOREIGN KEY (`goat_id`) REFERENCES `goats` (`goat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed`
--

LOCK TABLES `feed` WRITE;
/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
INSERT INTO `feed` VALUES (401,101,'Grass',2.50,500.00,'2024-01-01',1,'Morning feeding'),(402,102,'Concentrate',1.50,1200.00,'2024-01-01',1,'Milk production support'),(403,103,'Hay',2.00,800.00,'2024-01-01',1,'Breeding nutrition'),(404,104,'Grain Mix',1.20,1000.00,'2024-01-02',1,'Weight gain feeding'),(405,105,'Grass',2.60,520.00,'2024-01-02',1,'Routine feeding'),(406,106,'Hay',2.30,900.00,'2024-01-03',1,'Digestive support'),(407,107,'Concentrate',1.30,1150.00,'2024-01-03',1,'Milk enhancement'),(408,108,'Grass',2.70,540.00,'2024-01-04',1,'Routine feeding'),(409,109,'Grain Mix',1.40,1050.00,'2024-01-05',1,'Breeding support'),(410,110,'Grass',2.40,500.00,'2024-01-06',1,'Standard feeding'),(411,111,'Grass',2.70,540.00,'2024-01-08',2,'Routine feeding'),(412,112,'Concentrate',1.60,1250.00,'2024-01-08',2,'Milk support'),(413,113,'Hay',2.10,850.00,'2024-01-08',2,'Balanced nutrition'),(414,114,'Grain Mix',1.30,1100.00,'2024-01-09',2,'Growth support'),(415,115,'Grass',2.50,530.00,'2024-01-09',2,'Daily feeding'),(416,116,'Hay',2.20,900.00,'2024-01-10',2,'Digestive support'),(417,117,'Concentrate',1.40,1180.00,'2024-01-10',2,'Milk enhancement'),(418,118,'Grass',2.80,560.00,'2024-01-11',2,'Routine feeding'),(419,119,'Grain Mix',1.50,1080.00,'2024-01-12',2,'Weight gain'),(420,120,'Grass',2.40,510.00,'2024-01-13',2,'Healthy feeding'),(421,121,'Grass',2.60,520.00,'2024-01-15',3,'Routine feeding'),(422,122,'Concentrate',1.50,1220.00,'2024-01-15',3,'Milk production'),(423,123,'Hay',2.00,830.00,'2024-01-15',3,'Breeding diet'),(424,124,'Grain Mix',1.40,1070.00,'2024-01-16',3,'Growth support'),(425,125,'Grass',2.70,550.00,'2024-01-16',3,'Routine feeding'),(426,126,'Hay',2.30,910.00,'2024-01-17',3,'Digestive health'),(427,127,'Concentrate',1.20,1160.00,'2024-01-17',3,'Milk support'),(428,128,'Grass',2.90,570.00,'2024-01-18',3,'Healthy feeding'),(429,129,'Grain Mix',1.50,1090.00,'2024-01-19',3,'Breeding nutrition'),(430,130,'Grass',2.50,520.00,'2024-01-20',3,'Standard feeding'),(431,131,'Grass',2.50,510.00,'2024-01-22',4,'Routine feeding'),(432,132,'Concentrate',1.40,1200.00,'2024-01-22',4,'Milk enhancement'),(433,133,'Hay',2.10,860.00,'2024-01-22',4,'Balanced nutrition'),(434,134,'Grain Mix',1.30,1060.00,'2024-01-23',4,'Weight gain'),(435,135,'Grass',2.60,540.00,'2024-01-23',4,'Healthy feeding'),(436,136,'Hay',2.40,920.00,'2024-01-24',4,'Digestive support'),(437,137,'Concentrate',1.50,1190.00,'2024-01-24',4,'Milk support'),(438,138,'Grass',2.80,560.00,'2024-01-25',4,'Routine feeding'),(439,139,'Grain Mix',1.40,1080.00,'2024-01-26',4,'Growth support'),(440,140,'Grass',2.50,520.00,'2024-01-27',4,'Standard feeding'),(441,141,'Grass',2.60,530.00,'2024-01-29',5,'Routine feeding'),(442,142,'Concentrate',1.50,1230.00,'2024-01-29',5,'Milk support'),(443,143,'Hay',2.20,870.00,'2024-01-29',5,'Balanced nutrition'),(444,144,'Grain Mix',1.40,1090.00,'2024-01-30',5,'Weight gain'),(445,145,'Grass',2.70,550.00,'2024-01-30',5,'Healthy feeding'),(446,146,'Hay',2.30,910.00,'2024-01-31',5,'Digestive support'),(447,147,'Concentrate',1.60,1200.00,'2024-01-31',5,'Milk enhancement'),(448,148,'Grass',2.80,570.00,'2024-02-01',5,'Routine feeding'),(449,149,'Grain Mix',1.50,1100.00,'2024-02-02',5,'Growth support'),(450,150,'Grass',2.50,520.00,'2024-02-03',5,'Standard feeding'),(451,151,'Grass',2.70,540.00,'2024-02-05',6,'Routine feeding'),(452,152,'Concentrate',1.50,1240.00,'2024-02-05',6,'Milk support'),(453,153,'Hay',2.10,860.00,'2024-02-05',6,'Breeding nutrition'),(454,154,'Grain Mix',1.40,1080.00,'2024-02-06',6,'Weight gain'),(455,155,'Grass',2.60,550.00,'2024-02-06',6,'Routine feeding'),(456,156,'Hay',2.40,920.00,'2024-02-07',6,'Digestive support'),(457,157,'Concentrate',1.50,1180.00,'2024-02-07',6,'Milk enhancement'),(458,158,'Grass',2.90,580.00,'2024-02-08',6,'Healthy feeding'),(459,159,'Grain Mix',1.60,1110.00,'2024-02-09',6,'Growth support'),(460,160,'Grass',2.50,530.00,'2024-02-10',6,'Standard feeding'),(461,161,'Grass',2.60,540.00,'2024-02-12',7,'Routine feeding'),(462,162,'Concentrate',1.60,1250.00,'2024-02-12',7,'Milk production'),(463,163,'Hay',2.20,880.00,'2024-02-12',7,'Balanced nutrition'),(464,164,'Grain Mix',1.50,1100.00,'2024-02-13',7,'Weight gain'),(465,165,'Grass',2.80,560.00,'2024-02-13',7,'Healthy feeding'),(466,166,'Hay',2.30,930.00,'2024-02-14',7,'Digestive support'),(467,167,'Concentrate',1.40,1190.00,'2024-02-14',7,'Milk support'),(468,168,'Grass',2.90,590.00,'2024-02-15',7,'Routine feeding'),(469,169,'Grain Mix',1.50,1120.00,'2024-02-16',7,'Growth support'),(470,170,'Grass',2.50,540.00,'2024-02-17',7,'Standard feeding'),(471,171,'Grass',2.70,550.00,'2024-02-19',8,'Routine feeding'),(472,172,'Concentrate',1.50,1260.00,'2024-02-19',8,'Milk enhancement'),(473,173,'Hay',2.10,870.00,'2024-02-19',8,'Breeding support'),(474,174,'Grain Mix',1.40,1090.00,'2024-02-20',8,'Weight gain'),(475,175,'Grass',2.80,570.00,'2024-02-20',8,'Healthy feeding'),(476,176,'Hay',2.40,940.00,'2024-02-21',8,'Digestive support'),(477,177,'Concentrate',1.50,1200.00,'2024-02-21',8,'Milk support'),(478,178,'Grass',2.90,600.00,'2024-02-22',8,'Routine feeding'),(479,179,'Grain Mix',1.60,1130.00,'2024-02-23',8,'Growth support'),(480,180,'Grass',2.60,550.00,'2024-02-24',8,'Standard feeding'),(481,181,'Grass',2.70,560.00,'2024-02-26',9,'Routine feeding'),(482,182,'Concentrate',1.60,1270.00,'2024-02-26',9,'Milk production'),(483,183,'Hay',2.20,890.00,'2024-02-26',9,'Balanced nutrition'),(484,184,'Grain Mix',1.50,1110.00,'2024-02-27',9,'Weight gain'),(485,185,'Grass',2.80,580.00,'2024-02-27',9,'Healthy feeding'),(486,186,'Hay',2.30,950.00,'2024-02-28',9,'Digestive support'),(487,187,'Concentrate',1.40,1210.00,'2024-02-28',9,'Milk enhancement'),(488,188,'Grass',3.00,610.00,'2024-02-29',9,'Routine feeding'),(489,189,'Grain Mix',1.60,1140.00,'2024-03-01',9,'Growth support'),(490,190,'Grass',2.60,560.00,'2024-03-02',9,'Standard feeding'),(491,191,'Grass',2.80,570.00,'2024-03-04',10,'Routine feeding'),(492,192,'Concentrate',1.60,1280.00,'2024-03-04',10,'Milk support'),(493,193,'Hay',2.20,900.00,'2024-03-04',10,'Breeding nutrition'),(494,194,'Grain Mix',1.50,1120.00,'2024-03-05',10,'Weight gain'),(495,195,'Grass',2.90,590.00,'2024-03-05',10,'Healthy feeding'),(496,196,'Hay',2.40,960.00,'2024-03-06',10,'Digestive support'),(497,197,'Concentrate',1.50,1220.00,'2024-03-06',10,'Milk enhancement'),(498,198,'Grass',3.00,620.00,'2024-03-07',10,'Routine feeding'),(499,199,'Grain Mix',1.60,1150.00,'2024-03-08',10,'Growth support'),(500,200,'Grass',2.70,570.00,'2024-03-09',10,'Standard feeding');
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;
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
