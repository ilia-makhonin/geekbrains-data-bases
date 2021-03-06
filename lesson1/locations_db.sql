-- MySQL Script generated by MySQL Workbench
-- Thu May  3 03:10:49 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema location_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema location_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `location_db` DEFAULT CHARACTER SET utf8 ;
USE `location_db` ;

-- -----------------------------------------------------
-- Table `location_db`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_db`.`country` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location_db`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_db`.`states` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `state_name` VARCHAR(45) NOT NULL,
  `country_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_states_country_idx` (`country_id` ASC),
  CONSTRAINT `fk_states_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `location_db`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location_db`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_db`.`region` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_name` VARCHAR(45) NOT NULL,
  `states_id` INT UNSIGNED NOT NULL,
  `country_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_region_states1_idx` (`states_id` ASC),
  INDEX `fk_region_country1_idx` (`country_id` ASC),
  CONSTRAINT `fk_region_states1`
    FOREIGN KEY (`states_id`)
    REFERENCES `location_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_region_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `location_db`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location_db`.`city_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_db`.`city_type` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location_db`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_db`.`city` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(50) NOT NULL,
  `city_type` VARCHAR(45) NOT NULL,
  `city_type_id` TINYINT UNSIGNED NOT NULL,
  `region_id` INT UNSIGNED NULL,
  `states_id` INT UNSIGNED NOT NULL,
  `country_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_city_city_type1_idx` (`city_type_id` ASC),
  INDEX `fk_city_region1_idx` (`region_id` ASC),
  INDEX `fk_city_states1_idx` (`states_id` ASC),
  INDEX `fk_city_country1_idx` (`country_id` ASC),
  CONSTRAINT `fk_city_city_type1`
    FOREIGN KEY (`city_type_id`)
    REFERENCES `location_db`.`city_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_city_region1`
    FOREIGN KEY (`region_id`)
    REFERENCES `location_db`.`region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_city_states1`
    FOREIGN KEY (`states_id`)
    REFERENCES `location_db`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_city_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `location_db`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
