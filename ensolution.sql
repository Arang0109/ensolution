CREATE DATABASE  IF NOT EXISTS `ensolution` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ensolution`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ensolution
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COMMENT='- Stores essential details of companies for measurement service management.\n- Stores client company details: ID, name, address, CEO, business number, and registration date.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (2,'현대자동차(주) 울산공장','울산 북구 염포로 700 (양정동)','장재훈','620-86-00010','2024-10-29'),(3,'(주) 넥센','경남 김해시 김해대로 2595 (안동)','강호찬','618-81-15827','2024-10-29'),(4,'에이치디현대미포 주식회사','울산 동구 방어진순환도로 100 (방어동)','신현대','620-81-00900','2024-10-29'),(5,'에이치디현대중공업','울산 동구 방어진순환도로 140 (방어동)','한영석, 이상균','252-87-01412','2024-10-29'),(6,'삼양소재화학(주)','경남 양산시 유산동 462-1','최영재','621-81-54525','2024-10-29'),(7,'(주) 동헌레미콘','부산 강서구 명동길 47 (지사동) 2층','박병철','887-88-01549','2024-10-29'),(42,'(주) 삼비','부산 부산진구 중앙대로 627 (범천동)','현영희','605-81-61214','2024-11-20'),(53,'다모야','부산진구 동평로 291번길 30 (103-403)','강민수','325-17-01564','2024-11-21'),(54,'에쓰-오일 주식회사','서울 마포구 백범로 192 (공덕동)','안와르 에이알 히즈아지','116-81-36743','2024-12-03');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factory` (
  `factory_id` int NOT NULL AUTO_INCREMENT,
  `workplace_id` int DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`factory_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_factory_workplace_id_idx` (`workplace_id`),
  CONSTRAINT `fk_factory_workplace_id` FOREIGN KEY (`workplace_id`) REFERENCES `workplace` (`workplace_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
INSERT INTO `factory` VALUES (1,10,'3공장'),(2,10,'4공장'),(3,10,'소재공장');
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_department`
--

DROP TABLE IF EXISTS `management_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_department` (
  `management_department_id` int NOT NULL AUTO_INCREMENT,
  `workplace_id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `tel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`management_department_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_md_workplace_id_idx` (`workplace_id`),
  CONSTRAINT `fk_md_workplace_id` FOREIGN KEY (`workplace_id`) REFERENCES `workplace` (`workplace_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_department`
--

LOCK TABLES `management_department` WRITE;
/*!40000 ALTER TABLE `management_department` DISABLE KEYS */;
INSERT INTO `management_department` VALUES (9,10,'도장 3부',NULL),(10,10,'의장 32부',NULL),(11,10,'도장 4부',NULL),(12,10,'의장 31부',NULL),(13,10,'도장 31부',NULL),(14,10,'도장 32부',NULL),(15,10,'소재설비관리부',NULL),(16,10,'의장 42부',NULL),(17,10,'의장 41부',NULL),(19,10,'생산관리 4부',NULL);
/*!40000 ALTER TABLE `management_department` ENABLE KEYS */;
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
  PRIMARY KEY (`pollutant_id`),
  UNIQUE KEY `pollutant_name_UNIQUE` (`pollutant_name`),
  UNIQUE KEY `pollutant_name_en_UNIQUE` (`pollutant_name_en`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (245,2,435,'2024-12-11',1),(246,2,440,'2024-12-11',1),(251,4,438,'2024-12-12',1);
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
  `sub_factory_id` int DEFAULT NULL,
  `management_department_id` int DEFAULT NULL,
  PRIMARY KEY (`stack_id`),
  KEY `fk_stack_workplace_id_idx` (`workplace_id`),
  KEY `fk_stack_md_id_idx` (`management_department_id`),
  KEY `fk_stack_sub_factory_id_idx` (`sub_factory_id`),
  CONSTRAINT `fk_stack_md_id` FOREIGN KEY (`management_department_id`) REFERENCES `management_department` (`management_department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stack_sub_factory_id` FOREIGN KEY (`sub_factory_id`) REFERENCES `sub_factory` (`sub_factory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stack_workplace_id` FOREIGN KEY (`workplace_id`) REFERENCES `workplace` (`workplace_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack`
--

LOCK TABLES `stack` WRITE;
/*!40000 ALTER TABLE `stack` DISABLE KEYS */;
INSERT INTO `stack` VALUES (5,2,'계량시설 1m3',NULL,'2024-11-20','12월 13일 전까지 측정해야함',NULL,NULL),(6,2,'계량시설 2m3',NULL,'2024-11-20',NULL,NULL,NULL),(7,2,'저장시설 500m3 #1',NULL,'2024-11-20',NULL,NULL,NULL),(8,2,'저장시설 500m3 #2',NULL,'2024-11-20',NULL,NULL,NULL),(9,2,'저장시설 500m3, 혼합시설 3m3 #3',NULL,'2024-11-20',NULL,NULL,NULL),(10,2,'저장시설 500m3, 혼합시설 3m3 #4',NULL,'2024-11-20',NULL,NULL,NULL),(11,3,'가황시설1-몰딩',NULL,'2024-11-20',NULL,NULL,NULL),(12,3,'가황시설2-압출',NULL,'2024-11-20',NULL,NULL,NULL),(33,9,'1ton 보일러(49-1)',NULL,'2024-11-20',NULL,NULL,NULL),(34,9,'3ton 보일러(50-1)',NULL,'2024-11-20',NULL,NULL,NULL),(35,9,'3ton 보일러(51-1)',NULL,'2024-11-20',NULL,NULL,NULL),(36,9,'6ton, 8ton 보일러(52-1, 53-1)',NULL,'2024-11-20',NULL,NULL,NULL),(37,9,'가황시설(33)',NULL,'2024-11-20',NULL,NULL,NULL),(38,9,'가황시설(35)',NULL,'2024-11-20',NULL,NULL,NULL),(39,9,'가황시설(36)',NULL,'2024-11-20',NULL,NULL,NULL),(40,9,'가황시설(42)',NULL,'2024-11-20',NULL,NULL,NULL),(41,9,'가황시설(43)',NULL,'2024-11-20',NULL,NULL,NULL),(42,9,'가황시설(48)',NULL,'2024-11-20',NULL,NULL,NULL),(43,9,'가황시설(프레스성형)(58)',NULL,'2024-11-20',NULL,NULL,NULL),(44,9,'건조+도장시설(47)',NULL,'2024-11-20',NULL,NULL,NULL),(45,9,'건조+접착시설(41)',NULL,'2024-11-20',NULL,NULL,NULL),(46,9,'건조시설(2-1)',NULL,'2024-11-20',NULL,NULL,NULL),(47,9,'건조시설(2-2)',NULL,'2024-11-20',NULL,NULL,NULL),(48,9,'건조시설(29)',NULL,'2024-11-20',NULL,NULL,NULL),(49,9,'도장시설(34)',NULL,'2024-11-20',NULL,NULL,NULL),(50,9,'도장시설(55)',NULL,'2024-11-20',NULL,NULL,NULL),(51,9,'도장시설(56)',NULL,'2024-11-20',NULL,NULL,NULL),(52,9,'도포시설(54)',NULL,'2024-11-20',NULL,NULL,NULL),(53,9,'성형시설(32)',NULL,'2024-11-20',NULL,NULL,NULL),(54,9,'성형시설(46)',NULL,'2024-11-20',NULL,NULL,NULL),(55,9,'탈사시설(30)',NULL,'2024-11-20',NULL,NULL,NULL),(56,9,'혼합+성형시설(57)',NULL,'2024-11-20',NULL,NULL,NULL),(57,9,'혼합시설(10)',NULL,'2024-11-20',NULL,NULL,NULL),(58,9,'혼합시설(11-1)',NULL,'2024-11-20',NULL,NULL,NULL),(59,9,'혼합시설(11-2)',NULL,'2024-11-20',NULL,NULL,NULL),(60,9,'혼합시설(11-3)',NULL,'2024-11-20',NULL,NULL,NULL),(61,9,'혼합시설(16)',NULL,'2024-11-20',NULL,NULL,NULL),(62,9,'혼합시설(17)',NULL,'2024-11-20',NULL,NULL,NULL),(63,9,'혼합시설(18)',NULL,'2024-11-20',NULL,NULL,NULL),(64,9,'혼합시설(28)',NULL,'2024-11-20',NULL,NULL,NULL),(65,9,'혼합시설(31)',NULL,'2024-11-20',NULL,NULL,NULL),(66,4,'소각시설 2호기 촉매반응을 이용한 시설 후단',NULL,'2024-11-20',NULL,NULL,NULL),(67,4,'소각시설 2호기 흡수에 의한 시설',NULL,'2024-11-20',NULL,NULL,NULL),(68,4,'소각시설 2호기 흡수에 의한 시설 전단',NULL,'2024-11-20',NULL,NULL,NULL),(69,4,'소각시설 2호기 흡수에 의한 시설 후단',NULL,'2024-11-20',NULL,NULL,NULL),(70,4,'소각로 1호기 전기집진시설',NULL,'2024-11-20',NULL,NULL,NULL),(71,4,'소각로 1호기 흡수에 의한 시설',NULL,'2024-11-20',NULL,NULL,NULL),(72,4,'소각시설 1호기',NULL,'2024-11-20',NULL,NULL,NULL),(73,4,'소각시설 1호기 전기집진시설 전단',NULL,'2024-11-20',NULL,NULL,NULL),(74,4,'소각시설 1호기 전기집진시설 후단',NULL,'2024-11-20',NULL,NULL,NULL),(75,4,'소각시설 1호기 촉매반응을 이용한 시설',NULL,'2024-11-20',NULL,NULL,NULL),(76,4,'소각시설 1호기 촉매반응을 이용한 시설 전단',NULL,'2024-11-20',NULL,NULL,NULL),(77,4,'소각시설 1호기 촉매반응을 이용한 시설 후단',NULL,'2024-11-20',NULL,NULL,NULL),(78,4,'소각시설 1호기 흡수에 의한 시설 전단',NULL,'2024-11-20',NULL,NULL,NULL),(79,4,'소각시설 1호기 흡수에 의한 시설 후단',NULL,'2024-11-20',NULL,NULL,NULL),(80,4,'소각시설 2호기',NULL,'2024-11-20',NULL,NULL,NULL),(81,4,'소각시설 2호기 전기집진시설',NULL,'2024-11-20',NULL,NULL,NULL),(82,4,'소각시설 2호기 전기집진시설 전단',NULL,'2024-11-20',NULL,NULL,NULL),(83,4,'소각시설 2호기 전기집진시설 후단',NULL,'2024-11-20',NULL,NULL,NULL),(84,4,'소각시설 2호기 촉매반응을 이용한 시설',NULL,'2024-11-20',NULL,NULL,NULL),(85,4,'소각시설 2호기 촉매반응을 이용한 시설 전단',NULL,'2024-11-20',NULL,NULL,NULL),(86,5,'1현사 보일러',NULL,'2024-11-20',NULL,NULL,NULL),(87,5,'1현사 식당 보일러 시설',NULL,'2024-11-20',NULL,NULL,NULL),(88,5,'2현사 보일러 시설',NULL,'2024-11-20',NULL,NULL,NULL),(89,5,'3현사 보일러 시설',NULL,'2024-11-20',NULL,NULL,NULL),(90,5,'5현사 보일러 시설1',NULL,'2024-11-20',NULL,NULL,NULL),(91,5,'5현사 보일러 시설2',NULL,'2024-11-20',NULL,NULL,NULL),(92,5,'6현사 보일러 시설1',NULL,'2024-11-20',NULL,NULL,NULL),(93,5,'6현사 보일러 시설2',NULL,'2024-11-20',NULL,NULL,NULL),(94,5,'9현사 보일러',NULL,'2024-11-20',NULL,NULL,NULL),(95,5,'B1,2 탈청시설(4100)',NULL,'2024-11-20',NULL,NULL,NULL),(96,5,'B1 선별시설',NULL,'2024-11-20',NULL,NULL,NULL),(97,5,'B1 탈청시설(1100)',NULL,'2024-11-20',NULL,NULL,NULL),(98,5,'B2 선별시설',NULL,'2024-11-20',NULL,NULL,NULL),(99,5,'B2 탈청시설',NULL,'2024-11-20',NULL,NULL,NULL),(100,5,'B3 선별시설',NULL,'2024-11-20',NULL,NULL,NULL),(101,5,'B3 탈청시설',NULL,'2024-11-20',NULL,NULL,NULL),(102,5,'B4 선별시설',NULL,'2024-11-20',NULL,NULL,NULL),(103,5,'B4 탈청시설',NULL,'2024-11-20',NULL,NULL,NULL),(104,5,'B5,6 선별시설 (재순환시설)',NULL,'2024-11-20',NULL,NULL,NULL),(105,5,'B5 탈청시설',NULL,'2024-11-20',NULL,NULL,NULL),(115,15,'#1 저장시설500t','','2024-11-20',NULL,NULL,NULL),(116,15,'#2 혼합시설3.5㎥(1)','','2024-11-20',NULL,NULL,NULL),(117,15,'#3 혼합시설3.5㎥(2)','','2024-11-20',NULL,NULL,NULL),(118,16,'흡수식냉온수기 #1 (320RT)','','2024-11-20',NULL,NULL,NULL),(119,16,'흡수식냉온수기 #2 (240RT)','','2024-11-20',NULL,NULL,NULL),(120,16,'보일러','','2024-11-20',NULL,NULL,NULL),(140,31,'SG-7941A/B','촉매반응을 이용한 시설','2024-12-03',NULL,NULL,NULL),(141,31,'SG-43401A/B','촉매반응을 이용한 시설','2024-12-03',NULL,NULL,NULL),(142,31,'X-104401','촉매반응을 이용한 시설','2024-12-03',NULL,NULL,NULL),(143,31,'ST-6601','연소조절에 의한 시설','2024-12-03','노란색 굴뚝 수직 40M 사다리',NULL,NULL),(144,31,'H-11101','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(145,31,'H-11301','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(146,31,'H-11302','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(147,31,'H-16101','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(148,31,'H-16301/2','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(149,31,'H-16601','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(150,31,'H-30201/2/3/4','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(151,31,'H-30621','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(152,31,'H-30601','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(153,31,'H-30602','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(154,31,'H-30301/2','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(155,31,'H-50101/2','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(156,31,'H1-101101','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(157,31,'H-101102','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(158,31,'H2-101101','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(159,31,'H-30401','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(160,31,'H-31102','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(161,31,'H-31301','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(162,31,'H-20101/01/A/02','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(163,31,'H-21102','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(165,31,'H-51102','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(166,31,'H-7101/7102/7205','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(167,31,'H-7201/2/3/4','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(168,31,'H-7501/2','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(169,31,'H-41101','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(170,31,'H-47101','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(171,31,'H-47102/3','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(172,31,'H-47201/2/3/4','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(173,31,'H-47205','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(174,31,'H-40001A/B, 40501','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(175,31,'H-40101','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(176,31,'H-40201','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(177,31,'H-40301A/B','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(178,31,'H-48201','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(179,31,'H-48202','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(180,31,'H-48301','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(181,31,'H-48501','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(182,31,'H-43001','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(183,31,'H-1813','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(184,31,'H-1814','방지시설 설치 면제','2024-12-03',NULL,NULL,NULL),(185,31,'H-2302','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(186,31,'H-2301/2601','연소조절에 의한 시설','2024-12-03',NULL,NULL,NULL),(187,31,'H-102801','','2024-12-03',NULL,NULL,NULL),(188,31,'SG-20501','','2024-12-03',NULL,NULL,NULL),(189,31,'R-101205 (STK-101501)','','2024-12-03',NULL,NULL,NULL),(190,31,'L-16955','촉매반응을 이용한 시설','2024-12-03',NULL,NULL,NULL),(191,31,'R-51902','직접연소에 의한 시설','2024-12-03',NULL,NULL,NULL),(192,31,'R-31902','직접연소에 의한 시설','2024-12-03',NULL,NULL,NULL),(193,31,'R-21902','직접연소에 의한 시설','2024-12-03',NULL,NULL,NULL),(194,31,'D-205951/205961 (STK-205901)','','2024-12-03',NULL,NULL,NULL),(309,30,'#1','','2024-12-11',NULL,NULL,NULL),(310,30,'#2','','2024-12-11',NULL,NULL,NULL),(311,30,'#3','','2024-12-11',NULL,NULL,NULL),(312,30,'#4','','2024-12-11',NULL,NULL,NULL),(313,30,'#5','','2024-12-11',NULL,NULL,NULL),(315,10,'stack 170','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(316,10,'stack 171','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(318,10,'stack 172','세정집진시설','2024-12-14',NULL,16,9),(319,10,'stack 173','세정집진시설','2024-12-14',NULL,16,9),(320,10,'stack 175','흡착에 의한 시설','2024-12-14',NULL,16,9),(321,10,'stack 183','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(322,10,'stack 184','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(323,10,'stack 208','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(324,10,'stack 216','세정집진시설','2024-12-14',NULL,18,11),(325,10,'stack 217','세정집진시설','2024-12-14',NULL,18,11),(326,10,'stack 218','흡착에 의한 시설','2024-12-14',NULL,18,11),(327,10,'stack 219','세정집진시설','2024-12-14',NULL,18,11),(328,10,'stack 237','여과집진시설','2024-12-14',NULL,18,11),(329,10,'stack 238','여과집진시설','2024-12-14',NULL,18,11),(330,10,'stack 240','방지시설 설치의무 면제','2024-12-14',NULL,18,11),(331,10,'stack 241','방지시설 설치의무 면제','2024-12-14',NULL,18,11),(332,10,'stack 242','방지시설 설치의무 면제','2024-12-14',NULL,18,11),(333,10,'stack 243','방지시설 설치의무 면제','2024-12-14',NULL,18,11),(334,10,'stack 244','세정집진시설','2024-12-14',NULL,18,11),(335,10,'stack 245','세정집진시설','2024-12-14',NULL,18,11),(336,10,'stack 246','세정집진시설','2024-12-14',NULL,18,11),(337,10,'stack 247','세정집진시설','2024-12-14',NULL,18,11),(338,10,'stack 248','세정집진시설','2024-12-14',NULL,18,11),(339,10,'stack 249','세정집진시설','2024-12-14',NULL,18,11),(340,10,'stack 250','세정집진시설','2024-12-14',NULL,18,11),(341,10,'stack 251','세정집진시설','2024-12-14',NULL,18,11),(342,10,'stack 264','흡착에 의한 시설','2024-12-14',NULL,18,11),(343,10,'stack 281','흡수에 의한 시설','2024-12-14',NULL,20,11),(344,10,'stack 282','흡수에 의한 시설','2024-12-14',NULL,20,11),(345,10,'stack 283','흡수에 의한 시설','2024-12-14',NULL,20,11),(346,10,'stack 284','방지시설 설치의무 면제','2024-12-14',NULL,20,11),(347,10,'stack 290','세정집진시설','2024-12-14',NULL,20,11),(348,10,'stack 291','세정집진시설','2024-12-14',NULL,20,11),(349,10,'stack 292','세정집진시설','2024-12-14',NULL,20,11),(350,10,'stack 293','세정집진시설','2024-12-14',NULL,20,11),(351,10,'stack 294','세정집진시설','2024-12-14',NULL,20,11),(352,10,'stack 295','세정집진시설','2024-12-14',NULL,20,11),(353,10,'stack 296','세정집진시설','2024-12-14',NULL,20,11),(354,10,'stack 297','세정집진시설','2024-12-14',NULL,20,11),(355,10,'stack 298','세정집진시설','2024-12-14',NULL,20,11),(356,10,'stack 304','여과집진시설','2024-12-14',NULL,20,11),(357,10,'stack 305','여과집진시설','2024-12-14',NULL,20,11),(358,10,'stack 525','세정집진시설','2024-12-14',NULL,29,15),(359,10,'stack 526','세정집진시설','2024-12-14',NULL,29,15),(360,10,'stack 527','세정집진시설','2024-12-14',NULL,29,15),(361,10,'stack 528','세정집진시설','2024-12-14',NULL,29,15),(362,10,'stack 530','여과집진시설','2024-12-14',NULL,29,15),(363,10,'stack 571','세정집진시설','2024-12-14',NULL,29,15),(364,10,'stack 572','세정집진시설','2024-12-14',NULL,27,15),(365,10,'stack 573','세정집진시설','2024-12-14',NULL,27,15),(366,10,'stack 615','세정집진시설','2024-12-14',NULL,30,15),(367,10,'stack 616','세정집진시설','2024-12-14',NULL,30,15),(368,10,'stack 617','세정집진시설','2024-12-14',NULL,30,15),(369,10,'stack 620','세정집진시설','2024-12-14',NULL,28,15),(370,10,'stack 1212','직접연소에 의한 시설','2024-12-14',NULL,18,11),(371,10,'stack 1219','세정집진시설','2024-12-14',NULL,16,9),(372,10,'stack 1256','세정집진시설','2024-12-14',NULL,25,15),(373,10,'stack 1285','여과집진시설','2024-12-14',NULL,29,15),(374,10,'stack 1288','세정집진시설','2024-12-14',NULL,29,15),(375,10,'stack 1289','세정집진시설','2024-12-14',NULL,30,15),(376,10,'stack 1302','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(377,10,'stack 1303','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(378,10,'stack 1304','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(379,10,'stack 1305','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(380,10,'stack 1306','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(381,10,'stack 1311','방지시설 설치의무 면제','2024-12-14',NULL,21,16),(382,10,'stack 1312','방지시설 설치의무 면제','2024-12-14',NULL,21,16),(383,10,'stack 1313','방지시설 설치의무 면제','2024-12-14',NULL,21,16),(384,10,'stack 1321','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(385,10,'stack 1322','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(387,10,'stack 1328','방지시설 설치의무 면제','2024-12-14',NULL,21,16),(388,10,'stack 1359','세정집진시설','2024-12-14',NULL,29,15),(389,10,'stack 1362','방지시설 설치의무 면제','2024-12-14',NULL,18,11),(390,10,'stack 1363','세정집진시설','2024-12-14',NULL,26,15),(391,10,'stack 1395','직접연소에 의한 시설','2024-12-14',NULL,16,9),(392,10,'stack 1397','세정집진시설','2024-12-14',NULL,29,15),(393,10,'stack 1398','세정집진시설','2024-12-14',NULL,29,15),(394,10,'stack 1404','여과집진시설','2024-12-14',NULL,24,15),(395,10,'stack 1420','여과집진시설','2024-12-14',NULL,29,15),(396,10,'stack 1477','방지시설 설치의무 면제','2024-12-14',NULL,18,11),(397,10,'stack 1485','여과집진시설','2024-12-14',NULL,29,15),(398,10,'stack 1486','여과집진시설','2024-12-14',NULL,29,15),(399,10,'stack 1570','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(400,10,'stack 1571','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(401,10,'stack 1575','방지시설 설치의무 면제','2024-12-14',NULL,18,11),(402,10,'stack 1576','방지시설 설치의무 면제','2024-12-14',NULL,18,11),(403,10,'stack 1579','방지시설 설치의무 면제','2024-12-14',NULL,20,11),(404,10,'stack 1704','방지시설 설치의무 면제','2024-12-14',NULL,19,17),(405,10,'stack 1745','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(406,10,'stack 1746','흡착에 의한 시설','2024-12-14',NULL,19,17),(407,10,'stack 1785','세정집진시설','2024-12-14',NULL,18,11),(408,10,'stack 1786','세정집진시설','2024-12-14',NULL,18,11),(409,10,'stack 1787','세정집진시설','2024-12-14',NULL,18,11),(410,10,'stack 1788','세정집진시설','2024-12-14',NULL,18,11),(411,10,'stack 1789','세정집진시설','2024-12-14',NULL,18,11),(412,10,'stack 1790','세정집진시설','2024-12-14',NULL,18,11),(413,10,'stack 1791','세정집진시설','2024-12-14',NULL,18,11),(414,10,'stack 1792','세정집진시설','2024-12-14',NULL,18,11),(415,10,'stack 1793','세정집진시설','2024-12-14',NULL,18,11),(416,10,'stack 1794','세정집진시설','2024-12-14',NULL,18,11),(417,10,'stack 1847','방지시설 설치의무 면제','2024-12-14',NULL,19,17),(418,10,'stack 1848','방지시설 설치의무 면제','2024-12-14',NULL,19,17),(419,10,'stack 1901','여과집진시설','2024-12-14',NULL,30,15),(420,10,'stack 1920','흡착에 의한 시설','2024-12-14',NULL,16,9),(421,10,'stack 1939','방지시설 설치의무 면제','2024-12-14',NULL,19,17),(422,10,'stack 1940','방지시설 설치의무 면제','2024-12-14',NULL,19,17),(423,10,'stack 1943','여과집진시설','2024-12-14',NULL,25,15),(424,10,'stack 1944','여과집진시설','2024-12-14',NULL,26,15),(425,10,'stack 1966','방지시설 설치의무 면제','2024-12-14',NULL,30,15),(426,10,'stack 1967','방지시설 설치의무 면제','2024-12-14',NULL,30,15),(427,10,'stack 2047','연소조절에 의한 시설','2024-12-14',NULL,30,15),(428,10,'stack 2048','연소조절에 의한 시설','2024-12-14',NULL,30,15),(429,10,'stack 2049','연소조절에 의한 시설','2024-12-14',NULL,30,15),(430,10,'stack 2063','연소조절에 의한 시설','2024-12-14',NULL,26,15),(431,10,'stack 2144','방지시설 설치의무 면제','2024-12-14',NULL,19,17),(432,10,'stack 2151','직접연소에 의한 시설','2024-12-14',NULL,20,11),(433,10,'stack 2154','여과집진시설','2024-12-14',NULL,27,15),(434,10,'stack 2160','연소조절에 의한 시설','2024-12-14',NULL,17,12),(435,10,'stack 2161','흡착에 의한 시설','2024-12-14',NULL,16,9),(436,10,'stack 2163','세정집진시설','2024-12-14',NULL,30,15),(437,10,'stack 2186','연소조절에 의한 시설','2024-12-14',NULL,22,19),(438,10,'stack 2187','연소조절에 의한 시설','2024-12-14',NULL,23,19),(439,10,'stack 2309','방지시설 설치의무 면제','2024-12-14',NULL,17,10),(440,10,'stack 2315','방지시설 설치의무 면제','2024-12-14',NULL,19,17),(441,10,'stack 2316','방지시설 설치의무 면제','2024-12-14',NULL,19,17),(442,10,'stack 2317','방지시설 설치의무 면제','2024-12-14',NULL,21,16),(443,10,'stack 2318','방지시설 설치의무 면제','2024-12-14',NULL,21,16),(444,10,'stack 2327','여과집진시설','2024-12-14',NULL,30,15),(445,10,'stack 2328','연소조절에 의한 시설','2024-12-14',NULL,30,15),(446,10,'stack 2329','연소조절에 의한 시설','2024-12-14',NULL,30,15),(447,10,'stack 2330','연소조절에 의한 시설','2024-12-14',NULL,30,15),(448,10,'stack 2337','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(449,10,'stack 2342','여과집진시설','2024-12-14',NULL,28,15),(450,10,'stack 2343','여과집진시설','2024-12-14',NULL,29,15),(451,10,'stack 2344','여과집진시설','2024-12-14',NULL,29,15),(452,10,'stack 2350','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(453,10,'stack 2351','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(454,10,'stack 2352','방지시설 설치의무 면제','2024-12-14',NULL,16,9),(455,10,'stack 2353','흡착에 의한 시설','2024-12-14',NULL,16,9),(456,10,'stack 2354','흡착에 의한 시설','2024-12-14',NULL,16,9),(457,10,'stack 2355','흡착에 의한 시설','2024-12-14',NULL,21,16),(458,10,'stack 2367','방지시설 설치의무 면제','2024-12-14',NULL,20,11),(459,10,'stack 2378','방지시설 설치의무 면제','2024-12-14',NULL,30,15);
/*!40000 ALTER TABLE `stack` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_stack_insert` AFTER INSERT ON `stack` FOR EACH ROW BEGIN
    INSERT INTO stack_info (stack_info_id)
    VALUES (NEW.stack_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_info`
--

LOCK TABLES `stack_info` WRITE;
/*!40000 ALTER TABLE `stack_info` DISABLE KEYS */;
INSERT INTO `stack_info` VALUES (5,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL),(33,NULL,NULL,NULL,NULL,NULL,NULL),(34,NULL,NULL,NULL,NULL,NULL,NULL),(35,NULL,NULL,NULL,NULL,NULL,NULL),(36,NULL,NULL,NULL,NULL,NULL,NULL),(37,NULL,NULL,NULL,NULL,NULL,NULL),(38,NULL,NULL,NULL,NULL,NULL,NULL),(39,NULL,NULL,NULL,NULL,NULL,NULL),(40,NULL,NULL,NULL,NULL,NULL,NULL),(41,NULL,NULL,NULL,NULL,NULL,NULL),(42,NULL,NULL,NULL,NULL,NULL,NULL),(43,NULL,NULL,NULL,NULL,NULL,NULL),(44,NULL,NULL,NULL,NULL,NULL,NULL),(45,NULL,NULL,NULL,NULL,NULL,NULL),(46,NULL,NULL,NULL,NULL,NULL,NULL),(47,NULL,NULL,NULL,NULL,NULL,NULL),(48,NULL,NULL,NULL,NULL,NULL,NULL),(49,NULL,NULL,NULL,NULL,NULL,NULL),(50,NULL,NULL,NULL,NULL,NULL,NULL),(51,NULL,NULL,NULL,NULL,NULL,NULL),(52,NULL,NULL,NULL,NULL,NULL,NULL),(53,NULL,NULL,NULL,NULL,NULL,NULL),(54,NULL,NULL,NULL,NULL,NULL,NULL),(55,NULL,NULL,NULL,NULL,NULL,NULL),(56,NULL,NULL,NULL,NULL,NULL,NULL),(57,NULL,NULL,NULL,NULL,NULL,NULL),(58,NULL,NULL,NULL,NULL,NULL,NULL),(59,NULL,NULL,NULL,NULL,NULL,NULL),(60,NULL,NULL,NULL,NULL,NULL,NULL),(61,NULL,NULL,NULL,NULL,NULL,NULL),(62,NULL,NULL,NULL,NULL,NULL,NULL),(63,NULL,NULL,NULL,NULL,NULL,NULL),(64,NULL,NULL,NULL,NULL,NULL,NULL),(65,NULL,NULL,NULL,NULL,NULL,NULL),(66,NULL,NULL,NULL,NULL,NULL,NULL),(67,NULL,NULL,NULL,NULL,NULL,NULL),(68,NULL,NULL,NULL,NULL,NULL,NULL),(69,NULL,NULL,NULL,NULL,NULL,NULL),(70,NULL,NULL,NULL,NULL,NULL,NULL),(71,NULL,NULL,NULL,NULL,NULL,NULL),(72,NULL,NULL,NULL,NULL,NULL,NULL),(73,NULL,NULL,NULL,NULL,NULL,NULL),(74,NULL,NULL,NULL,NULL,NULL,NULL),(75,NULL,NULL,NULL,NULL,NULL,NULL),(76,NULL,NULL,NULL,NULL,NULL,NULL),(77,NULL,NULL,NULL,NULL,NULL,NULL),(78,NULL,NULL,NULL,NULL,NULL,NULL),(79,NULL,NULL,NULL,NULL,NULL,NULL),(80,NULL,NULL,NULL,NULL,NULL,NULL),(81,NULL,NULL,NULL,NULL,NULL,NULL),(82,NULL,NULL,NULL,NULL,NULL,NULL),(83,NULL,NULL,NULL,NULL,NULL,NULL),(84,NULL,NULL,NULL,NULL,NULL,NULL),(85,NULL,NULL,NULL,NULL,NULL,NULL),(86,NULL,NULL,NULL,NULL,NULL,NULL),(87,NULL,NULL,NULL,NULL,NULL,NULL),(88,NULL,NULL,NULL,NULL,NULL,NULL),(89,NULL,NULL,NULL,NULL,NULL,NULL),(90,NULL,NULL,NULL,NULL,NULL,NULL),(91,NULL,NULL,NULL,NULL,NULL,NULL),(92,NULL,NULL,NULL,NULL,NULL,NULL),(93,NULL,NULL,NULL,NULL,NULL,NULL),(94,NULL,NULL,NULL,NULL,NULL,NULL),(95,NULL,NULL,NULL,NULL,NULL,NULL),(96,NULL,NULL,NULL,NULL,NULL,NULL),(97,NULL,NULL,NULL,NULL,NULL,NULL),(98,NULL,NULL,NULL,NULL,NULL,NULL),(99,NULL,NULL,NULL,NULL,NULL,NULL),(100,NULL,NULL,NULL,NULL,NULL,NULL),(101,NULL,NULL,NULL,NULL,NULL,NULL),(102,NULL,NULL,NULL,NULL,NULL,NULL),(103,NULL,NULL,NULL,NULL,NULL,NULL),(104,NULL,NULL,NULL,NULL,NULL,NULL),(105,NULL,NULL,NULL,NULL,NULL,NULL),(115,NULL,NULL,NULL,NULL,NULL,NULL),(116,NULL,NULL,NULL,NULL,NULL,NULL),(117,NULL,NULL,NULL,NULL,NULL,NULL),(118,NULL,NULL,NULL,NULL,NULL,NULL),(119,NULL,NULL,NULL,NULL,NULL,NULL),(120,NULL,NULL,NULL,NULL,NULL,NULL),(140,NULL,NULL,NULL,NULL,NULL,NULL),(141,NULL,NULL,NULL,NULL,NULL,NULL),(142,NULL,NULL,NULL,NULL,NULL,NULL),(143,NULL,NULL,NULL,NULL,NULL,NULL),(144,NULL,NULL,NULL,NULL,NULL,NULL),(145,NULL,NULL,NULL,NULL,NULL,NULL),(146,NULL,NULL,NULL,NULL,NULL,NULL),(147,NULL,NULL,NULL,NULL,NULL,NULL),(148,NULL,NULL,NULL,NULL,NULL,NULL),(149,NULL,NULL,NULL,NULL,NULL,NULL),(150,NULL,NULL,NULL,NULL,NULL,NULL),(151,NULL,NULL,NULL,NULL,NULL,NULL),(152,NULL,NULL,NULL,NULL,NULL,NULL),(153,NULL,NULL,NULL,NULL,NULL,NULL),(154,NULL,NULL,NULL,NULL,NULL,NULL),(155,NULL,NULL,NULL,NULL,NULL,NULL),(156,NULL,NULL,NULL,NULL,NULL,NULL),(157,NULL,NULL,NULL,NULL,NULL,NULL),(158,NULL,NULL,NULL,NULL,NULL,NULL),(159,NULL,NULL,NULL,NULL,NULL,NULL),(160,NULL,NULL,NULL,NULL,NULL,NULL),(161,NULL,NULL,NULL,NULL,NULL,NULL),(162,NULL,NULL,NULL,NULL,NULL,NULL),(163,NULL,NULL,NULL,NULL,NULL,NULL),(165,NULL,NULL,NULL,NULL,NULL,NULL),(166,NULL,NULL,NULL,NULL,NULL,NULL),(167,NULL,NULL,NULL,NULL,NULL,NULL),(168,NULL,NULL,NULL,NULL,NULL,NULL),(169,NULL,NULL,NULL,NULL,NULL,NULL),(170,NULL,NULL,NULL,NULL,NULL,NULL),(171,NULL,NULL,NULL,NULL,NULL,NULL),(172,NULL,NULL,NULL,NULL,NULL,NULL),(173,NULL,NULL,NULL,NULL,NULL,NULL),(174,NULL,NULL,NULL,NULL,NULL,NULL),(175,NULL,NULL,NULL,NULL,NULL,NULL),(176,NULL,NULL,NULL,NULL,NULL,NULL),(177,NULL,NULL,NULL,NULL,NULL,NULL),(178,NULL,NULL,NULL,NULL,NULL,NULL),(179,NULL,NULL,NULL,NULL,NULL,NULL),(180,NULL,NULL,NULL,NULL,NULL,NULL),(181,NULL,NULL,NULL,NULL,NULL,NULL),(182,NULL,NULL,NULL,NULL,NULL,NULL),(183,NULL,NULL,NULL,NULL,NULL,NULL),(184,NULL,NULL,NULL,NULL,NULL,NULL),(185,NULL,NULL,NULL,NULL,NULL,NULL),(186,NULL,NULL,NULL,NULL,NULL,NULL),(187,NULL,NULL,NULL,NULL,NULL,NULL),(188,NULL,NULL,NULL,NULL,NULL,NULL),(189,NULL,NULL,NULL,NULL,NULL,NULL),(190,NULL,NULL,NULL,NULL,NULL,NULL),(191,NULL,NULL,NULL,NULL,NULL,NULL),(192,NULL,NULL,NULL,NULL,NULL,NULL),(193,NULL,NULL,NULL,NULL,NULL,NULL),(194,NULL,NULL,NULL,NULL,NULL,NULL),(309,NULL,NULL,NULL,NULL,NULL,NULL),(310,NULL,NULL,NULL,NULL,NULL,NULL),(311,NULL,NULL,NULL,NULL,NULL,NULL),(312,NULL,NULL,NULL,NULL,NULL,NULL),(313,NULL,NULL,NULL,NULL,NULL,NULL),(315,NULL,NULL,NULL,NULL,NULL,NULL),(316,NULL,NULL,NULL,NULL,NULL,NULL),(318,NULL,NULL,NULL,NULL,NULL,NULL),(319,NULL,NULL,NULL,NULL,NULL,NULL),(320,NULL,NULL,NULL,NULL,NULL,NULL),(321,NULL,NULL,NULL,NULL,NULL,NULL),(322,NULL,NULL,NULL,NULL,NULL,NULL),(323,NULL,NULL,NULL,NULL,NULL,NULL),(324,NULL,NULL,NULL,NULL,NULL,NULL),(325,NULL,NULL,NULL,NULL,NULL,NULL),(326,NULL,NULL,NULL,NULL,NULL,NULL),(327,NULL,NULL,NULL,NULL,NULL,NULL),(328,NULL,NULL,NULL,NULL,NULL,NULL),(329,NULL,NULL,NULL,NULL,NULL,NULL),(330,NULL,NULL,NULL,NULL,NULL,NULL),(331,NULL,NULL,NULL,NULL,NULL,NULL),(332,NULL,NULL,NULL,NULL,NULL,NULL),(333,NULL,NULL,NULL,NULL,NULL,NULL),(334,NULL,NULL,NULL,NULL,NULL,NULL),(335,NULL,NULL,NULL,NULL,NULL,NULL),(336,NULL,NULL,NULL,NULL,NULL,NULL),(337,NULL,NULL,NULL,NULL,NULL,NULL),(338,NULL,NULL,NULL,NULL,NULL,NULL),(339,NULL,NULL,NULL,NULL,NULL,NULL),(340,NULL,NULL,NULL,NULL,NULL,NULL),(341,NULL,NULL,NULL,NULL,NULL,NULL),(342,NULL,NULL,NULL,NULL,NULL,NULL),(343,NULL,NULL,NULL,NULL,NULL,NULL),(344,NULL,NULL,NULL,NULL,NULL,NULL),(345,NULL,NULL,NULL,NULL,NULL,NULL),(346,NULL,NULL,NULL,NULL,NULL,NULL),(347,NULL,NULL,NULL,NULL,NULL,NULL),(348,NULL,NULL,NULL,NULL,NULL,NULL),(349,NULL,NULL,NULL,NULL,NULL,NULL),(350,NULL,NULL,NULL,NULL,NULL,NULL),(351,NULL,NULL,NULL,NULL,NULL,NULL),(352,NULL,NULL,NULL,NULL,NULL,NULL),(353,NULL,NULL,NULL,NULL,NULL,NULL),(354,NULL,NULL,NULL,NULL,NULL,NULL),(355,NULL,NULL,NULL,NULL,NULL,NULL),(356,NULL,NULL,NULL,NULL,NULL,NULL),(357,NULL,NULL,NULL,NULL,NULL,NULL),(358,NULL,NULL,NULL,NULL,NULL,NULL),(359,NULL,NULL,NULL,NULL,NULL,NULL),(360,NULL,NULL,NULL,NULL,NULL,NULL),(361,NULL,NULL,NULL,NULL,NULL,NULL),(362,NULL,NULL,NULL,NULL,NULL,NULL),(363,NULL,NULL,NULL,NULL,NULL,NULL),(364,NULL,NULL,NULL,NULL,NULL,NULL),(365,NULL,NULL,NULL,NULL,NULL,NULL),(366,NULL,NULL,NULL,NULL,NULL,NULL),(367,NULL,NULL,NULL,NULL,NULL,NULL),(368,NULL,NULL,NULL,NULL,NULL,NULL),(369,NULL,NULL,NULL,NULL,NULL,NULL),(370,NULL,NULL,NULL,NULL,NULL,NULL),(371,NULL,NULL,NULL,NULL,NULL,NULL),(372,NULL,NULL,NULL,NULL,NULL,NULL),(373,NULL,NULL,NULL,NULL,NULL,NULL),(374,NULL,NULL,NULL,NULL,NULL,NULL),(375,NULL,NULL,NULL,NULL,NULL,NULL),(376,NULL,NULL,NULL,NULL,NULL,NULL),(377,NULL,NULL,NULL,NULL,NULL,NULL),(378,NULL,NULL,NULL,NULL,NULL,NULL),(379,NULL,NULL,NULL,NULL,NULL,NULL),(380,NULL,NULL,NULL,NULL,NULL,NULL),(381,NULL,NULL,NULL,NULL,NULL,NULL),(382,NULL,NULL,NULL,NULL,NULL,NULL),(383,NULL,NULL,NULL,NULL,NULL,NULL),(384,NULL,NULL,NULL,NULL,NULL,NULL),(385,NULL,NULL,NULL,NULL,NULL,NULL),(387,NULL,NULL,NULL,NULL,NULL,NULL),(388,NULL,NULL,NULL,NULL,NULL,NULL),(389,NULL,NULL,NULL,NULL,NULL,NULL),(390,NULL,NULL,NULL,NULL,NULL,NULL),(391,NULL,NULL,NULL,NULL,NULL,NULL),(392,NULL,NULL,NULL,NULL,NULL,NULL),(393,NULL,NULL,NULL,NULL,NULL,NULL),(394,NULL,NULL,NULL,NULL,NULL,NULL),(395,NULL,NULL,NULL,NULL,NULL,NULL),(396,NULL,NULL,NULL,NULL,NULL,NULL),(397,NULL,NULL,NULL,NULL,NULL,NULL),(398,NULL,NULL,NULL,NULL,NULL,NULL),(399,NULL,NULL,NULL,NULL,NULL,NULL),(400,NULL,NULL,NULL,NULL,NULL,NULL),(401,NULL,NULL,NULL,NULL,NULL,NULL),(402,NULL,NULL,NULL,NULL,NULL,NULL),(403,NULL,NULL,NULL,NULL,NULL,NULL),(404,NULL,NULL,NULL,NULL,NULL,NULL),(405,NULL,NULL,NULL,NULL,NULL,NULL),(406,NULL,NULL,NULL,NULL,NULL,NULL),(407,NULL,NULL,NULL,NULL,NULL,NULL),(408,NULL,NULL,NULL,NULL,NULL,NULL),(409,NULL,NULL,NULL,NULL,NULL,NULL),(410,NULL,NULL,NULL,NULL,NULL,NULL),(411,NULL,NULL,NULL,NULL,NULL,NULL),(412,NULL,NULL,NULL,NULL,NULL,NULL),(413,NULL,NULL,NULL,NULL,NULL,NULL),(414,NULL,NULL,NULL,NULL,NULL,NULL),(415,NULL,NULL,NULL,NULL,NULL,NULL),(416,NULL,NULL,NULL,NULL,NULL,NULL),(417,NULL,NULL,NULL,NULL,NULL,NULL),(418,NULL,NULL,NULL,NULL,NULL,NULL),(419,NULL,NULL,NULL,NULL,NULL,NULL),(420,NULL,NULL,NULL,NULL,NULL,NULL),(421,NULL,NULL,NULL,NULL,NULL,NULL),(422,NULL,NULL,NULL,NULL,NULL,NULL),(423,NULL,NULL,NULL,NULL,NULL,NULL),(424,NULL,NULL,NULL,NULL,NULL,NULL),(425,NULL,NULL,NULL,NULL,NULL,NULL),(426,NULL,NULL,NULL,NULL,NULL,NULL),(427,NULL,NULL,NULL,NULL,NULL,NULL),(428,NULL,NULL,NULL,NULL,NULL,NULL),(429,NULL,NULL,NULL,NULL,NULL,NULL),(430,NULL,NULL,NULL,NULL,NULL,NULL),(431,NULL,NULL,NULL,NULL,NULL,NULL),(432,NULL,NULL,NULL,NULL,NULL,NULL),(433,NULL,NULL,NULL,NULL,NULL,NULL),(434,NULL,NULL,NULL,NULL,NULL,NULL),(435,NULL,NULL,NULL,NULL,NULL,NULL),(436,NULL,NULL,NULL,NULL,NULL,NULL),(437,NULL,NULL,NULL,NULL,NULL,NULL),(438,NULL,NULL,NULL,NULL,NULL,NULL),(439,NULL,NULL,NULL,NULL,NULL,NULL),(440,NULL,NULL,NULL,NULL,NULL,NULL),(441,NULL,NULL,NULL,NULL,NULL,NULL),(442,NULL,NULL,NULL,NULL,NULL,NULL),(443,NULL,NULL,NULL,NULL,NULL,NULL),(444,NULL,NULL,NULL,NULL,NULL,NULL),(445,NULL,NULL,NULL,NULL,NULL,NULL),(446,NULL,NULL,NULL,NULL,NULL,NULL),(447,NULL,NULL,NULL,NULL,NULL,NULL),(448,NULL,NULL,NULL,NULL,NULL,NULL),(449,NULL,NULL,NULL,NULL,NULL,NULL),(450,NULL,NULL,NULL,NULL,NULL,NULL),(451,NULL,NULL,NULL,NULL,NULL,NULL),(452,NULL,NULL,NULL,NULL,NULL,NULL),(453,NULL,NULL,NULL,NULL,NULL,NULL),(454,NULL,NULL,NULL,NULL,NULL,NULL),(455,NULL,NULL,NULL,NULL,NULL,NULL),(456,NULL,NULL,NULL,NULL,NULL,NULL),(457,NULL,NULL,NULL,NULL,NULL,NULL),(458,NULL,NULL,NULL,NULL,NULL,NULL),(459,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `cycle_type` enum('monthly','twiceamonth','onceinfebruary','quarterly','semiannual','annual','additional','nomeasure') NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `is_measure` tinyint(1) DEFAULT '1',
  `allow_value` int DEFAULT NULL,
  PRIMARY KEY (`stack_measurement_id`),
  KEY `fk_stack_id_idx` (`stack_id`),
  KEY `fk_pollutant_id_idx` (`pollutant_id`),
  CONSTRAINT `fk_pollutant_id` FOREIGN KEY (`pollutant_id`) REFERENCES `pollutant` (`pollutant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stack_id` FOREIGN KEY (`stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=785 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_measurement`
--

LOCK TABLES `stack_measurement` WRITE;
/*!40000 ALTER TABLE `stack_measurement` DISABLE KEYS */;
INSERT INTO `stack_measurement` VALUES (104,11,17,'semiannual',0,1,NULL),(105,11,21,'semiannual',0,1,NULL),(106,12,17,'semiannual',0,1,NULL),(107,12,21,'semiannual',0,1,NULL),(108,5,17,'annual',0,1,NULL),(109,6,17,'annual',0,1,NULL),(110,7,17,'semiannual',0,1,NULL),(111,8,17,'semiannual',0,1,NULL),(112,9,17,'semiannual',0,1,NULL),(113,10,17,'semiannual',0,1,NULL),(114,115,17,'semiannual',0,1,NULL),(115,116,17,'semiannual',0,1,NULL),(116,117,17,'semiannual',0,1,NULL),(117,120,17,'annual',0,1,NULL),(118,120,19,'annual',0,1,NULL),(119,120,18,'semiannual',0,1,NULL),(120,118,17,'annual',0,1,NULL),(121,118,19,'annual',0,1,NULL),(122,118,18,'semiannual',0,1,NULL),(123,119,17,'annual',0,1,NULL),(124,119,19,'annual',0,1,NULL),(125,119,18,'semiannual',0,1,NULL),(132,140,19,'quarterly',0,1,NULL),(133,140,26,'semiannual',0,1,NULL),(134,140,30,'semiannual',0,1,NULL),(135,140,24,'semiannual',0,1,NULL),(136,140,23,'semiannual',0,1,NULL),(137,140,53,'semiannual',0,1,NULL),(138,140,28,'semiannual',0,1,NULL),(139,140,27,'semiannual',0,1,NULL),(140,140,55,'semiannual',0,1,NULL),(141,140,29,'semiannual',0,1,NULL),(142,140,43,'semiannual',0,1,NULL),(143,141,19,'quarterly',0,1,NULL),(144,141,26,'semiannual',0,1,NULL),(145,141,30,'semiannual',0,1,NULL),(146,141,24,'semiannual',0,1,NULL),(147,141,23,'semiannual',0,1,NULL),(148,141,53,'semiannual',0,1,NULL),(149,141,28,'semiannual',0,1,NULL),(150,141,27,'semiannual',0,1,NULL),(151,141,55,'semiannual',0,1,NULL),(152,141,29,'semiannual',0,1,NULL),(153,141,43,'semiannual',0,1,NULL),(154,141,36,'semiannual',0,1,NULL),(155,142,19,'quarterly',0,1,NULL),(156,142,26,'semiannual',0,1,NULL),(157,142,30,'semiannual',0,1,NULL),(158,142,24,'semiannual',0,1,NULL),(159,142,23,'semiannual',0,1,NULL),(160,142,53,'semiannual',0,1,NULL),(161,142,28,'semiannual',0,1,NULL),(162,142,27,'semiannual',0,1,NULL),(163,142,55,'semiannual',0,1,NULL),(164,142,29,'semiannual',0,1,NULL),(165,142,36,'semiannual',0,1,NULL),(166,143,24,'monthly',0,1,NULL),(167,143,23,'monthly',0,1,NULL),(168,143,27,'monthly',0,1,NULL),(169,143,26,'quarterly',0,1,NULL),(170,143,30,'quarterly',0,1,NULL),(173,143,53,'quarterly',0,1,NULL),(174,143,43,'quarterly',0,1,NULL),(175,143,28,'quarterly',0,1,NULL),(176,143,56,'quarterly',0,1,NULL),(177,143,55,'quarterly',0,1,NULL),(178,144,19,'quarterly',0,1,NULL),(179,144,26,'semiannual',0,1,NULL),(180,144,30,'semiannual',0,1,NULL),(181,144,24,'semiannual',0,1,NULL),(182,144,23,'semiannual',0,1,NULL),(183,144,53,'semiannual',0,1,NULL),(184,144,28,'semiannual',0,1,NULL),(185,144,27,'semiannual',0,1,NULL),(186,144,55,'semiannual',0,1,NULL),(187,144,29,'semiannual',0,1,NULL),(188,144,43,'semiannual',0,1,NULL),(189,143,29,'quarterly',0,1,NULL),(435,309,17,'monthly',1,1,NULL),(436,310,17,'monthly',0,1,NULL),(437,311,17,'monthly',0,1,NULL),(438,312,17,'monthly',1,1,NULL),(439,313,17,'monthly',0,1,NULL),(440,309,59,'monthly',1,1,NULL),(441,310,60,'monthly',0,1,NULL),(442,310,57,'semiannual',0,1,NULL),(447,315,17,'annual',0,1,30),(449,315,21,'annual',0,1,NULL),(450,316,17,'annual',0,1,30),(452,316,21,'annual',0,1,NULL),(453,318,17,'twiceamonth',0,1,30),(454,318,55,'twiceamonth',0,1,NULL),(455,318,56,'twiceamonth',0,1,NULL),(457,318,19,'twiceamonth',0,1,200),(460,318,42,'twiceamonth',0,1,12),(461,319,17,'twiceamonth',0,1,30),(462,319,55,'twiceamonth',0,1,NULL),(463,319,56,'twiceamonth',0,1,4),(465,319,19,'twiceamonth',0,1,200),(468,319,42,'twiceamonth',0,1,12),(469,319,18,'nomeasure',0,0,150),(470,319,20,'nomeasure',0,0,NULL),(471,319,21,'nomeasure',0,0,NULL),(472,315,20,'nomeasure',0,0,NULL),(473,316,20,'nomeasure',0,0,NULL),(474,318,18,'nomeasure',0,0,NULL),(475,318,20,'nomeasure',0,0,NULL),(476,318,21,'nomeasure',0,0,NULL),(477,320,17,'annual',0,1,30),(478,320,55,'monthly',0,1,NULL),(479,320,56,'annual',0,1,4),(480,320,21,'annual',0,1,NULL),(481,320,42,'monthly',0,1,12),(482,321,20,'nomeasure',0,0,NULL),(483,321,17,'annual',0,1,30),(484,321,18,'annual',0,1,150),(485,321,19,'annual',0,1,200),(486,321,21,'annual',0,1,NULL),(487,322,17,'annual',0,1,30),(488,322,18,'annual',0,1,150),(489,322,19,'annual',0,1,200),(490,322,20,'nomeasure',0,0,NULL),(491,322,21,'annual',0,1,NULL),(492,323,17,'annual',0,1,30),(493,323,21,'annual',0,1,110),(494,324,17,'annual',0,1,30),(495,324,35,'monthly',0,1,2),(496,324,36,'annual',0,1,4),(497,324,55,'monthly',0,1,NULL),(498,324,56,'monthly',0,1,4),(499,324,21,'annual',0,1,200),(500,324,23,'monthly',0,1,2),(501,324,42,'monthly',0,1,12),(502,325,17,'annual',0,1,30),(503,325,60,'monthly',0,1,NULL),(504,325,34,'annual',0,1,4),(505,325,35,'monthly',0,1,2),(506,325,36,'annual',0,1,4),(507,325,37,'nomeasure',0,0,NULL),(508,325,55,'monthly',0,1,NULL),(509,325,56,'monthly',0,1,NULL),(510,325,18,'annual',0,1,150),(511,325,21,'annual',0,1,200),(512,325,23,'monthly',0,1,3),(513,325,24,'annual',0,1,2),(514,325,43,'monthly',0,1,6),(515,325,48,'monthly',0,1,50),(516,325,42,'monthly',0,1,12),(517,326,17,'annual',0,1,30),(518,326,55,'monthly',0,1,NULL),(519,326,56,'annual',0,1,4),(520,326,21,'nomeasure',0,0,NULL),(521,326,48,'annual',0,1,50),(522,326,42,'monthly',0,1,12),(523,327,17,'annual',0,1,30),(524,327,55,'monthly',0,1,NULL),(525,327,56,'annual',0,1,4),(526,327,18,'annual',0,1,150),(527,327,19,'annual',0,1,200),(528,327,20,'nomeasure',0,0,NULL),(529,327,21,'nomeasure',0,0,NULL),(530,327,44,'monthly',0,1,23),(531,327,42,'monthly',0,1,12),(532,328,17,'annual',0,1,30),(533,328,18,'annual',0,1,150),(534,328,19,'annual',0,1,200),(535,328,20,'nomeasure',0,0,NULL),(536,328,21,'nomeasure',0,0,NULL),(537,329,17,'annual',0,1,30),(538,329,18,'annual',0,1,150),(539,329,19,'annual',0,1,200),(540,329,20,'nomeasure',0,0,NULL),(541,329,21,'nomeasure',0,0,NULL),(542,330,17,'annual',0,1,30),(543,330,18,'annual',0,1,150),(544,330,19,'annual',0,1,200),(545,330,20,'nomeasure',0,0,NULL),(546,330,21,'annual',0,1,NULL),(547,331,17,'annual',0,1,30),(548,331,18,'annual',0,1,150),(549,331,19,'annual',0,1,200),(550,331,20,'nomeasure',0,0,NULL),(551,331,21,'nomeasure',0,0,NULL),(552,332,17,'annual',0,1,30),(553,332,18,'annual',0,1,150),(554,332,19,'annual',0,1,200),(555,332,20,'nomeasure',0,0,NULL),(556,332,21,'annual',0,1,NULL),(562,333,17,'annual',0,1,30),(563,333,18,'annual',0,1,150),(564,333,19,'annual',0,1,200),(565,333,20,'nomeasure',0,0,NULL),(566,333,21,'annual',0,1,NULL),(567,334,17,'annual',0,1,30),(568,334,55,'monthly',0,1,NULL),(569,334,56,'annual',0,1,4),(570,334,18,'annual',0,1,150),(571,334,19,'annual',0,1,200),(572,334,20,'nomeasure',0,0,NULL),(573,334,21,'nomeasure',0,0,NULL),(574,334,42,'monthly',0,1,12),(575,335,17,'annual',0,1,30),(576,335,55,'monthly',0,1,NULL),(577,335,56,'annual',0,1,4),(578,335,18,'annual',0,1,150),(579,335,19,'annual',0,1,200),(580,335,20,'nomeasure',0,0,NULL),(581,335,21,'nomeasure',0,0,NULL),(582,335,42,'monthly',0,1,12),(583,336,17,'annual',0,1,30),(584,336,55,'monthly',0,1,NULL),(585,336,56,'annual',0,1,4),(586,336,18,'annual',0,1,150),(587,336,19,'annual',0,1,200),(588,336,20,'nomeasure',0,0,NULL),(589,336,21,'nomeasure',0,0,NULL),(590,336,42,'monthly',0,1,12),(591,337,17,'annual',0,1,30),(592,337,55,'monthly',0,1,NULL),(593,337,56,'annual',0,1,4),(594,337,18,'annual',0,1,150),(595,337,19,'annual',0,1,200),(596,337,20,'nomeasure',0,0,NULL),(597,337,21,'nomeasure',0,0,NULL),(598,337,42,'monthly',0,1,12),(599,338,17,'annual',0,1,30),(600,338,55,'monthly',0,1,NULL),(601,338,56,'annual',0,1,4),(602,338,18,'annual',0,1,150),(603,338,19,'annual',0,1,200),(604,338,20,'nomeasure',0,0,NULL),(605,338,21,'nomeasure',0,0,NULL),(606,338,42,'monthly',0,1,12),(607,339,17,'annual',0,1,30),(608,339,55,'monthly',0,1,NULL),(609,339,56,'annual',0,1,4),(610,339,18,'annual',0,1,150),(611,339,19,'annual',0,1,200),(612,339,20,'nomeasure',0,0,NULL),(613,339,21,'nomeasure',0,0,NULL),(614,339,42,'monthly',0,1,12),(615,340,17,'annual',0,1,30),(616,340,55,'monthly',0,1,NULL),(617,340,56,'monthly',0,1,4),(618,340,18,'annual',0,1,150),(619,340,19,'annual',0,1,200),(620,340,20,'nomeasure',0,0,NULL),(621,340,21,'annual',0,1,NULL),(622,340,44,'monthly',0,1,23),(623,340,42,'monthly',0,1,12),(624,341,17,'annual',0,1,30),(625,341,55,'monthly',0,1,NULL),(626,341,56,'monthly',0,1,4),(627,341,18,'annual',0,1,150),(628,341,19,'annual',0,1,200),(629,341,20,'nomeasure',0,0,NULL),(630,341,21,'annual',0,1,NULL),(631,341,44,'monthly',0,1,23),(632,341,42,'monthly',0,1,12),(633,342,17,'annual',0,1,30),(634,342,55,'monthly',0,1,NULL),(635,342,56,'annual',0,1,4),(636,342,21,'nomeasure',0,0,NULL),(637,342,42,'monthly',0,1,12),(638,343,17,'annual',0,1,30),(639,343,35,'monthly',0,1,2),(640,343,36,'annual',0,1,4),(641,343,55,'monthly',0,1,NULL),(642,343,56,'monthly',0,1,4),(643,343,21,'annual',0,1,200),(644,343,25,'monthly',0,1,4),(645,343,42,'monthly',0,1,12),(646,344,17,'annual',0,1,30),(647,344,60,'monthly',0,1,NULL),(648,344,32,'monthly',0,1,NULL),(649,344,34,'annual',0,1,4),(650,344,35,'monthly',0,1,2),(651,344,36,'annual',0,1,4),(652,344,37,'nomeasure',0,0,NULL),(653,344,55,'monthly',0,1,NULL),(654,344,56,'monthly',0,1,4),(655,344,21,'annual',0,1,200),(656,344,23,'monthly',0,1,3),(657,344,24,'annual',0,1,2),(658,344,48,'monthly',0,1,50),(659,344,42,'monthly',0,1,12),(660,345,17,'annual',0,1,30),(661,345,55,'monthly',0,1,NULL),(662,345,56,'annual',0,1,4),(663,345,21,'nomeasure',0,0,NULL),(664,345,48,'annual',0,1,50),(665,345,42,'monthly',0,1,12),(666,346,17,'annual',0,1,30),(667,346,18,'annual',0,1,150),(668,346,19,'annual',0,1,200),(669,346,20,'nomeasure',0,0,NULL),(670,346,21,'nomeasure',0,0,NULL),(671,347,17,'annual',0,1,30),(672,347,55,'monthly',0,1,NULL),(673,347,56,'annual',0,1,4),(674,347,18,'annual',0,1,150),(675,347,19,'annual',0,1,200),(676,347,20,'nomeasure',0,0,NULL),(677,347,21,'nomeasure',0,0,NULL),(678,347,42,'monthly',0,1,12),(679,348,17,'annual',0,1,30),(680,348,55,'monthly',0,1,NULL),(681,348,56,'annual',0,1,4),(682,348,18,'annual',0,1,150),(683,348,19,'annual',0,1,200),(684,348,20,'nomeasure',0,0,NULL),(685,348,21,'nomeasure',0,0,NULL),(686,348,42,'monthly',0,1,12),(687,349,17,'annual',0,1,30),(688,349,55,'monthly',0,1,NULL),(689,349,56,'annual',0,1,4),(690,349,18,'annual',0,1,150),(691,349,19,'annual',0,1,200),(692,349,20,'nomeasure',0,0,NULL),(693,349,21,'nomeasure',0,0,NULL),(694,349,42,'monthly',0,1,12),(695,350,17,'annual',0,1,30),(696,350,55,'monthly',0,1,NULL),(697,350,56,'annual',0,1,4),(698,350,18,'annual',0,1,150),(699,350,19,'annual',0,1,200),(700,350,20,'nomeasure',0,0,NULL),(701,350,21,'nomeasure',0,0,NULL),(702,350,42,'monthly',0,1,12),(703,350,45,'monthly',0,1,5),(704,351,17,'annual',0,1,30),(705,351,55,'monthly',0,1,NULL),(706,351,56,'annual',0,1,4),(707,351,18,'annual',0,1,150),(708,351,19,'annual',0,1,200),(709,351,20,'nomeasure',0,0,NULL),(710,351,21,'nomeasure',0,0,NULL),(711,351,42,'monthly',0,1,12),(712,352,17,'annual',0,1,30),(713,352,55,'monthly',0,1,NULL),(714,352,56,'annual',0,1,4),(715,352,18,'annual',0,1,150),(716,352,19,'annual',0,1,200),(717,352,20,'nomeasure',0,0,NULL),(718,352,21,'nomeasure',0,0,NULL),(719,352,42,'monthly',0,1,12),(720,353,17,'annual',0,1,30),(721,353,55,'monthly',0,1,NULL),(722,353,56,'annual',0,1,4),(723,353,18,'annual',0,1,150),(724,353,19,'annual',0,1,200),(725,353,20,'nomeasure',0,0,NULL),(726,353,21,'nomeasure',0,0,NULL),(727,353,42,'monthly',0,1,12),(728,354,17,'annual',0,1,30),(729,354,55,'monthly',0,1,NULL),(730,354,56,'annual',0,1,4),(731,354,18,'annual',0,1,150),(732,354,19,'annual',0,1,200),(733,354,20,'nomeasure',0,0,NULL),(734,354,21,'nomeasure',0,0,NULL),(735,354,42,'monthly',0,1,12),(741,355,17,'annual',0,1,30),(742,355,19,'annual',0,1,200),(743,355,18,'annual',0,1,150),(744,355,20,'nomeasure',0,0,NULL),(745,355,21,'annual',0,1,NULL),(746,355,56,'monthly',0,1,4),(747,355,55,'monthly',0,1,NULL),(748,355,42,'monthly',0,1,12),(749,356,17,'annual',0,1,30),(750,356,19,'annual',0,1,200),(751,356,18,'annual',0,1,150),(752,356,20,'nomeasure',0,0,NULL),(753,356,21,'nomeasure',0,0,NULL),(754,357,17,'annual',0,1,30),(755,357,19,'annual',0,1,200),(756,357,18,'annual',0,1,150),(757,357,20,'nomeasure',0,0,NULL),(758,357,21,'nomeasure',0,0,NULL),(759,358,17,'annual',0,1,25),(760,358,18,'annual',0,1,150),(761,358,56,'monthly',0,1,4),(762,358,55,'monthly',0,1,NULL),(763,358,24,'annual',0,1,2),(764,358,23,'monthly',0,1,3),(765,358,39,'nomeasure',0,0,NULL),(766,358,34,'annual',0,1,4),(767,358,36,'annual',0,1,4),(768,358,38,'nomeasure',0,0,NULL),(769,358,37,'nomeasure',0,0,NULL),(770,358,20,'nomeasure',0,0,NULL),(771,358,21,'nomeasure',0,0,NULL),(772,359,17,'annual',0,1,25),(773,359,19,'annual',0,1,200),(774,359,18,'annual',0,1,150),(775,359,56,'monthly',0,1,4),(776,359,55,'monthly',0,1,NULL),(777,359,24,'annual',0,1,2),(778,359,23,'monthly',0,1,3),(779,359,39,'nomeasure',0,0,NULL),(780,359,34,'annual',0,1,4),(781,359,36,'annual',0,1,4),(782,359,38,'nomeasure',0,0,NULL),(783,359,37,'nomeasure',0,0,NULL),(784,359,21,'nomeasure',0,0,NULL);
/*!40000 ALTER TABLE `stack_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_factory`
--

DROP TABLE IF EXISTS `sub_factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_factory` (
  `sub_factory_id` int NOT NULL AUTO_INCREMENT,
  `factory_id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`sub_factory_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_subFactory_factory_id_idx` (`factory_id`),
  CONSTRAINT `fk_subFactory_factory_id` FOREIGN KEY (`factory_id`) REFERENCES `factory` (`factory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_factory`
--

LOCK TABLES `sub_factory` WRITE;
/*!40000 ALTER TABLE `sub_factory` DISABLE KEYS */;
INSERT INTO `sub_factory` VALUES (16,1,'도장 3공장'),(17,1,'의장 3공장'),(18,2,'도장 41공장'),(19,2,'의장 41공장'),(20,2,'도장 42공장'),(21,2,'의장 42공장'),(22,2,'42창고'),(23,2,'SUB장'),(24,3,'단조 공장'),(25,3,'블록 1공장'),(26,3,'블록 2공장'),(27,3,'케이스 1공장'),(28,3,'케이스 2공장'),(29,3,'헤드 1공장'),(30,3,'헤드 2공장');
/*!40000 ALTER TABLE `sub_factory` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplace`
--

LOCK TABLES `workplace` WRITE;
/*!40000 ALTER TABLE `workplace` DISABLE KEYS */;
INSERT INTO `workplace` VALUES (2,7,'(주)동헌레미콘 양산2공장','부산 강서구 명동길 47 (지사동) 2층','2024-10-29'),(3,6,'삼양소재화학(주)','경남 양산시 유산동 462-1','2024-10-29'),(4,5,'에이치디현대중공업','울산 동구 방어진순환도로 140 (방어동)','2024-10-29'),(5,4,'(주) 현대미포조선','울산 동구 방어진순환도로 100 (방어동)','2024-10-29'),(6,4,'(주) 현대미포조선 용연공장','울산 남구 처용로 800 (황성동)','2024-10-29'),(7,4,'(주) 현대미포조선 모화공장','경북 경주시 외동읍 문산리 804-3 ','2024-10-29'),(8,4,'(주) 현대미포조선 온산공장','울산 울주군 온산읍 산암로 487','2024-10-29'),(9,3,'(주) 넥센','경남 김해시 김해대로 2595 (안동)','2024-10-29'),(10,2,'현대자동차(주) 울산공장','울산 북구 염포로 700 (양정동)','2024-10-29'),(15,7,'(주)동헌레미콘','부산 강서구 명동길 47 (지사동) 2층','2024-11-20'),(16,42,'(주) 삼비','부산 부산진구 중앙대로 627 (범천동)','2024-11-20'),(30,53,'다모야 부산지점','부산진구 동평로 291번길 30 (103-403)','2024-11-21'),(31,54,'S-OIL 온산공장','울산 울주군 온산읍 온산로 68','2024-12-03');
/*!40000 ALTER TABLE `workplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ensolution'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `reset_is_completed_all_cycles` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `reset_is_completed_all_cycles` ON SCHEDULE EVERY 1 DAY STARTS '2024-12-10 20:12:52' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE stack_measurement
SET is_completed = 0
WHERE (cycle_type = 'montly' AND DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY) = LAST_DAY(DATE_ADD(CURRENT_DATE, INTERVAL -1 MONTH)))
   OR (cycle_type = 'quarterly' AND MONTH(DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY)) IN (3, 6, 9, 12) AND DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY) = LAST_DAY(DATE_ADD(CURRENT_DATE, INTERVAL -1 MONTH)))
   OR (cycle_type = 'semiannual' AND MONTH(DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY)) IN (6, 12) AND DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY) = LAST_DAY(DATE_ADD(CURRENT_DATE, INTERVAL -1 MONTH)))
   OR (cycle_type = 'annual' AND DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY) = '2024-12-31') */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'ensolution'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 19:35:46
