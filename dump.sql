-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: University
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `A_Students`
--

DROP TABLE IF EXISTS `A_Students`;
/*!50001 DROP VIEW IF EXISTS `A_Students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `A_Students` AS SELECT 
 1 AS `fname`,
 1 AS `lname`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `Course` VALUES ('1','shabake',3,0),('2','os',3,0),('3','sazeh',3,2),('4','amdad',4,1);
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
  `name` varchar(25) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food`
--

LOCK TABLES `Food` WRITE;
/*!40000 ALTER TABLE `Food` DISABLE KEYS */;
INSERT INTO `Food` VALUES ('mahi',6000,'2020-10-10',1),('ghorme',6000,'2022-10-10',2),('kabab',8000,'2022-10-10',3),('ghayme',4000,'2023-10-10',4);
/*!40000 ALTER TABLE `Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food_Reserve`
--

DROP TABLE IF EXISTS `Food_Reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Food_Reserve` (
  `fid` int NOT NULL,
  `sid` varchar(10) NOT NULL,
  PRIMARY KEY (`fid`,`sid`),
  KEY `fk_Food_Reserve_1_idx` (`sid`),
  CONSTRAINT `fk_Food_Reserve_1` FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`),
  CONSTRAINT `fk_Food_Reserve_2` FOREIGN KEY (`fid`) REFERENCES `Food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_Reserve`
--

LOCK TABLES `Food_Reserve` WRITE;
/*!40000 ALTER TABLE `Food_Reserve` DISABLE KEYS */;
INSERT INTO `Food_Reserve` VALUES (2,'9922752487'),(4,'9922752487'),(1,'9922762399'),(2,'9922762399'),(3,'9922762399');
/*!40000 ALTER TABLE `Food_Reserve` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_balance_before_reservation` BEFORE INSERT ON `Food_Reserve` FOR EACH ROW BEGIN
    DECLARE student_balance DECIMAL(10, 2);
    DECLARE food_price DECIMAL(10, 2);

    -- Get the student's balance
    SELECT balance INTO student_balance
    FROM Student
    WHERE Student.sid = NEW.sid;
    SELECT price INTO food_price
    FROM Food
    WHERE Food.id = NEW.fid;

    -- Check if the student's balance is sufficient
    IF student_balance >= food_price THEN
        -- Decrement the student's balance
		UPDATE Student
        SET balance = student_balance - food_price
        WHERE sid = NEW.Sid;  
        ELSE
        -- Raise an error or handle the insufficient balance scenario
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instructor` (
  `id` varchar(10) NOT NULL,
  `room_no` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Instructor_1` FOREIGN KEY (`id`) REFERENCES `Person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES ('4567891234',5,NULL),('5',10,NULL),('7',4,NULL),('8',2,NULL);
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
INSERT INTO `Person` VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL),('1234567891','kamran','amorzegan',23,'','',0),('2345678912','iman','ras',20,'','',1),('3456789123','nima','alavi',32,'','',0),('4567891234','ali','hadad',45,NULL,NULL,2),('5','kamran','ads',55,'','',0),('6','mohammadreza','zaman',32,NULL,NULL,0),('7','alireza','taleb',32,NULL,NULL,1),('8','meeoosa','babayi',29,NULL,NULL,0);
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
  `unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Section_2_idx` (`courseid`),
  KEY `fk_Section_1_idx` (`instructorid`),
  CONSTRAINT `fk_Section_1` FOREIGN KEY (`instructorid`) REFERENCES `Instructor` (`id`),
  CONSTRAINT `fk_Section_2` FOREIGN KEY (`courseid`) REFERENCES `Course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
INSERT INTO `Section` VALUES ('1',25,'1000-01-01 00:00:00',1401,1,'1','5','2'),('2',25,'1500-01-01 00:00:00',1402,1,'1','8','3'),('3',25,NULL,1401,1,'4','7','4'),('4',20,NULL,1401,1,'2','5','5'),('5',46,'1500-01-01 12:00:00',1402,1,'3','7','3');
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
  `stid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Section_Student_2_idx` (`sectid`),
  KEY `fk_Section_Student_1_idx` (`semstuid`),
  KEY `fk_Section_Student_3_idx` (`stid`),
  CONSTRAINT `fk_Section_Student_1` FOREIGN KEY (`semstuid`) REFERENCES `Semester_Student` (`idSemester_Student`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Section_Student_2` FOREIGN KEY (`sectid`) REFERENCES `Section` (`id`),
  CONSTRAINT `fk_Section_Student_3` FOREIGN KEY (`stid`) REFERENCES `Student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section_Student`
--

LOCK TABLES `Section_Student` WRITE;
/*!40000 ALTER TABLE `Section_Student` DISABLE KEYS */;
INSERT INTO `Section_Student` VALUES ('11','4',5,1,18,'9922762399'),('12','1',1,0,0,'9922762399'),('13','3',4,1,14,'2'),('14','5',1,1,18,'2'),('7','3',4,1,14,'9922762399');
/*!40000 ALTER TABLE `Section_Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_taken_units` BEFORE INSERT ON `Section_Student` FOR EACH ROW BEGIN
	Update Semester_Student
    set units_take = units_take + (SELECT unit from Section where  NEW.sectid = Section.id)
    where Semester_Student.idSemester_Student = new.semstuid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_all_units` AFTER UPDATE ON `Section_Student` FOR EACH ROW BEGIN
    IF NEW.status = 1 AND OLD.status = 0 THEN
        UPDATE Semester_Student
        SET Semester_Student.units = Semester_Student.units + (SELECT unit from Section where  NEW.sectid = Section.id)
        WHERE Semester_Student.idSemester_Student = NEW.semstuid;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `units_take` int DEFAULT '0',
  PRIMARY KEY (`idSemester_Student`),
  KEY `fk_Semester_Student_1_idx` (`stuid`),
  CONSTRAINT `fk_Semester_Student_1` FOREIGN KEY (`stuid`) REFERENCES `Student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Semester_Student`
--

LOCK TABLES `Semester_Student` WRITE;
/*!40000 ALTER TABLE `Semester_Student` DISABLE KEYS */;
INSERT INTO `Semester_Student` VALUES (1,'9922762399',8,0,1401,1,9),(2,'9922762399',12,15,1401,2,0),(3,'9922762399',16,14,1402,1,0),(4,'9922752487',18,12,1401,1,0),(5,'2',10,14,1401,2,0);
/*!40000 ALTER TABLE `Semester_Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_student_units` AFTER UPDATE ON `Semester_Student` FOR EACH ROW BEGIN
    IF NEW.units  <> OLD.units THEN
        UPDATE Student
        SET Student.units = Student.units + NEW.units - OLD.units
        WHERE Student.sid = NEW.stuid;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `id` varchar(10) NOT NULL,
  `sid` varchar(10) DEFAULT NULL,
  `average` int DEFAULT '0',
  `units` int DEFAULT '0',
  `balance` int DEFAULT NULL,
  `entry_year` int DEFAULT NULL,
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
INSERT INTO `Student` VALUES ('1234567891','9922762399',0,10,12000,NULL),('2345678912','9922752487',18,9,NULL,NULL),('6','2',15,8,20000,NULL);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Final view structure for view `A_Students`
--

/*!50001 DROP VIEW IF EXISTS `A_Students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `A_Students` AS select `Person`.`fname` AS `fname`,`Person`.`lname` AS `lname` from (`Person` join `Student`) where ((`Student`.`average` > 17) and (`Person`.`id` = `Student`.`id`)) */;
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
/*!50001 VIEW `passed_courses` AS select `Course`.`name` AS `name` from ((`Course` join `Section`) join `Section_Student` `ss`) where ((`ss`.`stid` = '2') and (`ss`.`status` = 1) and (`ss`.`Score` >= 10) and (`ss`.`sectid` = `Section`.`id`) and (`Course`.`id` = `Section`.`courseid`)) */;
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
/*!50001 VIEW `under12` AS select `Person`.`fname` AS `fname`,`Person`.`lname` AS `lname`,`Semester_Student`.`units` AS `units` from ((`Person` join `Student`) join `Semester_Student`) where ((`Semester_Student`.`units` < 12) and (`Semester_Student`.`stuid` = `Student`.`sid`) and (`Person`.`id` = `Student`.`id`)) */;
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

-- Dump completed on 2023-07-06 16:39:45
