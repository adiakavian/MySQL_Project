# SPORT MEDICAL CONTROL

create schema IF Not EXISTS smc;
use smc;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;

CREATE TABLE `coach`
(  `ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE=InnoDB;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;

INSERT INTO `coach` VALUES 
(342294032,'shimi zimmer','2020-10-12','tennis'),
(346481557,'Dina Danon','2017-07-07','tennis'),
(349045252,'Yosef Shmueli','2016-10-12','soccer'),
(355746399,'Shiri Israeli','2021-10-02','golf'),
(365346737,'Yair Nitzan','2019-11-22','football'),
(391694964,'Matan Natan','2018-07-06','basketball');

UNLOCK TABLES;

--
-- Table structure for table `coach_phone`
--

DROP TABLE IF EXISTS `coach_phone`;

CREATE TABLE `coach_phone`
( `ID_COACH` int NOT NULL,
  `PHONE_num` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_COACH`,`PHONE_num`),
  CONSTRAINT `ID_COACH1` FOREIGN KEY (`ID_COACH`) REFERENCES `coach` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `coach_phone`
--

LOCK TABLES `coach_phone` WRITE;

INSERT INTO `coach_phone` VALUES 
(342294032,'0526279403'),
(346481557,'0521473303'),
(349045252,'0501679654'),
(355746399,'0546888201'),
(365346737,'0503273944'),
(391694964,'0525619123');

UNLOCK TABLES;

--
-- Table structure for table `personal_doctor`
--

DROP TABLE IF EXISTS `personal_doctor`;

CREATE TABLE `personal_doctor`
( `ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `HMO` varchar(45) DEFAULT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE=InnoDB;

--
-- Dumping data for table `personal_doctor`
--

LOCK TABLES `personal_doctor` WRITE;

INSERT INTO `personal_doctor` 
VALUES 
(312424793,'Nitzan Meir','Meuhedet','2019-03-16'),
(321054282,'Dani Sarit','Maccabi','2008-10-08'),
(324187088,'Raz Bussani','Maccabi','2014-05-04'),
(333952299,'Adi Akavian','Clalit','2015-02-21'),
(352287575,'Or Gigi','Clalit','2017-07-05'),
(382617758,'Efrat Gosh','Leumit','2021-01-21');

UNLOCK TABLES;

--
-- Table structure for table `personal_doc_phone`
--

DROP TABLE IF EXISTS `personal_doc_phone`;

CREATE TABLE `personal_doc_phone`
( `ID_PERSONAL_DOC` int NOT NULL,
  `PESONAL_DOC_num` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_PERSONAL_DOC`,`PESONAL_DOC_num`),
  CONSTRAINT `PERSONAL_DOCTOR1` FOREIGN KEY (`ID_PERSONAL_DOC`) REFERENCES `personal_doctor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `personal_doc_phone`
--

LOCK TABLES `personal_doc_phone` WRITE;

INSERT INTO `personal_doc_phone` VALUES 
(312424793,'0526378476'),
(321054282,'0543627873'),
(324187088,'0523456192'),
(333952299,'0581245333'),
(352287575,'0527891155'),
(382617758,'0541678989');

UNLOCK TABLES;

--
-- Table structure for table `athlete`
--

DROP TABLE IF EXISTS `athlete`;

CREATE TABLE `athlete` 
( `ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `CITY` varchar(45) DEFAULT NULL,
  `STREET` varchar(45) DEFAULT NULL,
  `BUILDING_num` int DEFAULT NULL,
  `ID_COACH` int NOT NULL,
  `ID_PERSONAL_DOC` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_COACH2_idx` (`ID_COACH`),
  KEY `ID_PERSONAL_DOC_idx` (`ID_PERSONAL_DOC`),
  CONSTRAINT `ID_COACH2` FOREIGN KEY (`ID_COACH`) REFERENCES `coach` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_PERSONAL_DOC` FOREIGN KEY (`ID_PERSONAL_DOC`) REFERENCES `personal_doctor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `athlete`
--

LOCK TABLES `athlete` WRITE;

INSERT INTO `athlete` 
VALUES 
(311083658,'Hadas Shimrit','2011-09-01','1984-03-18','Jerusalem','Rotchild',22,342294032,324187088),
(326121849,'Dora Explorer','2016-10-08','2000-10-07','Nes Ziona','habanim',48,346481557,382617758),
(333602810,'Slomi Yaakov','2016-10-28','1992-03-22','Rehovot','stein',4,365346737,333952299),
(342257489,'yoram granat','2021-12-21','1997-03-22','TLV','franch',12,391694964,324187088),
(351922184,'Amir Amram','2021-01-21','1989-01-23','Ganot','hayarkon',8,391694964,352287575),
(359830893,'Adam Moshe','2017-07-04','1990-10-19','Gan Yavne','gibstein',2,349045252,321054282),
(361074690,'Shlomi Yanai','2019-03-16','1992-03-18','Jerusalem','amal',1,365346737,324187088);

UNLOCK TABLES;

--
-- Table structure for table `athlete_phone`
--

DROP TABLE IF EXISTS `athlete_phone`;

CREATE TABLE `athlete_phone`
( `ID_ATHLETE` int NOT NULL,
  `PHONE_num` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_ATHLETE`,`PHONE_num`),
  CONSTRAINT `ID_ATHLETE1` FOREIGN KEY (`ID_ATHLETE`) REFERENCES `athlete` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `athlete_phone`
