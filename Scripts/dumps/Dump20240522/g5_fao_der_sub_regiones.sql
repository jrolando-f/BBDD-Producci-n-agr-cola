-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: g5_fao_der
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `sub_regiones`
--

DROP TABLE IF EXISTS `sub_regiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_regiones` (
  `Region_Code` int NOT NULL,
  `Region` text NOT NULL,
  `continente_id` int DEFAULT NULL,
  PRIMARY KEY (`Region_Code`),
  KEY `fk_continente_idx` (`continente_id`),
  CONSTRAINT `fk_continente` FOREIGN KEY (`continente_id`) REFERENCES `continente` (`id_continente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_regiones`
--

LOCK TABLES `sub_regiones` WRITE;
/*!40000 ALTER TABLE `sub_regiones` DISABLE KEYS */;
INSERT INTO `sub_regiones` VALUES (5203,'Northern America',5200),(5204,'Central America',5200),(5206,'Caribbean',5200),(5207,'South America',5200),(5301,'Central Asia',5300),(5302,'Eastern Asia',5300),(5303,'Southern Asia',5300),(5304,'South-eastern Asia',5300),(5305,'Western Asia',5300),(5401,'Eastern Europe',5400),(5402,'Northern Europe',5400),(5403,'Southern Europe',5400),(5404,'Western Europe',5400),(5501,'Australia and New Zealand',5500),(5502,'Melanesia',5500),(5503,'Micronesia',5500),(5504,'Polynesia',5500);
/*!40000 ALTER TABLE `sub_regiones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 12:05:03
