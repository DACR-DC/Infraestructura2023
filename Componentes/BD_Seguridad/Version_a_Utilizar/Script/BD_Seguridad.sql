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
  `PK_id_aplicacion` INT NOT NULL AUTO_INCREMENT,
  `nbr_nombre_aplicacion` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_descripcion_aplicacion` VARCHAR(200) NULL DEFAULT NULL,
  `nbr_no_reporteAsociado` INT NULL DEFAULT NULL,
  `nbr_estado_aplicacion` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_aplicacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_MODULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_MODULO` (
  `PK_id_Modulo` INT NOT NULL AUTO_INCREMENT,
  `nbr_nombre_modulo` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_descripcion_modulo` VARCHAR(200) NULL DEFAULT NULL,
  `nbr_estado_modulo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_Modulo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_APLICACION_A_MODULOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_APLICACION_A_MODULOS` (
  `FK_id_modulo` INT NOT NULL,
  `FK_id_aplicacion` INT NOT NULL,
  PRIMARY KEY (`FK_id_modulo`, `FK_id_aplicacion`),
  INDEX `fk_tbl_aplicacion_a_modulos_aplicacion1` (`FK_id_aplicacion` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_aplicacion_a_modulos_aplicacion1`
    FOREIGN KEY (`FK_id_aplicacion`)
    REFERENCES `proyectobd122021`.`tbl_APLICACION` (`PK_id_aplicacion`),
  CONSTRAINT `fk_tbl_aplicacion_a_modulos_modulo`
    FOREIGN KEY (`FK_id_modulo`)
    REFERENCES `proyectobd122021`.`tbl_MODULO` (`PK_id_Modulo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_USUARIO` (
  `PK_id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nbr_nombre_usuario` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_apellido_usuario` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_username_usuario` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_password_usuario` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_correo_usuario` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_cambio_password` INT NULL DEFAULT NULL,
  `nbr_estado_usuario` INT NULL DEFAULT NULL,
  `nbr_ultima_conexion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_BITACORA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_BITACORA` (
  `PK_id_bitacora` INT NOT NULL AUTO_INCREMENT,
  `nbr_fecha` DATE NULL DEFAULT NULL,
  `nbr_hora` TIME NULL DEFAULT NULL,
  `nbr_host1` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_ip` VARCHAR(25) NULL DEFAULT NULL,
  `nbr_accion` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_tabla` VARCHAR(50) NULL DEFAULT NULL,
  `FK_id_Modulo` INT NOT NULL,
  `FK_id_usuario` INT NOT NULL,
  PRIMARY KEY (`PK_id_bitacora`),
  INDEX `fk_PK_id_Modulo` (`FK_id_Modulo` ASC) VISIBLE,
  INDEX `fk_tbl_BITACORA_tbl_USUARIO1_idx` (`FK_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_PK_id_Modulo`
    FOREIGN KEY (`FK_id_Modulo`)
    REFERENCES `proyectobd122021`.`tbl_MODULO` (`PK_id_Modulo`),
  CONSTRAINT `fk_tbl_BITACORA_tbl_USUARIO1`
    FOREIGN KEY (`FK_id_usuario`)
    REFERENCES `proyectobd122021`.`tbl_USUARIO` (`PK_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_PERFIL_ENCABEZADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_PERFIL_ENCABEZADO` (
  `PK_id_perfil` INT NOT NULL AUTO_INCREMENT,
  `nbr_nombre_perfil` VARCHAR(50) NULL DEFAULT NULL,
  `nbr_descripcion_perfil` VARCHAR(200) NULL DEFAULT NULL,
  `nbr_estado_perfil` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_perfil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_PERFIL_DETALLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_PERFIL_DETALLE` (
  `FK_id_perfil` INT NOT NULL,
  `FK_id_aplicacion` INT NOT NULL,
  `nbr_ingresar` INT NULL DEFAULT NULL,
  `nbr_consultar` INT NULL DEFAULT NULL,
  `nbr_modificar` INT NULL DEFAULT NULL,
  `nbr_eliminar` INT NULL DEFAULT NULL,
  `nbr_imprimir` INT NULL DEFAULT NULL,
  PRIMARY KEY (`FK_id_perfil`, `FK_id_aplicacion`),
  INDEX `fk_Perfil_detalle_Aplicacion1` (`FK_id_aplicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_detalle_Aplicacion1`
    FOREIGN KEY (`FK_id_aplicacion`)
    REFERENCES `proyectobd122021`.`tbl_APLICACION` (`PK_id_aplicacion`),
  CONSTRAINT `fk_Perfil_detalle_Perfil1`
    FOREIGN KEY (`FK_id_perfil`)
    REFERENCES `proyectobd122021`.`tbl_PERFIL_ENCABEZADO` (`PK_id_perfil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_USUARIO_APLICACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_USUARIO_APLICACION` (
  `FK_id_usuario` INT NOT NULL,
  `FK_id_aplicacion` INT NOT NULL,
  `nbr_ingresar` INT NULL DEFAULT NULL,
  `nbr_consulta` INT NULL DEFAULT NULL,
  `nbr_modificar` INT NULL DEFAULT NULL,
  `nbr_eliminar` INT NULL DEFAULT NULL,
  `nbr_imprimir` INT NULL DEFAULT NULL,
  PRIMARY KEY (`FK_id_usuario`, `FK_id_aplicacion`),
  INDEX `fk_tbl_usuario_aplicacion_tbl_aplicacion1` (`FK_id_aplicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_aplicacion_Usuario1`
    FOREIGN KEY (`FK_id_usuario`)
    REFERENCES `proyectobd122021`.`tbl_USUARIO` (`PK_id_usuario`),
  CONSTRAINT `fk_tbl_usuario_aplicacion_tbl_aplicacion1`
    FOREIGN KEY (`FK_id_aplicacion`)
    REFERENCES `proyectobd122021`.`tbl_APLICACION` (`PK_id_aplicacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectobd122021`.`tbl_USUARIO_PERFIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectobd122021`.`tbl_USUARIO_PERFIL` (
  `FK_id_usuario` INT NOT NULL,
  `FK_id_perfil` INT NOT NULL,
  PRIMARY KEY (`FK_id_usuario`, `FK_id_perfil`),
  INDEX `fk_Usuario_perfil_Perfil1` (`FK_id_perfil` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_perfil_Perfil1`
    FOREIGN KEY (`FK_id_perfil`)
    REFERENCES `proyectobd122021`.`tbl_PERFIL_ENCABEZADO` (`PK_id_perfil`),
  CONSTRAINT `fk_Usuario_perfil_Usuario1`
    FOREIGN KEY (`FK_id_usuario`)
    REFERENCES `proyectobd122021`.`tbl_USUARIO` (`PK_id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