--

LOCK TABLES `athlete_phone` WRITE;

INSERT INTO `athlete_phone`
 VALUES 
(326121849,'0502221678'),
(333602810,'0502821600'),
(342257489,'0541821370'),
(351922184,'0502391658'),
(359830893,'0542251978'),
(361074690,'0525221543');

UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;

CREATE TABLE `nurse` 
( `ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE=InnoDB;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;

INSERT INTO `nurse` 
VALUES 
(312784539,'Amit Amitay','2016-10-08'),
(321085756,'Amnon Shimoni','2016-10-19'),
(327763022,'Shirel Shira','2019-03-15'),
(342341037,'Yamit Zuk','2016-10-28');

UNLOCK TABLES;

--
-- Table structure for table `nurse_phone`
--

DROP TABLE IF EXISTS `nurse_phone`;

CREATE TABLE `nurse_phone`
( `ID_NURSE` int NOT NULL,
  `PHONE_num` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_NURSE`,`PHONE_num`),
  CONSTRAINT `ID_NURSE` FOREIGN KEY (`ID_NURSE`) REFERENCES `nurse` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `nurse_phone`
--

LOCK TABLES `nurse_phone` WRITE;

INSERT INTO `nurse_phone` 
VALUES 
(312784539,'0526738465'),
(321085756,'0526738473'),
(327763022,'0542361177'),
(342341037,'0536728992');
UNLOCK TABLES;

--
-- Table structure for table `measurements_session`
--

DROP TABLE IF EXISTS `measurements_session`;

