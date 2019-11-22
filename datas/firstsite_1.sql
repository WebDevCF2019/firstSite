-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 22 nov. 2019 à 16:22
-- Version du serveur :  5.7.24
-- Version de PHP :  7.3.1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données :  `firstsite`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
                                          `id` int(11) NOT NULL AUTO_INCREMENT,
                                          `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `letexte` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `ladate` date DEFAULT NULL,
                                          `utilisateurs_id` int(11) DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `IDX_BFDD31681E969C5` (`utilisateurs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `slug`, `titre`, `letexte`, `ladate`, `utilisateurs_id`) VALUES
(1, 'migrations-adding-more-fields', 'Migrations & Adding more Fields', 'But what if you need to add a new field property to Product, like a description? You can edit the class to add the new property. But, you can also use make:entity again:\r\n\r\nThis adds the new description property and getDescription() and setDescription() methods:\r\n\r\nThe new property is mapped, but it doesn\'t exist yet in the product table. No problem! Generate a new migration:', '2019-11-22', 1),
(2, 'migrations-creating-the-database-tables-schema', 'Migrations: Creating the Database Tables/Schema', 'The Product class is fully-configured and ready to save to a product table. If you just defined this class, your database doesn\'t actually have the product table yet. To add it, you can leverage the DoctrineMigrationsBundle, which is already installed:\r\n\r\n php bin/console make:migration\r\n\r\nIf everything worked, you should see something like this:\r\n\r\nSUCCESS!\r\n\r\nNext: Review the new migration \"src/Migrations/Version20180207231217.php\" Then: Run the migration with php bin/console doctrine:migrations:migrate\r\n\r\nIf you open this file, it contains the SQL needed to update your database! To run that SQL, execute your migrations:\r\n\r\n php bin/console doctrine:migrations:migrate', '2019-11-22', 1);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
                                                    `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
                                                    `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
                                                    PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191122133111', '2019-11-22 13:38:58');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
                                              `id` int(11) NOT NULL AUTO_INCREMENT,
                                              `lelogin` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `lemail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `date_inscription` datetime DEFAULT NULL,
                                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `lelogin`, `nom`, `lemail`, `date_inscription`) VALUES
(1, 'Mikhawa', 'Pitz Michaël', 'michaeljpitz@gmail.com', '2019-11-22 16:18:00');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
    ADD CONSTRAINT `FK_BFDD31681E969C5` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
