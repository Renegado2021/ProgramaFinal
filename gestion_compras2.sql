-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: gestion_compras2
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_categorias`
--

DROP TABLE IF EXISTS `tbl_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  `creado` varchar(50) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorias`
--

LOCK TABLES `tbl_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_categorias` DISABLE KEYS */;
INSERT INTO `tbl_categorias` VALUES (8,'insumos','kenyo','2023-12-01 06:00:00','2023-11-30 23:38:49',''),(9,'SERVICIOS','ADMIN','2023-12-02 06:00:00','2023-12-02 03:39:19','');
/*!40000 ALTER TABLE `tbl_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_compra_cai`
--

DROP TABLE IF EXISTS `tbl_compra_cai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_compra_cai` (
  `ID_COMPRA_CAI` int(11) NOT NULL AUTO_INCREMENT,
  `ID_EMPRESA` int(11) NOT NULL,
  `ID_ORDEN_COMPRA` int(11) NOT NULL,
  `ID_LOTE_CAI` int(11) NOT NULL,
  `TIPO_RECIBO` varchar(100) NOT NULL,
  `CAI` varchar(100) NOT NULL,
  `FECHA_FACTURA_PROVEEDOR` varchar(15) NOT NULL,
  `FACTURA_REGIMEN` date NOT NULL,
  `SECUENCIA_REGIMEN` varchar(100) NOT NULL,
  `ESTADO_FACTURA` tinyint(1) NOT NULL DEFAULT 0,
  `FECHA_ANULACION` date NOT NULL,
  PRIMARY KEY (`ID_COMPRA_CAI`),
  KEY `ID_EMPRESA` (`ID_EMPRESA`),
  KEY `ID_ORDEN_COMPRA` (`ID_ORDEN_COMPRA`),
  KEY `ID_LOTE_CAI` (`ID_LOTE_CAI`),
  CONSTRAINT `tbl_compra_cai_ibfk_1` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `tbl_empresa` (`id_empresa`),
  CONSTRAINT `tbl_compra_cai_ibfk_2` FOREIGN KEY (`ID_ORDEN_COMPRA`) REFERENCES `tbl_orden_compra` (`ID_ORDEN_COMPRA`),
  CONSTRAINT `tbl_compra_cai_ibfk_3` FOREIGN KEY (`ID_LOTE_CAI`) REFERENCES `tbl_lotes_proveedores_cai` (`ID_LOTE_CAI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra_cai`
--

LOCK TABLES `tbl_compra_cai` WRITE;
/*!40000 ALTER TABLE `tbl_compra_cai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_compra_cai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contactos_proveedores`
--

DROP TABLE IF EXISTS `tbl_contactos_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_contactos_proveedores` (
  `ID_CONTACTO_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `CARGO` varchar(45) DEFAULT NULL,
  `ESTADO` varchar(200) DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID_CONTACTO_PROVEEDOR`),
  KEY `tbl_contactos_proveedores_ibfk_1` (`ID_PROVEEDOR`),
  CONSTRAINT `tbl_contactos_proveedores_ibfk_1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `tbl_proveedores` (`ID_PROVEEDOR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contactos_proveedores`
--

LOCK TABLES `tbl_contactos_proveedores` WRITE;
/*!40000 ALTER TABLE `tbl_contactos_proveedores` DISABLE KEYS */;
INSERT INTO `tbl_contactos_proveedores` VALUES (4,29,'LARACH','GERENTE','A',NULL,'2023-12-01 21:22:13',NULL,'2023-12-01 21:22:13');
/*!40000 ALTER TABLE `tbl_contactos_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cotizacion`
--

DROP TABLE IF EXISTS `tbl_cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cotizacion` (
  `ID_COTIZACION` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) DEFAULT NULL,
  `ID_PROVEEDOR` int(11) DEFAULT NULL,
  `NUMERO_COTIZACION` varchar(20) DEFAULT NULL,
  `DEPARTAMENTO` varchar(100) NOT NULL,
  `FECHA_COTIZACION` date DEFAULT NULL,
  `ESTADO` varchar(255) NOT NULL,
  `EXCENTO` tinyint(1) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` varchar(255) DEFAULT NULL,
  `MODIFICADO_POR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_COTIZACION`),
  KEY `ID_PROVEEDOR` (`ID_PROVEEDOR`),
  KEY `tbl_solicitudes_tbl_cotizacion` (`ID`),
  CONSTRAINT `tbl_cotizacion_ibfk_1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `tbl_proveedores` (`ID_PROVEEDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cotizacion`
--

LOCK TABLES `tbl_cotizacion` WRITE;
/*!40000 ALTER TABLE `tbl_cotizacion` DISABLE KEYS */;
INSERT INTO `tbl_cotizacion` VALUES (102,108,23,'8888','CONTABILIDAD','2023-11-30','Aprobada',0,'http://localhost/Gestionmain/pantallas/admin.php','2023-12-01 02:16:49','2023-12-01 02:17:38',NULL,NULL),(103,109,23,'3456','CONTABILIDAD','2023-12-01','Aprobada',0,'http://localhost/phpmyadmin/index.php?route=/sql&pos=0&db=gestion_compras2&table=tbl_solicitudes','2023-12-02 03:43:58','2023-12-02 03:44:07',NULL,NULL);
/*!40000 ALTER TABLE `tbl_cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cotizacion_detalle`
--

DROP TABLE IF EXISTS `tbl_cotizacion_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cotizacion_detalle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COTIZACION` int(11) NOT NULL,
  `CANTIDAD` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `tbl_cotizacion_tbl_cotizacion_detalle` (`ID_COTIZACION`),
  KEY `tbl_categorias_tbl_cotizacion_detalle` (`ID_CATEGORIA`),
  CONSTRAINT `tbl_categorias_tbl_cotizacion_detalle` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `tbl_categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_cotizacion_tbl_cotizacion_detalle` FOREIGN KEY (`ID_COTIZACION`) REFERENCES `tbl_cotizacion` (`ID_COTIZACION`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cotizacion_detalle`
--

LOCK TABLES `tbl_cotizacion_detalle` WRITE;
/*!40000 ALTER TABLE `tbl_cotizacion_detalle` DISABLE KEYS */;
INSERT INTO `tbl_cotizacion_detalle` VALUES (3,102,'3','RESMA',8),(4,102,'4','LAPICES',8),(5,103,'1','FUMIGACIÒN',9),(6,103,'1','LIMPIEZA',9);
/*!40000 ALTER TABLE `tbl_cotizacion_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cuenta_proveedor`
--

DROP TABLE IF EXISTS `tbl_cuenta_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cuenta_proveedor` (
  `ID_CUENTA_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO_CUENTA` varchar(20) DEFAULT NULL,
  `BANCO` varchar(50) DEFAULT NULL,
  `DESCRIPCION_CUENTA` text DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ID_PROVEEDOR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CUENTA_PROVEEDOR`),
  KEY `fk_tbl_proveedores_tbl_cuenta_proveedor` (`ID_PROVEEDOR`) USING BTREE,
  CONSTRAINT `fk_tbl_proveedores_tbl_cuenta_proveedor` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `tbl_proveedores` (`ID_PROVEEDOR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cuenta_proveedor`
--

LOCK TABLES `tbl_cuenta_proveedor` WRITE;
/*!40000 ALTER TABLE `tbl_cuenta_proveedor` DISABLE KEYS */;
INSERT INTO `tbl_cuenta_proveedor` VALUES (12,'20909','OCCIDENTE','CHEQUES','2023-11-30 23:40:17','2023-11-30 23:40:17',23),(15,'345','ficohsa','ahorro','2023-12-01 15:52:44','2023-12-01 15:52:44',26),(17,'23456','BAMER','cheque','2023-12-01 21:21:49','2023-12-01 21:21:49',29);
/*!40000 ALTER TABLE `tbl_cuenta_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_departamentos`
--

DROP TABLE IF EXISTS `tbl_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `nombre_departamento` varchar(50) NOT NULL,
  `estado_departamento` varchar(50) NOT NULL,
  `creado` varchar(50) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(30) NOT NULL,
  PRIMARY KEY (`id_departamento`),
  KEY `fk_tbl_empresa_id_empresa_tbl_departamentos` (`id_empresa`),
  CONSTRAINT `fk_tbl_empresa_id_empresa_tbl_departamentos` FOREIGN KEY (`id_empresa`) REFERENCES `tbl_empresa` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamentos`
--

LOCK TABLES `tbl_departamentos` WRITE;
/*!40000 ALTER TABLE `tbl_departamentos` DISABLE KEYS */;
INSERT INTO `tbl_departamentos` VALUES (7,3,'CONTABILIDAD','A','KENYO','2023-12-01 06:00:00','2023-11-30 23:54:28','');
/*!40000 ALTER TABLE `tbl_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_direcciones_proveedores`
--

DROP TABLE IF EXISTS `tbl_direcciones_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_direcciones_proveedores` (
  `ID_DIRECCION_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `DEPARTAMENTO` varchar(30) DEFAULT NULL,
  `MUNICIPIO` varchar(30) DEFAULT NULL,
  `COLONIA` varchar(15) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID_DIRECCION_PROVEEDOR`),
  KEY `ID_PROVEEDOR` (`ID_PROVEEDOR`),
  CONSTRAINT `tbl_direcciones_proveedores_ibfk_1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `tbl_proveedores` (`ID_PROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_direcciones_proveedores`
--

LOCK TABLES `tbl_direcciones_proveedores` WRITE;
/*!40000 ALTER TABLE `tbl_direcciones_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_direcciones_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empresa`
--

DROP TABLE IF EXISTS `tbl_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(100) NOT NULL,
  `fecha_inicio_operacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tel_empresa` int(11) NOT NULL,
  `email_empresa` text NOT NULL,
  `direccion` text NOT NULL,
  `estado` varchar(50) NOT NULL,
  `creado` varchar(30) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empresa`
--

LOCK TABLES `tbl_empresa` WRITE;
/*!40000 ALTER TABLE `tbl_empresa` DISABLE KEYS */;
INSERT INTO `tbl_empresa` VALUES (3,'PACASSA','2023-11-30 23:53:36',22012891,'','','','','2023-11-30 23:53:36','2023-11-30 23:53:36');
/*!40000 ALTER TABLE `tbl_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lotes_proveedores_cai`
--

DROP TABLE IF EXISTS `tbl_lotes_proveedores_cai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_lotes_proveedores_cai` (
  `ID_LOTE_CAI` int(11) NOT NULL,
  `ID_EMPRESA` int(11) NOT NULL,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `FECHA_LIMITE` date NOT NULL,
  `FECHA_INICIO` date NOT NULL,
  `RANGO_DESDE` varchar(100) NOT NULL,
  `RANGO_HASTA` varchar(100) NOT NULL,
  `DESTINO` date NOT NULL,
  `TIPO_RECIBO` varchar(15) NOT NULL,
  `CAI` varchar(100) NOT NULL,
  `PUNTO_EMISION` varchar(100) NOT NULL,
  `ESTABLECIMIENTO` varchar(100) NOT NULL,
  `TIPO_DOCUMENTO` varchar(100) NOT NULL,
  `SECUENCIA_REGIMEN` varchar(100) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 0,
  `STOCK_MINIMO` varchar(100) NOT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID_LOTE_CAI`),
  KEY `ID_EMPRESA` (`ID_EMPRESA`),
  KEY `ID_PROVEEDOR` (`ID_PROVEEDOR`),
  CONSTRAINT `tbl_lotes_proveedores_cai_ibfk_1` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `tbl_empresa` (`id_empresa`),
  CONSTRAINT `tbl_lotes_proveedores_cai_ibfk_2` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `tbl_proveedores` (`ID_PROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lotes_proveedores_cai`
--

LOCK TABLES `tbl_lotes_proveedores_cai` WRITE;
/*!40000 ALTER TABLE `tbl_lotes_proveedores_cai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_lotes_proveedores_cai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ms_hist_contrasena`
--

DROP TABLE IF EXISTS `tbl_ms_hist_contrasena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ms_hist_contrasena` (
  `ID_HIST` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `CONTRASENA` varchar(100) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` int(11) DEFAULT NULL,
  `MODIFICADO_POR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_HIST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ms_hist_contrasena`
--

LOCK TABLES `tbl_ms_hist_contrasena` WRITE;
/*!40000 ALTER TABLE `tbl_ms_hist_contrasena` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ms_hist_contrasena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ms_parametros`
--

DROP TABLE IF EXISTS `tbl_ms_parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ms_parametros` (
  `ID_PARAMETRO` int(11) NOT NULL AUTO_INCREMENT,
  `PARAMETRO` varchar(100) DEFAULT NULL,
  `VALOR` varchar(100) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` int(11) DEFAULT NULL,
  `MODIFICADO_POR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PARAMETRO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ms_parametros`
--

LOCK TABLES `tbl_ms_parametros` WRITE;
/*!40000 ALTER TABLE `tbl_ms_parametros` DISABLE KEYS */;
INSERT INTO `tbl_ms_parametros` VALUES (1,'Nombre de la empresa','IHCI','2023-09-24 03:42:15','2023-09-24 03:42:15',NULL,NULL),(2,'preguntas_seguridad','2','2023-09-24 03:45:02','2023-09-28 16:51:45',NULL,NULL),(3,'Intentos','3','2023-09-24 03:45:02','2023-09-24 03:45:02',NULL,NULL);
/*!40000 ALTER TABLE `tbl_ms_parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ms_roles`
--

DROP TABLE IF EXISTS `tbl_ms_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ms_roles` (
  `ID_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_ROL` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` int(11) DEFAULT NULL,
  `MODIFICADO_POR` int(11) DEFAULT NULL,
  `ESTADO_ROL` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ms_roles`
--

LOCK TABLES `tbl_ms_roles` WRITE;
/*!40000 ALTER TABLE `tbl_ms_roles` DISABLE KEYS */;
INSERT INTO `tbl_ms_roles` VALUES (36,'Administrador','admin','2023-09-08 21:01:38','2023-10-09 15:27:23',NULL,NULL,'A'),(37,'Aprobador','apro','2023-09-08 21:02:44','2023-10-09 15:57:16',NULL,NULL,'A'),(38,'Usuario','usu','2023-09-08 21:03:09','2023-10-13 00:39:55',NULL,NULL,'A');
/*!40000 ALTER TABLE `tbl_ms_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ms_usuario`
--

DROP TABLE IF EXISTS `tbl_ms_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ms_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `nombre_usuario` varchar(255) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `contraseñaTemp` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por` int(11) DEFAULT NULL,
  `modificado_por` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `tbl_ms_roles_tbl_ms_usuario` (`rol`),
  CONSTRAINT `tbl_ms_roles_tbl_ms_usuario` FOREIGN KEY (`rol`) REFERENCES `tbl_ms_roles` (`ID_ROL`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ms_usuario`
--

LOCK TABLES `tbl_ms_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_ms_usuario` DISABLE KEYS */;
INSERT INTO `tbl_ms_usuario` VALUES (151,'LILIAN','KENYO','KENYO','$2y$10$W0wGOJY7zUtD6kvLw0na5ej2e8cO3NzD4uYYy269tMc30e8MkwaDS',NULL,'kenyo@gmail.com','A',36,'2023-11-30 21:58:10','2023-11-30 21:59:35',NULL,NULL),(152,NULL,NULL,'LUIS','$2y$10$xoghqS68mNWoq8Akiy1XLul5EiwM2NkJj36IRRUumZNTYP1rPkbpC',NULL,'luis@gmail.com','A',38,'2023-12-04 20:02:51','2023-12-05 19:34:50',NULL,NULL);
/*!40000 ALTER TABLE `tbl_ms_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_objetos`
--

DROP TABLE IF EXISTS `tbl_objetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_objetos` (
  `ID_OBJETO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_OBJETO` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` int(11) DEFAULT NULL,
  `MODIFICADO_POR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_OBJETO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_objetos`
--

LOCK TABLES `tbl_objetos` WRITE;
/*!40000 ALTER TABLE `tbl_objetos` DISABLE KEYS */;
INSERT INTO `tbl_objetos` VALUES (3,'Solicitudes','lista','2023-09-06 16:25:26','2023-09-09 16:30:40',NULL,NULL),(4,'Órdenes de compra',NULL,'2023-09-06 16:25:26','2023-09-09 16:30:40',NULL,NULL),(7,'Cotizacion','cotizar','2023-09-08 19:02:01','2023-09-09 16:30:40',NULL,NULL),(8,'Reportes','reporte','2023-09-08 19:04:32','2023-09-09 16:30:40',NULL,NULL),(10,'Orden de Pago','pago','2023-09-08 19:05:40','2023-09-09 16:30:40',NULL,NULL);
/*!40000 ALTER TABLE `tbl_objetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_compra`
--

DROP TABLE IF EXISTS `tbl_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_orden_compra` (
  `ID_ORDEN_COMPRA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PROVEEDOR` int(11) DEFAULT NULL,
  `ID_CONTACTO` int(11) NOT NULL,
  `NUMERO_ORDEN` varchar(255) DEFAULT NULL,
  `FECHA_ORDEN` date DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` int(11) DEFAULT NULL,
  `MODIFICADO_POR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ORDEN_COMPRA`),
  KEY `ID_PROVEEDOR` (`ID_PROVEEDOR`),
  KEY `ID_CONTACTO` (`ID_CONTACTO`)
) ENGINE=InnoDB AUTO_INCREMENT=718 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_compra`
--

LOCK TABLES `tbl_orden_compra` WRITE;
/*!40000 ALTER TABLE `tbl_orden_compra` DISABLE KEYS */;
INSERT INTO `tbl_orden_compra` VALUES (716,23,0,'0001','2023-12-01','2023-12-01 02:44:21','2023-12-01 02:44:21',NULL,NULL);
/*!40000 ALTER TABLE `tbl_orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_compra_productos`
--

DROP TABLE IF EXISTS `tbl_orden_compra_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_orden_compra_productos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ORDEN` int(11) NOT NULL,
  `CANTIDAD` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `TOTAL` decimal(10,2) NOT NULL,
  `SUBTOTAL` decimal(10,2) NOT NULL,
  `ISV` decimal(10,2) NOT NULL,
  `MONTO` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `tbl_orden_compra_tbl_orden_compra_productos` (`ID_ORDEN`) USING BTREE,
  CONSTRAINT `tbl_orden_compra_tbl_ordenCompra_productos` FOREIGN KEY (`ID_ORDEN`) REFERENCES `tbl_orden_compra` (`ID_ORDEN_COMPRA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_compra_productos`
--

LOCK TABLES `tbl_orden_compra_productos` WRITE;
/*!40000 ALTER TABLE `tbl_orden_compra_productos` DISABLE KEYS */;
INSERT INTO `tbl_orden_compra_productos` VALUES (102,716,'3','RESMA',6.00,18.00,46.00,6.90,52.90),(103,716,'4','LAPICES',7.00,28.00,46.00,6.90,52.90);
/*!40000 ALTER TABLE `tbl_orden_compra_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_pago`
--

DROP TABLE IF EXISTS `tbl_orden_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_orden_pago` (
  `ID_ORDEN_PAGO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PROVEEDOR` int(11) DEFAULT NULL,
  `NUMERO_ORDEN` varchar(20) DEFAULT NULL,
  `FECHA_ORDEN` date DEFAULT NULL,
  `MONTO_TOTAL` decimal(10,2) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` int(11) DEFAULT NULL,
  `MODIFICADO_POR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ORDEN_PAGO`),
  KEY `ID_PROVEEDOR` (`ID_PROVEEDOR`),
  CONSTRAINT `tbl_orden_pago_ibfk_1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `tbl_proveedores` (`ID_PROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_pago`
--

LOCK TABLES `tbl_orden_pago` WRITE;
/*!40000 ALTER TABLE `tbl_orden_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orden_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permisos`
--

DROP TABLE IF EXISTS `tbl_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_permiso` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por` int(11) DEFAULT NULL,
  `modificado_por` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permisos`
--

LOCK TABLES `tbl_permisos` WRITE;
/*!40000 ALTER TABLE `tbl_permisos` DISABLE KEYS */;
INSERT INTO `tbl_permisos` VALUES (1,'Ver','solo lectura','2023-09-06 14:12:51','2023-09-06 14:12:51',NULL,NULL),(2,'Crear','Crea datos','2023-09-06 14:11:30','2023-09-06 14:12:51',NULL,NULL),(3,'Editar','edita el dato','2023-09-06 14:13:51','2023-09-06 14:13:51',NULL,NULL),(4,'Eliminar','elimina el dato','2023-09-06 14:13:51','2023-09-06 14:13:51',NULL,NULL);
/*!40000 ALTER TABLE `tbl_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_preguntas`
--

DROP TABLE IF EXISTS `tbl_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_preguntas` (
  `ID_PREGUNTA` int(11) NOT NULL AUTO_INCREMENT,
  `PREGUNTA` varchar(255) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` varchar(255) DEFAULT NULL,
  `MODIFICADO_POR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PREGUNTA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_preguntas`
--

LOCK TABLES `tbl_preguntas` WRITE;
/*!40000 ALTER TABLE `tbl_preguntas` DISABLE KEYS */;
INSERT INTO `tbl_preguntas` VALUES (1,'¿Cuál es su color favorito?','2023-08-17 01:04:42','2023-12-05 06:39:08','1',NULL),(2,'¿Cual es tu comida favorita?','2023-08-17 01:06:01','2023-08-29 23:27:32','1',NULL),(3,'¿Cuál es la fecha de tu nacimiento?\r\n','2023-09-26 20:42:03','2023-09-26 20:42:03',NULL,NULL),(4,'¿Cuál es tu animal favorito?','2023-09-30 23:07:01','2023-09-30 23:07:01',NULL,NULL);
/*!40000 ALTER TABLE `tbl_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productos`
--

DROP TABLE IF EXISTS `tbl_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `cantidad` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria` int(11) NOT NULL,
  `creado_por` varchar(30) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(30) DEFAULT NULL,
  `fecha_modificacion` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_solicitudes_id_solicitud_tbl_productos` (`id_solicitud`),
  KEY `fk_tbl_categorias_categoria_tbl_productos` (`categoria`) USING BTREE,
  CONSTRAINT `fk_tbl_solicitudes_tbl_productos` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitudes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productos`
--

LOCK TABLES `tbl_productos` WRITE;
/*!40000 ALTER TABLE `tbl_productos` DISABLE KEYS */;
INSERT INTO `tbl_productos` VALUES (139,108,'1','RESMA',8,NULL,'0000-00-00',NULL,'0000-00-00'),(140,108,'2','LAPICES',8,NULL,'0000-00-00',NULL,'0000-00-00'),(141,109,'1','FUMIGACIÒN',9,NULL,'0000-00-00',NULL,'0000-00-00'),(142,109,'1','LIMPIEZA',9,NULL,'0000-00-00',NULL,'0000-00-00');
/*!40000 ALTER TABLE `tbl_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proveedores`
--

DROP TABLE IF EXISTS `tbl_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_proveedores` (
  `ID_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DIRECCION` varchar(200) DEFAULT NULL,
  `TELEFONO` varchar(20) DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(100) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREADO_POR` varchar(255) DEFAULT NULL,
  `MODIFICADO_POR` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `SERVICIO_PRESTADO` varchar(150) DEFAULT NULL,
  `RTN_EMPRESA` varchar(15) DEFAULT NULL,
  `ESTADO_PROVEEDOR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proveedores`
--

LOCK TABLES `tbl_proveedores` WRITE;
/*!40000 ALTER TABLE `tbl_proveedores` DISABLE KEYS */;
INSERT INTO `tbl_proveedores` VALUES (23,'PACCASA','TOROCAGUA','22012891','pacasa@gmail.com','2023-11-30 23:39:34','2023-11-30 23:39:34',NULL,NULL,NULL,NULL,NULL,'A'),(26,'ACCOSA','MALL PREMIER','22012891','accosa@gmail.com','2023-12-01 15:52:30','2023-12-01 15:52:30',NULL,NULL,NULL,NULL,NULL,'A'),(29,'LARACH','TOROCAGUA','22012891','larach@gmail.com','2023-12-01 21:21:32','2023-12-01 21:45:43',NULL,'ADMIN',NULL,NULL,NULL,'I');
/*!40000 ALTER TABLE `tbl_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles_permisos`
--

DROP TABLE IF EXISTS `tbl_roles_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_roles_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_objeto` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_ms_roles_tbl_roles_permisos` (`id_rol`),
  KEY `tbl_objetos_tbl_roles_permisos` (`id_objeto`),
  KEY `tbl_permisos_tbl_roles_permios` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles_permisos`
--

LOCK TABLES `tbl_roles_permisos` WRITE;
/*!40000 ALTER TABLE `tbl_roles_permisos` DISABLE KEYS */;
INSERT INTO `tbl_roles_permisos` VALUES (255,37,0,1),(256,37,0,2),(276,50,1,1),(277,50,1,2),(278,50,3,1),(279,50,3,2),(285,51,1,1),(286,51,1,2),(287,51,1,3),(288,51,3,1),(318,42,1,1),(319,42,1,4),(320,42,3,1),(321,42,3,2),(322,42,3,3),(323,42,3,4),(324,42,5,1),(325,42,5,3),(326,42,6,1),(327,42,6,2),(878,38,3,1),(879,38,3,2),(880,38,3,3),(881,52,1,1),(882,52,1,2),(883,52,3,1),(884,52,3,3),(982,36,1,1),(983,36,1,2),(984,36,1,3),(985,36,1,4),(986,36,3,1),(987,36,3,2),(988,36,3,3),(989,36,3,4),(990,36,4,1),(991,36,4,2),(992,36,4,3),(993,36,4,4),(994,36,5,1),(995,36,5,2),(996,36,5,3),(997,36,5,4),(998,36,7,1),(999,36,7,2),(1000,36,7,3),(1001,36,7,4),(1002,36,8,1),(1003,36,8,2),(1004,36,8,3),(1005,36,8,4),(1006,36,10,1),(1007,36,10,2),(1008,36,10,3),(1009,36,10,4),(1010,36,11,1),(1011,36,11,2),(1012,36,11,3),(1013,36,11,4),(1014,54,2,1),(1015,55,3,1);
/*!40000 ALTER TABLE `tbl_roles_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_solicitudes`
--

DROP TABLE IF EXISTS `tbl_solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_solicitudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `idDepartamento` int(11) DEFAULT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_solicitudes_tbl_departamentos` (`idDepartamento`),
  KEY `fk_tbl_solicitudes_tbl_ms_usuario` (`usuario_id`),
  CONSTRAINT `fk_tbl_solicitudes_tbl_departamentos` FOREIGN KEY (`idDepartamento`) REFERENCES `tbl_departamentos` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_solicitudes`
--

LOCK TABLES `tbl_solicitudes` WRITE;
/*!40000 ALTER TABLE `tbl_solicitudes` DISABLE KEYS */;
INSERT INTO `tbl_solicitudes` VALUES (108,'1',151,7,'2023-12-01 02:17:38','2023-11-30 23:55:06','Aprobada'),(109,'2',151,7,'2023-12-02 03:44:07','2023-12-02 03:42:19','Aprobada');
/*!40000 ALTER TABLE `tbl_solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_solictud_cotizacion`
--

DROP TABLE IF EXISTS `tbl_solictud_cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_solictud_cotizacion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COTIZACION` int(11) NOT NULL,
  `ID_SOLICITUD` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `CATEGORIA` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_solictud_cotizacion`
--

LOCK TABLES `tbl_solictud_cotizacion` WRITE;
/*!40000 ALTER TABLE `tbl_solictud_cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_solictud_cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_pregunta`
--

DROP TABLE IF EXISTS `tbl_user_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_pregunta` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER` int(11) NOT NULL,
  `ID_PREGUNTA` int(11) NOT NULL,
  `RESPUESTA` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `tbl_preguntas_tbl_user_pregunta` (`ID_PREGUNTA`),
  KEY `tbl_ms_usuario_tbl_user_pregunta` (`ID_USER`),
  CONSTRAINT `tbl_ms_usuario_tbl_user_pregunta` FOREIGN KEY (`ID_USER`) REFERENCES `tbl_ms_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_preguntas_tbl_user_pregunta` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `tbl_preguntas` (`ID_PREGUNTA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_pregunta`
--

LOCK TABLES `tbl_user_pregunta` WRITE;
/*!40000 ALTER TABLE `tbl_user_pregunta` DISABLE KEYS */;
INSERT INTO `tbl_user_pregunta` VALUES (141,151,2,'$2y$10$6dal4JAVmWp1g0A0tFCSCO.3PU4BikyDwv.QPy3BWFU/LDXx4ANjC'),(142,151,3,'$2y$10$ADK3G24eVGQzuzKFsI1/Ye81cztawU66eyK18.fO8Jd.TgUWIj9SK'),(143,152,4,'$2y$10$DtOcAL/9DvXTiTvpWmjaZ.ip.Czrb7Mcp0G6AaasS5Vhqb15zjhii'),(144,152,2,'$2y$10$IQWNxB6DvwAgVxPqaYQeLeTj5AtiRQdZEf.n1NqTZQ6kqhin7dJzu');
/*!40000 ALTER TABLE `tbl_user_pregunta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 17:26:42
