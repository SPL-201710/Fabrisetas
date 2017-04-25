DROP DATABASE IF EXISTS FABRICETAS;
CREATE DATABASE FABRICETAS;
USE FABRICETAS;
/*********************************************************************************** USER ***************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(100) DEFAULT NULL,
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `IDENTIFICATION_NUMBER` varchar(100) DEFAULT NULL,
  `IDENTIFICATION_TYPE` varchar(45) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `SSO_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ana@gmail.com','Ana','145236987','CC','Maria',NULL),(2,'carlos@gmail.com','Carlos','175426589','CC','Mario',NULL),(3,'mariana@gmail.com','Mariana','1754126555','CC','Franco',NULL),(5,'juan@gmail.com','Juan','216546131','CC','Camilo',NULL),(8,'paola@gmail.com','Paola','175425896','CC','Camila',NULL),(12,'andres@gmail.com','Andres','245879658','CC','Felipe',NULL),(14,'felipe@gmail.com','Felipe','145874589','TI','Danilo',NULL),(15,'rocio@gmail.com','Rocio','12547856','CC','Derly',NULL),(16,'adriana@gmail.com','Adriana','232354613','TI','Carmen',NULL);
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

-- Dump completed on 2017-04-25  1:37:58

/*********************************************************************************** ADDRESS *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `ADDRESS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ADDRESS_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `ADDRESS_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Dirección 11',1),(2,'Direccion 12',1),(3,'Direccion 13',1),(10,'Direccion 21',2),(11,'Direccion 22',2),(12,'Direccion 31',3);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

/*********************************************************************************** ROLE *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrador'),(2,'Cliente'),(3,'Artista');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58


/*********************************************************************************** TSHIRT *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `tshirt`
--

DROP TABLE IF EXISTS `tshirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirt` (
  `TSHIRT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(150) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PATH` varchar(100) DEFAULT NULL,
  `PRICE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TSHIRT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirt`
--

LOCK TABLES `tshirt` WRITE;
/*!40000 ALTER TABLE `tshirt` DISABLE KEYS */;
INSERT INTO `tshirt` VALUES (1,'Camiseta 1','Camiseta 1',NULL,'10000'),(2,'Camiseta 2','Camiseta 2',NULL,'10000'),(3,'Camiseta 3','Camiseta 3',NULL,'10000'),(4,'Camiseta 4','Camiseta 4',NULL,'10000'),(5,'Camiseta 5','Camiseta 5',NULL,'10000'),(6,'Camiseta 6','Camiseta 6',NULL,'5000'),(7,'Camiseta 7','Camiseta 7',NULL,'5000'),(8,'Camiseta 8','Camiseta 8',NULL,'5000'),(9,'Camiseta 9','Camiseta 9',NULL,'5000'),(10,'Camiseta 10','Camiseta 10',NULL,'2000'),(11,'Camiseta 11','Camiseta 11',NULL,'2000'),(12,'Camiseta 12','Camiseta 12',NULL,'2000'),(13,'Camiseta 13','Camiseta 13',NULL,'1000'),(14,'Camiseta 14','Camiseta 14',NULL,'1000');
/*!40000 ALTER TABLE `tshirt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

/*********************************************************************************** THEME *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme` (
  `THEME_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(150) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PATH` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`THEME_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,'Religion','Religion',NULL),(2,'Felicidad','Felicidad',NULL),(3,'Musica','Musica',NULL),(4,'Naturaleza','Naturaleza',NULL);
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

/*********************************************************************************** TEXT *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `TEXT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TEXT_ID`),
  KEY `TEXT_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `TEXT_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'Corazon',1),(2,'Cielo',1),(3,'Naturalez',1),(4,'Felicidad',2);
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:57

/*********************************************************************************** RATING *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `RATING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RATING_ID`),
  KEY `RATING_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `RATING_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,'Bad',1,NULL,NULL),(2,'Poor',2,NULL,NULL),(3,'Medium',3,NULL,NULL),(4,'Good',4,NULL,NULL),(5,'Excelent',5,NULL,NULL);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:57

/*********************************************************************************** STAMP *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `stamp`
--

DROP TABLE IF EXISTS `stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stamp` (
  `STAMP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(150) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PATH` longblob,
  `PRICE` varchar(45) DEFAULT NULL,
  `THEME_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`STAMP_ID`),
  KEY `STAMP_THEME_ID_IDX` (`THEME_ID`),
  KEY `STAMP_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `STAMP_THEME_ID_FK` FOREIGN KEY (`THEME_ID`) REFERENCES `theme` (`THEME_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `STAMP_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stamp`
--

LOCK TABLES `stamp` WRITE;
/*!40000 ALTER TABLE `stamp` DISABLE KEYS */;
INSERT INTO `stamp` VALUES (1,'Estampa 1','Descripcion Estampa 1','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-5c6287be147892351658358183410311937.svg','5000',1,1),(2,'Estampa 2','Descripcion Estampa 2','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-5c6287be147892351658358183410311937.svg','10000',1,1),(3,'Estampa 3','Descripcion Estampa 3','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-35a12c43147892352872423485510763668.svg','15000',1,1),(4,'Estampa 4','Descripcion Estampa 4','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-fd45c64e14789235041750769171098240.svg','20000',1,1),(5,'Estampa 5','Descripcion Estampa 5','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-544a4f59147892349541616323811072175.svg','2000',1,1),(6,'Estampa 6','Descripcion Estampa 6','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-1a77befc147892338329297399510133442.svg','1000',1,2),(7,'Estampa 7','Descripcion Estampa 7','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-1c208ee8147892339948116656210677366.svg','25000',2,2),(8,'Estampa 8','Descripcion Estampa 8','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/519/print/dg-designer-455cb265147892583893178315611075752.svg','50000',2,2),(9,'Estampa 9','Descripcion Estampa 9','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/519/print/dg-designer-f655e8f9147892580999569643910123859.svg','30000',2,2),(10,'Estampa 10','Descripcion Estampa 10','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/521/print/dg-designer-50982fb2147892630584253368010435571.svg','7000',2,3),(11,'Estampa 11','Descripcion Estampa 11','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/521/print/dg-designer-fcd11da0147892631530024221410133602.svg','9000',2,3),(12,'Estampa 12','Descripcion Estampa 12','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/521/print/dg-designer-a9fb9e6e147892611646692764210725530.svg','3000',3,3),(13,'Estampa 13','Descripcion Estampa 13','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/521/print/dg-designer-4cdcf18b147892635097902353410878667.svg','4000',3,NULL),(14,'Estampa 14','Descripcion Estampa 14','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/524/print/dg-designer-b8703970147892679475779569211063592.svg','27000',3,NULL),(15,'Estampa 15','Descripcion Estampa 15','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/525/print/dg-designer-c12706a7147892682447813183210865409.svg','38000',3,NULL),(16,'Estampa 16','Descripcion Estampa 16','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/525/print/dg-designer-7940ab47147892693491915739010049557.svg','42000',4,NULL),(17,'Estampa 17','Descripcion Estampa 17','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/522/print/dg-designer-fb0650ff147892642067081898910657101.svg','31000',4,NULL),(18,'Estampa 18','Descripcion Estampa 18','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/522/print/dg-designer-c950cde9147892643772446036110413163.svg','18000',4,NULL);
/*!40000 ALTER TABLE `stamp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

/*********************************************************************************** MATERIAL *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `MATERIAL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MATERIAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Cotton'),(2,'Wool'),(3,'Lycra');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:57


/*********************************************************************************** INVOICE *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `INVOICE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMBER` varchar(45) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `ITEM_PRICE` varchar(45) DEFAULT NULL,
  `TOTAL_PRICE` varchar(45) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`INVOICE_ID`),
  KEY `INVOICE_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `INVOICE_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (3,'00001','2017-01-03','5000','14000',1),(4,'00001','2017-02-03','5000','14000',2),(5,'00001','2017-03-03','2000','14000',3),(6,'00001','2017-04-03','2000','14000',1),(7,'00002','2017-01-03','2000','14000',2),(8,'00002','2017-01-03','2000','14000',2),(9,'00003','2017-04-03','2000','14000',2),(10,'00003','2017-04-03','2000','14000',3);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

/*********************************************************************************** FILE *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `FILE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENT` longblob,
  `DESCRIPTION` varchar(150) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PATH` varchar(100) DEFAULT NULL,
  `TYPE` varchar(45) DEFAULT NULL,
  `THEME_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `FILE_THEME_ID_IDX` (`THEME_ID`),
  KEY `FILE_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `FILE_THEME_ID_FK` FOREIGN KEY (`THEME_ID`) REFERENCES `theme` (`THEME_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FILE_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (17,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0É\0\0\0x\0\0\0oŽ&ç\0\0\0íPLTEÿÿÿ8{,ÂÍ\"4y\'&sÂÖ¿2x%)t.v ·Í´;~/šº•°É¬H†<¦Ä¡5y)Ž´‡ÜçÚäìân\0[Rñöð×åÔûüòÀËÓÛeÛá’1x,õøôÈÑ!íòì¨Â£Ç×Åt¢l—³&·Ç#R‰I+u-c–[úûêC8RŽG{£uåê¨tŸnf”_•²‘†¬ÇÑ8Œ¬&¥»%Î×[òôÒL†+k—)ja›¶—ˆ¯Œ­‡QˆHÕÝvìïº?+ÉÓBYŽ*­Á#vž(óõÙÝäqš)åé°ÒÚ_ìðÄÎØPw Lˆƒ¨d±ÇyÝãŽÍBÔÜ\0\0\nNIDATxœíš\r{š:ÇÁ@ˆR¬NäE«Õvmm]çÚ­ÛiŸ—óý?Î“ðnWl=“sÿ×µk ¹Iî;wB9î ƒ:è ƒþt²ov¦ÎÓ¾-Ø‘NÛömÂnô´hßíÛ†è©W©|ú\'x\n©|½Ü·ï×ÏE…èË¾íx¯¬Ç€£Òþ¹oKÞ\'ë²×f$Çû6æ².&éü]þén`—ÿ¾o{Þ¨ãÓN’«ü$ÇX\'XÇ¡NN.¿¶ÛiŽJ»äaøäéçc§óuõG‡êE/K”:\n?ýÙ©´£Þo3å)‚§§û¶öe`OxÁìM$û¶÷%Øƒtömñ\n:¾+ÊÑ;/5IqÊÃy/øÿyß6oÔ •ôÿ…µo«7é´8HÿºRb’ËEaÁ}¿Ì$ÅçVïÇý€]~Ý·ÕtR¤ß=g—¥Œ]Å‡¤ß\r½¤œ$…½¤¿æ\"’®ñß\nrôúël-©”3ïúRä‚ÿxÿ,cVÿ¡É·n7Š[D%Üi=pøÞÃn÷ê¢ßy.á>¾ÉÅU·»¾HÜ(åÙÊé«2ø¶îvù$H)þUô×]>=µJzšzü\nÇýGžïÞ§F¤RÒ³úç_Ì«ó{¹K@2OÊù%èËf—ïõ¾]¼Ž\n2ÏÊ¹Íâ¸Ne0\\üX$ØEú½Ìã2.‹¾?·{XØþ‡‡‹‹~ÿüÛõO1ø®|ý)§—]~êŸcó¯ïï¯®Ö˜¡K)È}?;³*í’~Ðrë\r¿–ßM\00Œë<G¥½(åÜrAjNMŽÁ\nEW¾ºî÷²‹€”0ãâ8[Øj©†‘P¢Ë_];ÏG0µJ9\"\\= `è\\Ã×ØŒ’ïœ÷/•üp`ŽÊŸåô®FITÓ\r Bÿþ×Å`Pi·7b´ÛRÎ,\"% xLZH6þóß»ÇÓÇ»»»Î§ç¯‹E%>¯Ç\nÎâ¹sZÒñ 2‡Ø=4äàÑ™W“vžœ\\>}9=ýêôçS‰1ˆZ#¡¹®™œ-–ñ n+™¶mÿí!:è+»Uó|ß÷nEÝŒïŠKÿ¶E/-]ñüõÚ_Öô´\'»^XÆt|ÿ¶”®.ÕšÐY+îÑÒ÷—GÕ\rÑÀjÔFj³)øG.³ 1ñ\rgË°¡×ü&‚\0àåX@#§Åª;$‹9s A i¤ÄR±ãª\nÄe .c‰†€\0@ˆ Ô$#€ršøRu‰e5U ­àWÈµVÚSô  Ì Á¨ZC \0aµˆbH NWq»+Ò0gËä.T±•ŽŒ´¨\0DS1êƒqPfÈésDÓ^äa››ÐÔúL\n œãV¢w\0ä+I\nZSHš!ZáAœHäºénR™Ô[Cã:GRóàWS·VPK@ãÐZFã[^XDSÃ¼KÃyW•Y2YM·€[àŽQª\rŽtÎzWªo1\"Ñ[â·\rw…HIq.ð¡Æ*Kô†\'EV|NfŒDÝÊéÎà5¹\ZZ BÀg„TfÑ[è3ÚW@B²$E=ëD$pB÷\0ÂxhB;B’Øi¾„gAð{g,¸j4Z\ZÎ›i#h9Ü–¤J_GŠëºÎ²É\\Hø \0’|ÏóT!4ŒI’È<Á×7‘°‡86ÅÎig˜£p7¦  ê´V[ÊA@+\'±æˆv<\r}8Øª„ÒØŠIn¦e™¦¨\nÌâÙ(5i\\ÛH¯jÛ\rG\rYà2ˆ‘5ö\nMREÜgêUï4‹“ØéeMN¬\"Š7›“Ÿ1 Ùi„rÂy\"‰i\raØD‚f\rö´>f+j»ÉªóµØ„9G®8‰l¹µñ†G  ‰¡±ª¬Ãà$E¢Á›¨ÔèÇk\\™)¸ä{JÄ2Î:z+  Ï·òB`4R÷ÙtÐ†­$‰°$O¢ÉnüØ4@d¥Å®éd‹LáÖ$4ØiF%\Z\'[…6NÂWD\"ÍyEžN“it„×Ä1í}AO7Òbó«8‰é± ,,ÝLŽÃH€‘­Ãæ:‹Ià(‘Ál ‘ªÉ´„ˆÄÑ¢Ë´˜][Da%ŒP9n²gDá…F\Z4Ô“x­\'©ä#¿2&\'V3zóë•ôs.Ê0¶ iÑº$yt¥Tñ\ZŸ­bÓþ\")#FjräIÔôäIè\"\0Ô´+bYÒ¶$œˆâ\Z¯±ãQØ½Œ¤™O¬W´ù˜$ˆc¿ Éˆ„y6yU–DÝv\'ù[2AÔ äà1I¾ÆYŽ¤–z¾cë\n;àDFÉÊÎ–$ åÐû#Á»½9ÎQã\") 3W>7»´´\'±_&Ù:fõl¼i¢‘ <ðe›§$\ZŸ6¤8  ë-ïñÜÖ±+!qnÈldÐêQ¸E»‹ì C’LPœ„Eá qIIÙ>v%e+S:,pjG+ã0;½Ø„n¸÷“(tåDéàÇEßÞJ‚Yæ l:ÊV”ts˜ÍVÞAf+(3½Ü0_~3 ^)A0­8ƒnÌ ƒÛï&áØÂ\n—©ölë\nÒõT/Õ\n}0b¦üQa\n4çvA¢°VP2Ç´\'QfZ”DÇñ\nD;ôX‡l²;-?<ãl\'<¸@­X2{&*ÓšE›…Â$GÄy5dÜ„\n‚N]žtxr÷«®D’ì6pD¦ÃûI¢Aá‘áãGÝ=Sß°ûõhÕÙ\\[ÕÛÏÔPPI‚ó86f³Ù×O é;\"1½Ðn\0UÜÈ&Oá»(IÔ!\Z@’ Hìì\n’= #Ñ¨Oj©S\"ÀÒô$³qÒˆF·\nÆ¶;­iþÔŒd+bL\"‰Ê\0c–hí‚„k¹Qe+cf  xY–â£ì¡š†’¤ÐÒ§™–à:ÌÙiª–6´ž?MMÈd\r#sl&Í\Zu‰µ^”G£#A`CJXbç‹ g5ã¡Ãi¿½^_‘NN¿R\n:y&9`\nN¸gvªÀ2èšøôZŸã\Zš\0 0±9vR±!ÿ•”éP&ç˜øë,âÆ$xx*/´ñ,™RVÇ¡±›yá-@H\Z¼5AÉÏ°\rÒ\\ò£1ÊÔùó\n—YäÉ\"¼¦FÕ¹™O&“3GŒz/I‚Y”3ü|²r2F¹«ÉY~TWÓ0°ãË|ýf2QX>g6‚©§WoV“ÉüL!…õ0ír²5‹È2ÍÔF7MBšÄÚPoÓ½ÔÝ¬°-wbg°zWg\'+šœÏöß É_#A\0?Ï“­(Ã0ëšïä£þï!©Óè‡aY¯Ú¶ÝPnåððwÓöï!‰Ïc!’šä³DâËTõõúEô{Hô&ÿ‚4¡özõBúM~â4%¸‰  oŠ[›¤3’Í±iw2k†Œ2ßd’§; [,òT#ß\rÿj™Êj$\nˆdÁ\'  \Z«Ü‰Î{¤Ï¥¦¼²_/¸5\\¼‚.U,Ã›;îîÆƒÊú­¥eYä¯ÂlÓ:üaØAtÐAtÐAô·Ñÿ\0¹ê\nHà³p\0\0\0\0IEND®B`‚','4','4.png',NULL,'image/png',1,1),(18,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0X\0\0\0ö½sX\0\0\0PLTEÿÿÿm³?k²<i±9g°5ûýø°Ö˜f°3ñ÷ím´<…¾b¬Ó•€¼\\pµ@d¯/÷ûõÔçÉçóßƒ¾ZÝëÕ¡ËŠt·JÏæÂÀÞ­|»Sa®)ï÷êÜìÒÈâ¹x¹Mëõä»Ú©’ÅršÊ|¢Î†’ÅsËã¼³Ö žÌŽÄk·Ù¤´Øœ¿Ü°ØéÍ§Ï¦Ñ‹„½aÄÞ·Hšn!\0\02IDATxœí\\i{£*®€Å}K5n1{LL2÷ÿÿ»«\nJLÛÛkç™ÎùÒ4\n^Îäåå/ý,*¼ê¯øn.~CZ:vlã–ÿG¤\n‚JM\0Ùñf©}77¿E\nP(ˆàìÿE‡ÐTx•ç¿F§&ß\0Ê€ ²Ë[ž~7gßM‘>¦*«Mõ£ÕJ5‘\njt¬õÏ5:š5R&Áèèå1ú™zµÀÀ´z…Ãò-ÿ’óP™xµ‚JXþ8£N)“htÊåâõÊ_¨óŽ—¼\nªWvyþ&£ão-kïÍ9âå™™‚\Z»ƒ;\'‡-¥\0íhÆ!ÇaÞ3µj¬N¹ÔæíSk\rQ9ßšdï43t Æ›*›O¯Tƒä¼ö|^`ý`Z‚Ž½Ÿ/Ò™uŸ!0%9(üµ‹fQ«‹ÓŒˆv³éð\"ø´Ìpj½B÷”ß-1„Èðÿÿ‘(þƒÈtä”3èTºÞ—Çù€qoÏàw4çrwÎX!©2Õžø?¨ˆ32=\ny™™bœN–òylœ9#°YˆÄOŠ]Õ‚šÞD-OÏ\nWß=“¯&»1>¶ÿ¸§‘9ÐqB£Ü”1rÐ:øO“™Œ(“NÃ§h\n²·¹æÊ^ƒ‡¢V×«šúùÑ|=ç‹TˆËŠÊìKËš_Ý÷›Ó%*†vÕ_š¬äÑå5\"ÿ¨Ùù’ÑwÕl}\\°vZ/—³WHƒ@5]¬O¥Qž–‹îyfîžíÝ[eõ,¾)Àpð|åØÀm?\ZÝÇÁáZÜök¯{rX9È±„ÅºÄÕ\nrjð…mŠ<¬_3š×Tïd;;eë«o¨nq\'½™Íç[ûÙ?—:M/«ñ~Gv\nÚ Â°¬ÈºTõ7Ž5é3TRç!…ß\n¹Ù¢$¸]˜þÁm8@æÜ£÷f#n÷\n…ûŠôîÚ®\"«é4ÿ;ÅH7ò~„”¼¶Ñ^´[HzÂÛ×¶X‚Úò4íÖõ\n*\nw=AT”Z3cÜ/%D¯eó:MIÍ•Ê¦²aö½\0ç(ÎkN7‚EaÇÑu(U\0‚ ­ªTDsïE5Ñ A°ë;Ÿà,R£ë)©¿\'#‚ y±¤Ÿ]÷€ØÑ™g62•ÚSÛ²‹h\0†t„lf­hå½2Ç…´tÖ^î³ÿÅ¤ëjKbjè4L¼’)ã¥ú†G*‰KÝš¤}\nš¨u®MÚ4&‘Šºbk;gÐH8\'¡±GIÖ*\rní‰*˜¶e-¾ËóMÏ0®Í–^ì­øÉ!“>Rc†µàèÑŽGæ(\n»‘‘\nÈÀm?+`¿H‘  Í!0Í»ýydÏ•êÈd1Ç<Æ+á054e)8x‡½¾¦£coN› sôpÓ#Jò9I’8=|ø$ ÃÍ$K92ôymÆ¹U€;ÊKô¦\n·ƒµÜ€˜IÜ2ÿ ¾®÷$Ü¨6¥;\0k~á1{ò‹Zô%ù÷z_Õª_µì‘im\0â]ThE¾\r»a©7‡&H‰—êcd ov»rÕÅï`E—iÃ8 hÜ½æÝW¼Uš@Æ=u³Šu:Å¬¾M£mQ-ëgÎ;¡-}Då—³Qîr¢°-ª¼öX¢`É‚‘Â´Yæ,FÈ@{$1Œ lòÖÄiUg–ˆû¢¾¬éÃê¬²öÊiÉ2EgpÝ‰k’ÙBcª¦à¸™Å’+;lŒŠ´ßðí5ï¯[\n*y·3hÈ”xdp1Ÿõ@fnOóKÚ?­XÝ –|åÂë¡™@&êìÍTj<&r mMl¬~Ø÷Z¼bì­uŽµ!uÈ@C\n²rP¡IEdœ=?Ê{.âÊV¬›&Þ‹:æÄèïÚí”L Ó[–ÈEfiP}Æë{×\Zí˜jd@(³³3«¡ygÁC›°÷ÈÀ;7o92Â¬™ék½;ä\n£–%ƒf™Ndê‰|Ófb°ÄSëÄév‘+Ü.{d:³RÙ¤¿XV\ZfÈ@sø¤ ³níU‡Œ¨”2dà^è†¹Z¼hº$Ý Óh&%|†Lô\0EXÍÏ¼¨:›»Òæ“í:àéb¡ SŽ+hý4ªÓ¦qÅò•ôB™äÉqÄ´ŽæÎ¢eôq {`¢õ™]ï™xd€Å½“·±]§‡XÚ!ÓÎÛžºd™n\n5_ÚÆmÀ‹gŒ1+WÚWâöÈ´1Ð42‰¨öÌL6ÈèIœ‰<‰gÜÞÀ\nÈ {÷Šv‹‡€´×>,)˜•×9íëå° åì]ÆUX\n|‘0C½dc2ŽhdÈ AýâŒÔÈ¬‰5A’ú´»{G¡™^D½Õ8¿i×¡§¦ú\nb^6î|\0PbTîPd¤uQ¦QŒ.¾!CF—#SËŒJ3i©ñø™\n—\nðÈ$l*WýÁ†Ë½A¨kƒ%ß«{+YGWDF–â2\nqèó¦R|ãÈÔ2ÃØá$ƒ­§‘Ñö¡ŸÓX\n,«†/œS·^ÅB,h @ŸG&‘mQfpÞ!3èö£2C³Fô  d²ïhxm¢šy“°ßªÎé¶o2ªPHÿñ2LfdÉj9’g ”™Ë„ÌúÌCd*.—É\nŸ‡óÀ(WÒG[º?î[‹.¥Í¥î0N_¸*„„:X“f˜=HŸDÆá,ðq<–ú6)3._”‘¡µRéÞ%sšm9‹²ýË¹2žŠl]:oSTŠÌ8öª¹¡‘uRôÈ\n\nõ‘¡ìCII3¥ú\0™Ôæç+hSk!Ý»\n\0r*Öˆ:J\r*™KqYQs\nµgVãWiô¡8/_L£ßÔó³¦†2:õÈTü4\"í¼îê×—³N›¤\\]ö!8g*\n0âò¦qñçÄù£¯‘ŸÅëÑ`lÍ cðm±eP\'³)ê|ŒYfÉßé­þŠ\0 —\\ÞTÁd¡|›òÌ¨4¦èë\0Œ2v•@ŽŒ+¸…ì I^¸1#¼ZkõDYàë‘Y²7IÏ§óÈ(``;ù„‹/A¦‘™î(ØA·“  92ùcd¥q«êQ8ñ  ÞùM•¡/µÓ¸kËºˆk¤s+]pO,Ý©Sm÷Kiã…øº°MArQ\"Ddà[ó1b•¶¦B¬‡÷\Zí®wßåd«\n½ñ%3\0‡ÂIó1w0ªŽÙ¿Slè\Z\0ÂêÉÌË+ëÝ:+¬^Ëž  )2©¬\nê3m\"äpB«ò-w›^ƒNŒð|<¦µ`gßçJQÞ7ñ(«ö<¸›»\n?ÍÙ¿\n­\ne‘UeÍJ¤žr!Eæ 4Ð&r€Êp-o•×8™Ù§Qxã’³² æ•I£5i¨[Ûc´ðýèHËÖü®\nÙž„ÀÚïÞvû~ÐºÍiSS‡éê$0ØœNÛ2Ädß‚Œ\'Ý9\Zì\\\na£·[ä§äItê§\0ñ=}Ù·LˆiŸÖ-? µ?Ú¦Î(zdà–xòf¯ŽÛÉÝòÉLm*¹Ì°\nX\ru$‘XQN\"£Àæ\rë^w+\0  ÚÍ”¨K=°X%¡mI¦ËrÉÙ. °®¾\n™&á„\nZÛçJ‘=y¶øöoÕHo2·ðÌÖm½!;Œí¥á˜àEµ—ì”H²-¸ãwUêHr9:¶W3å´òé\n­\0Ršá°ÈÜDd\Z;>-¹ÁRr…ö<¸ƒ1B¦65;Ô$8ZEžQò²¢åŸe› öìFA\".€‰Izç2JÏXWýÊÉI<äûDõ·élË}æçEÀ[uÆO=ˆÅ7èlý—ˆ&›§Aë—.Æ˜BFQVpXè(c›\\øUòôºˆ h¨þ–ÌÐñ¹¶{uè;¶%(¥\Z¥=cë¢i\0‰CñAÿ™#—4å{sÏÂ˜©\rÁ¡Ï¥¡$\rO‡×vdÈ€àQª˜wBåç–‹ÃñTñ*ÊÓ¹ïE¬Bë“‡áÊÚÜW‚Ò7+6Öãõ¶A¼ÆŸù‘wã¦Z~Û53ÆÞl7zi+Ý[\n¯zug®®œ€\'K‰Š»Ó9)ãa6é~–e~Á÷0¬Ï¨~v½f’;võé-z-ëïÆh‹L68ß4Í+º,ZË\nyŸ]Í–äØõø¦”RyÁš®­^ñHâ\'iªrõ?PaÙJ|JµÇ\"\néF::qCÕ)\nÆsµ?ð“÷M\nðAäÇNºÎŒLŒÚ J]:Õ]ì™À“¼yDÂÙ\"áÚ_ôiQ\rv3ÏŠbá­7ºx\"Xêö&h^d|…E™zy_j[™¥ÓŸ1“¯jºApâÈïfÔi¶“$Žƒ‡{rpò”Í˜æE&íÃIØœ¿ÅæÊöðòÀ¤¦#ÝdûMÌ\ZÓÌÚ´y<C€_ÈR‹s0þ—Û)u˜÷ÁŸa¡w|çº¡ žœê(—@Ò–[KŸ\n}/\rŽh<§ˆ¸ÄñþÔÿEÙÑÀ£Ì   {÷ŽKßÅÁ,õOêÕ‡×^\r\ZuÂ›/3Ñn•à&ØVH>Œð5{¨IƒÆÙ9ø”ÑI>| Ö/!„Ûy @uý:Ø›ì@ ƒízñNX¹ÅÙz~ƒi@Â1›÷’}×OD©îgEµXž>ftær1¿ùµÑïÖ+ýGý@˜šf—Æè¼¸ùi¿ESëÕÙRÀS£ƒŸ„(Ë¥LêÕ“+2ùÑ«ƒ#žÕýaÔ8å‘™ÑiçŸFÅÅÉÞDø§]Bþ\nùËÝ/}\0Îô©™D~d‚ÑÁ?^™:Rµì5dF§Nãçÿ°ßšŠc+!eÿƒÓ#Z,Í7sž_oúK?€þ™Ëò¸&æº%\0\0\0\0IEND®B`‚','5','5.png',NULL,'image/png',1,1),(19,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0É\0\0\0x\0\0\0oŽ&ç\0\0\0íPLTEÿÿÿ8{,ÂÍ\"4y\'&sÂÖ¿2x%)t.v ·Í´;~/šº•°É¬H†<¦Ä¡5y)Ž´‡ÜçÚäìân\0[Rñöð×åÔûüòÀËÓÛeÛá’1x,õøôÈÑ!íòì¨Â£Ç×Åt¢l—³&·Ç#R‰I+u-c–[úûêC8RŽG{£uåê¨tŸnf”_•²‘†¬ÇÑ8Œ¬&¥»%Î×[òôÒL†+k—)ja›¶—ˆ¯Œ­‡QˆHÕÝvìïº?+ÉÓBYŽ*­Á#vž(óõÙÝäqš)åé°ÒÚ_ìðÄÎØPw Lˆƒ¨d±ÇyÝãŽÍBÔÜ\0\0\nNIDATxœíš\r{š:ÇÁ@ˆR¬NäE«Õvmm]çÚ­ÛiŸ—óý?Î“ðnWl=“sÿ×µk  ¹Iî;wB9î ƒ:è ƒþt²ov¦ÎÓ¾-Ø‘NÛömÂnô´hßíÛ†è©W©|ú\'x\n©|½Ü·ï×ÏE…èË¾íx¯¬Ç€£Òþ¹oKÞ\'ë²×f$Çû6æ².&éü]þén`—ÿ¾o{Þ¨ãÓN’«ü$ÇX\'XÇ¡NN.¿¶ÛiŽJ»äaøäéçc§óuõG‡êE/K”:\n?ýÙ©´£Þo3å)‚§§û¶öe`OxÁìM$û¶÷%Øƒtömñ\n:¾+ÊÑ;/5IqÊÃy/øÿyß6oÔ •ôÿ…µo«7é´8HÿºRb’ËEaÁ}¿Ì$ÅçVïÇý€]~Ý·ÕtR¤ß=g—¥Œ]Å‡¤ß\r½¤œ$…½¤¿æ\"’®ñß\nrôúël-©”3ïúRä‚ÿxÿ,cVÿ¡É·n7Š[D%Üi=pøÞÃn÷ê¢ßy.á>¾ÉÅU·»¾HÜ(åÙÊé«2ø¶îvù$H)þUô×]>=µJzšzü\nÇýGžïÞ§F¤RÒ³úç_Ì«ó{¹K@2OÊù%èËf—ïõ¾]¼Ž\n2ÏÊ¹Íâ¸Ne0\\üX$ØEú½Ìã2.‹¾?·{XØþ‡‡‹‹~ÿüÛõO1ø®|ý)§—]~êŸcó¯ïï¯®Ö˜¡K)È}?;³*í’~Ðrë\r¿–ßM\00Œë<G¥½(åÜrAjNMŽÁ\nEW¾ºî÷²‹€”0ãâ8[Øj©†‘P¢Ë_];ÏG0µJ9\"\\= `è\\Ã×ØŒ’ïœ÷/•üp`ŽÊŸåô®FITÓ\r Bÿþ×Å`Pi·7b´ÛRÎ,\"% xLZH6þóß»ÇÓÇ»»»Î§ç¯‹E%>¯Ç\nÎâ¹sZÒñ 2‡Ø=4äàÑ™W“vžœ\\>}9=ýêôçS‰1ˆZ#¡¹®™œ-–ñ n+™¶mÿí!:è+»Uó|ß÷nEÝŒïŠKÿ¶E/-]ñüõÚ_Öô´\'»^XÆt|ÿ¶”®.ÕšÐY+îÑÒ÷—GÕ\rÑÀjÔFj³)øG.³ 1ñ\rgË°¡×ü&‚\0àåX@#§Åª;$‹9s A i¤ÄR±ãª\nÄe .c‰†€\0@ˆ Ô$#€ršøRu‰e5U ­àWÈµVÚSô  Ì Á¨ZC \0aµˆbH NWq»+Ò0gËä.T±•ŽŒ´¨\0DS1êƒqPfÈésDÓ^äa››ÐÔúL\n œãV¢w\0ä+I\nZSHš!ZáAœHäºénR™Ô[Cã:GRóàWS·VPK@ãÐZFã[^XDSÃ¼KÃyW•Y2YM·€[àŽQª\rŽtÎzWªo1\"Ñ[â·\rw…HIq.ð¡Æ*Kô†\'EV|NfŒDÝÊéÎà5¹\ZZ BÀg„TfÑ[è3ÚW@B²$E=ëD$pB÷\0ÂxhB;B’Øi¾„gAð{g,¸j4Z\ZÎ›i#h9Ü–¤J_GŠëºÎ²É\\Hø \0’|ÏóT!4ŒI’È<Á×7‘°‡86ÅÎig˜£p7¦  ê´V[ÊA@+\'±æˆv<\r}8Øª„ÒØŠIn¦e™¦¨\nÌâÙ(5i\\ÛH¯jÛ\rG\rYà2ˆ‘5ö\nMREÜgêUï4‹“ØéeMN¬\"Š7›“Ÿ1 Ùi„rÂy\"‰i\raØD‚f\rö´>f+j»ÉªóµØ„9G®8‰l¹µñ†G  ‰¡±ª¬Ãà$E¢Á›¨ÔèÇk\\™)¸ä{JÄ2Î:z+  Ï·òB`4R÷ÙtÐ†­$‰°$O¢ÉnüØ4@d¥Å®éd‹LáÖ$4ØiF%\Z\'[…6NÂWD\"ÍyEžN“it„×Ä1í}AO7Òbó«8‰é± ,,ÝLŽÃH€‘­Ãæ:‹Ià(‘Ál ‘ªÉ´„ˆÄÑ¢Ë´˜][Da%ŒP9n²gDá…F\Z4Ô“x­\'©ä#¿2&\'V3zóë•ôs.Ê0¶ iÑº$yt¥Tñ\ZŸ­bÓþ\")#FjräIÔôäIè\"\0Ô´+bYÒ¶$œˆâ\Z¯±ãQØ½Œ¤™O¬W´ù˜$ˆc¿ Éˆ„y6yU–DÝv\'ù[2AÔ äà1I¾ÆYŽ¤–z¾cë\n;àDFÉÊÎ–$ åÐû#Á»½9ÎQã\") 3W>7»´´\'±_&Ù:fõl¼i¢‘ <ðe›§$\ZŸ6¤8  ë-ïñÜÖ±+!qnÈldÐêQ¸E»‹ì C’LPœ„Eá qIIÙ>v%e+S:,pjG+ã0;½Ø„n¸÷“(tåDéàÇEßÞJ‚Yæ l:ÊV”ts˜ÍVÞAf+(3½Ü0_~3 ^)A0­8ƒnÌ ƒÛï&áØÂ\n—©ölë\nÒõT/Õ\n}0b¦üQa\n4çvA¢°VP2Ç´\'QfZ”DÇñ\nD;ôX‡l²;-?<ãl\'<¸@­X2{&*ÓšE›…Â$GÄy5dÜ„\n‚N]žtxr÷«®D’ì6pD¦ÃûI¢Aá‘áãGÝ=Sß°ûõhÕÙ\\[ÕÛÏÔPPI‚ó86f³Ù×O é;\"1½Ðn\0UÜÈ&Oá»(IÔ!\Z@’ Hìì\n’= #Ñ¨Oj©S\"ÀÒô$³qÒˆF·\nÆ¶;­iþÔŒd+bL\"‰Ê\0c–hí‚„k¹Qe+cf  xY–â£ì¡š†’¤ÐÒ§™–à:ÌÙiª–6´ž?MMÈd\r#sl&Í\Zu‰µ^”G£#A`CJXbç‹ g5ã¡Ãi¿½^_‘NN¿R\n:y&9`\nN¸gvªÀ2èšøôZŸã\Zš\0 0±9vR±!ÿ•”éP&ç˜øë,âÆ$xx*/´ñ,™RVÇ¡±›yá-@H\Z¼5AÉÏ°\rÒ\\ò£1ÊÔùó\n—YäÉ\"¼¦FÕ¹™O&“3GŒz/I‚Y”3ü|²r2F¹«ÉY~TWÓ0°ãË|ýf2QX>g6‚©§WoV“ÉüL!…õ0ír²5‹È2ÍÔF7MBšÄÚPoÓ½ÔÝ¬°-wbg°zWg\'+šœÏöß É_#A\0?Ï“­(Ã0ëšïä£þï!©Óè‡aY¯Ú¶ÝPnåððwÓöï!‰Ïc!’šä³DâËTõõúEô{Hô&ÿ‚4¡özõBúM~â4%¸‰  oŠ[›¤3’Í±iw2k†Œ2ßd’§; [,òT#ß\rÿj™Êj$\nˆdÁ\'  \Z«Ü‰Î{¤Ï¥¦¼²_/¸5\\¼‚.U,Ã›;îîÆƒÊú­¥eYä¯ÂlÓ:üaØAtÐAtÐAô·Ñÿ\0¹ê\nHà³p\0\0\0\0IEND®B`‚','description','4.png',NULL,'image/png',3,2);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:57

