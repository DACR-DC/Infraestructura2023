-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_hoteleria_pruebas
-- ------------------------------------------------------
-- Server version	8.0.35

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
INSERT INTO `tbl_aplicaciones` VALUES (1,'Menu','Ingreso Login',1),(999,'Cerrar Sesion','Cerrar Sesion',1),(1000,'MDI SEGURIDAD','PARA SEGURIDAD',1),(1001,'Mant. Usuario','PARA SEGURIDAD',1),(1002,'Mant. Aplicación','PARA SEGURIDAD',1),(1003,'Mant. Modulo','PARA SEGURIDAD',1),(1004,'Mant. Perfil','PARA SEGURIDAD',1),(1101,'Asign. Modulo Aplicacion','PARA SEGURIDAD',1),(1102,'Asign. Aplicacion Perfil','PARA SEGURIDAD',1),(1103,'Asign. Perfil Usuario','PARA SEGURIDAD',1),(1201,'Pcs. Cambio Contraseña','PARA SEGURIDAD',1),(1301,'Pcs. BITACORA','PARA SEGURIDAD',1),(4000,'MDI Logistica','Inventario',1),(4001,'Movimiento Inventario','Movimiento',1),(4002,'Muestreo','Muestreo',1),(4003,'Auditoria','Auditoria',1),(4004,'Mantenimientos','Mantenimientos',1),(4005,'Traslados de Producto','Traslados',1);
/*!40000 ALTER TABLE `tbl_aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignacionesperfilsusuario`
--

DROP TABLE IF EXISTS `tbl_asignacionesperfilsusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacionesperfilsusuario` (
  `fk_id_usuario` int NOT NULL,
  `fk_id_perfil` int NOT NULL,
  PRIMARY KEY (`fk_id_usuario`,`fk_id_perfil`),
  KEY `fk_id_perfil` (`fk_id_perfil`),
  CONSTRAINT `tbl_asignacionesperfilsusuario_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  CONSTRAINT `tbl_asignacionesperfilsusuario_ibfk_2` FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacionesperfilsusuario`
--

LOCK TABLES `tbl_asignacionesperfilsusuario` WRITE;
/*!40000 ALTER TABLE `tbl_asignacionesperfilsusuario` DISABLE KEYS */;
INSERT INTO `tbl_asignacionesperfilsusuario` VALUES (1,1);
/*!40000 ALTER TABLE `tbl_asignacionesperfilsusuario` ENABLE KEYS */;
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
INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES (1000,1000),(1000,1001),(1000,1002),(1000,1003),(1000,1004),(1000,1102),(1000,1103),(1000,1201),(1000,1301),(4000,4000),(4000,4001),(4000,4002),(4000,4003),(4000,4004),(4000,4005);
/*!40000 ALTER TABLE `tbl_asignacionmoduloaplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bitacoradeeventos`
--

DROP TABLE IF EXISTS `tbl_bitacoradeeventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bitacoradeeventos` (
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
  CONSTRAINT `tbl_bitacoradeeventos_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  CONSTRAINT `tbl_bitacoradeeventos_ibfk_2` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bitacoradeeventos`
--

LOCK TABLES `tbl_bitacoradeeventos` WRITE;
/*!40000 ALTER TABLE `tbl_bitacoradeeventos` DISABLE KEYS */;
INSERT INTO `tbl_bitacoradeeventos` VALUES (1,1,1,'2023-11-07','10:56:52','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(2,1,4000,'2023-11-07','10:56:53','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(3,1,4000,'2023-11-07','10:56:57','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(4,1,1,'2023-11-07','11:01:36','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(5,1,4000,'2023-11-07','11:01:37','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(6,1,999,'2023-11-07','11:02:47','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Cerro Sesion'),(7,1,1,'2023-11-07','11:07:35','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(8,1,4000,'2023-11-07','11:07:40','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(9,1,4001,'2023-11-07','11:09:00','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(10,1,4001,'2023-11-07','11:09:42','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(11,1,4001,'2023-11-07','11:10:09','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Eliminar'),(12,1,1,'2023-11-07','15:26:29','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(13,1,4000,'2023-11-07','15:26:30','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(14,1,999,'2023-11-07','15:26:38','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Cerro Sesion'),(15,1,1,'2023-11-07','15:27:32','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(16,1,4000,'2023-11-07','15:27:34','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(17,1,1,'2023-11-07','15:43:19','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(18,1,4000,'2023-11-07','15:43:20','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(19,1,1,'2023-11-07','15:44:04','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(20,1,4000,'2023-11-07','15:44:06','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(21,1,1,'2023-11-07','15:44:31','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(22,1,4000,'2023-11-07','15:44:32','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(23,1,1,'2023-11-07','15:48:37','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(24,1,4000,'2023-11-07','15:48:38','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(25,1,4001,'2023-11-07','15:49:38','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(26,1,1,'2023-11-07','15:54:10','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(27,1,4000,'2023-11-07','15:54:11','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(28,1,4004,'2023-11-07','15:54:39','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(29,1,4004,'2023-11-07','15:55:52','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(30,1,4004,'2023-11-07','15:56:24','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(31,1,4004,'2023-11-07','15:57:02','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(32,1,1,'2023-11-07','15:58:53','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(33,1,4000,'2023-11-07','15:58:54','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(34,1,1,'2023-11-07','16:03:41','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(35,1,4000,'2023-11-07','16:03:42','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(36,1,4004,'2023-11-07','16:04:09','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(37,1,1,'2023-11-07','16:06:11','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(38,1,4000,'2023-11-07','16:06:12','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(39,1,4001,'2023-11-07','16:06:44','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(40,1,4001,'2023-11-07','16:07:13','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(41,1,4001,'2023-11-07','16:08:07','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(42,1,4001,'2023-11-07','16:08:35','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(43,1,4001,'2023-11-07','16:08:59','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(44,1,4001,'2023-11-07','16:10:20','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(45,1,4001,'2023-11-07','16:11:03','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(46,1,4004,'2023-11-07','16:11:53','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(47,1,1,'2023-11-07','16:18:10','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(48,1,4000,'2023-11-07','16:18:11','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(49,1,999,'2023-11-07','16:18:39','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Cerro Sesion'),(50,1,1,'2023-11-07','16:19:50','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(51,1,4000,'2023-11-07','16:19:52','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(52,1,999,'2023-11-07','16:20:06','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Cerro Sesion'),(53,1,1,'2023-11-07','16:26:38','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(54,1,4000,'2023-11-07','16:26:39','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(55,1,1,'2023-11-07','16:27:29','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(56,1,4000,'2023-11-07','16:27:30','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(57,1,999,'2023-11-07','16:27:44','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Cerro Sesion'),(58,1,1,'2023-11-07','16:29:28','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(59,1,4000,'2023-11-07','16:29:29','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(60,1,1,'2023-11-07','16:32:25','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(61,1,4000,'2023-11-07','16:32:26','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(62,1,4001,'2023-11-07','16:33:48','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(63,1,1,'2023-11-07','16:37:01','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(64,1,4000,'2023-11-07','16:37:02','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(65,1,4001,'2023-11-07','16:38:52','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(66,1,1,'2023-11-07','16:40:20','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(67,1,4000,'2023-11-07','16:40:21','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(68,1,1,'2023-11-07','16:57:22','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(69,1,4000,'2023-11-07','16:57:23','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(70,1,4001,'2023-11-07','16:58:52','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(71,1,4001,'2023-11-07','17:01:18','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(72,1,1,'2023-11-07','17:38:57','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(73,1,4000,'2023-11-07','17:38:58','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(74,1,4001,'2023-11-07','17:40:31','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(75,1,4001,'2023-11-07','17:41:00','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Eliminar'),(76,1,4001,'2023-11-07','17:41:09','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Eliminar'),(77,1,4001,'2023-11-07','17:41:19','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Eliminar'),(78,1,4001,'2023-11-07','17:42:49','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(79,1,4001,'2023-11-07','17:47:55','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Eliminar'),(80,1,4001,'2023-11-07','17:49:08','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(81,1,1,'2023-11-07','17:54:47','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(82,1,4000,'2023-11-07','17:54:49','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(83,1,1,'2023-11-07','18:10:16','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(84,1,4000,'2023-11-07','18:10:17','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(85,1,1,'2023-11-07','19:22:12','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(86,1,4000,'2023-11-07','19:24:13','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(87,1,1,'2023-11-07','19:38:11','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(88,1,4000,'2023-11-07','19:38:12','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(89,1,1,'2023-11-07','19:43:56','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(90,1,4000,'2023-11-07','19:43:57','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(91,1,1,'2023-11-07','20:58:00','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(92,1,4000,'2023-11-07','20:58:02','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(93,1,1,'2023-11-08','14:45:45','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(94,1,4000,'2023-11-08','14:45:46','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(95,1,1,'2023-11-08','14:48:11','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(96,1,4000,'2023-11-08','14:48:12','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(97,1,1,'2023-11-08','14:52:22','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(98,1,4000,'2023-11-08','14:52:23','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(99,1,1,'2023-11-08','14:53:54','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(100,1,4000,'2023-11-08','14:53:55','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(101,1,1,'2023-11-08','14:56:50','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(102,1,4000,'2023-11-08','14:56:51','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(103,1,1,'2023-11-08','17:14:14','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(104,1,4000,'2023-11-08','17:14:15','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(105,1,1,'2023-11-08','17:17:07','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(106,1,4000,'2023-11-08','17:17:08','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(107,1,1,'2023-11-08','17:22:15','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Login'),(108,1,4000,'2023-11-08','17:22:27','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Ingreso Inventarios'),(109,1,4001,'2023-11-08','17:24:00','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(110,1,4001,'2023-11-08','17:24:40','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(111,1,4001,'2023-11-08','17:25:25','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(112,1,4001,'2023-11-08','17:25:49','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Eliminar'),(113,1,4004,'2023-11-08','17:27:37','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(114,1,4004,'2023-11-08','17:28:16','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(115,1,4004,'2023-11-08','17:28:35','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Eliminar'),(116,1,4005,'2023-11-08','17:30:10','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Guardar'),(117,1,4005,'2023-11-08','17:30:48','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Modificar'),(118,1,4005,'2023-11-08','17:31:10','DESKTOP-HCCDANL','fe80::b70e:a166:8795:9d60%16','Eliminar');
/*!40000 ALTER TABLE `tbl_bitacoradeeventos` ENABLE KEYS */;
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
INSERT INTO `tbl_detallesmovimiento` VALUES (1,'Alm1','001','2023-11-07','Prod1','Producto 1','10','100.00','10.00'),(2,'Alm2','002','2023-11-07','Prod2','Producto 2','15','150.00','10.00'),(3,'Alm5','005','2023-11-08','Prod5','Producto 5','30','300','10.00');
/*!40000 ALTER TABLE `tbl_detallesmovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doc_auditoria`
--

DROP TABLE IF EXISTS `tbl_doc_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_doc_auditoria` (
  `PK_Id_Doc_Auditoria` int NOT NULL,
  `FK_Codigo_bodega` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `estatus` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doc_auditoria`
--

LOCK TABLES `tbl_doc_auditoria` WRITE;
/*!40000 ALTER TABLE `tbl_doc_auditoria` DISABLE KEYS */;
INSERT INTO `tbl_doc_auditoria` VALUES (1,1,'2018-11-04','AUDITORIA TEST',0);
/*!40000 ALTER TABLE `tbl_doc_auditoria` ENABLE KEYS */;
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
INSERT INTO `tbl_mantenimientos` VALUES (1,'MNT001','Mantenimiento 1','Cuenta 001','2023-10-26','Almacén 1','Preventivo','Pendiente','Relación 1'),(2,'MNT002','Mantenimiento 2','Cuenta 002','2023-10-27','Almacén 2','Correctivo','Completado','Relación 2'),(3,'MNT005','Mantenimiento 5','Cuenta 003','2023-11-08','Almacén 2','Corectivo','Completado','Relación 3');
/*!40000 ALTER TABLE `tbl_mantenimientos` ENABLE KEYS */;
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
INSERT INTO `tbl_modulos` VALUES (1000,'SEGURIDAD','Seguridad',1),(4000,'LOGISTICA','Inventario',1);
/*!40000 ALTER TABLE `tbl_modulos` ENABLE KEYS */;
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
INSERT INTO `tbl_mov_inventario` VALUES (1,'Almacen A','Salida','Documento 1','2023-10-08','COD006','Kilos',100,10,15),(2,'Almacen B','Salida','Documento 2','2023-11-03','COD002','Kilos',50,5,7),(3,'Almacen C','Entrada','Documento 4','2023-10-10','COD003','Libras',160,15.7,5.5),(4,'Almacen A','Entrada','Documento 2','2023-11-07','COD001','Unidades ',100,0,0);
/*!40000 ALTER TABLE `tbl_mov_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_muestra_auditoria`
--

DROP TABLE IF EXISTS `tbl_muestra_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_muestra_auditoria` (
  `PK_Id_Doc_Auditoria` int NOT NULL,
  `PK_Codigo_Producto` int NOT NULL,
  `Cantidad_Logica` int DEFAULT NULL,
  `Cantidad_Fisica` int DEFAULT NULL,
  `Diferencia` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_muestra_auditoria`
--

LOCK TABLES `tbl_muestra_auditoria` WRITE;
/*!40000 ALTER TABLE `tbl_muestra_auditoria` DISABLE KEYS */;
INSERT INTO `tbl_muestra_auditoria` VALUES (1,1,0,0,0),(1,2,0,0,0);
/*!40000 ALTER TABLE `tbl_muestra_auditoria` ENABLE KEYS */;
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
-- Table structure for table `tbl_permisosaplicacionperfil`
--

DROP TABLE IF EXISTS `tbl_permisosaplicacionperfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_permisosaplicacionperfil` (
  `fk_id_perfil` int NOT NULL,
  `fk_id_aplicacion` int NOT NULL,
  `guardar_permiso` tinyint(1) DEFAULT '0',
  `modificar_permiso` tinyint(1) DEFAULT '0',
  `eliminar_permiso` tinyint(1) DEFAULT '0',
  `buscar_permiso` tinyint(1) DEFAULT '0',
  `imprimir_permiso` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`fk_id_perfil`,`fk_id_aplicacion`),
  KEY `fk_id_aplicacion` (`fk_id_aplicacion`),
  CONSTRAINT `tbl_permisosaplicacionperfil_ibfk_1` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  CONSTRAINT `tbl_permisosaplicacionperfil_ibfk_2` FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permisosaplicacionperfil`
--

LOCK TABLES `tbl_permisosaplicacionperfil` WRITE;
/*!40000 ALTER TABLE `tbl_permisosaplicacionperfil` DISABLE KEYS */;
INSERT INTO `tbl_permisosaplicacionperfil` VALUES (1,1000,1,1,1,1,1),(1,1001,1,1,1,1,1),(1,1002,1,1,1,1,1),(1,1003,1,1,1,1,1),(1,1004,1,1,1,1,1),(1,1101,1,1,1,1,1),(1,1102,1,1,1,1,1),(1,1103,1,1,1,1,1),(1,1201,1,1,1,1,1),(1,1301,1,1,1,1,1),(1,4000,1,1,1,1,1),(1,4001,1,1,1,1,1),(1,4002,1,1,1,1,1),(1,4003,1,1,1,1,1),(1,4004,1,1,1,1,1),(1,4005,1,1,1,1,1);
/*!40000 ALTER TABLE `tbl_permisosaplicacionperfil` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios`
--

LOCK TABLES `tbl_usuarios` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` VALUES (1,'admin','admin','admin','HO0aGo4nM94=','esduardo@gmail.com',1,'COLOR FAVORITO','X9yc1/l1b2A=');
/*!40000 ALTER TABLE `tbl_usuarios` ENABLE KEYS */;
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
/*!50001 VIEW `vista_aplicacion_perfil` AS select `b`.`fk_id_perfil` AS `ID`,`a`.`nombre_perfil` AS `Perfil`,`b`.`fk_id_aplicacion` AS `Aplicacion`,`b`.`guardar_permiso` AS `Insertar`,`b`.`modificar_permiso` AS `Modificar`,`b`.`eliminar_permiso` AS `Eliminar`,`b`.`buscar_permiso` AS `Buscar`,`b`.`imprimir_permiso` AS `Reporte` from (`tbl_permisosaplicacionperfil` `b` join `tbl_perfiles` `a` on((`a`.`pk_id_perfil` = `b`.`fk_id_perfil`))) */;
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
/*!50001 VIEW `vista_perfil_usuario` AS select `b`.`fk_id_usuario` AS `ID`,`a`.`nombre_usuario` AS `Usuario`,`a`.`username_usuario` AS `nickName`,`b`.`fk_id_perfil` AS `perfil`,`c`.`nombre_perfil` AS `Nombre` from ((`tbl_asignacionesperfilsusuario` `b` join `tbl_usuarios` `a` on((`a`.`pk_id_usuario` = `b`.`fk_id_usuario`))) join `tbl_perfiles` `c` on((`c`.`pk_id_perfil` = `b`.`fk_id_perfil`))) */;
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

-- Dump completed on 2023-11-09 11:50:25
