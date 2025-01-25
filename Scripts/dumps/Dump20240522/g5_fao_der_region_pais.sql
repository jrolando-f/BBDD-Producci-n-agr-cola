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
-- Table structure for table `region_pais`
--

DROP TABLE IF EXISTS `region_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region_pais` (
  `Pais_Code` int NOT NULL,
  `Pais` varchar(100) NOT NULL,
  `Region_Code` int NOT NULL,
  PRIMARY KEY (`Pais_Code`),
  KEY `fk_sub_reg_idx` (`Region_Code`),
  KEY `idx_Pais` (`Pais`),
  CONSTRAINT `fk_sub_reg` FOREIGN KEY (`Region_Code`) REFERENCES `sub_regiones` (`Region_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_pais`
--

LOCK TABLES `region_pais` WRITE;
/*!40000 ALTER TABLE `region_pais` DISABLE KEYS */;
INSERT INTO `region_pais` VALUES (1,'Armenia',5305),(2,'Afghanistan',5303),(3,'Albania',5403),(8,'Antigua and Barbuda',5206),(9,'Argentina',5207),(10,'Australia',5501),(11,'Austria',5404),(12,'Bahamas',5206),(13,'Bahrain',5305),(14,'Barbados',5206),(15,'Belgium-Luxembourg',5404),(16,'Bangladesh',5303),(18,'Bhutan',5303),(19,'Bolivia (Plurinational State of)',5207),(21,'Brazil',5207),(23,'Belize',5204),(25,'Solomon Islands',5502),(26,'Brunei Darussalam',5304),(27,'Bulgaria',5401),(28,'Myanmar',5304),(33,'Canada',5203),(38,'Sri Lanka',5303),(40,'Chile',5207),(41,'China, mainland',5302),(44,'Colombia',5207),(47,'Cook Islands',5504),(48,'Costa Rica',5204),(49,'Cuba',5206),(50,'Cyprus',5305),(51,'Czechoslovakia',5401),(52,'Azerbaijan',5305),(54,'Denmark',5402),(55,'Dominica',5206),(56,'Dominican Republic',5206),(57,'Belarus',5401),(58,'Ecuador',5207),(60,'El Salvador',5204),(63,'Estonia',5402),(64,'Faroe Islands',5402),(66,'Fiji',5502),(67,'Finland',5402),(68,'France',5404),(69,'French Guiana',5207),(70,'French Polynesia',5504),(73,'Georgia',5305),(79,'Germany',5404),(80,'Bosnia and Herzegovina',5403),(83,'Kiribati',5503),(84,'Greece',5403),(86,'Grenada',5206),(87,'Guadeloupe',5206),(89,'Guatemala',5204),(91,'Guyana',5207),(93,'Haiti',5206),(95,'Honduras',5204),(96,'China, Hong Kong SAR',5302),(97,'Hungary',5401),(98,'Croatia',5403),(99,'Iceland',5402),(100,'India',5303),(101,'Indonesia',5304),(102,'Iran (Islamic Republic of)',5303),(103,'Iraq',5305),(104,'Ireland',5402),(105,'Israel',5305),(106,'Italy',5403),(108,'Kazakhstan',5301),(109,'Jamaica',5206),(110,'Japan',5302),(112,'Jordan',5305),(113,'Kyrgyzstan',5301),(115,'Cambodia',5304),(116,'Democratic People\'s Republic of Korea',5302),(117,'Republic of Korea',5302),(118,'Kuwait',5305),(119,'Latvia',5402),(120,'Lao People\'s Democratic Republic',5304),(121,'Lebanon',5305),(126,'Lithuania',5402),(127,'Marshall Islands',5503),(128,'China, Macao SAR',5302),(131,'Malaysia',5304),(132,'Maldives',5303),(134,'Malta',5403),(135,'Martinique',5206),(138,'Mexico',5204),(141,'Mongolia',5302),(145,'Micronesia (Federated States of)',5503),(146,'Republic of Moldova',5401),(148,'Nauru',5503),(149,'Nepal',5303),(150,'Netherlands (Kingdom of the)',5404),(153,'New Caledonia',5502),(154,'North Macedonia',5403),(155,'Vanuatu',5502),(156,'New Zealand',5501),(157,'Nicaragua',5204),(160,'Niue',5504),(162,'Norway',5402),(165,'Pakistan',5303),(166,'Panama',5204),(167,'Czechia',5401),(168,'Papua New Guinea',5502),(169,'Paraguay',5207),(170,'Peru',5207),(171,'Philippines',5304),(173,'Poland',5401),(174,'Portugal',5403),(176,'Timor-Leste',5304),(177,'Puerto Rico',5206),(179,'Qatar',5305),(183,'Romania',5401),(185,'Russian Federation',5401),(186,'Serbia and Montenegro',5403),(188,'Saint Kitts and Nevis',5206),(189,'Saint Lucia',5206),(191,'Saint Vincent and the Grenadines',5206),(194,'Saudi Arabia',5305),(198,'Slovenia',5403),(199,'Slovakia',5401),(200,'Singapore',5304),(203,'Spain',5403),(207,'Suriname',5207),(208,'Tajikistan',5301),(210,'Sweden',5402),(211,'Switzerland',5404),(212,'Syrian Arab Republic',5305),(213,'Turkmenistan',5301),(214,'China, Taiwan Province of',5302),(216,'Thailand',5304),(218,'Tokelau',5504),(219,'Tonga',5504),(220,'Trinidad and Tobago',5206),(221,'Oman',5305),(223,'TÃ¼rkiye',5305),(225,'United Arab Emirates',5305),(227,'Tuvalu',5504),(228,'USSR',5401),(229,'United Kingdom of Great Britain and Northern Ireland',5402),(230,'Ukraine',5401),(231,'United States of America',5203),(234,'Uruguay',5207),(235,'Uzbekistan',5301),(236,'Venezuela (Bolivarian Republic of)',5207),(237,'Viet Nam',5304),(244,'Samoa',5504),(248,'Yugoslav SFR',5403),(249,'Yemen',5305),(255,'Belgium',5404),(256,'Luxembourg',5404),(272,'Serbia',5403),(273,'Montenegro',5403),(299,'Palestine',5305),(351,'China',5302);
/*!40000 ALTER TABLE `region_pais` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 12:05:05
