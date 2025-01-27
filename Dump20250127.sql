CREATE DATABASE  IF NOT EXISTS `aqmproj` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aqmproj`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: aqmproj
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `airqualitymetric`
--

DROP TABLE IF EXISTS `airqualitymetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airqualitymetric` (
  `MetricID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `MetricName` varchar(50) NOT NULL,
  `MeasurementUnit` varchar(20) DEFAULT NULL,
  `HazardLevel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MetricID`),
  UNIQUE KEY `MetricID` (`MetricID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airqualitymetric`
--

LOCK TABLES `airqualitymetric` WRITE;
/*!40000 ALTER TABLE `airqualitymetric` DISABLE KEYS */;
INSERT INTO `airqualitymetric` VALUES (1,'PM2.5','µg/m³','Moderate'),(2,'PM10','µg/m³','USG'),(3,'NO2','ppb','Unhealthy'),(4,'SO2','ppb','Moderate'),(5,'CO','ppm','Hazardous'),(6,'O3','ppb','Unhealthy'),(7,'VOC','ppb','Moderate'),(8,'NH3','ppb','Low'),(9,'Methane','ppm','Hazardous'),(10,'H2S','ppb','Dangerous'),(11,'CO2','ppm','Low'),(12,'Black Carbon','µg/m³','USG'),(13,'Lead','µg/m³','Unhealthy'),(14,'Ammonia','ppb','Low'),(15,'Arsenic','µg/m³','Very Hazardous'),(16,'Formaldehyde','ppb','Hazardous'),(17,'Acetone','ppb','Moderate'),(18,'Sulfur Hexafluoride','ppb','Moderate'),(19,'Hydrogen Cyanide','ppb','Hazardous'),(20,'Benzene','ppb','USG'),(21,'Carbon Disulfide','ppb','Moderate'),(22,'Toluene','ppb','Moderate'),(23,'Xylene','ppb','Low'),(24,'Ozone Depleting Substances','ppb','Dangerous'),(25,'Chlorine','ppb','Very Hazardous'),(26,'Nitrous Oxide','ppb','Moderate'),(27,'Hydrogen Peroxide','ppb','Low'),(28,'Methyl Chloride','ppb','Moderate'),(29,'Hydrogen Sulfide','ppb','Hazardous'),(30,'Sodium Chloride','µg/m³','Low');
/*!40000 ALTER TABLE `airqualitymetric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airqualitytrend`
--

DROP TABLE IF EXISTS `airqualitytrend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airqualitytrend` (
  `TrendID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocationID` int DEFAULT NULL,
  `MetricID` int DEFAULT NULL,
  `AverageValue` decimal(10,2) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`TrendID`),
  UNIQUE KEY `TrendID` (`TrendID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airqualitytrend`
--

LOCK TABLES `airqualitytrend` WRITE;
/*!40000 ALTER TABLE `airqualitytrend` DISABLE KEYS */;
INSERT INTO `airqualitytrend` VALUES (1,1,1,50.23,'2024-01-01','2024-01-07'),(2,2,2,70.15,'2024-01-01','2024-01-07'),(3,3,3,80.25,'2024-01-01','2024-01-07'),(4,4,4,90.10,'2024-01-01','2024-01-07'),(5,5,5,55.30,'2024-01-01','2024-01-07'),(6,6,6,65.35,'2024-01-01','2024-01-07'),(7,7,7,85.50,'2024-01-08','2024-01-14'),(8,8,8,72.50,'2024-01-08','2024-01-14'),(9,9,9,77.40,'2024-01-08','2024-01-14'),(10,10,10,69.30,'2024-01-08','2024-01-14'),(11,11,11,60.25,'2024-01-08','2024-01-14'),(12,12,12,93.75,'2024-01-08','2024-01-14'),(13,13,13,78.10,'2024-01-15','2024-01-21'),(14,14,14,82.60,'2024-01-15','2024-01-21'),(15,15,15,65.20,'2024-01-15','2024-01-21'),(16,16,16,87.30,'2024-01-15','2024-01-21'),(17,17,17,58.40,'2024-01-15','2024-01-21'),(18,18,18,75.80,'2024-01-15','2024-01-21'),(19,19,19,69.70,'2024-01-22','2024-01-28'),(20,20,20,74.50,'2024-01-22','2024-01-28'),(21,21,21,80.20,'2024-01-22','2024-01-28'),(22,22,22,92.10,'2024-01-22','2024-01-28'),(23,23,23,68.40,'2024-01-22','2024-01-28'),(24,24,24,77.50,'2024-01-22','2024-01-28'),(25,25,25,88.00,'2024-01-29','2024-02-04'),(26,26,26,70.80,'2024-01-29','2024-02-04'),(27,27,27,85.50,'2024-01-29','2024-02-04'),(28,28,28,67.30,'2024-01-29','2024-02-04'),(29,29,29,73.40,'2024-01-29','2024-02-04'),(30,30,30,90.50,'2024-01-29','2024-02-04');
/*!40000 ALTER TABLE `airqualitytrend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alertthresholds`
--

DROP TABLE IF EXISTS `alertthresholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertthresholds` (
  `ThresholdID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `MetricID` int DEFAULT NULL,
  `LocationID` int DEFAULT NULL,
  `ThresholdValue` decimal(10,2) NOT NULL,
  `AlertLevel` varchar(20) NOT NULL,
  `AlertMessage` text,
  PRIMARY KEY (`ThresholdID`),
  UNIQUE KEY `ThresholdID` (`ThresholdID`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertthresholds`
--

LOCK TABLES `alertthresholds` WRITE;
/*!40000 ALTER TABLE `alertthresholds` DISABLE KEYS */;
INSERT INTO `alertthresholds` VALUES (161,1,1,50.00,'Low','Air quality is acceptable.'),(162,2,2,100.00,'Moderate','Minor irritation possible for sensitive individuals.'),(163,3,3,150.00,'Unhealthy','Sensitive groups experience discomfort.'),(164,4,4,200.00,'Unhealthy','Health effects likely for everyone.'),(165,5,5,75.00,'Low','Air quality is acceptable.'),(166,6,6,120.00,'Moderate','Minor irritation possible for sensitive groups.'),(167,7,7,180.00,'Moderate','Sensitive groups experience discomfort.'),(168,8,8,250.00,'Unhealthy','Health effects likely for everyone.'),(169,9,9,60.00,'Low','Air quality is good.'),(170,10,10,90.00,'Moderate','Irritation possible for sensitive individuals.'),(171,11,11,160.00,'Unhealthy','Sensitive groups may feel discomfort.'),(172,12,12,220.00,'Unhealthy','Health effects likely for everyone.'),(173,13,13,80.00,'Low','Air quality remains good.'),(174,14,14,110.00,'Moderate','Mild irritation for sensitive individuals.'),(175,15,15,170.00,'Moderate','Sensitive groups may feel discomfort.'),(176,16,16,210.00,'Unhealthy','Health risks for most people.'),(177,17,17,65.00,'Low','Air quality is favorable.'),(178,18,18,105.00,'Moderate','Mild symptoms possible for sensitive groups.'),(179,19,19,175.00,'Moderate','Sensitive individuals may experience discomfort.'),(180,20,20,230.00,'Unhealthy','Health effects for the general population.'),(181,21,21,90.00,'Low','Air quality remains safe.'),(182,22,22,130.00,'Moderate','Irritation for sensitive individuals.'),(183,23,23,190.00,'Moderate','Sensitive groups may experience discomfort.'),(184,24,24,240.00,'Unhealthy','Health effects for everyone.'),(185,25,25,55.00,'Low','Air quality is acceptable.'),(186,26,26,115.00,'Moderate','Irritation for sensitive individuals.'),(187,27,27,185.00,'Moderate','Sensitive groups should take precautions.'),(188,28,28,260.00,'Unhealthy','Health effects likely for everyone.'),(189,29,29,70.00,'Low','Air quality remains good.'),(190,30,30,125.00,'Moderate','Mild symptoms for sensitive individuals.');
/*!40000 ALTER TABLE `alertthresholds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emissionsinventory`
--

DROP TABLE IF EXISTS `emissionsinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emissionsinventory` (
  `InventoryID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `SourceID` int DEFAULT NULL,
  `MetricID` int DEFAULT NULL,
  `EmissionRate` decimal(10,2) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL,
  PRIMARY KEY (`InventoryID`),
  UNIQUE KEY `InventoryID` (`InventoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emissionsinventory`
--

LOCK TABLES `emissionsinventory` WRITE;
/*!40000 ALTER TABLE `emissionsinventory` DISABLE KEYS */;
INSERT INTO `emissionsinventory` VALUES (1,1,1,45.25,'2024-11-18 02:30:00'),(2,2,2,30.55,'2024-11-18 02:45:00'),(3,3,3,25.30,'2024-11-18 03:00:00'),(4,4,4,60.10,'2024-11-18 03:15:00'),(5,5,5,40.40,'2024-11-18 03:30:00'),(6,6,6,50.65,'2024-11-18 03:45:00'),(7,7,7,35.75,'2024-11-18 04:00:00'),(8,8,8,55.80,'2024-11-18 04:15:00'),(9,9,9,60.55,'2024-11-18 04:30:00'),(10,10,10,42.45,'2024-11-18 04:45:00'),(11,11,11,37.95,'2024-11-18 05:00:00'),(12,12,12,47.25,'2024-11-18 05:15:00'),(13,13,13,39.10,'2024-11-18 05:30:00'),(14,14,14,43.50,'2024-11-18 05:45:00'),(15,15,15,33.70,'2024-11-18 06:00:00'),(16,16,16,48.95,'2024-11-18 06:15:00'),(17,17,17,52.30,'2024-11-18 06:30:00'),(18,18,18,29.60,'2024-11-18 06:45:00'),(19,19,19,41.80,'2024-11-18 07:00:00'),(20,20,20,36.25,'2024-11-18 07:15:00'),(21,21,21,55.90,'2024-11-18 07:30:00'),(22,22,22,38.40,'2024-11-18 07:45:00'),(23,23,23,44.20,'2024-11-18 08:00:00'),(24,24,24,49.75,'2024-11-18 08:15:00'),(25,25,25,41.10,'2024-11-18 08:30:00'),(26,26,26,34.50,'2024-11-18 08:45:00'),(27,27,27,58.35,'2024-11-18 09:00:00'),(28,28,28,52.90,'2024-11-18 09:15:00'),(29,29,29,48.10,'2024-11-18 09:30:00'),(30,30,30,46.80,'2024-11-18 09:45:00');
/*!40000 ALTER TABLE `emissionsinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `City` varchar(100) NOT NULL,
  `Region` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Latitude` decimal(9,6) DEFAULT NULL,
  `Longitude` decimal(9,6) DEFAULT NULL,
  `PopulationDensity` int DEFAULT NULL,
  PRIMARY KEY (`LocationID`),
  UNIQUE KEY `LocationID` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Ahmedabad','Gujarat','India',23.022500,72.571400,12000),(2,'Amritsar','Punjab','India',31.634000,74.872300,6200),(3,'Bengaluru','Karnataka','India',12.971600,77.594600,4300),(4,'Bhopal','Madhya Pradesh','India',23.259900,77.412600,4700),(5,'Chandigarh','Chandigarh','India',30.733300,76.779400,9250),(6,'Chennai','Tamil Nadu','India',13.082700,80.270700,14600),(7,'Coimbatore','Tamil Nadu','India',11.016800,76.955800,11000),(8,'Delhi','Delhi NCR','India',28.704100,77.102500,11300),(9,'Dehradun','Uttarakhand','India',30.316500,78.032200,1700),(10,'Guwahati','Assam','India',26.144500,91.736200,1300),(11,'Hyderabad','Telangana','India',17.385000,78.486700,10800),(12,'Indore','Madhya Pradesh','India',22.719600,75.857700,7200),(13,'Jaipur','Rajasthan','India',26.912400,75.787300,6400),(14,'Kanpur','Uttar Pradesh','India',26.449900,80.331900,14400),(15,'Kochi','Kerala','India',9.931200,76.267300,4400),(16,'Kolkata','West Bengal','India',22.572600,88.363900,24500),(17,'Lucknow','Uttar Pradesh','India',26.846700,80.946200,1800),(18,'Ludhiana','Punjab','India',30.901000,75.857300,9300),(19,'Mumbai','Maharashtra','India',19.076000,72.877700,20500),(20,'Mysuru','Karnataka','India',12.295800,76.639400,2000),(21,'Nagpur','Maharashtra','India',21.145800,79.088200,11500),(22,'Patna','Bihar','India',25.594100,85.137600,17000),(23,'Pune','Maharashtra','India',18.520400,73.856700,6030),(24,'Raipur','Chhattisgarh','India',21.251400,81.629600,6300),(25,'Ranchi','Jharkhand','India',23.344100,85.309600,5500),(26,'Surat','Gujarat','India',21.170200,72.831100,13600),(27,'Thiruvananthapuram','Kerala','India',8.524100,76.936600,5000),(28,'Vadodara','Gujarat','India',22.307200,73.181200,9300),(29,'Varanasi','Uttar Pradesh','India',25.317600,82.973900,11300),(30,'Vijayawada','Andhra Pradesh','India',16.506200,80.648000,8500);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pollutionreading`
--

DROP TABLE IF EXISTS `pollutionreading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pollutionreading` (
  `ReadingID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocationID` int DEFAULT NULL,
  `MetricID` int DEFAULT NULL,
  `SourceID` int DEFAULT NULL,
  `Value` decimal(10,2) NOT NULL,
  `Timestamp` timestamp NOT NULL,
  `ReadingAccuracy` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ReadingID`),
  UNIQUE KEY `ReadingID` (`ReadingID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pollutionreading`
--

LOCK TABLES `pollutionreading` WRITE;
/*!40000 ALTER TABLE `pollutionreading` DISABLE KEYS */;
INSERT INTO `pollutionreading` VALUES (1,1,1,5,45.67,'2024-11-01 02:30:00','High'),(2,2,2,4,92.50,'2024-11-01 03:30:00','Moderate'),(3,3,3,3,50.20,'2024-11-01 04:30:00','Low'),(4,4,4,10,12.10,'2024-11-01 05:30:00','High'),(5,5,5,2,55.35,'2024-11-01 06:30:00','Moderate'),(6,6,6,6,15.00,'2024-11-01 07:30:00','Low'),(7,7,7,9,33.45,'2024-11-01 08:30:00','High'),(8,8,8,7,8.75,'2024-11-01 09:30:00','Moderate'),(9,9,9,8,28.60,'2024-11-01 10:30:00','Low'),(10,10,10,12,68.90,'2024-11-01 11:30:00','High'),(11,11,11,11,102.30,'2024-11-02 02:30:00','Moderate'),(12,12,12,10,18.50,'2024-11-02 03:30:00','High'),(13,13,13,13,66.80,'2024-11-02 04:30:00','Moderate'),(14,14,14,15,35.60,'2024-11-02 05:30:00','Low'),(15,15,15,14,19.10,'2024-11-02 06:30:00','High'),(16,16,16,16,72.00,'2024-11-02 07:30:00','Moderate'),(17,17,17,17,22.90,'2024-11-02 08:30:00','Low'),(18,18,18,18,11.40,'2024-11-02 09:30:00','High'),(19,19,19,19,49.60,'2024-11-02 10:30:00','Moderate'),(20,20,20,20,86.30,'2024-11-02 11:30:00','Low'),(21,21,21,22,55.10,'2024-11-03 02:30:00','High'),(22,22,22,23,9.80,'2024-11-03 03:30:00','Moderate'),(23,23,23,24,40.60,'2024-11-03 04:30:00','Low'),(24,24,24,25,21.90,'2024-11-03 05:30:00','High'),(25,25,25,26,35.80,'2024-11-03 06:30:00','Moderate'),(26,26,26,27,64.40,'2024-11-03 07:30:00','Low'),(27,27,27,28,30.50,'2024-11-03 08:30:00','High'),(28,28,28,29,58.20,'2024-11-03 09:30:00','Moderate'),(29,29,29,30,47.30,'2024-11-03 10:30:00','Low'),(30,30,30,1,62.10,'2024-11-03 11:30:00','High');
/*!40000 ALTER TABLE `pollutionreading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pollutionsource`
--

DROP TABLE IF EXISTS `pollutionsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pollutionsource` (
  `SourceID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `SourceType` varchar(50) NOT NULL,
  `EmissionType` varchar(50) DEFAULT NULL,
  `Description` text,
  `LocationID` int DEFAULT NULL,
  PRIMARY KEY (`SourceID`),
  UNIQUE KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pollutionsource`
--

LOCK TABLES `pollutionsource` WRITE;
/*!40000 ALTER TABLE `pollutionsource` DISABLE KEYS */;
INSERT INTO `pollutionsource` VALUES (1,'Industrial Factory','PM2.5','Air pollution from manufacturing processes, including dust and smoke',1),(2,'Vehicle Exhaust','NO2','Emissions from automobiles and transport vehicles',2),(3,'Construction Site','PM10','Dust and particulate matter generated by construction activities',3),(4,'Power Plant','CO2','Carbon dioxide emissions from burning fossil fuels for energy',4),(5,'Agricultural Waste','Methane','Methane emissions from burning agricultural waste',5),(6,'Waste Disposal','CO','Carbon monoxide emissions from open burning of waste',6),(7,'Oil Refinery','SO2','Sulfur dioxide emissions from the refining of crude oil',7),(8,'Cement Plant','PM2.5','Airborne particulate matter from cement production processes',8),(9,'Mining Operation','PM10','Dust and particulate matter generated by mining activities',9),(10,'Incineration Plant','NO2','Nitrogen dioxide emissions from waste incineration',10),(11,'Power Plant','SO2','Sulfur dioxide emissions from coal-fired power plants',11),(12,'Wood Burning','CO','Carbon monoxide from burning wood for heating or cooking',12),(13,'Brick Kiln','PM2.5','Particulate emissions from brick production',13),(14,'Steel Plant','CO2','Carbon dioxide emissions from steel manufacturing processes',14),(15,'Textile Mill','PM10','Particulate matter from textile manufacturing',15),(16,'Agricultural Equipment','NO2','Nitrogen oxides emitted by agricultural machinery',16),(17,'Transportation Hub','PM2.5','Air pollution from buses, trucks, and other transport modes',17),(18,'Ship Emissions','SO2','Sulfur dioxide emitted from ship engines',18),(19,'Petrol Station','CO','Carbon monoxide emissions from gasoline vapors',19),(20,'Power Plant','CO2','Carbon dioxide emissions from energy generation plants',20),(21,'Hospital Waste','NO2','Nitrogen dioxide emitted from hospital incinerators',21),(22,'Landfill','Methane','Methane gas emissions from decomposing organic waste',22),(23,'Chemical Plant','SO2','Sulfur dioxide emissions from chemical production',23),(24,'Agricultural Fields','PM10','Dust and particulate emissions from farming practices',24),(25,'Diesel Generator','CO2','Carbon dioxide emissions from diesel-powered generators',25),(26,'Airport','NO2','Nitrogen dioxide from aircraft engines and ground vehicles',26),(27,'Food Processing Plant','CO','Carbon monoxide released during food processing activities',27),(28,'Automobile Assembly','CO2','Carbon dioxide emissions from the assembly of vehicles',28),(29,'Paper Mill','PM2.5','Particulate emissions from paper production',29),(30,'Refuse Collection','CO','Carbon monoxide emissions from waste collection vehicles',30);
/*!40000 ALTER TABLE `pollutionsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weathercondition`
--

DROP TABLE IF EXISTS `weathercondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weathercondition` (
  `ConditionID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `LocationID` int DEFAULT NULL,
  `Temperature` decimal(5,2) DEFAULT NULL,
  `Humidity` decimal(5,2) DEFAULT NULL,
  `WindSpeed` decimal(5,2) DEFAULT NULL,
  `PrecipitationLevel` decimal(5,2) DEFAULT NULL,
  `WindDirection` varchar(50) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL,
  PRIMARY KEY (`ConditionID`),
  UNIQUE KEY `ConditionID` (`ConditionID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weathercondition`
--

LOCK TABLES `weathercondition` WRITE;
/*!40000 ALTER TABLE `weathercondition` DISABLE KEYS */;
INSERT INTO `weathercondition` VALUES (1,1,28.50,65.20,12.30,0.20,'North','2024-11-01 02:30:00'),(2,2,22.10,70.50,15.70,1.50,'South','2024-11-01 02:45:00'),(3,3,30.30,60.10,10.00,0.00,'East','2024-11-01 03:00:00'),(4,4,18.70,72.30,20.50,0.80,'West','2024-11-01 03:15:00'),(5,5,25.40,68.00,14.20,0.50,'North-East','2024-11-01 03:30:00'),(6,6,29.20,64.70,18.10,0.10,'South-East','2024-11-01 03:45:00'),(7,7,20.30,75.00,11.20,1.20,'North-West','2024-11-01 04:00:00'),(8,8,32.80,55.30,9.80,0.00,'South-West','2024-11-01 04:15:00'),(9,9,27.90,66.40,13.00,0.40,'North','2024-11-01 04:30:00'),(10,10,24.50,71.50,16.20,0.70,'South','2024-11-01 04:45:00'),(11,11,26.30,69.00,14.50,1.10,'East','2024-11-01 05:00:00'),(12,12,21.40,74.20,17.60,0.90,'West','2024-11-01 05:15:00'),(13,13,28.00,63.50,12.30,0.30,'North-East','2024-11-01 05:30:00'),(14,14,23.80,72.80,19.00,0.60,'South-East','2024-11-01 05:45:00'),(15,15,19.50,76.40,21.50,1.30,'North-West','2024-11-01 06:00:00'),(16,16,33.10,59.20,10.10,0.00,'South-West','2024-11-01 06:15:00'),(17,17,29.50,62.10,18.00,0.00,'North','2024-11-01 06:30:00'),(18,18,25.20,67.30,15.40,0.20,'South','2024-11-01 06:45:00'),(19,19,31.00,58.70,12.80,0.00,'East','2024-11-01 07:00:00'),(20,20,20.90,74.00,14.60,1.00,'West','2024-11-01 07:15:00'),(21,21,27.60,65.80,13.50,0.50,'North-East','2024-11-01 07:30:00'),(22,22,24.00,70.20,16.10,0.60,'South-East','2024-11-01 07:45:00'),(23,23,28.80,62.50,11.90,0.00,'North-West','2024-11-01 08:00:00'),(24,24,19.20,73.60,22.00,1.40,'South-West','2024-11-01 08:15:00'),(25,25,26.10,68.90,14.40,0.30,'North','2024-11-01 08:30:00'),(26,26,22.40,71.80,17.30,0.90,'South','2024-11-01 08:45:00'),(27,27,30.70,64.20,9.50,0.00,'East','2024-11-01 09:00:00'),(28,28,18.90,75.40,20.20,1.20,'West','2024-11-01 09:15:00'),(29,29,25.90,69.30,13.90,0.40,'North-East','2024-11-01 09:30:00'),(30,30,32.20,57.80,11.70,0.00,'South-West','2024-11-01 09:45:00');
/*!40000 ALTER TABLE `weathercondition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-27 10:26:45
