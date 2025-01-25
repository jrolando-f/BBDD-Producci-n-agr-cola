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
-- Table structure for table `elementos`
--

DROP TABLE IF EXISTS `elementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementos` (
  `Element_Code` int NOT NULL,
  `Element` varchar(100) NOT NULL,
  `Unit` varchar(50) NOT NULL,
  `Description` text,
  PRIMARY KEY (`Element_Code`),
  KEY `fk_unit_elemt_idx` (`Unit`),
  KEY `idx_element` (`Element`),
  CONSTRAINT `fk_unit_elemt` FOREIGN KEY (`Unit`) REFERENCES `units` (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementos`
--

LOCK TABLES `elementos` WRITE;
/*!40000 ALTER TABLE `elementos` DISABLE KEYS */;
INSERT INTO `elementos` VALUES (5111,'Stocks','An','This variable indicates the number of animals of the species present in the country at the time of enumeration. It includes animals raised either for draft purposes or for meat, eggs and dairy production or kept for breeding. Live animals in captivity for fur or skin such as foxes, minks etc. are not included in the system although furskin trade is reported. The enumeration to be chosen, when more than one survey is taken, is the closest to the beginning of the calendar year. Livestock data are reported in number of heads (units) except for poultry, rabbits and other rodents which are reported in thousand units. Source: FAO Statistics Division'),(5112,'Stocks','1000 An','This variable indicates the number of animals of the species present in the country at the time of enumeration. It includes animals raised either for draft purposes or for meat, eggs and dairy production or kept for breeding. Live animals in captivity for fur or skin such as foxes, minks etc. are not included in the system although furskin trade is reported. The enumeration to be chosen, when more than one survey is taken, is the closest to the beginning of the calendar year. Livestock data are reported in number of heads (units) except for poultry, rabbits and other rodents which are reported in thousand units. Source: FAO Statistics Division'),(5114,'Stocks','No','This variable indicates the number of animals of the species present in the country at the time of enumeration. It includes animals raised either for draft purposes or for meat, eggs and dairy production or kept for breeding. Live animals in captivity for fur or skin such as foxes, minks etc. are not included in the system although furskin trade is reported. The enumeration to be chosen, when more than one survey is taken, is the closest to the beginning of the calendar year. Livestock data are reported in number of heads (units) except for poultry, rabbits and other rodents which are reported in thousand units. Source: FAO Statistics Division'),(5312,'Area harvested','ha','Data refer to the area from which a crop is gathered. Area harvested, therefore, excludes the area from which, although sown or planted, there was no harvest due to damage, failure, etc. It is usually net for temporary crops and some times gross for permanent crops. Net area differs from gross area insofar as the latter includes uncultivated patches, footpaths, ditches, headlands, shoulders, shelterbelts, etc.If the crop under consideration is harvested more than once during the year as a consequence of successive cropping (i.e. the same crop is sown or planted more than once in the same field during the year), the area is counted as many times as harvested. On the contrary, area harvested will be recorded only once in the case of successive gathering of the crop during the year from the same standing crops. With regard to mixed and associated crops, the area sown relating to each crop should be reported separately. When the mixture refers to particular crops, generally grains, it is recommended to treat the mixture as if it were a single crop; therefore, area sown is recorded only for the crop reported. Source: FAO Statistics Division'),(5313,'Laying','1000 An',''),(5314,'Prod Popultn','No',''),(5318,'Milk Animals','An',''),(5319,'Prod Popultn','An',''),(5320,'Producing Animals/Slaughtered','An',''),(5321,'Producing Animals/Slaughtered','1000 An',''),(5322,'Production','An','Figures relate to the total domestic production whether inside or outside the agricultural sector, i.e. it includes non-commercial production and production from kitchen gardens. Unless otherwise indicated, production is reported at the farm level for crop and livestock products (i.e. in the case of crops, excluding harvesting losses) and in terms of live weight for fish items (i.e. the actual ex-water weight at the time of the catch). All data shown relate to total meat production from both commercial and farm slaughter. Data are expressed in terms of dressed carcass weight, excluding offal and slaughter fats. Production of beef and buffalo meat includes veal; mutton and goat meat includes meat from lambs and kids; pig meat includes bacon and ham in fresh equivalent. Poultry meat includes meat from all domestic birds and refers, wherever possible, to ready-to-cook weight. Source: FAO Statistics Division'),(5323,'Production','1000 An','Figures relate to the total domestic production whether inside or outside the agricultural sector, i.e. it includes non-commercial production and production from kitchen gardens. Unless otherwise indicated, production is reported at the farm level for crop and livestock products (i.e. in the case of crops, excluding harvesting losses) and in terms of live weight for fish items (i.e. the actual ex-water weight at the time of the catch). All data shown relate to total meat production from both commercial and farm slaughter. Data are expressed in terms of dressed carcass weight, excluding offal and slaughter fats. Production of beef and buffalo meat includes veal; mutton and goat meat includes meat from lambs and kids; pig meat includes bacon and ham in fresh equivalent. Poultry meat includes meat from all domestic birds and refers, wherever possible, to ready-to-cook weight. Source: FAO Statistics Division'),(5410,'Yield','100 mg/An',''),(5413,'Yield','No/An',''),(5417,'Yield/Carcass Weight','100 g/An',''),(5419,'Yield','100 g/ha','Harvested production per unit of harvested area for crop products. In most of the cases yield data are not recorded but obtained by dividing the production data by the data on area harvested. Data on yields of permanent crops are not as reliable as those for temporary crops either because most of the area information may correspond to planted area, as for grapes, or because of the scarcity and unreliability of the area figures reported by the countries, as for example for cocoa and coffee. Source: FAO Statistics Division'),(5420,'Yield','100 g/An',''),(5422,'Yield','100 g',''),(5423,'Extraction Rate','100 g/t',''),(5424,'Yield/Carcass Weight','0.1 g/An',''),(5510,'Production','t','Amount produced in the year'),(5513,'Production','1000 No','Figures relate to the total domestic production whether inside or outside the agricultural sector, i.e. it includes non-commercial production and production from kitchen gardens. Unless otherwise indicated, production is reported at the farm level for crop and livestock products (i.e. in the case of crops, excluding harvesting losses) and in terms of live weight for fish items (i.e. the actual ex-water weight at the time of the catch). All data shown relate to total meat production from both commercial and farm slaughter. Data are expressed in terms of dressed carcass weight, excluding offal and slaughter fats. Production of beef and buffalo meat includes veal; mutton and goat meat includes meat from lambs and kids; pig meat includes bacon and ham in fresh equivalent. Poultry meat includes meat from all domestic birds and refers, wherever possible, to ready-to-cook weight. Source: FAO Statistics Division');
/*!40000 ALTER TABLE `elementos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 12:05:04
