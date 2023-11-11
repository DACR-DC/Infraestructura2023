CREATE DATABASE  IF NOT EXISTS `bd_hoteleria_pruebas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_hoteleria_pruebas`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: roundhouse.proxy.rlwy.net    Database: bd_hoteleria_pruebas
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_Banco`
--

DROP TABLE IF EXISTS `tbl_Banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Banco` (
  `ban_id_Banco` int NOT NULL AUTO_INCREMENT,
  `fk_ban_Nombre_banco` varchar(100) DEFAULT NULL,
  `ban_status` int DEFAULT NULL,
  PRIMARY KEY (`ban_id_Banco`),
  KEY `fk_ban_Nombre_banco` (`fk_ban_Nombre_banco`),
  CONSTRAINT `tbl_Banco_ibfk_1` FOREIGN KEY (`fk_ban_Nombre_banco`) REFERENCES `tbl_mantenimientos_agregar_bancos` (`manag_nombre_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Banco`
--

LOCK TABLES `tbl_Banco` WRITE;
/*!40000 ALTER TABLE `tbl_Banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Cliente`
--

DROP TABLE IF EXISTS `tbl_Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Cliente` (
  `cli_id` int NOT NULL AUTO_INCREMENT,
  `cli_nombre` varchar(80) NOT NULL,
  `cli_apellido` varchar(80) NOT NULL,
  `cli_correo` varchar(20) NOT NULL,
  `cli_telefono` varchar(10) NOT NULL,
  `cli_nit` varchar(20) NOT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Cliente`
--

LOCK TABLES `tbl_Cliente` WRITE;
/*!40000 ALTER TABLE `tbl_Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Disponibilidad`
--

DROP TABLE IF EXISTS `tbl_Disponibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Disponibilidad` (
  `disp_id_disponible` int NOT NULL AUTO_INCREMENT,
  `disp_fecha` datetime DEFAULT NULL,
  `fk_disp_Id_banco` int DEFAULT NULL,
  `fk_disp_Id_moneda` int DEFAULT NULL,
  `disp_status` int DEFAULT NULL,
  PRIMARY KEY (`disp_id_disponible`),
  KEY `fk_disp_Id_banco` (`fk_disp_Id_banco`),
  KEY `fk_disp_Id_moneda` (`fk_disp_Id_moneda`),
  CONSTRAINT `tbl_Disponibilidad_ibfk_1` FOREIGN KEY (`fk_disp_Id_banco`) REFERENCES `tbl_Banco` (`ban_id_Banco`),
  CONSTRAINT `tbl_Disponibilidad_ibfk_2` FOREIGN KEY (`fk_disp_Id_moneda`) REFERENCES `tbl_moneda` (`mon_id_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Disponibilidad`
--

LOCK TABLES `tbl_Disponibilidad` WRITE;
/*!40000 ALTER TABLE `tbl_Disponibilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Disponibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Empleado`
--

DROP TABLE IF EXISTS `tbl_Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Empleado` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_nombre` varchar(80) NOT NULL,
  `emp_apellido` varchar(80) NOT NULL,
  `emp_correo` varchar(20) NOT NULL,
  `emp_telefono` varchar(10) NOT NULL,
  `emp_nit` varchar(20) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Empleado`
--

LOCK TABLES `tbl_Empleado` WRITE;
/*!40000 ALTER TABLE `tbl_Empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aplicaciones`
--

DROP TABLE IF EXISTS `tbl_aplicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_aplicaciones` (
  `pk_id_aplicacion` int NOT NULL,
  `nombre_aplicacion` varchar(50) NOT NULL,
  `descripcion_aplicacion` varchar(150) NOT NULL,
  `estado_aplicacion` tinyint DEFAULT '0',
  PRIMARY KEY (`pk_id_aplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aplicaciones`
--

LOCK TABLES `tbl_aplicaciones` WRITE;
/*!40000 ALTER TABLE `tbl_aplicaciones` DISABLE KEYS */;
INSERT INTO `tbl_aplicaciones` VALUES (1,'Menu','Ingreso Login',1),(999,'Cerrar Sesion','Cerrar Sesion',1),(1000,'MDI SEGURIDAD','PARA SEGURIDAD',1),(1001,'Mant. Usuario','PARA SEGURIDAD',1),(1002,'Mant. Aplicación','PARA SEGURIDAD',1),(1003,'Mant. Modulo','PARA SEGURIDAD',1),(1004,'Mant. Perfil','PARA SEGURIDAD',1),(1101,'Asign. Modulo Aplicacion','PARA SEGURIDAD',1),(1102,'Asign. Aplicacion Perfil','PARA SEGURIDAD',1),(1103,'Asign. Perfil Usuario','PARA SEGURIDAD',1),(1201,'Pcs. Cambio Contraseña','PARA SEGURIDAD',1),(1301,'Pcs. BITACORA','PARA SEGURIDAD',1),(2000,'MDI Compras','Para Compras',1),(2001,'Mant. Proveedor','Para Compras',1),(2002,'Mant. Concepto','Para Compras',1),(2003,'Movimientos Proveedor','Para Compras',1),(2004,'Ordenes de compra','Para Compras',1),(2005,'Compras','Para Compras',1),(3000,'MDI Ventas','Para Ventas',1),(3001,'Mant. Clientes','Para Ventas',1),(3002,'Mant. Concepto','Para Ventas',1),(3003,'Movimientos Clientes','Para Ventas',1),(3004,'Cotizaciones','Para Ventas',1),(3005,'Pedidos','Para Ventas',1),(3006,'Factura','Para Ventas',1),(3007,'Mant. Clientes','Para Ventas',1),(3008,'Man.Concepto','Para ventas',1),(4000,'MDI Logistica','Inventario',1),(4001,'Movimiento Inventario','Movimiento',1),(4002,'Muestreo','Muestreo',1),(4003,'Auditoria','Auditoria',1),(4004,'Mantenimientos','Mantenimientos',1),(4005,'Traslados de Producto','Traslados',1),(5000,'MDI BANCOS','PARA BANCOS',1),(5001,'Movimientos Bancarios','PARA BANCOS',1),(5002,'Conciliacion Bancaria','PARA BANCOS',1),(5003,'Tipo de cambio','PARA BANCOS',1),(5004,'Disponibilidad diaria','PARA BANCOS',1),(5005,'Autorizacion de ordenes de compras','PARA BANCOS',1),(5006,'Mant. Ag.Bancos','PARA BANCOS',1),(5007,'Mant. Ag.Cuentas','PARA BANCOS',1),(5008,'Mant. Ag.Movimiento','PARA BANCOS',1),(5009,'Mant. Ordenes de compra','PARA BANCOS',1),(6000,'MDI NOMINAS','PARA NOMINAS',1),(6001,'Mantenimiento Departamentos','PARA NOMINAS',1),(6002,'Mantenimiento Empleados','PARA NOMINAS',1),(6003,'Mantenimiento Deducciones_Percepciones','PARA NOMINAS',1),(6004,'Mantenimiento Deducciones','PARA NOMINAS',1),(6005,'Mantenimiento Percepciones','PARA NOMINAS',1),(7000,'MDI Hoteleria','PARA HOTELERIA',1),(7001,'Reservas Hotel','PARA HOTELERIA',1),(7002,'Gestion de Huespedes','HOTELERIA',1),(7003,'Gestion de Habitaciones','HOTELERIA',1),(7004,'Gestion de Salones','HOTELERIA',1),(7005,'Mant. Ordenes Produccion','HOTELERIA',1),(7006,'Mant. Recetas','HOTELERIA',1),(7007,'Mant. Procesos Produccion','HOTELERIA',1),(7008,'Mant. Ordenes de Produccion','HOTELERIA',1),(7009,'Mant. Implosion y Explosion de materiales','HOTELERIA',1);
/*!40000 ALTER TABLE `tbl_aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignacionesPerfilsUsuario`
--

DROP TABLE IF EXISTS `tbl_asignacionesPerfilsUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacionesPerfilsUsuario` (
  `fk_id_usuario` int NOT NULL,
  `fk_id_perfil` int NOT NULL,
  PRIMARY KEY (`fk_id_usuario`,`fk_id_perfil`),
  KEY `fk_id_perfil` (`fk_id_perfil`),
  CONSTRAINT `tbl_asignacionesPerfilsUsuario_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  CONSTRAINT `tbl_asignacionesPerfilsUsuario_ibfk_2` FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacionesPerfilsUsuario`
--

LOCK TABLES `tbl_asignacionesPerfilsUsuario` WRITE;
/*!40000 ALTER TABLE `tbl_asignacionesPerfilsUsuario` DISABLE KEYS */;
INSERT INTO `tbl_asignacionesPerfilsUsuario` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `tbl_asignacionesPerfilsUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignacionmoduloaplicacion`
--

