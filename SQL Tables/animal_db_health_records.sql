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
-- Table structure for table `health_records`
--

DROP TABLE IF EXISTS `health_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_records` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `goat_id` int DEFAULT NULL,
  `condition_name` varchar(100) DEFAULT NULL,
  `treatment` text,
  `medication` varchar(100) DEFAULT NULL,
  `vet_name` varchar(100) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `status` enum('Recovered','Under Treatment','Critical') DEFAULT 'Under Treatment',
  PRIMARY KEY (`record_id`),
  KEY `goat_id` (`goat_id`),
  CONSTRAINT `health_records_ibfk_1` FOREIGN KEY (`goat_id`) REFERENCES `goats` (`goat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_records`
--

LOCK TABLES `health_records` WRITE;
/*!40000 ALTER TABLE `health_records` DISABLE KEYS */;
INSERT INTO `health_records` VALUES (26,117,'Worm Infestation','Deworming treatment administered','Albendazole','Dr. Musa','2024-01-02','Recovered'),(27,144,'Fever','Antibiotics and hydration therapy','Oxytetracycline','Dr. Aisha','2024-01-03','Recovered'),(28,108,'Diarrhea','Fluid replacement and medication','Sulfadimidine','Dr. John','2024-01-04','Under Treatment'),(29,162,'Foot Rot','Hoof cleaning and antibiotic treatment','Penicillin','Dr. Musa','2024-01-05','Recovered'),(30,129,'Cough Infection','Respiratory treatment administered','Tylosin','Dr. Aisha','2024-01-06','Under Treatment'),(31,191,'Skin Infection','Topical treatment applied','Ivermectin','Dr. John','2024-01-07','Recovered'),(32,103,'Pneumonia','Respiratory antibiotic therapy','Tylosin','Dr. Musa','2024-01-08','Critical'),(33,155,'Worm Infestation','Deworming treatment administered','Albendazole','Dr. Aisha','2024-01-09','Recovered'),(34,178,'Diarrhea','Oral rehydration treatment','Sulfadimidine','Dr. John','2024-01-10','Recovered'),(35,112,'Fever','Medication and hydration therapy','Oxytetracycline','Dr. Musa','2024-01-11','Recovered'),(36,136,'Foot Rot','Hoof treatment and cleaning','Penicillin','Dr. Aisha','2024-01-12','Recovered'),(37,184,'Skin Infection','Topical medication administered','Ivermectin','Dr. John','2024-01-13','Under Treatment'),(38,105,'Cough Infection','Respiratory support treatment','Tylosin','Dr. Musa','2024-01-14','Recovered'),(39,167,'Worm Infestation','Deworming therapy','Albendazole','Dr. Aisha','2024-01-15','Recovered'),(40,141,'Pneumonia','Antibiotic respiratory treatment','Tylosin','Dr. John','2024-01-16','Critical'),(41,190,'Diarrhea','Fluid replacement therapy','Sulfadimidine','Dr. Musa','2024-01-17','Recovered'),(42,122,'Fever','Hydration and antibiotics','Oxytetracycline','Dr. Aisha','2024-01-18','Recovered'),(43,173,'Skin Infection','Topical treatment applied','Ivermectin','Dr. John','2024-01-19','Recovered'),(44,118,'Foot Rot','Antibiotic hoof treatment','Penicillin','Dr. Musa','2024-01-20','Under Treatment'),(45,196,'Cough Infection','Respiratory medication','Tylosin','Dr. Aisha','2024-01-21','Recovered'),(46,111,'Worm Infestation','Deworming treatment','Albendazole','Dr. John','2024-01-22','Recovered'),(47,159,'Fever','Medication and hydration support','Oxytetracycline','Dr. Musa','2024-01-23','Recovered'),(48,133,'Diarrhea','Fluid therapy treatment','Sulfadimidine','Dr. Aisha','2024-01-24','Under Treatment'),(49,188,'Skin Infection','Topical medication treatment','Ivermectin','Dr. John','2024-01-25','Recovered'),(50,106,'Pneumonia','Respiratory therapy administered','Tylosin','Dr. Musa','2024-01-26','Critical');
/*!40000 ALTER TABLE `health_records` ENABLE KEYS */;
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
