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
-- Table structure for table `agrup_items`
--

DROP TABLE IF EXISTS `agrup_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agrup_items` (
  `Agrup_Code` varchar(100) NOT NULL,
  `Item_Group` text NOT NULL,
  PRIMARY KEY (`Agrup_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agrup_items`
--

LOCK TABLES `agrup_items` WRITE;
/*!40000 ALTER TABLE `agrup_items` DISABLE KEYS */;
INSERT INTO `agrup_items` VALUES ('1714','Crops, primary'),('1717','Cereals, primary'),('1720','Roots and Tubers, Total'),('1723','Sugar Crops Primary'),('1726','Pulses, Total'),('1729','Treenuts, Total'),('1730','Oilcrops Primary'),('1732','Oilcrops, Oil Equivalent'),('1735','Vegetables Primary'),('1738','Fruit Primary'),('1745','Cheese (All Kinds)'),('1746','Cattle and Buffaloes'),('1749','Sheep and Goats'),('1753','Fibre Crops Primary'),('17530','Fibre Crops, Fibre Equivalent'),('1756','Live Animals'),('1765','Meat, Total'),('1777','Hides and skins, primary'),('1780','Milk, Total'),('1783','Eggs Primary'),('1804','Citrus Fruit, Total'),('1806','Beef and Buffalo Meat, primary'),('1807','Sheep and Goat Meat'),('1808','Meat, Poultry'),('1809','Skim Milk & Buttermilk, Dry'),('1811','Butter and Ghee'),('1816','Evaporated & Condensed Milk'),('1841','Oilcrops, Cake Equivalent'),('2029','Poultry Birds'),('QA','Live Animals'),('QC','Crops, primary'),('QD','Crops Processed'),('QL','Livestock primary'),('QP','Livestock processed');
/*!40000 ALTER TABLE `agrup_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 12:05:09
