-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: donorworkflow
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `bulk_email_list`
--

DROP TABLE IF EXISTS `bulk_email_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_list` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_list`
--

LOCK TABLES `bulk_email_list` WRITE;
/*!40000 ALTER TABLE `bulk_email_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committed_donation_details`
--

DROP TABLE IF EXISTS `committed_donation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committed_donation_details` (
  `donation_commit_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `commit_date` date NOT NULL,
  `commit_time` time NOT NULL,
  `commit_amt` int(11) NOT NULL,
  `currency` enum('USD','GBP','EUR','BITCOIN') NOT NULL,
  `payment_mode` enum('Paypal','Online Bank','CreditCard','Crypto','Cheque') DEFAULT NULL,
  `remarks` longblob,
  PRIMARY KEY (`donation_commit_id`),
  UNIQUE KEY `commitred_donation_details_donation_commit_id_uindex` (`donation_commit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Contain details of all donations which have been committed by donors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committed_donation_details`
--

LOCK TABLES `committed_donation_details` WRITE;
/*!40000 ALTER TABLE `committed_donation_details` DISABLE KEYS */;
INSERT INTO `committed_donation_details` VALUES (1,1011,'2017-08-07','15:16:00',200,'USD','Online Bank','Test Case'),(2,1010,'2017-08-09','00:30:00',200,'USD','Paypal','This is a first donation test');
/*!40000 ALTER TABLE `committed_donation_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_donation_details`
--

DROP TABLE IF EXISTS `credit_donation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_donation_details` (
  `credit_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `credit_date` date NOT NULL,
  `credit_time` time NOT NULL,
  `amount` int(11) NOT NULL,
  `currency` enum('USD','GBP','EUR','BITCOIN') NOT NULL,
  `payment_mode` enum('Paypal','Online Bank','CreditCard','Crypto','Cheque') NOT NULL,
  `credit_reference` varchar(80) NOT NULL,
  `payment_date` date NOT NULL,
  `receipt_disp_mode` enum('EmailandPost','Email','Post','DontSend') DEFAULT NULL,
  `remarks` longblob,
  PRIMARY KEY (`credit_id`),
  UNIQUE KEY `credit_donation_details_donor_id_uindex` (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_donation_details`
--

LOCK TABLES `credit_donation_details` WRITE;
/*!40000 ALTER TABLE `credit_donation_details` DISABLE KEYS */;
INSERT INTO `credit_donation_details` VALUES (4,1010,'2017-08-14','14:37:00',200,'USD','Online Bank','A737373','2017-08-02','Email','sdsad');
/*!40000 ALTER TABLE `credit_donation_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_details`
--

DROP TABLE IF EXISTS `donor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(15) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `donor_status` enum('New','Allotted','Committed','Transferred') NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `org` varchar(200) DEFAULT NULL,
  `contact_person` varchar(80) NOT NULL,
  `contact_date` date NOT NULL,
  `anonymous_select` enum('Yes','No') DEFAULT 'No',
  `volunteer_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `donor_details_id_uindex` (`id`),
  UNIQUE KEY `donor_details_email_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=latin1 COMMENT='Contains the details of prospective and committed donors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_details`
--

LOCK TABLES `donor_details` WRITE;
/*!40000 ALTER TABLE `donor_details` DISABLE KEYS */;
INSERT INTO `donor_details` VALUES (1009,'Mrs','Kera Stanley','Allotted','111222','saur_singh@iitkgp.ac.in','Stanley Foods','Saurabh Singh','2017-06-27','No','Tejas Kumar'),(1010,'Mr','Kunal Sethi','Committed','777777777','sethi@gmail.com','Sethi & Sons','Harsh Tiwari','2017-06-30','No','Tejas Kumar'),(1011,'Mr','Hary King','Committed','38388393','haryking@gmail.com','Hary & Sons','Saurabh Singh','2017-07-01','No','Himanshu Singh');
/*!40000 ALTER TABLE `donor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_email_logs`
--

DROP TABLE IF EXISTS `donor_email_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor_email_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_date` date NOT NULL,
  `contact_time` time NOT NULL,
  `contact_person` varchar(80) NOT NULL,
  `donor_id` int(11) NOT NULL,
  `main_body` longblob NOT NULL,
  `full_email` longblob,
  `mail_code` varchar(20) NOT NULL,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `donor_email_logs_mail_code_uindex` (`mail_code`),
  KEY `donor_phone_logs_donor_details_id_fk` (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COMMENT='Contains Logs of all Email  Conversation between Volunteers and Donors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_email_logs`
--

LOCK TABLES `donor_email_logs` WRITE;
/*!40000 ALTER TABLE `donor_email_logs` DISABLE KEYS */;
INSERT INTO `donor_email_logs` VALUES (1,'2017-07-18','09:44:00','Saurabh Singh',1009,'I wish to write to you as a sample case from here','Respected Mrs Kera Stanley\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-07-18 at 09:44 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#9038ECEB475A7344','9038ECEB475A7344'),(2,'2017-07-18','09:51:00','Saurabh Singh',1009,'I am writing this dummy email regarding a funny thing','My Dear Mrs Kera Stanley\n\nI am writing this dummy email regarding a funny thing\n\nThanking You\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-07-18 at 09:51 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#4E7192B9D2AE9D5B','4E7192B9D2AE9D5B'),(3,'2017-07-18','09:58:00','Saurabh Singh',1009,'This is just the body for testing. I have to write a long email, hence this is the only way to check my application.\r\n\r\nActually it differs person to person. I am getting Rs.12,400/month stipend by doing TA work. I am spending my stipend in the following ways.\r\n\r\n    Paying semester, hostel and mess fee (In IITs this would come around rupees 40k per semester. Which means approximately 8k of monthly stipend has to be saved for this)\r\n    Some amount of money I will spend on my other expenditures like outing, movies, shopping(including laptop, mobile, earphone, etc), mobile recharge & data, outside eating, treats etc\r\n    Travelling (i.e going home). Since I am staying somewhat faraway from my hometown I have to spend some significant amount of money on that','My Dear Mrs Kera Stanley\n\nThis is just the body for testing. I have to write a long email, hence this is the only way to check my application.\r\n\r\nActually it differs person to person. I am getting Rs.12,400/month stipend by doing TA work. I am spending my stipend in the following ways.\r\n\r\n    Paying semester, hostel and mess fee (In IITs this would come around rupees 40k per semester. Which means approximately 8k of monthly stipend has to be saved for this)\r\n    Some amount of money I will spend on my other expenditures like outing, movies, shopping(including laptop, mobile, earphone, etc), mobile recharge & data, outside eating, treats etc\r\n    Travelling (i.e going home). Since I am staying somewhat faraway from my hometown I have to spend some significant amount of money on that\n\nWishing you all the very best\n\nSaurabh Singh\r\nVolunteer Person\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-07-18 at 09:58 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#7FA05CCBD459B8AD','7FA05CCBD459B8AD'),(4,'2017-07-18','10:01:00','Saurabh Singh',1010,'x\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\n','My Dear Mr Kunal Sethi\n\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\n\n\nThanking You\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-07-18 at 10:01 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#953C543783C96D03','953C543783C96D03'),(5,'2017-08-03','23:27:00','Saurabh Singh',1009,'How are you going','Hello Mrs Kera Stanley\n\nHow are you going\n\nWith warm regards\n\nSaurabh Singh\n\nThis message has been generated by Saurabh Singh on 2017-08-03 at 23:27 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#9ADD61A70D5E5236','9ADD61A70D5E5236'),(6,'2017-08-03','23:29:00','Saurabh Singh',1009,'This is a testing module after changes','Respected Mrs Kera Stanley\n\nThis is a testing module after changes\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-03 at 23:29 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#243F6C00D0958066','243F6C00D0958066'),(7,'2017-08-03','23:29:00','Saurabh Singh',1010,'This is a testing module after changes','Respected Mr Kunal Sethi\n\nThis is a testing module after changes\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-03 at 23:29 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#B0B5483D9F8D966E','B0B5483D9F8D966E'),(8,'2017-08-03','23:41:00','Saurabh Singh',1009,'This is just the body for testing.How are you doing','My Dear Mrs Kera Stanley\n\nThis is just the body for testing.How are you doing\n\nWishing you all the very best\n\nSaurabh Singh\r\nVolunteer Person\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-03 at 23:41 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#9923CD4AB49623E4','9923CD4AB49623E4'),(9,'2017-08-07','00:07:00','Saurabh Singh',1009,'I wish to write to you as a sample case from here.I am attaching a sample file for your persusal','Respected Mrs Kera Stanley\n\nI wish to write to you as a sample case from here.I am attaching a sample file for your persusal\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 00:07 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#BFA53C2DB8E36A44','BFA53C2DB8E36A44'),(10,'2017-08-07','00:08:00','Saurabh Singh',1009,'This is just the body for testing','My Dear Mrs Kera Stanley\n\nThis is just the body for testing\n\nWishing you all the very best\n\nSaurabh Singh\r\nVolunteer Person\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 00:08 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#05997765D33D1AC3','05997765D33D1AC3'),(11,'2017-08-07','00:54:00','Saurabh Singh',1009,'I wish to write to you as a sample case from here','Respected Mrs Kera Stanley\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 00:54 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#9725CD23565660B9','9725CD23565660B9'),(12,'2017-08-07','00:54:00','Saurabh Singh',1010,'I wish to write to you as a sample case from here','Respected Mr Kunal Sethi\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 00:54 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#132CF2056B166028','132CF2056B166028'),(13,'2017-08-07','01:11:00','Saurabh Singh',1009,'I wish to write to you as a sample case from here','Respected Mrs Kera Stanley\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 01:11 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#545F2A2F0CDF107B','545F2A2F0CDF107B'),(14,'2017-08-07','01:14:00','Saurabh Singh',1009,'I wish to write to you as a sample case from here','Respected Mrs Kera Stanley\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 01:14 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#331C12DD83656825','331C12DD83656825'),(15,'2017-08-07','01:14:00','Saurabh Singh',1010,'I wish to write to you as a sample case from here','Respected Mr Kunal Sethi\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 01:14 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#9309F8C8E966D945','9309F8C8E966D945'),(16,'2017-08-07','01:19:00','Saurabh Singh',1009,'I wish to write to you as a sample case from here','Respected Mrs Kera Stanley\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 01:19 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#EE0CA6FE46270F57','EE0CA6FE46270F57'),(17,'2017-08-07','01:19:00','Saurabh Singh',1010,'I wish to write to you as a sample case from here','Respected Mr Kunal Sethi\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 01:19 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#C93E9A4DD2EEC330','C93E9A4DD2EEC330'),(18,'2017-08-07','17:33:00','$_EMAIL',1009,'I wish to write to you as a sample case from here','Respected Mrs Kera Stanley\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by $_EMAIL on 2017-08-07 at 17:33 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#572CE3D95EE27059','572CE3D95EE27059'),(19,'2017-08-07','17:33:00','$_EMAIL',1010,'I wish to write to you as a sample case from here','Respected Mr Kunal Sethi\n\nI wish to write to you as a sample case from here\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by $_EMAIL on 2017-08-07 at 17:33 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#47249A681EA61534','47249A681EA61534'),(20,'2017-08-07','20:18:00','Tejas Kumar',1009,'I wish to write to you as a sample case from here. I know you would have been mailed at saur_singh@iitkgp.ac.in or phoned at 111222. Your Anonymous Call is No','Respected Mrs Kera Stanley\n\nI wish to write to you as a sample case from here. I know you would have been mailed at saur_singh@iitkgp.ac.in or phoned at 111222. Your Anonymous Call is No\n\nWith Warm Regards from Tejas Kumar\n\nTejas Kumar\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Tejas Kumar on 2017-08-07 at 20:18 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#4F7004503D5B9503','4F7004503D5B9503'),(21,'2017-08-07','20:22:00','Saurabh Singh',1009,'This is a mail merge testing mail by Tejas Kumar. You were contacted on 2017-06-27 by Saurabh Singh via either Email on saur_singh@iitkgp.ac.in or by phone on 111222. Your profile has been set for Anonymous Choice as No. Your current account status is Allotted.','Respected Kera Stanley\n\nThis is a mail merge testing mail by Tejas Kumar. You were contacted on 2017-06-27 by Saurabh Singh via either Email on saur_singh@iitkgp.ac.in or by phone on 111222. Your profile has been set for Anonymous Choice as No. Your current account status is Allotted.\n\nWith Warm Regards from Tejas Kumar\n\nTejas Kumar\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 20:22 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#0430CE6466D4B4B1','0430CE6466D4B4B1'),(22,'2017-08-07','20:22:00','Saurabh Singh',1010,'This is a mail merge testing mail by Tejas Kumar. You were contacted on 2017-06-27 by Saurabh Singh via either Email on saur_singh@iitkgp.ac.in or by phone on 111222. Your profile has been set for Anonymous Choice as No. Your current account status is Allotted.','Respected Kera Stanley\n\nThis is a mail merge testing mail by Tejas Kumar. You were contacted on 2017-06-27 by Saurabh Singh via either Email on saur_singh@iitkgp.ac.in or by phone on 111222. Your profile has been set for Anonymous Choice as No. Your current account status is Allotted.\n\nWith Warm Regards from Tejas Kumar\n\nTejas Kumar\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 20:22 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#D190D9E114D6B277','D190D9E114D6B277'),(23,'2017-08-07','21:16:00','Saurabh Singh',1010,'Sethi & Sons 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n777777777 	Telephone Number of Donor\r\nsethi@gmail.com 	Email of Donor\r\nHarsh Tiwari 	Contact Person of Donor\r\n2017-06-30 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar','Respected Kunal Sethi\n\nSethi & Sons 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n777777777 	Telephone Number of Donor\r\nsethi@gmail.com 	Email of Donor\r\nHarsh Tiwari 	Contact Person of Donor\r\n2017-06-30 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:16 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#C8985BE6A9DD52A1','C8985BE6A9DD52A1'),(24,'2017-08-07','21:18:00','Saurabh Singh',1009,'1009 	Unique ID of Donor\r\nMrs 	Salutation title of Donor (Eg Mr/Ms)\r\nKera Stanley 	Full Name of Donor\r\nStanley Foods 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n111222 	Telephone Number of Donor\r\nsaur_singh@iitkgp.ac.in 	Email of Donor\r\nSaurabh Singh 	Contact Person of Donor\r\n2017-06-27 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar 	Name of Volunteer assigned to Donor','Respected Mrs Kera Stanley\n\n1009 	Unique ID of Donor\r\nMrs 	Salutation title of Donor (Eg Mr/Ms)\r\nKera Stanley 	Full Name of Donor\r\nStanley Foods 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n111222 	Telephone Number of Donor\r\nsaur_singh@iitkgp.ac.in 	Email of Donor\r\nSaurabh Singh 	Contact Person of Donor\r\n2017-06-27 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar 	Name of Volunteer assigned to Donor\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:18 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#73FA60D7CFF7E5A3','73FA60D7CFF7E5A3'),(25,'2017-08-07','21:18:00','Saurabh Singh',1010,'1009 	Unique ID of Donor\r\nMrs 	Salutation title of Donor (Eg Mr/Ms)\r\nKera Stanley 	Full Name of Donor\r\nStanley Foods 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n111222 	Telephone Number of Donor\r\nsaur_singh@iitkgp.ac.in 	Email of Donor\r\nSaurabh Singh 	Contact Person of Donor\r\n2017-06-27 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar 	Name of Volunteer assigned to Donor','Respected Mrs Kera Stanley\n\n1009 	Unique ID of Donor\r\nMrs 	Salutation title of Donor (Eg Mr/Ms)\r\nKera Stanley 	Full Name of Donor\r\nStanley Foods 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n111222 	Telephone Number of Donor\r\nsaur_singh@iitkgp.ac.in 	Email of Donor\r\nSaurabh Singh 	Contact Person of Donor\r\n2017-06-27 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar 	Name of Volunteer assigned to Donor\n\nWith Warm Regards\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:18 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#00609F9B16B84679','00609F9B16B84679'),(26,'2017-08-07','21:34:00','Saurabh Singh',1009,'$_DONORID 	Unique ID of Donor\r\n$_TITLE 	Salutation title of Donor (Eg Mr/Ms)\r\n$_NAME 	Full Name of Donor\r\n$_ORG 	Organisation of Donor\r\n$_STATUS 	Current status of Donor\r\n$_PHONE 	Telephone Number of Donor\r\n$_EMAIL 	Email of Donor\r\n$_CONTACTPERS 	Contact Person of Donor\r\n$_CONTACTDATE 	First Contact Date of Donor\r\n$_ANONYMOUS 	Stay Anonymous Option of Donor\r\n$_VOLUNTEER 	Name of Volunteer assigned to Donor','Dear $_NAME\n\n$_DONORID 	Unique ID of Donor\r\n$_TITLE 	Salutation title of Donor (Eg Mr/Ms)\r\n$_NAME 	Full Name of Donor\r\n$_ORG 	Organisation of Donor\r\n$_STATUS 	Current status of Donor\r\n$_PHONE 	Telephone Number of Donor\r\n$_EMAIL 	Email of Donor\r\n$_CONTACTPERS 	Contact Person of Donor\r\n$_CONTACTDATE 	First Contact Date of Donor\r\n$_ANONYMOUS 	Stay Anonymous Option of Donor\r\n$_VOLUNTEER 	Name of Volunteer assigned to Donor\n\nWith Warm Regards from $_VOLUNTEER\n\n$_VOLUNTEER\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:34 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#B682F100D9F90C7B','B682F100D9F90C7B'),(27,'2017-08-07','21:34:00','Saurabh Singh',1010,'$_DONORID 	Unique ID of Donor\r\n$_TITLE 	Salutation title of Donor (Eg Mr/Ms)\r\n$_NAME 	Full Name of Donor\r\n$_ORG 	Organisation of Donor\r\n$_STATUS 	Current status of Donor\r\n$_PHONE 	Telephone Number of Donor\r\n$_EMAIL 	Email of Donor\r\n$_CONTACTPERS 	Contact Person of Donor\r\n$_CONTACTDATE 	First Contact Date of Donor\r\n$_ANONYMOUS 	Stay Anonymous Option of Donor\r\n$_VOLUNTEER 	Name of Volunteer assigned to Donor','Dear $_NAME\n\n$_DONORID 	Unique ID of Donor\r\n$_TITLE 	Salutation title of Donor (Eg Mr/Ms)\r\n$_NAME 	Full Name of Donor\r\n$_ORG 	Organisation of Donor\r\n$_STATUS 	Current status of Donor\r\n$_PHONE 	Telephone Number of Donor\r\n$_EMAIL 	Email of Donor\r\n$_CONTACTPERS 	Contact Person of Donor\r\n$_CONTACTDATE 	First Contact Date of Donor\r\n$_ANONYMOUS 	Stay Anonymous Option of Donor\r\n$_VOLUNTEER 	Name of Volunteer assigned to Donor\n\nWith Warm Regards from $_VOLUNTEER\n\n$_VOLUNTEER\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:34 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#A9D171E58964A44F','A9D171E58964A44F'),(28,'2017-08-07','21:34:00','Saurabh Singh',1009,'1009 	Unique ID of Donor\r\nMrs 	Salutation title of Donor (Eg Mr/Ms)\r\nKera Stanley 	Full Name of Donor\r\nStanley Foods 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n111222 	Telephone Number of Donor\r\nsaur_singh@iitkgp.ac.in 	Email of Donor\r\nSaurabh Singh 	Contact Person of Donor\r\n2017-06-27 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar 	Name of Volunteer assigned to Donor','Dear Kera Stanley\n\n1009 	Unique ID of Donor\r\nMrs 	Salutation title of Donor (Eg Mr/Ms)\r\nKera Stanley 	Full Name of Donor\r\nStanley Foods 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n111222 	Telephone Number of Donor\r\nsaur_singh@iitkgp.ac.in 	Email of Donor\r\nSaurabh Singh 	Contact Person of Donor\r\n2017-06-27 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar 	Name of Volunteer assigned to Donor\n\nWith Warm Regards from Tejas Kumar\n\nTejas Kumar\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:34 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#399DD48A1AF07D49','399DD48A1AF07D49'),(29,'2017-08-07','21:34:00','Saurabh Singh',1010,'1010 	Unique ID of Donor\r\nMr 	Salutation title of Donor (Eg Mr/Ms)\r\nKunal Sethi 	Full Name of Donor\r\nSethi & Sons 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n777777777 	Telephone Number of Donor\r\nsethi@gmail.com 	Email of Donor\r\nHarsh Tiwari 	Contact Person of Donor\r\n2017-06-30 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar 	Name of Volunteer assigned to Donor','Dear Kunal Sethi\n\n1010 	Unique ID of Donor\r\nMr 	Salutation title of Donor (Eg Mr/Ms)\r\nKunal Sethi 	Full Name of Donor\r\nSethi & Sons 	Organisation of Donor\r\nAllotted 	Current status of Donor\r\n777777777 	Telephone Number of Donor\r\nsethi@gmail.com 	Email of Donor\r\nHarsh Tiwari 	Contact Person of Donor\r\n2017-06-30 	First Contact Date of Donor\r\nNo 	Stay Anonymous Option of Donor\r\nTejas Kumar 	Name of Volunteer assigned to Donor\n\nWith Warm Regards from Tejas Kumar\n\nTejas Kumar\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:34 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#DDDD7208A441F357','DDDD7208A441F357'),(30,'2017-08-07','21:54:00','Saurabh Singh',1009,'This is one of the mail merge testing mails using your credentials\r\nMrs 	Kera Stanley 	\r\nStanley Foods 	\r\nAllotted ','Respected Kera Stanley\n\nThis is one of the mail merge testing mails using your credentials\r\nMrs 	Kera Stanley 	\r\nStanley Foods 	\r\nAllotted \n\nWith Warm Regards to Mrs Kera Stanley 	\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:54 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#1060C6BA8491D3AF','1060C6BA8491D3AF'),(31,'2017-08-07','21:54:00','Saurabh Singh',1010,'This is one of the mail merge testing mails using your credentials\r\nMr 	Kunal Sethi 	\r\nSethi & Sons 	\r\nAllotted ','Respected Kunal Sethi\n\nThis is one of the mail merge testing mails using your credentials\r\nMr 	Kunal Sethi 	\r\nSethi & Sons 	\r\nAllotted \n\nWith Warm Regards to Mr Kunal Sethi 	\n\nSaurabh Singh\r\nVolunteer\r\nProject SphinxCapt\r\nCMU\n\nThis message has been generated by Saurabh Singh on 2017-08-07 at 21:54 On behalf of SphinxCapt Project,CMU\nIn case you wish to reply to this mail please include the same subject line for automated tracking.\n\nTrackCode#3AD5C49F971CB307','3AD5C49F971CB307');
/*!40000 ALTER TABLE `donor_email_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_phone_logs`
--

DROP TABLE IF EXISTS `donor_phone_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor_phone_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_date` date NOT NULL,
  `contact_time` time NOT NULL,
  `contact_person` varchar(80) NOT NULL,
  `donor_id` int(11) NOT NULL,
  `remarks` longblob,
  `details_shared` longblob,
  PRIMARY KEY (`log_id`),
  KEY `donor_phone_logs_donor_details_id_fk` (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=latin1 COMMENT='Contains Logs of all Telephone Conversation between Volunteers and Donors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_phone_logs`
--

LOCK TABLES `donor_phone_logs` WRITE;
/*!40000 ALTER TABLE `donor_phone_logs` DISABLE KEYS */;
INSERT INTO `donor_phone_logs` VALUES (1003,'2017-07-07','04:56:00','Saurabh Singh',1009,'Hello','This is test message1'),(1004,'2017-07-07','05:00:00','Saurabh Singh',1009,'Hello Buddy','System Check'),(1005,'2017-07-07','05:42:00','Tejas Kumar',1010,'Checking links','This is test message'),(1006,'2017-08-03','23:41:00','Saurabh Singh',1009,'Nothing','This was just a warmup mail from my side'),(1007,'2017-08-07','00:05:00','Saurabh Singh',1009,'This module looks fine','Now this is testing for any changes that might occur due to rebasing');
/*!40000 ALTER TABLE `donor_phone_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `template_id` int(10) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL,
  `main_body` text NOT NULL,
  `salutation` varchar(80) NOT NULL,
  `signature_block` varchar(150) NOT NULL,
  `closing` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `email_templates_template_id_uindex` (`template_id`),
  UNIQUE KEY `email_templates_template_name_uindex` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (2,'Sample Template','I wish to write to you as a sample case from here','Respected','Volunteer\r\nProject SphinxCapt\r\nCMU','With Warm Regards'),(3,'Temp2','This is just the body for testing','My Dear','Volunteer Person\r\nCMU','Wishing you all the very best'),(4,'Sample2','I am writing this dummy email regarding a funny thing','My Dear','Volunteer\r\nProject SphinxCapt\r\nCMU','Thanking You');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_users`
--

DROP TABLE IF EXISTS `workflow_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_users` (
  `username` varchar(50) NOT NULL,
  `full_name` varchar(80) NOT NULL,
  `user_type` enum('Administrator','Supervisor','Volunteer') NOT NULL,
  `register_date` date NOT NULL,
  `phone` double DEFAULT NULL,
  `passwd` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `account_status` enum('Active','Pending') NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_users`
--

LOCK TABLES `workflow_users` WRITE;
/*!40000 ALTER TABLE `workflow_users` DISABLE KEYS */;
INSERT INTO `workflow_users` VALUES ('himanshu','Himanshu Singh','Volunteer','2017-07-07',34543654654,'pbkdf2:sha256:50000$BPWdcW0L$098f9054f0539d8dd12e7b9daba1ba16b165c0fefab12f9a2189cfa04ef22969','himanshu@gmail.com','Active'),('rajeshmehra','Rajesh Mehra','Supervisor','2017-07-07',54121545464,'pbkdf2:sha256:50000$LNxZw21p$33383fc8b48eb0753419a619afbdb50fb9c31bdae52ba3ceff9c21761868f57a','rajesh@gmail.com','Active'),('sammy','Sammy Garg','Volunteer','2017-07-19',82398273,'pbkdf2:sha256:50000$E7VffP3C$ffdb9d0ca25dd8e60aab110df9208d244a1206a71b1e9fe51f24b97611b8d33c','sammy@gmail.com','Active'),('SAURABHIMA','Saurabh Singh','Administrator','2017-07-07',54121545464,'pbkdf2:sha256:50000$RecXKWe2$2c3adb3a6d45da8478514c44ba73d108c04bdd9d3a2b32ea16d37e0d331d5eb0','saurabhima@gmail.com','Active'),('tejasabc','Tejas Kumar','Volunteer','2017-07-07',98274397,'pbkdf2:sha256:50000$kT7rkFJ1$bcdb4c26e0e80c0de48895a00d3099aa3da5ec3314b88392ed49451496367753','tejaskumar@hotmail.com','Active');
/*!40000 ALTER TABLE `workflow_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-14 15:24:04
