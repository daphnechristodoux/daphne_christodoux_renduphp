-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : dim. 31 mars 2024 à 15:53
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `minitwitter`
--

-- --------------------------------------------------------

--
-- Structure de la table `tweet`
--

CREATE TABLE `tweet` (
  `tweet` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Heure` datetime NOT NULL,
  `user_id` int NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tweet`
--

INSERT INTO `tweet` (`tweet`, `Heure`, `user_id`, `id`) VALUES
('tweet de christodoux', '2024-03-29 09:03:19', 3, 7),
('Bonjour d\'Aneta', '2024-03-29 11:52:37', 19, 20),
('Je serai en retard', '2024-03-29 11:53:07', 19, 21),
('Désolée', '2024-03-29 11:53:36', 19, 22),
('Samedi bonjour de daphné', '2024-03-30 09:15:49', 3, 25),
('Il y a JPO samedi prochain', '2024-03-30 21:36:59', 26, 27),
('samedi', '2024-03-30 23:15:44', 3, 29),
('samedi', '2024-03-30 23:15:58', 3, 30),
('samedi', '2024-03-30 23:17:14', 3, 31),
('encore samedi', '2024-03-30 23:22:39', 3, 32),
('samedi 23 26', '2024-03-30 23:26:42', 3, 33),
('samedi 23 40', '2024-03-30 23:39:53', 3, 34),
('samedi 23 41', '2024-03-30 23:41:35', 3, 35),
('dimanche 00 22', '2024-03-31 00:22:46', 3, 36),
('premier tweet', '2024-03-31 00:41:21', 3, 37),
('Bonne nuit', '2024-03-31 01:33:53', 3, 39),
('dimanche', '2024-03-31 09:52:28', 3, 40),
('Bonjour, c\'est Brian, c\'est dimanche 12h22', '2024-03-31 12:23:29', 20, 52),
('Je vais au Kintaro. Tu viens ?', '2024-03-31 12:26:05', 20, 53),
('OK. A quelle heure ?', '2024-03-31 12:27:13', 12, 54),
('13h', '2024-03-31 12:27:32', 20, 55),
('OK', '2024-03-31 12:27:44', 12, 56),
('Je peux venir ?', '2024-03-31 12:33:46', 30, 57),
('c\'etait bien le kintaro', '2024-03-31 17:36:12', 20, 58),
('super !\r\n', '2024-03-31 17:36:39', 30, 59),
('mon restau prefere\r\n', '2024-03-31 17:37:09', 12, 60),
('t\'a aime ben ?\r\n', '2024-03-31 17:37:59', 12, 61),
('ouais super', '2024-03-31 17:38:23', 26, 62),
('C\'est quoi le kintaro ?', '2024-03-31 17:43:34', 31, 63),
('une cantine japonaise', '2024-03-31 17:44:15', 12, 65),
('OK', '2024-03-31 17:45:04', 31, 66);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `pseudo` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `email`, `password`) VALUES
(3, 'Christodoux', 'daphne.christodoux@gmail.com', 'Daph'),
(4, 'Mikkelsen', 'mmikkelsen@gmail.com', 'pioupioupiou'),
(5, 'Chabert', 'achabert@gmail.com', 'azerty'),
(6, 'Toutin', 'dtoutain@gmail.com', 'aliseun'),
(7, 'Host', 'host@gmail.com', 'chaton'),
(8, 'Emilie', 'emilie@gmail.com', 'dfsoicnk'),
(9, 'erwan', 'erwan@gmail.com', 'sgdjsgdjshgdk'),
(10, 'louane', 'louane@gmail.com', 'sqjdgkbedkfezj'),
(12, 'daphne', 'dchristodoux@gmail.com', 'daph'),
(13, 'alex', 'alex@gmail.com', 'sdhgjbckijdh'),
(14, 'théo', 'theo@gmail.com', 'jsfhdksdbfckjbd'),
(16, 'mika', 'mika@gmail.com', 'mikamika'),
(17, 'Eric', 'eric@gmail.com', 'sfdsdgfs'),
(18, 'lola', 'lola@gmail.com', 'sdqsfq'),
(19, 'Aneta', 'aneta@gmail.com', 'hqsgdjsqbvf'),
(20, 'brian', 'brian@gmail.com', 'kqjeg,qbsd'),
(21, 'theo', 'theio@gmail', 'password'),
(22, 'ian', 'ian@gmail.com', 'sbksdbfks'),
(23, 'Igor', 'Igor@gmail.com', 'jhg'),
(24, 'Ana', 'ana@gmail.com', 'hgkdbqskfbcqj'),
(25, 'Mael', 'mael@gmail.com', 'djfbksdbfsk'),
(26, 'Ben', 'ben@yahoo.com', 'lkjhfoluigougf'),
(27, 'kevin', 'kevin@yahoo.fr', 'dfsgsdh'),
(28, 'malo', 'malo@yahoo.fr', 'sfdsgsfhgsfg'),
(29, 'daphné', 'daphne@gmail.com', 'jcbkzbjckz'),
(30, 'melanie', 'melanie@gmail.com', 'jsbfkjszdgvbf'),
(31, 'gab', 'gab@gmail.com', 'djhvlknsjd');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tweet`
--
ALTER TABLE `tweet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tweet`
--
ALTER TABLE `tweet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tweet`
--
ALTER TABLE `tweet`
  ADD CONSTRAINT `tweet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
