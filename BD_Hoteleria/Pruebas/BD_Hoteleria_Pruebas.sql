-- Schema BD_Hoteleria_Pruebas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_Hoteleria_Pruebas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `BD_Hoteleria_Pruebas` ;
-- Crear la tabla Estados
-- Crear la tabla Estados

-- Reporteador
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

-- Fin Reporteador

/*-----------Seguridad-----------*/

DROP TABLE IF EXISTS tbl_modulos;
CREATE TABLE IF NOT EXISTS tbl_modulos (
	pk_id_modulos INT NOT NULL,
    nombre_modulo VARCHAR(50) NOT NULL,
    descripcion_modulo VARCHAR(150) NOT NULL,
    estado_modulo TINYINT DEFAULT 0,
    primary key (pk_id_modulos)
);

DROP TABLE IF EXISTS tbl_aplicaciones;
CREATE TABLE IF NOT EXISTS tbl_aplicaciones (
	pk_id_aplicacion INT NOT NULL,
    nombre_aplicacion VARCHAR(50) NOT NULL,
    descripcion_aplicacion VARCHAR(150) NOT NULL,
    estado_aplicacion TINYINT DEFAULT 0,
    primary key (pk_id_aplicacion)
);

DROP TABLE IF EXISTS tbl_AsignacionModuloAplicacion;
CREATE TABLE IF NOT EXISTS tbl_AsignacionModuloAplicacion (
  fk_id_modulos INT NOT NULL,
  fk_id_aplicacion INT NOT NULL, 
  PRIMARY KEY (fk_id_modulos,fk_id_aplicacion ),
  FOREIGN KEY (fk_id_modulos) REFERENCES tbl_modulos (pk_id_modulos),
  FOREIGN KEY (fk_id_aplicacion) REFERENCES tbl_aplicaciones (pk_id_aplicacion)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_usuarios;
CREATE TABLE IF NOT EXISTS tbl_usuarios (
  pk_id_usuario INT AUTO_INCREMENT NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL,
  apellido_usuario VARCHAR(50) NOT NULL,
  username_usuario VARCHAR(20) NOT NULL,
  password_usuario VARCHAR(100) NOT NULL,
  email_usuario VARCHAR(50) NOT NULL,
  estado_usuario TINYINT DEFAULT 0 NOT NULL,
  pregunta varchar(50) not null,
  respuesta varchar(50) not null,
  PRIMARY KEY (pk_id_usuario)
);

DROP TABLE IF EXISTS tbl_perfiles;
CREATE TABLE IF NOT EXISTS tbl_perfiles (
	pk_id_perfil INT AUTO_INCREMENT NOT NULL,
    nombre_perfil VARCHAR(50) NOT NULL,
    descripcion_perfil VARCHAR(150) NOT NULL,
    estado_perfil TINYINT DEFAULT 0,
    primary key (pk_id_perfil)
);

DROP TABLE IF EXISTS tbl_permisosAplicacionesUsuario;
CREATE TABLE IF NOT EXISTS tbl_permisosAplicacionesUsuario (
  fk_id_aplicacion INT NOT NULL, 
  fk_id_usuario INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (fk_id_aplicacion,fk_id_usuario),
  FOREIGN KEY (fk_id_aplicacion) REFERENCES tbl_aplicaciones (pk_id_aplicacion),
  FOREIGN KEY (fk_id_usuario) REFERENCES tbl_usuarios (pk_id_usuario)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_permisosAplicacionPerfil;
CREATE TABLE IF NOT EXISTS tbl_permisosAplicacionPerfil (
  fk_id_perfil INT NOT NULL, 
  fk_id_aplicacion INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (fk_id_perfil,fk_id_aplicacion),
  FOREIGN KEY (fk_id_aplicacion) REFERENCES tbl_aplicaciones (pk_id_aplicacion),
  FOREIGN KEY (fk_id_perfil) REFERENCES tbl_perfiles (pk_id_perfil)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_asignacionesPerfilsUsuario;
CREATE TABLE IF NOT EXISTS tbl_asignacionesPerfilsUsuario (
  fk_id_usuario INT NOT NULL, 
  fk_id_perfil INT NOT NULL,
  PRIMARY KEY (fk_id_usuario,fk_id_perfil ),
  FOREIGN KEY (fk_id_usuario) REFERENCES tbl_usuarios (pk_id_usuario),
  FOREIGN KEY (fk_id_perfil) REFERENCES tbl_perfiles (pk_id_perfil)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_bitacoraDeEventos;
CREATE TABLE IF NOT EXISTS tbl_bitacoraDeEventos (
  pk_id_bitacora INT AUTO_INCREMENT NOT NULL,
  fk_id_usuario INT NOT NULL,
  fk_id_aplicacion INT NOT NULL,
  fecha_bitacora DATE NOT NULL,
  hora_bitacora TIME NOT NULL,
  host_bitacora VARCHAR(45) NOT NULL,
  ip_bitacora VARCHAR(100) NOT NULL,
  accion_bitacora VARCHAR(50) NOT NULL,
  PRIMARY KEY (pk_id_bitacora),
  FOREIGN KEY (fk_id_usuario) REFERENCES tbl_usuarios (pk_id_usuario),
  FOREIGN KEY (fk_id_aplicacion) REFERENCES tbl_aplicaciones (pk_id_aplicacion)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


-- vistas Seguridad------------------------------------------------------------------------
CREATE 
VIEW BD_Hoteleria_Pruebas.vista_aplicacion_perfil AS 
    SELECT 
        b.fk_id_perfil AS ID,
        a.nombre_perfil AS Perfil,
        b.fk_id_aplicacion AS Aplicacion,
        b.guardar_permiso AS Insertar,
        b.modificar_permiso AS Modificar,
        b.eliminar_permiso AS Eliminar,
        b.buscar_permiso AS Buscar,
        b.imprimir_permiso AS Reporte
    FROM
        (BD_Hoteleria_Pruebas.tbl_permisosAplicacionPerfil b
        JOIN BD_Hoteleria_Pruebas.tbl_perfiles a ON ((a.pk_id_perfil = b.fk_id_perfil)));
        
CREATE 
VIEW BD_Hoteleria_Pruebas.vista_aplicacionusuario AS
    SELECT 
        b.fk_id_aplicacion AS Aplicacion,
        b.fk_id_usuario AS ID,
        a.nombre_usuario AS Usuario,
        b.guardar_permiso AS Insertar,
        b.modificar_permiso AS Editar,
        b.eliminar_permiso AS Eliminar,
        b.buscar_permiso AS Buscar,
        b.imprimir_permiso AS Reporte
    FROM
        (BD_Hoteleria_Pruebas.tbl_permisosAplicacionesUsuario b
        JOIN BD_Hoteleria_Pruebas.tbl_usuarios a ON ((a.pk_id_usuario = b.fk_id_usuario)));
        
CREATE 
VIEW BD_Hoteleria_Pruebas.vista_modulo_aplicacion AS
    SELECT 
        b.fk_id_modulos AS ID,
        a.nombre_modulo AS Modulo,
        b.fk_id_aplicacion AS Aplicacion,
        c.nombre_aplicacion AS Nombre,
        c.descripcion_aplicacion AS Descripcion
    FROM
        ((BD_Hoteleria_Pruebas.tbl_AsignacionModuloAplicacion b
        JOIN BD_Hoteleria_Pruebas.tbl_modulos a ON ((a.pk_id_modulos = b.fk_id_modulos)))
        JOIN BD_Hoteleria_Pruebas.tbl_aplicaciones c ON ((c.pk_id_aplicacion = b.fk_id_aplicacion)));
        
CREATE 
VIEW BD_Hoteleria_Pruebas.vista_perfil_usuario AS
    SELECT 
        b.fk_id_usuario AS ID,
        a.nombre_usuario AS Usuario,
        a.username_usuario AS nickName,
        b.fk_id_perfil AS perfil,
        c.nombre_perfil AS Nombre
    FROM
        ((BD_Hoteleria_Pruebas.tbl_asignacionesPerfilsUsuario b
        JOIN BD_Hoteleria_Pruebas.tbl_usuarios a ON ((a.pk_id_usuario = b.fk_id_usuario)))
        JOIN BD_Hoteleria_Pruebas.tbl_perfiles c ON ((c.pk_id_perfil = b.fk_id_perfil)));
-- fin Seguridad--