-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 nov. 2023 à 03:57
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
-- Base de données : `noel`
--
CREATE DATABASE IF NOT EXISTS `noel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `noel`;

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
CREATE TABLE IF NOT EXISTS `appartenir` (
  `id_cadeau` int NOT NULL,
  `id_categories_cadeaux` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cadeau`,`id_categories_cadeaux`),
  KEY `id_categories_cadeaux` (`id_categories_cadeaux`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

DROP TABLE IF EXISTS `avis`;
CREATE TABLE IF NOT EXISTS `avis` (
  `id_avis` int NOT NULL,
  `objet_avis` varchar(50) DEFAULT NULL,
  `detail` text,
  `date_reception` datetime DEFAULT NULL,
  `droit_de_reponse` datetime DEFAULT NULL,
  `id_enfant` int NOT NULL,
  `id_parent` varchar(50) NOT NULL,
  PRIMARY KEY (`id_avis`),
  KEY `id_enfant` (`id_enfant`),
  KEY `id_parent` (`id_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cadeaux`
--

DROP TABLE IF EXISTS `cadeaux`;
CREATE TABLE IF NOT EXISTS `cadeaux` (
  `id_cadeau` int NOT NULL,
  `designation` text,
  `descriptif` text,
  `categories` varchar(50) DEFAULT NULL,
  `poid` decimal(15,2) DEFAULT NULL,
  `taille` decimal(15,2) DEFAULT NULL,
  `note_deatisfaction` decimal(1,1) DEFAULT NULL,
  `destination_enfant` varchar(50) DEFAULT NULL,
  `id_enfant` int NOT NULL,
  `id_user` int NOT NULL,
  `id_pere_noel` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cadeau`),
  KEY `id_enfant` (`id_enfant`),
  KEY `id_user` (`id_user`),
  KEY `id_pere_noel` (`id_pere_noel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_categories_cadeaux` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categories_cadeaux`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `choisir_by_parents`
--

DROP TABLE IF EXISTS `choisir_by_parents`;
CREATE TABLE IF NOT EXISTS `choisir_by_parents` (
  `id_cadeau` int NOT NULL,
  `id_parent` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cadeau`,`id_parent`),
  KEY `id_parent` (`id_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `letttre`
--

DROP TABLE IF EXISTS `letttre`;
CREATE TABLE IF NOT EXISTS `letttre` (
  `id_lettre` varchar(50) NOT NULL,
  `prenom_expediteur` varchar(20) DEFAULT NULL,
  `nom_expéditeur` varchar(20) DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `date_reponse` datetime DEFAULT NULL,
  `id_user` int NOT NULL,
  `id_pere_noel` varchar(50) NOT NULL,
  `id_enfant` int NOT NULL,
  PRIMARY KEY (`id_lettre`),
  KEY `id_user` (`id_user`),
  KEY `id_pere_noel` (`id_pere_noel`),
  KEY `id_enfant` (`id_enfant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs_elfes`
--

DROP TABLE IF EXISTS `utilisateurs_elfes`;
CREATE TABLE IF NOT EXISTS `utilisateurs_elfes` (
  `id_user` int NOT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `nombre_de_creations` text,
  `ancienneté` date DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_confirm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs_enfant`
--

DROP TABLE IF EXISTS `utilisateurs_enfant`;
CREATE TABLE IF NOT EXISTS `utilisateurs_enfant` (
  `id_enfant` int NOT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `sexe` varchar(1) DEFAULT NULL,
  `adresse_de_livraison` varchar(255) DEFAULT NULL,
  `prenom_parent1` varchar(20) DEFAULT NULL,
  `nom_parent1` varchar(20) DEFAULT NULL,
  `prenom_parent2` varchar(20) DEFAULT NULL,
  `nom_parent2` varchar(20) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `cadeaux_reçu` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_confirm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_enfant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs_parents`
--

DROP TABLE IF EXISTS `utilisateurs_parents`;
CREATE TABLE IF NOT EXISTS `utilisateurs_parents` (
  `id_parent` varchar(50) NOT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `parent_de____` varchar(20) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_confirm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_pere_noel`
--

DROP TABLE IF EXISTS `utilisateur_pere_noel`;
CREATE TABLE IF NOT EXISTS `utilisateur_pere_noel` (
  `id_pere_noel` varchar(50) NOT NULL,
  `prenom` char(4) DEFAULT NULL,
  `nom` char(4) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_confirm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pere_noel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
