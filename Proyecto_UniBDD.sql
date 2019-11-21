-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 192.168.56.104    Database: universidad
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.17-MariaDB

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
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Informatica I'),(2,'Ciencias de la Computacion'),(6,'Educacion Inicial'),(7,'Bioanalisis'),(8,'Enfermeria'),(10,'Educacion Fisica'),(12,'Educacion Fisica'),(13,'Idiomas'),(14,'Aeronautica');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera_materia`
--

DROP TABLE IF EXISTS `carrera_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera_materia` (
  `materia_id` int(11) NOT NULL,
  `carrera_id` varchar(45) NOT NULL,
  PRIMARY KEY (`materia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera_materia`
--

LOCK TABLES `carrera_materia` WRITE;
/*!40000 ALTER TABLE `carrera_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `matricula` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `carrera_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (4,'Antonio Minaya',20192020,40,NULL),(6,'Juana Brito',1920154,40,NULL),(7,'Juana Brito',1920154,40,NULL),(11,'Valentina Minaya',192089,21,NULL),(12,'German Brito',192009,41,NULL),(13,'Avid Duarte',192109,37,NULL),(14,'HCarlos Reynoso',192556,20,NULL),(15,'Carlos Reynoso',192556,20,NULL),(23,'Jose Almanzar',1929154,25,NULL),(24,'Carlos Sosa',20789542,21,NULL),(25,'Veronica Mendez',20231456,17,NULL),(26,'Pedro Pablo Ventura',20986574,19,NULL);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `creditos` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (2,'Lengua EspaÃ±ola I','3'),(5,'Introduccion a la Programacion','4'),(7,'Ciencias Sociales','3'),(28,'Educacion Fisica','3'),(33,'Matematica','3'),(34,'Orientacion','2'),(35,'Introduccion a la Teologia','3'),(37,'Quimica Basica','4'),(38,'Electricidad','4'),(40,'Calculo I','5'),(41,'Calculo II','5'),(42,'Matematica Financiera','4'),(43,'Ingles I','5'),(45,'Frances II','3'),(46,'Frances I','4'),(47,'Ciencias Naturales','3'),(48,'Programacion I','4'),(49,'Programacion II','4'),(50,'Psicologia Educativa','3'),(51,'Introduccion al Cristianismo','3'),(52,'Contabilidad I','4'),(53,'AnatomÃ­a I','3'),(54,'Introduccion a la Sociologia','3'),(55,'Mecatronica','3'),(56,'Antropologia','3'),(57,'Introduccion al Socialismo','3'),(58,'Bioanalisis','3'),(59,'Introduccion a la Enfermeria','4'),(60,'Emprendurismo','3');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre` (
  `id` int(11) NOT NULL,
  `ciclo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre_estudiante_materia`
--

DROP TABLE IF EXISTS `semestre_estudiante_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre_estudiante_materia` (
  `semestre_id` int(11) NOT NULL,
  `estudiante_id` varchar(45) NOT NULL,
  `materia_id` varchar(45) NOT NULL,
  PRIMARY KEY (`semestre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre_estudiante_materia`
--

LOCK TABLES `semestre_estudiante_materia` WRITE;
/*!40000 ALTER TABLE `semestre_estudiante_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestre_estudiante_materia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-21 19:31:55
