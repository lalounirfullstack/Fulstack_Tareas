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
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `sucursal` varchar(100) NOT NULL,
  `telefono` varchar(16) NOT NULL,
  `responsable` varchar(100) NOT NULL,
  `abierto` tinyint NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'Earls','Earls Station Square','778-4568991','Thomas Castelli',1,'400-800 Broughton','V9T 5X8','Burnaby'),(2,'Earls','Earls Ambleside Beach','778-4875690','Bob Ho',1,'480-Homer','V4T 5X8','Vancouver'),(3,'Sombreros','Sombreros Centro','778-4568607','Michael Castelli',1,'400-10222 Broughton','V8T 5U8','Burnaby'),(4,'Sombreros','Sombreros Fraser','778-9805690','Nick Ho',1,'2-1-900-Fraser','V2T 5R8','East Vancouver'),(5,'Papayas','Papayas Willingdon','778-4908990','Thomas Castelli',1,'13-1020 Broughton','V3T 5V8','Burnaby'),(6,'Papayas','Papayas West Van','778-4906904','Inga Bhu',1,'480-Bidwell','V1T 5T8','West Vancouver'),(7,'Milestones','Milestones Yaletown','778-4569090','Sammy Wang',1,'4300-1020 Davie','V7T 5B8','Vancouver'),(8,'Milestones','Milestones Ladner','77-9056904','Sammy Wang',1,'480-Hillway 12','V4X 5U8','Ladner'),(9,'Tim Horton','Tim Horton Richmond','778-8006902','Yan Pang',0,'890-Road 3','V9T 3R8','Richmond'),(10,'Bananas','Bananas Yaletown','778-5270255','Sammy Wang',1,'33-1045 Davie','V7T 1X2','Vancouver'),(11,'Backpackers','Backpackers Towncentre','778-8056908','Sammy Wang',1,'480-ByPass 120','V9T 2X9','Chilliwack'),(12,'Irish Pub','Irish Pub Abbotsford','778-6270987','Elliot Yo',1,'550 Rockefeller ave','V1T 1O2','Vancouver'),(13,'Las Ranas','Las Ranas Downtown','778-7890987','Juan Ramon Lopez',1,'300 Smithe','V8Z 1X9','Vancouver'),(14,'Las Ranas','Las Rans Chilli','778-9134568','Juan Ramon Lopez',1,'1300 RiverRoad','V2Z 3X7','Chilliwack'),(15,'Sal y Limon','Sal y Limon Fraser','778-7526786','Juan Ramon Lopez',1,'5000 70 Ave','V7Z 2X7','East Vancouver');
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
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
