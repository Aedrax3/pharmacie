-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 27 avr. 2023 à 13:14
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pharmacie`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `matricule` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(11) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(10) COLLATE utf8_bin NOT NULL,
  `age` int(15) NOT NULL,
  `securite_social` varchar(15) COLLATE utf8_bin NOT NULL,
  `id_mutuelle` int(11) NOT NULL,
  PRIMARY KEY (`matricule`),
  UNIQUE KEY `id_matricule` (`matricule`) USING BTREE,
  KEY `id_mutuelle` (`id_mutuelle`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`matricule`, `nom`, `prenom`, `age`, `securite_social`, `id_mutuelle`) VALUES
(1, 'Jacques', 'Adèle', 18, '1038548547693', 1),
(2, 'Pruvost', 'Caroline', 60, '1037842136543', 3),
(3, 'Vasseur', 'Thomas', 30, '1034789685326', 4),
(4, 'Gomes', 'Françoise', 25, '1036325693215', 2),
(5, 'Courtois', 'Claude', 35, '1035684821476', 2),
(6, 'Petit', 'Mathilde', 23, '1039563658142', 4);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(15) COLLATE utf8_bin NOT NULL,
  `num tel` int(10) NOT NULL,
  PRIMARY KEY (`numero`),
  UNIQUE KEY `num_medecin` (`numero`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`numero`, `nom`, `prenom`, `num tel`) VALUES
(1, 'Neferu', 'Pitou', 696898520),
(2, 'Ambroise', 'Paré', 696536998),
(3, 'Bichat', 'Xavier', 696485796),
(4, 'Brès', 'Madeleine', 696963658),
(5, 'Roselmac', 'Gérald', 696180605);

-- --------------------------------------------------------

--
-- Structure de la table `mutuelle`
--

DROP TABLE IF EXISTS `mutuelle`;
CREATE TABLE IF NOT EXISTS `mutuelle` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `mutuelle`
--

INSERT INTO `mutuelle` (`numero`, `nom`) VALUES
(1, 'Mutuelle MGPA'),
(2, 'Groupama'),
(3, 'MIAG'),
(4, 'Cerder');

-- --------------------------------------------------------

--
-- Structure de la table `médicament`
--

DROP TABLE IF EXISTS `médicament`;
CREATE TABLE IF NOT EXISTS `médicament` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `fréquence` varchar(50) COLLATE utf8_bin NOT NULL,
  `quantité` varchar(50) COLLATE utf8_bin NOT NULL,
  `dosage` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_princip` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `id_princip` (`id_princip`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `médicament`
--

INSERT INTO `médicament` (`num`, `nom`, `fréquence`, `quantité`, `dosage`, `id_princip`) VALUES
(1, 'Aclotine', 'tous les 2 jours', '100 UI/ml ', '40-50 UI/ml', 2),
(2, 'Atenative', '', '', '', 2),
(3, 'Lynparza', 'tous les jours', '500g', '800mg', 3),
(4, 'Voraxaze', '', '1000UI', '', 4);

-- --------------------------------------------------------

--
-- Structure de la table `ordonnance`
--

DROP TABLE IF EXISTS `ordonnance`;
CREATE TABLE IF NOT EXISTS `ordonnance` (
  `numero` int(10) NOT NULL AUTO_INCREMENT,
  `dosage` varchar(50) COLLATE utf8_bin NOT NULL,
  `duree trait` varchar(50) COLLATE utf8_bin NOT NULL,
  `mat_clt` int(11) NOT NULL,
  `num_medecin` int(11) NOT NULL,
  `num_medicament` int(11) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `mat_clt` (`mat_clt`) USING BTREE,
  KEY `num_medecin` (`num_medecin`),
  KEY `num_medicament` (`num_medicament`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `ordonnance`
--

INSERT INTO `ordonnance` (`numero`, `dosage`, `duree trait`, `mat_clt`, `num_medecin`, `num_medicament`) VALUES
(1, '40-50 UI/ml\r\n', '3 mois', 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `principeactif`
--

DROP TABLE IF EXISTS `principeactif`;
CREATE TABLE IF NOT EXISTS `principeactif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `principeactif`
--

INSERT INTO `principeactif` (`id`, `nom`) VALUES
(1, 'Paracétamol'),
(2, 'Antithrombine'),
(3, 'Olaparib'),
(4, 'Glucarpidase');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
