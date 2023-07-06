CREATE DATABASE  IF NOT EXISTS `kir2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kir2`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: kir2
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Temporary view structure for view `a_students`
--

DROP TABLE IF EXISTS `a_students`;
/*!50001 DROP VIEW IF EXISTS `a_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `a_students` AS SELECT 
 1 AS `fname`,
 1 AS `lname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `sectid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Attendance_1_idx` (`sectid`),
  CONSTRAINT `fk_Attendance_1` FOREIGN KEY (`sectid`) REFERENCES `section_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` varchar(7) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `did` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Course_1_idx` (`did`),
  CONSTRAINT `fk_Course_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('1','shabake',3,0),('2','os',3,0),('3','sazeh',3,2),('4','amdad',4,1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `course_dep`
--

DROP TABLE IF EXISTS `course_dep`;
/*!50001 DROP VIEW IF EXISTS `course_dep`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `course_dep` AS SELECT 
 1 AS `dep_name`,
 1 AS `course_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `did` int NOT NULL,
  `dname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (0,'computer'),(1,'mechanic'),(2,'cilvi');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluation` (
  `id` int NOT NULL,
  `score` int DEFAULT NULL,
  `sectstuid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Evaluation_1_idx` (`sectstuid`),
  CONSTRAINT `fk_Evaluation_1` FOREIGN KEY (`sectstuid`) REFERENCES `section_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `name` varchar(25) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES ('mahi',6000,'2020-10-10',1),('ghorme',6000,'2022-10-10',2),('kabab',8000,'2022-10-10',3),('ghayme',4000,'2023-10-10',4);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `food_reserv_count`
--

DROP TABLE IF EXISTS `food_reserv_count`;
/*!50001 DROP VIEW IF EXISTS `food_reserv_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `food_reserv_count` AS SELECT 
 1 AS `food_id`,
 1 AS `reserv_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `food_reserve`
--

DROP TABLE IF EXISTS `food_reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_reserve` (
  `fid` int NOT NULL,
  `sid` varchar(10) NOT NULL,
  PRIMARY KEY (`fid`,`sid`),
  KEY `fk_Food_Reserve_1_idx` (`sid`),
  CONSTRAINT `fk_Food_Reserve_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `fk_Food_Reserve_2` FOREIGN KEY (`fid`) REFERENCES `food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_reserve`
--

LOCK TABLES `food_reserve` WRITE;
/*!40000 ALTER TABLE `food_reserve` DISABLE KEYS */;
INSERT INTO `food_reserve` VALUES (2,'9922752487'),(4,'9922752487'),(1,'9922762399'),(2,'9922762399'),(3,'9922762399');
/*!40000 ALTER TABLE `food_reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id` varchar(10) NOT NULL,
  `room_no` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Instructor_1` FOREIGN KEY (`id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('4567891234',5,NULL),('5',10,NULL),('7',4,NULL),('8',2,NULL);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mashroot`
--

DROP TABLE IF EXISTS `mashroot`;
/*!50001 DROP VIEW IF EXISTS `mashroot`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mashroot` AS SELECT 
 1 AS `fname`,
 1 AS `lname`,
 1 AS `avg`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `passed_courses`
--

DROP TABLE IF EXISTS `passed_courses`;
/*!50001 DROP VIEW IF EXISTS `passed_courses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passed_courses` AS SELECT 
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` varchar(10) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `dep` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Person_1_idx` (`dep`),
  CONSTRAINT `fk_Person_1` FOREIGN KEY (`dep`) REFERENCES `department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL),('1234567891','kamran','amorzegan',23,'','',0),('2345678912','iman','ras',20,'','',1),('3456789123','nima','alavi',32,'','',0),('4567891234','ali','hadad',45,NULL,NULL,2),('5','kamran','ads',55,'','',0),('6','mohammadreza','zaman',32,NULL,NULL,0),('7','alireza','taleb',32,NULL,NULL,1),('8','meeoosa','babayi',29,NULL,NULL,0);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!50001 DROP VIEW IF EXISTS `schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schedule` AS SELECT 
 1 AS `stid`,
 1 AS `course_id`,
 1 AS `class_room`,
 1 AS `teacher_name`,
 1 AS `department_id`,
 1 AS `course_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `id` varchar(7) NOT NULL,
  `class_no` int DEFAULT NULL,
  `final_date` datetime DEFAULT NULL,
  `year` int DEFAULT NULL,
  `semester` tinyint DEFAULT NULL,
  `courseid` varchar(7) DEFAULT NULL,
  `instructorid` varchar(10) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Section_2_idx` (`courseid`),
  KEY `fk_Section_1_idx` (`instructorid`),
  CONSTRAINT `fk_Section_1` FOREIGN KEY (`instructorid`) REFERENCES `instructor` (`id`),
  CONSTRAINT `fk_Section_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('1',25,'1000-01-01 00:00:00',1401,1,'1','5','2'),('2',25,'1500-01-01 00:00:00',1402,1,'1','8','3'),('3',25,NULL,1401,1,'4','7','4'),('4',20,NULL,1401,1,'2','5','5'),('5',46,'1500-01-01 12:00:00',1402,1,'3','7','3');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_student`
--

DROP TABLE IF EXISTS `section_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_student` (
  `id` varchar(10) NOT NULL,
  `sectid` varchar(7) DEFAULT NULL,
  `semstuid` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `Score` int DEFAULT NULL,
  `stid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Section_Student_2_idx` (`sectid`),
  KEY `fk_Section_Student_1_idx` (`semstuid`),
  KEY `fk_Section_Student_3_idx` (`stid`),
  CONSTRAINT `fk_Section_Student_1` FOREIGN KEY (`semstuid`) REFERENCES `semester_student` (`idSemester_Student`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Section_Student_2` FOREIGN KEY (`sectid`) REFERENCES `section` (`id`),
  CONSTRAINT `fk_Section_Student_3` FOREIGN KEY (`stid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_student`
--

LOCK TABLES `section_student` WRITE;
/*!40000 ALTER TABLE `section_student` DISABLE KEYS */;
INSERT INTO `section_student` VALUES ('11','4',5,1,18,'9922762399'),('12','1',1,0,0,'9922762399'),('13','3',4,1,14,'2'),('14','5',1,1,18,'2'),('7','3',4,1,14,'9922762399');
/*!40000 ALTER TABLE `section_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester_student`
--

DROP TABLE IF EXISTS `semester_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester_student` (
  `idSemester_Student` int NOT NULL,
  `stuid` varchar(10) DEFAULT NULL,
  `units` int DEFAULT NULL,
  `avg` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `semester` tinyint DEFAULT NULL,
  `units_take` int DEFAULT '0',
  PRIMARY KEY (`idSemester_Student`),
  KEY `fk_Semester_Student_1_idx` (`stuid`),
  CONSTRAINT `fk_Semester_Student_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester_student`
--

LOCK TABLES `semester_student` WRITE;
/*!40000 ALTER TABLE `semester_student` DISABLE KEYS */;
INSERT INTO `semester_student` VALUES (1,'9922762399',8,0,1401,1,9),(2,'9922762399',12,15,1401,2,0),(3,'9922762399',16,14,1402,1,0),(4,'9922752487',18,12,1401,1,0),(5,'2',10,14,1401,2,0);
/*!40000 ALTER TABLE `semester_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` varchar(10) NOT NULL,
  `sid` varchar(10) DEFAULT NULL,
  `average` int DEFAULT '0',
  `units` int DEFAULT '0',
  `balance` int DEFAULT NULL,
  `entry_year` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foriegn` (`sid`),
  CONSTRAINT `fk_Student_1` FOREIGN KEY (`id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1234567891','9922762399',0,10,12000,NULL),('2345678912','9922752487',18,9,NULL,NULL),('6','2',15,8,20000,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_food`
--

DROP TABLE IF EXISTS `student_food`;
/*!50001 DROP VIEW IF EXISTS `student_food`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_food` AS SELECT 
 1 AS `stid`,
 1 AS `food`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `teacher_course`
--

DROP TABLE IF EXISTS `teacher_course`;
/*!50001 DROP VIEW IF EXISTS `teacher_course`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teacher_course` AS SELECT 
 1 AS `teacher_name`,
 1 AS `course_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `under12`
--

DROP TABLE IF EXISTS `under12`;
/*!50001 DROP VIEW IF EXISTS `under12`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `under12` AS SELECT 
 1 AS `fname`,
 1 AS `lname`,
 1 AS `units`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `a_students`
--

/*!50001 DROP VIEW IF EXISTS `a_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `a_students` AS select `person`.`fname` AS `fname`,`person`.`lname` AS `lname` from (`person` join `student`) where ((`student`.`average` > 17) and (`person`.`id` = `student`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `course_dep`
--

/*!50001 DROP VIEW IF EXISTS `course_dep`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `course_dep` AS select `department`.`dname` AS `dep_name`,`course`.`name` AS `course_name` from (`department` join `course`) where (`course`.`did` = `department`.`did`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `food_reserv_count`
--

/*!50001 DROP VIEW IF EXISTS `food_reserv_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `food_reserv_count` AS select `food`.`id` AS `food_id`,count(0) AS `reserv_count` from ((`student` `st` join `food_reserve` `fres` on((`st`.`sid` = `fres`.`sid`))) join `food` on((`food`.`id` = `fres`.`fid`))) group by `food`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mashroot`
--

/*!50001 DROP VIEW IF EXISTS `mashroot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mashroot` AS select `person`.`fname` AS `fname`,`person`.`lname` AS `lname`,`semester_student`.`avg` AS `avg` from ((`person` join `student`) join `semester_student`) where ((`semester_student`.`avg` < 12) and (`semester_student`.`stuid` = `student`.`sid`) and (`person`.`id` = `student`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passed_courses`
--

/*!50001 DROP VIEW IF EXISTS `passed_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passed_courses` AS select `course`.`name` AS `name` from ((`course` join `section`) join `section_student` `ss`) where ((`ss`.`stid` = '2') and (`ss`.`status` = 1) and (`ss`.`Score` >= 10) and (`ss`.`sectid` = `section`.`id`) and (`course`.`id` = `section`.`courseid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schedule`
--

/*!50001 DROP VIEW IF EXISTS `schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `schedule` AS select `student`.`id` AS `stid`,`course`.`id` AS `course_id`,`instructor`.`room_no` AS `class_room`,`instructor`.`name` AS `teacher_name`,`course`.`did` AS `department_id`,`course`.`name` AS `course_name` from ((((`student` join `section_student`) join `section`) join `instructor`) join `course`) where ((`student`.`sid` = `section_student`.`stid`) and (`section_student`.`sectid` = `section`.`id`) and (`section`.`courseid` = `course`.`id`) and (`section`.`instructorid` = `instructor`.`id`) and (`student`.`id` = 6)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_food`
--

/*!50001 DROP VIEW IF EXISTS `student_food`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_food` AS select `student`.`id` AS `stid`,`food`.`name` AS `food`,`food`.`date` AS `date` from ((`student` join `food_reserve`) join `food`) where ((`food_reserve`.`fid` = `food`.`id`) and (`food_reserve`.`sid` = `student`.`sid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacher_course`
--

/*!50001 DROP VIEW IF EXISTS `teacher_course`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacher_course` AS select `instructor`.`name` AS `teacher_name`,`course`.`name` AS `course_name` from ((`section` join `instructor`) join `course`) where ((`section`.`courseid` = `course`.`id`) and (`section`.`instructorid` = `instructor`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `under12`
--

/*!50001 DROP VIEW IF EXISTS `under12`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `under12` AS select `person`.`fname` AS `fname`,`person`.`lname` AS `lname`,`semester_student`.`units` AS `units` from ((`person` join `student`) join `semester_student`) where ((`semester_student`.`units` < 12) and (`semester_student`.`stuid` = `student`.`sid`) and (`person`.`id` = `student`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06 18:53:12