DROP TABLE IF EXISTS `tbl_asignacionmoduloaplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacionmoduloaplicacion` (
  `fk_id_modulos` int NOT NULL,
  `fk_id_aplicacion` int NOT NULL,
  PRIMARY KEY (`fk_id_modulos`,`fk_id_aplicacion`),
  KEY `fk_id_aplicacion` (`fk_id_aplicacion`),
  CONSTRAINT `tbl_asignacionmoduloaplicacion_ibfk_1` FOREIGN KEY (`fk_id_modulos`) REFERENCES `tbl_modulos` (`pk_id_modulos`),
  CONSTRAINT `tbl_asignacionmoduloaplicacion_ibfk_2` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacionmoduloaplicacion`
--

LOCK TABLES `tbl_asignacionmoduloaplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_asignacionmoduloaplicacion` DISABLE KEYS */;
INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES (1000,1000),(1000,1001),(1000,1002),(1000,1003),(1000,1004),(1000,1102),(1000,1103),(1000,1201),(1000,1301),(2000,2000),(2000,2001),(2000,2002),(2000,2003),(2000,2004),(2000,2005),(3000,3000),(3000,3001),(3000,3002),(3000,3003),(3000,3004),(3000,3005),(3000,3006),(3000,3007),(3000,3008),(4000,4000),(4000,4001),(4000,4002),(4000,4003),(4000,4004),(4000,4005),(5000,5000),(5000,5001),(5000,5002),(5000,5003),(5000,5004),(5000,5005),(5000,5006),(5000,5007),(5000,5008),(5000,5009),(6000,6000),(6000,6001),(6000,6002),(6000,6003),(6000,6004),(6000,6005),(7000,7000),(7000,7001),(7000,7002),(7000,7003),(7000,7004),(7000,7005),(7000,7006),(7000,7007),(7000,7008),(7000,7009);
/*!40000 ALTER TABLE `tbl_asignacionmoduloaplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bitacoraDeEventos`
--

DROP TABLE IF EXISTS `tbl_bitacoraDeEventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bitacoraDeEventos` (
  `pk_id_bitacora` int NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` int NOT NULL,
  `fk_id_aplicacion` int NOT NULL,
  `fecha_bitacora` date NOT NULL,
  `hora_bitacora` time NOT NULL,
  `host_bitacora` varchar(45) NOT NULL,
  `ip_bitacora` varchar(100) NOT NULL,
  `accion_bitacora` varchar(50) NOT NULL,
  PRIMARY KEY (`pk_id_bitacora`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  KEY `fk_id_aplicacion` (`fk_id_aplicacion`),
  CONSTRAINT `tbl_bitacoraDeEventos_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  CONSTRAINT `tbl_bitacoraDeEventos_ibfk_2` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bitacoraDeEventos`
--

LOCK TABLES `tbl_bitacoraDeEventos` WRITE;
/*!40000 ALTER TABLE `tbl_bitacoraDeEventos` DISABLE KEYS */;
INSERT INTO `tbl_bitacoraDeEventos` VALUES (1,1,1,'2023-10-24','15:43:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(2,1,1000,'2023-10-24','15:43:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(3,1,999,'2023-10-24','15:44:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(4,1,1,'2023-10-24','18:20:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(5,1,1000,'2023-10-24','18:20:50','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(6,1,1000,'2023-10-24','18:20:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(7,1,999,'2023-10-24','18:21:06','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(8,1,1,'2023-10-24','18:21:29','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(9,1,1000,'2023-10-24','18:21:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(10,1,999,'2023-10-24','18:22:06','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(11,1,1,'2023-10-24','18:22:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(12,1,1000,'2023-10-24','18:22:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(13,1,999,'2023-10-24','18:22:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(14,1,1,'2023-10-24','19:02:24','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(15,1,1000,'2023-10-24','19:02:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(16,1,999,'2023-10-24','19:03:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(17,1,1,'2023-10-24','19:13:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(18,1,1000,'2023-10-24','19:13:37','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(19,1,999,'2023-10-24','19:13:44','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(20,1,1,'2023-10-27','16:48:06','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(21,1,999,'2023-10-27','16:48:08','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(22,1,1000,'2023-10-27','17:26:35','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(23,1,1000,'2023-10-27','17:27:34','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(24,1,1000,'2023-10-27','17:28:13','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha modificado un registro'),(25,1,1000,'2023-10-27','17:28:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(26,1,1000,'2023-10-27','17:49:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(27,1,1000,'2023-10-27','18:04:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(28,1,1000,'2023-10-27','18:11:26','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(29,1,1000,'2023-10-27','18:18:23','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(30,1,1000,'2023-10-27','18:18:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(31,1,1000,'2023-10-27','18:23:30','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(32,1,1000,'2023-10-30','22:58:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(33,1,1000,'2023-10-30','22:59:09','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha modificado un registro'),(34,1,1000,'2023-10-30','23:00:03','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(35,1,1,'2023-11-02','15:59:51','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(36,1,1000,'2023-11-02','16:00:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(37,1,1,'2023-11-03','14:25:45','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(38,1,1,'2023-11-03','14:27:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(39,1,1000,'2023-11-03','14:27:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(40,1,1,'2023-11-03','14:28:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(41,1,1000,'2023-11-03','14:28:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(42,1,1,'2023-11-03','14:29:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(43,1,1000,'2023-11-03','14:29:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(44,1,1,'2023-11-03','14:40:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(45,1,6000,'2023-11-03','14:40:34','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(46,1,1,'2023-11-03','14:43:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(47,1,6000,'2023-11-03','14:43:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(48,1,1,'2023-11-03','14:45:55','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(49,1,6000,'2023-11-03','14:45:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(50,1,1,'2023-11-03','14:47:35','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(51,1,6000,'2023-11-03','14:47:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(52,1,1,'2023-11-03','14:49:45','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(53,1,6000,'2023-11-03','14:49:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(54,1,1,'2023-11-03','15:01:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(55,1,6000,'2023-11-03','15:01:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(56,1,6001,'2023-11-03','15:02:11','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(57,1,1000,'2023-11-03','15:03:17','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(58,1,1,'2023-11-03','15:05:01','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(59,1,6000,'2023-11-03','15:05:02','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(60,1,1,'2023-11-03','15:06:35','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(61,1,6000,'2023-11-03','15:06:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(62,1,1,'2023-11-03','15:07:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(63,1,6000,'2023-11-03','15:07:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(64,1,999,'2023-11-03','15:09:17','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(65,1,1,'2023-11-03','15:12:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(66,1,6000,'2023-11-03','15:12:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(67,1,1,'2023-11-03','15:21:35','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(68,1,6000,'2023-11-03','15:21:35','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(69,1,1,'2023-11-03','15:22:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(70,1,999,'2023-11-03','15:23:00','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(71,1,1,'2023-11-03','15:33:30','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(72,1,6000,'2023-11-03','15:33:31','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(73,1,1,'2023-11-03','15:39:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(74,1,6000,'2023-11-03','15:39:49','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(75,1,999,'2023-11-03','15:40:12','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(76,1,1,'2023-11-03','15:41:08','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(77,1,6000,'2023-11-03','15:41:09','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(78,1,999,'2023-11-03','15:41:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(79,1,1,'2023-11-03','15:53:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(80,1,6000,'2023-11-03','15:53:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(81,1,999,'2023-11-03','15:53:49','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(82,1,1,'2023-11-03','16:53:03','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(83,1,6000,'2023-11-03','16:53:04','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(84,1,6001,'2023-11-03','16:53:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(85,1,1,'2023-11-03','16:54:28','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(86,1,6000,'2023-11-03','16:54:29','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(87,1,1,'2023-11-03','16:57:45','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(88,1,6000,'2023-11-03','16:57:45','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(89,1,1000,'2023-11-03','16:58:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(90,1,999,'2023-11-03','16:59:07','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(91,1,1,'2023-11-03','17:00:41','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(92,1,6000,'2023-11-03','17:00:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(93,1,1,'2023-11-03','17:03:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(94,1,6000,'2023-11-03','17:03:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(95,1,1,'2023-11-03','17:10:30','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(96,1,1000,'2023-11-03','17:10:31','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(97,1,6000,'2023-11-03','17:10:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(98,1,999,'2023-11-03','17:11:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(99,1,1,'2023-11-03','18:08:45','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(100,1,6000,'2023-11-03','18:08:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(101,1,1,'2023-11-03','18:18:24','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(102,1,6000,'2023-11-03','18:18:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(103,1,1,'2023-11-03','18:23:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(104,1,6000,'2023-11-03','18:23:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(105,1,999,'2023-11-03','18:23:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(106,1,1,'2023-11-03','18:24:24','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(107,1,6000,'2023-11-03','18:24:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(108,1,999,'2023-11-03','18:25:04','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(109,1,1,'2023-11-03','18:26:08','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(110,1,6000,'2023-11-03','18:26:09','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(111,1,999,'2023-11-03','18:26:19','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(112,1,1,'2023-11-03','18:30:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(113,1,6000,'2023-11-03','18:30:34','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(114,1,1,'2023-11-03','18:31:11','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(115,1,6000,'2023-11-03','18:31:13','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(116,1,6001,'2023-11-03','18:31:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(117,1,1000,'2023-11-03','18:32:26','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(118,1,1,'2023-11-03','18:41:59','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(119,1,6000,'2023-11-03','18:42:01','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(120,1,1,'2023-11-03','18:48:20','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(121,1,6000,'2023-11-03','18:48:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(122,1,1,'2023-11-03','18:50:38','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(123,1,6000,'2023-11-03','18:50:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(124,1,1,'2023-11-03','18:52:19','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(125,1,6000,'2023-11-03','18:52:20','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(126,1,1000,'2023-11-03','18:54:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Modificar'),(127,1,1000,'2023-11-03','18:54:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Modificar'),(128,1,1,'2023-11-03','18:55:58','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(129,1,6000,'2023-11-03','18:55:59','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(130,1,1000,'2023-11-03','18:56:11','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Modificar'),(131,1,1000,'2023-11-03','18:57:37','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Modificar'),(132,1,1000,'2023-11-03','18:58:07','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Modificar'),(133,1,1000,'2023-11-03','18:58:21','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Modificar'),(134,1,1,'2023-11-03','19:21:50','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(135,1,6000,'2023-11-03','19:21:51','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(136,1,1,'2023-11-03','19:27:05','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(137,1,6000,'2023-11-03','19:27:06','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(138,1,1,'2023-11-03','19:28:02','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(139,1,6000,'2023-11-03','19:28:03','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(140,1,1,'2023-11-03','19:32:44','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(141,1,6000,'2023-11-03','19:32:45','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(142,1,1,'2023-11-03','19:35:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(143,1,6000,'2023-11-03','19:35:41','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(144,1,1,'2023-11-03','19:43:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(145,1,6000,'2023-11-03','19:43:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(146,1,1,'2023-11-03','19:46:01','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(147,1,6000,'2023-11-03','19:46:02','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(148,1,1,'2023-11-03','19:47:29','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(149,1,6000,'2023-11-03','19:47:30','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(150,1,1,'2023-11-03','19:48:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(151,1,6000,'2023-11-03','19:48:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(152,1,1,'2023-11-03','19:49:50','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(153,1,6000,'2023-11-03','19:49:51','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(154,1,1,'2023-11-03','19:53:52','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(155,1,6000,'2023-11-03','19:53:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(156,1,1,'2023-11-03','19:58:05','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(157,1,6000,'2023-11-03','19:58:06','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(158,1,1,'2023-11-03','20:17:27','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(159,1,6000,'2023-11-03','20:17:31','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(160,1,1,'2023-11-03','20:19:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(161,1,6000,'2023-11-03','20:19:26','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(162,1,1,'2023-11-03','20:23:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(163,1,6000,'2023-11-03','20:23:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(164,1,1,'2023-11-03','20:26:23','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(165,1,6000,'2023-11-03','20:26:24','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(166,1,1,'2023-11-03','20:32:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(167,1,6000,'2023-11-03','20:32:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(168,1,1,'2023-11-03','20:50:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(169,1,6000,'2023-11-03','20:50:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(170,1,1,'2023-11-03','20:52:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(171,1,6000,'2023-11-03','20:52:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(172,1,1,'2023-11-03','21:12:13','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(173,1,6000,'2023-11-03','21:12:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(174,1,1,'2023-11-03','21:13:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(175,1,6000,'2023-11-03','21:13:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(176,1,1,'2023-11-03','21:17:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(177,1,6000,'2023-11-03','21:17:43','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(178,1,1,'2023-11-03','21:20:21','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(179,1,6000,'2023-11-03','21:20:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(180,1,1,'2023-11-03','21:21:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(181,1,6000,'2023-11-03','21:21:49','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(182,1,1,'2023-11-03','21:22:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(183,1,6000,'2023-11-03','21:22:57','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(184,1,1,'2023-11-03','21:25:09','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(185,1,6000,'2023-11-03','21:25:10','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(186,1,1,'2023-11-03','21:30:44','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(187,1,6000,'2023-11-03','21:30:45','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(188,1,1,'2023-11-03','21:33:58','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(189,1,6000,'2023-11-03','21:33:58','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(190,1,1,'2023-11-04','17:14:57','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(191,1,1000,'2023-11-04','17:15:01','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(192,1,1,'2023-11-04','17:57:11','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(193,1,6000,'2023-11-04','17:57:12','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(194,1,1,'2023-11-04','17:59:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(195,1,6000,'2023-11-04','17:59:57','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(196,1,6003,'2023-11-04','18:00:58','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Modificar'),(197,1,6001,'2023-11-04','18:01:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(198,1,1,'2023-11-04','18:34:02','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(199,1,1,'2023-11-05','17:01:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(200,1,6000,'2023-11-05','17:01:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(201,1,1,'2023-11-05','17:10:01','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(202,1,6000,'2023-11-05','17:10:07','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(203,1,1,'2023-11-05','17:11:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(204,1,6000,'2023-11-05','17:11:37','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(205,1,1,'2023-11-05','17:13:20','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(206,1,6000,'2023-11-05','17:13:21','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(207,1,1,'2023-11-05','17:16:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(208,1,6000,'2023-11-05','17:16:37','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(209,1,1,'2023-11-05','17:18:21','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(210,1,6000,'2023-11-05','17:18:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(211,1,1,'2023-11-05','17:23:00','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(212,1,6000,'2023-11-05','17:23:02','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(213,1,6001,'2023-11-05','17:23:35','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(214,1,1,'2023-11-05','17:25:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(215,1,6000,'2023-11-05','17:25:49','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(216,1,1,'2023-11-05','17:30:28','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(217,1,6000,'2023-11-05','17:30:29','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(218,1,999,'2023-11-05','17:31:00','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(219,1,1,'2023-11-07','07:30:09','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(220,1,6000,'2023-11-07','07:30:12','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(221,1,1,'2023-11-07','07:33:51','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(222,1,6000,'2023-11-07','07:33:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(223,1,999,'2023-11-07','07:34:29','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(224,1,1,'2023-11-08','09:37:56','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(225,1,6000,'2023-11-08','09:37:57','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(226,1,6002,'2023-11-08','09:38:02','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Reportes'),(227,1,1,'2023-11-08','09:38:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(228,1,6000,'2023-11-08','09:38:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(229,1,6002,'2023-11-08','09:38:57','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Reportes'),(230,1,1,'2023-11-08','18:09:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(231,1,6000,'2023-11-08','18:09:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(232,1,999,'2023-11-08','18:10:06','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(233,1,1,'2023-11-08','18:42:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(234,1,6000,'2023-11-08','18:42:23','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(235,1,6000,'2023-11-08','18:59:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(236,1,1,'2023-11-08','19:02:35','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(237,1,6000,'2023-11-08','19:02:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(238,1,1,'2023-11-08','19:05:05','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(239,1,6000,'2023-11-08','19:05:05','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(240,1,6000,'2023-11-08','19:17:13','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(241,1,1,'2023-11-08','19:17:59','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(242,1,1000,'2023-11-08','19:18:03','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(243,1,999,'2023-11-08','19:18:18','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(244,1,999,'2023-11-08','19:19:05','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(245,1,1,'2023-11-08','19:19:30','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(246,1,6000,'2023-11-08','19:19:31','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(247,1,999,'2023-11-08','19:19:44','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(248,1,1,'2023-11-08','19:21:15','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(249,1,6000,'2023-11-08','19:21:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(250,1,999,'2023-11-08','19:21:41','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(251,1,1,'2023-11-08','19:23:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(252,1,6000,'2023-11-08','19:23:55','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(253,1,999,'2023-11-08','19:24:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(254,1,1,'2023-11-08','19:25:21','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(255,1,6000,'2023-11-08','19:25:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(256,1,1,'2023-11-08','19:28:34','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(257,1,6000,'2023-11-08','19:28:35','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(258,1,999,'2023-11-08','19:28:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(259,1,1,'2023-11-08','19:37:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(260,1,6000,'2023-11-08','19:37:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(261,1,1,'2023-11-08','19:38:39','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(262,1,6000,'2023-11-08','19:38:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(263,1,6000,'2023-11-08','19:45:08','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(264,1,6000,'2023-11-08','19:45:10','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(265,1,6000,'2023-11-08','19:45:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(266,1,999,'2023-11-08','19:45:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(267,1,1,'2023-11-08','20:00:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(268,1,6000,'2023-11-08','20:00:55','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(269,1,1,'2023-11-08','20:09:00','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(270,1,6000,'2023-11-08','20:09:01','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(271,1,999,'2023-11-08','20:09:11','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(272,1,1,'2023-11-08','20:10:29','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(273,1,6000,'2023-11-08','20:10:30','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(274,1,1,'2023-11-08','20:14:52','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(275,1,6000,'2023-11-08','20:16:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(276,1,1,'2023-11-08','20:18:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(277,1,6000,'2023-11-08','20:18:41','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(278,1,999,'2023-11-08','20:19:07','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(279,1,1,'2023-11-08','20:20:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(280,1,6000,'2023-11-08','20:20:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(281,1,1,'2023-11-08','20:21:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(282,1,6000,'2023-11-08','20:21:26','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(283,1,1,'2023-11-08','20:22:45','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(284,1,6000,'2023-11-08','20:22:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(285,1,999,'2023-11-08','20:23:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(286,1,1,'2023-11-08','20:29:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(287,1,6000,'2023-11-08','20:29:49','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(288,1,1,'2023-11-08','20:31:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(289,1,6000,'2023-11-08','20:31:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(290,1,1,'2023-11-08','20:33:43','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(291,1,6000,'2023-11-08','20:33:44','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(292,1,1,'2023-11-08','20:40:41','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(293,1,6000,'2023-11-08','20:40:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(294,1,1,'2023-11-08','20:43:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(295,1,6000,'2023-11-08','20:43:26','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(296,1,1,'2023-11-08','20:47:23','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(297,1,1000,'2023-11-08','20:47:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(298,1,1001,'2023-11-08','20:48:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(299,2,1,'2023-11-08','20:49:18','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(300,2,999,'2023-11-08','20:49:21','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(301,1,1,'2023-11-08','20:49:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(302,1,1000,'2023-11-08','20:49:34','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(303,1,999,'2023-11-08','20:49:52','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(304,1,1,'2023-11-08','20:56:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(305,1,6000,'2023-11-08','20:56:24','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(306,1,1000,'2023-11-08','20:59:59','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(307,1,1,'2023-11-08','21:02:05','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(308,1,1000,'2023-11-08','21:02:06','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(309,1,999,'2023-11-08','21:03:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(310,1,1,'2023-11-08','21:04:34','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(311,1,6000,'2023-11-08','21:04:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(312,1,999,'2023-11-08','21:11:57','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(313,2,1,'2023-11-08','21:12:05','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(314,2,6000,'2023-11-08','21:12:06','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(315,2,999,'2023-11-08','21:12:08','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(316,2,1,'2023-11-08','21:20:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(317,2,6000,'2023-11-08','21:20:41','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(318,1,1,'2023-11-08','21:22:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(319,1,6000,'2023-11-08','21:22:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(320,1,999,'2023-11-08','21:23:17','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(321,2,1,'2023-11-08','21:33:15','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(322,2,6000,'2023-11-08','21:33:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(323,2,1,'2023-11-08','21:38:52','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(324,2,6000,'2023-11-08','21:38:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(325,2,1,'2023-11-08','21:42:04','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(326,2,6000,'2023-11-08','21:42:04','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(327,2,999,'2023-11-08','21:42:15','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(328,2,1,'2023-11-08','21:42:28','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(329,2,6000,'2023-11-08','21:42:29','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(330,2,1,'2023-11-08','21:50:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(331,2,6000,'2023-11-08','21:50:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(332,2,6002,'2023-11-08','21:51:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(333,2,6003,'2023-11-08','21:52:36','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Modificar'),(334,1,1,'2023-11-09','07:21:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(335,1,6000,'2023-11-09','07:21:34','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(336,1,6002,'2023-11-09','07:22:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(337,1,999,'2023-11-09','07:23:00','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(338,2,1,'2023-11-09','07:30:48','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(339,2,6000,'2023-11-09','07:30:50','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(340,2,999,'2023-11-09','07:33:31','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(341,1,1,'2023-11-09','14:44:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(342,1,1000,'2023-11-09','14:44:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(343,1,1,'2023-11-09','16:40:19','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(344,1,1,'2023-11-09','16:57:51','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(345,1,1000,'2023-11-09','16:58:23','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(346,1,1001,'2023-11-09','17:00:28','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(347,3,1,'2023-11-09','17:09:14','LAPTOP-L','2803:d100:9878:c06:11fb:3514:caed:5637','Ingreso Login'),(348,3,5000,'2023-11-09','17:09:20','LAPTOP-L','2803:d100:9878:c06:11fb:3514:caed:5637','Ingreso Ventas'),(349,1,1,'2023-11-09','17:10:58','LAPTOP-L','2803:d100:9878:c06:11fb:3514:caed:5637','Ingreso Login'),(350,1,5000,'2023-11-09','17:11:16','LAPTOP-L','2803:d100:9878:c06:11fb:3514:caed:5637','Ingreso Ventas'),(351,1,1001,'2023-11-09','17:15:51','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(352,1,1001,'2023-11-09','17:35:58','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(353,1,1001,'2023-11-09','17:36:52','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(354,1,999,'2023-11-09','18:09:21','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(355,1,1,'2023-11-09','18:09:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(356,1,999,'2023-11-09','18:10:11','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(357,1,1,'2023-11-09','19:18:00','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(358,1,1000,'2023-11-09','19:18:33','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(359,1,1001,'2023-11-09','19:19:40','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Guardar'),(360,1,999,'2023-11-09','19:20:49','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(361,1,1,'2023-11-09','20:13:49','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Login'),(362,1,3000,'2023-11-09','20:13:58','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(363,1,2000,'2023-11-09','20:15:01','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Compras'),(364,1,3000,'2023-11-09','20:21:41','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(365,1,2000,'2023-11-09','20:21:50','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Compras'),(366,1,3000,'2023-11-09','20:22:57','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(367,1,999,'2023-11-09','20:23:42','ASPIRECG','::8549:d22e:88fc:6e14','Cerro Sesion'),(368,1,1,'2023-11-09','20:28:44','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Login'),(369,1,1000,'2023-11-09','20:29:14','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Seguridad'),(370,1,3000,'2023-11-09','20:31:15','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(371,1,3000,'2023-11-09','20:33:13','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(372,1,2000,'2023-11-09','20:33:51','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Compras'),(373,1,3000,'2023-11-09','20:34:57','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(374,2,1,'2023-11-09','21:09:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(375,2,6000,'2023-11-09','21:10:01','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(376,2,999,'2023-11-09','21:10:50','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(377,3,1,'2023-11-09','21:13:41','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(378,3,6000,'2023-11-09','21:15:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(379,3,999,'2023-11-09','21:15:44','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(380,4,1,'2023-11-09','21:21:32','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Login'),(381,4,3000,'2023-11-09','21:21:39','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(382,1,1,'2023-11-09','21:24:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(383,1,6000,'2023-11-09','21:24:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Nominas'),(384,1,1000,'2023-11-09','21:26:52','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Seguridad'),(385,3,1,'2023-11-09','21:33:24','CORADOOA','fe80::a3df:5396:1308:2c79%18','Ingreso Login'),(386,3,999,'2023-11-09','21:33:26','CORADOOA','fe80::a3df:5396:1308:2c79%18','Cerro Sesion'),(387,3,1,'2023-11-09','21:33:57','CORADOOA','fe80::a3df:5396:1308:2c79%18','Ingreso Login'),(388,3,5007,'2023-11-09','21:34:40','CORADOOA','fe80::a3df:5396:1308:2c79%18','Guardar'),(389,1,1,'2023-11-09','21:42:55','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Login'),(390,3,1,'2023-11-09','21:43:31','CORADOOA','fe80::a3df:5396:1308:2c79%18','Ingreso Login'),(391,3,5000,'2023-11-09','21:43:36','CORADOOA','fe80::a3df:5396:1308:2c79%18','Ingreso Ventas'),(392,1,3000,'2023-11-09','21:43:53','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(393,1,3000,'2023-11-09','21:44:59','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(394,1,999,'2023-11-09','21:45:02','ASPIRECG','::8549:d22e:88fc:6e14','Cerro Sesion'),(395,3,5008,'2023-11-09','21:45:26','CORADOOA','fe80::a3df:5396:1308:2c79%18','Guardar'),(396,4,1,'2023-11-09','21:45:48','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Login'),(397,3,5007,'2023-11-09','21:46:22','CORADOOA','fe80::a3df:5396:1308:2c79%18','Guardar'),(398,4,3000,'2023-11-09','21:46:35','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(399,4,999,'2023-11-09','21:47:13','ASPIRECG','::8549:d22e:88fc:6e14','Cerro Sesion'),(400,4,1,'2023-11-09','21:48:24','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Login'),(401,4,3000,'2023-11-09','21:48:38','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(402,4,1000,'2023-11-09','21:50:04','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Seguridad'),(403,4,999,'2023-11-09','21:52:15','ASPIRECG','::8549:d22e:88fc:6e14','Cerro Sesion'),(404,4,1,'2023-11-09','21:55:57','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Login'),(405,4,1000,'2023-11-09','21:57:13','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Seguridad'),(406,1,999,'2023-11-09','21:57:38','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(407,4,3000,'2023-11-09','22:01:41','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Ventas'),(408,4,2000,'2023-11-09','22:09:37','ASPIRECG','::8549:d22e:88fc:6e14','Ingreso Compras'),(409,4,1,'2023-11-09','22:14:23','LAPTOP-L4C2D6MP','2803:d100:eee0:1abd:d0ae:4fde:f55:7393','Ingreso Login'),(410,4,2000,'2023-11-09','22:14:29','LAPTOP-L4C2D6MP','2803:d100:eee0:1abd:d0ae:4fde:f55:7393','Ingreso Compras'),(411,4,1,'2023-11-09','22:15:38','LAPTOP-L4C2D6MP','2803:d100:eee0:1abd:d0ae:4fde:f55:7393','Ingreso Login'),(412,4,2000,'2023-11-09','22:15:42','LAPTOP-L4C2D6MP','2803:d100:eee0:1abd:d0ae:4fde:f55:7393','Ingreso Compras'),(413,4,999,'2023-11-09','22:20:52','ASPIRECG','::8549:d22e:88fc:6e14','Cerro Sesion'),(414,1,1,'2023-11-10','00:34:39','OLSTER','fe80::53e8:da7a:9560:b915%8','Ingreso Login'),(415,1,7000,'2023-11-10','00:34:42','OLSTER','fe80::53e8:da7a:9560:b915%8','Ingreso Ventas'),(416,1,1,'2023-11-10','00:47:18','OLSTER','fe80::53e8:da7a:9560:b915%8','Ingreso Login'),(417,1,7000,'2023-11-10','00:47:30','OLSTER','fe80::53e8:da7a:9560:b915%8','Ingreso Ventas'),(418,4,1,'2023-11-10','06:59:23','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(419,4,3000,'2023-11-10','06:59:35','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(420,4,3007,'2023-11-10','07:00:43','ASPIRECG','::ac2d:61fa:7263:9662','Guardar'),(421,4,3008,'2023-11-10','07:02:08','ASPIRECG','::ac2d:61fa:7263:9662','Guardar'),(422,4,2000,'2023-11-10','07:02:25','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Compras'),(423,4,2001,'2023-11-10','07:07:31','ASPIRECG','::ac2d:61fa:7263:9662','Guardar'),(424,4,999,'2023-11-10','07:10:48','ASPIRECG','::ac2d:61fa:7263:9662','Cerro Sesion'),(425,4,1,'2023-11-10','07:27:36','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(426,4,3000,'2023-11-10','07:28:14','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(427,4,1,'2023-11-10','07:32:00','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(428,4,3000,'2023-11-10','07:32:08','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(429,4,1,'2023-11-10','07:34:54','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(430,4,3000,'2023-11-10','07:34:58','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(431,4,1,'2023-11-10','07:37:43','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(432,4,3000,'2023-11-10','07:37:50','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(433,3,1,'2023-11-10','08:06:36','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Login'),(434,3,5000,'2023-11-10','08:07:05','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Ventas'),(435,3,5001,'2023-11-10','08:07:13','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Movimientos Bancarios'),(436,5,1,'2023-11-10','08:10:26','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(437,5,4000,'2023-11-10','08:10:29','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(438,4,1,'2023-11-10','08:47:11','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(439,4,3000,'2023-11-10','08:47:36','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(440,4,1,'2023-11-10','08:55:03','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(441,4,3000,'2023-11-10','08:55:06','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(442,4,1,'2023-11-10','08:58:03','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(443,4,3000,'2023-11-10','08:58:08','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(444,4,1,'2023-11-10','09:01:33','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(445,4,3000,'2023-11-10','09:01:38','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(446,4,1,'2023-11-10','09:07:56','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(447,4,3000,'2023-11-10','09:07:59','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(448,4,1,'2023-11-10','09:10:44','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(449,4,3000,'2023-11-10','09:10:47','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(450,4,1,'2023-11-10','09:13:32','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(451,4,3000,'2023-11-10','09:13:38','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(452,4,1,'2023-11-10','09:18:45','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(453,4,3000,'2023-11-10','09:18:48','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(454,4,1,'2023-11-10','09:31:30','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(455,4,3000,'2023-11-10','09:31:34','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(456,3,1,'2023-11-10','09:38:00','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Login'),(457,3,5000,'2023-11-10','09:38:29','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Ventas'),(458,3,5001,'2023-11-10','09:38:33','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Movimientos Bancarios'),(459,3,5001,'2023-11-10','09:39:12','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Realizando transaccion'),(460,3,5001,'2023-11-10','09:39:36','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Cancelacion de transaccion'),(461,3,5002,'2023-11-10','09:39:42','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Conciliacion Bancaria'),(462,3,1,'2023-11-10','09:41:27','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Login'),(463,3,5000,'2023-11-10','09:41:55','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Ventas'),(464,3,5001,'2023-11-10','09:42:09','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Movimientos Bancarios'),(465,3,5001,'2023-11-10','09:42:42','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Realizando transaccion'),(466,3,5002,'2023-11-10','09:42:58','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Conciliacion Bancaria'),(467,3,5003,'2023-11-10','09:43:11','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Tipo de cambio'),(468,1,1,'2023-11-10','09:43:12','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(469,3,5006,'2023-11-10','09:43:26','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Mant. Agregar Bancos'),(470,1,3000,'2023-11-10','09:43:31','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(471,3,5007,'2023-11-10','09:44:10','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Guardar'),(472,3,5007,'2023-11-10','09:44:22','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Mant. Agregar Cuenta'),(473,3,1,'2023-11-10','09:45:44','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Login'),(474,3,5000,'2023-11-10','09:46:16','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Ventas'),(475,3,5007,'2023-11-10','09:46:35','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Mant. Agregar Cuenta'),(476,3,1,'2023-11-10','09:49:12','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Login'),(477,3,5000,'2023-11-10','09:49:42','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Ventas'),(478,3,5007,'2023-11-10','09:49:48','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Mant. Agregar Cuenta'),(479,3,5008,'2023-11-10','09:50:09','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Mant. Agregar Movimiento'),(480,3,5009,'2023-11-10','09:50:33','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Mant. Agregar orden Compra'),(481,3,1000,'2023-11-10','09:51:24','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Seguridad'),(482,3,1,'2023-11-10','09:54:43','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Login'),(483,3,5000,'2023-11-10','09:55:12','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Ventas'),(484,3,5003,'2023-11-10','09:55:34','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Tipo de cambio'),(485,3,999,'2023-11-10','09:56:09','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Cerro Sesion'),(486,3,1,'2023-11-10','09:58:44','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Login'),(487,3,5000,'2023-11-10','09:59:12','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Ingreso Ventas'),(488,3,5003,'2023-11-10','10:00:28','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Tipo de cambio'),(489,3,1003,'2023-11-10','10:01:19','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Guardar'),(490,3,999,'2023-11-10','10:02:10','LAPTOP-L','2803:d100:9878:c06:3863:42e4:5441:bd6d','Cerro Sesion'),(491,3,1,'2023-11-10','10:13:34','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Ingreso Login'),(492,3,5000,'2023-11-10','10:14:10','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Ingreso Ventas'),(493,3,5000,'2023-11-10','10:14:52','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Ingreso Ventas'),(494,3,5001,'2023-11-10','10:15:17','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Movimientos Bancarios'),(495,3,5001,'2023-11-10','10:15:53','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Realizando transaccion'),(496,3,5001,'2023-11-10','10:16:21','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Realizando transaccion'),(497,3,5002,'2023-11-10','10:16:35','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Conciliacion Bancaria'),(498,4,1,'2023-11-10','10:17:08','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(499,4,2000,'2023-11-10','10:17:11','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Compras'),(500,3,5006,'2023-11-10','10:17:30','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Mant. Agregar Bancos'),(501,3,5007,'2023-11-10','10:18:09','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Guardar'),(502,3,5007,'2023-11-10','10:18:23','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Mant. Agregar Cuenta'),(503,3,5007,'2023-11-10','10:19:23','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Guardar'),(504,3,5008,'2023-11-10','10:19:36','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Mant. Agregar Movimiento'),(505,3,5008,'2023-11-10','10:20:12','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Guardar'),(506,3,5009,'2023-11-10','10:20:25','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Mant. Agregar orden Compra'),(507,3,5009,'2023-11-10','10:21:31','LAPTOP-L','2803:d100:9878:c06:7c64:56be:886d:24b','Guardar'),(508,4,1,'2023-11-10','10:24:20','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(509,4,3000,'2023-11-10','10:24:24','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas'),(510,4,2000,'2023-11-10','10:24:29','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Compras'),(511,4,1,'2023-11-10','10:25:58','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Login'),(512,4,3000,'2023-11-10','10:26:02','ASPIRECG','::ac2d:61fa:7263:9662','Ingreso Ventas');
/*!40000 ALTER TABLE `tbl_bitacoraDeEventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bodega`
--

DROP TABLE IF EXISTS `tbl_bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bodega` (
  `PK_Codigo_bodega` int NOT NULL,
  `Nombre_Bodega` varchar(45) DEFAULT NULL,
  `Encargado` varchar(45) DEFAULT NULL,
  `Tipo_Bodega` varchar(45) DEFAULT NULL,
  `Ubicacion_Bodega` varchar(45) DEFAULT NULL,
  `estatus` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bodega`
--

LOCK TABLES `tbl_bodega` WRITE;
/*!40000 ALTER TABLE `tbl_bodega` DISABLE KEYS */;
INSERT INTO `tbl_bodega` VALUES (1,'BODEGA A','JOSE','BODEGA CENTRAL','4 CALLE',0),(2,'BODEGA B','MARIO','SUCURSAL','ZONA 10',0);
/*!40000 ALTER TABLE `tbl_bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cli_Nombre` varchar(60) NOT NULL,
  `cli_Telefono` int NOT NULL,
  `cli_NIT` int NOT NULL,
  `cli_Estado` varchar(60) NOT NULL,
  `cli_tipo` varchar(60) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,'Francisco',78964512,11527809,'Activo','Minorista');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cobrador`
--

DROP TABLE IF EXISTS `tbl_cobrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cobrador` (
  `id_cobrador` int NOT NULL AUTO_INCREMENT,
  `cob_Nombre` varchar(60) NOT NULL,
  `cob_Domicilio` varchar(60) NOT NULL,
  `cob_Nit` int NOT NULL,
  `cob_Telefono` int NOT NULL,
  `cob_Tipo` varchar(60) NOT NULL,
  `cob_Estado` varchar(60) NOT NULL,
  PRIMARY KEY (`id_cobrador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cobrador`
--

LOCK TABLES `tbl_cobrador` WRITE;
/*!40000 ALTER TABLE `tbl_cobrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cobrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_compras`
--

DROP TABLE IF EXISTS `tbl_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_compras` (
  `com_id` int NOT NULL AUTO_INCREMENT,
  `com_fechasolicitud` date DEFAULT NULL,
  `com_fechaentrega` date DEFAULT NULL,
  `com_deptosolicitante` varchar(255) DEFAULT NULL,
  `com_recibidopor` varchar(255) DEFAULT NULL,
  `com_subtotal` double DEFAULT NULL,
  `com_iva` double DEFAULT NULL,
  `com_totalcompra` double DEFAULT NULL,
  `com_totalLetras` varchar(255) DEFAULT NULL,
  `fk_ord_id` int NOT NULL,
  `fk_proveedor_id` int NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `fk_tbl_compras_tbl_ordenesCompra1` (`fk_ord_id`),
  KEY `fk_tbl_compras_tbl_proveedor1` (`fk_proveedor_id`),
  CONSTRAINT `fk_tbl_compras_tbl_ordenesCompra1` FOREIGN KEY (`fk_ord_id`) REFERENCES `tbl_ordenescompra` (`ord_id`),
  CONSTRAINT `fk_tbl_compras_tbl_proveedor1` FOREIGN KEY (`fk_proveedor_id`) REFERENCES `tbl_proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compras`
--

LOCK TABLES `tbl_compras` WRITE;
/*!40000 ALTER TABLE `tbl_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_concepto`
--

DROP TABLE IF EXISTS `tbl_concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_concepto` (
  `id_concepto` int NOT NULL AUTO_INCREMENT,
  `con_Descripcion` varchar(60) NOT NULL,
  `con_Tipo` varchar(60) NOT NULL,
  `con_SerieConcepto` int NOT NULL,
  PRIMARY KEY (`id_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_concepto`
--

LOCK TABLES `tbl_concepto` WRITE;
/*!40000 ALTER TABLE `tbl_concepto` DISABLE KEYS */;
INSERT INTO `tbl_concepto` VALUES (1,'Compras de productos','Compras',112245);
/*!40000 ALTER TABLE `tbl_concepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conciliacion_bancaria`
--

DROP TABLE IF EXISTS `tbl_conciliacion_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_conciliacion_bancaria` (
  `pk_conb_id_conciliacion` int NOT NULL AUTO_INCREMENT,
  `conb_anio_conciliacion` varchar(100) DEFAULT NULL,
  `conb_mes_conciliacion` varchar(100) DEFAULT NULL,
  `fk_conb_mov_libro` float NOT NULL,
  `fk_conb_estatusConc` int NOT NULL,
  `conb_mov_conciliacion` float DEFAULT NULL,
  `conb_saldo_final` float DEFAULT NULL,
  `conb_status` int DEFAULT NULL,
  PRIMARY KEY (`pk_conb_id_conciliacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conciliacion_bancaria`
--

LOCK TABLES `tbl_conciliacion_bancaria` WRITE;
/*!40000 ALTER TABLE `tbl_conciliacion_bancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_conciliacion_bancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cuentadestino`
--

DROP TABLE IF EXISTS `tbl_cuentadestino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cuentadestino` (
  `cdes_id_proveedor` int NOT NULL AUTO_INCREMENT,
  `cdes_tipo_de_compra` varchar(100) DEFAULT NULL,
  `cdes_monto` float DEFAULT NULL,
  `fk_cdes_tipo_de_moneda` varchar(100) DEFAULT NULL,
  `cdes_valor_de_compra` float DEFAULT NULL,
  `cdes_nomproveedor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cdes_id_proveedor`),
  KEY `fk_cdes_tipo_de_moneda` (`fk_cdes_tipo_de_moneda`),
  CONSTRAINT `tbl_cuentadestino_ibfk_1` FOREIGN KEY (`fk_cdes_tipo_de_moneda`) REFERENCES `tbl_registro_moneda` (`regmon_Tipo_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cuentadestino`
--

LOCK TABLES `tbl_cuentadestino` WRITE;
/*!40000 ALTER TABLE `tbl_cuentadestino` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cuentadestino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cuentaorigen`
--

DROP TABLE IF EXISTS `tbl_cuentaorigen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cuentaorigen` (
  `cori_id_numcuenta` int NOT NULL AUTO_INCREMENT,
  `cori_tipo_de_compra` varchar(100) DEFAULT NULL,
  `cori_monto` float DEFAULT NULL,
  `fk_cori_tipo_de_moneda` varchar(50) DEFAULT NULL,
  `cori_status` int DEFAULT NULL,
  `cori_numCompra` int DEFAULT NULL,
  PRIMARY KEY (`cori_id_numcuenta`),
  KEY `fk_cori_tipo_de_moneda` (`fk_cori_tipo_de_moneda`),
  CONSTRAINT `tbl_cuentaorigen_ibfk_1` FOREIGN KEY (`fk_cori_tipo_de_moneda`) REFERENCES `tbl_registro_moneda` (`regmon_Tipo_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cuentaorigen`
--

LOCK TABLES `tbl_cuentaorigen` WRITE;
/*!40000 ALTER TABLE `tbl_cuentaorigen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cuentaorigen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_dedu_perc`
--

DROP TABLE IF EXISTS `tbl_dedu_perc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_dedu_perc` (
  `Pk_id_dedu_perc` int NOT NULL,
  `dedperc_nombre` varchar(50) NOT NULL,
  `dedperc_monto` float NOT NULL,
  `dedperc_movimiento` int NOT NULL,
  PRIMARY KEY (`Pk_id_dedu_perc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dedu_perc`
--

LOCK TABLES `tbl_dedu_perc` WRITE;
/*!40000 ALTER TABLE `tbl_dedu_perc` DISABLE KEYS */;
INSERT INTO `tbl_dedu_perc` VALUES (1,'igss',0.0483,1),(2,'seguro medico',500,1),(3,'deduccion1',800,1),(4,'otros',100,1),(5,'impuestos',250,1),(6,'seguros y pensiones',120,1),(7,'prestamos y anticipos',50,1),(8,'deduccion2',550,1),(9,'deduccion3',0.053,1),(42,'bono1',500,2),(52,'Bono',150,2),(67,'Bono2',1500,2),(87,'Deduccion4',500,1),(89,'Contrubuciones',200,2),(99,'Deduccion5',523,1);
/*!40000 ALTER TABLE `tbl_dedu_perc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_deducciones`
--

DROP TABLE IF EXISTS `tbl_deducciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_deducciones` (
  `Pk_id_ded` int NOT NULL AUTO_INCREMENT,
  `ded_deducciones_totales` varchar(50) NOT NULL,
  `ded_fecha_ded` varchar(50) NOT NULL,
  `tbl_empleado_Pk_id_empleado` int NOT NULL,
  PRIMARY KEY (`Pk_id_ded`),
  KEY `fk_tbl_deducciones_tbl_empleado_idx` (`tbl_empleado_Pk_id_empleado`),
  CONSTRAINT `fk_tbl_deducciones_tbl_empleado` FOREIGN KEY (`tbl_empleado_Pk_id_empleado`) REFERENCES `tbl_empleado` (`Pk_id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_deducciones`
--

LOCK TABLES `tbl_deducciones` WRITE;
/*!40000 ALTER TABLE `tbl_deducciones` DISABLE KEYS */;
INSERT INTO `tbl_deducciones` VALUES (1,'2,403.75002','2023-11-03 00:00:00',1),(2,'920.75000','2023-11-03 00:00:00',2),(4,'606.50001','2023-11-08 00:00:00',3),(5,'1,041.50000','2023-11-09 00:00:00',4);
/*!40000 ALTER TABLE `tbl_deducciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_departamento`
--

DROP TABLE IF EXISTS `tbl_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_departamento` (
  `Pk_id_departamento` int NOT NULL,
  `dpt_nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`Pk_id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamento`
--

LOCK TABLES `tbl_departamento` WRITE;
/*!40000 ALTER TABLE `tbl_departamento` DISABLE KEYS */;
INSERT INTO `tbl_departamento` VALUES (1,'Gerencia'),(2,'Seguridad'),(3,'Hoteleria'),(4,'Limpieza');
/*!40000 ALTER TABLE `tbl_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_compras`
--

DROP TABLE IF EXISTS `tbl_detalle_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_compras` (
  `det_id` int NOT NULL AUTO_INCREMENT,
  `det_cantidad_compra` int NOT NULL,
  `det_totalPorProducto` double DEFAULT NULL,
  `fk_det_compras_id` int NOT NULL,
  `fk_det_producto_id` int NOT NULL,
  PRIMARY KEY (`det_id`),
  KEY `fk_tbl_detalle_compras_tbl_compras1` (`fk_det_compras_id`),
  KEY `fk_tbl_detalle_compras_tbl_productos1` (`fk_det_producto_id`),
  CONSTRAINT `fk_tbl_detalle_compras_tbl_compras1` FOREIGN KEY (`fk_det_compras_id`) REFERENCES `tbl_compras` (`com_id`),
  CONSTRAINT `fk_tbl_detalle_compras_tbl_productos1` FOREIGN KEY (`fk_det_producto_id`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_compras`
--

LOCK TABLES `tbl_detalle_compras` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detallemovimientocliente`
--

DROP TABLE IF EXISTS `tbl_detallemovimientocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detallemovimientocliente` (
  `id_DetalleCliente` int NOT NULL AUTO_INCREMENT,
  `CodigoEncabezadoCliente` int NOT NULL,
  `CodigoConceptoCliente` int NOT NULL,
  `Detalle_valor` int NOT NULL,
  PRIMARY KEY (`id_DetalleCliente`),
  KEY `CodigoEncabezadoCliente` (`CodigoEncabezadoCliente`),
  KEY `CodigoConceptoCliente` (`CodigoConceptoCliente`),
  CONSTRAINT `tbl_detallemovimientocliente_ibfk_1` FOREIGN KEY (`CodigoEncabezadoCliente`) REFERENCES `tbl_encabezadomovimientocliente` (`id_EncabezadoCliente`),
  CONSTRAINT `tbl_detallemovimientocliente_ibfk_2` FOREIGN KEY (`CodigoConceptoCliente`) REFERENCES `tbl_concepto` (`id_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detallemovimientocliente`
--

LOCK TABLES `tbl_detallemovimientocliente` WRITE;
/*!40000 ALTER TABLE `tbl_detallemovimientocliente` DISABLE KEYS */;
INSERT INTO `tbl_detallemovimientocliente` VALUES (5,7,1,500);
/*!40000 ALTER TABLE `tbl_detallemovimientocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detallemovimientoproveedor`
--

DROP TABLE IF EXISTS `tbl_detallemovimientoproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detallemovimientoproveedor` (
  `id_DetalleProveedor` int NOT NULL AUTO_INCREMENT,
  `CodigoEncabezadoProveedor` int NOT NULL,
  `CodigoConceptoProveedor` int NOT NULL,
  `detalleProveedor_valor` int NOT NULL,
  PRIMARY KEY (`id_DetalleProveedor`),
  KEY `CodigoEncabezadoProveedor` (`CodigoEncabezadoProveedor`),
  KEY `CodigoConceptoProveedor` (`CodigoConceptoProveedor`),
  CONSTRAINT `tbl_detallemovimientoproveedor_ibfk_1` FOREIGN KEY (`CodigoEncabezadoProveedor`) REFERENCES `tbl_encabezadomovimientoproveedor` (`id_EncabezadoProveedor`),
  CONSTRAINT `tbl_detallemovimientoproveedor_ibfk_2` FOREIGN KEY (`CodigoConceptoProveedor`) REFERENCES `tbl_concepto` (`id_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detallemovimientoproveedor`
--

LOCK TABLES `tbl_detallemovimientoproveedor` WRITE;
/*!40000 ALTER TABLE `tbl_detallemovimientoproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detallemovimientoproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalleordenescompra`
--

DROP TABLE IF EXISTS `tbl_detalleordenescompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalleordenescompra` (
  `det_id_ordenes` int NOT NULL AUTO_INCREMENT,
  `det_cantidad_orde` int NOT NULL,
  `det_totalPorProducto` double NOT NULL,
  `fk_det_ord_id` int NOT NULL,
  `fk_det_producto_id` int NOT NULL,
  PRIMARY KEY (`det_id_ordenes`),
  KEY `fk_tbl_detalleOrdenesCompra_tbl_ordenesCompra1` (`fk_det_ord_id`),
  KEY `fk_tbl_detalleOrdenesCompra_tbl_productos1` (`fk_det_producto_id`),
  CONSTRAINT `fk_tbl_detalleOrdenesCompra_tbl_ordenesCompra1` FOREIGN KEY (`fk_det_ord_id`) REFERENCES `tbl_ordenescompra` (`ord_id`),
  CONSTRAINT `fk_tbl_detalleOrdenesCompra_tbl_productos1` FOREIGN KEY (`fk_det_producto_id`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalleordenescompra`
--

LOCK TABLES `tbl_detalleordenescompra` WRITE;
/*!40000 ALTER TABLE `tbl_detalleordenescompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalleordenescompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detallesmovimiento`
--

DROP TABLE IF EXISTS `tbl_detallesmovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detallesmovimiento` (
  `Pk_DocumentoID` int NOT NULL,
  `Pk_AlmacenID` varchar(50) NOT NULL,
  `Doc_Numero` varchar(50) NOT NULL,
  `Doc_Fecha` varchar(50) NOT NULL,
  `Pk_ProductoID` varchar(50) NOT NULL,
  `Prod_Nombre` varchar(50) NOT NULL,
  `DetMov_Cantidad` varchar(50) NOT NULL,
  `Det_MovCostoTotal` varchar(50) NOT NULL,
  `Prod_PrecioUnitario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Pk_DocumentoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detallesmovimiento`
--

LOCK TABLES `tbl_detallesmovimiento` WRITE;
/*!40000 ALTER TABLE `tbl_detallesmovimiento` DISABLE KEYS */;
INSERT INTO `tbl_detallesmovimiento` VALUES (1,'Alm1','001','2023-11-07','Prod1','Producto 1','10','100.00','10.00'),(2,'Alm2','002','2023-11-07','Prod2','Producto 2','15','150.00','10.00'),(3,'Alm3','003','2023-11-07','Prod3','Producto 3','20','200.00','10.00');
/*!40000 ALTER TABLE `tbl_detallesmovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleado`
--

DROP TABLE IF EXISTS `tbl_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empleado` (
  `Pk_id_empleado` int NOT NULL,
  `emp_nombre` varchar(50) NOT NULL,
  `emp_apellido` varchar(50) NOT NULL,
  `emp_sueldo` int NOT NULL,
  `emp_tipo_moneda` varchar(50) NOT NULL,
  `emp_cargo` varchar(50) NOT NULL,
  `emp_correo` varchar(50) NOT NULL,
  `emp_telefono` varchar(50) NOT NULL,
  `emp_fecha_contratacion` varchar(50) NOT NULL,
  `tbl_departamento_Pk_id_departamento` int NOT NULL,
  PRIMARY KEY (`Pk_id_empleado`),
  KEY `fk_tbl_empleado_tbl_departamento1_idx` (`tbl_departamento_Pk_id_departamento`),
  CONSTRAINT `fk_tbl_empleado_tbl_departamento1` FOREIGN KEY (`tbl_departamento_Pk_id_departamento`) REFERENCES `tbl_departamento` (`Pk_id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado`
--

LOCK TABLES `tbl_empleado` WRITE;
/*!40000 ALTER TABLE `tbl_empleado` DISABLE KEYS */;
INSERT INTO `tbl_empleado` VALUES (1,'Otto','Lopez',12500,'Q','sub gerente','otlpez@mail.com','1234-1243','03/04/2022',1),(2,'Jose','Noriego',5000,'Q','Guardia','JosNor@mail.com','2456-5625','04-25-2022',2),(3,'Luis','Ventura',5000,'$','Jefe ','luiventura@mail.com','1233-4214','02/04/2022',3),(4,'Jose','Cercado',5500,'Q','Guardia','jocer@mail.com','2532-6514','02/06/2021',2);
/*!40000 ALTER TABLE `tbl_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleado_GC`
--

DROP TABLE IF EXISTS `tbl_empleado_GC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empleado_GC` (
  `emp_id_GC` int NOT NULL AUTO_INCREMENT,
  `emp_nombre_GC` varchar(255) DEFAULT NULL,
  `emp_departamento_GC` varchar(255) DEFAULT NULL,
  `emp_cargo_GC` varchar(255) DEFAULT NULL,
  `emp_telefono_GC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emp_id_GC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado_GC`
--

LOCK TABLES `tbl_empleado_GC` WRITE;
/*!40000 ALTER TABLE `tbl_empleado_GC` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_empleado_GC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_encabezadomovimientocliente`
--

DROP TABLE IF EXISTS `tbl_encabezadomovimientocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_encabezadomovimientocliente` (
  `id_EncabezadoCliente` int NOT NULL AUTO_INCREMENT,
  `CodigoCliente` int NOT NULL,
  `encabezadoCliente_FechaEmision` date NOT NULL,
  `encabezadoCliente_FechaVencimiento` date NOT NULL,
  `encabezadoCliente_Factura` int DEFAULT NULL,
  PRIMARY KEY (`id_EncabezadoCliente`),
  KEY `CodigoCliente` (`CodigoCliente`),
  CONSTRAINT `tbl_encabezadomovimientocliente_ibfk_1` FOREIGN KEY (`CodigoCliente`) REFERENCES `tbl_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_encabezadomovimientocliente`
--

LOCK TABLES `tbl_encabezadomovimientocliente` WRITE;
/*!40000 ALTER TABLE `tbl_encabezadomovimientocliente` DISABLE KEYS */;
INSERT INTO `tbl_encabezadomovimientocliente` VALUES (7,1,'2023-10-27','2023-10-27',123);
/*!40000 ALTER TABLE `tbl_encabezadomovimientocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_encabezadomovimientoproveedor`
--

DROP TABLE IF EXISTS `tbl_encabezadomovimientoproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_encabezadomovimientoproveedor` (
  `id_EncabezadoProveedor` int NOT NULL AUTO_INCREMENT,
  `CodigoProveedor` int NOT NULL,
  `encabezadoProveedor_FechaEmision` date NOT NULL,
  `encabezadoProveedor_FechaVencimiento` date NOT NULL,
  `encabezadoProveedor_Factura` int DEFAULT NULL,
  PRIMARY KEY (`id_EncabezadoProveedor`),
  KEY `CodigoProveedor` (`CodigoProveedor`),
  CONSTRAINT `tbl_encabezadomovimientoproveedor_ibfk_1` FOREIGN KEY (`CodigoProveedor`) REFERENCES `tbl_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_encabezadomovimientoproveedor`
--

LOCK TABLES `tbl_encabezadomovimientoproveedor` WRITE;
/*!40000 ALTER TABLE `tbl_encabezadomovimientoproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_encabezadomovimientoproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_entrada`
--

DROP TABLE IF EXISTS `tbl_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_entrada` (
  `in_id` int NOT NULL AUTO_INCREMENT,
  `in_id_evaluacion` int NOT NULL,
  `in_id_cliente` int NOT NULL,
  `in_id_habitacion` int NOT NULL,
  PRIMARY KEY (`in_id`),
  KEY `in_id_cliente` (`in_id_cliente`),
  KEY `in_id_habitacion` (`in_id_habitacion`),
  KEY `in_id_evaluacion` (`in_id_evaluacion`),
  CONSTRAINT `tbl_entrada_ibfk_1` FOREIGN KEY (`in_id_cliente`) REFERENCES `tbl_Cliente` (`cli_id`),
  CONSTRAINT `tbl_entrada_ibfk_2` FOREIGN KEY (`in_id_habitacion`) REFERENCES `tbl_habitacion` (`hab_id`),
  CONSTRAINT `tbl_entrada_ibfk_3` FOREIGN KEY (`in_id_evaluacion`) REFERENCES `tbl_evaluacion` (`eva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_entrada`
--

LOCK TABLES `tbl_entrada` WRITE;
/*!40000 ALTER TABLE `tbl_entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estados`
--

DROP TABLE IF EXISTS `tbl_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estados` (
  `pk_id_estado` int NOT NULL AUTO_INCREMENT,
  `est_info_estado` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `est_num_estado` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estados`
--

LOCK TABLES `tbl_estados` WRITE;
/*!40000 ALTER TABLE `tbl_estados` DISABLE KEYS */;
INSERT INTO `tbl_estados` VALUES (1,'Activo',1),(2,'Eliminado',2),(3,'Modificado',3);
/*!40000 ALTER TABLE `tbl_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_evaluacion`
--

DROP TABLE IF EXISTS `tbl_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_evaluacion` (
  `eva_id` int NOT NULL AUTO_INCREMENT,
  `eva_fecha` date NOT NULL,
  `eva_descripcion` varchar(100) NOT NULL,
  `eva_estado_calidad` int NOT NULL,
  `eva_id_empleado` int NOT NULL,
  PRIMARY KEY (`eva_id`),
  KEY `eva_id_empleado` (`eva_id_empleado`),
  CONSTRAINT `tbl_evaluacion_ibfk_1` FOREIGN KEY (`eva_id_empleado`) REFERENCES `tbl_Empleado` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_evaluacion`
--

LOCK TABLES `tbl_evaluacion` WRITE;
/*!40000 ALTER TABLE `tbl_evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_habitacion`
--

DROP TABLE IF EXISTS `tbl_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_habitacion` (
  `hab_id` int NOT NULL AUTO_INCREMENT,
  `hab_numero` int NOT NULL,
  `hab_tipo` int NOT NULL,
  `hab_estado` int NOT NULL,
  PRIMARY KEY (`hab_id`),
  KEY `hab_tipo` (`hab_tipo`),
  CONSTRAINT `tbl_habitacion_ibfk_1` FOREIGN KEY (`hab_tipo`) REFERENCES `tbl_tipohabitacion` (`thab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_habitacion`
--

LOCK TABLES `tbl_habitacion` WRITE;
/*!40000 ALTER TABLE `tbl_habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mantenimientos`
--

DROP TABLE IF EXISTS `tbl_mantenimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mantenimientos` (
  `pk_Man_id` int NOT NULL,
  `Man_codigo` varchar(255) DEFAULT NULL,
  `Man_nombre` varchar(255) DEFAULT NULL,
  `Man_cuenta` varchar(255) DEFAULT NULL,
  `Man_fecha` date DEFAULT NULL,
  `Man_almacen` varchar(255) DEFAULT NULL,
  `Man_Tipo` varchar(255) DEFAULT NULL,
  `Man_Estatus` varchar(255) DEFAULT NULL,
  `Man_relacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_Man_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mantenimientos`
--

LOCK TABLES `tbl_mantenimientos` WRITE;
/*!40000 ALTER TABLE `tbl_mantenimientos` DISABLE KEYS */;
INSERT INTO `tbl_mantenimientos` VALUES (1,'MNT001','Mantenimiento 1','Cuenta 001','2023-10-26','Almacén 1','Preventivo','Pendiente','Relación 1'),(2,'MNT002','Mantenimiento 2','Cuenta 002','2023-10-27','Almacén 2','Correctivo','Completado','Relación 2'),(3,'MNT003','Mantenimiento 3','Cuenta 003','2023-10-28','Almacén 1','Preventivo','Pendiente','Relación 3');
/*!40000 ALTER TABLE `tbl_mantenimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mantenimientos_agregar_bancos`
--

DROP TABLE IF EXISTS `tbl_mantenimientos_agregar_bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mantenimientos_agregar_bancos` (
  `pk_manag_id_ban` int NOT NULL AUTO_INCREMENT,
  `manag_id_bancoag` int DEFAULT NULL,
  `manag_nombre_banco` varchar(100) DEFAULT NULL,
  `manag_status` int DEFAULT NULL,
  PRIMARY KEY (`pk_manag_id_ban`),
  UNIQUE KEY `manag_nombre_banco` (`manag_nombre_banco`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mantenimientos_agregar_bancos`
--

LOCK TABLES `tbl_mantenimientos_agregar_bancos` WRITE;
/*!40000 ALTER TABLE `tbl_mantenimientos_agregar_bancos` DISABLE KEYS */;
INSERT INTO `tbl_mantenimientos_agregar_bancos` VALUES (1,111,'Banco industrial',1),(2,222,'Banrural',1),(3,333,'G&T Continental',1),(4,503,'BAC',1),(5,504,'Mi coperativa',1);
/*!40000 ALTER TABLE `tbl_mantenimientos_agregar_bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mantenimientos_agregar_cuenta`
--

DROP TABLE IF EXISTS `tbl_mantenimientos_agregar_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mantenimientos_agregar_cuenta` (
  `pk_manac_id_cuenta` int NOT NULL AUTO_INCREMENT,
  `manac_numero_de_cuenta` int DEFAULT NULL,
  `fk_manac_tipo_de_moneda` varchar(100) DEFAULT NULL,
  `manac_tipo_de_cuenta` varchar(100) DEFAULT NULL,
  `fk_manac_selec_banco` varchar(50) DEFAULT NULL,
  `manac_alias` varchar(100) DEFAULT NULL,
  `manac_status` int DEFAULT NULL,
  PRIMARY KEY (`pk_manac_id_cuenta`),
  UNIQUE KEY `manac_numero_de_cuenta` (`manac_numero_de_cuenta`),
  KEY `fk_manac_selec_banco` (`fk_manac_selec_banco`),
  KEY `fk_manac_tipo_de_moneda` (`fk_manac_tipo_de_moneda`),
  CONSTRAINT `tbl_mantenimientos_agregar_cuenta_ibfk_1` FOREIGN KEY (`fk_manac_selec_banco`) REFERENCES `tbl_mantenimientos_agregar_bancos` (`manag_nombre_banco`),
  CONSTRAINT `tbl_mantenimientos_agregar_cuenta_ibfk_2` FOREIGN KEY (`fk_manac_tipo_de_moneda`) REFERENCES `tbl_monedabanco` (`mon_nomMoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mantenimientos_agregar_cuenta`
--

LOCK TABLES `tbl_mantenimientos_agregar_cuenta` WRITE;
/*!40000 ALTER TABLE `tbl_mantenimientos_agregar_cuenta` DISABLE KEYS */;
INSERT INTO `tbl_mantenimientos_agregar_cuenta` VALUES (1,10001,'Quetzales','Ahorro','Banco industrial','Luis Franco',1),(2,10002,'Dólares','Monetaria','Banrural','Juan Perez',1),(3,10003,'Quetzales','Credito','G&T Continental','Andrea Corado',1),(4,10004,'Dólares','Credito','Mi coperativa','Cecilia Paiz',1);
/*!40000 ALTER TABLE `tbl_mantenimientos_agregar_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mantenimientos_ordenes_compra`
--

DROP TABLE IF EXISTS `tbl_mantenimientos_ordenes_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mantenimientos_ordenes_compra` (
  `pk_manoc_id_ordenc` int NOT NULL AUTO_INCREMENT,
  `manoc_id_autorización` int DEFAULT NULL,
  `manoc_nombre_compra` varchar(100) DEFAULT NULL,
  `manoc_nombre_proveedor` varchar(100) DEFAULT NULL,
  `manoc_monto` float DEFAULT NULL,
  `manoc_descripcion` varchar(100) DEFAULT NULL,
  `manoc_tipo_compra` varchar(100) DEFAULT NULL,
  `fk_manoc_tipo_moneda` varchar(100) DEFAULT NULL,
  `manoc_status` int DEFAULT NULL,
  PRIMARY KEY (`pk_manoc_id_ordenc`),
  KEY `fk_manoc_tipo_moneda` (`fk_manoc_tipo_moneda`),
  CONSTRAINT `tbl_mantenimientos_ordenes_compra_ibfk_1` FOREIGN KEY (`fk_manoc_tipo_moneda`) REFERENCES `tbl_monedabanco` (`mon_nomMoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mantenimientos_ordenes_compra`
--

LOCK TABLES `tbl_mantenimientos_ordenes_compra` WRITE;
/*!40000 ALTER TABLE `tbl_mantenimientos_ordenes_compra` DISABLE KEYS */;
INSERT INTO `tbl_mantenimientos_ordenes_compra` VALUES (1,12252,'Cafe','Walmart',10000,'Marca coban','Cheque','Quetzales',1);
/*!40000 ALTER TABLE `tbl_mantenimientos_ordenes_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mantenimientos_tipo_movimiento`
--

DROP TABLE IF EXISTS `tbl_mantenimientos_tipo_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mantenimientos_tipo_movimiento` (
  `pk_movtm_id_transaccion` int NOT NULL AUTO_INCREMENT,
  `movtm_transacciones_existentes` varchar(100) DEFAULT NULL,
  `movtm_status` int DEFAULT NULL,
  `movtm_valor_transaccion` int NOT NULL,
  PRIMARY KEY (`pk_movtm_id_transaccion`),
  UNIQUE KEY `movtm_transacciones_existentes` (`movtm_transacciones_existentes`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mantenimientos_tipo_movimiento`
--

LOCK TABLES `tbl_mantenimientos_tipo_movimiento` WRITE;
/*!40000 ALTER TABLE `tbl_mantenimientos_tipo_movimiento` DISABLE KEYS */;
INSERT INTO `tbl_mantenimientos_tipo_movimiento` VALUES (1,'Debito',1,0),(2,'Credito',1,1),(3,'Caja Chica',1,1),(4,'Prestamo',1,1);
/*!40000 ALTER TABLE `tbl_mantenimientos_tipo_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modulos`
--

DROP TABLE IF EXISTS `tbl_modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_modulos` (
  `pk_id_modulos` int NOT NULL,
  `nombre_modulo` varchar(50) NOT NULL,
  `descripcion_modulo` varchar(150) NOT NULL,
  `estado_modulo` tinyint DEFAULT '0',
  PRIMARY KEY (`pk_id_modulos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modulos`
--

LOCK TABLES `tbl_modulos` WRITE;
/*!40000 ALTER TABLE `tbl_modulos` DISABLE KEYS */;
INSERT INTO `tbl_modulos` VALUES (1000,'SEGURIDAD','Seguridad',1),(2000,'COMPRAS CUENTAS POR PAGAR','Compras cuentas por pagar',1),(3000,'VENTAS CUENTAS POR COBRAR','Ventas cuentas por cobrar',1),(4000,'LOGISTICA','Inventario',1),(5000,'BANCOS','Bancos',1),(6000,'NOMINAS','Nominas',1),(7000,'Hoteleria','Hoteleria',1);
/*!40000 ALTER TABLE `tbl_modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_moneda`
--

DROP TABLE IF EXISTS `tbl_moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_moneda` (
  `mon_id_moneda` int NOT NULL AUTO_INCREMENT,
  `fk_mon_nombre_moneda` varchar(50) DEFAULT NULL,
  `mon_Cant_moneda` float DEFAULT NULL,
  `mon_status` int DEFAULT NULL,
  PRIMARY KEY (`mon_id_moneda`),
  KEY `fk_mon_nombre_moneda` (`fk_mon_nombre_moneda`),
  CONSTRAINT `tbl_moneda_ibfk_1` FOREIGN KEY (`fk_mon_nombre_moneda`) REFERENCES `tbl_registro_moneda` (`regmon_Tipo_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_moneda`
--

LOCK TABLES `tbl_moneda` WRITE;
/*!40000 ALTER TABLE `tbl_moneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_monedabanco`
--

DROP TABLE IF EXISTS `tbl_monedabanco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_monedabanco` (
  `pk_mon_id_moneda` int NOT NULL AUTO_INCREMENT,
  `mon_nomMoneda` varchar(100) DEFAULT NULL,
  `mon_status` int DEFAULT NULL,
  PRIMARY KEY (`pk_mon_id_moneda`),
  UNIQUE KEY `mon_nomMoneda` (`mon_nomMoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_monedabanco`
--

LOCK TABLES `tbl_monedabanco` WRITE;
/*!40000 ALTER TABLE `tbl_monedabanco` DISABLE KEYS */;
INSERT INTO `tbl_monedabanco` VALUES (1,'Quetzales',NULL),(2,'Dólares',NULL);
/*!40000 ALTER TABLE `tbl_monedabanco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mov_inventario`
--

DROP TABLE IF EXISTS `tbl_mov_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mov_inventario` (
  `pk_id` int NOT NULL,
  `mov_almacen` varchar(255) DEFAULT NULL,
  `mov_movimiento` varchar(255) DEFAULT NULL,
  `mov_documento` varchar(255) DEFAULT NULL,
  `mov_fecha` date DEFAULT NULL,
  `mov_cod_producto` varchar(255) DEFAULT NULL,
  `mov_medida_producto` varchar(255) DEFAULT NULL,
  `mov_cantidad` int DEFAULT NULL,
  `mov_costo` double DEFAULT NULL,
  `mov_preciou` double DEFAULT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mov_inventario`
--

LOCK TABLES `tbl_mov_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_mov_inventario` DISABLE KEYS */;
INSERT INTO `tbl_mov_inventario` VALUES (1,'Almacen A','Entrada','Documento 1','2023-11-03','COD001','Unidades',100,10,15),(2,'Almacen B','Salida','Documento 2','2023-11-03','COD002','Kilos',50,5,7);
/*!40000 ALTER TABLE `tbl_mov_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_movimientosBancarios`
--

DROP TABLE IF EXISTS `tbl_movimientosBancarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_movimientosBancarios` (
  `pk_movban_id_transaccion` int NOT NULL AUTO_INCREMENT,
  `movban_valor_transaccion` float NOT NULL,
  `movban_descripcion_transaccion` varchar(100) DEFAULT NULL,
  `fk_movban_num_cuenta` int DEFAULT NULL,
  `fk_movban_tipo_transaccion` varchar(50) DEFAULT NULL,
  `fk_movban_valorTrans` int NOT NULL,
  `movban_status` int DEFAULT NULL,
  `movban_fecha_de_ingreso` datetime DEFAULT NULL,
  `manag_status_conciliacion` int NOT NULL,
  PRIMARY KEY (`pk_movban_id_transaccion`),
  KEY `fk_movban_num_cuenta` (`fk_movban_num_cuenta`),
  KEY `fk_movban_tipo_transaccion` (`fk_movban_tipo_transaccion`),
  CONSTRAINT `tbl_movimientosBancarios_ibfk_1` FOREIGN KEY (`fk_movban_num_cuenta`) REFERENCES `tbl_mantenimientos_agregar_cuenta` (`manac_numero_de_cuenta`),
  CONSTRAINT `tbl_movimientosBancarios_ibfk_2` FOREIGN KEY (`fk_movban_tipo_transaccion`) REFERENCES `tbl_mantenimientos_tipo_movimiento` (`movtm_transacciones_existentes`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_movimientosBancarios`
--

LOCK TABLES `tbl_movimientosBancarios` WRITE;
/*!40000 ALTER TABLE `tbl_movimientosBancarios` DISABLE KEYS */;
INSERT INTO `tbl_movimientosBancarios` VALUES (1,100,'Pago recibido',10001,'Credito',1,1,'2023-11-10 09:39:19',0),(2,100,'Reintegro',10001,'Credito',1,1,'2023-11-10 09:42:48',0),(3,100,'Pago por servicio',10003,'Credito',1,1,'2023-11-10 10:15:59',0),(4,150,'Pago realizado',10002,'Debito',0,1,'2023-11-10 10:16:28',0);
/*!40000 ALTER TABLE `tbl_movimientosBancarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nomina`
--

DROP TABLE IF EXISTS `tbl_nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nomina` (
  `Pk_id_nomina` int NOT NULL AUTO_INCREMENT,
  `nomi_tipo_moneda` varchar(50) NOT NULL,
  `nomi_sueldo_base` varchar(50) NOT NULL,
  `nomi_total_percepciones` varchar(50) NOT NULL,
  `nomi_total_deducciones` varchar(50) NOT NULL,
  `nomi_sueldo_final` varchar(50) NOT NULL,
  `tbl_empleado_Pk_id_empleado` int NOT NULL,
  PRIMARY KEY (`Pk_id_nomina`),
  KEY `fk_tbl_nomina_tbl_empleado1_idx` (`tbl_empleado_Pk_id_empleado`),
  CONSTRAINT `fk_tbl_nomina_tbl_empleado1` FOREIGN KEY (`tbl_empleado_Pk_id_empleado`) REFERENCES `tbl_empleado` (`Pk_id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nomina`
--

LOCK TABLES `tbl_nomina` WRITE;
/*!40000 ALTER TABLE `tbl_nomina` DISABLE KEYS */;
INSERT INTO `tbl_nomina` VALUES (2,'Q','12500','250','2403.75002','10346.24998',1),(3,'$','5000','1850','606.50001','6243.49999',3);
/*!40000 ALTER TABLE `tbl_nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenescompra`
--

DROP TABLE IF EXISTS `tbl_ordenescompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenescompra` (
  `ord_id` int NOT NULL AUTO_INCREMENT,
  `ord_FechaSolicitud` date DEFAULT NULL,
  `ord_FechaEntrega` date DEFAULT NULL,
  `ord_deptosolicitante` varchar(255) DEFAULT NULL,
  `ord_subtotal` double NOT NULL,
  `ord_iva` double NOT NULL,
  `ord_totalOrden` double NOT NULL,
  `ord_totalLetras` varchar(255) DEFAULT NULL,
  `fk_proveedor_id` int NOT NULL,
  `ord_entregara` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `fk_tbl_ordenesCompra_tbl_proveedor1` (`fk_proveedor_id`),
  CONSTRAINT `fk_tbl_ordenesCompra_tbl_proveedor1` FOREIGN KEY (`fk_proveedor_id`) REFERENCES `tbl_proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenescompra`
--

LOCK TABLES `tbl_ordenescompra` WRITE;
/*!40000 ALTER TABLE `tbl_ordenescompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenescompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_percepciones`
--

DROP TABLE IF EXISTS `tbl_percepciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_percepciones` (
  `Pk_id_percepciones` int NOT NULL AUTO_INCREMENT,
  `perc_totales` varchar(50) NOT NULL,
  `perc_fecha_perc` varchar(50) NOT NULL,
  `tbl_empleado_Pk_id_empleado` int NOT NULL,
  PRIMARY KEY (`Pk_id_percepciones`),
  KEY `fk_tbl_deducciones_tbl_empleado_idx` (`tbl_empleado_Pk_id_empleado`),
  CONSTRAINT `fk_tbl_deducciones_tbl_empleado0` FOREIGN KEY (`tbl_empleado_Pk_id_empleado`) REFERENCES `tbl_empleado` (`Pk_id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_percepciones`
--

LOCK TABLES `tbl_percepciones` WRITE;
/*!40000 ALTER TABLE `tbl_percepciones` DISABLE KEYS */;
INSERT INTO `tbl_percepciones` VALUES (1,'250.00','2023-11-01 08:00:00',1),(2,'950.00000','2023-11-08 00:00:00',2),(3,'1,850.00000','2023-11-08 00:00:00',3);
/*!40000 ALTER TABLE `tbl_percepciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perfiles`
--

DROP TABLE IF EXISTS `tbl_perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_perfiles` (
  `pk_id_perfil` int NOT NULL AUTO_INCREMENT,
  `nombre_perfil` varchar(50) NOT NULL,
  `descripcion_perfil` varchar(150) NOT NULL,
  `estado_perfil` tinyint DEFAULT '0',
  PRIMARY KEY (`pk_id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perfiles`
--

LOCK TABLES `tbl_perfiles` WRITE;
/*!40000 ALTER TABLE `tbl_perfiles` DISABLE KEYS */;
INSERT INTO `tbl_perfiles` VALUES (1,'ADMINISTRADOR','contiene todos los permisos del programa',1),(2,'SEGURIDAD','contiene todos los permisos de seguridad',1);
/*!40000 ALTER TABLE `tbl_perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permisosAplicacionPerfil`
--

DROP TABLE IF EXISTS `tbl_permisosAplicacionPerfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_permisosAplicacionPerfil` (
  `fk_id_perfil` int NOT NULL,
  `fk_id_aplicacion` int NOT NULL,
  `guardar_permiso` tinyint(1) DEFAULT '0',
  `modificar_permiso` tinyint(1) DEFAULT '0',
  `eliminar_permiso` tinyint(1) DEFAULT '0',
  `buscar_permiso` tinyint(1) DEFAULT '0',
  `imprimir_permiso` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`fk_id_perfil`,`fk_id_aplicacion`),
  KEY `fk_id_aplicacion` (`fk_id_aplicacion`),
  CONSTRAINT `tbl_permisosAplicacionPerfil_ibfk_1` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  CONSTRAINT `tbl_permisosAplicacionPerfil_ibfk_2` FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permisosAplicacionPerfil`
--

LOCK TABLES `tbl_permisosAplicacionPerfil` WRITE;
/*!40000 ALTER TABLE `tbl_permisosAplicacionPerfil` DISABLE KEYS */;
INSERT INTO `tbl_permisosAplicacionPerfil` VALUES (1,1000,1,1,1,1,1),(1,1001,1,1,1,1,1),(1,1002,1,1,1,1,1),(1,1003,1,1,1,1,1),(1,1004,1,1,1,1,1),(1,1101,1,1,1,1,1),(1,1102,1,1,1,1,1),(1,1103,1,1,1,1,1),(1,1201,1,1,1,1,1),(1,1301,1,1,1,1,1),(1,2000,1,1,1,1,1),(1,2001,1,1,1,1,1),(1,2002,1,1,1,1,1),(1,2003,1,1,1,1,1),(1,2004,1,1,1,1,1),(1,2005,1,1,1,1,1),(1,3000,1,1,1,1,1),(1,3001,1,1,1,1,1),(1,3002,1,1,1,1,1),(1,3003,1,1,1,1,1),(1,3004,1,1,1,1,1),(1,3005,1,1,1,1,1),(1,3006,1,1,1,1,1),(1,3007,1,1,1,1,1),(1,3008,1,1,1,1,1),(1,4000,1,1,1,1,1),(1,4001,1,1,1,1,1),(1,4002,1,1,1,1,1),(1,4003,1,1,1,1,1),(1,4004,1,1,1,1,1),(1,4005,1,1,1,1,1),(1,5000,1,1,1,1,1),(1,5001,1,1,1,1,1),(1,5002,1,1,1,1,1),(1,5003,1,1,1,1,1),(1,5004,1,1,1,1,1),(1,5005,1,1,1,1,1),(1,5006,1,1,1,1,1),(1,5007,1,1,1,1,1),(1,5008,1,1,1,1,1),(1,5009,1,1,1,1,1),(1,6000,1,1,1,1,1),(1,6001,1,1,1,1,1),(1,6002,1,1,1,1,1),(1,6003,1,1,1,1,1),(1,6004,1,1,1,1,1),(1,6005,1,1,1,1,1),(1,7000,1,1,1,1,1),(1,7001,1,1,1,1,1),(1,7002,1,1,1,1,1),(1,7003,1,1,1,1,1),(1,7004,1,1,1,1,1),(1,7005,1,1,1,1,1),(1,7006,1,1,1,1,1),(1,7007,1,1,1,1,1),(1,7008,1,1,1,1,1),(1,7009,1,1,1,1,1);
/*!40000 ALTER TABLE `tbl_permisosAplicacionPerfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permisosaplicacionesusuario`
--

DROP TABLE IF EXISTS `tbl_permisosaplicacionesusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_permisosaplicacionesusuario` (
  `fk_id_aplicacion` int NOT NULL,
  `fk_id_usuario` int NOT NULL,
  `guardar_permiso` tinyint(1) DEFAULT '0',
  `modificar_permiso` tinyint(1) DEFAULT '0',
  `eliminar_permiso` tinyint(1) DEFAULT '0',
  `buscar_permiso` tinyint(1) DEFAULT '0',
  `imprimir_permiso` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`fk_id_aplicacion`,`fk_id_usuario`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  CONSTRAINT `tbl_permisosaplicacionesusuario_ibfk_1` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  CONSTRAINT `tbl_permisosaplicacionesusuario_ibfk_2` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permisosaplicacionesusuario`
--

LOCK TABLES `tbl_permisosaplicacionesusuario` WRITE;
/*!40000 ALTER TABLE `tbl_permisosaplicacionesusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_permisosaplicacionesusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productos`
--

DROP TABLE IF EXISTS `tbl_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `pro_nombre` varchar(255) DEFAULT NULL,
  `pro_descripcion` varchar(255) DEFAULT NULL,
  `pro_preciounitario` double NOT NULL,
  `pro_fecha` date DEFAULT NULL,
  `pro_monto` double DEFAULT NULL,
  `pro_disponibilidad` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productos`
--

LOCK TABLES `tbl_productos` WRITE;
/*!40000 ALTER TABLE `tbl_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proveedor`
--

DROP TABLE IF EXISTS `tbl_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `pro_Nombre` varchar(60) NOT NULL,
  `pro_Domicilio` varchar(60) NOT NULL,
  `pro_Nit` int NOT NULL,
  `pro_Telefono` int NOT NULL,
  `pro_Tipo` varchar(60) NOT NULL,
  `pro_Estado` varchar(60) NOT NULL,
  `pro_RepresentanteLegal` varchar(60) NOT NULL,
  `pro_Empresa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proveedor`
--

LOCK TABLES `tbl_proveedor` WRITE;
/*!40000 ALTER TABLE `tbl_proveedor` DISABLE KEYS */;
INSERT INTO `tbl_proveedor` VALUES (1,'Gustavo Zepeda','Guatemala, Guatemala',78996,85741233,'Servicios Sanitarios','Activo','Gonzales','Soluciones SA');
/*!40000 ALTER TABLE `tbl_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_registro_moneda`
--

DROP TABLE IF EXISTS `tbl_registro_moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_registro_moneda` (
  `regmon_id_Moneda` int NOT NULL AUTO_INCREMENT,
  `regmon_Tipo_moneda` varchar(100) DEFAULT NULL,
  `regmon_Valor_moneda` float DEFAULT NULL,
  `regmon_fecha_de_registro` datetime DEFAULT NULL,
  `regmon_status` int DEFAULT NULL,
  PRIMARY KEY (`regmon_id_Moneda`),
  UNIQUE KEY `regmon_Tipo_moneda` (`regmon_Tipo_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_registro_moneda`
--

LOCK TABLES `tbl_registro_moneda` WRITE;
/*!40000 ALTER TABLE `tbl_registro_moneda` DISABLE KEYS */;
INSERT INTO `tbl_registro_moneda` VALUES (1,'Euro',8.2,'2023-11-10 00:00:00',1);
/*!40000 ALTER TABLE `tbl_registro_moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reporte_nomina`
--

DROP TABLE IF EXISTS `tbl_reporte_nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reporte_nomina` (
  `Pk_id_reporte` int NOT NULL,
  `rep_fecha` datetime NOT NULL,
  `rep_descripcion` varchar(50) NOT NULL,
  `tbl_empleado_Pk_id_empleado` int NOT NULL,
  PRIMARY KEY (`Pk_id_reporte`),
  KEY `fk_tbl_reporte_nomina_tbl_empleado_idx` (`tbl_empleado_Pk_id_empleado`),
  CONSTRAINT `fk_tbl_reporte_nomina_tbl_empleado` FOREIGN KEY (`tbl_empleado_Pk_id_empleado`) REFERENCES `tbl_empleado` (`Pk_id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reporte_nomina`
--

LOCK TABLES `tbl_reporte_nomina` WRITE;
/*!40000 ALTER TABLE `tbl_reporte_nomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reporte_nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reportes`
--

DROP TABLE IF EXISTS `tbl_reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reportes` (
  `pk_id_reporte` int NOT NULL AUTO_INCREMENT,
  `rep_correlativo` int DEFAULT NULL,
  `rep_nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fk_estado` int DEFAULT NULL,
  `rep_fecha` datetime DEFAULT NULL,
  `rep_archivo` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `rep_fechaMod` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_id_reporte`),
  UNIQUE KEY `rep_correlativo` (`rep_correlativo`),
  KEY `fk_estado` (`fk_estado`),
  CONSTRAINT `tbl_reportes_ibfk_1` FOREIGN KEY (`fk_estado`) REFERENCES `tbl_estados` (`pk_id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reportes`
--

LOCK TABLES `tbl_reportes` WRITE;
/*!40000 ALTER TABLE `tbl_reportes` DISABLE KEYS */;
INSERT INTO `tbl_reportes` VALUES (10,10002,'planilssla.txt',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reservacion`
--

DROP TABLE IF EXISTS `tbl_reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reservacion` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_id_habitacion` int NOT NULL,
  `res_id_cliente` int NOT NULL,
  `res_fecha` date NOT NULL,
  `res_id_empleado` int NOT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`res_id`),
  KEY `res_id_habitacion` (`res_id_habitacion`),
  KEY `res_id_cliente` (`res_id_cliente`),
  KEY `res_id_empleado` (`res_id_empleado`),
  CONSTRAINT `tbl_reservacion_ibfk_1` FOREIGN KEY (`res_id_habitacion`) REFERENCES `tbl_habitacion` (`hab_id`),
  CONSTRAINT `tbl_reservacion_ibfk_2` FOREIGN KEY (`res_id_cliente`) REFERENCES `tbl_Cliente` (`cli_id`),
  CONSTRAINT `tbl_reservacion_ibfk_3` FOREIGN KEY (`res_id_empleado`) REFERENCES `tbl_Empleado` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reservacion`
--

LOCK TABLES `tbl_reservacion` WRITE;
/*!40000 ALTER TABLE `tbl_reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_salida`
--

DROP TABLE IF EXISTS `tbl_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_salida` (
  `in_id` int NOT NULL AUTO_INCREMENT,
  `in_id_evaluacion` int NOT NULL,
  `in_id_cliente` int NOT NULL,
  `in_id_habitacion` int NOT NULL,
  PRIMARY KEY (`in_id`),
  KEY `in_id_cliente` (`in_id_cliente`),
  KEY `in_id_habitacion` (`in_id_habitacion`),
  KEY `in_id_evaluacion` (`in_id_evaluacion`),
  CONSTRAINT `tbl_salida_ibfk_1` FOREIGN KEY (`in_id_cliente`) REFERENCES `tbl_Cliente` (`cli_id`),
  CONSTRAINT `tbl_salida_ibfk_2` FOREIGN KEY (`in_id_habitacion`) REFERENCES `tbl_habitacion` (`hab_id`),
  CONSTRAINT `tbl_salida_ibfk_3` FOREIGN KEY (`in_id_evaluacion`) REFERENCES `tbl_evaluacion` (`eva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_salida`
--

LOCK TABLES `tbl_salida` WRITE;
/*!40000 ALTER TABLE `tbl_salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipohabitacion`
--

DROP TABLE IF EXISTS `tbl_tipohabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipohabitacion` (
  `thab_id` int NOT NULL AUTO_INCREMENT,
  `thab_nombre` varchar(50) NOT NULL,
  `thab_descripcion` varchar(50) NOT NULL,
  `thab_precio` double NOT NULL,
  `thab_capacidad` int NOT NULL,
  PRIMARY KEY (`thab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipohabitacion`
--

LOCK TABLES `tbl_tipohabitacion` WRITE;
/*!40000 ALTER TABLE `tbl_tipohabitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipohabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuarios` (
  `pk_id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `username_usuario` varchar(20) NOT NULL,
  `password_usuario` varchar(100) NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `estado_usuario` tinyint NOT NULL DEFAULT '0',
  `pregunta` varchar(50) NOT NULL,
  `respuesta` varchar(50) NOT NULL,
  PRIMARY KEY (`pk_id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios`
--

LOCK TABLES `tbl_usuarios` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` VALUES (1,'admin','admin','admin','HO0aGo4nM94=','esduardo@gmail.com',1,'COLOR FAVORITO','X9yc1/l1b2A='),(2,'Nominas','Nominas','Nominas','GHc/gF0yX8VzItax3P5xZw==','Nominas@mail.om',1,'COLOR FAVORITO','GHc/gF0yX8VzItax3P5xZw=='),(3,'bancos','bancos','bancos','rjVSy0N0FTJj7MUKGIdYSA==','bancosxd@mail.com',1,'PRIMER MASCOTA','rjVSy0N0FTJj7MUKGIdYSA=='),(4,'compras','compras','compras','l6hPL9BGmSNMk0kF5k58xg==','compras@mail.com',1,'COLOR FAVORITO','l6hPL9BGmSNMk0kF5k58xg=='),(5,'inventario','inventario','inventario','KTxPMPC+v9mVkTFZTjCHjQ==','inventario@mail.com',1,'COLOR FAVORITO','KTxPMPC+v9mVkTFZTjCHjQ=='),(6,'hoteleria','hoteleria','hoteleria','Uw1V71j+mMWpYeQsg4plyQ==','hoteleria@mail.com',1,'COLOR FAVORITO','Uw1V71j+mMWpYeQsg4plyQ==');
/*!40000 ALTER TABLE `tbl_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vendedor`
--

DROP TABLE IF EXISTS `tbl_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vendedor` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `ven_nombre` varchar(255) DEFAULT NULL,
  `ven_Nit` int NOT NULL,
  `ven_cargo` varchar(255) DEFAULT NULL,
  `ven_telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vendedor`
--

LOCK TABLES `tbl_vendedor` WRITE;
/*!40000 ALTER TABLE `tbl_vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_aplicacion_perfil`
--

DROP TABLE IF EXISTS `vista_aplicacion_perfil`;
/*!50001 DROP VIEW IF EXISTS `vista_aplicacion_perfil`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_aplicacion_perfil` AS SELECT 
 1 AS `ID`,
 1 AS `Perfil`,
 1 AS `Aplicacion`,
 1 AS `Insertar`,
 1 AS `Modificar`,
 1 AS `Eliminar`,
 1 AS `Buscar`,
 1 AS `Reporte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_aplicacionusuario`
--

DROP TABLE IF EXISTS `vista_aplicacionusuario`;
/*!50001 DROP VIEW IF EXISTS `vista_aplicacionusuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_aplicacionusuario` AS SELECT 
 1 AS `Aplicacion`,
 1 AS `ID`,
 1 AS `Usuario`,
 1 AS `Insertar`,
 1 AS `Editar`,
 1 AS `Eliminar`,
 1 AS `Buscar`,
 1 AS `Reporte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_modulo_aplicacion`
--

DROP TABLE IF EXISTS `vista_modulo_aplicacion`;
/*!50001 DROP VIEW IF EXISTS `vista_modulo_aplicacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_modulo_aplicacion` AS SELECT 
 1 AS `ID`,
 1 AS `Modulo`,
 1 AS `Aplicacion`,
 1 AS `Nombre`,
 1 AS `Descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_perfil_usuario`
--

DROP TABLE IF EXISTS `vista_perfil_usuario`;
/*!50001 DROP VIEW IF EXISTS `vista_perfil_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_perfil_usuario` AS SELECT 
 1 AS `ID`,
 1 AS `Usuario`,
 1 AS `nickName`,
 1 AS `perfil`,
 1 AS `Nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bd_hoteleria_pruebas'
--

--
-- Dumping routines for database 'bd_hoteleria_pruebas'
--

--
-- Final view structure for view `vista_aplicacion_perfil`
--

/*!50001 DROP VIEW IF EXISTS `vista_aplicacion_perfil`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_aplicacion_perfil` AS select `b`.`fk_id_perfil` AS `ID`,`a`.`nombre_perfil` AS `Perfil`,`b`.`fk_id_aplicacion` AS `Aplicacion`,`b`.`guardar_permiso` AS `Insertar`,`b`.`modificar_permiso` AS `Modificar`,`b`.`eliminar_permiso` AS `Eliminar`,`b`.`buscar_permiso` AS `Buscar`,`b`.`imprimir_permiso` AS `Reporte` from (`tbl_permisosAplicacionPerfil` `b` join `tbl_perfiles` `a` on((`a`.`pk_id_perfil` = `b`.`fk_id_perfil`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_aplicacionusuario`
--

/*!50001 DROP VIEW IF EXISTS `vista_aplicacionusuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_aplicacionusuario` AS select `b`.`fk_id_aplicacion` AS `Aplicacion`,`b`.`fk_id_usuario` AS `ID`,`a`.`nombre_usuario` AS `Usuario`,`b`.`guardar_permiso` AS `Insertar`,`b`.`modificar_permiso` AS `Editar`,`b`.`eliminar_permiso` AS `Eliminar`,`b`.`buscar_permiso` AS `Buscar`,`b`.`imprimir_permiso` AS `Reporte` from (`tbl_permisosaplicacionesusuario` `b` join `tbl_usuarios` `a` on((`a`.`pk_id_usuario` = `b`.`fk_id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_modulo_aplicacion`
--

/*!50001 DROP VIEW IF EXISTS `vista_modulo_aplicacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_modulo_aplicacion` AS select `b`.`fk_id_modulos` AS `ID`,`a`.`nombre_modulo` AS `Modulo`,`b`.`fk_id_aplicacion` AS `Aplicacion`,`c`.`nombre_aplicacion` AS `Nombre`,`c`.`descripcion_aplicacion` AS `Descripcion` from ((`tbl_asignacionmoduloaplicacion` `b` join `tbl_modulos` `a` on((`a`.`pk_id_modulos` = `b`.`fk_id_modulos`))) join `tbl_aplicaciones` `c` on((`c`.`pk_id_aplicacion` = `b`.`fk_id_aplicacion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_perfil_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vista_perfil_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_perfil_usuario` AS select `b`.`fk_id_usuario` AS `ID`,`a`.`nombre_usuario` AS `Usuario`,`a`.`username_usuario` AS `nickName`,`b`.`fk_id_perfil` AS `perfil`,`c`.`nombre_perfil` AS `Nombre` from ((`tbl_asignacionesPerfilsUsuario` `b` join `tbl_usuarios` `a` on((`a`.`pk_id_usuario` = `b`.`fk_id_usuario`))) join `tbl_perfiles` `c` on((`c`.`pk_id_perfil` = `b`.`fk_id_perfil`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-10 10:31:09
