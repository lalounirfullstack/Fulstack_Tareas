-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurante
-- -----------------------------------------------------
-- Base de Datos de Un Restaurant. 
-- + Locales
-- + Mesas
-- + Clientes
-- + Clientes_Mesas
-- + Favoritos

-- -----------------------------------------------------
-- Schema restaurante
--
-- Base de Datos de Un Restaurant. 
-- + Locales
-- + Mesas
-- + Clientes
-- + Clientes_Mesas
-- + Favoritos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `restaurante` ;

-- -----------------------------------------------------
-- Table `restaurante`.`Locales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`Locales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `sucursal` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(16) NOT NULL,
  `responsable` VARCHAR(100) NOT NULL,
  `abierto` TINYINT NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante`.`Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`Mesas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero_mesa` INT NOT NULL,
  `locales_id` INT NOT NULL,
  `numero_comensales` INT NOT NULL,
  `ocupada` TINYINT NULL,
  `fecha_ocupacion` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Mesas_Locales1_idx` (`locales_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mesas_Locales1`
    FOREIGN KEY (`locales_id`)
    REFERENCES `restaurante`.`Locales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `restaurante`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`Clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `telefono` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `restaurante`.`Favoritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`Favoritos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Clientes_id` INT NOT NULL,
  `Locales_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Favoritos_Clientes1_idx` (`Clientes_id` ASC) VISIBLE,
  INDEX `fk_Favoritos_Locales1_idx` (`Locales_id` ASC) VISIBLE,
  CONSTRAINT `fk_Favoritos_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `restaurante`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favoritos_Locales1`
    FOREIGN KEY (`Locales_id`)
    REFERENCES `restaurante`.`Locales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante`.`Cliente_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`Cliente_Mesas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Mesas_id` INT NOT NULL,
  `Clientes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Client_Mesas_Mesas1_idx` (`Mesas_id` ASC) VISIBLE,
  INDEX `fk_Client_Mesas_Clientes1_idx` (`Clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Mesas_Mesas1`
    FOREIGN KEY (`Mesas_id`)
    REFERENCES `restaurante`.`Mesas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Mesas_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `restaurante`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/*Insert Records*/
/*Insert Locales*/
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Earls', 'Earls Station Square', '778-4568991', 'Thomas Castelli', '1', '400-800 Broughton', 'V9T 5X8', 'Burnaby');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Earls', 'Earls Ambleside Beach', '778-4875690', 'Bob Ho', '1', '480-Homer', 'V4T 5X8', 'Vancouver');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Sombreros', 'Sombreros Centro', '778-4568607', 'Michael Castelli', '1', '400-10222 Broughton', 'V8T 5U8', 'Burnaby');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Sombreros', 'Sombreros Fraser', '778-9805690', 'Nick Ho', '1', '2-1-900-Fraser', 'V2T 5R8', 'East Vancouver');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Papayas', 'Papayas Willingdon', '778-4908990', 'Thomas Castelli', '1', '13-1020 Broughton', 'V3T 5V8', 'Burnaby');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Papayas', 'Papayas West Van', '778-4906904', 'Inga Bhu', '1', '480-Bidwell', 'V1T 5T8', 'West Vancouver');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Milestones', 'Milestones Yaletown', '778-4569090', 'Sammy Wang', '1', '4300-1020 Davie', 'V7T 5B8', 'Vancouver');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Milestones', 'Milestones Ladner', '77-9056904', 'Sammy Wang', '1', '480-Hillway 12', 'V4X 5U8', 'Ladner');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Tim Horton', 'Tim Horton Richmond', '778-8006902', 'Yan Pang', '0', '890-Road 3', 'V9T 3R8', 'Richmond');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Bananas', 'Bananas Yaletown', '778-5270255', 'Sammy Wang', '1', '33-1045 Davie', 'V7T 1X2', 'Vancouver');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Backpackers', 'Backpackers Towncentre', '778-8056908', 'Sammy Wang', '1', '480-ByPass 120', 'V9T 2X9', 'Chilliwack');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Irish Pub', 'Irish Pub Abbotsford', '778-6270987', 'Elliot Yo', '1', '550 Rockefeller ave', 'V1T 1O2', 'Vancouver');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Las Ranas', 'Las Ranas Downtown', '778-7890987', 'Juan Ramon Lopez', '1', '300 Smithe', 'V8Z 1X9', 'Vancouver');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Las Ranas', 'Las Rans Chilli', '778-9134568', 'Juan Ramon Lopez', '1', '1300 RiverRoad', 'V2Z 3X7', 'Chilliwack');
INSERT INTO `restaurante`.`locales` (`nombre`, `sucursal`, `telefono`, `responsable`, `abierto`, `direccion`, `codigo_postal`, `ciudad`) VALUES ('Sal y Limon', 'Sal y Limon Fraser', '778-7526786', 'Juan Ramon Lopez', '1', '5000 70 Ave', 'V7Z 2X7', 'East Vancouver');

