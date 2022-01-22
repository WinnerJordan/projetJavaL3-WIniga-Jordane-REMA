-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 22 jan. 2022 à 01:42
-- Version du serveur : 8.0.27
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_rdv_clinique`
--
CREATE DATABASE IF NOT EXISTS `gestion_rdv_clinique` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `gestion_rdv_clinique`;

-- --------------------------------------------------------

--
-- Structure de la table `constantes`
--

DROP TABLE IF EXISTS `constantes`;
CREATE TABLE IF NOT EXISTS `constantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `temperature` int NOT NULL,
  `poids` int NOT NULL,
  `tension` int NOT NULL,
  `id_consultation` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `constantes`
--

INSERT INTO `constantes` (`id`, `temperature`, `poids`, `tension`, `id_consultation`) VALUES
(1, 10, 10, 10, 1),
(2, 30, 30, 30, 3),
(3, 40, 40, 100, 5),
(4, 10, 20, 30, 6),
(5, 10, 20, 30, 6),
(6, 10, 20, 30, 6),
(7, 50, 10, 90, 7),
(8, 78964, 69865, 1846, 8),
(9, 27, 75, 200, 9),
(10, 78, 78, 78, 10),
(11, 78, 78, 78, 10);

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `constantes_id` int DEFAULT NULL,
  `statut` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `medecin_nci` int NOT NULL,
  `patient_nci` int NOT NULL,
  `ordonnance_id` int DEFAULT NULL,
  `specialite_id` int NOT NULL,
  `consultation_rdv_id` int NOT NULL,
  `prestation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id`, `constantes_id`, `statut`, `date`, `medecin_nci`, `patient_nci`, `ordonnance_id`, `specialite_id`, `consultation_rdv_id`, `prestation_id`) VALUES
(1, 1, 'Fait', '2020-10-10', 2602, 778179211, NULL, 1, 1, 5),
(2, NULL, 'En Cours', '2020-10-20', 2006, 778179211, NULL, 2, 2, 0),
(3, 3, 'Fait', '2021-10-10', 2005, 778179211, NULL, 2, 6, 7),
(4, NULL, 'Annule', '2020-09-08', 2602, 1234, NULL, 1, 8, 0),
(5, 5, 'Fait', '2030-10-10', 2602, 778179211, NULL, 1, 9, 0),
(6, 6, 'Fait', '2030-10-15', 2602, 778179211, NULL, 1, 10, 0),
(7, 7, 'Fait', '2050-10-10', 2602, 778179211, NULL, 1, 11, 0),
(8, 8, 'Fait', '2021-12-20', 2602, 778179211, NULL, 1, 12, 0),
(9, 9, 'Fait', '2022-01-19', 1, 778179211, NULL, 1, 13, 0),
(10, 10, 'Fait', '1990-12-15', 2006, 778179211, NULL, 2, 14, 15);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id`, `code`, `nom`) VALUES
(1, 'med001', 'panadol'),
(2, 'med002', 'paracetamol'),
(3, 'med003', 'tchiep');

-- --------------------------------------------------------

--
-- Structure de la table `ordonnance`
--

DROP TABLE IF EXISTS `ordonnance`;
CREATE TABLE IF NOT EXISTS `ordonnance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `consultation_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ordonnance`
--

INSERT INTO `ordonnance` (`id`, `consultation_id`) VALUES
(1, 4),
(2, 4),
(3, 4),
(4, 5),
(5, 6),
(6, 6),
(7, 6),
(8, 7),
(9, 8),
(10, 9);

-- --------------------------------------------------------

--
-- Structure de la table `ord_med`
--

DROP TABLE IF EXISTS `ord_med`;
CREATE TABLE IF NOT EXISTS `ord_med` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_med` int NOT NULL,
  `posologie` varchar(255) NOT NULL,
  `id_odonnance` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ord_med`
--

