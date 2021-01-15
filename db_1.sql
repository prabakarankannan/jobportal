-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: jobportaldb
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(16) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'rohanverma@email.com','$2b$10$cc7ZwNs4BMhKD206eBmfUeYbWKiGTD26o0nb4HoVgaPC7.ayX7eFe','rZ632jgnFKNiCe8l'),(2,'pawannath@email.com','$2b$10$LLIAJlSawWAgFivF0wK3muH7GeDBXmzJ8N0HnOpuzzauVY99ERkUy','SAtyFykbOVUYctFB'),(4,'6bikramsutar@gmail.com','$2b$10$7Bli7GmYd0vqSaBNG6ILZe9ozKxK6yCeH05Y9BYiVD.SYgXgB63q.','NlbOt7bjpFFlAdDr'),(5,'prabaerode@gmail.com','$2b$10$Pi3gpS1M2cATxCh.IX36hO.soALJW7zZcCHgGWZ.9J/N9Ff71Odam','E4AHl5WeBcSQMRSq');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `message` varchar(1200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `jid` (`jid`),
  CONSTRAINT `Application_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `account` (`uid`),
  CONSTRAINT `Application_ibfk_2` FOREIGN KEY (`jid`) REFERENCES `job` (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,1,2,1,'Subject: Invitation to Interview\n\nDear Pawan\n\nThank you for applying.\n\nWe would like to invite you to come to our office to interview for the position. Your interview has been scheduled for Dec 1, 2019, 1 pm, at 123 Main Street, Silk board, Bangalore.\n\nPlease call me at 651-555-6666 or email me at rohanverma@email.com if you have any questions or need to reschedule.\n\nSincerely,\nRohan Verma\nCEO\nRohan Royals PVT. Ltd.'),(2,1,5,0,'undefined');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate` (
  `uid` int(11) NOT NULL,
  `dob` date NOT NULL,
  `experience` int(11) NOT NULL,
  `highestEducation` varchar(255) NOT NULL,
  UNIQUE KEY `uid` (`uid`),
  CONSTRAINT `Candidate_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `account` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (2,'1994-06-08',3,'B.Sc'),(5,'1984-07-11',10,'BE');
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `addedBy` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(600) NOT NULL,
  `location` varchar(600) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`jid`),
  KEY `addedBy` (`addedBy`),
  CONSTRAINT `Job_ibfk_1` FOREIGN KEY (`addedBy`) REFERENCES `account` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,1,'Java developer opennings in Bangalore','We are looking for expert Odoo developers (5+ years experience) to join our brand-new office in Bangalore, and build a world-class ERP solution for us on Odoo. We are a performance-based, data-driven, and fast-paced American e-commerce startup headquartered in Newport Beach, California that specializes in marketing and selling a unique portfolio of products to consumers online. ','bangalore','java'),(2,1,'Experienced Software Engineer wanted','Strong troubleshooting, debugging, and analytical skills. - Work closely with Architects, lead engineers and business on product design and features. - Mentor and coach junior engineers on various design and development aspects of big data platform. - Prototype ideas quickly using cutting edge technologies.','bangalore','c++'),(4,1,'Android developer recruitment in Kerala','Looking for very good and hard working fresh software developers who can learn quickly, different technologies and can do web and app development, DB, middle-ware and front end development.','kerala','fresher');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruiter`
--

DROP TABLE IF EXISTS `recruiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruiter` (
  `uid` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  UNIQUE KEY `uid` (`uid`),
  CONSTRAINT `Recruiter_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `account` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruiter`
--

LOCK TABLES `recruiter` WRITE;
/*!40000 ALTER TABLE `recruiter` DISABLE KEYS */;
INSERT INTO `recruiter` VALUES (1,'CEO',1,'Rohan Royals PVT. Ltd.');
/*!40000 ALTER TABLE `recruiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `role` int(11) NOT NULL,
  `address` varchar(600) NOT NULL,
  UNIQUE KEY `uid` (`uid`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `account` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Rohan Verma',9000889900,2,'bangalore'),(2,'Pawan Nath',9856883300,3,'bangalore'),(4,'bikram sutar',9113212980,1,'Bangalore'),(5,'Prabakaran Kannan',919739711141,3,'Bangalore');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-15 21:21:38
