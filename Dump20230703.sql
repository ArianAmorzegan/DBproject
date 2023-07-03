-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: University
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `Attendance`
--

DROP TABLE IF EXISTS `Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `sectid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Attendance_1_idx` (`sectid`),
  CONSTRAINT `fk_Attendance_1` FOREIGN KEY (`sectid`) REFERENCES `Section_Student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance`
--

LOCK TABLES `Attendance` WRITE;
/*!40000 ALTER TABLE `Attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course` (
  `id` varchar(7) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `did` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Course_1_idx` (`did`),
  CONSTRAINT `fk_Course_1` FOREIGN KEY (`did`) REFERENCES `Department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES ('1','shabake',3,0),('2','os',3,0),('3','sazeh',3,2);
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `did` int NOT NULL,
  `dname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (0,'computer'),(1,'mechanic'),(2,'cilvi');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evaluation`
--

DROP TABLE IF EXISTS `Evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evaluation` (
  `id` int NOT NULL,
  `score` int DEFAULT NULL,
  `sectstuid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Evaluation_1_idx` (`sectstuid`),
  CONSTRAINT `fk_Evaluation_1` FOREIGN KEY (`sectstuid`) REFERENCES `Section_Student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evaluation`
--

LOCK TABLES `Evaluation` WRITE;
/*!40000 ALTER TABLE `Evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food`
--

DROP TABLE IF EXISTS `Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Food` (
  `name` varchar(25) NOT NULL,
  `price` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food`
--

LOCK TABLES `Food` WRITE;
/*!40000 ALTER TABLE `Food` DISABLE KEYS */;
/*!40000 ALTER TABLE `Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food_Reserve`
--

DROP TABLE IF EXISTS `Food_Reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Food_Reserve` (
  `fnane` varchar(25) NOT NULL,
  `sid` varchar(10) NOT NULL,
  PRIMARY KEY (`fnane`,`sid`),
  KEY `fk_Food_Reserve_1_idx` (`sid`),
  CONSTRAINT `fk_Food_Reserve_1` FOREIGN KEY (`sid`) REFERENCES `Student` (`id`),
  CONSTRAINT `fk_Food_Reserve_2` FOREIGN KEY (`fnane`) REFERENCES `Food` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_Reserve`
--

LOCK TABLES `Food_Reserve` WRITE;
/*!40000 ALTER TABLE `Food_Reserve` DISABLE KEYS */;
/*!40000 ALTER TABLE `Food_Reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instructor` (
  `id` varchar(10) NOT NULL,
  `room_no` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Instructor_1` FOREIGN KEY (`id`) REFERENCES `Person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES ('4567891234',5);
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `id` varchar(10) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `dep` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Person_1_idx` (`dep`),
  CONSTRAINT `fk_Person_1` FOREIGN KEY (`dep`) REFERENCES `Department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES ('1234567891','arian','amorzegan',21,'','',0),('2345678912','iman','ras',20,'','',1),('3456789123','nima','alavi',22,'','',0),('4567891234','ali','hadad',45,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Section` (
  `id` varchar(7) NOT NULL,
  `class_no` int DEFAULT NULL,
  `final_date` datetime DEFAULT NULL,
  `year` int DEFAULT NULL,
  `semester` tinyint DEFAULT NULL,
  `courseid` varchar(7) DEFAULT NULL,
  `instructorid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Section_2_idx` (`courseid`),
  CONSTRAINT `fk_Section_1` FOREIGN KEY (`id`) REFERENCES `Instructor` (`id`),
  CONSTRAINT `fk_Section_2` FOREIGN KEY (`courseid`) REFERENCES `Course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section_Student`
--

DROP TABLE IF EXISTS `Section_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Section_Student` (
  `id` varchar(10) NOT NULL,
  `sectid` varchar(7) DEFAULT NULL,
  `semstuid` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `Score` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Section_Student_2_idx` (`sectid`),
  KEY `fk_Section_Student_1_idx` (`semstuid`),
  CONSTRAINT `fk_Section_Student_1` FOREIGN KEY (`semstuid`) REFERENCES `Semester_Student` (`idSemester_Student`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Section_Student_2` FOREIGN KEY (`sectid`) REFERENCES `Section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section_Student`
--

LOCK TABLES `Section_Student` WRITE;
/*!40000 ALTER TABLE `Section_Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Section_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Semester_Student`
--

DROP TABLE IF EXISTS `Semester_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Semester_Student` (
  `idSemester_Student` int NOT NULL,
  `stuid` varchar(10) DEFAULT NULL,
  `units` int DEFAULT NULL,
  `avg` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `semester` tinyint DEFAULT NULL,
  `secstuid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idSemester_Student`),
  KEY `fk_Semester_Student_1_idx` (`stuid`),
  KEY `fk_Semester_Student_2_idx` (`secstuid`),
  CONSTRAINT `fk_Semester_Student_1` FOREIGN KEY (`stuid`) REFERENCES `Student` (`sid`),
  CONSTRAINT `fk_Semester_Student_2` FOREIGN KEY (`secstuid`) REFERENCES `Section_Student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Semester_Student`
--

LOCK TABLES `Semester_Student` WRITE;
/*!40000 ALTER TABLE `Semester_Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Semester_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `id` varchar(10) NOT NULL,
  `sid` varchar(10) DEFAULT NULL,
  `avg` int DEFAULT '0',
  `units` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `foriegn` (`sid`),
  CONSTRAINT `fk_Student_1` FOREIGN KEY (`id`) REFERENCES `Person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('1234567891','9922762399',0,0),('2345678912','9922752487',0,0);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-03  4:00:51
