-- Schema BD_Hoteleria_Pruebas
-- -----------------------------------------------------
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
        ((BD_Hoteleria_Pruebas1.tbl_AsignacionModuloAplicacion b
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


/*-Cambiar por el nombre de la BD estandarizado- */

/*--------------------SEGURIDAD---------------*/
-- -----MODULOS

INSERT INTO `tbl_modulos` VALUES
('1000', 'SEGURIDAD', 'Seguridad', 1),
('5000', 'BANCOS', 'Bancos', 1)
;

-- -----APLICACIONES
INSERT INTO `tbl_aplicaciones` VALUES
('5000', 'MDI BANCOS', 'PARA BANCOS', '1'),
('5001', 'Movimientos Bancarios', 'PARA BANCOS', '1'),
('5002', 'Conciliacion Bancaria', 'PARA BANCOS', '1'),
('5003', 'Tipo de cambio', 'PARA BANCOS', '1'),
('5004', 'Disponibilidad diaria', 'PARA BANCOS', '1'),
('5005', 'Autorizacion de ordenes de compras', 'PARA BANCOS', '1'),
('5006', 'Mant. Ag.Bancos', 'PARA BANCOS', '1'),
('5007', 'Mant. Ag.Cuentas', 'PARA BANCOS', '1'),
('5008', 'Mant. Ag.Movimiento', 'PARA BANCOS', '1'),
('5009', 'Mant. Ordenes de compra', 'PARA BANCOS', '1')
;

-- -----USUARIOS
INSERT INTO `tbl_usuarios` VALUES
('1', 'admin', 'admin', 'admin', 'HO0aGo4nM94=', 'esduardo@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A=')
;

-- -----PERFILES
INSERT INTO `tbl_perfiles` VALUES
('1', 'ADMINISTRADOR', 'contiene todos los permisos del programa', 1),
('2', 'SEGURIDAD', 'contiene todos los permisos de seguridad', 1)
;

-- -----ASIGNACIÓNES MODULO A APLICACION
INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES
('5000', '5000'),
('5000', '5001'),
('5000', '5002'),
('5000', '5003'),
('5000', '5004'),
('5000', '5005'),
('5000', '5006'),
('5000', '5007'),
('5000', '5008'),
('5000', '5009')
;

-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO `tbl_permisosAplicacionPerfil` VALUES
('1', '5000', '1', '1', '1', '1', '1'),
('1', '5001', '1', '1', '1', '1', '1'),
('1', '5002', '1', '1', '1', '1', '1'),
('1', '5003', '1', '1', '1', '1', '1'),
('1', '5004', '1', '1', '1', '1', '1'),
('1', '5005', '1', '1', '1', '1', '1'),
('1', '5006', '1', '1', '1', '1', '1'),
('1', '5007', '1', '1', '1', '1', '1'),
('1', '5008', '1', '1', '1', '1', '1'),
('1', '5009', '1', '1', '1', '1', '1')
;

-- -----ASIGNACIÓN DE PERFIL A USUARIO
INSERT INTO `tbl_asignacionesPerfilsUsuario` VALUES
('1', '1')
; 



-- AUTOR: Luis Franco, Andrea Corado

-- TABLA PRINCIPAL
create table tbl_mantenimientos_agregar_bancos(
pk_manag_id_ban int auto_increment primary key,
manag_id_bancoag int, 
manag_nombre_banco varchar(100) unique,
manag_status int
);

create table tbl_monedaBanco(
pk_mon_id_moneda int auto_increment primary key,
mon_nomMoneda varchar(100) unique,
mon_status int

);
insert into `tbl_monedaBanco`( `pk_mon_id_moneda`, `mon_nomMoneda`) values 
(1, "Quetzales"),
(2, "Dólares");

create table tbl_mantenimientos_agregar_cuenta (
pk_manac_id_cuenta int auto_increment primary key,
manac_numero_de_cuenta int unique, 
fk_manac_tipo_de_moneda varchar(100),
manac_tipo_de_cuenta varchar(100),
fk_manac_selec_banco varchar(50),
manac_alias varchar(100), 
manac_status int,
foreign key(fk_manac_selec_banco) references tbl_mantenimientos_agregar_bancos(manag_nombre_banco), 
foreign key (fk_manac_tipo_de_moneda) references tbl_monedaBanco(mon_nomMoneda)
); 




create table tbl_mantenimientos_tipo_movimiento(
pk_movtm_id_transaccion int auto_increment primary key,
movtm_transacciones_existentes varchar(100) unique,
movtm_status int,
movtm_valor_transaccion int NOT NULL
);

-- CREAR OTRA TABLA PARA LOS TIPOS DE MOVIMIENTOS EXISTENTES QUE SOLO LOS ALMACENE


CREATE TABLE tbl_movimientosBancarios(
pk_movban_id_transaccion int auto_increment primary key,
movban_valor_transaccion float NOT NULL,
movban_descripcion_transaccion varchar(100),
fk_movban_num_cuenta int,
fk_movban_tipo_transaccion varchar(50),
fk_movban_valorTrans int NOT NULL,
movban_status int,
movban_fecha_de_ingreso datetime,
manag_status_conciliacion int NOT NULL,
foreign key(fk_movban_num_cuenta) references tbl_mantenimientos_agregar_cuenta(manac_numero_de_cuenta),
foreign key(fk_movban_tipo_transaccion) references tbl_mantenimientos_tipo_movimiento(movtm_transacciones_existentes)
);



create table tbl_conciliacion_bancaria(

	pk_conb_id_conciliacion int auto_increment primary key,

    conb_anio_conciliacion varchar(100),

    conb_mes_conciliacion varchar(100),

    fk_conb_mov_libro float NOT NULL,
    
    fk_conb_estatusConc int NOT NULL, 

    conb_mov_conciliacion float,

    conb_saldo_final float,
    
    conb_status int
    
);


create table tbl_mantenimientos_ordenes_compra(

	pk_manoc_id_ordenc int auto_increment primary key,

    manoc_id_autorización int,

    manoc_nombre_compra varchar(100),

    manoc_nombre_proveedor varchar(100),

    manoc_monto float,

    manoc_descripcion varchar(100),

    manoc_tipo_compra varchar(100),

    fk_manoc_tipo_moneda varchar(100),
    
    manoc_status int,
    
    foreign key (fk_manoc_tipo_moneda) references tbl_monedaBanco(mon_nomMoneda)

); 


create table tbl_registro_moneda(
regmon_id_Moneda int auto_increment primary key,
regmon_Tipo_moneda varchar(100) unique,
regmon_Valor_moneda float, 
regmon_fecha_de_registro DATETIME,
regmon_status int

);


create table tbl_moneda(
mon_id_moneda int auto_increment primary key,
fk_mon_nombre_moneda varchar(50),	
mon_Cant_moneda float,
mon_status int,
foreign key (fk_mon_nombre_moneda) references tbl_registro_moneda(regmon_Tipo_moneda)
);

create table tbl_Banco(
ban_id_Banco int auto_increment primary key,
fk_ban_Nombre_banco varchar(100),
ban_status int,
foreign key (fk_ban_Nombre_banco) references tbl_mantenimientos_agregar_bancos(manag_nombre_banco)
);

create table tbl_Disponibilidad(
disp_id_disponible int auto_increment primary key,
disp_fecha DATETIME, 
fk_disp_Id_banco int,
fk_disp_Id_moneda int,	
disp_status int,
foreign key (fk_disp_Id_banco) references tbl_banco(ban_id_Banco),
foreign key (fk_disp_Id_moneda) references tbl_moneda(mon_id_moneda)
);

create table tbl_cuentaorigen(
cori_id_numcuenta int auto_increment primary key,
cori_tipo_de_compra varchar(100), 
cori_monto float,
fk_cori_tipo_de_moneda varchar(50),
cori_status int,
cori_numCompra int,
foreign key (fk_cori_tipo_de_moneda) references tbl_registro_moneda(regmon_Tipo_moneda)
);

create table tbl_cuentadestino(
cdes_id_proveedor int auto_increment primary key,
cdes_tipo_de_compra varchar(100),
cdes_monto float,
fk_cdes_tipo_de_moneda varchar(100),
cdes_valor_de_compra float, 
cdes_nomproveedor varchar(100),
foreign key (fk_cdes_tipo_de_moneda) references tbl_registro_moneda(regmon_Tipo_moneda)

);


-- SE INSERTAN ESTOS DATOS POR CUESTIONES DE FUNCIONALIDAD DE MOVIMIENTOS BANCARIOS
insert into tbl_mantenimientos_agregar_bancos (pk_manag_id_ban, manag_id_bancoag, manag_nombre_banco, manag_status) values 
 (1, 111, 'Banco industrial', 1),
 (2, 222, 'Banrural', 1);
 
insert into tbl_mantenimientos_tipo_movimiento(pk_movtm_id_transaccion, movtm_transacciones_existentes,  movtm_status, movtm_valor_transaccion) values 
(1, 'Debito',  1, 0),
(2, 'Credito', 1, 1);


insert into tbl_mantenimientos_agregar_cuenta (pk_manac_id_cuenta, manac_numero_de_cuenta, fk_manac_tipo_de_moneda, manac_tipo_de_cuenta, fk_manac_selec_banco, manac_alias, manac_status) values 
(1, 10001, 'Quetzales', 'Ahorro', 'Banco industrial', 'Luis Franco', 1),
(2, 10002, 'Dólares', 'Monetaria', 'Banrural', 'Juan Perez', 1);
