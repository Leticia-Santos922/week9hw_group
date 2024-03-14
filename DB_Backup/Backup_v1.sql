CREATE DATABASE  IF NOT EXISTS `library_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `house_number` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postcode` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'20','Aldwick Bay Estate','Bognor Regis','P021 4ES','West Sussex'),(2,'18','Woodland Vale Road','Horsham','RH13 6LU','West Sussex'),(3,'90','Abbey Road','Bognor Regis','PO21 1AA','West Sussex'),(4,'33','Gresham Road','Littlehampton','RH13 2BB','West Sussex'),(5,'78','Conrad Road','Shoreham-by-Sea','BN11 3CC','West Sussex'),(6,'42','Celia Street','Horsham','GU14 4DD','West Sussex'),(7,'68','German Street','Haywards Heath','KT17 5EE','West Sussex'),(8,'638','Vernard Road','Burgess Hill','TN22 6FF','West Sussex'),(9,'910','Cesar Street','Chichester','WA14 7GG','West Sussex'),(10,'46','French Court','Hurstpierpoint','IP23 8HH','West Sussex'),(11,'31','Abbey Estate','Southwick','WR15 9II','West Sussex'),(12,'17','Ebby Street','Selsey','E11 1JJ','West Sussex'),(13,'56','Harrington Street','Westergate','HU12 2KK','West Sussex'),(14,'756','Belgrave Court','Chichester','LS13 3LL','West Sussex'),(15,'67','Ransod Street','Hurstpierpoint','DE14 4MM','West Sussex'),(16,'12','Camilla Road','Southwick','FY15 5NN','West Sussex');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_member`
--

DROP TABLE IF EXISTS `library_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date_joined` date DEFAULT (curdate()),
  PRIMARY KEY (`member_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `library_member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_member`
--

LOCK TABLES `library_member` WRITE;
/*!40000 ALTER TABLE `library_member` DISABLE KEYS */;
INSERT INTO `library_member` VALUES (1,1,1,'2024-02-27'),(2,2,1,'2019-05-14'),(3,3,1,'2017-02-01'),(4,4,1,'2016-08-23'),(5,5,1,'2024-03-01'),(6,6,1,'2020-10-08'),(7,8,1,'2024-02-27'),(8,9,1,'2019-04-05'),(9,11,1,'2019-03-08'),(10,12,1,'2017-03-31'),(11,14,1,'2024-01-10'),(12,7,0,'2019-05-14'),(13,10,0,'2024-02-27'),(14,13,0,'2016-06-08');
/*!40000 ALTER TABLE `library_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `hire_date` date DEFAULT (curdate()),
  `job_title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,15,'2024-02-27','Chief Librarian'),(2,16,'2019-05-14','Librarian'),(3,17,'2017-02-01','Librarian'),(4,18,'2016-08-23','Library Assistant'),(5,19,'2024-03-01','Library Assistant'),(6,20,'2020-12-01','Library Technician');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `address_id` int DEFAULT NULL,
  `firstname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Robert','Smith','bob.smith@gmail.com','07498671752'),(2,2,'Simon','Gallup','simon.gallup@hotmail.com','07373321759'),(3,1,'Mary','Smith','mary.smith@gmail.com','07498671752'),(4,3,'Rebecca','Brown','rebeccabrown_201@outlook.com','07263881751'),(5,3,'Katy','Brown','katyb@outlook.com','07367358926'),(6,3,'David','Brown','david.brown@yahoo.co.uk','07456378752'),(7,3,'Natalia','Brown','natbrown1@yahoo.co.uk','07463673812'),(8,4,'Claudia','Garcia','clayagari@outlook.com','07429490283'),(9,5,'Sara','Stewart','sarastew01@yahoo.co.uk','07327477920'),(10,6,'Tiffany','Johnson','tiffanyjohns88@gmail.com','07492446222'),(11,7,'Angela','Edwards','angedwards_1@outlook.com','07498671752'),(12,8,'Freddie','Dulaney','fred_dd01@gmail.com','07373382259'),(13,9,'Paul','Metcaff','paul02metcaff@hotmail.com','07498232736'),(14,10,'Pablo','Rodriguez','pabrodlo.34@gmail.com','07493739302'),(15,11,'Nancy','Lyons','nancy.lyons@outlook.com','07372382181'),(16,12,'Francisco','Alessio','fransico_alesso03@yahoo.co.uk','07492157392'),(17,13,'Raphael','de los Reyes','fransico_alesso03@yahoo.co.uk','07492157392'),(18,14,'Anthony','Granedo','antgren_26@gmail.com','07373334222'),(19,15,'Veronica','Gil','verogil_1@hotmail.com','07437134252'),(20,16,'Angelo','Black','angelo.black@gmail.com','07498246399');
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

-- Dump completed on 2024-03-14 22:05:14
