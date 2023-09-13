-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyectobd122021
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectobd122021
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectobd122021` DEFAULT CHARACTER SET utf8 ;
USE `proyectobd122021` ;

-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_APLICACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_APLICACION` (
  `PK_id_aplicacion` INT(11) NOT NULL,
  `nombre_aplicacion` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion_aplicacion` VARCHAR(200) NULL DEFAULT NULL,
  `no_reporteAsociado` INT(11) NULL DEFAULT NULL,
  `estado_aplicacion` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_aplicacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_MODULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_MODULO` (
  `PK_id_Modulo` INT(11) NOT NULL,
  `nombre_modulo` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion_modulo` VARCHAR(200) NULL DEFAULT NULL,
  `estado_modulo` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_Modulo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_APLICACION_A_MODULOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_APLICACION_A_MODULOS` (
  `PK_id_modulo` INT(25) NOT NULL,
  `PK_id_aplicacion` INT(11) NOT NULL,
  PRIMARY KEY (`PK_id_modulo`, `PK_id_aplicacion`),
  INDEX `fk_tbl_aplicacion_a_modulos_aplicacion1` (`PK_id_aplicacion` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_aplicacion_a_modulos_aplicacion1`
    FOREIGN KEY (`PK_id_aplicacion`)
    REFERENCES `proyectobd122021`.`tbl_APLICACION` (`PK_id_aplicacion`),
  CONSTRAINT `fk_tbl_aplicacion_a_modulos_modulo`
    FOREIGN KEY (`PK_id_modulo`)
    REFERENCES `proyectobd122021`.`tbl_MODULO` (`PK_id_Modulo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_BITACORA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_BITACORA` (
  `PK_id_bitacora` INT(11) NOT NULL AUTO_INCREMENT,
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `fecha` VARCHAR(25) NULL DEFAULT NULL,
  `hora` VARCHAR(25) NULL DEFAULT NULL,
  `host1` VARCHAR(45) NULL DEFAULT NULL,
  `ip` VARCHAR(25) NULL DEFAULT NULL,
  `accion` VARCHAR(50) NULL DEFAULT NULL,
  `tabla` VARCHAR(45) NULL DEFAULT NULL,
  `PK_id_Modulo` INT(25) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_bitacora`),
  INDEX `fk_PK_id_Modulo` (`PK_id_Modulo` ASC) VISIBLE,
  CONSTRAINT `fk_PK_id_Modulo`
    FOREIGN KEY (`PK_id_Modulo`)
    REFERENCES `proyectobd122021`.`tbl_MODULO` (`PK_id_Modulo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_PERFIL_ENCABEZADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_PERFIL_ENCABEZADO` (
  `PK_id_perfil` INT(11) NOT NULL,
  `nombre_perfil` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion_perfil` VARCHAR(200) NULL DEFAULT NULL,
  `estado_perfil` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_perfil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_PERFIL_DETALLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_PERFIL_DETALLE` (
  `PK_id_perfil` INT(11) NOT NULL,
  `PK_id_aplicacion` INT(11) NOT NULL,
  `ingresar` TINYINT(4) NULL DEFAULT NULL,
  `consultar` TINYINT(4) NULL DEFAULT NULL,
  `modificar` TINYINT(4) NULL DEFAULT NULL,
  `eliminar` TINYINT(4) NULL DEFAULT NULL,
  `imprimir` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_perfil`, `PK_id_aplicacion`),
  INDEX `fk_Perfil_detalle_Aplicacion1` (`PK_id_aplicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_detalle_Aplicacion1`
    FOREIGN KEY (`PK_id_aplicacion`)
    REFERENCES `proyectobd122021`.`tbl_APLICACION` (`PK_id_aplicacion`),
  CONSTRAINT `fk_Perfil_detalle_Perfil1`
    FOREIGN KEY (`PK_id_perfil`)
    REFERENCES `proyectobd122021`.`tbl_PERFIL_ENCABEZADO` (`PK_id_perfil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_USUARIO` (
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `nombre_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `apellido_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `username_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `password_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `correo_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `cambio_password` TINYINT(4) NULL DEFAULT NULL,
  `estado_usuario` TINYINT(4) NULL DEFAULT NULL,
  `ultima_conexion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_USUARIO_APLICACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_USUARIO_APLICACION` (
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `PK_id_aplicacion` INT(11) NOT NULL,
  `ingresar` TINYINT(4) NULL DEFAULT NULL,
  `consulta` TINYINT(4) NULL DEFAULT NULL,
  `modificar` TINYINT(4) NULL DEFAULT NULL,
  `eliminar` TINYINT(4) NULL DEFAULT NULL,
  `imprimir` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_usuario`, `PK_id_aplicacion`),
  INDEX `fk_tbl_usuario_aplicacion_tbl_aplicacion1` (`PK_id_aplicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_aplicacion_Usuario1`
    FOREIGN KEY (`PK_id_usuario`)
    REFERENCES `proyectobd122021`.`tbl_USUARIO` (`PK_id_usuario`),
  CONSTRAINT `fk_tbl_usuario_aplicacion_tbl_aplicacion1`
    FOREIGN KEY (`PK_id_aplicacion`)
    REFERENCES `proyectobd122021`.`tbl_APLICACION` (`PK_id_aplicacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_USUARIO_PERFIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_USUARIO_PERFIL` (
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `PK_id_perfil` INT(11) NOT NULL,
  PRIMARY KEY (`PK_id_usuario`, `PK_id_perfil`),
  INDEX `fk_Usuario_perfil_Perfil1` (`PK_id_perfil` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_perfil_Perfil1`
    FOREIGN KEY (`PK_id_perfil`)
    REFERENCES `proyectobd122021`.`tbl_PERFIL_ENCABEZADO` (`PK_id_perfil`),
  CONSTRAINT `fk_Usuario_perfil_Usuario1`
    FOREIGN KEY (`PK_id_usuario`)
    REFERENCES `proyectobd122021`.`tbl_USUARIO` (`PK_id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
