-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: music
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_artist_id` int(11) NOT NULL,
  `album_title` varchar(45) NOT NULL,
  `album_year` int(11) NOT NULL,
  `album_type` varchar(45) NOT NULL,
  `album_rating` tinyint(4) NOT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE KEY `album_id_UNIQUE` (`album_id`),
  KEY `ALBUM_ARTIST_ID_REF_idx` (`album_artist_id`),
  CONSTRAINT `ALBUM_ARTIST_ID_REF` FOREIGN KEY (`album_artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,9,'justo lacinia',2003,'studio',5),(2,2,'in ante vestibulum ante',2002,'studio',1),(3,1,'erat tortor sollicitudin mi sit amet',1997,'compilation',5),(4,2,'ante ipsum primis',2003,'compilation',1),(5,9,'nulla tempus vivamus',2000,'studio',3),(6,5,'donec dapibus duis at',2002,'studio',5),(7,1,'leo odio porttitor id consequat in',2000,'studio',5),(8,2,'vestibulum',2004,'compilation',1),(9,6,'cursus urna ut tellus nulla ut',1998,'studio',4),(10,3,'ultrices phasellus id sapien',2003,'live',4),(11,5,'cras mi pede malesuada',1998,'compilation',5),(12,1,'habitasse platea dictumst',1999,'compilation',3),(13,7,'scelerisque quam turpis adipiscing',2002,'compilation',4),(14,2,'duis faucibus',2004,'live',4),(15,3,'a',2002,'studio',1),(16,3,'sed ante vivamus tortor',2005,'live',1),(17,10,'sed magna at nunc commodo',1999,'live',4),(18,4,'amet erat nulla tempus',2000,'studio',2),(19,9,'mauris ullamcorper',1995,'studio',5),(20,7,'montes nascetur ridiculus mus',2002,'compilation',1),(21,10,'mon',2001,'live',5),(22,10,'ieud',2003,'studio',5),(23,10,'dfjl',2019,'studio',5),(24,10,'al',2020,'studio',5),(25,10,'sdfkj',2009,'compilation',5),(26,10,'sdkjfg',2004,'compilation',5);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(45) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `artist_type` varchar(45) NOT NULL,
  PRIMARY KEY (`artist_id`),
  UNIQUE KEY `artist_id_UNIQUE` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Nolan-Wilkinson','German','Solo'),(2,'Bayer-Murazik','American','Band'),(3,'Champlin LLC','American','Solo'),(4,'Sanford, Kuhlman and Carter','English','Band'),(5,'Hudson-Paucek','American','Band'),(6,'Bednar and Sons','German','Solo'),(7,'Hodkiewicz-Gusikowski','American','Solo'),(8,'Satterfield-Hodkiewicz','German','Band'),(9,'Renner-Pacocha','English','Solo'),(10,'Prosacco LLC','English','Solo');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `track_id` int(11) NOT NULL AUTO_INCREMENT,
  `track_album_id` int(11) NOT NULL,
  `track_name` varchar(45) NOT NULL,
  `track_length` int(11) NOT NULL,
  `track_rating` tinyint(4) NOT NULL,
  `track_number` tinyint(4) NOT NULL,
  PRIMARY KEY (`track_id`),
  UNIQUE KEY `track_id_UNIQUE` (`track_id`),
  KEY `TRACK_ALBUM_ID_REF_idx` (`track_album_id`),
  CONSTRAINT `TRACK_ALBUM_ID_REF` FOREIGN KEY (`track_album_id`) REFERENCES `albums` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,5,'protocol',225,3,3),(2,3,'impactful',152,4,1),(3,10,'Right-sized',208,1,10),(4,10,'Ameliorated',265,2,9),(5,3,'Visionary',284,1,2),(6,2,'hardware',183,1,9),(7,9,'optimal',205,5,6),(8,9,'extranet',184,2,2),(9,9,'challenge',272,1,12),(10,6,'process improvement',128,3,8),(11,1,'protocol',250,3,5),(12,9,'database',131,2,3),(13,7,'concept',196,4,7),(14,9,'functionalities',224,1,4),(15,6,'empowering',208,2,9),(16,2,'methodical',281,4,5),(17,2,'Quality-focused',112,3,8),(18,6,'process improvement',110,3,11),(19,10,'local area network',281,4,8),(20,5,'Switchable',129,5,4),(21,6,'groupware',167,2,6),(22,7,'exuding',291,4,1),(23,2,'conglomeration',234,5,6),(24,7,'Graphic Interface',281,5,5),(25,8,'methodology',127,5,9),(26,9,'installation',254,4,9),(27,4,'exuding',175,2,3),(28,2,'composite',298,2,2),(29,1,'extranet',295,1,10),(30,5,'Exclusive',128,2,9),(31,1,'hub',185,4,3),(32,7,'optimal',168,4,9),(33,6,'user-facing',177,4,3),(34,9,'bandwidth-monitored',194,3,13),(35,1,'Realigned',132,2,6),(36,6,'composite',232,3,10),(37,4,'asymmetric',250,1,8),(38,8,'secondary',115,3,5),(39,1,'dedicated',263,4,7),(40,4,'adapter',212,5,1),(41,6,'Adaptive',212,1,7),(42,9,'Intuitive',278,3,10),(43,7,'hybrid',227,4,8),(44,3,'background',129,5,7),(45,9,'disintermediate',183,1,1),(46,3,'Cloned',241,2,3),(47,1,'methodology',176,5,1),(48,9,'migration',260,1,11),(49,10,'maximized',244,2,5),(50,8,'6th generation',283,1,1),(51,8,'value-added',278,2,10),(52,7,'implementation',198,5,3),(53,10,'solution',297,5,3),(54,3,'benchmark',186,5,6),(55,2,'success',127,4,7),(56,10,'implementation',238,4,7),(57,10,'open system',186,5,6),(58,4,'composite',239,5,4),(59,8,'protocol',191,5,2),(60,6,'hybrid',252,3,12),(61,10,'Future-proofed',134,3,1),(62,3,'maximized',246,4,9),(63,9,'architecture',168,2,8),(64,1,'Visionary',295,5,12),(65,7,'implementation',172,2,4),(66,2,'Multi-channelled',220,5,1),(67,3,'Multi-tiered',137,3,8),(68,1,'Centralized',242,5,2),(69,8,'Sharable',296,2,4),(70,10,'5th generation',184,5,2),(71,6,'definition',197,5,5),(72,2,'internet solution',115,4,11),(73,5,'Monitored',261,4,10),(74,1,'asynchronous',112,1,4),(75,8,'asymmetric',292,4,3),(76,1,'functionalities',126,4,11),(77,8,'solution-oriented',158,4,7),(78,7,'algorithm',289,4,2),(79,8,'Horizontal',157,1,8),(80,4,'asymmetric',289,2,9),(81,5,'neutral',155,2,8),(82,2,'Distributed',202,5,3),(83,1,'heuristic',116,4,8),(84,6,'multi-state',280,1,1),(85,7,'definition',287,5,6),(86,9,'task-force',195,2,5),(87,6,'alliance',168,5,4),(88,10,'clear-thinking',260,2,4),(89,10,'matrices',293,1,11),(90,3,'Ergonomic',142,4,4),(91,3,'superstructure',298,1,5),(92,4,'Synergistic',145,1,5),(93,4,'static',227,4,10),(94,4,'stable',218,2,7),(95,6,'functionalities',272,1,2),(96,9,'Inverse',117,1,7),(97,8,'cohesive',137,1,6),(98,2,'Networked',285,2,4),(99,4,'Up-sized',279,3,6),(100,1,'system engine',280,5,9);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 12:14:38
