-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: seminuevos_haro
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auto` (
  `idAuto` int(11) NOT NULL AUTO_INCREMENT,
  `precio` int(11) DEFAULT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `cilindraje` int(11) DEFAULT NULL,
  `Kilometraje` int(11) DEFAULT NULL,
  `Motor_desc` varchar(45) DEFAULT NULL,
  `disponible` int(11) DEFAULT NULL,
  `marca_idMarca` int(11) NOT NULL,
  `frenos_idFrenos` int(11) NOT NULL,
  `interiores_idInteriores` int(11) NOT NULL,
  `quemacocos_idQuemacocos` int(11) NOT NULL,
  `year_idYear` int(11) NOT NULL,
  `color_idColor` int(11) NOT NULL,
  `electrico_idElectrico` int(11) NOT NULL,
  `transmision_idTransmision` int(11) NOT NULL,
  `traccion_idTraccion` int(11) NOT NULL,
  PRIMARY KEY (`idAuto`),
  KEY `fk_auto_marca_idx` (`marca_idMarca`),
  KEY `fk_auto_frenos1_idx` (`frenos_idFrenos`),
  KEY `fk_auto_interiores1_idx` (`interiores_idInteriores`),
  KEY `fk_auto_quemacocos1_idx` (`quemacocos_idQuemacocos`),
  KEY `fk_auto_year1_idx` (`year_idYear`),
  KEY `fk_auto_color1_idx` (`color_idColor`),
  KEY `fk_auto_electrico1_idx` (`electrico_idElectrico`),
  KEY `fk_auto_transmision1_idx` (`transmision_idTransmision`),
  KEY `fk_auto_traccion1_idx` (`traccion_idTraccion`),
  CONSTRAINT `fk_auto_color1` FOREIGN KEY (`color_idColor`) REFERENCES `color` (`idcolor`),
  CONSTRAINT `fk_auto_electrico1` FOREIGN KEY (`electrico_idElectrico`) REFERENCES `electrico` (`idelectrico`),
  CONSTRAINT `fk_auto_frenos1` FOREIGN KEY (`frenos_idFrenos`) REFERENCES `frenos` (`idfrenos`),
  CONSTRAINT `fk_auto_interiores1` FOREIGN KEY (`interiores_idInteriores`) REFERENCES `interiores` (`idinteriores`),
  CONSTRAINT `fk_auto_marca` FOREIGN KEY (`marca_idMarca`) REFERENCES `marca` (`idmarca`),
  CONSTRAINT `fk_auto_quemacocos1` FOREIGN KEY (`quemacocos_idQuemacocos`) REFERENCES `quemacocos` (`idquemacocos`),
  CONSTRAINT `fk_auto_traccion1` FOREIGN KEY (`traccion_idTraccion`) REFERENCES `traccion` (`idtraccion`),
  CONSTRAINT `fk_auto_transmision1` FOREIGN KEY (`transmision_idTransmision`) REFERENCES `transmision` (`idtransmision`),
  CONSTRAINT `fk_auto_year1` FOREIGN KEY (`year_idYear`) REFERENCES `year` (`idyear`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,10000,'nissan','Desc',6,5,'test',NULL,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `color` (
  `idColor` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`idColor`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Rojo'),(2,'Verde'),(3,'Azul'),(4,'Amarillo'),(5,'Negro'),(6,'Blanco'),(7,'Plata'),(8,'Oro'),(9,'Gris'),(10,'Perla'),(11,'Marron'),(12,'Cafe'),(13,'Morado'),(14,'Rosa'),(15,'Salmon'),(16,'Naranja'),(17,'Tinto'),(18,'Violeta');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electrico`
--

