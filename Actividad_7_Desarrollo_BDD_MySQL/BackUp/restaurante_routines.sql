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
-- Temporary view structure for view `restaurant_analisis_data`
--

DROP TABLE IF EXISTS `restaurant_analisis_data`;
/*!50001 DROP VIEW IF EXISTS `restaurant_analisis_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `restaurant_analisis_data` AS SELECT 
 1 AS `ID`,
 1 AS `Restaurante`,
 1 AS `Sucursal`,
 1 AS `Mesa_ID`,
 1 AS `Numero_De_Mesa`,
 1 AS `Fecha_De_Ocupacion`,
 1 AS `ocupada`,
 1 AS `Cliente_ID`,
 1 AS `Nombre_Del_Cliente`,
 1 AS `Email_Del_Cliente`,
 1 AS `Telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `restaurant_analisis_data`
--

/*!50001 DROP VIEW IF EXISTS `restaurant_analisis_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `restaurant_analisis_data` AS select `lc`.`id` AS `ID`,`lc`.`nombre` AS `Restaurante`,`lc`.`sucursal` AS `Sucursal`,`ms`.`id` AS `Mesa_ID`,`ms`.`numero_mesa` AS `Numero_De_Mesa`,`ms`.`fecha_ocupacion` AS `Fecha_De_Ocupacion`,(case when (`ms`.`fecha_ocupacion` is not null) then 1 else 0 end) AS `ocupada`,`cl`.`id` AS `Cliente_ID`,`cl`.`nombre` AS `Nombre_Del_Cliente`,`cl`.`email` AS `Email_Del_Cliente`,`cl`.`telefono` AS `Telefono` from (((`locales` `lc` left join `mesas` `ms` on((`lc`.`id` = `ms`.`locales_id`))) left join `cliente_mesas` `cm` on((`cm`.`Mesas_id` = `ms`.`id`))) left join `clientes` `cl` on((`cm`.`Clientes_id` = `cl`.`id`))) order by `lc`.`sucursal`,`ms`.`fecha_ocupacion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'restaurante'
--
/*!50003 DROP PROCEDURE IF EXISTS `getRestaurantOccupiedTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRestaurantOccupiedTable`(
    IN restaurant VARCHAR(100)
)
BEGIN
    SELECT lc.ID,
       lc.nombre AS Restaurante,
       lc.sucursal AS Sucursal,
       ms.ID AS Mesa_ID,
       ms.numero_mesa AS Numero_De_Mesa,
       ms.fecha_ocupacion AS Fecha_De_Ocupacion,
       CASE
       WHEN ms.fecha_ocupacion IS NOT NULL THEN 1
       ELSE 0
       END AS ocupada,
       cl.id AS Cliente_ID,
       cl.nombre AS Nombre_Del_Cliente,
       cl.email AS Email_Del_Cliente,
       cl.telefono AS Telefono
    FROM restaurante.locales lc
    LEFT JOIN restaurante.mesas ms ON lc.id=ms.locales_id
    LEFT JOIN restaurante.cliente_mesas cm ON cm.mesas_id=ms.id
    LEFT JOIN restaurante.clientes cl ON cm.clientes_id=cl.id
    WHERE lc.nombre=restaurant AND ms.fecha_ocupacion IS NOT NULL
    ORDER BY lc.sucursal, fecha_ocupacion ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-23 16:57:38
