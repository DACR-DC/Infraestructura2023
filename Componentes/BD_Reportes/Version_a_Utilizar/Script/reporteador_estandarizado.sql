-- Autores: Jorge García 0901-20-14138, Luis Franco 0901-20-23979, Rodrigo Ixcotoyac 0901-20-4762
-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS BD_reporteador;
-- LA CONEXION A ODBC DEBE DE IR CON EL NOMBRE "BD_reporteador"
-- Usar la base de datos
USE BD_reporteador;

-- Crear la tabla Estados
CREATE TABLE tbl_estados (
    pk_id_estado INT AUTO_INCREMENT PRIMARY KEY,
    est_info_estado VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    est_num_estado INT
);

-- Crear la tabla Reportes
CREATE TABLE tbl_reportes (
    pk_id_reporte INT AUTO_INCREMENT PRIMARY KEY,
    rep_correlativo INT UNIQUE,
    rep_nombre VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    fk_estado INT,
    rep_fecha DATETIME,
    rep_archivo VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    rep_fechaMod datetime,
    FOREIGN KEY (fk_estado) REFERENCES tbl_estados(pk_id_estado)
)ENGINE = InnoDB CHARACTER SET = utf8 collate = utf8_general_ci;
-- HACER PRIMERO LA CREACION DE LAS TABLAS
-- DESPUES DE CREARLAS, INGRESAR DATOS DE LA TABLA ESTADOS DEFINIDOS A CONTINUACION
insert into `tbl_estados` (`pk_id_estado`, `est_info_estado`, `est_num_estado`) VALUES 
(1, 'Activo', 1),(2, 'Eliminado', 2), (3, 'Modificado', 3) ;

-- CUANDO YA ESTEN LOS DATOS CREADOS DENTRO DE LA TABLA DE ESTADOS, CREAR LOS DATOS INICIALES PARA LA TABLA REPORTES
insert into `tbl_reportes` (`pk_id_reporte`, `rep_correlativo`, `rep_nombre`, `fk_estado`) VALUES 
(10, 10002, 'planilssla.txt', 1);

-- TENIENDO YA TODO CREADO E INGRESADO, HACER EL SELECT DE LA TABLA REPORTES Y YA SE PUEDE TRABAJAR CON EL PROGRAMA EN CONJUNTO
select * from tbl_reportes;