DROP TABLE IF EXISTS `electrico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `electrico` (
  `idElectrico` int(11) NOT NULL AUTO_INCREMENT,
  `electrico` varchar(45) NOT NULL,
  PRIMARY KEY (`idElectrico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electrico`
--

LOCK TABLES `electrico` WRITE;
/*!40000 ALTER TABLE `electrico` DISABLE KEYS */;
INSERT INTO `electrico` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `electrico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frenos`
--

DROP TABLE IF EXISTS `frenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `frenos` (
  `idFrenos` int(11) NOT NULL AUTO_INCREMENT,
  `frenos` varchar(45) NOT NULL,
  PRIMARY KEY (`idFrenos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frenos`
--

LOCK TABLES `frenos` WRITE;
/*!40000 ALTER TABLE `frenos` DISABLE KEYS */;
INSERT INTO `frenos` VALUES (1,'Mecanicos'),(2,'Hidraulicos'),(3,'Neumaticos');
/*!40000 ALTER TABLE `frenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `imagenes` (
  `idImagenes` int(11) NOT NULL AUTO_INCREMENT,
  `imagenes` varchar(45) NOT NULL,
  `auto_idAuto` int(11) NOT NULL,
  PRIMARY KEY (`idImagenes`),
  KEY `fk_imagenes_auto1_idx` (`auto_idAuto`),
  CONSTRAINT `fk_imagenes_auto1` FOREIGN KEY (`auto_idAuto`) REFERENCES `auto` (`idauto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interiores`
--

DROP TABLE IF EXISTS `interiores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `interiores` (
  `idInteriores` int(11) NOT NULL AUTO_INCREMENT,
  `interiores` varchar(45) NOT NULL,
  PRIMARY KEY (`idInteriores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interiores`
--

LOCK TABLES `interiores` WRITE;
/*!40000 ALTER TABLE `interiores` DISABLE KEYS */;
INSERT INTO `interiores` VALUES (1,'Piel'),(2,'Sintetico');
/*!40000 ALTER TABLE `interiores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Ford'),(2,'Chevrolet'),(3,'Mazda'),(4,'BMW'),(5,'Audi'),(6,'Nissan'),(7,'Volkswagen'),(8,'Toyota'),(9,'Honda'),(10,'Renault'),(11,'Peugeot'),(12,'Mercedez Benz'),(13,'Hyundai'),(14,'Seat'),(15,'Suzuki'),(16,'Kia'),(17,'Mini'),(18,'Lincoln'),(19,'Infiniti'),(20,'Acura'),(21,'Volvo'),(22,'Porsche'),(23,'Subaru'),(24,'Isuzu'),(25,'Land Rover'),(26,'Smart'),(27,'Jaguar'),(28,'Ferrari'),(29,'Cadillac'),(30,'Jeep'),(31,'Lincoln'),(32,'Tesla'),(33,'Mitsubishi'),(34,'Fiat'),(35,'Genesis'),(36,'Tata'),(37,'Bentley'),(38,'GMC'),(39,'Lotus'),(40,'Pontiac'),(41,'Lexus'),(42,'Dodge'),(43,'Maserati');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */; 
UNLOCK TABLES;

--
-- Table structure for table `quemacocos`
--

DROP TABLE IF EXISTS `quemacocos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `quemacocos` (
  `idQuemacocos` int(11) NOT NULL AUTO_INCREMENT,
  `quemacocos` varchar(45) NOT NULL,
  PRIMARY KEY (`idQuemacocos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quemacocos`
--

LOCK TABLES `quemacocos` WRITE;
/*!40000 ALTER TABLE `quemacocos` DISABLE KEYS */;
INSERT INTO `quemacocos` VALUES (1,'Si'),(2,'No'),(3,'si'),(4,'no');
/*!40000 ALTER TABLE `quemacocos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traccion`
--

DROP TABLE IF EXISTS `traccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `traccion` (
  `idTraccion` int(11) NOT NULL AUTO_INCREMENT,
  `traccion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTraccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traccion`
--

LOCK TABLES `traccion` WRITE;
/*!40000 ALTER TABLE `traccion` DISABLE KEYS */;
INSERT INTO `traccion` VALUES (1,'FWD'),(2,'4×4'),(3,'4WD'),(4,'RWD'),(5,'AWD');
/*!40000 ALTER TABLE `traccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transmision`
--

DROP TABLE IF EXISTS `transmision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transmision` (
  `idTransmision` int(11) NOT NULL AUTO_INCREMENT,
  `transmision` varchar(45) NOT NULL,
  PRIMARY KEY (`idTransmision`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transmision`
--

LOCK TABLES `transmision` WRITE;
/*!40000 ALTER TABLE `transmision` DISABLE KEYS */;
INSERT INTO `transmision` VALUES (1,'Automatica'),(2,'Manual');
/*!40000 ALTER TABLE `transmision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `year` (
  `idYear` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`idYear`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1,2019),(2,2018),(3,2017),(4,2016),(5,2015),(6,2014),(7,2013),(8,2012),(9,2011),(10,2010),(11,2009),(12,2008),(13,2007),(14,2006),(15,2005),(16,2004),(17,2003),(18,2002),(19,2001),(20,2000),(21,1999),(22,1998),(23,1997),(24,1996);
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-29 14:05:28
