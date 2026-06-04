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
-- Table structure for table `vaccination`
--

DROP TABLE IF EXISTS `vaccination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccination` (
  `vaccination_id` int NOT NULL AUTO_INCREMENT,
  `goat_id` int NOT NULL,
  `vaccine_name` varchar(100) NOT NULL,
  `disease_target` varchar(100) DEFAULT NULL,
  `dose` varchar(50) DEFAULT NULL,
  `vet_name` varchar(100) DEFAULT NULL,
  `vaccination_date` date NOT NULL,
  `next_due_date` date DEFAULT NULL,
  `status` enum('Completed','Pending','Overdue') DEFAULT 'Completed',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vaccination_id`),
  KEY `goat_id` (`goat_id`),
  CONSTRAINT `vaccination_ibfk_1` FOREIGN KEY (`goat_id`) REFERENCES `goats` (`goat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccination`
--

LOCK TABLES `vaccination` WRITE;
/*!40000 ALTER TABLE `vaccination` DISABLE KEYS */;
INSERT INTO `vaccination` VALUES (18,102,'PPR Vaccine','Peste des Petits Ruminants','1ml','Dr. Musa','2024-01-05','2024-07-05','Completed','First dose'),(19,105,'Anthrax Vaccine','Anthrax','1ml','Dr. Aisha','2024-01-06','2024-07-06','Completed','Routine vaccination'),(20,107,'PPR Vaccine','PPR','1ml','Dr. John','2024-01-07','2024-07-07','Completed','Stable goat'),(21,112,'Tetanus Vaccine','Tetanus','0.5ml','Dr. Musa','2024-01-08','2024-07-08','Completed','Preventive'),(22,117,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-09','2024-07-09','Completed','Healthy goat'),(23,122,'Rabies Vaccine','Rabies','1ml','Dr. John','2024-01-10','2024-07-10','Completed','Safety measure'),(24,129,'Anthrax Vaccine','Anthrax','1ml','Dr. Musa','2024-01-11','2024-07-11','Completed','Routine'),(25,133,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-12','2024-07-12','Completed','Good health'),(26,141,'Tetanus Vaccine','Tetanus','0.5ml','Dr. John','2024-01-13','2024-07-13','Completed','Preventive care'),(27,155,'Rabies Vaccine','Rabies','1ml','Dr. Musa','2024-01-14','2024-07-14','Completed','Standard shot'),(28,162,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-15','2024-07-15','Completed','Booster given'),(29,167,'Anthrax Vaccine','Anthrax','1ml','Dr. John','2024-01-16','2024-07-16','Completed','Routine'),(30,173,'Tetanus Vaccine','Tetanus','0.5ml','Dr. Musa','2024-01-17','2024-07-17','Completed','Healthy goat'),(31,178,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-18','2024-07-18','Completed','Good response'),(32,184,'Rabies Vaccine','Rabies','1ml','Dr. John','2024-01-19','2024-07-19','Completed','Preventive'),(33,191,'Anthrax Vaccine','Anthrax','1ml','Dr. Musa','2024-01-20','2024-07-20','Completed','Routine vaccination'),(34,196,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-21','2024-07-21','Completed','Stable condition');
/*!40000 ALTER TABLE `vaccination` ENABLE KEYS */;
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
