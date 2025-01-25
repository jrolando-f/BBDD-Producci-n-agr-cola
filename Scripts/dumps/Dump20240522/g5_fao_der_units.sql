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
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `unit` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES ('%','Percent'),('%LSU','Percent of Total Livestock Units'),('0.1 g/An','tenth Grams per animal'),('100 g','hundred Grams'),('100 g/An','hundred Grams per animal'),('100 g/ha','hundred Grams per hectare'),('100 g/t','hundred Grams per tonne'),('100 mg/An','hundred Milligrams per animal'),('1000 An','thousand Animals'),('1000 ha','thousand Hectares'),('1000 Int$','thousand International Dollar'),('1000 Int$/cap','thousand International Dollar per capita'),('1000 No','thousand Number'),('1000 SLC','thousand Standard Local Currency'),('1000 t','thousand Tonnes'),('1000 USD','thousand US Dollar'),('Â°c','Degrees celsius'),('An','Animals'),('g/cap/d','Grams per capita per day'),('g/Int$','Grams per International Dollar'),('ha','Hectares'),('ha/cap','Hectares per capita'),('Î¼g/cap/d','Micrograms per capita per day'),('Index','Index'),('Int$/cap','International Dollar per capita'),('kcal/cap/d','Kilocalories per capita per day'),('kg','Kilograms'),('kg CO2eq/kg','Kilograms of CO2 equivalent per kilogram'),('kg/1000 Int.$','kilograms per thousand international dollars'),('kg/cap','Kilograms per capita'),('kg/ha','Kilograms per hectare'),('km','Kilometers'),('km2','Square kilometers'),('kt','Kilotonnes'),('LCU','Local Currency units'),('LCU/cap/d','Local Currency Units per capita per day'),('LCU/t','Local Currency Units per tonne'),('LSU','Livestock units'),('LSU/ha','Livestock units per hectare'),('m3','Cubic meters'),('mg/cap/d','Milligrams per capita per day'),('million Kcal','million Kilocalories'),('million LCU','million Local Currency units'),('million No','million Number'),('million PPP','million PPP'),('million SLC','million Standard Local Currency'),('million t','million Tonnes'),('million USD','million US Dollar'),('No','Number'),('No/An','Number per animal'),('PPP dollar per person per day','purchasing power parity dollar per person per day'),('Score','Score'),('SLC','Standard Local Currency'),('t','Tonnes'),('t/cap','Tonnes per capita'),('t/ha','Tonnes per hectare'),('TJ','Terajoule'),('USD','US Dollar'),('USD_PPP/cap','US Dollar, converted using purchasing power parities per capita'),('USD/m3','US dollars per cubic metre');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
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
