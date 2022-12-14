-- MySQL Script generated by MySQL Workbench
-- Fri Oct 21 21:26:00 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio3 TP4
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Ejercicio3 TP4` ;

-- -----------------------------------------------------
-- Schema Ejercicio3 TP4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio3 TP4` DEFAULT CHARACTER SET utf8 ;
USE `Ejercicio3 TP4` ;

-- -----------------------------------------------------
-- Table `Ejercicio3 TP4`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3 TP4`.`Cliente` (
  `id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio3 TP4`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3 TP4`.`Reserva` (
  `id_Reserva` INT NOT NULL AUTO_INCREMENT,
  `Fecha_inicio` DATE NOT NULL,
  `Fecha_final` DATE NOT NULL,
  `Precio_total` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Reserva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio3 TP4`.`Coche`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3 TP4`.`Coche` (
  `idCoche` INT NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCoche`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio3 TP4`.`Reserva_has_Coche`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3 TP4`.`Reserva_has_Coche` (
  `Reserva_id_Reserva` INT NOT NULL,
  `Coche_idCoche` INT NOT NULL,
  `Litros_gasolina` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Reserva_id_Reserva`, `Coche_idCoche`),
  CONSTRAINT `fk_Reserva_has_Coche_Reserva1`
    FOREIGN KEY (`Reserva_id_Reserva`)
    REFERENCES `Ejercicio3 TP4`.`Reserva` (`id_Reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_has_Coche_Coche1`
    FOREIGN KEY (`Coche_idCoche`)
    REFERENCES `Ejercicio3 TP4`.`Coche` (`idCoche`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Reserva_has_Coche_Coche1_idx` ON `Ejercicio3 TP4`.`Reserva_has_Coche` (`Coche_idCoche` ASC) VISIBLE;

CREATE INDEX `fk_Reserva_has_Coche_Reserva1_idx` ON `Ejercicio3 TP4`.`Reserva_has_Coche` (`Reserva_id_Reserva` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Ejercicio3 TP4`.`Cliente_has_Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3 TP4`.`Cliente_has_Reserva` (
  `Cliente_id_Cliente` INT NOT NULL,
  `Reserva_id_Reserva` INT NOT NULL,
  PRIMARY KEY (`Cliente_id_Cliente`, `Reserva_id_Reserva`),
  CONSTRAINT `fk_Cliente_has_Reserva_Cliente1`
    FOREIGN KEY (`Cliente_id_Cliente`)
    REFERENCES `Ejercicio3 TP4`.`Cliente` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Reserva_Reserva1`
    FOREIGN KEY (`Reserva_id_Reserva`)
    REFERENCES `Ejercicio3 TP4`.`Reserva` (`id_Reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cliente_has_Reserva_Reserva1_idx` ON `Ejercicio3 TP4`.`Cliente_has_Reserva` (`Reserva_id_Reserva` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_has_Reserva_Cliente1_idx` ON `Ejercicio3 TP4`.`Cliente_has_Reserva` (`Cliente_id_Cliente` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
