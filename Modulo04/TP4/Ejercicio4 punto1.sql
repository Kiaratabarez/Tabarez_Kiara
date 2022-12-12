-- MySQL Script generated by MySQL Workbench
-- Fri Oct 21 21:13:54 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio1 TP4
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Ejercicio1 TP4` ;

-- -----------------------------------------------------
-- Schema Ejercicio1 TP4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio1 TP4` DEFAULT CHARACTER SET utf8 ;
USE `Ejercicio1 TP4` ;

-- -----------------------------------------------------
-- Table `Ejercicio1 TP4`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1 TP4`.`Alumnos` (
  `Cod_Matricula` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Alumno` VARCHAR(50) NOT NULL,
  `DNI` INT NOT NULL,
  `Fecha_Nacimiento` DATE NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Cod_Matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio1 TP4`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1 TP4`.`Curso` (
  `Cod_Curso` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Cod_Curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio1 TP4`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1 TP4`.`Profesor` (
  `ID_Profesor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Especialidad` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Profesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio1 TP4`.`Alumnos_has_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1 TP4`.`Alumnos_has_Curso` (
  `Alumnos_Cod_Matricula` INT NOT NULL,
  `Curso_Cod_Curso` INT NOT NULL,
  PRIMARY KEY (`Alumnos_Cod_Matricula`, `Curso_Cod_Curso`),
  CONSTRAINT `fk_Alumnos_has_Curso_Alumnos1`
    FOREIGN KEY (`Alumnos_Cod_Matricula`)
    REFERENCES `Ejercicio1 TP4`.`Alumnos` (`Cod_Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_has_Curso_Curso1`
    FOREIGN KEY (`Curso_Cod_Curso`)
    REFERENCES `Ejercicio1 TP4`.`Curso` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Alumnos_has_Curso_Curso1_idx` ON `Ejercicio1 TP4`.`Alumnos_has_Curso` (`Curso_Cod_Curso` ASC) VISIBLE;

CREATE INDEX `fk_Alumnos_has_Curso_Alumnos1_idx` ON `Ejercicio1 TP4`.`Alumnos_has_Curso` (`Alumnos_Cod_Matricula` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Ejercicio1 TP4`.`Curso_has_Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1 TP4`.`Curso_has_Profesor` (
  `Curso_Cod_Curso` INT NOT NULL,
  `Profesor_ID_Profesor` INT NOT NULL,
  PRIMARY KEY (`Curso_Cod_Curso`, `Profesor_ID_Profesor`),
  CONSTRAINT `fk_Curso_has_Profesor_Curso1`
    FOREIGN KEY (`Curso_Cod_Curso`)
    REFERENCES `Ejercicio1 TP4`.`Curso` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Profesor_Profesor1`
    FOREIGN KEY (`Profesor_ID_Profesor`)
    REFERENCES `Ejercicio1 TP4`.`Profesor` (`ID_Profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Curso_has_Profesor_Profesor1_idx` ON `Ejercicio1 TP4`.`Curso_has_Profesor` (`Profesor_ID_Profesor` ASC) VISIBLE;
CREATE INDEX `fk_Curso_has_Profesor_Curso1_idx` ON `Ejercicio1 TP4`.`Curso_has_Profesor` (`Curso_Cod_Curso` ASC) VISIBLE;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio2 TP4
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Ejercicio2 TP4` ;

-- -----------------------------------------------------
-- Schema Ejercicio2 TP4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio2 TP4` DEFAULT CHARACTER SET utf8 ;
USE `Ejercicio2 TP4` ;

-- -----------------------------------------------------
-- Table `Ejercicio2 TP4`.`Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2 TP4`.`Localidad` (
  `ID_Localidad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Codigo_Postal` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_Localidad`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ejercicio2 TP4`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2 TP4`.`Provincia` (
  `ID_Provincia` INT NOT NULL,
  `Nombre_Provincia` VARCHAR(45) NOT NULL,
  `Localidad_ID_Localidad` INT NOT NULL,
  PRIMARY KEY (`ID_Provincia`),
  CONSTRAINT `fk_Provincia_Localidad1`
    FOREIGN KEY (`Localidad_ID_Localidad`)
    REFERENCES `Ejercicio3 TP4`.`Localidad` (`ID_Localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Provincia_Localidad1_idx` ON `Ejercicio2 TP4`.`Provincia` (`Localidad_ID_Localidad` ASC) VISIBLE;

-- -----------------------------------------------------
-- Table `Ejercicio3 TP4`.`País`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2 TP4`.`País` (
  `ID_País` INT NOT NULL,
  `Nombre_pais` VARCHAR(45) NOT NULL,
  `Provincia_ID_Provincia` INT NOT NULL,
  PRIMARY KEY (`ID_País`),
  CONSTRAINT `fk_País_Provincia1`
    FOREIGN KEY (`Provincia_ID_Provincia`)
    REFERENCES `Ejercicio2 TP4`.`Provincia` (`ID_Provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_País_Provincia1_idx` ON `Ejercicio2 TP4`.`País` (`Provincia_ID_Provincia` ASC) VISIBLE;

-- -----------------------------------------------------
-- Table `Ejercicio2 TP4`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2 TP4`.`Empleado` (
  `ID_Empleado` INT NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Fecha_Alta` VARCHAR(45) NOT NULL,
  `Localidad_ID_Localidad` INT NOT NULL,
  PRIMARY KEY (`ID_Empleado`),
  CONSTRAINT `fk_Empleado_Localidad1`
    FOREIGN KEY (`Localidad_ID_Localidad`)
    REFERENCES `Ejercicio2 TP4`.`Localidad` (`ID_Localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Empleado_Localidad1_idx` ON `Ejercicio2 TP4`.`Empleado` (`Localidad_ID_Localidad` ASC) VISIBLE;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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