INSERT INTO `ord_med` (`id`, `id_med`, `posologie`, `id_odonnance`) VALUES
(1, 1, 'une fois par jours', 1),
(2, 3, 'tous les jours', 1),
(3, 3, 'hihihiiii', 2),
(4, 1, 'une fois par jours', 3),
(5, 2, 'deux fois par jours', 3),
(6, 3, 'xxx', 3),
(7, 1, 'lol', 4),
(8, 2, 'xxx', 4),
(9, 2, 'a prendre avec moderation', 5),
(10, 2, 'a prendre avec moderation', 6),
(11, 2, 'a prendre avec moderation', 7),
(12, 2, 'ptdrrr', 8),
(13, 1, 'xxxx123', 8),
(14, 1, 'Une fois par jours', 9),
(15, 2, 'qryfvcb qiljfkc', 9),
(16, 1, '3 fois par jours', 10),
(17, 2, '2 fois par semaine', 10);

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
CREATE TABLE IF NOT EXISTS `prestation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `statut` varchar(25) NOT NULL,
  `resultat` text,
  `patient_nci` int NOT NULL,
  `type_prestation_id` int NOT NULL,
  `prestation_rdv_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `prestation`
--

INSERT INTO `prestation` (`id`, `date`, `statut`, `resultat`, `patient_nci`, `type_prestation_id`, `prestation_rdv_id`) VALUES
(1, '2020-10-30', 'Faite', 'Fracture multiple du tibia', 778179211, 1, 3),
(2, '2020-11-10', 'Annule', '--', 778179211, 2, 4),
(3, '2020-11-10', 'Annule', '--', 778179211, 2, 5),
(4, '2021-10-01', 'En cours', '--', 778179211, 3, 7);

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
CREATE TABLE IF NOT EXISTS `rdv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `etat` varchar(50) NOT NULL,
  `patient_nci` int NOT NULL,
  `specialite_id` int DEFAULT NULL,
  `prestation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `rdv`
--

INSERT INTO `rdv` (`id`, `date`, `etat`, `patient_nci`, `specialite_id`, `prestation_id`) VALUES
(1, '2020-10-10', 'Valide', 778179211, 1, 0),
(2, '2020-10-20', 'Valide', 778179211, 2, 0),
(3, '2020-10-30', 'Valide', 778179211, 0, 1),
(4, '2020-11-10', 'Valide', 778179211, 0, 2),
(5, '2020-11-10', 'Valide', 778179211, 0, 2),
(6, '2021-10-10', 'Valide', 778179211, 2, 0),
(7, '2021-10-01', 'Valide', 778179211, 0, 3),
(8, '2020-09-08', 'Valide', 1234, 1, 0),
(9, '2030-10-10', 'Valide', 778179211, 1, 0),
(10, '2030-10-15', 'Valide', 778179211, 1, 0),
(11, '2050-10-10', 'Valide', 778179211, 1, 0),
(12, '2021-12-20', 'Valide', 778179211, 1, 0),
(13, '2022-01-19', 'Valide', 778179211, 1, 0),
(14, '1990-12-15', 'Valide', 778179211, 2, 0),
(15, '1990-12-16', 'En Cours', 778179211, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle_specialite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`id`, `libelle_specialite`) VALUES
(1, 'Ondotologie'),
(2, 'Ophtalmologie');

-- --------------------------------------------------------

--
-- Structure de la table `type_prestation`
--

DROP TABLE IF EXISTS `type_prestation`;
CREATE TABLE IF NOT EXISTS `type_prestation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle_type_prestation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type_prestation`
--

INSERT INTO `type_prestation` (`id`, `libelle_type_prestation`) VALUES
(1, 'radio'),
(2, 'analyse'),
(3, 'operation');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nci` int NOT NULL,
  `nom_complet` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` char(25) NOT NULL,
  `antecedents` varchar(255) DEFAULT NULL,
  `specialite_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nci`, `nom_complet`, `login`, `password`, `role`, `antecedents`, `specialite_id`) VALUES
