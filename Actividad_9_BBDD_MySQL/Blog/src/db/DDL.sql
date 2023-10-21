-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blogs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blogs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blogs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `blogs` ;

-- -----------------------------------------------------
-- Table `blogs`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs`.`authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `image` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `blogs`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(120) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `category` VARCHAR(100) NULL DEFAULT NULL,
  `authors_id` INT NOT NULL,
  PRIMARY KEY (`id`, `authors_id`),
  INDEX `fk_posts_authors_idx` (`authors_id` ASC) VISIBLE,
  CONSTRAINT `fk_posts_authors`
    FOREIGN KEY (`authors_id`)
    REFERENCES `blogs`.`authors` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
