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
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_mesa` int NOT NULL,
  `locales_id` int NOT NULL,
  `numero_comensales` int NOT NULL,
  `ocupada` tinyint DEFAULT NULL,
  `fecha_ocupacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Mesas_Locales1_idx` (`locales_id`),
  CONSTRAINT `fk_Mesas_Locales1` FOREIGN KEY (`locales_id`) REFERENCES `locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,1,1,10,1,'2023-09-21 00:00:00'),(2,2,1,12,0,NULL),(3,3,1,8,1,'2023-09-21 00:00:00'),(4,4,1,12,0,NULL),(5,5,1,8,1,'2023-09-21 00:00:00'),(6,6,1,8,0,NULL),(7,10,2,10,1,'2023-09-21 00:00:00'),(8,12,2,8,0,NULL),(9,13,2,8,1,'2023-09-21 00:00:00'),(10,15,2,12,0,NULL),(11,17,2,8,1,'2023-09-21 00:00:00'),(12,16,2,8,0,NULL),(13,1,12,10,1,'2023-09-20 00:00:00'),(14,2,12,8,0,NULL),(15,5,13,8,1,'2023-09-19 00:00:00'),(16,7,13,12,0,NULL),(17,1,9,8,1,'2023-09-20 00:00:00'),(18,2,9,8,0,NULL),(19,3,4,6,1,'2023-09-19 00:00:00'),(20,7,4,12,0,NULL),(21,4,4,10,1,'2023-09-22 00:00:00'),(22,6,4,2,0,NULL),(23,2,3,10,1,'2023-09-23 00:00:00'),(24,6,3,2,0,NULL),(25,1,5,12,1,'2023-09-12 00:00:00'),(26,1,5,12,0,NULL),(27,1,7,8,1,'2023-09-22 00:00:00'),(28,1,7,12,0,NULL),(29,1,8,8,1,'2023-09-24 00:00:00'),(30,1,8,12,0,NULL),(31,1,6,8,1,'2023-09-27 00:00:00'),(32,12,6,10,1,'2023-09-27 00:00:00'),(33,10,6,12,0,NULL),(34,14,6,12,0,NULL),(35,10,10,12,0,NULL),(36,12,10,12,0,NULL),(37,1,11,12,0,NULL),(38,2,11,8,0,NULL),(39,1,14,6,0,NULL),(40,2,14,8,0,NULL),(41,3,15,8,1,'2023-10-23 00:00:00'),(42,1,15,6,0,NULL),(43,2,15,8,0,NULL),(44,33,12,6,1,'2023-11-06 00:00:00'),(45,53,12,4,1,'2023-12-09 00:00:00'),(46,63,12,8,1,'2023-12-20 00:00:00'),(47,7,12,6,1,'2023-11-06 00:00:00'),(48,11,12,4,1,'2023-12-09 00:00:00'),(49,13,13,4,1,'2023-10-19 00:00:00'),(50,10,15,6,1,'2023-11-03 00:00:00'),(51,7,15,4,1,'2023-11-28 00:00:00'),(52,99,6,6,1,'2023-10-01 00:00:00'),(53,66,6,8,1,'2023-10-11 00:00:00');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
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