/*********************************************************************************** COLOR *************************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `COLOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COLOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'WHITE'),(2,'BLUE'),(3,'RED'),(4,'YELLOW'),(5,'BLACK'),(6,'PINK');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:57


/*********************************************************************************** RELATIONSHIP ******************************************************************************************/

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_color_file`
--

DROP TABLE IF EXISTS `r_color_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_color_file` (
  `COLOR_ID` int(11) DEFAULT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  KEY `R_COLOR_FILE_COLOR_ID_IDX` (`COLOR_ID`),
  KEY `R_COLOR_FILE_FILE_ID_IDX` (`FILE_ID`),
  CONSTRAINT `R_COLOR_FILE_COLOR_ID_FK` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`COLOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_COLOR_FILE_FILE_ID_FK` FOREIGN KEY (`FILE_ID`) REFERENCES `file` (`FILE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_color_file`
--

LOCK TABLES `r_color_file` WRITE;
/*!40000 ALTER TABLE `r_color_file` DISABLE KEYS */;
INSERT INTO `r_color_file` VALUES (1,18),(1,19),(2,18),(2,17),(3,17),(1,17);
/*!40000 ALTER TABLE `r_color_file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:57

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_color_stamp`
--

DROP TABLE IF EXISTS `r_color_stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_color_stamp` (
  `COLOR_ID` int(11) DEFAULT NULL,
  `STAMP_ID` int(11) DEFAULT NULL,
  KEY `R_COLOR_STAMP_STAMP_ID_IDX` (`STAMP_ID`),
  KEY `R_COLOR_STAMP_COLOR_ID_IDX` (`COLOR_ID`),
  CONSTRAINT `R_COLOR_STAMP_COLOR_ID_FK` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`COLOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_COLOR_STAMP_STAMP_ID_FK` FOREIGN KEY (`STAMP_ID`) REFERENCES `stamp` (`STAMP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_color_stamp`
--

LOCK TABLES `r_color_stamp` WRITE;
/*!40000 ALTER TABLE `r_color_stamp` DISABLE KEYS */;
INSERT INTO `r_color_stamp` VALUES (1,1),(1,2),(1,3),(2,1),(2,4),(3,1),(3,3);
/*!40000 ALTER TABLE `r_color_stamp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:59


