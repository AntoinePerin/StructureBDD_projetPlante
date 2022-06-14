-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.3.34-MariaDB-0+deb10u1 - Debian 10
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour projetplante
DROP DATABASE IF EXISTS `projetplante`;
CREATE DATABASE IF NOT EXISTS `projetplante` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `projetplante`;

-- Listage de la structure de table projetplante. irrigation
DROP TABLE IF EXISTS `irrigation`;
CREATE TABLE IF NOT EXISTS `irrigation` (
  `Id_irrigation` int(11) NOT NULL AUTO_INCREMENT,
  `Date_irrigation` datetime NOT NULL,
  `Automatique_irrigation` tinyint(4) NOT NULL DEFAULT 0,
  `Adresse_Mac_plante` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_irrigation`),
  KEY `Adresse_Mac_plante` (`Adresse_Mac_plante`),
  CONSTRAINT `irrigation_ibfk_1` FOREIGN KEY (`Adresse_Mac_plante`) REFERENCES `plante` (`Adresse_Mac_plante`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table projetplante. mesures
DROP TABLE IF EXISTS `mesures`;
CREATE TABLE IF NOT EXISTS `mesures` (
  `Id_mesure` int(11) NOT NULL AUTO_INCREMENT,
  `Date_mesure` datetime NOT NULL,
  `Humidite_mesure` int(11) NOT NULL,
  `Temperature_mesure` float NOT NULL,
  `Luminosite_mesure` int(11) NOT NULL,
  `CO2_mesure` int(11) NOT NULL,
  `Adresse_Mac_Plante` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_mesure`),
  KEY `Adresse_Mac_Plante` (`Adresse_Mac_Plante`),
  CONSTRAINT `mesures_ibfk_1` FOREIGN KEY (`Adresse_Mac_Plante`) REFERENCES `plante` (`Adresse_Mac_plante`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table projetplante. plante
DROP TABLE IF EXISTS `plante`;
CREATE TABLE IF NOT EXISTS `plante` (
  `Adresse_Mac_plante` varchar(50) NOT NULL,
  `Libelle_plante` varchar(50) NOT NULL,
  `Date_plantation_plante` date NOT NULL,
  `Description_plante` varchar(500) NOT NULL,
  `Niveau_irrigation_plante` tinyint(4) NOT NULL,
  `Seuil_humidite_plante` int(11) NOT NULL,
  PRIMARY KEY (`Adresse_Mac_plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
