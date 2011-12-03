-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: checker
-- ------------------------------------------------------
-- Server version	5.1.58-1ubuntu1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add contest',9,'add_contest'),(26,'Can change contest',9,'change_contest'),(27,'Can delete contest',9,'delete_contest'),(28,'Can add problem',10,'add_problem'),(29,'Can change problem',10,'change_problem'),(30,'Can delete problem',10,'delete_problem'),(31,'Can add test set',11,'add_testset'),(32,'Can change test set',11,'change_testset'),(33,'Can delete test set',11,'delete_testset'),(34,'Can add testcase',12,'add_testcase'),(35,'Can change testcase',12,'change_testcase'),(36,'Can delete testcase',12,'delete_testcase'),(37,'Can add submission',13,'add_submission'),(38,'Can change submission',13,'change_submission'),(39,'Can delete submission',13,'delete_submission'),(40,'Can add testcase eval',14,'add_testcaseeval'),(41,'Can change testcase eval',14,'change_testcaseeval'),(42,'Can delete testcase eval',14,'delete_testcaseeval'),(43,'Can add test set eval',15,'add_testseteval'),(44,'Can change test set eval',15,'change_testseteval'),(45,'Can delete test set eval',15,'delete_testseteval');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'suren','','','surenspost@gmail.com','sha1$68cae$83495bf3bd41f41954d770862b1d53edae8f081e',1,1,1,'2011-11-26 23:34:48','2011-11-26 23:34:25'),(2,'surenasdasd','','','','sha1$722cf$8fe06484305f1e556c726ab5889eef69460b9456',0,1,0,'2011-12-01 03:58:32','2011-12-01 03:58:32');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-11-27 14:29:28',1,10,'1','HELLO WORLD',1,''),(2,'2011-11-27 21:56:35',1,13,'5','5L',2,'Changed language, code and errors.'),(3,'2011-12-01 03:58:32',1,3,'2','surenasdasd',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'contest','web','contest'),(10,'problem','web','problem'),(11,'test set','web','testset'),(12,'testcase','web','testcase'),(13,'submission','web','submission'),(14,'testcase eval','web','testcaseeval'),(15,'test set eval','web','testseteval');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('16c70e744b5aebd2b86bd29a16bd0bde','NzQ4OWVkZjA1YmNkZWFlNjlmNzE4ZWQ3YzgwOWIzMjUzOTY0NjQ3ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2011-12-10 23:34:48');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_contest`
--

DROP TABLE IF EXISTS `web_contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_contest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `description` longtext NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `public` tinyint(1) NOT NULL,
  `rules` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_contest`
--

LOCK TABLES `web_contest` WRITE;
/*!40000 ALTER TABLE `web_contest` DISABLE KEYS */;
INSERT INTO `web_contest` VALUES (1,'TestContest','Test contest','2010-02-15 19:20:53','2010-02-25 21:21:00',0,'');
/*!40000 ALTER TABLE `web_contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_problem`
--

DROP TABLE IF EXISTS `web_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contest_id` int(11) NOT NULL,
  `pcode` varchar(25) NOT NULL,
  `penalty` int(11) NOT NULL,
  `statement` longtext NOT NULL,
  `constraints` longtext NOT NULL,
  `sampleInput` longtext NOT NULL,
  `sampleOutput` longtext NOT NULL,
  `scoring_info` longtext NOT NULL,
  `allowedLangs` varchar(10) NOT NULL,
  `source_limit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_problem_f603279` (`contest_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_problem`
--

LOCK TABLES `web_problem` WRITE;
/*!40000 ALTER TABLE `web_problem` DISABLE KEYS */;
INSERT INTO `web_problem` VALUES (1,1,'HELLO WORLD',5,'asdasd','asdasd','asdasdasd','asdasdasd','10','1,2,3',50);
/*!40000 ALTER TABLE `web_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_submission`
--

DROP TABLE IF EXISTS `web_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `result` varchar(4) NOT NULL,
  `time` datetime NOT NULL,
  `language` varchar(10) NOT NULL,
  `penalty` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `code` longtext NOT NULL,
  `errors` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_submission_403f60f` (`user_id`),
  KEY `web_submission_564c56d6` (`problem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_submission`
--

LOCK TABLES `web_submission` WRITE;
/*!40000 ALTER TABLE `web_submission` DISABLE KEYS */;
INSERT INTO `web_submission` VALUES (1,1,1,'CMPS','2010-03-13 06:16:22','c',0,0,'#include <stdio.h>\n#include <stdlib.h>\n\nint main()\n{\n  FILE *fp = fopen(\"/tmp/just4fun\", \"a\");\n  fprintf(fp, \"I opened a file despite your code checker rlimits!\\n\");\n  return 0;\n}\n',''),(2,1,1,'CMPS','2010-03-13 06:16:22','c',0,100,'#include <stdio.h>\n#include <stdlib.h>\n\nint main()\n{\n  FILE *fp = fopen(\"ikillu\", \"a\");\n  while(1)\n  {\n    fprintf(fp, \"I kill U\");\n  }\n  return 0;\n}\n\n',''),(3,1,1,'CMPS','2010-03-13 06:16:22','c',0,100,'/* This program is supposed to break the CPU time limit */\n#include <sys/resource.h>\n#include <stdio.h>\n#include <stdlib.h>\n\nint main()\n{\n    while(1) sleep(10);\n}\n',''),(4,1,1,'CMPS','2010-03-13 06:16:22','c',0,100,'#include <stdio.h>\n\nint main()\n{\n  while(1){\n    printf(\"keep printing\");\n  }\n}\n\n\n\n',''),(5,1,1,'CMPS','2010-03-13 06:16:22','c',0,0,'#include <stdio.h>\r\nint main() {\r\n    printf(\"Hello world\");\r\n}',''),(6,1,1,'CMPS','2010-03-13 06:16:22','cpp',0,100,'/* This program is intended to allocate large amounts of memory in the heap and bring down the system. */\n#include <iostream>\n#include <cstdlib>\n\nusing namespace std;\n\nconst int M = 64, N = 1 << 20;\n\nint main() \n{\n  int *heap_alloc =  (int*) malloc(sizeof(int)*(M*N+1));\n  for (int i = 0;i < M*N + 1; i++) heap_alloc[i] = i;\n\n  return 0;\n}\n           \n\n',''),(7,1,1,'CMPS','2010-03-13 06:16:22','cpp',0,100,'/* This program is intended to DoS the code checker by running \'forever\' */\n#include <iostream>\n\nusing namespace std;\n\nint main() \n{ \n  while(1) {}\n  return 0;\n}\n',''),(8,1,1,'CMPS','2010-03-14 13:43:04','c',0,100,'#include <stdio.h>\r\n\r\nint main() {\r\n  int n; scanf(\"%d\", &n);\r\n  int i;\r\n  for(i=0; i<n; i++) printf(\"Hello World\\n\");\r\n  return 0;\r\n}\r\n',''),(10,1,1,'CMPE','2010-03-14 15:27:22','py',20,0,'t = int(raw_input())\r\nfor i in range(0, t)\r\n  print \"Hello World\"','Compiling /jail/runs/autobot/submissions/10/solution.py ...\nSyntaxError: (\'invalid syntax\', (\'/jail/runs/autobot/submissions/10/solution.py\', 2, 21, \'for i in range(0, t)\\n\'))\n\n'),(14,2,1,'QU','2011-12-01 04:02:45','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b',''),(11,1,1,'CMPS','2010-03-15 15:50:44','py',0,0,'t = int(raw_input)\nfor i in range(0,t):\n    print \"Hello World\"\n\n',''),(12,1,1,'QU','2010-04-19 19:52:10','java',0,100,'import java.io.*;\npublic class Main {\n	public static void main (String args[]) throws IOException {\n		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));\n		int n = Integer.parseInt(br.readLine());\n		for(int i=0;i<n;i++) {\n			System.out.println(\"Hello World\");\n		}\n		return;\n	}\n}\n',''),(13,1,1,'QU','2010-04-23 09:11:07','hs',0,0,'import Data.Char \nimport Control.Monad\n\noutput n = take n (repeat \"Hello World\")	\nmain = do\n	n <- getLine\n	putStr $ unlines (output (read n))\n',''),(15,2,1,'QU','2011-12-01 04:04:33','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b',''),(16,2,1,'QU','2011-12-01 04:06:17','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b',''),(17,2,1,'QU','2011-12-01 04:06:17','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b',''),(18,2,1,'QU','2011-12-01 04:06:17','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b',''),(19,2,1,'QU','2011-12-01 04:08:30','py',0,0,'def add(a, b):\n   print add(2,3)\n   print add(2,4)\n   return a + b',''),(20,2,1,'QU','2011-12-01 04:11:32','py',0,0,'def add(a, b):\n   print add(2,3)\n   print add(2,4)\n   return a + b',''),(21,2,1,'QU','2011-12-01 04:11:53','py',0,0,'def add(a, b):\n   print add(2,3)\n   print add(2,4)\n   return a + b',''),(22,2,1,'QU','2011-12-01 04:12:40','py',0,0,'def add(a, b):\n   print add(2,3)\n   print add(2,4)\n   return a + b',''),(23,2,1,'CMPS','2011-12-01 04:12:59','py',0,0,'def add(a, b):\n   print add(2,3)\n   print add(2,4)\n   return a + b',''),(24,2,1,'CMPS','2011-12-01 04:17:29','py',0,0,'def add(a, b):\n   print add(2,3)\n   print add(2,4)\n   return a + b',''),(25,2,1,'CMPS','2011-12-01 04:19:31','py',0,0,'def add(a, b):\n   print add(2,3)\n   print add(2,4)\n   return a + b',''),(26,2,1,'CMPS','2011-12-01 04:19:31','py',0,0,'print \"hello world\"',''),(27,2,1,'CMPS','2011-12-01 04:22:02','py',0,0,'print \"hello world\"',''),(28,2,1,'CMPE','2011-12-01 04:22:02','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/28/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/28/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(29,2,1,'CMPE','2011-12-01 04:22:02','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/29/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/29/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(30,2,1,'CMPE','2011-12-01 04:22:02','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/30/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/30/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(31,2,1,'CMPE','2011-12-01 04:22:02','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/31/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/31/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(32,2,1,'CMPS','2011-12-01 04:30:30','py',0,0,'print \"Hello world\"',''),(33,2,1,'CMPS','2011-12-01 04:30:30','py',0,0,'print \"Hello world\"',''),(34,2,1,'CMPS','2011-12-01 05:23:24','py',0,0,'print \"test\"',''),(35,2,1,'CMPS','2011-12-01 05:32:32','py',0,0,'print \"test\"',''),(36,2,1,'CMPS','2011-12-01 05:34:19','py',0,0,'print \'yoyo\'',''),(37,2,1,'CMPE','2011-12-01 05:43:21','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/37/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/37/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(38,2,1,'CMPE','2011-12-01 05:43:21','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/38/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/38/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(39,2,1,'CMPE','2011-12-01 05:44:48','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/39/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/39/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(40,2,1,'CMPE','2011-12-01 05:53:11','py',0,0,'main() {\n   printf(\"Hello World\");\n}\n','Compiling /jail/runs/autobot/submissions/40/solution.py ...\nSyntaxError: (\'invalid syntax\', (\'/jail/runs/autobot/submissions/40/solution.py\', 1, 8, \'main() {\\n\'))\n\n'),(41,2,1,'CMPS','2011-12-01 05:53:11','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(42,2,1,'CMPE','2011-12-01 05:53:11','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/42/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/42/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(43,2,1,'CMPS','2011-12-01 05:53:11','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(44,2,1,'CMPS','2011-12-01 05:53:11','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(45,2,1,'CMPS','2011-12-01 05:53:11','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(46,2,1,'CMPS','2011-12-01 05:53:11','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(47,2,1,'CMPE','2011-12-01 05:53:11','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/47/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/47/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(48,2,1,'CMPE','2011-12-01 05:53:11','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/48/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/48/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(49,2,1,'CMPE','2011-12-01 07:49:31','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/49/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/49/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(50,2,1,'CMPE','2011-12-01 07:50:57','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/50/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/50/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(51,2,1,'CMPE','2011-12-01 07:51:42','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/51/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/51/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(52,2,1,'CMPE','2011-12-01 07:53:23','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/52/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/52/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(53,2,1,'CMPS','2011-12-01 07:56:06','py',0,0,'print \"Hello world\"',''),(54,2,1,'CMPS','2011-12-01 07:58:28','py',0,0,'print \"Hello world\"',''),(55,2,1,'CMPS','2011-12-01 07:59:53','py',0,0,'print \"Hello world\"',''),(56,2,1,'CMPS','2011-12-01 08:03:00','py',0,0,'print \"hello\"',''),(57,2,1,'CMPS','2011-12-01 10:02:26','py',0,0,'print \"hello world\"',''),(58,2,1,'CMPS','2011-12-01 10:02:26','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(59,2,1,'CMPS','2011-12-01 10:29:07','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(60,2,1,'CMPE','2011-12-01 11:20:44','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/60/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/60/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(61,2,1,'CMPE','2011-12-01 11:20:44','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/61/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/61/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(62,2,1,'CMPE','2011-12-01 11:23:00','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/62/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/62/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(63,2,1,'CMPE','2011-12-01 11:23:42','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/63/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/63/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(64,2,1,'CMPE','2011-12-01 11:26:41','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/64/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/64/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(65,2,1,'CMPE','2011-12-01 11:27:30','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/65/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/65/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(66,2,1,'CMPE','2011-12-01 11:28:29','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/66/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/66/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(67,2,1,'CMPE','2011-12-01 11:29:49','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/67/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/67/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(68,2,1,'CMPS','2011-12-01 11:29:49','py',0,0,'print \"hello world\"',''),(69,2,1,'CMPS','2011-12-01 11:32:36','py',0,0,'print \"hello world\"',''),(70,2,1,'CMPS','2011-12-01 11:34:08','py',0,0,'print \"hello world\"',''),(71,2,1,'CMPS','2011-12-01 11:36:46','py',0,0,'print \"hello world\"',''),(72,2,1,'CMPS','2011-12-01 11:40:25','py',0,0,'print \"hello world\"',''),(73,2,1,'CMPS','2011-12-01 11:43:49','py',0,0,'print \"hello world\"',''),(74,2,1,'CMPS','2011-12-01 11:45:15','py',0,0,'print \"hello world\"',''),(75,2,1,'CMPS','2011-12-01 11:49:11','py',0,0,'print \"hello world\"',''),(76,2,1,'CMPS','2011-12-01 11:53:52','py',0,0,'print \"hello world\"',''),(77,2,1,'CMPS','2011-12-01 11:54:29','py',0,0,'print \"hello world\"',''),(78,2,1,'CMPS','2011-12-01 11:55:02','py',0,0,'print \"hello world\"',''),(79,2,1,'CMPS','2011-12-01 12:03:59','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(80,2,1,'CMPS','2011-12-01 12:05:29','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(81,2,1,'CMPS','2011-12-01 12:05:53','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(82,2,1,'CMPS','2011-12-01 12:10:35','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(83,2,1,'CMPS','2011-12-01 12:15:31','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(84,2,1,'CMPS','2011-12-01 13:42:06','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(85,2,1,'CMPS','2011-12-01 13:42:06','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(86,2,1,'CMPS','2011-12-01 13:43:29','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(87,2,1,'CMPS','2011-12-01 13:44:02','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(88,2,1,'CMPS','2011-12-01 13:44:02','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(89,2,1,'CMPS','2011-12-01 13:44:02','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(90,2,1,'CMPS','2011-12-01 13:46:48','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(91,2,1,'CMPS','2011-12-01 13:46:48','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(92,2,1,'CMPS','2011-12-01 13:48:09','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(93,2,1,'CMPE','2011-12-01 13:48:09','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/93/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/93/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(94,2,1,'CMPE','2011-12-01 13:49:17','py',0,0,'def add(a, b):\n    print add(2,3)\n   print add(2,4)\n   return a + b','Compiling /jail/runs/autobot/submissions/94/solution.py ...\nSorry: IndentationError: (\'unindent does not match any outer indentation level\', (\'/jail/runs/autobot/submissions/94/solution.py\', 3, 18, \'   print add(2,4)\\n\'))\n'),(95,2,1,'CMPS','2011-12-01 13:49:17','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(96,2,1,'CMPS','2011-12-01 13:49:17','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(97,2,1,'CMPS','2011-12-01 13:49:17','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(98,2,1,'CMPS','2011-12-01 13:49:17','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(99,2,1,'CMPS','2011-12-01 13:49:17','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(100,2,1,'CMPS','2011-12-01 13:49:17','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(101,2,1,'CMPS','2011-12-01 13:49:17','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(102,2,1,'CMPS','2011-12-01 13:49:17','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(103,2,1,'CMPS','2011-12-01 21:31:48','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(104,2,1,'CMPS','2011-12-01 21:46:08','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(105,2,1,'CMPS','2011-12-01 21:48:31','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(106,2,1,'CMPS','2011-12-01 23:34:35','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(107,2,1,'CMPS','2011-12-01 23:38:00','c',0,0,'int main() {\n   printf(\"Hello World\");\n}\n',''),(108,2,1,'CMPS','2011-12-01 23:38:00','c',0,0,'#include <stdio.h>\nint main() {\n   printf(\"Hello World\\n\");\n}\n',''),(109,2,1,'CMPS','2011-12-01 23:41:57','c',0,0,'#include <stdio.h>\nint main() {\n   printf(\"Hello World\");\n    return 0;\n}\n',''),(110,2,1,'CMPS','2011-12-01 23:41:57','py',0,0,'print \'hello world\'',''),(111,2,1,'CMPS','2011-12-01 23:41:57','c',0,0,'#include <stdio.h>\n   \nint main() {\n    int i = 0;\n    for (i = 0; i < 10; i++) { \n        printf(\"Hello World\");\n    }\n    return 0;\n}',''),(112,2,1,'CMPS','2011-12-01 23:41:57','c',0,0,'#include <stdio.h>\n   \nint main() {\n    int i = 0;\n    for (i = 0; i < 10; i++) { \n        printf(\"Hello World\\n\");\n    }\n    return 0;\n}',''),(113,2,1,'CMPS','2011-12-01 23:41:57','py',0,0,'print \'hello world\'',''),(114,2,1,'CMPS','2011-12-01 23:41:57','c',0,0,'#include <stdio.h>\nint main() {\n    while(1) {\n    \n    }\n    return 0;\n}\n','');
/*!40000 ALTER TABLE `web_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_testcase`
--

DROP TABLE IF EXISTS `web_testcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testSet_id` int(11) NOT NULL,
  `input` longtext NOT NULL,
  `output` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_testcase_4724af6d` (`testSet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_testcase`
--

LOCK TABLES `web_testcase` WRITE;
/*!40000 ALTER TABLE `web_testcase` DISABLE KEYS */;
INSERT INTO `web_testcase` VALUES (1,1,'12\r\n','Hello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\nHello World\r\n'),(2,1,'2\r\n','Hello World\r\nHello World\r\n');
/*!40000 ALTER TABLE `web_testcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_testcaseeval`
--

DROP TABLE IF EXISTS `web_testcaseeval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_testcaseeval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `testcase_id` int(11) NOT NULL,
  `mem_usage` int(11) NOT NULL,
  `cpu_time` double NOT NULL,
  `score` int(11) NOT NULL,
  `pass_status` varchar(10) NOT NULL,
  `misc_info` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_testcaseeval_4c29dca6` (`submission_id`),
  KEY `web_testcaseeval_2f09402c` (`testcase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_testcaseeval`
--

LOCK TABLES `web_testcaseeval` WRITE;
/*!40000 ALTER TABLE `web_testcaseeval` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_testcaseeval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_testset`
--

DROP TABLE IF EXISTS `web_testset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_testset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `tlimit` int(11) NOT NULL,
  `mlimit` int(11) NOT NULL,
  `is_cust_scored` tinyint(1) NOT NULL,
  `cust_executable` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_testset_564c56d6` (`problem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_testset`
--

LOCK TABLES `web_testset` WRITE;
/*!40000 ALTER TABLE `web_testset` DISABLE KEYS */;
INSERT INTO `web_testset` VALUES (1,1,100,2,64,0,'');
/*!40000 ALTER TABLE `web_testset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_testseteval`
--

DROP TABLE IF EXISTS `web_testseteval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_testseteval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `testset_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `cpu_time` double NOT NULL,
  `mem_usage` int(11) NOT NULL,
  `pass_status` varchar(10) NOT NULL,
  `misc_info` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_testseteval_4c29dca6` (`submission_id`),
  KEY `web_testseteval_2f861c8d` (`testset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_testseteval`
--

LOCK TABLES `web_testseteval` WRITE;
/*!40000 ALTER TABLE `web_testseteval` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_testseteval` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-12-03 20:59:08
