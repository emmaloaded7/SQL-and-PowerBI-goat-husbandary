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
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `expense_type` enum('Feed','Veterinary','Labor','Transport','Equipment','Medication','Utilities','Maintenance') NOT NULL,
  `goat_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expense_date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `week_number` int DEFAULT NULL,
  `recorded_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `goat_id` (`goat_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`goat_id`) REFERENCES `goats` (`goat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (21,'Feed',NULL,50000.00,'2024-01-07','Weekly feed purchase',1,'Manager'),(22,'Veterinary',117,8000.00,'2024-01-08','Treatment for fever',1,'Dr. Musa'),(23,'Medication',102,3500.00,'2024-01-08','Deworming drugs',1,'Dr. Aisha'),(24,'Labor',NULL,20000.00,'2024-01-09','Worker salary',1,'Admin'),(25,'Transport',NULL,12000.00,'2024-01-10','Feed delivery',1,'Logistics'),(26,'Feed',NULL,52000.00,'2024-01-14','Weekly feed stock',2,'Manager'),(27,'Veterinary',107,9000.00,'2024-01-15','Pneumonia treatment',2,'Dr. John'),(28,'Medication',112,4000.00,'2024-01-15','Vaccination support drugs',2,'Dr. Musa'),(29,'Labor',NULL,20000.00,'2024-01-16','Farm workers payment',2,'Admin'),(30,'Equipment',NULL,15000.00,'2024-01-17','Repair of feeding tools',2,'Manager'),(31,'Feed',NULL,48000.00,'2024-01-21','Feed purchase',3,'Manager'),(32,'Veterinary',122,7500.00,'2024-01-22','Health check-up',3,'Dr. Aisha'),(33,'Medication',129,3200.00,'2024-01-22','Antibiotics',3,'Dr. John'),(34,'Transport',NULL,10000.00,'2024-01-23','Market delivery',3,'Logistics'),(35,'Labor',NULL,20000.00,'2024-01-24','Staff salary',3,'Admin'),(36,'Feed',NULL,53000.00,'2024-01-28','Feed supply',4,'Manager'),(37,'Veterinary',141,8500.00,'2024-01-29','Foot rot treatment',4,'Dr. Musa'),(38,'Medication',133,3000.00,'2024-01-29','Deworming drugs',4,'Dr. Aisha'),(39,'Equipment',NULL,18000.00,'2024-01-30','Fence maintenance',4,'Manager'),(40,'Labor',NULL,20000.00,'2024-01-31','Workers payment',4,'Admin');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
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
