-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS BD_reporteador;
-- LA CONEXION A ODBC DEBE DE IR CON EL NOMBRE "BD_reporteador"
-- Usar la base de datos
USE BD_reporteador;

-- Crear la tabla Estados
CREATE TABLE tbl_estados (
    pk_id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nbr_info_estado VARCHAR(50),
    nbr_num_estado INT
);

-- Crear la tabla Reportes
CREATE TABLE tbl_reportes (
    pk_id_reporte INT AUTO_INCREMENT PRIMARY KEY,
    nbr_correlativo VARCHAR(50),
    nbr_nombre VARCHAR(50),
    fk_estado INT,
    nbr_fecha DATETIME,
    nbr_archivo longblob,
    nbr_fechaMod datetime,
    FOREIGN KEY (fk_estado) REFERENCES tbl_estados(pk_id_estado)
);
-- HACER PRIMERO LA CREACION DE LAS TABLAS
-- DESPUES DE CREARLAS, INGRESAR DATOS DE LA TABLA ESTADOS DEFINIDOS A CONTINUACION
insert into `tbl_estados` (`pk_id_estado`, `nbr_info_estado`, `nbr_num_estado`) VALUES 
(1, 'Activo', 1),(2, 'Eliminado', 2), (3, 'Modificado', 3) ;

-- CUANDO YA ESTEN LOS DATOS CREADOS DENTRO DE LA TABLA DE ESTADOS, CREAR LOS DATOS INICIALES PARA LA TABLA REPORTES
insert into `tbl_reportes` (`pk_id_reporte`, `nbr_correlativo`, `nbr_nombre`, `fk_estado`, `nbr_fecha`) VALUES 
(2, 2120923, 'planilla.txt', 1, 2023-09-12);

-- TENIENDO YA TODO CREADO E INGRESADO, HACER EL SELECT DE LA TABLA REPORTES Y YA SE PUEDE TRABAJAR CON EL PROGRAMA EN CONJUNTO
select * from tbl_reportes;