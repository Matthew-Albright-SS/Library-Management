-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library
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
-- Table structure for table `tbl_author`
--

DROP TABLE IF EXISTS `tbl_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_author` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `authorName` varchar(45) NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_author`
--

LOCK TABLES `tbl_author` WRITE;
/*!40000 ALTER TABLE `tbl_author` DISABLE KEYS */;
INSERT INTO `tbl_author` VALUES (3,'Art'),(4,'Lenna'),(6,'Simona'),(7,'Mitsue'),(8,'Leota'),(9,'Sage'),(10,'Kris'),(11,'Minna'),(12,'Abel'),(13,'Kiley'),(14,'Graciela'),(15,'Kammy'),(18,'Jacob'),(19,'Test'),(21,'Test'),(22,'Testi');
/*!40000 ALTER TABLE `tbl_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book`
--

DROP TABLE IF EXISTS `tbl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `pubId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `fk_publisher` (`pubId`),
  CONSTRAINT `fk_publisher` FOREIGN KEY (`pubId`) REFERENCES `tbl_publisher` (`publisherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1511 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book`
--

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
INSERT INTO `tbl_book` VALUES (300,'Enzymes',3),(600,'Diabetes',6),(700,'Graphene',7),(800,'Graphene',8),(900,'Chromatin',9),(1000,'Dysphagia',10),(1100,'Pathology',11),(1200,'Photonics',12),(1300,'Remington',13),(1400,'Dermoscopy',14),(1500,'Diastology',13),(1509,'Test',12),(1510,'Test',8);
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_authors`
--

