-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 15 déc. 2023 à 06:27
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `village_pere_noel`
--

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

DROP TABLE IF EXISTS `avis`;
CREATE TABLE IF NOT EXISTS `avis` (
  `id_avis` int NOT NULL,
  `pseudo_avis` varchar(50) DEFAULT NULL,
  `message_avis` text,
  PRIMARY KEY (`id_avis`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cadeaux`
--

DROP TABLE IF EXISTS `cadeaux`;
CREATE TABLE IF NOT EXISTS `cadeaux` (
  `id_cadeau` int NOT NULL AUTO_INCREMENT,
  `nom_cadeau` varchar(50) DEFAULT NULL,
  `categorie_cadeau` varchar(50) DEFAULT NULL,
  `age_cadeau` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description_cadeau` varchar(255) DEFAULT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_cadeau`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id_contact` int NOT NULL,
  `prenon_contact` varchar(20) DEFAULT NULL,
  `nom_contact` varchar(20) DEFAULT NULL,
  `mail_contact` varchar(50) DEFAULT NULL,
  `adresse_contact` varchar(100) DEFAULT NULL,
  `message_contact` text,
  PRIMARY KEY (`id_contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `letttres`
--

DROP TABLE IF EXISTS `letttres`;
CREATE TABLE IF NOT EXISTS `letttres` (
  `id_lettre` int NOT NULL,
  `prenom_enfant` varchar(20) DEFAULT NULL,
  `nom_enfant` varchar(20) DEFAULT NULL,
  `age_enfant` varchar(2) DEFAULT NULL,
  `adresse_enfant` varchar(100) DEFAULT NULL,
  `lettre_enfant` text,
  PRIMARY KEY (`id_lettre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prendre`
--

DROP TABLE IF EXISTS `prendre`;
CREATE TABLE IF NOT EXISTS `prendre` (
  `id_user` int NOT NULL,
  `id_contact` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_contact`),
  KEY `id_contact` (`id_contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_user` int NOT NULL,
  `prenom_user` varchar(20) DEFAULT NULL,
  `nom_user` varchar(20) DEFAULT NULL,
  `fonction_user` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_confirm` varchar(100) DEFAULT NULL,
  `id_avis` int DEFAULT NULL,
  `id_lettre` int NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_avis` (`id_avis`),
  KEY `id_lettre` (`id_lettre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
