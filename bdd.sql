-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8888
-- Généré le : mer. 15 mai. 2023 à 12:17
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
-- Base de données : `POSEm`
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
  `is_admin` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`,`is_admin`) VALUES
(1, 'admin', 'password', 'admin@example.com', 1),
(2, 'user1', 'password', 'user1@example.com', 0);

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
-- Structure de la table `owned_cameras`
--

CREATE TABLE `owned_cameras` (
  `owner_id` int(11) NOT NULL,
  `camera_id` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `owned_lenses`
--

CREATE TABLE `owned_lenses` (
  `owner_id` int(11) NOT NULL,
  `lens_id` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `used_films`
--

CREATE TABLE `used_films` (
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `camera_id` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;