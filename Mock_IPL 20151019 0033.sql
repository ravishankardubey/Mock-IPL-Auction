-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.77-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema test
--

CREATE DATABASE IF NOT EXISTS test;
USE test;

--
-- Definition of table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `batsman` int(10) unsigned NOT NULL auto_increment,
  `bowler` int(10) unsigned NOT NULL,
  `all_rounder` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`batsman`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`batsman`,`bowler`,`all_rounder`) VALUES 
 (0,0,0);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;


--
-- Definition of table `teams_info`
--

DROP TABLE IF EXISTS `teams_info`;
CREATE TABLE `teams_info` (
  `Team_Name` varchar(100) NOT NULL,
  `Points` decimal(15,0) NOT NULL,
  `Bowler` decimal(15,0) NOT NULL,
  `Batsman` decimal(15,0) NOT NULL,
  `All_Rounder` decimal(15,0) NOT NULL,
  `balance` decimal(15,0) NOT NULL,
  PRIMARY KEY  (`Team_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams_info`
--

/*!40000 ALTER TABLE `teams_info` DISABLE KEYS */;
INSERT INTO `teams_info` (`Team_Name`,`Points`,`Bowler`,`Batsman`,`All_Rounder`,`balance`) VALUES 
 ('csk','865','2','5','4','598000000'),
 ('dd','753','3','5','1','503000000'),
 ('kkr','894','4','5','2','577500000'),
 ('ktk','880','4','6','1','587500000'),
 ('mi','732','4','4','1','474000000'),
 ('rcb','922','3','5','3','585000000'),
 ('rr','745','4','5','0','525000000'),
 ('srh','754','4','5','1','545000000');
/*!40000 ALTER TABLE `teams_info` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
