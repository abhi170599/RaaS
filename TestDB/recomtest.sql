-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2020 at 11:11 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recomtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `Title` varchar(50) COLLATE utf8_bin NOT NULL,
  `Tags` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `Title`, `Tags`) VALUES
(1, 'Avengers : Endgame', 'Marvel,Action,Sci-Fi,Superheroes'),
(2, 'Ironman 1', 'Marvel,Action,Sci-Fi,Superheroes'),
(3, 'Avengers : Infinity War', 'Marvel,Action,Sci-Fi,Superheroes'),
(4, 'Ironman 2', 'Marvel,Action,Sci-Fi,Superheroes'),
(5, 'Intersteller', 'Spcae,Sci-Fi,Adventure'),
(6, 'Kungfu-Panda', 'Dreamworks,Animated,Kung-fu'),
(7, 'Titanic', 'Romantic,Historic'),
(8, 'Avengers : Age of Ultron', 'Marvel,Action,Sci-Fi,Superheroes'),
(9, 'Cars', 'Disney,Animated,Racing,Action'),
(10, 'Avengers', 'Marvel,Action,Sci-Fi,Superheroes');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `movie_id`, `rating`) VALUES
(121, 5, 3, 4),
(122, 1, 8, 1),
(123, 9, 5, 5),
(124, 10, 1, 5),
(125, 6, 1, 1),
(126, 4, 9, 5),
(127, 2, 9, 2),
(128, 6, 9, 2),
(129, 9, 10, 3),
(130, 5, 9, 3),
(131, 8, 10, 4),
(132, 6, 4, 5),
(133, 7, 1, 1),
(134, 5, 2, 5),
(135, 2, 2, 4),
(136, 9, 2, 5),
(137, 8, 10, 5),
(138, 10, 7, 3),
(139, 5, 2, 3),
(140, 2, 4, 1),
(141, 5, 3, 2),
(142, 2, 8, 1),
(143, 7, 6, 2),
(144, 9, 7, 2),
(145, 8, 9, 3),
(146, 3, 1, 1),
(147, 5, 6, 4),
(148, 7, 4, 3),
(149, 3, 8, 3),
(150, 5, 8, 5),
(151, 6, 3, 2),
(152, 5, 1, 4),
(153, 4, 1, 2),
(154, 4, 9, 1),
(155, 4, 5, 1),
(156, 7, 5, 5),
(157, 4, 9, 2),
(158, 7, 2, 2),
(159, 4, 10, 4),
(160, 10, 10, 3),
(161, 2, 10, 5),
(162, 10, 10, 2),
(163, 3, 10, 4),
(164, 10, 1, 1),
(165, 8, 1, 3),
(166, 6, 4, 5),
(167, 6, 5, 3),
(168, 7, 10, 3),
(169, 5, 7, 4),
(170, 5, 9, 3),
(171, 2, 3, 4),
(172, 3, 6, 3),
(173, 2, 5, 5),
(174, 1, 5, 5),
(175, 7, 4, 2),
(176, 2, 8, 3),
(177, 9, 7, 2),
(178, 6, 6, 3),
(179, 4, 10, 5),
(180, 3, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8_bin NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` varchar(1) COLLATE utf8_bin NOT NULL,
  `Occupation` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Name`, `Age`, `Gender`, `Occupation`) VALUES
(1, 'User 1', 21, 'M', 'Student'),
(2, 'User 2', 40, 'F', 'Software Developer'),
(3, 'User 3', 19, 'M', 'Student'),
(4, 'User 4', 30, 'F', 'Designer'),
(5, 'User 5', 25, 'F', 'Businessman'),
(6, 'User 6', 27, 'M', 'Student'),
(7, 'User 7', 21, 'M', 'Student'),
(8, 'User 8', 21, 'M', 'Student'),
(9, 'User 9', 21, 'M', 'Student'),
(10, 'User 10', 21, 'M', 'Student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
