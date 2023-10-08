-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurante
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cliente_mesas`
--

DROP TABLE IF EXISTS `cliente_mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_mesas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Mesas_id` int NOT NULL,
  `Clientes_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Client_Mesas_Mesas1_idx` (`Mesas_id`),
  KEY `fk_Client_Mesas_Clientes1_idx` (`Clientes_id`),
  CONSTRAINT `fk_Client_Mesas_Clientes1` FOREIGN KEY (`Clientes_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_Client_Mesas_Mesas1` FOREIGN KEY (`Mesas_id`) REFERENCES `mesas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_mesas`
--

LOCK TABLES `cliente_mesas` WRITE;
/*!40000 ALTER TABLE `cliente_mesas` DISABLE KEYS */;
INSERT INTO `cliente_mesas` VALUES (1,1,1),(2,3,4),(3,5,9),(4,7,11),(5,13,5),(6,9,8),(7,15,8),(8,29,15),(9,27,17),(10,31,17),(11,25,17),(12,41,13),(13,23,5),(14,19,10),(15,21,3),(16,17,3),(17,11,2),(18,32,5),(19,44,5),(20,45,8),(21,46,11),(22,47,17),(23,48,4),(24,49,3),(25,50,3),(26,51,3),(27,52,17),(28,53,17);
/*!40000 ALTER TABLE `cliente_mesas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-23 16:57:38
