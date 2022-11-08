-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 07, 2022 at 05:24 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dinemate`
--

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
CREATE TABLE IF NOT EXISTS `dishes` (
  `dish_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `netPrice` double NOT NULL,
  `sellingPrice` double NOT NULL,
  `description` text NOT NULL,
  `prepTime` int(11) NOT NULL,
  `image_url` text,
  PRIMARY KEY (`dish_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`dish_id`, `name`, `netPrice`, `sellingPrice`, `description`, `prepTime`, `image_url`) VALUES
(1, 'Garlic Bread', 500, 700, 'Beats just bread', 30, NULL),
(2, 'Pizza', 800, 1000, 'Baked Dough', 60, NULL),
(4, 'Biriyani', 500, 700, 'An Indian rice', 30, NULL),
(5, 'Chocolate Gateau', 2000, 2500, 'Delicious Cake', 120, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `user_email` text NOT NULL,
  `user_pwd` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_email`, `user_pwd`) VALUES
(3, 'Dineth', 'dd@xmail.com', '$2y$10$OT5cnWG3vxO5oDxJEcTPOuiSwjWnmJNP61s2kJCAg9ss4kSS1c8ua'),
(6, 'Banner', 'bh@xmail.com', '$2y$10$RoFPqEjAKpSteE4D6zlsC.drNvVd.Tezz.vDazxAR2uCeXfvHWfVa'),
(9, 'Natasha', 'bw@xmail.com', '$2y$10$Oo5Z48PD34XDHFF25Zl46.yhUWs/SRn2gsMH85bNkcR81T11QQTeu');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
