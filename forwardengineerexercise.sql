-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `idpatient` INT NOT NULL,
  `patientname` VARCHAR(45) NULL,
  `patientsyndrome` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `diagnoseAge` INT NULL,
  PRIMARY KEY (`idpatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`chromosome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chromosome` (
  `idchromosome` INT NOT NULL,
  `chromosome` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `descriptionGene` VARCHAR(45) NULL,
  PRIMARY KEY (`idchromosome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `idsyndrome` INT NOT NULL,
  `idpatient` INT NULL,
  `idchromosome` INT NULL,
  `description syndrome` VARCHAR(45) NULL,
  PRIMARY KEY (`idsyndrome`),
  INDEX `fk_syndrome_1_idx` (`idpatient` ASC) VISIBLE,
  INDEX `fk_syndrome_2_idx` (`idchromosome` ASC) VISIBLE,
  CONSTRAINT `fk_syndrome_1`
    FOREIGN KEY (`idpatient`)
    REFERENCES `mydb`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_syndrome_2`
    FOREIGN KEY (`idchromosome`)
    REFERENCES `mydb`.`chromosome` (`idchromosome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
