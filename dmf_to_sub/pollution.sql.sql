-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pollution.db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pollution.db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pollution.db` DEFAULT CHARACTER SET utf8 ;
USE `pollution.db` ;

-- -----------------------------------------------------
-- Table `pollution.db`.`locationentity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pollution.db`.`locationentity` ;

CREATE TABLE IF NOT EXISTS `pollution.db`.`locationentity` (
  `idlocation entity` INT NOT NULL,
  `geo_point_2d` VARCHAR(30) NOT NULL,
  `name` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idlocation entity`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pollution.db`.`schemer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pollution.db`.`schemer` ;

CREATE TABLE IF NOT EXISTS `pollution.db`.`schemer` (
  `id` INT NOT NULL,
  `measure` VARCHAR(45) NOT NULL,
  `discription` VARCHAR(45) NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `measure`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pollution.db`.`reading`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pollution.db`.`reading` ;

CREATE TABLE IF NOT EXISTS `pollution.db`.`reading` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nox` FLOAT(10,6) NULL,
  `no2` FLOAT(10,6) NULL,
  `locationid` INT NOT NULL,
  `datetime` DATE NULL,
  `pm10` FLOAT(10,6) NULL,
  `nvpm10` FLOAT(10,6) NULL,
  `vpm10` FLOAT(10,6) NULL,
  `nvpm25` FLOAT(10,6) NULL,
  `vpm25` FLOAT(10,6) NULL,
  `co` FLOAT(10,6) NULL,
  `o3` FLOAT(10,6) NULL,
  `so2` FLOAT(10,6) NULL,
  `temperature` FLOAT(10,6) NULL,
  `rh` FLOAT(10,6) NULL,
  `airpressure` FLOAT(10,6) NULL,
  `datestart` DATETIME NULL,
  `date_end` DATETIME NULL,
  `current` TINYINT NULL,
  `instrument_type` VARCHAR(35) NULL,
  `pm25` FLOAT(10,6) NULL,
  `no` FLOAT(10,6) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_location_reading `
    FOREIGN KEY (`id`)
    REFERENCES `pollution.db`.`locationentity` (`idlocation entity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
