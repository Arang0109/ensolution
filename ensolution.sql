-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ensolution
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `ceo_name` varchar(50) DEFAULT NULL,
  `biz_number` char(12) NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `biz_number_UNIQUE` (`biz_number`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='- Stores essential details of companies for measurement service management.\n- Stores client company details: ID, name, address, CEO, business number, and registration date.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (2,'현대자동차(주) 울산공장','울산 북구 염포로 700 (양정동)','장재훈','620-86-00010','2024-10-29'),(3,'(주) 넥센','경남 김해시 김해대로 2595 (안동)','강호찬','618-81-15827','2024-10-29'),(4,'에이치디현대미포 주식회사','울산 동구 방어진순환도로 100 (방어동)','신현대','620-81-00900','2024-10-29'),(5,'에이치디현대중공업','울산 동구 방어진순환도로 140 (방어동)','한영석, 이상균','252-87-01412','2024-10-29'),(6,'삼양소재화학(주)','경남 양산시 유산동 462-1','최영재','621-81-54525','2024-10-29'),(7,'(주) 동헌레미콘','부산 강서구 명동길 47 (지사동) 2층','박병철','887-88-01549','2024-10-29'),(42,'(주) 삼비','부산 부산진구 중앙대로 627 (범천동)','현영희','605-81-61214','2024-11-20'),(53,'다모야','부산진구 동평로 291번길 30 (103-403)','강민수','325-17-01564','2024-11-21');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pollutant`
--

DROP TABLE IF EXISTS `pollutant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pollutant` (
  `pollutant_id` int NOT NULL AUTO_INCREMENT,
  `pollutant_name` varchar(50) NOT NULL,
  `pollutant_name_en` varchar(50) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pollutant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pollutant`
--

LOCK TABLES `pollutant` WRITE;
/*!40000 ALTER TABLE `pollutant` DISABLE KEYS */;
INSERT INTO `pollutant` VALUES (17,'먼지','Dust','먼지'),(18,'질소산화물','NOx','현장측정'),(19,'황산화물','SOx','현장측정'),(20,'일산화탄소','CO','현장측정'),(21,'총탄화수소','THC','현장측정'),(22,'이산화탄소','CO2','현장측정'),(23,'염화수소','HCL','흡수액'),(24,'플루오린화합물','HF','흡수액'),(25,'페놀화합물','C6H5OH','흡수액'),(26,'브로민화합물','Br','흡수액'),(27,'황화수소','H2S','흡수액'),(28,'시안화수소','HCN','흡수액'),(29,'이황화탄소','CS2','흡수액'),(30,'암모니아','NH3','흡수액'),(31,'비소화합물','As','흡수액, 중금속'),(32,'납','Pb','중금속'),(33,'카드뮴','Cd','중금속'),(34,'구리','Cu','중금속'),(35,'니켈','Ni','중금속'),(36,'아연','Zn','중금속'),(37,'망간','Mn','중금속'),(38,'철','Fe','중금속'),(39,'알루미늄','Al','중금속'),(40,'베릴륨','Be','중금속'),(41,'트리클로로에틸렌','TCE','흡착관(T)'),(42,'에틸벤젠','EB','흡착관(T)'),(43,'벤젠','B','흡착관(T)'),(44,'스타이렌','SM','흡착관(T)'),(45,'클로로폼','CF','흡착관(T)'),(46,'아크릴로나이트릴','An','흡착관(T)'),(47,'1.2-다이클로로에테인','1.2-DCM','흡착관(T)'),(48,'다이클로로메테인','DCM','흡착관(T)'),(49,'테트라클로로에틸렌','PCE','흡착관(T)'),(50,'톨루엔',NULL,'흡착관(T)'),(51,'자일렌',NULL,'흡착관(T)'),(52,'사염화탄소',NULL,'흡착관(A)'),(53,'1.3-뷰타다이엔',NULL,'흡착관(A)'),(54,'염화바이닐',NULL,'흡착관(A)'),(55,'아세트알데하이드','CH3CHO','카트리지'),(56,'폼알데하이드','HCHO','카트리지'),(57,'아크롤레인',NULL,'카트리지'),(58,'그 외 알데하이드류',NULL,'카트리지'),(59,'수은','Hg','수은'),(60,'크롬','Cr','중금속');
/*!40000 ALTER TABLE `pollutant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `stack_measurement_id` int NOT NULL,
  `measure_date` date DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_id`),
  KEY `fk_stack_measurement_id_idx` (`stack_measurement_id`),
  KEY `fk_team_id_idx` (`team_id`),
  CONSTRAINT `fk_stack_measurement_id` FOREIGN KEY (`stack_measurement_id`) REFERENCES `stack_measurement` (`stack_measurement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack`
--

DROP TABLE IF EXISTS `stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stack` (
  `stack_id` int NOT NULL AUTO_INCREMENT,
  `workplace_id` int NOT NULL,
  `stack_name` varchar(50) NOT NULL,
  `prevention` varchar(100) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `note` longtext,
  PRIMARY KEY (`stack_id`),
  KEY `fk_stack_workplace_id_idx` (`workplace_id`),
  CONSTRAINT `fk_stack_workplace_id` FOREIGN KEY (`workplace_id`) REFERENCES `workplace` (`workplace_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack`
--

LOCK TABLES `stack` WRITE;
/*!40000 ALTER TABLE `stack` DISABLE KEYS */;
INSERT INTO `stack` VALUES (5,2,'계량시설 1m3',NULL,'2024-11-20',NULL),(6,2,'계량시설 2m3',NULL,'2024-11-20',NULL),(7,2,'저장시설 500m3 #1',NULL,'2024-11-20',NULL),(8,2,'저장시설 500m3 #2',NULL,'2024-11-20',NULL),(9,2,'저장시설 500m3, 혼합시설 3m3 #3',NULL,'2024-11-20',NULL),(10,2,'저장시설 500m3, 혼합시설 3m3 #4',NULL,'2024-11-20',NULL),(11,3,'가황시설1-몰딩',NULL,'2024-11-20',NULL),(12,3,'가황시설2-압출',NULL,'2024-11-20',NULL),(13,10,'stack 525','세정집진시설(700 m3/분)','2024-11-20',NULL),(14,10,'stack 526','세정집진시설(700 m3/분)','2024-11-20',NULL),(15,10,'stack 527','세정집진시설(1500 m3/분)','2024-11-20',NULL),(16,10,'stack 528','세정집진시설(1200 m3/분)','2024-11-20',NULL),(17,10,'stack 530','여과집진시설(50m3/분)','2024-11-20',NULL),(18,10,'stack 571','세정집진시설(1200 m3/분)','2024-11-20',NULL),(19,10,'stack 572','세정집진시설(550 m3/분)','2024-11-20',NULL),(20,10,'stack 573','세정집진시설(550 m3/분)','2024-11-20',NULL),(21,10,'stack 603','여과집진시설(1000m3/분)','2024-11-20',NULL),(22,10,'stack 604','여과집진시설(1100m3/분)','2024-11-20',NULL),(23,10,'stack 606','방지시설설치의무면제','2024-11-20',NULL),(24,10,'stack 615','세정집진시설(700 m3/분)','2024-11-20',NULL),(25,10,'stack 616','세정집진시설(1200 m3/분)','2024-11-20',NULL),(26,10,'stack 617','세정집진시설(2000 m3/분)','2024-11-20',NULL),(27,10,'stack 620','세정집진시설(750 m3/분)','2024-11-20',NULL),(28,10,'stack 672','세정집진시설(650 m3/분)','2024-11-20',NULL),(29,10,'stack 889','흡착에의한시설(300m3/분)','2024-11-20',NULL),(33,9,'1ton 보일러(49-1)',NULL,'2024-11-20',NULL),(34,9,'3ton 보일러(50-1)',NULL,'2024-11-20',NULL),(35,9,'3ton 보일러(51-1)',NULL,'2024-11-20',NULL),(36,9,'6ton, 8ton 보일러(52-1, 53-1)',NULL,'2024-11-20',NULL),(37,9,'가황시설(33)',NULL,'2024-11-20',NULL),(38,9,'가황시설(35)',NULL,'2024-11-20',NULL),(39,9,'가황시설(36)',NULL,'2024-11-20',NULL),(40,9,'가황시설(42)',NULL,'2024-11-20',NULL),(41,9,'가황시설(43)',NULL,'2024-11-20',NULL),(42,9,'가황시설(48)',NULL,'2024-11-20',NULL),(43,9,'가황시설(프레스성형)(58)',NULL,'2024-11-20',NULL),(44,9,'건조+도장시설(47)',NULL,'2024-11-20',NULL),(45,9,'건조+접착시설(41)',NULL,'2024-11-20',NULL),(46,9,'건조시설(2-1)',NULL,'2024-11-20',NULL),(47,9,'건조시설(2-2)',NULL,'2024-11-20',NULL),(48,9,'건조시설(29)',NULL,'2024-11-20',NULL),(49,9,'도장시설(34)',NULL,'2024-11-20',NULL),(50,9,'도장시설(55)',NULL,'2024-11-20',NULL),(51,9,'도장시설(56)',NULL,'2024-11-20',NULL),(52,9,'도포시설(54)',NULL,'2024-11-20',NULL),(53,9,'성형시설(32)',NULL,'2024-11-20',NULL),(54,9,'성형시설(46)',NULL,'2024-11-20',NULL),(55,9,'탈사시설(30)',NULL,'2024-11-20',NULL),(56,9,'혼합+성형시설(57)',NULL,'2024-11-20',NULL),(57,9,'혼합시설(10)',NULL,'2024-11-20',NULL),(58,9,'혼합시설(11-1)',NULL,'2024-11-20',NULL),(59,9,'혼합시설(11-2)',NULL,'2024-11-20',NULL),(60,9,'혼합시설(11-3)',NULL,'2024-11-20',NULL),(61,9,'혼합시설(16)',NULL,'2024-11-20',NULL),(62,9,'혼합시설(17)',NULL,'2024-11-20',NULL),(63,9,'혼합시설(18)',NULL,'2024-11-20',NULL),(64,9,'혼합시설(28)',NULL,'2024-11-20',NULL),(65,9,'혼합시설(31)',NULL,'2024-11-20',NULL),(66,4,'소각시설 2호기 촉매반응을 이용한 시설 후단',NULL,'2024-11-20',NULL),(67,4,'소각시설 2호기 흡수에 의한 시설',NULL,'2024-11-20',NULL),(68,4,'소각시설 2호기 흡수에 의한 시설 전단',NULL,'2024-11-20',NULL),(69,4,'소각시설 2호기 흡수에 의한 시설 후단',NULL,'2024-11-20',NULL),(70,4,'소각로 1호기 전기집진시설',NULL,'2024-11-20',NULL),(71,4,'소각로 1호기 흡수에 의한 시설',NULL,'2024-11-20',NULL),(72,4,'소각시설 1호기',NULL,'2024-11-20',NULL),(73,4,'소각시설 1호기 전기집진시설 전단',NULL,'2024-11-20',NULL),(74,4,'소각시설 1호기 전기집진시설 후단',NULL,'2024-11-20',NULL),(75,4,'소각시설 1호기 촉매반응을 이용한 시설',NULL,'2024-11-20',NULL),(76,4,'소각시설 1호기 촉매반응을 이용한 시설 전단',NULL,'2024-11-20',NULL),(77,4,'소각시설 1호기 촉매반응을 이용한 시설 후단',NULL,'2024-11-20',NULL),(78,4,'소각시설 1호기 흡수에 의한 시설 전단',NULL,'2024-11-20',NULL),(79,4,'소각시설 1호기 흡수에 의한 시설 후단',NULL,'2024-11-20',NULL),(80,4,'소각시설 2호기',NULL,'2024-11-20',NULL),(81,4,'소각시설 2호기 전기집진시설',NULL,'2024-11-20',NULL),(82,4,'소각시설 2호기 전기집진시설 전단',NULL,'2024-11-20',NULL),(83,4,'소각시설 2호기 전기집진시설 후단',NULL,'2024-11-20',NULL),(84,4,'소각시설 2호기 촉매반응을 이용한 시설',NULL,'2024-11-20',NULL),(85,4,'소각시설 2호기 촉매반응을 이용한 시설 전단',NULL,'2024-11-20',NULL),(86,5,'1현사 보일러',NULL,'2024-11-20',NULL),(87,5,'1현사 식당 보일러 시설',NULL,'2024-11-20',NULL),(88,5,'2현사 보일러 시설',NULL,'2024-11-20',NULL),(89,5,'3현사 보일러 시설',NULL,'2024-11-20',NULL),(90,5,'5현사 보일러 시설1',NULL,'2024-11-20',NULL),(91,5,'5현사 보일러 시설2',NULL,'2024-11-20',NULL),(92,5,'6현사 보일러 시설1',NULL,'2024-11-20',NULL),(93,5,'6현사 보일러 시설2',NULL,'2024-11-20',NULL),(94,5,'9현사 보일러',NULL,'2024-11-20',NULL),(95,5,'B1,2 탈청시설(4100)',NULL,'2024-11-20',NULL),(96,5,'B1 선별시설',NULL,'2024-11-20',NULL),(97,5,'B1 탈청시설(1100)',NULL,'2024-11-20',NULL),(98,5,'B2 선별시설',NULL,'2024-11-20',NULL),(99,5,'B2 탈청시설',NULL,'2024-11-20',NULL),(100,5,'B3 선별시설',NULL,'2024-11-20',NULL),(101,5,'B3 탈청시설',NULL,'2024-11-20',NULL),(102,5,'B4 선별시설',NULL,'2024-11-20',NULL),(103,5,'B4 탈청시설',NULL,'2024-11-20',NULL),(104,5,'B5,6 선별시설 (재순환시설)',NULL,'2024-11-20',NULL),(105,5,'B5 탈청시설',NULL,'2024-11-20',NULL),(115,15,'#1 저장시설500t','','2024-11-20',NULL),(116,15,'#2 혼합시설3.5㎥(1)','','2024-11-20',NULL),(117,15,'#3 혼합시설3.5㎥(2)','','2024-11-20',NULL),(118,16,'흡수식냉온수기 #1 (320RT)','','2024-11-20',NULL),(119,16,'흡수식냉온수기 #2 (240RT)','','2024-11-20',NULL),(120,16,'보일러','','2024-11-20',NULL),(139,30,'복도','공기청정기','2024-11-21',NULL);
/*!40000 ALTER TABLE `stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack_info`
--

DROP TABLE IF EXISTS `stack_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stack_info` (
  `stack_info_id` int NOT NULL,
  `diameter` double DEFAULT NULL,
  `dynamic_pressure` double DEFAULT NULL,
  `static_pressure` double DEFAULT NULL,
  `velocity_speed` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  KEY `fk_stack_info_stack_id` (`stack_info_id`),
  CONSTRAINT `fk_stack_info_stack_id` FOREIGN KEY (`stack_info_id`) REFERENCES `stack` (`stack_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_info`
--

LOCK TABLES `stack_info` WRITE;
/*!40000 ALTER TABLE `stack_info` DISABLE KEYS */;
INSERT INTO `stack_info` VALUES (13,30.1,4.1,-20.1,2.1,255.71,42.1),(5,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,NULL,NULL,NULL,NULL,NULL),(27,NULL,NULL,NULL,NULL,NULL,NULL),(28,NULL,NULL,NULL,NULL,NULL,NULL),(29,NULL,NULL,NULL,NULL,NULL,NULL),(33,NULL,NULL,NULL,NULL,NULL,NULL),(34,NULL,NULL,NULL,NULL,NULL,NULL),(35,NULL,NULL,NULL,NULL,NULL,NULL),(36,NULL,NULL,NULL,NULL,NULL,NULL),(37,NULL,NULL,NULL,NULL,NULL,NULL),(38,NULL,NULL,NULL,NULL,NULL,NULL),(39,NULL,NULL,NULL,NULL,NULL,NULL),(40,NULL,NULL,NULL,NULL,NULL,NULL),(41,NULL,NULL,NULL,NULL,NULL,NULL),(42,NULL,NULL,NULL,NULL,NULL,NULL),(43,NULL,NULL,NULL,NULL,NULL,NULL),(44,NULL,NULL,NULL,NULL,NULL,NULL),(45,NULL,NULL,NULL,NULL,NULL,NULL),(46,NULL,NULL,NULL,NULL,NULL,NULL),(47,NULL,NULL,NULL,NULL,NULL,NULL),(48,NULL,NULL,NULL,NULL,NULL,NULL),(49,NULL,NULL,NULL,NULL,NULL,NULL),(50,NULL,NULL,NULL,NULL,NULL,NULL),(51,NULL,NULL,NULL,NULL,NULL,NULL),(52,NULL,NULL,NULL,NULL,NULL,NULL),(53,NULL,NULL,NULL,NULL,NULL,NULL),(54,NULL,NULL,NULL,NULL,NULL,NULL),(55,NULL,NULL,NULL,NULL,NULL,NULL),(56,NULL,NULL,NULL,NULL,NULL,NULL),(57,NULL,NULL,NULL,NULL,NULL,NULL),(58,NULL,NULL,NULL,NULL,NULL,NULL),(59,NULL,NULL,NULL,NULL,NULL,NULL),(60,NULL,NULL,NULL,NULL,NULL,NULL),(61,NULL,NULL,NULL,NULL,NULL,NULL),(62,NULL,NULL,NULL,NULL,NULL,NULL),(63,NULL,NULL,NULL,NULL,NULL,NULL),(64,NULL,NULL,NULL,NULL,NULL,NULL),(65,NULL,NULL,NULL,NULL,NULL,NULL),(66,NULL,NULL,NULL,NULL,NULL,NULL),(67,NULL,NULL,NULL,NULL,NULL,NULL),(68,NULL,NULL,NULL,NULL,NULL,NULL),(69,NULL,NULL,NULL,NULL,NULL,NULL),(70,NULL,NULL,NULL,NULL,NULL,NULL),(71,NULL,NULL,NULL,NULL,NULL,NULL),(72,NULL,NULL,NULL,NULL,NULL,NULL),(73,NULL,NULL,NULL,NULL,NULL,NULL),(74,NULL,NULL,NULL,NULL,NULL,NULL),(75,NULL,NULL,NULL,NULL,NULL,NULL),(76,NULL,NULL,NULL,NULL,NULL,NULL),(77,NULL,NULL,NULL,NULL,NULL,NULL),(78,NULL,NULL,NULL,NULL,NULL,NULL),(79,NULL,NULL,NULL,NULL,NULL,NULL),(80,NULL,NULL,NULL,NULL,NULL,NULL),(81,NULL,NULL,NULL,NULL,NULL,NULL),(82,NULL,NULL,NULL,NULL,NULL,NULL),(83,NULL,NULL,NULL,NULL,NULL,NULL),(84,NULL,NULL,NULL,NULL,NULL,NULL),(85,NULL,NULL,NULL,NULL,NULL,NULL),(86,NULL,NULL,NULL,NULL,NULL,NULL),(87,NULL,NULL,NULL,NULL,NULL,NULL),(88,NULL,NULL,NULL,NULL,NULL,NULL),(89,NULL,NULL,NULL,NULL,NULL,NULL),(90,NULL,NULL,NULL,NULL,NULL,NULL),(91,NULL,NULL,NULL,NULL,NULL,NULL),(92,NULL,NULL,NULL,NULL,NULL,NULL),(93,NULL,NULL,NULL,NULL,NULL,NULL),(94,NULL,NULL,NULL,NULL,NULL,NULL),(95,NULL,NULL,NULL,NULL,NULL,NULL),(96,NULL,NULL,NULL,NULL,NULL,NULL),(97,NULL,NULL,NULL,NULL,NULL,NULL),(98,NULL,NULL,NULL,NULL,NULL,NULL),(99,NULL,NULL,NULL,NULL,NULL,NULL),(100,NULL,NULL,NULL,NULL,NULL,NULL),(101,NULL,NULL,NULL,NULL,NULL,NULL),(102,NULL,NULL,NULL,NULL,NULL,NULL),(103,NULL,NULL,NULL,NULL,NULL,NULL),(104,NULL,NULL,NULL,NULL,NULL,NULL),(105,NULL,NULL,NULL,NULL,NULL,NULL),(115,NULL,NULL,NULL,NULL,NULL,NULL),(116,NULL,NULL,NULL,NULL,NULL,NULL),(117,NULL,NULL,NULL,NULL,NULL,NULL),(118,NULL,NULL,NULL,NULL,NULL,NULL),(119,NULL,NULL,NULL,NULL,NULL,NULL),(120,NULL,NULL,NULL,NULL,NULL,NULL),(139,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stack_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack_measurement`
--

DROP TABLE IF EXISTS `stack_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stack_measurement` (
  `stack_measurement_id` int NOT NULL AUTO_INCREMENT,
  `stack_id` int NOT NULL,
  `pollutant_id` int NOT NULL,
  `cycle_type` enum('monthly','twiceamonth','onceinfebruary','quarterly','semiannual','annual') NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stack_measurement_id`),
  KEY `fk_stack_id_idx` (`stack_id`),
  KEY `fk_pollutant_id_idx` (`pollutant_id`),
  CONSTRAINT `fk_pollutant_id` FOREIGN KEY (`pollutant_id`) REFERENCES `pollutant` (`pollutant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stack_id` FOREIGN KEY (`stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_measurement`
--

LOCK TABLES `stack_measurement` WRITE;
/*!40000 ALTER TABLE `stack_measurement` DISABLE KEYS */;
INSERT INTO `stack_measurement` VALUES (3,13,19,'semiannual',0),(4,13,17,'semiannual',0),(5,13,23,'monthly',0),(6,13,18,'semiannual',0),(7,13,56,'monthly',0),(8,13,24,'monthly',0),(9,13,36,'semiannual',0),(10,13,34,'semiannual',0),(11,14,19,'semiannual',0),(12,14,17,'semiannual',0),(13,14,23,'monthly',0),(14,14,18,'semiannual',0),(15,14,56,'monthly',0),(16,14,24,'monthly',0),(17,14,36,'semiannual',0),(18,14,34,'semiannual',0),(19,15,17,'semiannual',0),(20,15,56,'monthly',0),(21,15,25,'monthly',0),(22,15,30,'semiannual',0),(23,16,17,'quarterly',0),(24,16,56,'semiannual',0),(25,16,25,'semiannual',0),(26,16,30,'semiannual',0),(27,17,30,'semiannual',0),(28,18,17,'quarterly',0),(29,18,56,'semiannual',0),(30,18,25,'semiannual',0),(31,18,30,'semiannual',0),(32,19,19,'semiannual',0),(33,19,17,'semiannual',0),(34,19,23,'monthly',0),(35,19,18,'semiannual',0),(36,19,56,'monthly',0),(37,19,24,'monthly',0),(38,19,36,'semiannual',0),(39,19,34,'semiannual',0),(40,20,19,'semiannual',0),(41,20,17,'semiannual',0),(42,20,23,'monthly',0),(44,20,18,'semiannual',0),(45,20,56,'monthly',0),(46,20,24,'monthly',0),(47,20,36,'semiannual',0),(48,20,34,'semiannual',0),(49,21,17,'semiannual',0),(50,21,23,'monthly',0),(51,21,56,'monthly',0),(52,21,24,'monthly',0),(53,22,17,'semiannual',0),(54,22,23,'monthly',0),(55,22,56,'monthly',0),(56,22,24,'monthly',0),(57,22,36,'semiannual',0),(58,23,17,'annual',0),(59,24,19,'semiannual',0),(60,24,17,'semiannual',0),(61,24,23,'monthly',0),(62,24,18,'semiannual',0),(63,24,56,'monthly',0),(64,24,24,'monthly',0),(65,24,36,'semiannual',0),(66,24,34,'semiannual',0),(67,25,17,'quarterly',0),(68,25,56,'monthly',0),(69,25,25,'monthly',0),(70,25,30,'quarterly',0),(80,26,17,'semiannual',0),(81,26,56,'monthly',0),(82,26,43,'monthly',0),(83,26,25,'monthly',0),(84,26,36,'semiannual',0),(85,26,34,'semiannual',0),(86,26,30,'semiannual',0),(87,26,35,'monthly',0),(88,26,32,'monthly',0),(89,27,19,'semiannual',0),(90,27,17,'quarterly',0),(91,27,23,'monthly',0),(92,27,18,'quarterly',0),(93,27,56,'monthly',0),(94,27,24,'monthly',0),(95,27,36,'quarterly',0),(96,27,34,'quarterly',0),(97,27,60,'monthly',0),(98,28,17,'semiannual',0),(99,29,17,'semiannual',0),(100,29,56,'semiannual',0),(101,29,21,'semiannual',0),(102,29,42,'monthly',0),(103,29,44,'monthly',0),(104,11,17,'semiannual',0),(105,11,21,'semiannual',0),(106,12,17,'semiannual',0),(107,12,21,'semiannual',0),(108,5,17,'annual',0),(109,6,17,'annual',0),(110,7,17,'semiannual',0),(111,8,17,'semiannual',0),(112,9,17,'semiannual',0),(113,10,17,'semiannual',0),(114,115,17,'semiannual',0),(115,116,17,'semiannual',0),(116,117,17,'semiannual',0),(117,120,17,'annual',0),(118,120,19,'annual',0),(119,120,18,'semiannual',0),(120,118,17,'annual',0),(121,118,19,'annual',0),(122,118,18,'semiannual',0),(123,119,17,'annual',0),(124,119,19,'annual',0),(125,119,18,'semiannual',0);
/*!40000 ALTER TABLE `stack_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(10) NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'1팀'),(2,'2팀'),(3,'3팀'),(4,'4팀');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplace`
--

DROP TABLE IF EXISTS `workplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workplace` (
  `workplace_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `workplace_name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`workplace_id`),
  KEY `fk_workplace_company_id_idx` (`company_id`),
  CONSTRAINT `fk_workplace_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplace`
--

LOCK TABLES `workplace` WRITE;
/*!40000 ALTER TABLE `workplace` DISABLE KEYS */;
INSERT INTO `workplace` VALUES (2,7,'(주)동헌레미콘 양산2공장','부산 강서구 명동길 47 (지사동) 2층','2024-10-29'),(3,6,'삼양소재화학(주)','경남 양산시 유산동 462-1','2024-10-29'),(4,5,'에이치디현대중공업','울산 동구 방어진순환도로 140 (방어동)','2024-10-29'),(5,4,'(주) 현대미포조선','울산 동구 방어진순환도로 100 (방어동)','2024-10-29'),(6,4,'(주) 현대미포조선 용연공장','울산 남구 처용로 800 (황성동)','2024-10-29'),(7,4,'(주) 현대미포조선 모화공장','경북 경주시 외동읍 문산리 804-3 ','2024-10-29'),(8,4,'(주) 현대미포조선 온산공장','울산 울주군 온산읍 산암로 487','2024-10-29'),(9,3,'(주) 넥센','경남 김해시 김해대로 2595 (안동)','2024-10-29'),(10,2,'현대자동차(주) 울산공장','울산 북구 염포로 700 (양정동)','2024-10-29'),(15,7,'(주)동헌레미콘','부산 강서구 명동길 47 (지사동) 2층','2024-11-20'),(16,42,'(주) 삼비','부산 부산진구 중앙대로 627 (범천동)','2024-11-20'),(30,53,'다모야 부산지점','부산진구 동평로 291번길 30 (103-403)','2024-11-21');
/*!40000 ALTER TABLE `workplace` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 22:45:52