DROP TABLE IF EXISTS `tbl_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book_authors` (
  `bookId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`bookId`,`authorId`),
  KEY `fk_tbl_book_authors_tbl_author1_idx` (`authorId`),
  CONSTRAINT `fk_tbl_book_authors_tbl_author1` FOREIGN KEY (`authorId`) REFERENCES `tbl_author` (`authorId`),
  CONSTRAINT `fk_tbl_book_authors_tbl_book1` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_authors`
--

LOCK TABLES `tbl_book_authors` WRITE;
/*!40000 ALTER TABLE `tbl_book_authors` DISABLE KEYS */;
INSERT INTO `tbl_book_authors` VALUES (300,3),(600,6),(700,7),(800,8),(900,9),(1000,10),(1100,11),(1200,12),(1300,13),(1400,14),(1500,15),(1509,21),(1510,22);
/*!40000 ALTER TABLE `tbl_book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_copies`
--

DROP TABLE IF EXISTS `tbl_book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book_copies` (
  `bookId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `noOfCopies` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`,`branchId`),
  KEY `fk_bc_book` (`bookId`),
  KEY `fk_bc_branch` (`branchId`),
  CONSTRAINT `fk_bc_book` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bc_branch` FOREIGN KEY (`branchId`) REFERENCES `tbl_library_branch` (`branchId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_copies`
--

LOCK TABLES `tbl_book_copies` WRITE;
/*!40000 ALTER TABLE `tbl_book_copies` DISABLE KEYS */;
INSERT INTO `tbl_book_copies` VALUES (600,8,1),(700,1,2),(800,6,2),(900,4,3),(1000,5,1),(1200,8,6),(1300,5,1),(1400,5,5);
/*!40000 ALTER TABLE `tbl_book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_genres`
--

DROP TABLE IF EXISTS `tbl_book_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book_genres` (
  `genre_id` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  PRIMARY KEY (`genre_id`,`bookId`),
  KEY `fk_tbl_book_genres_tbl_book1_idx` (`bookId`),
  CONSTRAINT `fk_tbl_book_genres_tbl_book1` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`),
  CONSTRAINT `fk_tbl_book_genres_tbl_genre1` FOREIGN KEY (`genre_id`) REFERENCES `tbl_genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_genres`
--

LOCK TABLES `tbl_book_genres` WRITE;
/*!40000 ALTER TABLE `tbl_book_genres` DISABLE KEYS */;
INSERT INTO `tbl_book_genres` VALUES (7,300),(8,600),(1,700),(2,800),(9,900),(5,1000),(4,1100),(8,1200),(6,1300),(8,1400),(4,1500);
/*!40000 ALTER TABLE `tbl_book_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_loans`
--

DROP TABLE IF EXISTS `tbl_book_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book_loans` (
  `bookId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `cardNo` int(11) NOT NULL,
  `dateOut` datetime NOT NULL,
  `dueDate` datetime DEFAULT NULL,
  `returned` datetime DEFAULT NULL,
  PRIMARY KEY (`bookId`,`branchId`,`cardNo`,`dateOut`),
  KEY `fk_bl_book` (`bookId`),
  KEY `fk_bl_branch` (`branchId`),
  KEY `fk_bl_borrower` (`cardNo`),
  CONSTRAINT `fk_bl_book` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_borrower` FOREIGN KEY (`cardNo`) REFERENCES `tbl_borrower` (`cardNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_branch` FOREIGN KEY (`branchId`) REFERENCES `tbl_library_branch` (`branchId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_loans`
--

LOCK TABLES `tbl_book_loans` WRITE;
/*!40000 ALTER TABLE `tbl_book_loans` DISABLE KEYS */;
INSERT INTO `tbl_book_loans` VALUES (700,1,1,'2019-08-18 18:35:58','2021-12-02 00:00:00','2019-08-18 18:36:34'),(700,1,1,'2019-08-19 09:17:39','2020-08-25 00:00:00','2019-08-19 09:26:22'),(700,1,1,'2019-08-19 11:38:10','2019-08-26 00:00:00','2019-08-19 11:38:22'),(700,1,1,'2019-08-19 11:39:42','2020-08-25 00:00:00','2019-08-19 11:39:58'),(1000,5,1,'2019-08-19 12:57:56','2020-08-25 00:00:00','2019-08-19 12:58:21');
/*!40000 ALTER TABLE `tbl_book_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_borrower`
--

DROP TABLE IF EXISTS `tbl_borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_borrower` (
  `cardNo` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_borrower`
--

LOCK TABLES `tbl_borrower` WRITE;
/*!40000 ALTER TABLE `tbl_borrower` DISABLE KEYS */;
INSERT INTO `tbl_borrower` VALUES (1,'Harrison','759 Eldora St','596724779'),(2,'Johnna','5 S Colorado Blvd #449','477382909'),(3,'Buddy','944 Gaither Dr','608767717'),(4,'Dalene','66552 Malone Rd','680796506'),(5,'Jerry','77 Massillon Rd #822','302559754'),(6,'Haydee','25346 New Rd','386729629'),(7,'Joseph','60 Fillmore Ave','669090250'),(8,'Deonna','57 Haven Ave #90','283486043'),(9,'Raymon','6538 E Pomona St #60','644997321'),(10,'Alecia','6535 Joyce St','288874111'),(12,'Detra','96950 Hidden Ln','467093947'),(13,'Terrilyn','3718 S Main St','733193284'),(14,'Salome','9677 Commerce Dr','805481043'),(15,'Garry','5 Green Pond Rd #4','655089761'),(18,'James','K','93839383'),(20,'Judy','324 West','876678765'),(22,'tEST','T','84848484');
/*!40000 ALTER TABLE `tbl_borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genre`
--

DROP TABLE IF EXISTS `tbl_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genre`
--

LOCK TABLES `tbl_genre` WRITE;
/*!40000 ALTER TABLE `tbl_genre` DISABLE KEYS */;
INSERT INTO `tbl_genre` VALUES (1,'Horror'),(2,'Music'),(3,'Cooking'),(4,'Fiction'),(5,'Health'),(6,'Sports'),(7,'Motors'),(8,'History'),(9,'Geography'),(10,'Games'),(11,'Computer Science'),(12,'Law'),(13,'Physics'),(14,'Math'),(15,'Science');
/*!40000 ALTER TABLE `tbl_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_library_branch`
--

DROP TABLE IF EXISTS `tbl_library_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_library_branch` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT,
  `branchName` varchar(45) DEFAULT NULL,
  `branchAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_library_branch`
--

LOCK TABLES `tbl_library_branch` WRITE;
/*!40000 ALTER TABLE `tbl_library_branch` DISABLE KEYS */;
INSERT INTO `tbl_library_branch` VALUES (1,'University Library','VA'),(4,'Arkansas State Library','Ney York'),(5,'County Library','McLean VA'),(6,'California State Library','Sacremento California'),(7,'Colorado State Library','Denver Colorado'),(8,'Connecticut State Library','Hartford Conneticut'),(9,'Delaware Libraries','Dover Delaware'),(11,'Illinois State Library','Springfield Illinois'),(12,'Indiana State Library','Indianapolis Indiana'),(13,'Kentucky Department','Frankfort Kentucky'),(14,'Libraries Linking Idaho','Boise Idaho'),(15,'Library of Michigan','Lansing Michigan'),(19,'testing','testing');
/*!40000 ALTER TABLE `tbl_library_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_publisher`
--

DROP TABLE IF EXISTS `tbl_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_publisher` (
  `publisherId` int(11) NOT NULL AUTO_INCREMENT,
  `publisherName` varchar(45) NOT NULL,
  `publisherAddress` varchar(45) DEFAULT NULL,
  `publisherPhone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_publisher`
--

LOCK TABLES `tbl_publisher` WRITE;
/*!40000 ALTER TABLE `tbl_publisher` DISABLE KEYS */;
INSERT INTO `tbl_publisher` VALUES (2,'Benedict','4923 Carey Ave','787610023'),(3,'Alyce','3196 S Rider Trl','315315584'),(5,'Carey','87393 E Highland Rd','633972215'),(6,'Dottie','67 E Chestnut Hill Rd','435965693'),(7,'Deandrea','33 Lewis Rd #46','676329483'),(8,'Kimberlie','8100 Jacksonville Rd #7','382691949'),(9,'Martina','7 W Wabansia Ave #227','401108117'),(10,'Skye','25 Minters Chapel Rd #9','819610327'),(11,'Jade','6882 Torresdale Ave','528113015'),(12,'Charlene','985 E 6th Ave','491292371'),(13,'Geoffrey','7 West Ave #1','290474712'),(14,'Stevie','26659 N 13th St','679332468'),(15,'Pamella','669 Packerland Dr #1438','319185685'),(20,'Test','Test','83883838');
/*!40000 ALTER TABLE `tbl_publisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-19 13:35:32
