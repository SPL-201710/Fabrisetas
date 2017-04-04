CREATE DATABASE IF NOT EXISTS FABRICETAS;

USE FABRICETAS;

--
-- DROP tables
--

DROP TABLE IF EXISTS `FACTURA`;
DROP TABLE IF EXISTS `FILE`;
DROP TABLE IF EXISTS `ADDRESS`;
DROP TABLE IF EXISTS `R_USER_ROLE`;
DROP TABLE IF EXISTS `ESTAMPA`;
DROP TABLE IF EXISTS `CAMISETA`;
DROP TABLE IF EXISTS `TEXTO`;
DROP TABLE IF EXISTS `TEMA`;
DROP TABLE IF EXISTS `ROLE`;
DROP TABLE IF EXISTS `USER`;

--
-- Table structure for table `USER`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `IDENTIFICATION_TYPE` varchar(45) DEFAULT NULL,
  `IDENTIFICATION_NUMBER` varchar(45) DEFAULT NULL,
  `TIPO` varchar(45) DEFAULT NULL,
  `SSO_ID` varchar(45) DEFAULT NULL,
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  `LAST_NAME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'Mariana','CC','17985632','Cliente',NULL,NULL,NULL,NULL),(2,'Carlos','CC','13256987','Cliente',NULL,NULL,NULL,NULL),(3,'Paola','CC','12547853','Artista',NULL,NULL,NULL,NULL),(5,'Jose','CC','135478961',NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,'10','Belman','Santos','belmanese@gmail.com'),(12,NULL,NULL,NULL,NULL,NULL,'Juan','Perez','asdfa@gmail.com'),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'Administrador'),(2,'Cliente'),(3,'Artista');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEMA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEMA` (
  `TEMA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `URL_TEMA` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`TEMA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEMA`
--

LOCK TABLES `TEMA` WRITE;
/*!40000 ALTER TABLE `TEMA` DISABLE KEYS */;
INSERT INTO `TEMA` VALUES (1,'Religion','Acerca de la Religion','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/520/print/dg-designer-f228bda6147892601534101283710264118.svg'),(2,'Musica','Acerca de la musica','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/529/print/dg-designer-2e74c2cf147892860236578299010767565.svg '),(3,'Sentimientos','Acerca de los sentimientos','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/518/print/dg-designer-7070f908147892533786563549510343450.svg');
/*!40000 ALTER TABLE `TEMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEXTO`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEXTO` (
  `TEXTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COLOR` varchar(45) DEFAULT NULL,
  `TITULO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TEXTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEXTO`
--

LOCK TABLES `TEXTO` WRITE;
/*!40000 ALTER TABLE `TEXTO` DISABLE KEYS */;
INSERT INTO `TEXTO` VALUES (1,'Rojo','Corazon'),(2,'Azul','Cielo'),(3,'Verde','Naturalez'),(4,'Amarillo','Felicidad');
/*!40000 ALTER TABLE `TEXTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMISETA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAMISETA` (
  `CAMISETA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MATERIAL` varchar(45) DEFAULT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `URL_CAMISETA` varchar(250) DEFAULT NULL,
  `VALOR` varchar(45) DEFAULT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `COLOR` varchar(45) DEFAULT NULL,
  `TEXTO_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CAMISETA_ID`),
  KEY `CAMISETA_TEXTO_ID_IDX` (`TEXTO_ID`),
  KEY `CAMISETA_USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `CAMISETA_TEXTO_ID` FOREIGN KEY (`TEXTO_ID`) REFERENCES `TEXTO` (`TEXTO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CAMISETA_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMISETA`
--

LOCK TABLES `CAMISETA` WRITE;
/*!40000 ALTER TABLE `CAMISETA` DISABLE KEYS */;
INSERT INTO `CAMISETA` VALUES (1,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/camiseta-cuello-v/camiseta_cuello_v_blanco_frente.png','50000','Ligera','Azul',1,1),(2,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/camiseta-cuello-v/camiseta_cuello_v_blanco_frente.png','50000','Ligera1','Azul',1,1),(3,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/camiseta-cuello-v/camiseta_cuello_v_negro_frente.png','50000','Ligera2','Azul',1,1),(4,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/camiseta-cuello-v/camiseta_cuello_v_azul_rey_frente.png','50000','Ligera3','Azul',1,2),(5,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/camiseta-cuello-v/camiseta_cuello_v_azul_turqui_frente.png','50000','Ligera4','Azul',1,2),(6,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/camiseta-cuello-v/camiseta_cuello_v_amarillo_frente.png','50000','Ligera5','Azul',1,2),(7,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/camiseta-cuello-v/camiseta_cuello_v_verde_kelly_frente.png','50000','Ligera6','Azul',1,2),(8,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/camiseta-cuello-v/camiseta_cuello_v_rojo_frente.png','50000','Ligera','Azul',1,1),(9,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_blanco_frente.png','50000','esqueleto1','Azul',1,2),(10,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_verde_jade_frente.png','50000','esqueleto2','Azul',1,1),(11,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_azul_turqui_frente.png','50000','esqueleto3','Azul',1,2),(12,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_negro_frente.png','50000','esqueleto4','Azul',1,1),(13,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_fucsia_frente.png','50000','esqueleto5','Azul',1,1),(14,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_turquesa_frente.png','50000','esqueleto6','Azul',1,1),(15,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_amarillo_frente.png','50000','esqueleto7','Azul',1,1),(16,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_rojo_frente.png','50000','esqueleto8','Azul',1,1),(17,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_menta_claro_frente.png','50000','esqueleto9','Azul',1,1),(18,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_coral_oscuro_frente.png','50000','esqueleto10','Azul',1,1),(19,'Algodon','Camiseta Ligera','https://jollyjoker.co/tshirtecommerce//uploaded/products/blusa-esqueleto/blusa_esqueleto_gris_jaspe_frente.png','50000','esqueleto11','Azul',1,1);
/*!40000 ALTER TABLE `CAMISETA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTAMPA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTAMPA` (
  `ESTAMPA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  `URL_ESTAMPA` varchar(250) DEFAULT NULL,
  `RATING` varchar(45) DEFAULT NULL,
  `PRECIO` varchar(45) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CAMISETA_ID` int(11) DEFAULT NULL,
  `TEMA_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ESTAMPA_ID`),
  KEY `ESTAMPA_USER_ID_IDX` (`USER_ID`),
  KEY `ESTAMPA_CAMISETA_ID_IDX` (`CAMISETA_ID`),
  KEY `ESTAMPA_TEMA_ID_IDX` (`TEMA_ID`),
  CONSTRAINT `ESTAMPACAMISETA_ID` FOREIGN KEY (`CAMISETA_ID`) REFERENCES `CAMISETA` (`CAMISETA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ESTAMPATEMA_ID` FOREIGN KEY (`TEMA_ID`) REFERENCES `TEMA` (`TEMA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ESTAMPA_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTAMPA`
--

LOCK TABLES `ESTAMPA` WRITE;
/*!40000 ALTER TABLE `ESTAMPA` DISABLE KEYS */;
INSERT INTO `ESTAMPA` VALUES (1,'Estampa 1','Descripcion Estampa 1','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-5c6287be147892351658358183410311937.svg','5','2000',3,1,1),(2,'Estampa 1','Descripcion Estampa 1','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-5c6287be147892351658358183410311937.svg','5','2000',3,1,1),(3,'Estampa 2','Descripcion Estampa 2','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-35a12c43147892352872423485510763668.svg','5','2000',5,2,1),(4,'Estampa 3','Descripcion Estampa 3','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-fd45c64e14789235041750769171098240.svg','5','2000',5,3,1),(5,'Estampa 4','Descripcion Estampa 4','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-544a4f59147892349541616323811072175.svg','5','3000',5,4,1),(6,'Estampa 5','Descripcion Estampa 5','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-1a77befc147892338329297399510133442.svg','5','25000',3,5,1),(7,'Estampa 6','Descripcion Estampa 6','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/514/print/dg-designer-1c208ee8147892339948116656210677366.svg','5','2400',3,6,2),(8,'Estampa 7','Descripcion Estampa 7','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/519/print/dg-designer-455cb265147892583893178315611075752.svg','5','2200',5,7,2),(9,'Estampa 8','Descripcion Estampa 8','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/519/print/dg-designer-f655e8f9147892580999569643910123859.svg','5','2200',5,8,2),(10,'Estampa 9','Descripcion Estampa 9','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/521/print/dg-designer-50982fb2147892630584253368010435571.svg','5','2200',5,9,2),(11,'Estampa 10','Descripcion Estampa 10','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/521/print/dg-designer-fcd11da0147892631530024221410133602.svg','5','6000',5,10,1),(12,'Estampa 11','Descripcion Estampa 11','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/521/print/dg-designer-a9fb9e6e147892611646692764210725530.svg','5','6000',3,11,1),(13,'Estampa 12','Descripcion Estampa 12','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/521/print/dg-designer-4cdcf18b147892635097902353410878667.svg','5','8000',3,12,3),(14,'Estampa 13','Descripcion Estampa 13','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/524/print/dg-designer-b8703970147892679475779569211063592.svg','5','8000',3,13,3),(15,'Estampa 14','Descripcion Estampa 14','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/525/print/dg-designer-c12706a7147892682447813183210865409.svg','5','2000',3,15,3),(16,'Estampa 15','Descripcion Estampa 15','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/525/print/dg-designer-7940ab47147892693491915739010049557.svg','5','2000',3,15,3),(17,'Estampa 16','Descripcion Estampa 16','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/522/print/dg-designer-fb0650ff147892642067081898910657101.svg','5','2000',5,16,3),(18,'Estampa 17','Descripcion Estampa 17','https://jollyjoker.co/tshirtecommerce/uploaded/cliparts/522/print/dg-designer-c950cde9147892643772446036110413163.svg','5','2000',5,17,3);
/*!40000 ALTER TABLE `ESTAMPA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADDRESS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADDRESS` (
  `ADDRESS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `USER_ID_IDX` (`USER_ID`),
  CONSTRAINT `USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESS`
--

LOCK TABLES `ADDRESS` WRITE;
/*!40000 ALTER TABLE `ADDRESS` DISABLE KEYS */;
INSERT INTO `ADDRESS` VALUES (1,'Dirección 11',1),(2,'Direccion 12',1),(3,'Direccion 21',2);
/*!40000 ALTER TABLE `ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R_USER_ROLE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_USER_ROLE` (
  `R_USER_ID` int(11) NOT NULL,
  `R_ROLE_ID` int(11) NOT NULL,
  KEY `R_USER_ID_IDX` (`R_USER_ID`),
  KEY `R_ROLE_ID_IDX` (`R_ROLE_ID`),
  CONSTRAINT `R_ROLE_ID` FOREIGN KEY (`R_ROLE_ID`) REFERENCES `ROLE` (`ROLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_USER_ID` FOREIGN KEY (`R_USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R_USER_ROLE`
--

LOCK TABLES `R_USER_ROLE` WRITE;
/*!40000 ALTER TABLE `R_USER_ROLE` DISABLE KEYS */;
INSERT INTO `R_USER_ROLE` VALUES (2,3);
/*!40000 ALTER TABLE `R_USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FILE` (
  `FILE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENT` longblob,
  `DESCRIPTION` varchar(150) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PATH` varchar(45) DEFAULT NULL,
  `TYPE` varchar(45) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CAMISETA_ID` int(11) DEFAULT NULL,
  `ESTAMPA_ID` int(11) DEFAULT NULL,
  `TEMA_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `FILE_USER_ID_FX_IDX` (`USER_ID`),
  KEY `FILE_CAMISETA_ID_FK_IDX` (`CAMISETA_ID`),
  KEY `FILE_ESTAMPA_ID_FK_IDX` (`ESTAMPA_ID`),
  KEY `FILE_TEMA_ID_FK_IDX` (`TEMA_ID`),
  CONSTRAINT `FILE_CAMISETA_ID_FK` FOREIGN KEY (`CAMISETA_ID`) REFERENCES `CAMISETA` (`CAMISETA_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FILE_ESTAMPA_ID_FK` FOREIGN KEY (`ESTAMPA_ID`) REFERENCES `ESTAMPA` (`ESTAMPA_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FILE_TEMA_ID_FK` FOREIGN KEY (`TEMA_ID`) REFERENCES `TEMA` (`TEMA_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FILE_USER_ID_FX` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE`
--

LOCK TABLES `FILE` WRITE;
/*!40000 ALTER TABLE `FILE` DISABLE KEYS */;
INSERT INTO `FILE` VALUES (17,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0É\0\0\0x\0\0\0oŽ&ç\0\0\0íPLTEÿÿÿ8{,ÂÍ\"4y\'&sÂÖ¿2x%)t.v ·Í´;~/šº•°É¬H†<¦Ä¡5y)Ž´‡ÜçÚäìân\0[Rñöð×åÔûüòÀËÓÛeÛá’1x,õøôÈÑ!íòì¨Â£Ç×Åt¢l—³&·Ç#R‰I+u-c–[úûêC8RŽG{£uåê¨tŸnf”_•²‘†¬ÇÑ8Œ¬&¥»%Î×[òôÒL†+k—)ja›¶—ˆ¯Œ­‡QˆHÕÝvìïº?+ÉÓBYŽ*­Á#vž(óõÙÝäqš)åé°ÒÚ_ìðÄÎØPw Lˆƒ¨d±ÇyÝãŽÍBÔÜ\0\0\nNIDATxœíš\r{š:ÇÁ@ˆR¬NäE«Õvmm]çÚ­ÛiŸ—óý?Î“ðnWl=“sÿ×µk ¹Iî;wB9î ƒ:è ƒþt²ov¦ÎÓ¾-Ø‘NÛömÂnô´hßíÛ†è©W©|ú\'x\n©|½Ü·ï×ÏE…èË¾íx¯¬Ç€£Òþ¹oKÞ\'ë²×f$Çû6æ².&éü]þén`—ÿ¾o{Þ¨ãÓN’«ü$ÇX\'XÇ¡NN.¿¶ÛiŽJ»äaøäéçc§óuõG‡êE/K”:?ýÙ©´£Þo3å)‚§§û¶öe`OxÁìM$û¶÷%Øƒtömñ:¾+ÊÑ;/5IqÊÃy/øÿyß6oÔ •ôÿ…µo«7é´8HÿºRb’ËEaÁ}¿Ì$ÅçVïÇý€]~Ý·ÕtR¤ß=g—¥Œ]Å‡¤ß\r½¤œ$…½¤¿æ\"’®ñßrôúël-©”3ïúRä‚ÿxÿ,cVÿ¡É·n7Š[D%Üi=pøÞÃn÷ê¢ßy.á>¾ÉÅU·»¾HÜ(åÙÊé«2ø¶îvù$H)þUô×]>=µJzšzü\nÇýGžïÞ§F¤RÒ³úç_Ì«ó{¹K@2OÊù%èËf—ïõ¾]¼Ž2ÏÊ¹Íâ¸Ne0\\üX$ØEú½Ìã2.‹¾?·{XØþ‡‡‹‹~ÿüÛõO1ø®|ý)§—]~êŸcó¯ïï¯®Ö˜¡K)È}?;³*í’~Ðrë\r¿–ßM\00Œë<G¥½(åÜrAjNMŽÁEW¾ºî÷²‹€”0ãâ8[Øj©†‘P¢Ë_];ÏG0µJ9\"\\= `è\\Ã×ØŒ’ïœ÷/•üp`ŽÊŸåô®FITÓ\r Bÿþ×Å`Pi·7b´ÛRÎ,\"% xLZH6þóß»ÇÓÇ»»»Î§ç¯‹E%>¯ÇÎâ¹sZÒñ 2‡Ø=4äàÑ™W“vžœ\\>}9=ýêôçS‰1ˆZ#¡¹®™œ-–ñ n+™¶mÿí!:è+»Uó|ß÷nEÝŒïŠKÿ¶E/-]ñüõÚ_Öô´\'»^XÆt|ÿ¶”®.ÕšÐY+îÑÒ÷—GÕ\rÑÀjÔFj³)øG.³ 1ñ\rgË°¡×ü&‚\0àåX@#§Åª;$‹9s A i¤ÄR±ãª\nÄe .c‰†€\0@ˆ Ô$#€ršøRu‰e5U ­àWÈµVÚSô  Ì Á¨ZC \0aµˆbH NWq»+Ò0gËä.T±•ŽŒ´¨\0DS1êƒqPfÈésDÓ^äa››ÐÔúL\n œãV¢w\0ä+IZSHš!ZáAœHäºénR™Ô[Cã:GRóàWS·VPK@ãÐZFã[^XDSÃ¼KÃyW•Y2YM·€[àŽQª\rŽtÎzWªo1\"Ñ[â·\rw…HIq.ð¡Æ*Kô†\'EV|NfŒDÝÊéÎà5¹\ZZ BÀg„TfÑ[è3ÚW@B²$E=ëD$pB÷\0ÂxhB;B’Øi¾„gAð{g,¸j4Z\ZÎ›i#h9Ü–¤J_GŠëºÎ²É\\Hø \0’|ÏóT!4ŒI’È<Á×7‘°‡86ÅÎig˜£p7¦  ê´V[ÊA@+\'±æˆv<\r}8Øª„ÒØŠIn¦e™¦¨\nÌâÙ(5i\\ÛH¯jÛ\rG\rYà2ˆ‘5ö\nMREÜgêUï4‹“ØéeMN¬\"Š7›“Ÿ1 Ùi„rÂy\"‰i\raØD‚f\rö´>f+j»ÉªóµØ„9G®8‰l¹µñ†G  ‰¡±ª¬Ãà$E¢Á›¨ÔèÇk\\™)¸ä{JÄ2Î:z+  Ï·òB`4R÷ÙtÐ†­$‰°$O¢ÉnüØ4@d¥Å®éd‹LáÖ$4ØiF%\Z\'[…6NÂWD\"ÍyEžN“it„×Ä1í}AO7Òbó«8‰é± ,,ÝLŽÃH€‘­Ãæ:‹Ià(‘Ál ‘ªÉ´„ˆÄÑ¢Ë´˜][Da%ŒP9n²gDá…F\Z4Ô“x­\'©ä#¿2&\'V3zóë•ôs.Ê0¶ iÑº$yt¥Tñ\ZŸ­bÓþ\")#FjräIÔôäIè\"\0Ô´+bYÒ¶$œˆâ\Z¯±ãQØ½Œ¤™O¬W´ù˜$ˆc¿ Éˆ„y6yU–DÝv\'ù[2AÔ äà1I¾ÆYŽ¤–z¾cë;àDFÉÊÎ–$ åÐû#Á»½9ÎQã\") 3W>7»´´\'±_&Ù:fõl¼i¢‘ <ðe›§$\ZŸ6¤8  ë-ïñÜÖ±+!qnÈldÐêQ¸E»‹ì C’LPœ„Eá qIIÙ>v%e+S:,pjG+ã0;½Ø„n¸÷“(tåDéàÇEßÞJ‚Yæ l:ÊV”ts˜ÍVÞAf+(3½Ü0_~3 ^)A0­8ƒnÌ ƒÛï&áØÂ—©ölëÒõT/Õ\n}0b¦üQa\n4çvA¢°VP2Ç´\'QfZ”DÇñ\nD;ôX‡l²;-?<ãl\'<¸@­X2{&*ÓšE›…Â$GÄy5dÜ„‚N]žtxr÷«®D’ì6pD¦ÃûI¢Aá‘áãGÝ=Sß°ûõhÕÙ\\[ÕÛÏÔPPI‚ó86f³Ù×O é;\"1½Ðn\0UÜÈ&Oá»(IÔ!\Z@’ Hìì’= #Ñ¨Oj©S\"ÀÒô$³qÒˆF·Æ¶;­iþÔŒd+bL\"‰Ê\0c–hí‚„k¹Qe+cf  xY–â£ì¡š†’¤ÐÒ§™–à:ÌÙiª–6´ž?MMÈd\r#sl&Í\Zu‰µ^”G£#A`CJXbç‹ g5ã¡Ãi¿½^_‘NN¿R:y&9`N¸gvªÀ2èšøôZŸã\Zš\0 0±9vR±!ÿ•”éP&ç˜øë,âÆ$xx*/´ñ,™RVÇ¡±›yá-@H\Z¼5AÉÏ°\rÒ\\ò£1ÊÔùó—YäÉ\"¼¦FÕ¹™O&“3GŒz/I‚Y”3ü|²r2F¹«ÉY~TWÓ0°ãË|ýf2QX>g6‚©§WoV“ÉüL!…õ0ír²5‹È2ÍÔF7MBšÄÚPoÓ½ÔÝ¬°-wbg°zWg\'+šœÏöß É_#A\0?Ï“­(Ã0ëšïä£þï!©Óè‡aY¯Ú¶ÝPnåððwÓöï!‰Ïc!’šä³DâËTõõúEô{Hô&ÿ‚4¡özõBúM~â4%¸‰  oŠ[›¤3’Í±iw2k†Œ2ßd’§; [,òT#ß\rÿj™Êj$ˆdÁ\'  \Z«Ü‰Î{¤Ï¥¦¼²_/¸5\\¼‚.U,Ã›;îîÆƒÊú­¥eYä¯ÂlÓ:üaØAtÐAtÐAô·Ñÿ\0¹ê\nHà³p\0\0\0\0IEND®B`‚','4','4.png',NULL,'image/png',NULL,1,NULL,NULL),(18,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0X\0\0\0ö½sX\0\0\0PLTEÿÿÿm³?k²<i±9g°5ûýø°Ö˜f°3ñ÷ím´<…¾b¬Ó•€¼\\pµ@d¯/÷ûõÔçÉçóßƒ¾ZÝëÕ¡ËŠt·JÏæÂÀÞ­|»Sa®)ï÷êÜìÒÈâ¹x¹Mëõä»Ú©’ÅršÊ|¢Î†’ÅsËã¼³Ö žÌŽÄk·Ù¤´Øœ¿Ü°ØéÍ§Ï¦Ñ‹„½aÄÞ·Hšn!\0\02IDATxœí\\i{£*®€Å}K5n1{LL2÷ÿÿ»«\nJLÛÛkç™ÎùÒ4\n^Îäåå/ý,*¼ê¯øn.~CZ:vlã–ÿG¤‚JM\0Ùñf©}77¿E\nP(ˆàìÿE‡ÐTx•ç¿F§&ß\0Ê€ ²Ë[ž~7gßM‘>¦*«Mõ£ÕJ5‘jt¬õÏ5:š5R&Áèèå1ú™zµÀÀ´z…Ãò-ÿ’óP™xµ‚JXþ8£N)“htÊåâõÊ_¨óŽ—¼ªWvyþ&£ão-kïÍ9âå™™‚\Z»ƒ;\'‡-¥\0íhÆ!ÇaÞ3µj¬N¹ÔæíSk\rQ9ßšdï43t Æ›*›O¯Tƒä¼ö|^`ý`Z‚Ž½Ÿ/Ò™uŸ!0%9(üµ‹fQ«‹ÓŒˆv³éð\"ø´Ìpj½B÷”ß-1„Èðÿÿ‘(þƒÈtä”3èTºÞ—Çù€qoÏàw4çrwÎX!©2Õžø?¨ˆ32=y™™bœN–òylœ9#°YˆÄOŠ]Õ‚šÞD-OÏ\nWß=“¯&»1>¶ÿ¸§‘9ÐqB£Ü”1rÐ:øO“™Œ(“NÃ§h²·¹æÊ^ƒ‡¢V×«šúùÑ|=ç‹TˆËŠÊìKËš_Ý÷›Ó%*†vÕ_š¬äÑå5\"ÿ¨Ùù’ÑwÕl}\\°vZ/—³WHƒ@5]¬O¥Qž–‹îyfîžíÝ[eõ,¾)Àpð|åØÀm?\ZÝÇÁáZÜök¯{rX9È±„ÅºÄÕ\nrjð…mŠ<¬_3š×Tïd;;eë«o¨nq\'½™Íç[ûÙ?—:M/«ñ~GvÚ Â°¬ÈºTõ7Ž5é3TRç!…ß¹Ù¢$¸]˜þÁm8@æÜ£÷f#n÷\n…ûŠôîÚ®\"«é4ÿ;ÅH7ò~„”¼¶Ñ^´[HzÂÛ×¶X‚Úò4íÖõ*w=AT”Z3cÜ/%D¯eó:MIÍ•Ê¦²aö½\0ç(ÎkN7‚EaÇÑu(U\0‚ ­ªTDsïE5Ñ A°ë;Ÿà,R£ë)©¿\'#‚ y±¤Ÿ]÷€ØÑ™g62•ÚSÛ²‹h\0†t„lf­hå½2Ç…´tÖ^î³ÿÅ¤ëjKbjè4L¼’)ã¥ú†G*‰KÝš¤}š¨u®MÚ4&‘Šºbk;gÐH8\'¡±GIÖ*\rní‰*˜¶e-¾ËóMÏ0®Í–^ì­øÉ!“>Rc†µàèÑŽGæ(»‘‘\nÈÀm?+`¿H‘  Í!0Í»ýydÏ•êÈd1Ç<Æ+á054e)8x‡½¾¦£coN› sôpÓ#Jò9I’8=|ø$ ÃÍ$K92ôymÆ¹U€;ÊKô¦·ƒµÜ€˜IÜ2ÿ ¾®÷$Ü¨6¥;\0k~á1{ò‹Zô%ù÷z_Õª_µì‘im\0â]ThE¾\r»a©7‡&H‰—êcd ov»rÕÅï`E—iÃ8 hÜ½æÝW¼Uš@Æ=u³Šu:Å¬¾M£mQ-ëgÎ;¡-}Då—³Qîr¢°-ª¼öX¢`É‚‘Â´Yæ,FÈ@{$1Œ lòÖÄiUg–ˆû¢¾¬éÃê¬²öÊiÉ2EgpÝ‰k’ÙBcª¦à¸™Å’+;lŒŠ´ßðí5ï¯[*y·3hÈ”xdp1Ÿõ@fnOóKÚ?­XÝ –|åÂë¡™@&êìÍTj<&r mMl¬~Ø÷Z¼bì­uŽµ!uÈ@C²rP¡IEdœ=?Ê{.âÊV¬›&Þ‹:æÄèïÚí”L Ó[–ÈEfiP}Æë{×\Zí˜jd@(³³3«¡ygÁC›°÷ÈÀ;7o92Â¬™ék½;ä£–%ƒf™Ndê‰|Ófb°ÄSëÄév‘+Ü.{d:³RÙ¤¿XV\ZfÈ@sø¤ ³níU‡Œ¨”2dà^è†¹Z¼hº$Ý Óh&%|†Lô\0EXÍÏ¼¨:›»Òæ“í:àéb¡ SŽ+hý4ªÓ¦qÅò•ôB™äÉqÄ´ŽæÎ¢eôq {`¢õ™]ï™xd€Å½“·±]§‡XÚ!ÓÎÛžºd™n\n5_ÚÆmÀ‹gŒ1+WÚWâöÈ´1Ð42‰¨öÌL6ÈèIœ‰<‰gÜÞÀÈ {÷Šv‹‡€´×>,)˜•×9íëå° åì]ÆUX|‘0C½dc2ŽhdÈ AýâŒÔÈ¬‰5A’ú´»{G¡™^D½Õ8¿i×¡§¦ú\nb^6î|\0PbTîPd¤uQ¦QŒ.¾!CF—#SËŒJ3i©ñø™—ðÈ$l*WýÁ†Ë½A¨kƒ%ß«{+YGWDF–â2qèó¦R|ãÈÔ2ÃØá$ƒ­§‘Ñö¡ŸÓX,«†/œS·^ÅB,h @ŸG&‘mQfpÞ!3èö£2C³Fô  d²ïhxm¢šy“°ßªÎé¶o2ªPHÿñ2LfdÉj9’g ”™Ë„ÌúÌCd*.—ÉŸ‡óÀ(WÒG[º?î[‹.¥Í¥î0N_¸*„„:X“f˜=HŸDÆá,ðq<–ú6)3._”‘¡µRéÞ%sšm9‹²ýË¹2žŠl]:oSTŠÌ8öª¹¡‘uRôÈõ‘¡ìCII3¥ú\0™Ôæç+hSk!Ý»\0r*Öˆ:J\r*™KqYQsµgVãWiô¡8/_L£ßÔó³¦†2:õÈTü4\"í¼îê×—³N›¤\\]ö!8g*0âò¦qñçÄù£¯‘ŸÅëÑ`lÍ cðm±eP\'³)ê|ŒYfÉßé­þŠ\0 —\\ÞTÁd¡|›òÌ¨4¦èë\0Œ2v•@ŽŒ+¸…ì I^¸1#¼ZkõDYàë‘Y²7IÏ§óÈ(``;ù„‹/A¦‘™î(ØA·“  92ùcd¥q«êQ8ñ  ÞùM•¡/µÓ¸kËºˆk¤s+]pO,Ý©Sm÷Kiã…øº°MArQ\"Ddà[ó1b•¶¦B¬‡÷\Zí®wßåd«\n½ñ%3\0‡ÂIó1w0ªŽÙ¿Slè\Z\0ÂêÉÌË+ëÝ:+¬^Ëž  )2©¬ê3m\"äpB«ò-w›^ƒNŒð|<¦µ`gßçJQÞ7ñ(«ö<¸›»\n?ÍÙ¿\n­e‘UeÍJ¤žr!Eæ 4Ð&r€Êp-o•×8™Ù§Qxã’³² æ•I£5i¨[Ûc´ðýèHËÖü®\nÙž„ÀÚïÞvû~ÐºÍiSS‡éê$0ØœNÛ2Ädß‚Œ\'Ý9\Zì\\a£·[ä§äItê§\0ñ=}Ù·LˆiŸÖ-? µ?Ú¦Î(zdà–xòf¯ŽÛÉÝòÉLm*¹Ì°X\ru$‘XQN\"£Àæ\rë^w+\0  ÚÍ”¨K=°X%¡mI¦ËrÉÙ. °®¾™&á„ZÛçJ‘=y¶øöoÕHo2·ðÌÖm½!;Œí¥á˜àEµ—ì”H²-¸ãwUêHr9:¶W3å´òé­\0Ršá°ÈÜDd\Z;>-¹ÁRr…ö<¸ƒ1B¦65;Ô$8ZEžQò²¢åŸe› öìFA\".€‰Izç2JÏXWýÊÉI<äûDõ·élË}æçEÀ[uÆO=ˆÅ7èlý—ˆ&›§Aë—.Æ˜BFQVpXè(c›\\øUòôºˆ h¨þ–ÌÐñ¹¶{uè;¶%(¥\Z¥=cë¢i\0‰CñAÿ™#—4å{sÏÂ˜©\rÁ¡Ï¥¡$\rO‡×vdÈ€àQª˜wBåç–‹ÃñTñ*ÊÓ¹ïE¬Bë“‡áÊÚÜW‚Ò7+6Öãõ¶A¼ÆŸù‘wã¦Z~Û53ÆÞl7zi+Ý[¯zug®®œ€\'K‰Š»Ó9)ãa6é~–e~Á÷0¬Ï¨~v½f’;võé-z-ëïÆh‹L68ß4Í+º,ZËyŸ]Í–äØõø¦”RyÁš®­^ñHâ\'iªrõ?PaÙJ|JµÇ\"éF::qCÕ)Æsµ?ð“÷MðAäÇNºÎŒLŒÚ J]:Õ]ì™À“¼yDÂÙ\"áÚ_ôiQ\rv3ÏŠbá­7ºx\"Xêö&h^d|…E™zy_j[™¥ÓŸ1“¯jºApâÈïfÔi¶“$Žƒ‡{rpò”Í˜æE&íÃIØœ¿ÅæÊöðòÀ¤¦#ÝdûMÌ\ZÓÌÚ´y<C€_ÈR‹s0þ—Û)u˜÷ÁŸa¡w|çº¡ žœê(—@Ò–[KŸ}/\rŽh<§ˆ¸ÄñþÔÿEÙÑÀ£Ì   {÷ŽKßÅÁ,õOêÕ‡×^\r\ZuÂ›/3Ñn•à&ØVH>Œð5{¨IƒÆÙ9ø”ÑI>| Ö/!„Ûy @uý:Ø›ì@ ƒízñNX¹ÅÙz~ƒi@Â1›÷’}×OD©îgEµXž>ftær1¿ùµÑïÖ+ýGý@˜šf—Æè¼¸ùi¿ESëÕÙRÀS£ƒŸ„(Ë¥LêÕ“+2ùÑ«ƒ#žÕýaÔ8å‘™ÑiçŸFÅÅÉÞDø§]BþùËÝ/}\0Îô©™D~d‚ÑÁ?^™:Rµì5dF§Nãçÿ°ßšŠc+!eÿƒÓ#Z,Í7sž_oúK?€þ™Ëò¸&æº%\0\0\0\0IEND®B`‚','5','5.png',NULL,'image/png',NULL,NULL,1,NULL),(19,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0É\0\0\0x\0\0\0oŽ&ç\0\0\0íPLTEÿÿÿ8{,ÂÍ\"4y\'&sÂÖ¿2x%)t.v ·Í´;~/šº•°É¬H†<¦Ä¡5y)Ž´‡ÜçÚäìân\0[Rñöð×åÔûüòÀËÓÛeÛá’1x,õøôÈÑ!íòì¨Â£Ç×Åt¢l—³&·Ç#R‰I+u-c–[úûêC8RŽG{£uåê¨tŸnf”_•²‘†¬ÇÑ8Œ¬&¥»%Î×[òôÒL†+k—)ja›¶—ˆ¯Œ­‡QˆHÕÝvìïº?+ÉÓBYŽ*­Á#vž(óõÙÝäqš)åé°ÒÚ_ìðÄÎØPw Lˆƒ¨d±ÇyÝãŽÍBÔÜ\0\0\nNIDATxœíš\r{š:ÇÁ@ˆR¬NäE«Õvmm]çÚ­ÛiŸ—óý?Î“ðnWl=“sÿ×µk  ¹Iî;wB9î ƒ:è ƒþt²ov¦ÎÓ¾-Ø‘NÛömÂnô´hßíÛ†è©W©|ú\'x\n©|½Ü·ï×ÏE…èË¾íx¯¬Ç€£Òþ¹oKÞ\'ë²×f$Çû6æ².&éü]þén`—ÿ¾o{Þ¨ãÓN’«ü$ÇX\'XÇ¡NN.¿¶ÛiŽJ»äaøäéçc§óuõG‡êE/K”:?ýÙ©´£Þo3å)‚§§û¶öe`OxÁìM$û¶÷%Øƒtömñ:¾+ÊÑ;/5IqÊÃy/øÿyß6oÔ •ôÿ…µo«7é´8HÿºRb’ËEaÁ}¿Ì$ÅçVïÇý€]~Ý·ÕtR¤ß=g—¥Œ]Å‡¤ß\r½¤œ$…½¤¿æ\"’®ñßrôúël-©”3ïúRä‚ÿxÿ,cVÿ¡É·n7Š[D%Üi=pøÞÃn÷ê¢ßy.á>¾ÉÅU·»¾HÜ(åÙÊé«2ø¶îvù$H)þUô×]>=µJzšzü\nÇýGžïÞ§F¤RÒ³úç_Ì«ó{¹K@2OÊù%èËf—ïõ¾]¼Ž2ÏÊ¹Íâ¸Ne0\\üX$ØEú½Ìã2.‹¾?·{XØþ‡‡‹‹~ÿüÛõO1ø®|ý)§—]~êŸcó¯ïï¯®Ö˜¡K)È}?;³*í’~Ðrë\r¿–ßM\00Œë<G¥½(åÜrAjNMŽÁEW¾ºî÷²‹€”0ãâ8[Øj©†‘P¢Ë_];ÏG0µJ9\"\\= `è\\Ã×ØŒ’ïœ÷/•üp`ŽÊŸåô®FITÓ\r Bÿþ×Å`Pi·7b´ÛRÎ,\"% xLZH6þóß»ÇÓÇ»»»Î§ç¯‹E%>¯ÇÎâ¹sZÒñ 2‡Ø=4äàÑ™W“vžœ\\>}9=ýêôçS‰1ˆZ#¡¹®™œ-–ñ n+™¶mÿí!:è+»Uó|ß÷nEÝŒïŠKÿ¶E/-]ñüõÚ_Öô´\'»^XÆt|ÿ¶”®.ÕšÐY+îÑÒ÷—GÕ\rÑÀjÔFj³)øG.³ 1ñ\rgË°¡×ü&‚\0àåX@#§Åª;$‹9s A i¤ÄR±ãª\nÄe .c‰†€\0@ˆ Ô$#€ršøRu‰e5U ­àWÈµVÚSô  Ì Á¨ZC \0aµˆbH NWq»+Ò0gËä.T±•ŽŒ´¨\0DS1êƒqPfÈésDÓ^äa››ÐÔúL\n œãV¢w\0ä+IZSHš!ZáAœHäºénR™Ô[Cã:GRóàWS·VPK@ãÐZFã[^XDSÃ¼KÃyW•Y2YM·€[àŽQª\rŽtÎzWªo1\"Ñ[â·\rw…HIq.ð¡Æ*Kô†\'EV|NfŒDÝÊéÎà5¹\ZZ BÀg„TfÑ[è3ÚW@B²$E=ëD$pB÷\0ÂxhB;B’Øi¾„gAð{g,¸j4Z\ZÎ›i#h9Ü–¤J_GŠëºÎ²É\\Hø \0’|ÏóT!4ŒI’È<Á×7‘°‡86ÅÎig˜£p7¦  ê´V[ÊA@+\'±æˆv<\r}8Øª„ÒØŠIn¦e™¦¨\nÌâÙ(5i\\ÛH¯jÛ\rG\rYà2ˆ‘5ö\nMREÜgêUï4‹“ØéeMN¬\"Š7›“Ÿ1 Ùi„rÂy\"‰i\raØD‚f\rö´>f+j»ÉªóµØ„9G®8‰l¹µñ†G  ‰¡±ª¬Ãà$E¢Á›¨ÔèÇk\\™)¸ä{JÄ2Î:z+  Ï·òB`4R÷ÙtÐ†­$‰°$O¢ÉnüØ4@d¥Å®éd‹LáÖ$4ØiF%\Z\'[…6NÂWD\"ÍyEžN“it„×Ä1í}AO7Òbó«8‰é± ,,ÝLŽÃH€‘­Ãæ:‹Ià(‘Ál ‘ªÉ´„ˆÄÑ¢Ë´˜][Da%ŒP9n²gDá…F\Z4Ô“x­\'©ä#¿2&\'V3zóë•ôs.Ê0¶ iÑº$yt¥Tñ\ZŸ­bÓþ\")#FjräIÔôäIè\"\0Ô´+bYÒ¶$œˆâ\Z¯±ãQØ½Œ¤™O¬W´ù˜$ˆc¿ Éˆ„y6yU–DÝv\'ù[2AÔ äà1I¾ÆYŽ¤–z¾cë;àDFÉÊÎ–$ åÐû#Á»½9ÎQã\") 3W>7»´´\'±_&Ù:fõl¼i¢‘ <ðe›§$\ZŸ6¤8  ë-ïñÜÖ±+!qnÈldÐêQ¸E»‹ì C’LPœ„Eá qIIÙ>v%e+S:,pjG+ã0;½Ø„n¸÷“(tåDéàÇEßÞJ‚Yæ l:ÊV”ts˜ÍVÞAf+(3½Ü0_~3 ^)A0­8ƒnÌ ƒÛï&áØÂ—©ölëÒõT/Õ\n}0b¦üQa\n4çvA¢°VP2Ç´\'QfZ”DÇñ\nD;ôX‡l²;-?<ãl\'<¸@­X2{&*ÓšE›…Â$GÄy5dÜ„‚N]žtxr÷«®D’ì6pD¦ÃûI¢Aá‘áãGÝ=Sß°ûõhÕÙ\\[ÕÛÏÔPPI‚ó86f³Ù×O é;\"1½Ðn\0UÜÈ&Oá»(IÔ!\Z@’ Hìì’= #Ñ¨Oj©S\"ÀÒô$³qÒˆF·Æ¶;­iþÔŒd+bL\"‰Ê\0c–hí‚„k¹Qe+cf  xY–â£ì¡š†’¤ÐÒ§™–à:ÌÙiª–6´ž?MMÈd\r#sl&Í\Zu‰µ^”G£#A`CJXbç‹ g5ã¡Ãi¿½^_‘NN¿R:y&9`N¸gvªÀ2èšøôZŸã\Zš\0 0±9vR±!ÿ•”éP&ç˜øë,âÆ$xx*/´ñ,™RVÇ¡±›yá-@H\Z¼5AÉÏ°\rÒ\\ò£1ÊÔùó—YäÉ\"¼¦FÕ¹™O&“3GŒz/I‚Y”3ü|²r2F¹«ÉY~TWÓ0°ãË|ýf2QX>g6‚©§WoV“ÉüL!…õ0ír²5‹È2ÍÔF7MBšÄÚPoÓ½ÔÝ¬°-wbg°zWg\'+šœÏöß É_#A\0?Ï“­(Ã0ëšïä£þï!©Óè‡aY¯Ú¶ÝPnåððwÓöï!‰Ïc!’šä³DâËTõõúEô{Hô&ÿ‚4¡özõBúM~â4%¸‰  oŠ[›¤3’Í±iw2k†Œ2ßd’§; [,òT#ß\rÿj™Êj$ˆdÁ\'  \Z«Ü‰Î{¤Ï¥¦¼²_/¸5\\¼‚.U,Ã›;îîÆƒÊú­¥eYä¯ÂlÓ:üaØAtÐAtÐAô·Ñÿ\0¹ê\nHà³p\0\0\0\0IEND®B`‚','description','4.png',NULL,'image/png',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `FILE` ENABLE KEYS */;
UNLOCK TABLES;
CREATE TABLE `FACTURA` (
  `FACTURA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMBER` varchar(45) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `ITEM_PRICE` varchar(45) DEFAULT NULL,
  `TOTAL_PRICE` varchar(45) DEFAULT NULL,
  `CAMISETA_ID` int(11) DEFAULT NULL,
  `TEMA_ID` int(11) DEFAULT NULL,
  `ESTAMPA_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FACTURA_ID`),
  KEY `FACTURA_CAMISETA_ID_FK_IDX` (`CAMISETA_ID`),
  KEY `FACTURA_TEMA_ID_FK_IDX` (`TEMA_ID`),
  KEY `FACTURA_ESTAMPA_ID_FK_IDX` (`ESTAMPA_ID`),
  CONSTRAINT `FACTURA_CAMISETA_ID_FK` FOREIGN KEY (`CAMISETA_ID`) REFERENCES `camiseta` (`CAMISETA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FACTURA_ESTAMPA_ID_FK` FOREIGN KEY (`ESTAMPA_ID`) REFERENCES `estampa` (`ESTAMPA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FACTURA_TEMA_ID_FK` FOREIGN KEY (`TEMA_ID`) REFERENCES `tema` (`TEMA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURA`
--

LOCK TABLES `FACTURA` WRITE;
/*!40000 ALTER TABLE `FACTURA` DISABLE KEYS */;
INSERT INTO `FACTURA` VALUES (3,'00001','2017-03-03','5000','14000',1,NULL,NULL),(4,'00001','2017-03-03','5000','14000',1,NULL,NULL),(5,'00001','2017-03-03','2000','14000',NULL,NULL,1),(6,'00001','2017-03-03','2000','14000',NULL,NULL,1);
/*!40000 ALTER TABLE `FACTURA` ENABLE KEYS */;
UNLOCK TABLES;
