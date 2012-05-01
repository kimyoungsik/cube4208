-- MySQL dump 10.13  Distrib 5.5.21, for osx10.6 (i386)
--
-- Host: localhost    Database: socialcube_development
-- ------------------------------------------------------
-- Server version	5.5.21

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'info@headflow.net','$2a$10$xlehxh6QCP1aXUYUAVghT.yAJBnYUbYdPyiylyHAwuPbl2VgcyyTu',1,'2012-05-01 06:24:34','2012-05-01 06:24:34','127.0.0.1','127.0.0.1','2012-05-01 06:24:33','2012-05-01 06:24:34');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `item_detail` varchar(255) DEFAULT NULL,
  `invoice_datetime` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (1,12,2,NULL,1,NULL,'2012-03-30 15:32:48',88450,'１１번가　','원당','금결PG',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(2,12,2,NULL,1,NULL,'2012-03-30 15:25:43',407140,'예스이십사주식','원당','지불BP',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(3,12,2,NULL,1,NULL,'2012-02-28 10:43:20',65400,'교보문고　','원당','금결PG',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(4,12,2,NULL,1,NULL,'2012-02-28 10:24:21',111220,'교보문고　','원당','금결PG',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(5,12,2,NULL,1,NULL,'2012-02-24 12:29:06',166500,'트루방석제작','원당','인터넷',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(6,12,2,NULL,1,NULL,'2012-02-24 11:29:56',34500,'레드카펫　　　','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(7,12,2,NULL,1,NULL,'2012-02-23 09:41:53',20400,'새한링코　　　','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(8,12,2,NULL,1,NULL,'2012-02-21 12:39:06',49500,'쿠션샘플비용','원당','인터넷',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(9,12,2,NULL,1,NULL,'2012-02-16 14:19:57',40950,'㈜이마트　춘천','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(10,12,2,NULL,1,NULL,'2012-02-08 14:28:48',1990,'롯데슈퍼퇴계점','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(11,12,2,NULL,1,NULL,'2012-02-07 15:09:00',9430,'㈜이마트　상봉','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(12,12,2,NULL,1,NULL,'2012-02-06 15:13:17',15400,'산성공사　　　','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(13,12,2,NULL,1,NULL,'2012-02-05 19:01:18',7120,'교보핫트랙스（','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(14,12,2,NULL,1,NULL,'2012-02-02 12:53:24',6520,'（주）다이소아','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(15,12,2,NULL,1,NULL,'2012-01-31 11:06:33',146160,'(주)교보문고','원당','인터넷',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(16,12,2,NULL,1,NULL,'2012-01-28 13:52:21',16980,'교보핫트랙스（','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(17,12,2,NULL,1,NULL,'2012-01-27 09:59:19',23000,'현영사　　　　','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(18,12,2,NULL,1,NULL,'2011-12-17 16:29:37',3000,'미니스톱성남구','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(19,12,2,NULL,1,NULL,'2011-12-17 16:26:54',3200,'미니스톱성남구','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(20,12,2,NULL,1,NULL,'2011-12-17 15:31:08',2000,'（주）다이소아','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(21,12,2,NULL,1,NULL,'2011-12-17 14:24:43',24500,'（주）다이소아','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(22,12,2,NULL,1,NULL,'2011-12-15 19:14:28',1200,'（주）코리아세','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(23,12,2,NULL,1,NULL,'2011-12-15 18:13:40',11150,'（주）링코제일','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(24,12,2,NULL,1,NULL,'2011-12-15 16:26:25',15000,'003.윤명순','원당','모바일',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(25,12,2,NULL,1,NULL,'2011-12-15 16:02:13',11200,'（주）링코제일','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(26,12,2,NULL,1,NULL,'2011-12-15 15:40:36',7200,'포토프라자　　','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(27,12,2,NULL,1,NULL,'2011-12-14 19:55:06',33300,'주식회사 이랜','원당','지불DP',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(28,12,2,NULL,1,NULL,'2011-12-14 19:44:03',34000,'011.서혜민(시','원당','모바일',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(29,12,2,NULL,1,NULL,'2011-12-14 19:03:34',24500,'１１번가　','원당','금결PG',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(30,12,2,NULL,1,NULL,'2011-12-14 16:55:24',102300,'（주）　씨엔티','시너지','신한체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(31,12,2,NULL,1,NULL,'2011-12-07 02:22:37',98000,'아카데미포스터','원당','인터넷',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(32,12,2,NULL,1,NULL,'2011-11-10 18:53:21',14600,'농협:홍성춘','원당','CD이체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(33,12,2,NULL,1,NULL,'2011-11-10 18:49:51',441000,'우리:서정옥(','원당','CD이체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(34,12,2,NULL,1,NULL,'2011-10-13 08:49:36',71000,'우리:심플렉스','원당','CD이체',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03'),(35,12,2,NULL,1,NULL,'2011-10-12 15:37:01',37070,'서울보증　','원당','금결PG',NULL,'pending',NULL,'2012-05-01 07:19:03','2012-05-01 07:19:03');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head_organizations`
--

DROP TABLE IF EXISTS `head_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `head_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `facebook_page` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head_organizations`
--

LOCK TABLES `head_organizations` WRITE;
/*!40000 ALTER TABLE `head_organizations` DISABLE KEYS */;
INSERT INTO `head_organizations` VALUES (1,'한국사회적기업진흥원','socialcube.kr','2012-05-01 06:24:33','2012-05-01 06:26:54');
/*!40000 ALTER TABLE `head_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `spreadsheet_file_name` varchar(255) DEFAULT NULL,
  `spreadsheet_content_type` varchar(255) DEFAULT NULL,
  `spreadsheet_file_size` int(11) DEFAULT NULL,
  `spreadsheet_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
INSERT INTO `imports` VALUES (1,2,12,'truebeans.xls','application/vnd.ms-excel',14848,'2012-05-01 07:19:03','2012-05-01 07:19:03','2012-05-01 07:19:03');
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `video_address` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limits`
--

DROP TABLE IF EXISTS `limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limits`
--

LOCK TABLES `limits` WRITE;
/*!40000 ALTER TABLE `limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `head_organization_id` int(11) DEFAULT NULL,
  `facebook_page` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'헤드플로',1,'socialventure','2012-05-01 06:26:39','2012-05-01 06:26:45');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rails_admin_histories`
--

DROP TABLE IF EXISTS `rails_admin_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rails_admin_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `username` varchar(255) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `year` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rails_admin_histories` (`item`,`table`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rails_admin_histories`
--

LOCK TABLES `rails_admin_histories` WRITE;
/*!40000 ALTER TABLE `rails_admin_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `rails_admin_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120308193607'),('20120308193621'),('20120308200437'),('20120309024211'),('20120413101601'),('20120413101802'),('20120413101845'),('20120413101948'),('20120413102022'),('20120413102123'),('20120413102405'),('20120417052716'),('20120425081947'),('20120430051427');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `facebook_page` varchar(255) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `leader_user_id` int(11) DEFAULT NULL,
  `bank_branch` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'1cm세상','1cmworld',1,NULL,'','','2012-05-01 06:36:54','2012-05-01 06:36:54'),(2,'동동','',1,NULL,'','','2012-05-01 06:37:01','2012-05-01 06:37:01'),(3,'라이프시드','ilifeseed',1,NULL,'','','2012-05-01 06:37:10','2012-05-01 06:37:10'),(4,'세잎클로버','safeclover1',1,NULL,'','','2012-05-01 06:37:20','2012-05-01 06:37:20'),(5,'소셜플래닛','SocialPlanet0205',1,NULL,'','','2012-05-01 06:37:49','2012-05-01 06:37:49'),(6,'아트보울','artbowl',1,NULL,'','','2012-05-01 06:37:58','2012-05-01 06:37:58'),(7,'알고리디어','',1,NULL,'','','2012-05-01 06:38:04','2012-05-01 06:38:04'),(8,'어울림','',1,NULL,'','','2012-05-01 06:38:11','2012-05-01 06:38:11'),(9,'에코온','ec2on',1,NULL,'','','2012-05-01 06:38:20','2012-05-01 06:38:20'),(10,'이노크라우드','',1,NULL,'','','2012-05-01 06:38:44','2012-05-01 06:38:44'),(11,'제타랩','',1,NULL,'','','2012-05-01 06:38:51','2012-05-01 06:38:51'),(12,'트루빈스','truebeans',1,NULL,'','','2012-05-01 06:39:02','2012-05-01 06:39:02'),(13,'퍼니페이퍼','',1,NULL,'','','2012-05-01 06:39:10','2012-05-01 06:39:15'),(14,'행복한옷짓기','ecobrosia',1,NULL,'','','2012-05-01 06:39:25','2012-05-01 06:39:43'),(15,'HOPE','',1,NULL,'','','2012-05-01 06:39:31','2012-05-01 06:39:31');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `facebook_uid` bigint(20) DEFAULT NULL,
  `facebook_token` varchar(255) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `organization_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `head_organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'head-approved',NULL,'info@headflow.net','$2a$10$7fThmvkWF.dWFW/YLEpINODfjoWnp6RhNcLyZYpLoRf42G9km0pHu',NULL,NULL,NULL,2,'2012-05-01 07:03:31','2012-05-01 06:24:39','127.0.0.1','127.0.0.1','2012-05-01 06:24:33','2012-05-01 07:03:31',1),(2,'하상','전','male','1986-04-12',11516529,'AAAFuA8ahH7MBALg3qkxYyB7JzND5AB07sbonLvY2OF4g4WE8EBd6MCYb3f2ZAsSIwTqXbLxJexoi9IN47zbegBebmERt60srK4ekQEgZDZD',12,'user-approved',NULL,'hc356@cornell.edu','$2a$10$Kmy/Z/eALsqrtnn05SSpSeMsacj9ZMStIyDNMlJHMQpc065GZdcqu',NULL,NULL,NULL,1,'2012-05-01 06:58:41','2012-05-01 06:58:41','127.0.0.1','127.0.0.1','2012-05-01 06:58:41','2012-05-01 07:04:10',NULL),(3,'멘토','김',NULL,NULL,NULL,NULL,NULL,'mentor-approved',1,'cube@headflow.net','$2a$10$J6KKOMo8wnyXe38nm3EUf.ST7CiYAkX4YCArEA8e0zCyCaIu5XPBy',NULL,NULL,NULL,1,'2012-05-01 07:01:48','2012-05-01 07:01:48','127.0.0.1','127.0.0.1','2012-05-01 07:01:48','2012-05-01 07:03:45',NULL),(4,'친구','김',NULL,NULL,NULL,NULL,12,'user-approved',NULL,'biz@headflow.net','$2a$10$k0RWqvD6vBn1TfAXJfeMDukt62POn.m9n2IIg5poUcrJIFGaeKBG.',NULL,NULL,NULL,1,'2012-05-01 09:59:31','2012-05-01 09:59:31','127.0.0.1','127.0.0.1','2012-05-01 09:59:31','2012-05-01 09:59:48',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekly_reports`
--

DROP TABLE IF EXISTS `weekly_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekly_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `participants` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `content` text,
  `result` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekly_reports`
--

LOCK TABLES `weekly_reports` WRITE;
/*!40000 ALTER TABLE `weekly_reports` DISABLE KEYS */;
INSERT INTO `weekly_reports` VALUES (1,4,12,'2012-05-01 00:00:00','2012-05-01 00:00:00','전하상, 김친구','','','','','2012-05-01 10:00:06','2012-05-01 10:00:06');
/*!40000 ALTER TABLE `weekly_reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-01 19:08:13