-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_color_text`
--

DROP TABLE IF EXISTS `r_color_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_color_text` (
  `COLOR_ID` int(11) DEFAULT NULL,
  `TEXT_ID` int(11) DEFAULT NULL,
  KEY `R_COLOR_TEXT_COLOR_ID_IDX` (`COLOR_ID`),
  KEY `R_COLOR_TEXT_TEXT_ID_IDX` (`TEXT_ID`),
  CONSTRAINT `R_COLOR_TEXT_COLOR_ID_FK` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`COLOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_COLOR_TEXT_TEXT_ID_FK` FOREIGN KEY (`TEXT_ID`) REFERENCES `text` (`TEXT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_color_text`
--

LOCK TABLES `r_color_text` WRITE;
/*!40000 ALTER TABLE `r_color_text` DISABLE KEYS */;
INSERT INTO `r_color_text` VALUES (1,1),(1,2),(1,3),(2,4),(3,4);
/*!40000 ALTER TABLE `r_color_text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_color_tshirt`
--

DROP TABLE IF EXISTS `r_color_tshirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_color_tshirt` (
  `COLOR_ID` int(11) DEFAULT NULL,
  `TSHIRT_ID` int(11) DEFAULT NULL,
  KEY `R_COLOR_TSHIRT_COLOR_ID_IDX` (`COLOR_ID`),
  KEY `R_COLOR_TSHIRT_TSHIRT_ID_IDX` (`TSHIRT_ID`),
  CONSTRAINT `R_COLOR_TSHIRT_COLOR_ID_FK` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`COLOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_COLOR_TSHIRT_TSHIRT_ID_FK` FOREIGN KEY (`TSHIRT_ID`) REFERENCES `tshirt` (`TSHIRT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_color_tshirt`
--

LOCK TABLES `r_color_tshirt` WRITE;
/*!40000 ALTER TABLE `r_color_tshirt` DISABLE KEYS */;
INSERT INTO `r_color_tshirt` VALUES (1,1),(2,1),(1,2),(3,3),(4,3);
/*!40000 ALTER TABLE `r_color_tshirt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:57

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_color_user`
--

DROP TABLE IF EXISTS `r_color_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_color_user` (
  `COLOR_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  KEY `R_COLOR_USER_COLOR_ID_IDX` (`COLOR_ID`),
  KEY `R_COLOR_USER_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `R_COLOR_USER_COLOR_ID_FK` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`COLOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_COLOR_USER_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_color_user`
--

LOCK TABLES `r_color_user` WRITE;
/*!40000 ALTER TABLE `r_color_user` DISABLE KEYS */;
INSERT INTO `r_color_user` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(1,5);
/*!40000 ALTER TABLE `r_color_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_invoice_stamp`
--

DROP TABLE IF EXISTS `r_invoice_stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_invoice_stamp` (
  `INVOICE_ID` int(11) DEFAULT NULL,
  `STAMP_ID` int(11) DEFAULT NULL,
  KEY `R_INVOICE_STAMP_INVOICE_ID_IDX` (`INVOICE_ID`),
  KEY `R_INVOICE_STAMP_STAMP_ID_FIDX` (`STAMP_ID`),
  CONSTRAINT `R_INVOICE_STAMP_INVOICE_ID_FK` FOREIGN KEY (`INVOICE_ID`) REFERENCES `invoice` (`INVOICE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_INVOICE_STAMP_STAMP_ID_FK` FOREIGN KEY (`STAMP_ID`) REFERENCES `stamp` (`STAMP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_invoice_stamp`
--

LOCK TABLES `r_invoice_stamp` WRITE;
/*!40000 ALTER TABLE `r_invoice_stamp` DISABLE KEYS */;
INSERT INTO `r_invoice_stamp` VALUES (3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(5,2),(6,1);
/*!40000 ALTER TABLE `r_invoice_stamp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_invoice_tshirt`
--

DROP TABLE IF EXISTS `r_invoice_tshirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_invoice_tshirt` (
  `INVOICE_ID` int(11) DEFAULT NULL,
  `TSHIRT_ID` int(11) DEFAULT NULL,
  KEY `R_INVOICE_TSHIRT_INVOICE_IDX` (`INVOICE_ID`),
  KEY `R_INVOICE_TSHIRT_TSHIRT_IDX` (`TSHIRT_ID`),
  CONSTRAINT `R_INVOICE_TSHIRT_INVOICE_FK` FOREIGN KEY (`INVOICE_ID`) REFERENCES `invoice` (`INVOICE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_INVOICE_TSHIRT_TSHIRT_FK` FOREIGN KEY (`TSHIRT_ID`) REFERENCES `tshirt` (`TSHIRT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_invoice_tshirt`
--

LOCK TABLES `r_invoice_tshirt` WRITE;
/*!40000 ALTER TABLE `r_invoice_tshirt` DISABLE KEYS */;
INSERT INTO `r_invoice_tshirt` VALUES (3,1),(3,2),(3,3),(4,1),(4,2),(5,3);
/*!40000 ALTER TABLE `r_invoice_tshirt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:59

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_material_tshirt`
--

DROP TABLE IF EXISTS `r_material_tshirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_material_tshirt` (
  `MATERIAL_ID` int(11) DEFAULT NULL,
  `TSHIRT_ID` int(11) DEFAULT NULL,
  KEY `R_MATERIAL_TSHIRT_MATERIAL_IDX` (`MATERIAL_ID`),
  KEY `R_MATERIAL_TSHIRT_TSHIRT_ID_IDX` (`TSHIRT_ID`),
  CONSTRAINT `R_MATERIAL_TSHIRT_MATERIAL_ID_FK` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`MATERIAL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_MATERIAL_TSHIRT_TSHIRT_ID_FK` FOREIGN KEY (`TSHIRT_ID`) REFERENCES `tshirt` (`TSHIRT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_material_tshirt`
--

LOCK TABLES `r_material_tshirt` WRITE;
/*!40000 ALTER TABLE `r_material_tshirt` DISABLE KEYS */;
INSERT INTO `r_material_tshirt` VALUES (1,1),(1,2),(1,3),(2,1),(3,2);
/*!40000 ALTER TABLE `r_material_tshirt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_rating_stamp`
--

DROP TABLE IF EXISTS `r_rating_stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_rating_stamp` (
  `RATING_ID` int(11) DEFAULT NULL,
  `STAMP_ID` int(11) DEFAULT NULL,
  KEY `R_RATING_STAMP_RATING_ID_FK` (`RATING_ID`),
  KEY `R_RATING_STAMP_STAMP_ID_IDX` (`STAMP_ID`),
  CONSTRAINT `R_RATING_STAMP_RATING_ID_FK` FOREIGN KEY (`RATING_ID`) REFERENCES `rating` (`RATING_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_RATING_STAMP_STAMP_ID_FK` FOREIGN KEY (`STAMP_ID`) REFERENCES `stamp` (`STAMP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_rating_stamp`
--

LOCK TABLES `r_rating_stamp` WRITE;
/*!40000 ALTER TABLE `r_rating_stamp` DISABLE KEYS */;
INSERT INTO `r_rating_stamp` VALUES (3,1),(3,1),(3,1),(4,1),(3,1),(5,2),(3,2),(3,2),(5,3),(3,3),(4,4);
/*!40000 ALTER TABLE `r_rating_stamp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:59

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_stamp_file`
--

DROP TABLE IF EXISTS `r_stamp_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_stamp_file` (
  `FILE_ID` int(11) DEFAULT NULL,
  `STAMP_ID` int(11) DEFAULT NULL,
  KEY `R_STAMP_FILE_FILE_IDX` (`FILE_ID`),
  KEY `R_STAMP_FILE_STAMP_IDX` (`STAMP_ID`),
  CONSTRAINT `R_STAMP_FILE_FILE_FK` FOREIGN KEY (`FILE_ID`) REFERENCES `file` (`FILE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_STAMP_FILE_STAMP_FK` FOREIGN KEY (`STAMP_ID`) REFERENCES `stamp` (`STAMP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_stamp_file`
--

LOCK TABLES `r_stamp_file` WRITE;
/*!40000 ALTER TABLE `r_stamp_file` DISABLE KEYS */;
INSERT INTO `r_stamp_file` VALUES (17,1),(18,1),(19,2),(17,2);
/*!40000 ALTER TABLE `r_stamp_file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_stamp_text`
--

DROP TABLE IF EXISTS `r_stamp_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_stamp_text` (
  `STAMP_ID` int(11) DEFAULT NULL,
  `TEXT_ID` int(11) DEFAULT NULL,
  KEY `R_STAMP_TEXT_STAMP_ID_IDX` (`STAMP_ID`),
  KEY `R_STAMP_TEXT_TEXT_ID_IDX` (`TEXT_ID`),
  CONSTRAINT `R_STAMP_TEXT_STAMP_ID_FK` FOREIGN KEY (`STAMP_ID`) REFERENCES `stamp` (`STAMP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_STAMP_TEXT_TEXT_ID_FK` FOREIGN KEY (`TEXT_ID`) REFERENCES `text` (`TEXT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_stamp_text`
--

LOCK TABLES `r_stamp_text` WRITE;
/*!40000 ALTER TABLE `r_stamp_text` DISABLE KEYS */;
INSERT INTO `r_stamp_text` VALUES (1,1),(1,2),(1,3),(2,4),(2,1);
/*!40000 ALTER TABLE `r_stamp_text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_stamp_tshirt`
--

DROP TABLE IF EXISTS `r_stamp_tshirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_stamp_tshirt` (
  `STAMP_ID` int(11) DEFAULT NULL,
  `TSHIRT_ID` int(11) DEFAULT NULL,
  KEY `R_STAMP_TSHIRT_STAMP_IDX` (`STAMP_ID`),
  KEY `R_STAMP_TSHIRT_TSHIRT_IDX` (`TSHIRT_ID`),
  CONSTRAINT `R_STAMP_TSHIRT_STAMP_FK` FOREIGN KEY (`STAMP_ID`) REFERENCES `stamp` (`STAMP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_STAMP_TSHIRT_TSHIRT_FK` FOREIGN KEY (`TSHIRT_ID`) REFERENCES `tshirt` (`TSHIRT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_stamp_tshirt`
--

LOCK TABLES `r_stamp_tshirt` WRITE;
/*!40000 ALTER TABLE `r_stamp_tshirt` DISABLE KEYS */;
INSERT INTO `r_stamp_tshirt` VALUES (1,1),(1,2),(1,3),(2,1),(2,1),(3,3);
/*!40000 ALTER TABLE `r_stamp_tshirt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_theme_user`
--

DROP TABLE IF EXISTS `r_theme_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_theme_user` (
  `THEME_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  KEY `R_THEME_USER_THEME_ID_IDX` (`THEME_ID`),
  KEY `R_THEME_USER_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `R_THEME_USER_THEME_ID_FK` FOREIGN KEY (`THEME_ID`) REFERENCES `theme` (`THEME_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_THEME_USER_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_theme_user`
--

LOCK TABLES `r_theme_user` WRITE;
/*!40000 ALTER TABLE `r_theme_user` DISABLE KEYS */;
INSERT INTO `r_theme_user` VALUES (1,1),(2,1),(3,2),(4,2);
/*!40000 ALTER TABLE `r_theme_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:57

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_tshirt_text`
--

DROP TABLE IF EXISTS `r_tshirt_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tshirt_text` (
  `TEXT_ID` int(11) DEFAULT NULL,
  `TSHIRT_ID` int(11) DEFAULT NULL,
  KEY `R_TSHIRT_TEXT_TEXT_ID_IDX` (`TEXT_ID`),
  KEY `R_TSHIRT_TEXT_TSHIRT_ID_IDX` (`TSHIRT_ID`),
  CONSTRAINT `R_TSHIRT_TEXT_TEXT_ID_FK` FOREIGN KEY (`TEXT_ID`) REFERENCES `text` (`TEXT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_TSHIRT_TEXT_TSHIRT_ID_FK` FOREIGN KEY (`TSHIRT_ID`) REFERENCES `tshirt` (`TSHIRT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tshirt_text`
--

LOCK TABLES `r_tshirt_text` WRITE;
/*!40000 ALTER TABLE `r_tshirt_text` DISABLE KEYS */;
INSERT INTO `r_tshirt_text` VALUES (1,1),(2,1),(1,2),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `r_tshirt_text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:59

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_tshirt_user`
--

DROP TABLE IF EXISTS `r_tshirt_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tshirt_user` (
  `TSHIRT_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  KEY `R_TSHIRT_USER_TSHIRT_ID_IDX` (`TSHIRT_ID`),
  KEY `R_TSHIRT_USER_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `R_TSHIRT_USER_TSHIRT_ID_FK` FOREIGN KEY (`TSHIRT_ID`) REFERENCES `tshirt` (`TSHIRT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_TSHIRT_USER_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tshirt_user`
--

LOCK TABLES `r_tshirt_user` WRITE;
/*!40000 ALTER TABLE `r_tshirt_user` DISABLE KEYS */;
INSERT INTO `r_tshirt_user` VALUES (1,2),(2,2),(3,2),(4,2),(1,1),(2,1);
/*!40000 ALTER TABLE `r_tshirt_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:58