/* Mesas */
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('1', '1', '10', '1', '2023-09-21');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('2', '1', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('3', '1', '8', '1', '2023-09-21');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('4', '1', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('5', '1', '8', '1', '2023-09-21');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('6', '1', '8', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('10', '2', '10', '1', '2023-09-21');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('12', '2', '8', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('13', '2', '8', '1', '2023-09-21');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('15', '2', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('17', '2', '8', '1', '2023-09-21');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('16', '2', '8', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('1', '12', '10', '1', '2023-09-20');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('2', '12', '8', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('5', '13', '8', '1', '2023-09-19');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('7', '13', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('1', '9', '8', '1', '2023-09-20');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('2', '9', '8', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('3', '4', '6', '1', '2023-09-19');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('7', '4', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('4', '4', '10', '1', '2023-09-22');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('6', '4', '2', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('2', '3', '10', '1', '2023-09-23');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('6', '3', '2', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('1', '5', '12', '1', '2023-09-12');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('1', '5', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('1', '7', '8', '1', '2023-09-22');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('1', '7', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('1', '8', '8', '1', '2023-09-24');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('1', '8', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('1', '6', '8', '1', '2023-09-27');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('12', '6', '10', '1', '2023-09-27');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('10', '6', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('14', '6', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('10', '10', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('12', '10', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('1', '11', '12', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('2', '11', '8', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('1', '14', '6', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('2', '14', '8', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('3', '15', '8', '1', '2023-10-23');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('1', '15', '6', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`) VALUES ('2', '15', '8', '0');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('33', '12', '6', '1', '2023-11-06');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('53', '12', '4', '1', '2023-12-09');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('63', '12', '8', '1', '2023-12-20');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('7', '12', '6', '1', '2023-11-06');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('11', '12', '4', '1', '2023-12-09');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('13', '13', '4', '1', '2023-10-19');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('10', '15', '6', '1', '2023-11-03');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('7', '15', '4', '1', '2023-11-28');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('99', '6', '6', '1', '2023-10-01');
INSERT INTO `restaurante`.`mesas` (`numero_mesa`, `locales_id`, `numero_comensales`, `ocupada`, `fecha_ocupacion`) VALUES ('66', '6', '8', '1', '2023-10-11');


/*INSERT Clientes*/
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Raul Alvarez', 'ralva@gmail.com', '778-9370245');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Mario Saba', 'msaba@gmail.com', '778-3994849');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Nicola Garza', 'ngarza@hotmail.com', '778-9948419');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Sam Parker', 'sparker@hotmail.com', '778-9948492');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Erick Canales', 'ecanales@gmail.com', '778-3894849');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Monica Garza', 'mgarza@hotmail.com', '778-8999990');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Peter Parker', 'ptparker@hotmail.com', '778-7848497');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Imad Thomas', 'ithomas@gmail.com', '778-6648498');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Ismail Bo', 'ismabo@hotmail.com', '778-8899967');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Mario Bezares', 'mbezares@hotmail.com', '778-9000823');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Rick Arora', 'raroea@arora.com', '778-6645430');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Ruben Suarez', 'rubSua@gmail.com', '778-4567890');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Armando Reyes', 'reyesarmando@gmail.com', '778-6789087');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Ingrid Coronado', 'icoronado@yahoo.com', '778-5567890');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Deirdre Leonard', 'dleo@gmail.com', '778-8907654');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Sammy Davis Jr', 'samdav@gmail.com', '778-9340344');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Kiera Flaherty', 'kflah@gmail.com', '778-6785645');
INSERT INTO `restaurante`.`clientes` (`nombre`, `email`, `telefono`) VALUES ('Thomas Bro', 'thomas23@gmail.com', '778-5675432');

/*Insert Client/Mesa*/
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('1', '1');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('3', '4');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('5', '9');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('7', '11');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('13', '5');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('9', '8');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('15', '8');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('29','15');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('27','17');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('31','17');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('25','17');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('41','13');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('23','5');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('19','10');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('21','3');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('17','3');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('11','2');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('32','5');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('44','5');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('45','8');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('46','11');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('47','17');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('48','4');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('49','3');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('50','3');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('51','3');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('52','17');
INSERT INTO `restaurante`.`cliente_mesas` (`Mesas_id`, `Clientes_id`) VALUES ('53','17');

/*Insert Favoritos*/
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('1', '1');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('1', '4');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('2', '9');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('5', '12');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('17', '6');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('10', '4');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('3', '4');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('13', '15');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('2', '2');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('8', '13');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('5', '3');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('10', '6');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('4', '3');
INSERT INTO `restaurante`.`favoritos` (`Clientes_id`, `Locales_id`) VALUES ('10', '7');

/*Store Procedure*/
DELIMITER //
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
END //
DELIMITER ;

/* Create Restautant Data Analysis View*/
DROP VIEW IF EXISTS  Restaurant_Analisis_Data;
CREATE VIEW Restaurant_Analisis_Data AS
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
ORDER BY lc.sucursal, fecha_ocupacion ASC;

