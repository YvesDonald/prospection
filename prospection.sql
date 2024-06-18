-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 17 juin 2024 à 10:12
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `prospection`
--

-- --------------------------------------------------------

--
-- Structure de la table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) COLLATE utf8mb4_croatian_ci NOT NULL,
  `localisation` varchar(255) COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Déchargement des données de la table `campus`
--

INSERT INTO `campus` (`id`, `intitule`, `localisation`) VALUES
(1, 'campus A', 'RAS'),
(2, 'campus B', 'RAS'),
(3, 'campus C', 'RAS'),
(4, 'campus D', 'RAS'),
(5, 'campus E', 'RAS'),
(6, 'campus de Mbouda', 'RAS');

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
CREATE TABLE IF NOT EXISTS `diplome` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Déchargement des données de la table `diplome`
--

INSERT INTO `diplome` (`id`, `intitule`) VALUES
(1, 'BEPC'),
(2, 'PROBATOIRE'),
(3, 'BAC'),
(4, 'BTS'),
(5, 'Licence'),
(6, 'DCI');

-- --------------------------------------------------------

--
-- Structure de la table `prospere`
--

DROP TABLE IF EXISTS `prospere`;
CREATE TABLE IF NOT EXISTS `prospere` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `tel` bigint NOT NULL,
  `tel_tuteur` bigint DEFAULT NULL,
  `id_zone` int DEFAULT NULL,
  `id_diplome` int DEFAULT NULL,
  `id_utilisateur` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_diplome` (`id_diplome`),
  KEY `id_zone` (`id_zone`),
  KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Déchargement des données de la table `prospere`
--

INSERT INTO `prospere` (`id`, `nom`, `tel`, `tel_tuteur`, `id_zone`, `id_diplome`, `id_utilisateur`) VALUES
(1, 'alex', 656787655, 687765689, 4, 5, 10),
(2, 'Francis', 677554576, 656787656, 3, 4, 8);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `intitule`) VALUES
(1, 'super administrateur'),
(2, 'administrateur'),
(3, 'responsable'),
(4, 'utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8mb4_croatian_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_croatian_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_croatian_ci NOT NULL,
  `tel` bigint NOT NULL,
  `id_type` int NOT NULL,
  `id_campus` int DEFAULT NULL,
  `id_createur` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type` (`id_type`),
  KEY `id_campus` (`id_campus`),
  KEY `id_createur` (`id_createur`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `password`, `nom`, `tel`, `id_type`, `id_campus`, `id_createur`) VALUES
(7, 'azerty@gmail.com', 'azerty', 'azerty', 6875696, 1, NULL, NULL),
(8, 'qwerty@gmail.com', 'qwerty', 'qwerty', 6875696, 2, NULL, NULL),
(9, 'abena@gmail.com', 'abena', 'abena', 6875696, 3, 4, NULL),
(10, 'tobi@gmail.com', 'tobi', 'tobi', 6875696, 4, 4, 7);

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE IF NOT EXISTS `zone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Déchargement des données de la table `zone`
--

INSERT INTO `zone` (`id`, `intitule`) VALUES
(1, 'Kankop'),
(2, 'Tamdja'),
(3, 'Explosif'),
(4, 'Bandjoun'),
(5, 'Camoco'),
(6, 'Marché B');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `prospere`
--
ALTER TABLE `prospere`
  ADD CONSTRAINT `prospere_ibfk_1` FOREIGN KEY (`id_diplome`) REFERENCES `diplome` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prospere_ibfk_2` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prospere_ibfk_3` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`id_campus`) REFERENCES `campus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `utilisateur_ibfk_3` FOREIGN KEY (`id_createur`) REFERENCES `utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