CREATE TABLE `measurements_session` 
( `SESSION_num` int NOT NULL,
  `ID_ATHLETE` int NOT NULL,
  `HEART_RATE` enum('in order','not in order') DEFAULT NULL,
  `BLOOD_WORK` enum('in order','not in order') DEFAULT NULL,
  `URINE` enum('in order','not in order') DEFAULT NULL,
  `HIGHT` int DEFAULT NULL,
  `WEIGHT` int DEFAULT NULL,
  `RTPCR` enum('Negative','Positive') DEFAULT NULL,
  `BODY_TEMP` float DEFAULT NULL,
  `ID_APPLYING_NURSE` int DEFAULT NULL,
  `ID_REFFERING_DOC` int DEFAULT NULL,
  `DATE_OF_TEST` date DEFAULT NULL,
  PRIMARY KEY (`SESSION_num`,`ID_ATHLETE`),
  KEY `ID_ATHLETE_idx` (`ID_ATHLETE`),
  KEY `ID_NURSE_idx` (`ID_APPLYING_NURSE`),
  KEY `ID_APPLYING_NURSE_MEASUREMENT_idx` (`ID_APPLYING_NURSE`),
  KEY `ID_REFFERING_DOC_idx` (`ID_REFFERING_DOC`),
  CONSTRAINT `ID_APPLYING_NURSE_MEASUREMENT` FOREIGN KEY (`ID_APPLYING_NURSE`) REFERENCES `nurse` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ID_ATHLETE` FOREIGN KEY (`ID_ATHLETE`) REFERENCES `athlete` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_REFFERING_DOC` FOREIGN KEY (`ID_REFFERING_DOC`) REFERENCES `personal_doctor` (`ID`) ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `measurements_session`
--

LOCK TABLES `measurements_session` WRITE;

INSERT INTO `measurements_session` 
VALUES 
(1,326121849,'in order','in order','in order',180,85,'Positive',38.9,312784539,382617758,'2020-11-21'),
(1,333602810,'in order','in order','not in order',193,91,'Positive',37.4,321085756,333952299,'2021-12-14'),
(2,326121849,'not in order','in order','in order',180,85,'Negative',37.3,327763022,382617758,'2021-12-15'),
(2,333602810,'not in order','not in order','in order',193,91,'Negative',36.5,327763022,333952299,'2021-10-08'),
(2,342257489,'in order','in order','in order',190,90,'Negative',39,312784539,324187088,'2021-12-23');

UNLOCK TABLES;

--
-- Table structure for table `spacialist_doctor`
--

DROP TABLE IF EXISTS `spacialist_doctor`;

CREATE TABLE `spacialist_doctor` 
(  `ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `SPACIALIZATION` varchar(45) DEFAULT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE=InnoDB;

--
-- Dumping data for table `spacialist_doctor`
--

LOCK TABLES `spacialist_doctor` WRITE;

INSERT INTO `spacialist_doctor` 
VALUES 
(312386434,'yuval sheffer','Dietitian','2001-11-11'),
(339836717,'Nadav Amsalem','cardiolog','1999-12-12'),
(349094426,'Kirchov Newton','phisiotherapist','1992-11-24'),
(368965244,'Oleg Gabay','phisiotherapist','2000-10-10');

UNLOCK TABLES;

--
-- Table structure for table `spacialist_doc_phone`
--

DROP TABLE IF EXISTS `spacialist_doc_phone`;

CREATE TABLE `spacialist_doc_phone`
( `ID_SPACIAL_DOC` int NOT NULL,
  `SPACIAL_DOC_num` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_SPACIAL_DOC`,`SPACIAL_DOC_num`),
  CONSTRAINT `ID_SPACIALIST_DOC1` FOREIGN KEY (`ID_SPACIAL_DOC`) REFERENCES `spacialist_doctor` (`ID`))
ENGINE=InnoDB;

--
-- Dumping data for table `spacialist_doc_phone`
--

LOCK TABLES `spacialist_doc_phone` WRITE;

INSERT INTO `spacialist_doc_phone` 
VALUES 
(312386434,'0534251784'),
(339836717,'0526783645'),
(368965244,'0534251678');

UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;

CREATE TABLE `treatment` 
( `SERIAL_num` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `COST` int DEFAULT NULL,
  PRIMARY KEY (`SERIAL_num`))
ENGINE=InnoDB AUTO_INCREMENT=5;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;

INSERT INTO `treatment` 
VALUES 
(1,'phisiotherapy',500),
(2,'heart surgery',1500),
(3,'Dietitian',250),
(4,'phisiotherapy',300);

UNLOCK TABLES;

--
-- Table structure for table `performing`
--
DROP TABLE IF EXISTS `performing`;