-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `r_user_role`
--

DROP TABLE IF EXISTS `r_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_user_role` (
  `ROLE_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  KEY `R_USER_ROLE_ROLE_ID_IDX` (`ROLE_ID`),
  KEY `R_USER_ROLE_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `R_USER_ROLE_ROLE_ID_FK` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_USER_ROLE_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_user_role`
--

LOCK TABLES `r_user_role` WRITE;
/*!40000 ALTER TABLE `r_user_role` DISABLE KEYS */;
INSERT INTO `r_user_role` VALUES (2,3),(1,1),(2,1),(3,1),(2,2),(1,2);
/*!40000 ALTER TABLE `r_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:59



/*********************************************************************************** STOCE PROCEDURE ***************************************************************************************/



-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fabricetas
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Dumping events for database 'fabricetas'
--

--
-- Dumping routines for database 'fabricetas'
--
/*!50003 DROP PROCEDURE IF EXISTS `ALL_STAMPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALL_STAMPS`()
BEGIN
    SELECT S.NAME nombre, T.NAME tema, S.PRICE valor 
    ,T1.Cantidad cantidad,T1.total total
	FROM STAMP S CROSS JOIN
     (select COUNT(*) cantidad, SUM(S.PRICE) total
    FROM STAMP S 
	INNER JOIN R_INVOICE_STAMP RIS ON S.STAMP_ID = RIS.STAMP_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIS.INVOICE_ID  
	INNER JOIN THEME T ON T.THEME_ID = S.THEME_ID) AS T1
	INNER JOIN R_INVOICE_STAMP RIS ON S.STAMP_ID = RIS.STAMP_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIS.INVOICE_ID  
	INNER JOIN THEME T ON T.THEME_ID = S.THEME_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ALL_TSHIRT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALL_TSHIRT`()
BEGIN
	SELECT T.NAME nombre, C.NAME color, T.DESCRIPTION talla, T.PRICE valor,
	T1.Cantidad cantidad,T1.total total
	FROM TSHIRT T CROSS JOIN 
	(select COUNT(*) cantidad, SUM(T.PRICE) total
	FROM TSHIRT T
	INNER JOIN R_INVOICE_TSHIRT RIT ON T.TSHIRT_ID= RIT.TSHIRT_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIT.INVOICE_ID  
	INNER JOIN R_COLOR_TSHIRT RCT ON T.TSHIRT_ID = RCT.TSHIRT_ID 
	INNER JOIN COLOR C ON C.COLOR_ID = RCT.COLOR_ID) AS T1
	INNER JOIN R_INVOICE_TSHIRT RIT ON T.TSHIRT_ID= RIT.TSHIRT_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIT.INVOICE_ID  
	INNER JOIN R_COLOR_TSHIRT RCT ON T.TSHIRT_ID = RCT.TSHIRT_ID 
	INNER JOIN COLOR C ON C.COLOR_ID = RCT.COLOR_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STAMP_SOLD_BY_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STAMP_SOLD_BY_USER`(
	IN USER_ID INT)
BEGIN
    SELECT S.NAME nombre, T.NAME tema, S.PRICE valor 
    ,T1.Cantidad cantidad,T1.total total
	FROM STAMP S CROSS JOIN
     (select COUNT(*) cantidad, SUM(S.PRICE) total
    FROM STAMP S 
	INNER JOIN R_INVOICE_STAMP RIS ON S.STAMP_ID = RIS.STAMP_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIS.INVOICE_ID  
	INNER JOIN THEME T ON T.THEME_ID = S.THEME_ID 
	WHERE I.USER_ID=USER_ID) AS T1
	INNER JOIN R_INVOICE_STAMP RIS ON S.STAMP_ID = RIS.STAMP_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIS.INVOICE_ID  
	INNER JOIN THEME T ON T.THEME_ID = S.THEME_ID 
	WHERE I.USER_ID=USER_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STAMP_SOLD_BY_USER_BETWEEN_DATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STAMP_SOLD_BY_USER_BETWEEN_DATE`(
	IN USER_ID INT,
	IN INITIAL_DATE DATE,
	IN FINAL_DATE DATE)
BEGIN
    SELECT S.NAME nombre, T.NAME tema, S.PRICE valor 
    ,T1.Cantidad cantidad,T1.total total
	FROM STAMP S CROSS JOIN
     (select COUNT(*) cantidad, SUM(S.PRICE) total
    FROM STAMP S 
	INNER JOIN R_INVOICE_STAMP RIS ON S.STAMP_ID = RIS.STAMP_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIS.INVOICE_ID  
	INNER JOIN THEME T ON T.THEME_ID = S.THEME_ID 
	WHERE I.USER_ID=USER_ID AND I.DATE BETWEEN INITIAL_DATE AND FINAL_DATE) AS T1
	INNER JOIN R_INVOICE_STAMP RIS ON S.STAMP_ID = RIS.STAMP_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIS.INVOICE_ID  
	INNER JOIN THEME T ON T.THEME_ID = S.THEME_ID 
	WHERE I.USER_ID=USER_ID AND I.DATE BETWEEN INITIAL_DATE AND FINAL_DATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STAMP_SOLD_BY_USER_THEME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STAMP_SOLD_BY_USER_THEME`(
	IN USER_ID INT,
	IN THEME_ID INT)
BEGIN
    SELECT S.NAME nombre, T.NAME tema, S.PRICE valor 
    ,T1.Cantidad cantidad,T1.total total
	FROM STAMP S CROSS JOIN
     (select COUNT(*) cantidad, SUM(S.PRICE) total
    FROM STAMP S 
	INNER JOIN R_INVOICE_STAMP RIS ON S.STAMP_ID = RIS.STAMP_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIS.INVOICE_ID  
	INNER JOIN THEME T ON T.THEME_ID = S.THEME_ID 
	WHERE I.USER_ID=USER_ID AND T.THEME_ID=THEME_ID) AS T1
	INNER JOIN R_INVOICE_STAMP RIS ON S.STAMP_ID = RIS.STAMP_ID 
	INNER JOIN INVOICE I ON I.INVOICE_ID = RIS.INVOICE_ID  
	INNER JOIN THEME T ON T.THEME_ID = S.THEME_ID 
	WHERE I.USER_ID=USER_ID AND T.THEME_ID=THEME_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25  1:37:59
