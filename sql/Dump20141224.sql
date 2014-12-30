-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: leapfh8k_evaluator
-- ------------------------------------------------------
-- Server version	5.6.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `description` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activity_user1_idx` (`user_id`),
  CONSTRAINT `fk_activity_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This entity will represent an activity done by user ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `question_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answers_question1_idx` (`question_id`),
  CONSTRAINT `fk_answers_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8 COMMENT='This entity will hold all the possible answers to a given question and indicate what the correct answer is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (33,'She did not like tuitions',0,10,1,'a'),(34,'Her parents did not have enough money',1,10,2,'b'),(35,'She did not need tuitions',0,10,3,'c'),(37,'They liked to walk',0,11,1,'a'),(38,'Their school was very close to their home',0,11,2,'b'),(39,'They did not want to spend money on travel',1,11,3,'c'),(40,'One',0,12,1,'a'),(41,'Two',1,12,2,'b'),(42,'Three',0,12,3,'c'),(43,'Before school started',0,13,1,'a'),(44,'Early morning\r\n',0,13,2,'b'),(45,'When school ended',1,13,3,'c'),(46,'True',1,14,1,'a'),(47,'False',0,14,2,'b'),(48,'I don\'t know',0,14,3,'c'),(49,'At a hospital',0,15,1,'a'),(50,'At her home\r\n',1,15,2,'b'),(51,'At her office',0,15,3,'c'),(52,'Yes',0,16,1,'a'),(53,'No',1,16,2,'b'),(54,'I don\'t know',0,16,3,'c'),(55,'She charged very little',0,17,1,'a'),(56,'She charged very high',0,17,2,'b'),(57,'Patients decided how much to pay',1,17,3,'c'),(58,'Dirty',0,18,1,'a'),(59,'Illiterate',0,18,2,'b'),(60,'Poor',1,18,3,'c'),(61,'Yes',1,19,1,'a'),(62,'No',0,19,2,'b'),(63,'I don\'t know',0,19,3,'c'),(64,'by',0,21,1,'a'),(65,'to',0,21,2,'b'),(66,'for',1,21,3,'c'),(67,'on',0,21,4,'d'),(68,'is',0,22,1,'a'),(69,'will',0,22,2,'b'),(70,'am',0,22,3,'c'),(71,'are',1,22,4,'d'),(72,'drinks',1,23,1,'a'),(73,'drink',0,23,2,'b'),(74,'drinking',0,23,3,'c'),(75,'none of the three',0,23,4,'d'),(76,'in/in',0,24,1,'a'),(77,'in/of',1,24,2,'b'),(78,'on/of',0,24,3,'c'),(79,'for/of',0,24,4,'d'),(80,'has',0,25,1,'a'),(81,'have',0,25,2,'b'),(82,'am',0,25,3,'c'),(83,'are',1,25,4,'d'),(84,'kill',0,26,1,'a'),(85,'killing',0,26,2,'b'),(86,'killed',1,26,3,'c'),(87,'were killed',0,26,4,'d'),(88,'are',0,27,1,'a'),(89,'do',1,27,2,'b'),(90,'does',0,27,3,'c'),(91,'None of the three',0,27,4,'d'),(92,'on',1,28,1,'a'),(93,'in',0,28,2,'b'),(94,'at',0,28,3,'c'),(95,'for',0,28,4,'d'),(96,'come',1,29,1,'a'),(97,'came',0,29,2,'b'),(98,'coming',0,29,3,'c'),(99,'had come',0,29,4,'d'),(100,'has',0,30,1,'a'),(101,'have',1,30,2,'b'),(102,'are',0,30,3,'c'),(103,'was',0,30,4,'d'),(104,'has',1,31,1,'a'),(105,'have',0,31,2,'b'),(106,'is',0,31,3,'c'),(107,'are',0,31,4,'d'),(108,'has come to',0,32,1,'a'),(109,'came to',0,32,2,'b'),(110,'will be come to',0,32,3,'c'),(111,'will come to',1,32,4,'d'),(112,'is',0,33,1,'a'),(113,'am',1,33,2,'b'),(114,'Will',0,33,3,'c'),(115,'Would',0,33,4,'d'),(116,'on',1,34,1,'a'),(117,'at',0,34,2,'b'),(118,'in',0,34,3,'c'),(119,'for',0,34,4,'d'),(120,'has',1,35,1,'a'),(121,'have',0,35,2,'b'),(122,'were',0,35,3,'c'),(123,'is',0,35,4,'d'),(124,'was taught',0,36,1,'a'),(125,'taught',1,36,2,'b'),(126,'teach',0,36,3,'c'),(127,'teaching',0,36,4,'d'),(128,'are',1,37,1,'a'),(129,'was',0,37,2,'b'),(130,'is',0,37,3,'c'),(131,'blank',0,37,4,'d'),(132,'reach',0,38,1,'a'),(133,'reached',0,38,2,'b'),(134,'reaching',1,38,3,'c'),(135,'have reached',0,38,4,'d'),(136,'for',0,39,1,'a'),(137,'with',1,39,2,'b'),(138,'about',0,39,3,'c'),(139,'to',0,39,4,'d'),(140,'were',1,40,1,'a'),(141,'are',0,40,2,'b'),(142,'is',0,40,3,'c'),(143,'has',0,40,4,'d'),(144,'saw',0,41,1,'a'),(145,'seen',0,41,2,'b'),(146,'seeing',0,41,3,'c'),(147,'see',1,41,4,'d'),(148,'is',0,42,1,'a'),(149,'had',0,42,2,'b'),(150,'has',0,42,3,'c'),(151,'blank',1,42,4,'d'),(152,'by',1,43,1,'a'),(153,'in',0,43,2,'b'),(154,'on',0,43,3,'c'),(155,'at',0,43,4,'d'),(156,'do',0,44,1,'a'),(157,'is',0,44,2,'b'),(158,'had not',0,44,3,'c'),(159,'does',1,44,4,'d'),(160,'not go to',0,45,1,'a'),(161,'will not went to',0,45,2,'b'),(162,'will not go to',1,45,3,'c'),(163,'does not go to',0,45,4,'d'),(164,'is',0,46,1,'a'),(165,'are',1,46,2,'b'),(166,'am',0,46,3,'c'),(167,'have',0,46,4,'d'),(168,'sleep',0,47,1,'a'),(169,'am sleeping',0,47,2,'b'),(170,'was slept',0,47,3,'c'),(171,'slept',1,47,4,'d'),(172,'on',0,48,1,'a'),(173,'for',0,48,2,'b'),(174,'in',0,48,3,'c'),(175,'at',1,48,4,'d'),(176,'buyed',0,49,1,'a'),(177,'bought',0,49,2,'b'),(178,'buying',1,49,3,'c'),(179,'buy',0,49,4,'d'),(180,'were',0,50,1,'a'),(181,'are',0,50,2,'b'),(182,'is',1,50,3,'c'),(183,'will',0,50,4,'d'),(184,'go',0,51,1,'a'),(185,'went',0,51,2,'b'),(186,'are going',1,51,3,'c'),(187,'going',0,51,4,'d'),(188,'at',0,52,1,'a'),(189,'on',0,52,2,'b'),(190,'for',0,52,3,'c'),(191,'in',1,52,4,'d'),(192,'sleep',0,53,1,'a'),(193,'were sleeping',1,53,2,'b'),(194,'slept',0,53,3,'c'),(195,'were slept',0,53,4,'d'),(196,'does',0,54,1,'a'),(197,'am',0,54,2,'b'),(198,'do',1,54,3,'c'),(199,'have',0,54,4,'d'),(200,'is play',0,55,1,'a'),(201,'play',0,55,2,'b'),(202,'is playing',1,55,3,'c'),(203,'was playing',0,55,4,'d'),(204,'on',0,56,1,'a'),(205,'in',0,56,2,'b'),(206,'at',0,56,3,'c'),(207,'by',1,56,4,'d'),(208,'stand',0,57,1,'a'),(209,'standing',1,57,2,'b'),(210,'stood',0,57,3,'c'),(211,'standed',0,57,4,'d'),(212,'for',1,58,1,'a'),(213,'to',0,58,2,'b'),(214,'on',0,58,3,'c'),(215,'in',0,58,4,'d'),(216,'are eating',0,59,1,'a'),(217,'ate',0,59,2,'b'),(218,'eat',0,59,3,'c'),(219,'were eating',1,59,4,'d'),(220,'She',1,60,1,'a'),(221,'I',0,60,2,'b'),(222,'you',0,60,3,'c'),(223,'they',0,60,4,'d'),(224,'or',1,61,1,'a'),(225,'but',0,61,2,'b'),(226,'until',0,61,3,'c'),(227,'because',0,61,4,'d'),(228,'he',0,62,1,'a'),(229,'his',0,62,2,'b'),(230,'him',1,62,3,'c'),(231,'her',0,62,4,'d'),(232,'and',0,63,1,'a'),(233,'but',0,63,2,'b'),(234,'that',1,63,3,'c'),(235,'or',0,63,4,'d'),(236,'Them',0,64,1,'a'),(237,'There',0,64,2,'b'),(238,'Their',0,64,3,'c'),(239,'They',1,64,4,'d'),(240,'so',0,65,1,'a'),(241,'while',1,65,2,'b'),(242,'because',0,65,3,'c'),(243,'until',0,65,4,'d'),(244,'his',0,66,1,'a'),(245,'we',0,66,2,'b'),(246,'me',1,66,3,'c'),(247,'I',0,66,4,'d'),(248,'till',1,67,1,'a'),(249,'while',0,67,2,'b'),(250,'so',0,67,3,'c'),(251,'because',0,67,4,'d'),(252,'She',0,68,1,'a'),(253,'He',1,68,2,'b'),(254,'You',0,68,3,'c'),(255,'It',0,68,4,'d'),(256,'so',1,69,1,'a'),(257,'when',0,69,2,'b'),(258,'because',0,69,3,'c'),(259,'for',0,69,4,'d'),(260,'we',0,70,1,'a'),(261,'us',1,70,2,'b'),(262,'our',0,70,3,'c'),(263,'they',0,70,4,'d'),(264,'so',0,71,1,'a'),(265,'still',1,71,2,'b'),(266,'or',0,71,3,'c'),(267,'for',0,71,4,'d'),(268,'her',0,72,1,'a'),(269,'he',0,72,2,'b'),(270,'you',0,72,3,'c'),(271,'she',1,72,4,'d'),(272,'before',0,73,1,'a'),(273,'after',1,73,2,'b'),(274,'for',0,73,3,'c'),(275,'whom',0,73,4,'d'),(276,'She',0,74,1,'a'),(277,'He',0,74,2,'b'),(278,'It',0,74,3,'c'),(279,'We',1,74,4,'d'),(280,'as',0,75,1,'a'),(281,'while',0,75,2,'b'),(282,'until',1,75,3,'c'),(283,'because',0,75,4,'d'),(284,'you',0,76,1,'a'),(285,'him',0,76,2,'b'),(286,'my',0,76,3,'c'),(287,'your',1,76,4,'d'),(288,'so',0,77,1,'a'),(289,'while',0,77,2,'b'),(290,'because',1,77,3,'c'),(291,'until',0,77,4,'d'),(292,'I',1,78,1,'a'),(293,'They',0,78,2,'b'),(294,'You',0,78,3,'c'),(295,'None of the three',0,78,4,'d'),(296,'while',0,79,1,'a'),(297,'what',1,79,2,'b'),(298,'why',0,79,3,'c'),(299,'who',0,79,4,'d'),(300,'me',0,80,1,'a'),(301,'my',1,80,2,'b'),(302,'we',0,80,3,'c'),(303,'us',0,80,4,'d'),(304,'him',0,81,1,'a'),(305,'it',0,81,2,'b'),(306,'them',1,81,3,'c'),(307,'her',0,81,4,'d'),(308,'as',0,82,1,'a'),(309,'since',0,82,2,'b'),(310,'or',0,82,3,'c'),(311,'but',1,82,4,'d'),(312,'We',0,83,1,'a'),(313,'It',1,83,2,'b'),(314,'He',0,83,3,'c'),(315,'These',0,83,4,'d'),(316,'you',1,84,1,'a'),(317,'he',0,84,2,'b'),(318,'your',0,84,3,'c'),(319,'me',0,84,4,'d'),(320,'why to',0,85,1,'a'),(321,'until',0,85,2,'b'),(322,'where',0,85,3,'c'),(323,'why',1,85,4,'d'),(324,'I',0,86,1,'a'),(325,'He',0,86,2,'b'),(326,'You',1,86,3,'c'),(327,'She',0,86,4,'d'),(328,'Us',0,87,1,'a'),(329,'Our',1,87,2,'b'),(330,'Your',0,87,3,'c'),(331,'We',0,87,4,'d'),(332,'few',0,88,1,'a'),(333,'much',0,88,2,'b'),(334,'some',1,88,3,'c'),(335,'many',0,88,4,'d'),(336,'should',0,89,1,'a'),(337,'might',1,89,2,'b'),(338,'would',0,89,3,'c'),(339,'ought to',0,89,4,'d'),(340,'was mentioned',0,90,1,'a'),(341,'am mentioning',0,90,2,'b'),(342,'have mentioned',1,90,3,'c'),(343,'had mentioned',0,90,4,'d'),(344,'have',0,91,1,'a'),(345,'has',1,91,2,'b'),(346,'is',0,91,3,'c'),(347,'are',0,91,4,'d'),(348,'some',0,92,1,'a'),(349,'any',1,92,2,'b'),(350,'many',0,92,3,'c'),(351,'few',0,92,4,'d'),(352,'must we',0,93,1,'a'),(353,'can\'t we',0,93,2,'b'),(354,'can we',1,93,3,'c'),(355,'should we',0,93,4,'d'),(356,'had been studying',1,94,1,'a'),(357,'was studying',0,94,2,'b'),(358,'has studied',0,94,3,'c'),(359,'studied',0,94,4,'d'),(360,'was',0,95,1,'a'),(361,'has',0,95,2,'b'),(362,'were',1,95,3,'c'),(363,'is',0,95,4,'d'),(364,'some',1,96,1,'a'),(365,'many',0,96,2,'b'),(366,'any',0,96,3,'c'),(367,'few',0,96,4,'d'),(368,'should',1,97,1,'a'),(369,'may',0,97,2,'b'),(370,'will',0,97,3,'c'),(371,'must',0,97,4,'d'),(372,'was crying',0,98,1,'a'),(373,'has been crying',0,98,2,'b'),(374,'cried',0,98,3,'c'),(375,'had been crying',1,98,4,'d'),(376,'were',0,99,1,'a'),(377,'are',0,99,2,'b'),(378,'is',1,99,3,'c'),(379,'was being',0,99,4,'d'),(380,'many',1,100,1,'a'),(381,'much',0,100,2,'b'),(382,'some',0,100,3,'c'),(383,'few',0,100,4,'d'),(384,'could',0,101,1,'a'),(385,'need',0,101,2,'b'),(386,'might',0,101,3,'c'),(387,'must',1,101,4,'d'),(388,'has finished',0,102,1,'a'),(389,'had finished',1,102,2,'b'),(390,'is finished',0,102,3,'c'),(391,'was finished',0,102,4,'d'),(392,'is',0,103,1,'a'),(393,'are',1,103,2,'b'),(394,'was',0,103,3,'c'),(395,'am',0,103,4,'d'),(396,'very',0,104,1,'a'),(397,'lot',0,104,2,'b'),(398,'many',0,104,3,'c'),(399,'much',1,104,4,'d'),(400,'can',1,105,1,'a'),(401,'could',0,105,2,'b'),(402,'may',0,105,3,'c'),(403,'might',0,105,4,'d'),(404,'will be ending',0,106,1,'a'),(405,'will have ended',1,106,2,'b'),(406,'has ended',0,106,3,'c'),(407,'ended',0,106,4,'d'),(408,'was',0,107,1,'a'),(409,'not',0,107,2,'b'),(410,'is',0,107,3,'c'),(411,'were',1,107,4,'d'),(412,'much',0,108,1,'a'),(413,'many',1,108,2,'b'),(414,'very',0,108,3,'c'),(415,'lot',0,108,4,'d'),(416,'could\'nt',0,109,1,'a'),(417,'must',0,109,2,'b'),(418,'mayn\'t',0,109,3,'c'),(419,'can\'t',1,109,4,'d'),(420,'some',1,110,1,'a'),(421,'many',0,110,2,'b'),(422,'any',0,110,3,'c'),(423,'few',0,110,4,'d'),(424,'could',0,111,1,'a'),(425,'can',0,111,2,'b'),(426,'can\'t',1,111,3,'c'),(427,'couldn\'t',0,111,4,'d'),(428,'is',1,112,1,'a'),(429,'are',0,112,2,'b'),(430,'some',0,112,3,'c'),(431,'has been',0,112,4,'d'),(432,'don\'t',0,113,1,'a'),(433,'can\'t',1,113,2,'b'),(434,'couldn\'t',0,113,3,'c'),(435,'mustn\'t',0,113,4,'d'),(436,'some',0,114,1,'a'),(437,'many',0,114,2,'b'),(438,'few',0,114,3,'c'),(439,'any',1,114,4,'d'),(440,'are',0,115,1,'a'),(441,'is',1,115,2,'b'),(442,'have',0,115,3,'c'),(443,'has',0,115,4,'d'),(444,'was sleeping',0,116,1,'a'),(445,'had slept',0,116,2,'b'),(446,'has been sleeping',1,116,3,'c'),(447,'is sleeping',0,116,4,'d'),(448,'would',0,117,1,'a'),(449,'will',0,117,2,'b'),(450,'shall',1,117,3,'c'),(451,'must',0,117,4,'d'),(452,'were',0,118,1,'a'),(453,'is',0,118,2,'b'),(454,'have',0,118,3,'c'),(455,'are',1,118,4,'d'),(456,'must',0,119,1,'a'),(457,'had to',1,119,2,'b'),(458,'need',0,119,3,'c'),(459,'might',0,119,4,'d'),(460,'very',0,120,1,'a'),(461,'many',0,120,2,'b'),(462,'lot',0,120,3,'c'),(463,'much',1,120,4,'d'),(464,'have known',1,121,1,'a'),(465,'know',0,121,2,'b'),(466,'are knowing',0,121,3,'c'),(467,'knew',0,121,4,'d'),(468,'Must',0,122,1,'a'),(469,'Can',1,122,2,'b'),(470,'Might',0,122,3,'c'),(471,'none of the three',0,122,4,'d'),(472,'is',1,123,1,'a'),(473,'are',0,123,2,'b'),(474,'were',0,123,3,'c'),(475,'have',0,123,4,'d'),(476,'many',0,124,1,'a'),(477,'much',1,124,2,'b'),(478,'lot',0,124,3,'c'),(479,'few',0,124,4,'d'),(480,'has',1,125,1,'a'),(481,'were',0,125,2,'b'),(482,'was',0,125,3,'c'),(483,'are',0,125,4,'d'),(484,'must',0,126,1,'a'),(485,'should',0,126,2,'b'),(486,'may',1,126,3,'c'),(487,'ought to',0,126,4,'d'),(488,'many',0,127,1,'a'),(489,'some',0,127,2,'b'),(490,'much',1,127,3,'c'),(491,'few',0,127,4,'d'),(492,'is',1,128,1,'a'),(493,'have',0,128,2,'b'),(494,'has',0,128,3,'c'),(495,'are',0,128,4,'d'),(496,'was exercising',0,129,1,'a'),(497,'exercises',0,129,2,'b'),(498,'will have exercised',0,129,3,'c'),(499,'has been exercising\r\n',1,129,4,'d'),(500,'May',0,130,1,'a'),(501,'Are',0,130,2,'b'),(502,'Have',0,130,3,'c'),(503,'Can',1,130,4,'d'),(504,'blank',0,131,1,'a'),(505,'little',0,131,2,'b'),(506,'some',0,131,3,'c'),(507,'few',1,131,4,'d'),(508,'was',1,132,1,'a'),(509,'were',0,132,2,'b'),(510,'have',0,132,3,'c'),(511,'has',0,132,4,'d'),(512,'little',1,133,1,'a'),(513,'much',0,133,2,'b'),(514,'few',0,133,3,'c'),(515,'more',0,133,4,'d'),(516,'takes',0,134,1,'a'),(517,'will have taken',1,134,2,'b'),(518,'will take',0,134,3,'c'),(519,'took',0,134,4,'d'),(520,'has',0,135,1,'a'),(521,'is',1,135,2,'b'),(522,'have',0,135,3,'c'),(523,'are',0,135,4,'d'),(524,'Wouldn\'t they',1,136,1,'a'),(525,'Would they',0,136,2,'b'),(526,'Should they',0,136,3,'c'),(527,'Shouldn\'t they',0,136,4,'d'),(528,'many',0,137,1,'a'),(529,'much',1,137,2,'b'),(530,'some',0,137,3,'c'),(531,'few',0,137,4,'d'),(532,'might',1,138,1,'a'),(533,'has to',0,138,2,'b'),(534,'need',0,138,3,'c'),(535,'was',0,138,4,'d'),(536,'is',0,139,1,'a'),(537,'are',1,139,2,'b'),(538,'was',0,139,3,'c'),(539,'have',0,139,4,'d'),(540,'little',0,140,1,'a'),(541,'some',0,140,2,'b'),(542,'few',1,140,3,'c'),(543,'much',0,140,4,'d'),(544,'cost',0,141,1,'a'),(545,'costed',0,141,2,'b'),(546,'costing',0,141,3,'c'),(547,'costs',1,141,4,'d'),(548,'had done',1,142,1,'a'),(549,'have done',0,142,2,'b'),(550,'do',0,142,3,'c'),(551,'did',0,142,4,'d'),(552,'When it rained, fishermen do not go to sea.',0,143,1,'a'),(553,'When it rains, fishermen did not go to sea.',0,143,2,'b'),(554,'When it rains, fishermen do not go to sea.',1,143,3,'c'),(555,'When it rains, fishermen did not went to sea.',0,143,4,'d'),(556,'furthermore',1,145,1,'a'),(557,'hence',0,145,2,'b'),(558,'although',0,145,3,'c'),(559,'because',0,145,4,'d'),(560,'My hobbies are reading books, watching TV and listening to music.',1,146,1,'a'),(561,'My hobbies are reading books, watching TV and to listen to music',0,146,2,'b'),(562,'My hobbies are to read books, watching TV and listening to music.',0,146,3,'c'),(563,'My hobbies are to read books, watch TV and listen to music',0,146,4,'d'),(564,'moreover',0,147,1,'a'),(565,'thus',0,147,2,'b'),(566,'though',1,147,3,'c'),(567,'hence',0,147,4,'d'),(568,'Shankar is both healthy and wealthy',1,148,1,'a'),(569,'Shankar is both healthy and has wealth',0,148,2,'b'),(570,'Shankar has both health and is wealthy',0,148,3,'c'),(571,'Shankar has both healthy and wealthy',0,148,4,'d'),(572,'hence',0,149,1,'a'),(573,'nevertheless',1,149,2,'b'),(574,'otherwise',0,149,3,'c'),(575,'because',0,149,4,'d'),(576,'Before I leave the country, I should have met my grandmother. ',0,151,1,'a'),(577,'Before I am leaving the country, I should have met my grandmother. ',0,151,2,'b'),(578,'Before I left the country, I should have met my grandmother.',1,151,3,'c'),(579,'Before I was leaving the country, I should have met my grandmother. ',0,151,4,'d'),(580,'instead',0,152,1,'a'),(581,'furthermore',0,152,2,'b'),(582,'nonetheless',1,152,3,'c'),(583,'while',0,152,4,'d'),(584,'I love to dance, sing and playing cricket',0,153,1,'a'),(585,'I love to dance, sing and play cricket',1,153,2,'b'),(586,'I love to dancing, singing and playing cricket',0,153,3,'c'),(587,'I love to dance, singing and play cricket',0,153,4,'d'),(588,'Typical of',0,155,1,'a'),(589,'Instead of',0,155,2,'b'),(590,'Apart from',1,155,3,'c'),(591,'Apart of',0,155,4,'d'),(592,'Ram is standing while Rama was sitting.',0,156,1,'a'),(593,'Ram is standing while Rama is sitting.',1,156,2,'b'),(594,'Ram is standing while Rama has sat.',0,156,3,'c'),(595,'Ram is standing while Rama sits.',0,156,4,'d'),(596,'by means on',0,157,1,'a'),(597,'from means of',0,157,2,'b'),(598,'by means of',1,157,3,'c'),(599,'by means to',0,157,4,'d'),(600,'The dog in the compound neither will eat nor will it allow the cow to eat',0,158,1,'a'),(601,'The dog in the compound will neither eat nor will it allow the cow to eat\r\n',1,158,2,'b'),(602,'The dog in the compound neither will eat nor it will allow the cow to eat',0,158,3,'c'),(603,'The dog in the compound will neither eat nor will it allows the cow to eat',0,158,4,'d'),(604,'Whether',0,159,1,'a'),(605,'With',0,159,2,'b'),(606,'While',0,159,3,'c'),(607,'As soon as',1,159,4,'d'),(608,'On behalf of',1,160,1,'a'),(609,'In behalf of',0,160,2,'b'),(610,'On behalf to',0,160,3,'c'),(611,'On behalf',0,160,4,'d'),(612,'On missing the train, I catching a bus.',0,161,1,'a'),(613,'On missing the train, I am catching a bus.',0,161,2,'b'),(614,'On missing the train, I was caught a bus.',0,161,3,'c'),(615,'On missing the train, I caught a bus.',1,161,4,'d'),(616,'Exercise is good not only for the body but for the mind also',0,163,1,'a'),(617,'Exercise is not only good for the body but also for the mind',1,163,2,'b'),(618,'Exercise is good not only for the body but also for the mind ',0,163,3,'c'),(619,'Exercise is not good for the body but also for the mind',0,163,4,'d'),(620,'instead of',1,164,1,'a'),(621,'instead on',0,164,2,'b'),(622,'instead to',0,164,3,'c'),(623,'instead from',0,164,4,'d'),(624,'On seeing the police, the thief ran.',1,165,1,'a'),(625,'On seeing the police, the thief running.',0,165,2,'b'),(626,'On seeing the police, the thief was ran.',0,165,3,'c'),(627,'On seeing the police, the thief is running.',0,165,4,'d'),(628,'In case',0,166,1,'a'),(629,'In case of',1,166,2,'b'),(630,'In case to',0,166,3,'c'),(631,'In case from',0,166,4,'d'),(632,'get',1,168,1,'a'),(633,'ask',1,169,1,'a'),(634,'see',1,170,1,'a'),(635,'find',1,171,1,'a'),(636,'leave',1,172,1,'a'),(637,'forget',1,173,1,'a'),(638,'purchase',1,174,1,'a'),(639,'buy',1,175,1,'a'),(640,'tear',1,176,1,'a'),(641,'elect',1,177,1,'a'),(642,'go',1,178,1,'a'),(643,'fill',1,179,1,'a'),(644,'pay',1,180,1,'a'),(645,'steal',1,181,1,'a'),(646,'tie',1,182,1,'a'),(649,'decided,steal,snatched,lady,chased,grabbed,beat,dropped,dragged,crime,unconscious,ashamed,failed,remaining,forgive',1,20,0,NULL),(650,'living,want to',1,144,0,NULL),(651,'lived,were,saw,had been',1,150,0,NULL),(652,'felt,decided,left,came',1,154,0,NULL),(653,'was listening,rememberd,had asked',1,162,0,NULL),(654,'the,the,the,a,the,the,the,an,a,a',1,167,0,NULL);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification`