CREATE TABLE `performing` 
( `ID_PERFORMING_DOC` int NOT NULL,
  `SERIAL_num` int NOT NULL,
  PRIMARY KEY (`ID_PERFORMING_DOC`,`SERIAL_num`),
  KEY `SERIAL_#4_idx` (`SERIAL_num`),
  CONSTRAINT `ID_PERFORMING_DOC` FOREIGN KEY (`ID_PERFORMING_DOC`) REFERENCES `spacialist_doctor` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Serial_num1` FOREIGN KEY (`SERIAL_num`) REFERENCES `treatment` (`SERIAL_num`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `performing`
--

LOCK TABLES `performing` WRITE;

INSERT INTO `performing` 
VALUES 
(368965244,1),
(339836717,2),
(312386434,3);

UNLOCK TABLES;

--
-- Table structure for table `recieving`
--

DROP TABLE IF EXISTS `recieving`;

CREATE TABLE `recieving`
( `ID_ATHLETE` int NOT NULL,
  `SERIAL_num` int NOT NULL,
  `ID_SPECIAL_DOC` int NOT NULL,
  `DATE_OF_TREATMENT` date NOT NULL,
  PRIMARY KEY (`ID_ATHLETE`,`SERIAL_num`,`ID_SPECIAL_DOC`,`DATE_OF_TREATMENT`),
  KEY `SERIAL_#3_idx` (`SERIAL_num`),
  KEY `ID_SPECIAL_DOC3_idx` (`ID_SPECIAL_DOC`),
  CONSTRAINT `ID_ATHLETE3` FOREIGN KEY (`ID_ATHLETE`) REFERENCES `athlete` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_SPECIAL_DOC3` FOREIGN KEY (`ID_SPECIAL_DOC`) REFERENCES `spacialist_doctor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Serial_num3` FOREIGN KEY (`SERIAL_num`) REFERENCES `treatment` (`SERIAL_num`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `recieving`
--

LOCK TABLES `recieving` WRITE;

INSERT INTO `recieving` 
VALUES
(326121849,1,349094426,'2020-10-10'),
(351922184,1,349094426,'2021-04-28'),
(359830893,1,349094426,'2020-10-10'),
(342257489,2,339836717,'2021-11-11'),
(351922184,2,339836717,'2021-09-30'),
(326121849,3,312386434,'2021-01-22'),
(333602810,3,312386434,'2021-10-08'),
(342257489,3,312386434,'2020-12-11'),
(311083658,4,368965244,'2020-07-03'),
(359830893,4,368965244,'2020-02-19');

UNLOCK TABLES;

--
-- Table structure for table `reffering`
--

DROP TABLE IF EXISTS `reffering`;

CREATE TABLE `reffering`
( `ID_ATHLETE` int NOT NULL,
  `ID_REFFERING_DOC` int NOT NULL,
  `SERIAL_num` int NOT NULL,
  `DATE_OF_CONSULT` date NOT NULL,
  PRIMARY KEY (`ID_REFFERING_DOC`,`SERIAL_num`,`ID_ATHLETE`,`DATE_OF_CONSULT`),
  KEY `SERIAL_#2_idx` (`SERIAL_num`),
  KEY `ID_ATHLETE5_idx` (`ID_ATHLETE`),
  CONSTRAINT `ID_ATHLETE5` FOREIGN KEY (`ID_ATHLETE`) REFERENCES `athlete` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_REFFERING3` FOREIGN KEY (`ID_REFFERING_DOC`) REFERENCES `personal_doctor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Serial_num2` FOREIGN KEY (`SERIAL_num`) REFERENCES `treatment` (`SERIAL_num`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `reffering`
--

LOCK TABLES `reffering` WRITE;

INSERT INTO `reffering` 
VALUES
(359830893,321054282,1,'2020-10-08'),
(351922184,352287575,1,'2021-04-25'),
(326121849,382617758,1,'2020-10-06'),
(342257489,324187088,2,'2021-11-09'),
(351922184,352287575,2,'2021-09-28'),
(342257489,324187088,3,'2020-12-08'),
(333602810,333952299,3,'2021-10-06'),
(326121849,382617758,3,'2021-01-20'),
(359830893,321054282,4,'2020-02-17'),
(311083658,324187088,4,'2020-07-01');

UNLOCK TABLES;

--
-- Table structure for table `treatment_ins`
--

DROP TABLE IF EXISTS `treatment_ins`;

CREATE TABLE `treatment_ins` 
(  `SERIAL_num` int NOT NULL,
  `treatments_ins` varchar(45) NOT NULL,
  PRIMARY KEY (`SERIAL_num`,`treatments_ins`),
  CONSTRAINT `serial num` FOREIGN KEY (`SERIAL_num`) REFERENCES `treatment` (`SERIAL_num`) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=InnoDB;

--
-- Dumping data for table `treatment_ins`
--

LOCK TABLES `treatment_ins` WRITE;

INSERT INTO `treatment_ins`
 VALUES 
 (1,'beilinson'),
 (2,'ichilov'),
 (2,'shneider'),
 (3,'shneider');

UNLOCK TABLES;
