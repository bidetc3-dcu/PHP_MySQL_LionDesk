-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: liondesk1
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `employee` int(6) NOT NULL,
  `hotdesk` varchar(3) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`employee`,`hotdesk`,`date`),
  KEY `hotdesk` (`hotdesk`),
  KEY `employee_index` (`employee`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `employees` (`employee_ID`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`hotdesk`) REFERENCES `hotdesks` (`hotdesk_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (126603,'GA1','2018-05-11'),(126603,'GB1','2018-05-01'),(150936,'4A1','2018-06-04'),(150936,'GA1','2018-04-06'),(202895,'GA1','2018-04-16'),(202895,'GC1','2018-04-17'),(202895,'GC1','2018-04-18'),(209923,'4A2','2018-04-16'),(209923,'GA2','2018-05-09'),(209923,'GB2','2018-04-17'),(230245,'4A2','2018-05-24'),(230245,'GA2','2018-04-11'),(288638,'GA2','2018-04-11'),(288638,'GB2','2018-05-29'),(331915,'4A1','2018-04-03'),(331915,'4A1','2018-04-04'),(331915,'GB3','2018-04-12'),(331915,'GB3','2018-04-25'),(331915,'GB3','2018-04-27'),(342761,'3A1','2018-04-09'),(342761,'3A1','2018-04-16'),(342761,'3A1','2018-04-23'),(342761,'3A1','2018-04-30'),(346020,'GB1','2018-05-12'),(346020,'GB3','2018-06-03'),(397297,'GB2','2018-05-17'),(397297,'GC1','2018-05-14'),(404035,'3A1','2018-04-19'),(404035,'3B2','2018-05-30'),(404035,'4A2','2018-04-22'),(438551,'3B1','2018-06-15'),(438551,'4A1','2018-06-09'),(438551,'GA1','2018-04-24'),(442875,'GB3','2018-04-04'),(442875,'GB3','2018-04-05'),(453668,'GA1','2018-05-01'),(453668,'GB1','2018-06-24'),(453668,'GB3','2018-05-30'),(464234,'3B2','2018-04-20'),(464234,'GA1','2018-04-11'),(472956,'3A1','2018-05-09'),(472956,'GB1','2018-06-29'),(472956,'GB3','2018-05-07'),(488352,'3B1','2018-05-16'),(488352,'GC1','2018-06-06'),(490018,'3B1','2018-06-11'),(490018,'4A1','2018-04-05'),(490018,'GC1','2018-05-06'),(588470,'3B1','2018-06-27'),(588470,'GB2','2018-04-23'),(588470,'GC1','2018-05-04'),(612583,'GA1','2018-04-05'),(612583,'GB1','2018-04-19'),(612583,'GB3','2018-06-20'),(645032,'3A1','2018-05-28'),(645032,'GB3','2018-04-13'),(649548,'3B2','2018-04-26'),(649548,'4A2','2018-06-20'),(809484,'3B1','2018-06-18'),(809484,'4A1','2018-04-27'),(822405,'4A1','2018-04-28'),(822405,'GA1','2018-06-28'),(822405,'GB1','2018-05-03'),(831114,'3A1','2018-04-15'),(831114,'3B2','2018-05-08'),(831114,'GB3','2018-06-10'),(846666,'3A1','2018-06-11'),(846666,'3B2','2018-05-15'),(946730,'GA2','2018-06-16'),(946730,'GB2','2018-04-04'),(946730,'GC1','2018-05-02'),(964583,'GA2','2018-06-26'),(964583,'GB2','2018-04-09'),(973776,'GB2','2018-04-04'),(973776,'GB2','2018-04-05');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chairs`
--

DROP TABLE IF EXISTS `chairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chairs` (
  `chair_ID` varchar(4) NOT NULL,
  `chair_type` char(20) NOT NULL DEFAULT 'Standard',
  PRIMARY KEY (`chair_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chairs`
--

LOCK TABLES `chairs` WRITE;
/*!40000 ALTER TABLE `chairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `chairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_roles`
--

DROP TABLE IF EXISTS `employee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_roles` (
  `employee_role` char(15) NOT NULL DEFAULT 'user',
  `employee` int(6) NOT NULL,
  PRIMARY KEY (`employee_role`,`employee`),
  KEY `employee_index` (`employee`),
  CONSTRAINT `employee_roles_ibfk_1` FOREIGN KEY (`employee_role`) REFERENCES `roles` (`role_name`),
  CONSTRAINT `employee_roles_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `employees` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_roles`
--

LOCK TABLES `employee_roles` WRITE;
/*!40000 ALTER TABLE `employee_roles` DISABLE KEYS */;
INSERT INTO `employee_roles` VALUES ('user',126603),('user',133378),('user',142119),('user',150936),('user',153445),('user',158093),('user',160537),('user',164787),('user',169833),('user',187926),('user',198279),('user',198685),('user',202895),('user',209923),('user',210955),('user',217087),('user',219267),('user',230245),('user',233934),('user',244719),('user',248344),('user',249396),('user',250551),('user',261460),('user',262919),('user',270978),('user',273811),('user',276282),('user',288638),('user',288990),('user',300689),('user',303304),('user',310114),('user',311686),('user',314529),('user',315276),('user',323396),('user',323910),('user',325083),('superuser',331915),('user',334797),('user',336528),('user',342761),('user',344893),('user',346020),('user',346470),('user',349435),('user',349758),('user',351873),('user',356602),('user',365373),('user',370953),('user',373723),('user',380947),('user',387099),('user',397297),('superuser',404035),('user',404931),('user',408663),('user',422410),('user',423169),('user',426564),('user',432180),('user',434021),('superuser',438551),('user',442875),('user',452446),('user',453668),('user',455217),('user',464234),('user',472956),('user',488352),('user',490018),('user',492115),('user',497311),('user',498788),('user',500134),('user',506613),('user',508426),('user',510914),('user',513940),('user',529862),('user',535273),('user',548202),('user',553764),('user',557771),('user',588470),('user',602745),('user',603607),('user',604067),('user',612583),('user',615635),('user',617521),('user',619250),('user',624806),('user',628756),('user',637249),('user',645032),('user',648649),('user',649548),('user',653878),('user',661242),('user',672700),('user',674687),('user',681766),('user',684210),('user',684544),('user',692202),('user',698585),('user',702202),('user',703008),('user',706422),('user',710380),('user',716583),('user',731790),('user',741829),('user',745542),('user',761444),('user',771902),('user',783732),('user',789629),('user',793850),('user',804086),('user',806052),('user',809484),('user',813718),('user',821302),('user',821873),('user',822405),('user',824482),('user',831114),('user',833375),('user',840041),('user',846666),('user',858629),('user',858876),('user',864647),('user',868934),('user',875583),('user',889965),('user',889972),('user',890028),('user',899265),('user',905861),('user',919027),('user',923872),('user',929399),('user',930068),('user',932260),('user',938094),('user',942905),('superuser',946730),('user',954418),('user',957765),('user',961438),('user',964583),('user',965055),('user',967059),('user',971292),('user',973776),('user',988373),('user',992296),('user',995433);
/*!40000 ALTER TABLE `employee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `employee_ID` int(6) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `favourite_desk` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`employee_ID`),
  UNIQUE KEY `email_index` (`email`),
  KEY `fk_favourite_desk` (`favourite_desk`),
  CONSTRAINT `fk_favourite_desk` FOREIGN KEY (`favourite_desk`) REFERENCES `hotdesks` (`hotdesk_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=995434 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (126603,'Georg.Frodsam@lionbridge.com','7Nz8gHe7y3',NULL),(133378,'Melantha.Keyden@lionbridge.com','CabIwZf4cu',NULL),(142119,'Bennie.Dow@lionbridge.com','SKPMkK9GyE',NULL),(150936,'Terrance.Zaniolo@lionbridge.com','FYWUblN0CM',NULL),(153445,'Lotta.McCarrell@lionbridge.com','sONLhFUCNF',NULL),(158093,'Helge.Mixter@lionbridge.com','0C7Ts1roQs',NULL),(160537,'Agnes.McKearnen@lionbridge.com','xjDDl9pnnv',NULL),(164787,'Phaedra.Sennett@lionbridge.com','DaE9F1yCkt',NULL),(169833,'Bronnie.Hayesman@lionbridge.com','DGw0u09Fmd',NULL),(187926,'Agatha.Shelford@lionbridge.com','pzVCUhhD8r',NULL),(198279,'Bartholomeo.Knevett@lionbridge.com','vhoCkGlfBV',NULL),(198685,'Eddi.Dahlen@lionbridge.com','qRhpHWgUbu',NULL),(202895,'Gideon.Pirrey@lionbridge.com','IfAu66yDtA',NULL),(209923,'Prudence.Courtin@lionbridge.com','KljVfBLrwd',NULL),(210955,'Valenka.Kendle@lionbridge.com','jGS5Q1VYOa',NULL),(217087,'Nealson.Andrzejczak@lionbridge.com','3naaLfdDSU',NULL),(219267,'Dave.Riseam@lionbridge.com','8yyRGIYZai',NULL),(230245,'Farlie.Poller@lionbridge.com','txPSX9OAQF',NULL),(233934,'Cissiee.Stearne@lionbridge.com','DsFT7B7A0d',NULL),(244719,'Hadlee.Dauncey@lionbridge.com','LuOwvGHSUA',NULL),(248344,'Therine.Geleman@lionbridge.com','PAxtDWcTXu',NULL),(249396,'Christin.Willowby@lionbridge.com','58YOL3kDm5',NULL),(250551,'Eada.Noye@lionbridge.com','bzJbsHYkGw',NULL),(261460,'Carmelina.McPike@lionbridge.com','GdswnJVNbp',NULL),(262919,'Tabitha.Goldney@lionbridge.com','DS6yz7gtmw',NULL),(270978,'Linnet.Stamper@lionbridge.com','7X7SZpGsuu',NULL),(273811,'Car.Raisher@lionbridge.com','WEZeOGJZyS',NULL),(276282,'Jolie.Wimbush@lionbridge.com','HxMi9RcHy1',NULL),(288638,'Stu.Guiot@lionbridge.com','aaEw3xhscQ',NULL),(288990,'Sheffie.Wimms@lionbridge.com','Lj4BFg0OaQ',NULL),(300689,'Carissa.Lantaph@lionbridge.com','yemTuolHn8',NULL),(303304,'Chaunce.Lockitt@lionbridge.com','G0W6U4zgmk',NULL),(310114,'Garvin.Eicke@lionbridge.com','ArhysvOwv1',NULL),(311686,'Tommy.Werrett@lionbridge.com','shPzi2hAaE',NULL),(314529,'Reynolds.Featherby@lionbridge.com','08tSEo0MPD',NULL),(315276,'Jerome.Vearncombe@lionbridge.com','EAhq5xtdD6',NULL),(323396,'Erin.Sinkins@lionbridge.com','w12m42NQhP',NULL),(323910,'Sinclare.Neeves@lionbridge.com','vYFd05CTv6',NULL),(325083,'Oralle.Veldman@lionbridge.com','FMxC9p937o',NULL),(331915,'Leela.Emmatt@lionbridge.com','tBc5gREPY5',NULL),(334797,'Vere.Trowsdall@lionbridge.com','K44LWCvF4I',NULL),(336528,'Emlynn.Gratrix@lionbridge.com','DIKF0PrDLO',NULL),(342761,'Sib.Gliddon@lionbridge.com','hixh0TWwWQ',NULL),(344893,'Ferne.Jarville@lionbridge.com','STK7FpsmjI',NULL),(346020,'Chen.Drewett@lionbridge.com','Z0xZSSW9qh',NULL),(346470,'Ernie.Rosedale@lionbridge.com','71zkyDqqvT',NULL),(349435,'Jaymee.OShevlan@lionbridge.com','dew36wG5K9',NULL),(349758,'Lesli.Varsey@lionbridge.com','bRiA3Drirv',NULL),(351873,'Kylie.Airton@lionbridge.com','avHUZKWP2C',NULL),(356602,'Thia.Alberti@lionbridge.com','zfsdYv63c2',NULL),(365373,'Evvy.Leet@lionbridge.com','dPC6Mx17B0',NULL),(370953,'Lilia.Capaldi@lionbridge.com','pvrpjwxVcC',NULL),(373723,'Philly.Lodford@lionbridge.com','CL0hasZGsS',NULL),(380947,'Modesty.Soden@lionbridge.com','6piZqzdxXi',NULL),(387099,'Duky.Stairmond@lionbridge.com','ckdqZIlxET',NULL),(397297,'Nefen.Poile@lionbridge.com','pUfJGyw6SB',NULL),(404035,'Alisa.Scamwell@lionbridge.com','1ayqZPQsDV',NULL),(404931,'Berri.McReynolds@lionbridge.com','oqFzVvVPyQ',NULL),(408663,'Gabbie.Malley@lionbridge.com','AwxDV5w4kV',NULL),(422410,'Leeland.Worling@lionbridge.com','yzl5yM7wDI',NULL),(423169,'Carroll.Brooke@lionbridge.com','ZbNC3mS4a0',NULL),(426564,'Cal.Puckinghorne@lionbridge.com','JHeuEI4nBv',NULL),(432180,'Lanni.Collishaw@lionbridge.com','qOjJXgTSr5',NULL),(434021,'Rozamond.Vermer@lionbridge.com','cJqokvQSNz',NULL),(438551,'Filip.Figin@lionbridge.com','ZPWXlpluIY',NULL),(442875,'Vic.Lobe@lionbridge.com','mAXYmlZOoL',NULL),(452446,'Lorraine.Rogans@lionbridge.com','wxMUlw7WZB',NULL),(453668,'Susannah.Mullally@lionbridge.com','fxGOPEV7yz',NULL),(455217,'Hunt.Saye@lionbridge.com','b3PLF9hVhY',NULL),(464234,'Donnamarie.Snepp@lionbridge.com','ZOsPql77Cv',NULL),(472956,'Tobias.Kluss@lionbridge.com','8ZkLv9RFm5',NULL),(488352,'Lynnet.Brauninger@lionbridge.com','tQX7o9Ih75',NULL),(490018,'Candie.Rayment@lionbridge.com','ySwLxJcO7D',NULL),(492115,'Garrott.Brosel@lionbridge.com','59uLvqqbxh',NULL),(497311,'Celestyna.Etchells@lionbridge.com','1IeLNNNZo2',NULL),(498788,'Shari.Kupka@lionbridge.com','CaRcCBCUVo',NULL),(500134,'Thaxter.Flatt@lionbridge.com','eW7gmKilmG',NULL),(506613,'Gunther.Temporal@lionbridge.com','okEO5v0Lfy',NULL),(508426,'Fernandina.Stellin@lionbridge.com','lqNzBxDYXw',NULL),(510914,'Lothario.Haddrill@lionbridge.com','BDkyCLPkTH',NULL),(513940,'Lindsey.Eyeington@lionbridge.com','mwRCjrN5BY',NULL),(529862,'Guinna.Hansard@lionbridge.com','4fA9lhKXHp',NULL),(535273,'Mendy.Osman@lionbridge.com','cKm4WuVIYH',NULL),(548202,'Phylys.Tchaikovsky@lionbridge.com','9sZMErN4th',NULL),(553764,'Inglebert.Ioselev@lionbridge.com','HuR92Jkm5e',NULL),(557771,'Magdalen.Kloisner@lionbridge.com','WhenYMsBxp',NULL),(588470,'Vasilis.Simson@lionbridge.com','LsSV9BCW2h',NULL),(602745,'Faber.Surmeyer@lionbridge.com','KGQHCUY24r',NULL),(603607,'Zorah.Ledson@lionbridge.com','DfHxEDfiYQ',NULL),(604067,'Yvonne.Everson@lionbridge.com','ckUyhlKtDR',NULL),(612583,'Harri.Shardlow@lionbridge.com','gXF2H9XjO5',NULL),(615635,'Cos.Rosborough@lionbridge.com','nRFa1WsgO2',NULL),(617521,'Jameson.Braunfeld@lionbridge.com','MRlTkRxrxl',NULL),(619250,'Cathy.Posner@lionbridge.com','YnJ0wx1T8k',NULL),(624806,'Lezlie.Tales@lionbridge.com','zRtJBkaweL',NULL),(628756,'Loralee.Dargavel@lionbridge.com','j0YzH1wudr',NULL),(637249,'Raye.Northen@lionbridge.com','0cfle4WE2X',NULL),(645032,'Ernaline.Lamblot@lionbridge.com','d9Au29jKAd',NULL),(648649,'Haskell.Durrand@lionbridge.com','RCCt6UJZVN',NULL),(649548,'Vin.Chisman@lionbridge.com','fdFnYgTRDQ',NULL),(653878,'Gertrud.Flobert@lionbridge.com','Uhz3oOqPdG',NULL),(661242,'Reade.Francecione@lionbridge.com','kR53J78mB0',NULL),(672700,'Martynne.Lahiff@lionbridge.com','xwitndcUsj',NULL),(674687,'Beryl.Spurge@lionbridge.com','2LmQXog8yu',NULL),(681766,'Rhonda.MacKenny@lionbridge.com','FHYJf7zmP6',NULL),(684210,'Blayne.Syvret@lionbridge.com','ilTFTmC9Gb',NULL),(684544,'Betty.Klimkowski@lionbridge.com','zCKqPmpE03',NULL),(692202,'Eudora.Spandley@lionbridge.com','DIFwZfVKIJ',NULL),(698585,'Florence.Wolfendale@lionbridge.com','L1K2ABKG8j',NULL),(702202,'Sherri.Girardez@lionbridge.com','k0SkbwSh3u',NULL),(703008,'Ferdinande.Fourman@lionbridge.com','BnuoajDwVz',NULL),(706422,'Sisely.Trudgion@lionbridge.com','CGRRy4B44K',NULL),(710380,'Kevina.Vayne@lionbridge.com','naj3Xko5ge',NULL),(716583,'Blayne.Mantripp@lionbridge.com','WzwiUyr80N',NULL),(731790,'Hally.Braisby@lionbridge.com','Su2mFKYNr0',NULL),(741829,'Mitchell.Capps@lionbridge.com','OXDFT3kmDx',NULL),(745542,'Johnette.Leving@lionbridge.com','9hH0EAZJWi',NULL),(761444,'Ardella.Shirt@lionbridge.com','EOXxEtVwCh',NULL),(771902,'Gerri.Maddison@lionbridge.com','mgFLjkkuYv',NULL),(783732,'Abey.Romer@lionbridge.com','beKx1EXqSA',NULL),(789629,'Courtney.Joice@lionbridge.com','APhk0UdpuC',NULL),(793850,'Bridie.Truder@lionbridge.com','tNaA2V2gnG',NULL),(804086,'Monique.Parrett@lionbridge.com','twzxH2jAMb',NULL),(806052,'Millicent.Bodicam@lionbridge.com','4eSnKOhKhA',NULL),(809484,'Ruprecht.Ahlin@lionbridge.com','a77RReWoi3',NULL),(813718,'Tanny.Malatalant@lionbridge.com','ybjN4zMRpn',NULL),(821302,'Oren.Caplen@lionbridge.com','hYiW6m5Ljq',NULL),(821873,'Dina.McLaine@lionbridge.com','8xUfgHUvRI',NULL),(822405,'Kleon.Studde@lionbridge.com','jtPDBtEBwv',NULL),(824482,'Yolande.Strutley@lionbridge.com','CNM0BfWZup',NULL),(831114,'Franklyn.Bischop@lionbridge.com','SmXo0JgtqT',NULL),(833375,'Rudolph.Dutteridge@lionbridge.com','djznN1DQ0T',NULL),(840041,'Sile.Langstone@lionbridge.com','YyZeZyTwtv',NULL),(846666,'Evyn.Poynter@lionbridge.com','nIfIaL1lHl',NULL),(858629,'Caritta.Kilcullen@lionbridge.com','25y40HPtbF',NULL),(858876,'Allis.Gallear@lionbridge.com','NufKIucrCU',NULL),(864647,'Krissy.Bohin@lionbridge.com','IMsWv6Wz6p',NULL),(868934,'Galvan.Gorbell@lionbridge.com','gQG7uVwpnq',NULL),(875583,'Marga.Defont@lionbridge.com','z0hywqsPPm',NULL),(889965,'Nichole.Madigan@lionbridge.com','5G3ukLCIdm',NULL),(889972,'Thom.Gornal@lionbridge.com','tdpEUWfL12',NULL),(890028,'Ulrika.Plastow@lionbridge.com','BJLVUCXUvy',NULL),(899265,'Cinderella.Collar@lionbridge.com','QaBpGftioo',NULL),(905861,'Nap.Archdeckne@lionbridge.com','gBSOF46ICg',NULL),(919027,'Ynes.Mulleary@lionbridge.com','FLDoyqotJC',NULL),(923872,'Giorgi.Rumney@lionbridge.com','JdshJoVN0f',NULL),(929399,'Karlyn.Leffek@lionbridge.com','fuZQdFQLAo',NULL),(930068,'Nata.Order@lionbridge.com','h2srvDOCER',NULL),(932260,'Jillie.Cheal@lionbridge.com','wlLG85yx7a',NULL),(938094,'Cynde.Finnan@lionbridge.com','vNf7aOpNme',NULL),(942905,'Kelila.Leworthy@lionbridge.com','0pox6Fgx7Y',NULL),(946730,'Elizabet.Nutley@lionbridge.com','tCOezSQilv',NULL),(954418,'Paco.Kestle@lionbridge.com','BHHLE0x8dr',NULL),(957765,'Reamonn.Laise@lionbridge.com','2VKMgnrGJC',NULL),(961438,'Felita.Fergyson@lionbridge.com','cxZosDNuuK',NULL),(964583,'Arnoldo.Vicar@lionbridge.com','a6LYNpijlz',NULL),(965055,'Dennie.Gascoyen@lionbridge.com','waSD63jsD0',NULL),(967059,'Maximilianus.Hagard@lionbridge.com','AoV0vpOI2w',NULL),(971292,'Frederik.Blaik@lionbridge.com','VGxAx5CXbS',NULL),(973776,'Tulley.Jervois@lionbridge.com','G4JsnNG2Ls',NULL),(988373,'Laurette.Samsin@lionbridge.com','f6BH1E3zbk',NULL),(992296,'Reina.Mathelon@lionbridge.com','NjIN9tYKo6',NULL),(995433,'Rustin.Grabb@lionbridge.com','wR0nFhV9FS',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotdesks`
--

DROP TABLE IF EXISTS `hotdesks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotdesks` (
  `hotdesk_ID` varchar(3) NOT NULL,
  `floor_location` int(1) NOT NULL,
  `picture` varchar(15) NOT NULL,
  PRIMARY KEY (`hotdesk_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotdesks`
--

LOCK TABLES `hotdesks` WRITE;
/*!40000 ALTER TABLE `hotdesks` DISABLE KEYS */;
INSERT INTO `hotdesks` VALUES ('3A1',3,'3A1.png'),('3B1',3,'3B1.png'),('3B2',3,'3B2.png'),('4A1',4,'4A1.png'),('4A2',4,'4A2.png'),('GA1',0,'GA1.png'),('GA2',0,'GA2.png'),('GB1',0,'GB1.png'),('GB2',0,'GB2.png'),('GB3',0,'GB3.png'),('GC1',0,'GC1.png');
/*!40000 ALTER TABLE `hotdesks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_name` char(15) NOT NULL DEFAULT 'user',
  `permission` char(30) NOT NULL DEFAULT 'bookings',
  PRIMARY KEY (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('superuser','bookings+dashboard'),('user','bookings');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-08 23:20:09