--

LOCK TABLES `certification` WRITE;
/*!40000 ALTER TABLE `certification` DISABLE KEYS */;
/*!40000 ALTER TABLE `certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree` varchar(45) NOT NULL,
  `instituition` varchar(1000) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `year_obtained` date DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_education_user1_idx` (`user_id`),
  CONSTRAINT `fk_education_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This entity will hold the various educational details of the user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passage`
--

DROP TABLE IF EXISTS `passage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `description` varchar(5000) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='This entity will hold independent passaseges or other media around which questions can be asked';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passage`
--

LOCK TABLES `passage` WRITE;
/*!40000 ALTER TABLE `passage` DISABLE KEYS */;
INSERT INTO `passage` VALUES (1,'Read the paragraph and answer the questions.<br/> Fatima was very good at studies and always stood first in her class. She and her sisters studied in a government school. She was in class 10 while her younger sisters were in class 7 & class 5. Their school was almost 3 kilometers away from their house but they walked everyday to save on transport money. The sisters were not very good at studies so Fatima requested her parents to send them for extra tuition classes after school hours. Her parents did not earn so much to send all 3 daughters for tuitions so Fatima chose to study on her own. Because of this sacrifice, everyone in the house respected her very much.','1'),(2,'Read the paragraph and answer the questions.<br/> Fatima did not have many friends because she never got any time to play. She however loved to spend time with an elderly lady who stayed in their neighbourhood. Her name was Savitri and she was a doctor.  Savitri was a very simple woman who had converted her house into a dispensary. Her husband was a doctor too but had passed away couple of years back. Savitri served all the patients in the neighbourhood with great love and care. Because all her patients were very poor, she never charged them any fee rather allowed them to pay her whatever they could afford.','2'),(3,'Listen to the audio, and find appropriate English word after reading the text below.<br/><br/>He decided to steal. He saw a rich lady shopping at a road-side stall. She was wearing a necklace. Rahim went close to her, snatched it and ran away. The lady started shouting for help. When people heard the lady screaming, they chased Rahim and caught him. They grabbed him by his neck, pushed him, punched him, slapped him and beat him so much that he broke his left hand. They recovered the stolen necklace and dropped him by the roadside. People then tied him with a rope and dragged him to the police station. The lady reported the crime and police arrested him. They put him in jail. Rahim was badly hurt, his hand was broken and his left eye was swollen. He began vomiting and became unconscious. In the morning when he woke up he saw Fatima and her sisters standing outside the jail. He was very ashamed and started crying. Fatima held his hand and told him that the hospital had thrown out their mother because he failed to pay the remaining money. Rahim started crying and fell down on the floor. He knew that Waheeda would die if she found out that police had arrested him and his daughters would never forgive him for letting their mother die.','3'),(4,'Fill in the blanks below with the following options: <b>see, find, get, leave, ask</b>',NULL),(5,'Fill in the blanks below with the following options: <b>buy, forget, tear, elect, purchase</b>',NULL),(6,'Fill in the blanks below with the following options: <b>steal, go, pay, tie, fill</b>',NULL);
/*!40000 ALTER TABLE `passage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(5000) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'multiple_choice',
  `evaluating_class` varchar(45) DEFAULT NULL COMMENT 'This column holds the name of the class which will evaluate the question. For complex questions a class can be provided that will take the question, correct answers and user provided answer to evaluate the question',
  `rendering_class` varchar(45) DEFAULT NULL COMMENT 'In case a question has a special display requirement This class can be used to render the question',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COMMENT='This entity will hold all the question that can be part of test';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (10,'Why did Fatima not go for tuitions?','1','multiple_choice',NULL,NULL),(11,'Why did the girls walk to and from school?','2','multiple_choice',NULL,NULL),(12,'How many sisters did Fatima have?','3','multiple_choice',NULL,NULL),(13,'When did the girls go for tuitions?','4','multiple_choice',NULL,NULL),(14,'Fatima was brighter than her sisters at studies - True or False?','5','multiple_choice',NULL,NULL),(15,'Where did Savitri run her dispensary?','1','multiple_choice',NULL,NULL),(16,'Was Savitri’s husband still alive?','2','multiple_choice',NULL,NULL),(17,'How much did Savitri charge her patients?','3','multiple_choice',NULL,NULL),(18,'How was Savitri’s neighbourhood?','4','multiple_choice',NULL,NULL),(19,'Was Fatima younger than Savitri?','5','multiple_choice',NULL,NULL),(20,'Enter the english words in the text area below separated by comma(,) ','1','special','AudioSection1Evaluator','AudioSection1Renderer'),(21,'This birthday present is ___ your brother. ','1','multiple_choice',NULL,NULL),(22,'Fidel and his brother Raul ___ travelling across the country this week.','2','multiple_choice',NULL,NULL),(23,'He ___ mineral water every day.','3','multiple_choice',NULL,NULL),(24,'He is coming ____ the last week ____ next month','4','multiple_choice',NULL,NULL),(25,'You and I ___ supposed to clean the room before mother comes home','5','multiple_choice',NULL,NULL),(26,'The army ___700 militants last year. ','6','multiple_choice',NULL,NULL),(27,'We ___ not like classical music.','7','multiple_choice',NULL,NULL),(28,'I lost my wallet ____ the way to Delhi.','8','multiple_choice',NULL,NULL),(29,'Did she not ___for the movie yesterday?','9','multiple_choice',NULL,NULL),(30,'Butterflies ___  beautiful dots on their wings','10','multiple_choice',NULL,NULL),(31,'Our national flag ___  three colours','16','multiple_choice',NULL,NULL),(32,'The Prime Minister ___Mumbai next month.','17','multiple_choice',NULL,NULL),(33,'I ___also supposed to go to the wedding.','18','multiple_choice',NULL,NULL),(34,'I am going to see the doctor ___ Tuesday.','19','multiple_choice',NULL,NULL),(35,'Everyone at my home ____ different tastes.','20','multiple_choice',NULL,NULL),(36,'My teacher was good. He ___ difficult topics in an interesting way.','21','multiple_choice',NULL,NULL),(37,'The kids ____ sleeping in their room.','22','multiple_choice',NULL,NULL),(38,'I will be ___ late to office today.','23','multiple_choice',NULL,NULL),(39,'What is wrong _____ Pravin today? ','24','multiple_choice',NULL,NULL),(40,'We bought lots of toys because they ____ on sale.','25','multiple_choice',NULL,NULL),(41,'Did you ___the cricket match last week?','31','multiple_choice',NULL,NULL),(42,'She ___ plays with children. ','32','multiple_choice',NULL,NULL),(43,'Please let me know your reply ____ tomorrow.','33','multiple_choice',NULL,NULL),(44,'He ___ not like ice-cream.','34','multiple_choice',NULL,NULL),(45,'I am sick. I ___ school tomorrow.','35','multiple_choice',NULL,NULL),(46,'My books ____ under my desk.','36','multiple_choice',NULL,NULL),(47,'I ___ through the entire movie last night.','37','multiple_choice',NULL,NULL),(48,'These books are priced ____ Rs 500 each. ','38','multiple_choice',NULL,NULL),(49,'I saw Neena yesterday. She was ___ books','39','multiple_choice',NULL,NULL),(50,'Statistics ____ my favourite subject.','40','multiple_choice',NULL,NULL),(51,'We ___ to America this December','41','multiple_choice',NULL,NULL),(52,'I woke up ____ the middle of the night. ','42','multiple_choice',NULL,NULL),(53,'The villagers ___ when the militants attacked them.','43','multiple_choice',NULL,NULL),(54,'I ____ not understand you.','44','multiple_choice',NULL,NULL),(55,'She ___ in the concert tomorrow evening.','45','multiple_choice',NULL,NULL),(56,'Do you go to work _____ bus? ','46','multiple_choice',NULL,NULL),(57,'She is ___ near the gate. ','47','multiple_choice',NULL,NULL),(58,'The doctor gave me some medicine ____ my cough','48','multiple_choice',NULL,NULL),(59,'When my uncle arrived at our home, we ___.','49','multiple_choice',NULL,NULL),(60,'___ is going home.','50','multiple_choice',NULL,NULL),(61,'Take your medicines _____ you will fall sick.','1','multiple_choice',NULL,NULL),(62,'\"John is making a lot of noise!” \"I\'ll ask ___ to be quiet.\"','2','multiple_choice',NULL,NULL),(63,'I am sure _____ he said no','3','multiple_choice',NULL,NULL),(64,'___ are playing football.','4','multiple_choice',NULL,NULL),(65,'Karan is rich _____ his cousin Johar is poor.','5','multiple_choice',NULL,NULL),(66,'I can\'t understand when she speaks German with ___','6','multiple_choice',NULL,NULL),(67,'Keep walking _____ you see a big iron gate.','7','multiple_choice',NULL,NULL),(68,'This is John. ____  is a champion car racing driver','8','multiple_choice',NULL,NULL),(69,'The weather was terrible, ____ we decided to postpone our trip.','9','multiple_choice',NULL,NULL),(70,'The librarian helped ___','10','multiple_choice',NULL,NULL),(71,'I ran fast, _____ I missed the train.','11','multiple_choice',NULL,NULL),(72,'Is   ____ Virendra’s sister?','12','multiple_choice',NULL,NULL),(73,'Make sure you switch off the lights _____ you finish your work. ','13','multiple_choice',NULL,NULL),(74,'____ always buy vegetables from the same stall','14','multiple_choice',NULL,NULL),(75,'Don’t go out _____you have finished your homework. ','15','multiple_choice',NULL,NULL),(76,'Can I borrow ____ car for a day?','16','multiple_choice',NULL,NULL),(77,'We want to buy a car _____ we have recently won a lottery','17','multiple_choice',NULL,NULL),(78,'___  am sitting on a sofa','18','multiple_choice',NULL,NULL),(79,'Please write _____ I dictate. ','19','multiple_choice',NULL,NULL),(80,'I cannot find ____ pencil','20','multiple_choice',NULL,NULL),(81,'If you happen to see your parents this weekend, give ___ my best regards.','21','multiple_choice',NULL,NULL),(82,'Karim is tall, _____ Abdul is taller.','22','multiple_choice',NULL,NULL),(83,'___ is a wonderful day today. ','23','multiple_choice',NULL,NULL),(84,'I think, I have met ____ before?','24','multiple_choice',NULL,NULL),(85,'I think I know ____ he left the job. ','25','multiple_choice',NULL,NULL),(86,'Are ___ from England? ','26','multiple_choice',NULL,NULL),(87,'____ college team lost in the finals?','27','multiple_choice',NULL,NULL),(88,'May I get ____ water to drink? ','1','multiple_choice',NULL,NULL),(89,'Manish _____ come to the party. Nobody is sure.','2','multiple_choice',NULL,NULL),(90,'As I____before, we can\'t go on like this. ','3','multiple_choice',NULL,NULL),(91,'The couple ____ 2 children','4','multiple_choice',NULL,NULL),(92,'That is very kind of you because I don\'t have ___ money.','5','multiple_choice',NULL,NULL),(93,'We can’t keep our dog in the hotel room. ____? ','6','multiple_choice',NULL,NULL),(94,'When I was correcting I became sure that he ___ very hard. ','7','multiple_choice',NULL,NULL),(95,'The results of the election ______ not available for 2 days.','8','multiple_choice',NULL,NULL),(96,'You must give me ___ more money.','9','multiple_choice',NULL,NULL),(97,'You failed in your exams. You _____ have studied harder ','10','multiple_choice',NULL,NULL),(98,'When Medha came into the office yesterday, her eyes were red and watery. I think she ___.','11','multiple_choice',NULL,NULL),(99,'Each of the 5 mobile phones ___ duplicate.','12','multiple_choice',NULL,NULL),(100,'How ___ people did you invite?','13','multiple_choice',NULL,NULL),(101,'You ____ wash your hands before every meal.','14','multiple_choice',NULL,NULL),(102,'When we arrived, the concert ____ already ____ ','15','multiple_choice',NULL,NULL),(103,'Both the statues on the shelf ___ broken.','16','multiple_choice',NULL,NULL),(104,'How _____ does your bag weigh?','17','multiple_choice',NULL,NULL),(105,'Although it contains many difficult words, I ___ read this book now.','18','multiple_choice',NULL,NULL),(106,'My English class ends at 3 pm. So at 4 o\'clock it ___ ','19','multiple_choice',NULL,NULL),(107,'The last few questions of the test ___ difficult.','20','multiple_choice',NULL,NULL),(108,'How _____ hand bags are allowed in the flight?','21','multiple_choice',NULL,NULL),(109,'I ___ understand a word of what you are speaking','22','multiple_choice',NULL,NULL),(110,'Maybe I will come ___ time on Saturday?','23','multiple_choice',NULL,NULL),(111,'Will you speak more clearly please? I ___ hardly hear you at all.','24','multiple_choice',NULL,NULL),(112,'Every sixth person in this world ___ an Indian.','25','multiple_choice',NULL,NULL),(113,'I ___ reach that apple, I\'ll have to use a ladder.','26','multiple_choice',NULL,NULL),(114,'\"Do you have ___ newspapers left,\" I asked?','27','multiple_choice',NULL,NULL),(115,'Neither of the statements _____ false','28','multiple_choice',NULL,NULL),(116,'My friend ____ for 5 hours','29','multiple_choice',NULL,NULL),(117,'You seem to be having trouble there. ____  I help you? ','30','multiple_choice',NULL,NULL),(118,'Be careful. The scissors ____ very sharp.','31','multiple_choice',NULL,NULL),(119,'Jack ___ go to hospital yesterday. ','32','multiple_choice',NULL,NULL),(120,'How _____ free rice do people below poverty line get?','33','multiple_choice',NULL,NULL),(121,'We____ each other for a long time. ','34','multiple_choice',NULL,NULL),(122,'____ it be true? ','35','multiple_choice',NULL,NULL),(123,'This pair of shoes ____ very expensive.','36','multiple_choice',NULL,NULL),(124,'How ______ does it cost to fly to America?','37','multiple_choice',NULL,NULL),(125,'A bundle of sticks ___  been lying on the ground.','38','multiple_choice',NULL,NULL),(126,'____ I borrow your pen?','39','multiple_choice',NULL,NULL),(127,'How _____ time do you need to complete this work? ','40','multiple_choice',NULL,NULL),(128,'Five Thousand rupees ___ a lot of money. ','41','multiple_choice',NULL,NULL),(129,'She ____ in her room for half an hour now ','42','multiple_choice',NULL,NULL),(130,'___ you speak any foreign language?','43','multiple_choice',NULL,NULL),(131,'I have got a _____ stamps that you can use.','44','multiple_choice',NULL,NULL),(132,'A group of girls ____ chasing the thief.','45','multiple_choice',NULL,NULL),(133,'I have got a _____ money. Let’s have coffee ','46','multiple_choice',NULL,NULL),(134,'By this time next year Prakash ____ his University degree. ','47','multiple_choice',NULL,NULL),(135,'Four and two ___ six.','48','multiple_choice',NULL,NULL),(136,'Indians would like to win another world cup. ___ ___? ','49','multiple_choice',NULL,NULL),(137,'How ______ water did he drink? ','50','multiple_choice',NULL,NULL),(138,'Take an umbrella. It ___ rain later ','51','multiple_choice',NULL,NULL),(139,'People from South ____ very friendly.','52','multiple_choice',NULL,NULL),(140,'They made a _____mistakes, but that is OK.','53','multiple_choice',NULL,NULL),(141,'Japan is an expensive country. It _____ a lot to stay there','54','multiple_choice',NULL,NULL),(142,'He thanked me for what I  ____ ','55','multiple_choice',NULL,NULL),(143,'Select the correct option','1','multiple_choice',NULL,NULL),(144,'After some time he got used to _#answer1#_ (live / lived / living / is living) in the city and did not _#answer2#_ (want to / wanted to / wanting to / wants to) go back to his farm.','2','fill_blank','FillInTheBlankEvaluator',NULL),(145,'That house is not big enough for all of us. _____ it is expensive. ','3','multiple_choice',NULL,NULL),(146,'Select the correct option ','4','multiple_choice',NULL,NULL),(147,'The neighbourhood is not very interesting. I like the house ____.','5','multiple_choice',NULL,NULL),(148,'Choose the correct sentence','6','multiple_choice',NULL,NULL),(149,'It was windy and rainy, ______ I decided to go out. ','7','multiple_choice',NULL,NULL),(150,'Raman was born on a little farm in Vijaynagar. He _#answer1#_ (live / lived / is living / will live) a difficult life. One day there _#answer22#_ (were / are / is / was) heavy rains. When the rain stopped, Raman _#answer3#_ (sees / has seen / is seeing / saw) that his farm _#answer44#_ (had / is / had been / blank) destroyed in the rain. ','8','fill_blank','FillInTheBlankEvaluator',NULL),(151,'Choose the correct sentence','9','multiple_choice',NULL,NULL),(152,'Aamir was not thirsty, ______ he drank 5 glasses of water. ','10','multiple_choice',NULL,NULL),(153,'Choose the correct sentence','11','multiple_choice',NULL,NULL),(154,'He _#answer1#_ (feels / is feeling / felt / blank) very sad and _#answer2#_ (decided / decide / deciding / blank) to come to the city. So Raman _#answer3#_ (left / leave / leaving / blank) his farm and _#answer4#_  (comes /came /coming / blank) to the city. ','12','fill_blank','FillInTheBlankEvaluator',NULL),(155,'_____ Ravi, no one else wants to come for the movie. ','13','multiple_choice',NULL,NULL),(156,'Select the correct option','14','multiple_choice',NULL,NULL),(157,'We finally solved the problem _______ a new machine developed by our research team.','15','multiple_choice',NULL,NULL),(158,'Select the correct option','16','multiple_choice',NULL,NULL),(159,'_______ you see me, get in the car. ','17','multiple_choice',NULL,NULL),(160,'___ my team, I thank you all. ','18','multiple_choice',NULL,NULL),(161,'Choose the correct sentence','19','multiple_choice',NULL,NULL),(162,'While I _#answer1#_ (listen / listened / was listening / am listening) to your story, I _#answer2#_ (remembered / remembering / was remembering / remember) that my wife _#answer3#_ (asked /ask /asking / had asked) me to call the plumber to fix the tap.','20','fill_blank','FillInTheBlankEvaluator',NULL),(163,'Select the correct option \r\n','21','multiple_choice',NULL,NULL),(164,'I would rather have tea ______ coffee. ','22','multiple_choice',NULL,NULL),(165,'Choose the correct sentence','23','multiple_choice',NULL,NULL),(166,'______ bad weather, classes will be cancelled. ','24','multiple_choice',NULL,NULL),(167,'I went to _#answer1#_ <i>(a/an/the/blank)</i> airport at 6:00 AM yesterday. I had to catch a flight to America. The lines at _#answer2#_ <i>(a/an/the/blank)</i> airport were very long, so I had to wait a long time. Once _#answer3#_ <i>(a/an/the/blank)</i> aeroplane took off I tried to get some sleep but I couldn\'t. Then I ate _#answer4#_ <i>(a/an/the/blank)</i> pretty good meal. My fellow passenger was _#answer5#_ <i>(a/an/the/blank)</i> president of a multinational company. Later, I spoke to one of_#answer6#_ <i>(a/an/the/blank)</i> flight attendants for a while. He was soft-spoken. He told me that _#answer7#_ <i>(a/an/the/blank)</i> pilot of the airplane was Indian. I managed to fall asleep for about _#answer8#_ <i>(a/an/the/blank)</i> hour. After I woke up, I felt refreshed. I ordered _#answer9#_ <i>(a/an/the/blank)</i> cup of tea. Generally, it was _#answer10#_ <i>(a/an/the/blank)</i> pretty smooth flight.','25','fill_blank','FillInTheBlankEvaluator',NULL),(168,'I took a bath before I _#answer1#_ ready for school.','11','fill_blank','FillInTheBlankEvaluator',NULL),(169,'Satish  _#answer1#_ me if I want to sell my car.','12','fill_blank','FillInTheBlankEvaluator',NULL),(170,'When we went to the zoo, we _#answer1#_ a white tiger and her cubs.','13','fill_blank','FillInTheBlankEvaluator',NULL),(171,'Chetan _#answer1#_ a big toad in his garden.','14','fill_blank','FillInTheBlankEvaluator',NULL),(172,'We _#answer1#_ the place at exactly 10:00am','15','fill_blank','FillInTheBlankEvaluator',NULL),(173,'I _#answer1#_ to do my homework? ','26','fill_blank','FillInTheBlankEvaluator',NULL),(174,'Jatin _#answer1#_ a new motorcycle.','27','fill_blank','FillInTheBlankEvaluator',NULL),(175,'We _#answer1#_ the movie tickets for Rs.1,000. ','28','fill_blank','FillInTheBlankEvaluator',NULL),(176,'My mother had to stitch my pant because I _#answer1#_ a hole in it','29','fill_blank','FillInTheBlankEvaluator',NULL),(177,'India _#answer1#_ a new prime minister in 2014.','30','fill_blank','FillInTheBlankEvaluator',NULL),(178,'Shekhar _#answer1#_ to Pravin\'s house after school.','51','fill_blank','FillInTheBlankEvaluator',NULL),(179,'He _#answer1#_ all the bottles with milk and water.','52','fill_blank','FillInTheBlankEvaluator',NULL),(180,'We cannot afford to go to the picnic until dad gets _#answer1#_ on Tuesday.','53','fill_blank','FillInTheBlankEvaluator',NULL),(181,'The snake _#answer1#_ the eggs from the nest. ','54','fill_blank','FillInTheBlankEvaluator',NULL),(182,'The guard dog was _#answer1#_ to the fence by a chain.','55','fill_blank','FillInTheBlankEvaluator',NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_attribute`
--

DROP TABLE IF EXISTS `question_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `question_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_attribute_question_idx` (`question_id`),
  CONSTRAINT `fk_question_attribute_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='This entity will hold the various attributes associated with question e.g complexity or tags (like comprehension, grammar, tenses etc.). For adaptive tests this attributes will be looked to get a question in random';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_attribute`
--

LOCK TABLES `question_attribute` WRITE;
/*!40000 ALTER TABLE `question_attribute` DISABLE KEYS */;
INSERT INTO `question_attribute` VALUES (5,22,'topic','SVA'),(6,23,'topic','Tenses'),(7,24,'topic','Preposition'),(8,25,'topic','SVA'),(9,26,'topic','Tenses'),(10,27,'topic','Preposition'),(11,28,'topic','Preposition'),(12,29,'topic','Preposition'),(13,30,'topic','SVA'),(14,31,'topic','SVA'),(15,32,'topic','Tenses'),(16,33,'topic','SVA'),(17,34,'topic','Preposition'),(18,35,'topic','SVA'),(19,36,'topic','Tenses'),(20,37,'topic','SVA'),(21,38,'topic','Tenses'),(22,39,'topic','Preposition'),(23,40,'topic','SVA'),(24,41,'topic','Tenses'),(25,42,'topic','SVA'),(26,43,'topic','Preposition'),(27,44,'topic','SVA'),(28,45,'topic','Tenses'),(29,46,'topic','SVA'),(30,47,'topic','Tenses'),(31,48,'topic','Preposition'),(32,49,'topic','Tenses'),(33,50,'topic','SVA'),(34,51,'topic','Tenses'),(35,52,'topic','Preposition'),(36,53,'topic','Tenses'),(37,54,'topic','Preposition'),(38,55,'topic','Tenses'),(39,56,'topic','Preposition'),(40,57,'topic','Tenses'),(41,58,'topic','Preposition'),(42,59,'topic','Tenses'),(43,60,'topic','SVA'),(44,61,'topic','Conjunction'),(45,62,'topic','Pronouns'),(46,63,'topic','Conjunction'),(47,64,'topic','Pronouns'),(48,65,'topic','Conjunction'),(49,66,'topic','Pronouns'),(50,67,'topic','Conjunction'),(51,68,'topic','Pronouns'),(52,69,'topic','Conjunction'),(53,70,'topic','Pronouns'),(54,71,'topic','Conjunction'),(55,72,'topic','Pronouns'),(56,73,'topic','Conjunction'),(57,74,'topic','Pronouns'),(58,75,'topic','Conjunction'),(59,76,'topic','Pronouns'),(60,77,'topic','Conjunction'),(61,78,'topic','Pronouns'),(62,79,'topic','Conjunction'),(63,80,'topic','Pronouns'),(64,81,'topic','Pronouns'),(65,82,'topic','Conjunction'),(66,83,'topic','Pronouns'),(67,84,'topic','Pronouns'),(68,85,'topic','Conjunction'),(69,86,'topic','Pronouns'),(70,87,'topic','Pronouns'),(71,88,'topic','Quantifiers'),(72,89,'topic','Modals'),(73,90,'topic','Tenses'),(74,91,'topic','SVA'),(75,92,'topic','Quantifiers'),(76,93,'topic','Modals'),(77,94,'topic','Tenses'),(78,95,'topic','SVA'),(79,96,'topic','Quantifiers'),(80,97,'topic','Modals'),(81,98,'topic','Tenses'),(82,99,'topic','SVA'),(83,100,'topic','Quantifiers'),(84,101,'topic','Modals'),(85,102,'topic','Tenses'),(86,103,'topic','SVA'),(87,104,'topic','Quantifiers'),(88,105,'topic','Modals'),(89,106,'topic','Tenses'),(90,107,'topic','SVA'),(91,108,'topic','Quantifiers'),(92,109,'topic','Modals'),(93,110,'topic','Quantifiers'),(94,111,'topic','Modals'),(95,112,'topic','SVA'),(96,113,'topic','Modals'),(97,114,'topic','Quantifiers'),(98,115,'topic','SVA'),(99,116,'topic','Tenses'),(100,117,'topic','Modals'),(101,118,'topic','SVA'),(102,119,'topic','Modals'),(103,120,'topic','Quantifiers'),(104,121,'topic','Tenses'),(105,122,'topic','Modals'),(106,123,'topic','SVA'),(107,124,'topic','Quantifiers'),(108,125,'topic','SVA'),(109,126,'topic','Modals'),(110,127,'topic','Quantifiers'),(111,128,'topic','SVA'),(112,129,'topic','Tenses'),(113,130,'topic','Modals'),(114,131,'topic','Quantifiers'),(115,132,'topic','SVA'),(116,133,'topic','Quantifiers'),(117,134,'topic','Tenses'),(118,135,'topic','SVA'),(119,136,'topic','Modals'),(120,137,'topic','Quantifiers'),(121,138,'topic','Modals'),(122,139,'topic','SVA'),(123,140,'topic','Quantifiers'),(124,141,'topic','SVA'),(125,142,'topic','Tenses'),(126,143,'topic','Gerund'),(127,144,'topic','Tenses'),(128,145,'topic','Conjunction'),(129,146,'topic','Gerund'),(130,147,'topic','Conjunction'),(131,148,'topic','Gerund'),(132,149,'topic','Conjunction'),(133,150,'topic','Tenses'),(134,151,'topic','Gerund'),(135,152,'topic','Conjunction'),(136,153,'topic','Gerund'),(137,154,'topic','Tenses'),(138,155,'topic','Conjunction'),(139,156,'topic','Gerund'),(140,157,'topic','Conjunction'),(141,158,'topic','Gerund'),(142,159,'topic','Conjunction'),(143,160,'topic','Conjunction'),(144,161,'topic','Gerund'),(145,162,'topic','Tenses'),(146,163,'topic','Gerund'),(147,164,'topic','Conjunction'),(148,165,'topic','Gerund'),(149,166,'topic','Conjunction'),(150,167,'topic','Article'),(151,168,'topic','Verbs'),(152,169,'topic','Verbs'),(153,170,'topic','Verbs'),(154,171,'topic','Verbs'),(155,172,'topic','Verbs'),(156,173,'topic','Verbs'),(157,174,'topic','Verbs'),(158,175,'topic','Verbs'),(159,176,'topic','Verbs'),(160,177,'topic','Verbs'),(161,178,'topic','Verbs'),(162,179,'topic','Verbs'),(163,180,'topic','Verbs'),(164,181,'topic','Verbs'),(165,182,'topic','Verbs'),(166,21,'topic','Preposition');
/*!40000 ALTER TABLE `question_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_set`
--

DROP TABLE IF EXISTS `question_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passage_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question_set_definition_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_question_set_passage1_idx` (`passage_id`),
  KEY `fk_question_set_question1_idx` (`question_id`),
  KEY `fk_question_set_question_set_definition1_idx` (`question_set_definition_id`),
  CONSTRAINT `fk_question_set_passage1` FOREIGN KEY (`passage_id`) REFERENCES `passage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_set_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_set_question_set_definition1` FOREIGN KEY (`question_set_definition_id`) REFERENCES `question_set_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='A question_set is used to relate all the questions that run of a passage or a audio clip';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_set`
--

LOCK TABLES `question_set` WRITE;
/*!40000 ALTER TABLE `question_set` DISABLE KEYS */;
INSERT INTO `question_set` VALUES (1,1,10,1,1),(2,1,11,1,2),(3,1,12,1,3),(4,1,13,1,4),(5,1,14,1,5),(6,2,15,2,6),(7,2,16,2,7),(8,2,17,2,8),(9,2,18,2,9),(10,2,19,2,10),(11,3,20,3,11),(12,4,168,4,1),(13,4,169,4,2),(14,4,170,4,3),(15,4,171,4,4),(16,4,172,4,5),(17,5,173,5,1),(18,5,174,5,2),(19,5,175,5,3),(20,5,176,5,4),(21,5,177,5,5),(22,6,178,6,1),(23,6,179,6,2),(24,6,180,6,3),(25,6,181,6,4),(26,6,182,6,5);
/*!40000 ALTER TABLE `question_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_set_definition`
--

DROP TABLE IF EXISTS `question_set_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_set_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_set_definition`
--

LOCK TABLES `question_set_definition` WRITE;
/*!40000 ALTER TABLE `question_set_definition` DISABLE KEYS */;
INSERT INTO `question_set_definition` VALUES (1,'Passage 1'),(2,'Passage 2'),(3,'Passage 3'),(4,'Section#2 passage1'),(5,'Section#2 passage2'),(6,'Section#2 passage3');
/*!40000 ALTER TABLE `question_set_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Type of the section. Fixed implies the questions are picked from defined set',
  `timeLimit` int(11) NOT NULL DEFAULT '300',
  `evaluatingClass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='A section is group of questions that are related logically';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'Section #1','fixed',900,'SectionOneEvaluator'),(2,'Section #2','fixed',1320,'SectionTwoEvaluator'),(3,'Section #3','fixed',600,'SectionThreeEvaluator'),(4,'Section #4','fixed',1200,'SectionFourEvaluator'),(5,'Section #5','fixed',840,'SectionFiveEvaluator');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_attribute`
--

DROP TABLE IF EXISTS `section_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_section_attribute_section1_idx` (`section_id`),
  CONSTRAINT `fk_section_attribute_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This entity will hold the various attributes with regards to a section';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_attribute`
--

LOCK TABLES `section_attribute` WRITE;
/*!40000 ALTER TABLE `section_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `section_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_questions`
--

DROP TABLE IF EXISTS `section_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `question_set_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_section_questions_section1_idx` (`section_id`),
  KEY `fk_section_questions_question1_idx` (`question_id`),
  KEY `fk_section_questions_question_set_definition1_idx` (`question_set_definition_id`),
  CONSTRAINT `fk_section_questions_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_questions_question_set_definition1` FOREIGN KEY (`question_set_definition_id`) REFERENCES `question_set_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_questions_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_questions`
--

LOCK TABLES `section_questions` WRITE;
/*!40000 ALTER TABLE `section_questions` DISABLE KEYS */;
INSERT INTO `section_questions` VALUES (1,1,NULL,1,1),(2,1,NULL,2,2),(3,1,NULL,3,3),(4,2,21,1,NULL),(5,2,22,2,NULL),(6,2,23,3,NULL),(7,2,24,4,NULL),(8,2,25,5,NULL),(9,2,26,6,NULL),(10,2,27,7,NULL),(11,2,28,8,NULL),(12,2,29,9,NULL),(13,2,30,10,NULL),(14,2,NULL,11,4),(15,2,31,12,NULL),(16,2,32,13,NULL),(17,2,33,14,NULL),(18,2,34,15,NULL),(19,2,35,16,NULL),(20,2,36,17,NULL),(21,2,37,18,NULL),(22,2,38,19,NULL),(23,2,39,20,NULL),(24,2,40,21,NULL),(25,2,NULL,22,5),(26,2,41,23,NULL),(27,2,42,24,NULL),(28,2,43,25,NULL),(29,2,44,26,NULL),(30,2,45,27,NULL),(31,2,46,28,NULL),(32,2,47,29,NULL),(33,2,48,30,NULL),(34,2,49,31,NULL),(35,2,50,32,NULL),(36,2,51,33,NULL),(37,2,52,34,NULL),(38,2,53,35,NULL),(39,2,54,36,NULL),(40,2,55,37,NULL),(41,2,56,38,NULL),(42,2,57,39,NULL),(43,2,58,40,NULL),(44,2,59,41,NULL),(45,2,60,42,NULL),(46,2,NULL,43,6),(47,3,61,1,NULL),(48,3,62,2,NULL),(49,3,63,3,NULL),(50,3,64,4,NULL),(51,3,65,5,NULL),(52,3,66,6,NULL),(53,3,67,7,NULL),(54,3,68,8,NULL),(55,3,69,9,NULL),(56,3,70,10,NULL),(57,3,71,11,NULL),(58,3,72,12,NULL),(59,3,73,13,NULL),(60,3,74,14,NULL),(61,3,75,15,NULL),(62,3,76,16,NULL),(63,3,77,17,NULL),(64,3,78,18,NULL),(65,3,79,19,NULL),(66,3,80,20,NULL),(67,3,81,21,NULL),(68,3,82,22,NULL),(69,3,83,23,NULL),(70,3,84,24,NULL),(71,3,85,25,NULL),(72,3,86,26,NULL),(73,3,87,27,NULL),(74,4,88,1,NULL),(75,4,89,2,NULL),(76,4,90,3,NULL),(77,4,91,4,NULL),(78,4,92,5,NULL),(79,4,93,6,NULL),(80,4,94,7,NULL),(81,4,95,8,NULL),(82,4,96,9,NULL),(83,4,97,10,NULL),(84,4,98,11,NULL),(85,4,99,12,NULL),(86,4,100,13,NULL),(87,4,101,14,NULL),(88,4,102,15,NULL),(89,4,103,16,NULL),(90,4,104,17,NULL),(91,4,105,18,NULL),(92,4,106,19,NULL),(93,4,107,20,NULL),(94,4,108,21,NULL),(95,4,109,22,NULL),(96,4,110,23,NULL),(97,4,111,24,NULL),(98,4,112,25,NULL),(99,4,113,26,NULL),(100,4,114,27,NULL),(101,4,115,28,NULL),(102,4,116,29,NULL),(103,4,117,30,NULL),(104,4,118,31,NULL),(105,4,119,32,NULL),(106,4,120,33,NULL),(107,4,121,34,NULL),(108,4,122,35,NULL),(109,4,123,36,NULL),(110,4,124,37,NULL),(111,4,125,38,NULL),(112,4,126,39,NULL),(113,4,127,40,NULL),(114,4,128,41,NULL),(115,4,129,42,NULL),(116,4,130,43,NULL),(117,4,131,44,NULL),(118,4,132,45,NULL),(119,4,133,46,NULL),(120,4,134,47,NULL),(121,4,135,48,NULL),(122,4,136,49,NULL),(123,4,137,50,NULL),(124,4,138,51,NULL),(125,4,139,52,NULL),(126,4,140,53,NULL),(127,4,141,54,NULL),(128,4,142,55,NULL),(129,5,143,1,NULL),(130,5,144,2,NULL),(131,5,145,3,NULL),(132,5,146,4,NULL),(133,5,147,5,NULL),(134,5,148,6,NULL),(135,5,149,7,NULL),(136,5,150,8,NULL),(137,5,151,9,NULL),(138,5,152,10,NULL),(139,5,153,11,NULL),(140,5,154,12,NULL),(141,5,155,13,NULL),(142,5,156,14,NULL),(143,5,157,15,NULL),(144,5,158,16,NULL),(145,5,159,17,NULL),(146,5,160,18,NULL),(147,5,161,19,NULL),(148,5,162,20,NULL),(149,5,163,21,NULL),(150,5,164,22,NULL),(151,5,165,23,NULL),(152,5,166,24,NULL),(153,5,167,25,NULL);
/*!40000 ALTER TABLE `section_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='This entity will be used to define a test ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'English Language Certification Test','English Language Certification Test');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_attempt`
--

DROP TABLE IF EXISTS `test_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `overall_grade` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `communication_grade` varchar(45) DEFAULT NULL,
  `comprehension_grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_attempt_user1_idx` (`user_id`),
  KEY `fk_test_attempt_test1_idx` (`test_id`),
  CONSTRAINT `fk_test_attempt_test1` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_attempt_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='This entity will hold the attempts of a given test by the user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_attempt`
--

LOCK TABLES `test_attempt` WRITE;
/*!40000 ALTER TABLE `test_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_attempt_analytics`
--

DROP TABLE IF EXISTS `test_attempt_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_attempt_analytics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_attempt_id` int(11) NOT NULL,
  `test_section_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_attempt_analytics_test_attempt1_idx` (`test_attempt_id`),
  KEY `fk_test_attempt_analytics_test_section1_idx` (`test_section_id`),
  CONSTRAINT `fk_test_attempt_analytics_test_attempt1` FOREIGN KEY (`test_attempt_id`) REFERENCES `test_attempt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_attempt_analytics_test_section1` FOREIGN KEY (`test_section_id`) REFERENCES `test_section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This entity will hold the analysis of the test attempts in terms of questions attempted, correct answers areas of improvement etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_attempt_analytics`
--

LOCK TABLES `test_attempt_analytics` WRITE;
/*!40000 ALTER TABLE `test_attempt_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_attempt_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_section`
--

DROP TABLE IF EXISTS `test_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_has_section_section1_idx` (`section_id`),
  KEY `fk_test_has_section_test1_idx` (`test_id`),
  CONSTRAINT `fk_test_has_section_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_has_section_test1` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='This entity will hold all the section for a given test';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_section`
--

LOCK TABLES `test_section` WRITE;
/*!40000 ALTER TABLE `test_section` DISABLE KEYS */;
INSERT INTO `test_section` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,1,4,4),(5,1,5,5);
/*!40000 ALTER TABLE `test_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(500) NOT NULL,
  `first_name` varchar(500) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='This entity defines the various users in the systems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'naik.pranil@gmail.com','pranil','naik',1,'evaluator'),(5,'rixonmathew@gmail.com','rixon','mathew',1,'evaluator'),(7,'tester@guv.org','Tester','last_tester',0,'password');
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

-- Dump completed on 2014-12-24 11:42:47
