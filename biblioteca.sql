-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `isbn` varchar(13) NOT NULL,
  `title` varchar(100) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('9780132350884','Clean Code',47.50,67.00,0),('9780133499049','Computer Organization and Design ARM Edition',63.74,99.99,0),('9780134092661','Database System Concepts',146.29,199.99,0),('9780134092669','Computer Networking: A Top-Down Approach',146.29,199.99,0),('9780321963599','Operating System Concepts',68.29,99.99,0),('9780596005436','jQuery in Action',41.75,59.00,0),('9780596009205','Design Patterns',54.23,72.50,0),('9780596100469','Learning PHP, MySQL & JavaScript',29.69,39.99,0),('9780596158101','Head First Python',26.39,38.00,0),('9780596516308','Data Structures and Algorithms in Python',41.57,59.99,0),('9780596516499','Python Pocket Reference',9.56,14.50,0),('9780596528126','Python Cookbook',31.19,44.99,0),('9781119543451','System Design Interview',47.99,67.99,0),('9781234569999','Nuevo Libro Prueba',19.99,29.99,5),('9781329259621','Python Crash Course',29.86,42.00,0),('9781449325862','jQuery Cookbook',38.23,54.99,0),('9781449331818','Learning JavaScript Design Patterns',25.19,37.50,0),('9781449337711','Eloquent JavaScript',33.29,49.95,0),('9781449341506','PHP: The Right Way',24.75,35.00,0),('9781449365035','Learning jQuery - Fourth Edition',29.74,39.99,0),('9781449399861','React Quickly',23.75,34.00,0),('9781484207466','Mastering React Test-Driven Development',29.69,39.99,0),('9781484237182','Hands-On Data Structures and Algorithms with Python',47.59,66.99,0),('9781491903996','Algorithms Unlocked',22.39,31.99,0),('9781491904244','You Don\'t Know JS',29.69,39.99,0),('9781491908914','Modern PHP',30.79,44.99,0),('9781491929124','Web Scalability for Startup Engineers',28.04,39.99,0),('9781491946008','Python Tricks',26.39,38.00,0),('9781491950357','Building Microservices',31.49,44.99,0),('9781491951704','Fullstack React',30.79,44.99,0),('9781491953825','Automate the Boring Stuff With Python',16.99,24.95,0),('9781491972346','Cracking the Coding Interview',35.27,49.95,0),('9781492051702','Designing Event-Driven Systems',28.04,39.99,0),('9781492056328','Distributed Systems',47.49,66.99,0),('9781492056359','Designing Data-Intensive Applications',47.99,66.99,0),('9781492057287','Leadership and Self-Deception',14.99,21.99,0),('9781492070123','Serious Python',47.50,67.00,0),('9781492070178','The Manager\'s Path',31.49,44.99,0),('9781617292286','Grokking Algorithms',26.59,37.99,0),('9781617292422','Pro React',20.70,34.99,0),('9781680506384','Site Reliability Engineering',48.74,69.99,0),('9781786468390','The Road to learn React',29.69,39.99,0),('9781788839305','React Design Patterns and Best Practices',41.64,59.99,0),('9781789347999','Kubernetes Best Practices',41.64,59.99,0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(13) NOT NULL,
  `transaction_type` enum('sale','supply') NOT NULL,
  `transaction_date` date NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'9781234569999','supply','2023-11-18',10),(2,'9781234569999','sale','2023-11-18',5);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 18:50:01
