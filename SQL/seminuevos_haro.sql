-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema seminuevos_haro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema seminuevos_haro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `seminuevos_haro` DEFAULT CHARACTER SET utf8;
USE `seminuevos_haro` ;

-- -----------------------------------------------------
-- Table `seminuevos_haro`.`electrico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`electrico` (
  `idElectrico` INT NOT NULL AUTO_INCREMENT,
  `electrico` VARCHAR(45) NULL,
  PRIMARY KEY (`idElectrico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`year` (
  `idYear` INT NOT NULL AUTO_INCREMENT,
  `year` INT NULL,
  PRIMARY KEY (`idYear`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`interiores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`interiores` (
  `idInteriores` INT NOT NULL AUTO_INCREMENT,
  `interiores` VARCHAR(45) NULL,
  PRIMARY KEY (`idInteriores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`frenos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`frenos` (
  `idFrenos` INT NOT NULL AUTO_INCREMENT,
  `frenos` VARCHAR(45) NULL,
  PRIMARY KEY (`idFrenos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`quemacocos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`quemacocos` (
  `idQuemacocos` INT NOT NULL AUTO_INCREMENT,
  `quemacocos` VARCHAR(45) NULL,
  PRIMARY KEY (`idQuemacocos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`color` (
  `idColor` INT NOT NULL AUTO_INCREMENT,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idColor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`transmision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`transmision` (
  `idTransmision` INT NOT NULL AUTO_INCREMENT,
  `transmision` VARCHAR(45) NULL,
  PRIMARY KEY (`idTransmision`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`traccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`traccion` (
  `idTraccion` INT NOT NULL AUTO_INCREMENT,
  `traccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idTraccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`auto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`auto` (
  `idAuto` INT NOT NULL AUTO_INCREMENT,
  `precio` INT NULL,
  `Modelo` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `cilindraje` INT NULL,
  `Kilometraje` INT NULL,
  `Motor_desc` VARCHAR(45) NULL,
  `disponible` INT NULL,
  `marca_idMarca` INT NOT NULL,
  `frenos_idFrenos` INT NOT NULL,
  `interiores_idInteriores` INT NOT NULL,
  `quemacocos_idQuemacocos` INT NOT NULL,
  `year_idYear` INT NOT NULL,
  `color_idColor` INT NOT NULL,
  `electrico_idElectrico` INT NOT NULL,
  `transmision_idTransmision` INT NOT NULL,
  `traccion_idTraccion` INT NOT NULL,
  PRIMARY KEY (`idAuto`),
  INDEX `fk_auto_marca_idx` (`marca_idMarca` ASC) ,
  INDEX `fk_auto_frenos1_idx` (`frenos_idFrenos` ASC) ,
  INDEX `fk_auto_interiores1_idx` (`interiores_idInteriores` ASC) ,
  INDEX `fk_auto_quemacocos1_idx` (`quemacocos_idQuemacocos` ASC) ,
  INDEX `fk_auto_year1_idx` (`year_idYear` ASC) ,
  INDEX `fk_auto_color1_idx` (`color_idColor` ASC) ,
  INDEX `fk_auto_electrico1_idx` (`electrico_idElectrico` ASC) ,
  INDEX `fk_auto_transmision1_idx` (`transmision_idTransmision` ASC) ,
  INDEX `fk_auto_traccion1_idx` (`traccion_idTraccion` ASC) ,
  CONSTRAINT `fk_auto_marca`
    FOREIGN KEY (`marca_idMarca`)
    REFERENCES `seminuevos_haro`.`marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_frenos1`
    FOREIGN KEY (`frenos_idFrenos`)
    REFERENCES `seminuevos_haro`.`frenos` (`idFrenos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_interiores1`
    FOREIGN KEY (`interiores_idInteriores`)
    REFERENCES `seminuevos_haro`.`interiores` (`idInteriores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_quemacocos1`
    FOREIGN KEY (`quemacocos_idQuemacocos`)
    REFERENCES `seminuevos_haro`.`quemacocos` (`idQuemacocos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_year1`
    FOREIGN KEY (`year_idYear`)
    REFERENCES `seminuevos_haro`.`year` (`idYear`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_color1`
    FOREIGN KEY (`color_idColor`)
    REFERENCES `seminuevos_haro`.`color` (`idColor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_electrico1`
    FOREIGN KEY (`electrico_idElectrico`)
    REFERENCES `seminuevos_haro`.`electrico` (`idElectrico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_transmision1`
    FOREIGN KEY (`transmision_idTransmision`)
    REFERENCES `seminuevos_haro`.`transmision` (`idTransmision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_traccion1`
    FOREIGN KEY (`traccion_idTraccion`)
    REFERENCES `seminuevos_haro`.`traccion` (`idTraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seminuevos_haro`.`imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seminuevos_haro`.`imagenes` (
  `idImagenes` INT NOT NULL AUTO_INCREMENT,
  `imagenes` VARCHAR(1000) NULL,
  `auto_idAuto` INT NOT NULL,
  PRIMARY KEY (`idImagenes`),
  INDEX `fk_imagenes_auto1_idx` (`auto_idAuto` ASC) ,
  CONSTRAINT `fk_imagenes_auto1`
    FOREIGN KEY (`auto_idAuto`)
    REFERENCES `seminuevos_haro`.`auto` (`idAuto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