(1, 778179211, 'Jordan Rema', 'jord', '1234', 'ROLE_PATIENT', 'Aveugle', NULL),
(6, 2602, 'Odonto 1', 'odonto1', '1234', 'ROLE_MEDECIN', NULL, 1),
(5, 26022003, 'WinigaJordan', 'yamine', '1234', 'ROLE_SECRETAIRE', NULL, NULL),
(7, 260200, 'Odonto 2', 'odonto2', '1234', 'ROLE_MEDECIN', NULL, 1),
(8, 2005, 'ophto 1', 'ophto1', '1234', 'ROLE_MEDECIN', NULL, 2),
(9, 2006, 'ophto 2', 'ophto2', '1234', 'ROLE_MEDECIN', NULL, 2),
(10, 1234, 'patient 1', 'patient1', '1234', 'ROLE_PATIENT', NULL, NULL),
(11, 228, 'Liz La Poule', 'rp', '1234', 'ROLE_RP', NULL, NULL),
(12, 7, 'Ben', 'ben', '1234', 'ROLE_PATIENT', NULL, NULL),
(13, 8, 'azer', 'test', '1234', 'ROLE_PATIENT', 'xxx', NULL),
(14, 222, 'TestAdmin', 'admin', '1234', 'ADMIN', NULL, NULL),
(15, 1, 'Akol Steno', 'steno', '1234', 'ROLE_MEDECIN', NULL, 1),
(16, 10101010, 'Anael Mathis ALAPINI', 'tissou', '1234', 'ROLE_MEDECIN', NULL, 2),
(21, 10102020, 'testadmin', 'admin1', '1234', 'ADMIN', NULL, NULL),
(22, 10203000, 'testMed', 'med', 'med', 'ROLE_MEDECIN', NULL, 1),
(23, 11223344, 'aaaaa', 'aa', 'aa', 'ROLE_SECRETAIRE', NULL, NULL),
(24, 12, 'grqebdv', 'aaaa', 'vvvv', 'ROLE_PATIENT', 'ZEQREBTG VDQNYRHB', NULL);
--
-- Base de données : `inversion_controle`
--
CREATE DATABASE IF NOT EXISTS `inversion_controle` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `inversion_controle`;
--
-- Base de données : `projet_symfony`
--
CREATE DATABASE IF NOT EXISTS `projet_symfony` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `projet_symfony`;

-- --------------------------------------------------------

--
-- Structure de la table `burger`
--

DROP TABLE IF EXISTS `burger`;
CREATE TABLE IF NOT EXISTS `burger` (
  `id` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6EEAA67D19EB6921` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `complement`
--

DROP TABLE IF EXISTS `complement`;
CREATE TABLE IF NOT EXISTS `complement` (
  `id` int NOT NULL,
  `categorie_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F8A41E34BCF5E72D` (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detail_commande`
--

DROP TABLE IF EXISTS `detail_commande`;
CREATE TABLE IF NOT EXISTS `detail_commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produit_id` int NOT NULL,
  `commande_id` int NOT NULL,
  `quantite` int NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_98344FA6F347EFB` (`produit_id`),
  KEY `IDX_98344FA682EA2E54` (`commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220115152421', '2022-01-15 15:25:04', 10076);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `dtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `burger`
--
ALTER TABLE `burger`
  ADD CONSTRAINT `FK_EFE35A0DBF396750` FOREIGN KEY (`id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67D19EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `complement`
--
ALTER TABLE `complement`
  ADD CONSTRAINT `FK_F8A41E34BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_F8A41E34BF396750` FOREIGN KEY (`id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  ADD CONSTRAINT `FK_98344FA682EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `FK_98344FA6F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_7D053A93BF396750` FOREIGN KEY (`id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;
--
-- Base de données : `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
