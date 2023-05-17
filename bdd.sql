-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : dim. 23 avr. 2023 à 16:07
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_projet_web`
--

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `username` char(12) NOT NULL,
  `password` char(20) NOT NULL,
  `email` text NOT NULL,
  `is_admin` int(2) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, admin, password, 'admin@example.com', 0),
(2, user1, password, 'user1@example.com', 0);

-- --------------------------------------------------------

--
-- Structure de la table `cameras`
--

CREATE TABLE `cameras` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `brand` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `speeds` int(4) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `lenses`
--

CREATE TABLE `lenses` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `brand` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `apertures` int(4) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- --------------------------------------------------------

--
-- Structure de la table `movie_favorite_actors`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `speed` int(4) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `note_movies`
--

CREATE TABLE `owned_cameras` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL,
  `note` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seen_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `userID`, `title`, `content`, `created_at`, `seen_date`) VALUES
(1, 2, 'Test', 'Ceci est le contenu de la notifications de test', '2023-04-23 16:29:12', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `replies`
--

CREATE TABLE `owned_lenses` (
  `id` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `content` text NOT NULL,
  `reactions` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `replies_reactions`
--

CREATE TABLE `used_films` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `replyID` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ordre` int(10) NOT NULL,
  `permission_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `ordre`, `permission_level`) VALUES
(1, 'Créateur', 'Ce rôle est celui du ou des créateurs du site', 1, 4),
(2, 'Administrateur', 'Ce rôle est celui du ou des administrateurs du site', 2, 3),
(3, 'Modérateur', 'Ce rôle est celui du ou des modérateurs du site', 3, 2),
(4, 'Membre', 'Ce rôle est celui du ou des membres du site', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `towatch_movies`
--

CREATE TABLE `towatch_movies` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL,
  `add_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `towatch_movies`
--

INSERT INTO `towatch_movies` (`id`, `userID`, `movieID`, `add_date`) VALUES
(1, 2, 796185, '2023-04-18 15:25:59'),
(2, 2, 967874, '2023-04-18 15:48:30');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profil_picture` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `role` int(2) NOT NULL DEFAULT '4',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `last_connexion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `profil_picture`, `role`, `created_at`, `updated_at`, `last_connexion`) VALUES
(1, 'admin', 'admin', 'default.jpg', 1, '2023-04-13 20:36:26', NULL, NULL),
(2, 'Remi', 'remi', 'default.jpg', 4, '2023-04-13 20:36:26', NULL, '2023-04-23 17:36:02'),
(3, 'Charles-Augustin', 'charlesaugustin', 'default.jpg', 4, '2023-04-13 20:36:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `watched_movies`
--

CREATE TABLE `watched_movies` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL,
  `multiple` int(2) NOT NULL DEFAULT '1',
  `seen_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `watched_movies`
--

INSERT INTO `watched_movies` (`id`, `userID`, `movieID`, `multiple`, `seen_date`) VALUES
(3, 2, 19123, 2, '2023-04-18 15:22:52'),
(4, 2, 61864, 1, '2023-04-18 15:24:34'),
(14, 2, 761, 1, '2023-04-21 13:26:58'),
(15, 2, 39514, 3, '2023-04-22 18:22:21'),
(16, 2, 10939, 1, '2023-04-22 18:39:50'),
(17, 2, 61852, 1, '2023-04-22 18:40:19');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `comments_ibfk_1` (`movieID`);

--
-- Index pour la table `comments_reactions`
--
ALTER TABLE `comments_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentID` (`commentID`),
  ADD KEY `userID` (`userID`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `movieID_2` (`movieID`),
  ADD KEY `movieID` (`movieID`);

--
-- Index pour la table `movie_favorite_actors`
--
ALTER TABLE `movie_favorite_actors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `movie_favorite_actors_ibfk_1` (`movieID`);

--
-- Index pour la table `note_movies`
--
ALTER TABLE `note_movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `note_movies_ibfk_1` (`movieID`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Index pour la table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentID` (`commentID`),
  ADD KEY `userID` (`userID`);

--
-- Index pour la table `replies_reactions`
--
ALTER TABLE `replies_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replyID` (`replyID`),
  ADD KEY `userID` (`userID`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `towatch_movies`
--
ALTER TABLE `towatch_movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `towatch_movies_ibfk_1` (`movieID`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role` (`role`);

--
-- Index pour la table `watched_movies`
--
ALTER TABLE `watched_movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `watched_movies_ibfk_1` (`movieID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `comments_reactions`
--
ALTER TABLE `comments_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `movie_favorite_actors`
--
ALTER TABLE `movie_favorite_actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `note_movies`
--
ALTER TABLE `note_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `replies_reactions`
--
ALTER TABLE `replies_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `towatch_movies`
--
ALTER TABLE `towatch_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `watched_movies`
--
ALTER TABLE `watched_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `comments_reactions`
--
ALTER TABLE `comments_reactions`
  ADD CONSTRAINT `comments_reactions_ibfk_1` FOREIGN KEY (`commentID`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_reactions_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `movie_favorite_actors`
--
ALTER TABLE `movie_favorite_actors`
  ADD CONSTRAINT `movie_favorite_actors_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`),
  ADD CONSTRAINT `movie_favorite_actors_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `note_movies`
--
ALTER TABLE `note_movies`
  ADD CONSTRAINT `note_movies_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`),
  ADD CONSTRAINT `note_movies_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`commentID`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `replies_reactions`
--
ALTER TABLE `replies_reactions`
  ADD CONSTRAINT `replies_reactions_ibfk_1` FOREIGN KEY (`replyID`) REFERENCES `replies` (`id`),
  ADD CONSTRAINT `replies_reactions_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `towatch_movies`
--
ALTER TABLE `towatch_movies`
  ADD CONSTRAINT `towatch_movies_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`),
  ADD CONSTRAINT `towatch_movies_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `watched_movies`
--
ALTER TABLE `watched_movies`
  ADD CONSTRAINT `watched_movies_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`),
  ADD CONSTRAINT `watched_movies_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
