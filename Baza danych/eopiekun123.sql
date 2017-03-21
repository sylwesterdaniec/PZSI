CREATE DATABASE  IF NOT EXISTS `eopiekun` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;
USE `eopiekun`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: eopiekun
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `choroby`
--

DROP TABLE IF EXISTS `choroby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choroby` (
  `idchoroby` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idchoroby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choroby`
--

LOCK TABLES `choroby` WRITE;
/*!40000 ALTER TABLE `choroby` DISABLE KEYS */;
/*!40000 ALTER TABLE `choroby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `idpacjenci` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpacjenci`),
  CONSTRAINT `fk_log_pacjenci1` FOREIGN KEY (`idpacjenci`) REFERENCES `pacjenci` (`idpacjenci`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokalizacja`
--

DROP TABLE IF EXISTS `lokalizacja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lokalizacja` (
  `idlokalizacja` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lokalizacja_x` double DEFAULT NULL,
  `lokalizacja_y` double DEFAULT NULL,
  `idpacjenci` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idlokalizacja`,`idpacjenci`),
  KEY `fk_lokalizacja_pacjenci1_idx` (`idpacjenci`),
  CONSTRAINT `fk_lokalizacja_pacjenci1` FOREIGN KEY (`idpacjenci`) REFERENCES `pacjenci` (`idpacjenci`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokalizacja`
--

LOCK TABLES `lokalizacja` WRITE;
/*!40000 ALTER TABLE `lokalizacja` DISABLE KEYS */;
/*!40000 ALTER TABLE `lokalizacja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opiekun`
--

DROP TABLE IF EXISTS `opiekun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opiekun` (
  `idopiekun` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imie` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(120) COLLATE utf8_polish_ci NOT NULL,
  `telefon` double NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `idosrodek` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idopiekun`,`idosrodek`),
  KEY `fk_opiekun_osrodek1_idx` (`idosrodek`),
  CONSTRAINT `fk_opiekun_osrodek1` FOREIGN KEY (`idosrodek`) REFERENCES `osrodek` (`idosrodek`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opiekun`
--

LOCK TABLES `opiekun` WRITE;
/*!40000 ALTER TABLE `opiekun` DISABLE KEYS */;
/*!40000 ALTER TABLE `opiekun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osrodek`
--

DROP TABLE IF EXISTS `osrodek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osrodek` (
  `idosrodek` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adres` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`idosrodek`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osrodek`
--

LOCK TABLES `osrodek` WRITE;
/*!40000 ALTER TABLE `osrodek` DISABLE KEYS */;
/*!40000 ALTER TABLE `osrodek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacjenci`
--

DROP TABLE IF EXISTS `pacjenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacjenci` (
  `idpacjenci` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imie` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(120) COLLATE utf8_polish_ci NOT NULL,
  `lokalizacja_dlugosc` double NOT NULL,
  `lokalizacja_szerokosc` double NOT NULL,
  `telefon` double NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `adres` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `iduzytkownik` int(10) unsigned NOT NULL,
  `idrola` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpacjenci`,`iduzytkownik`,`idrola`),
  KEY `fk_pacjenci_uzytkownik1_idx` (`iduzytkownik`,`idrola`),
  CONSTRAINT `fk_pacjenci_uzytkownik1` FOREIGN KEY (`iduzytkownik`, `idrola`) REFERENCES `uzytkownik` (`iduzytkownik`, `idrola`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacjenci`
--

LOCK TABLES `pacjenci` WRITE;
/*!40000 ALTER TABLE `pacjenci` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacjenci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacjenci_choroby`
--

DROP TABLE IF EXISTS `pacjenci_choroby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacjenci_choroby` (
  `idpacjenci` int(10) unsigned NOT NULL,
  `idchoroby` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpacjenci`,`idchoroby`),
  KEY `fk_pacjenci_choroby_choroby1_idx` (`idchoroby`),
  CONSTRAINT `fk_pacjenci_choroby_pacjenci` FOREIGN KEY (`idpacjenci`) REFERENCES `pacjenci` (`idpacjenci`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacjenci_choroby_choroby1` FOREIGN KEY (`idchoroby`) REFERENCES `choroby` (`idchoroby`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacjenci_choroby`
--

LOCK TABLES `pacjenci_choroby` WRITE;
/*!40000 ALTER TABLE `pacjenci_choroby` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacjenci_choroby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacjent_opiekun`
--

DROP TABLE IF EXISTS `pacjent_opiekun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacjent_opiekun` (
  `idpacjenci` int(10) unsigned NOT NULL,
  `dopiekun` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpacjenci`,`dopiekun`),
  KEY `fk_pacjent_opiekun_opiekun1_idx` (`dopiekun`),
  CONSTRAINT `fk_pacjent_opiekun_pacjenci1` FOREIGN KEY (`idpacjenci`) REFERENCES `pacjenci` (`idpacjenci`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacjent_opiekun_opiekun1` FOREIGN KEY (`dopiekun`) REFERENCES `opiekun` (`idopiekun`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacjent_opiekun`
--

LOCK TABLES `pacjent_opiekun` WRITE;
/*!40000 ALTER TABLE `pacjent_opiekun` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacjent_opiekun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rola`
--

DROP TABLE IF EXISTS `rola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rola` (
  `idrola` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opisroli` varchar(120) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idrola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rola`
--

LOCK TABLES `rola` WRITE;
/*!40000 ALTER TABLE `rola` DISABLE KEYS */;
/*!40000 ALTER TABLE `rola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownik`
--

DROP TABLE IF EXISTS `uzytkownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzytkownik` (
  `iduzytkownik` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idrola` int(10) unsigned NOT NULL,
  `idopiekun` int(10) unsigned NOT NULL,
  `idosrodek` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iduzytkownik`,`idrola`,`idopiekun`,`idosrodek`),
  KEY `fk_uzytkownik_rola1_idx` (`idrola`),
  KEY `fk_uzytkownik_opiekun1_idx` (`idopiekun`),
  KEY `fk_uzytkownik_osrodek1_idx` (`idosrodek`),
  CONSTRAINT `fk_uzytkownik_rola1` FOREIGN KEY (`idrola`) REFERENCES `rola` (`idrola`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_uzytkownik_opiekun1` FOREIGN KEY (`idopiekun`) REFERENCES `opiekun` (`idopiekun`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_uzytkownik_osrodek1` FOREIGN KEY (`idosrodek`) REFERENCES `osrodek` (`idosrodek`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownik`
--

LOCK TABLES `uzytkownik` WRITE;
/*!40000 ALTER TABLE `uzytkownik` DISABLE KEYS */;
/*!40000 ALTER TABLE `uzytkownik` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-21 13:21:43
