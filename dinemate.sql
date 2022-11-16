-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2022 at 01:53 PM
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Drinks'),
(2, 'Spices'),
(3, 'Grains'),
(4, 'Vegetables'),
(5, 'Fruits');

-- --------------------------------------------------------

--
-- Table structure for table `current_stocks`
--

DROP TABLE IF EXISTS `current_stocks`;
CREATE TABLE IF NOT EXISTS `current_stocks` (
  `purchase_id` int(11) NOT NULL,
  `amount_remaining` double NOT NULL,
  `last_updated` date NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `current_stocks`
--

INSERT INTO `current_stocks` (`purchase_id`, `amount_remaining`, `last_updated`) VALUES
(1, 20, '2022-11-02');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`dish_id`, `name`, `netPrice`, `sellingPrice`, `description`, `prepTime`, `image_url`) VALUES
(16, 'Salad', 400, 800, 'Healthy food', 20, 'uploads/dishes/Salad2022_11_08_08_46_07.jpg'),
(17, 'Pizza', 900, 1000, 'Baked Dough', 60, 'uploads/dishes/Pizza2022_11_08_10_37_43.jpg'),
(20, 'Egg Biriyani', 400, 500, 'Indian Rice', 30, 'uploads/dishes/EggBiriyani2022_11_08_10_47_15.jpg'),
(21, 'Chocolate Gateau', 1500, 2000, 'Good cake', 120, 'uploads/dishes/ChocolateGateau2022_11_08_10_57_34.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `salary` double NOT NULL,
  `contactNo` text NOT NULL,
  `NIC` text NOT NULL,
  `dateEmployed` date NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `name`, `salary`, `contactNo`, `NIC`, `dateEmployed`, `role`) VALUES
(1, 'Janet Pym', 100000, '0724573075', '1234567890', '2012-11-09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `dish_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`dish_id`,`item_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`dish_id`, `item_id`, `quantity`) VALUES
(20, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `brand` text,
  `description` text,
  `unit` int(50) NOT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `unit` (`unit`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `name`, `brand`, `description`, `unit`, `category`) VALUES
(2, 'Dhal', 'SMAK', 'always keep at hand', 1, 3),
(3, 'Carrots', NULL, 'orange long cone', 1, 4),
(4, 'Brinjals', NULL, ';)', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
CREATE TABLE IF NOT EXISTS `menuitems` (
  `menu_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  KEY `dish_id` (`dish_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menuitems`
--

INSERT INTO `menuitems` (`menu_id`, `dish_id`) VALUES
(1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `imageurl` text,
  `allday` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `name`, `description`, `startTime`, `endTime`, `imageurl`, `allday`) VALUES
(1, 'Indian', 'Good, spicy, flavoured foods', NULL, NULL, 'x', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `Quantity` double NOT NULL,
  `vendor` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `cost` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `final_price` double NOT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `vendor` (`vendor`),
  KEY `item` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchase_id`, `item`, `Quantity`, `vendor`, `purchase_date`, `expiry_date`, `cost`, `discount`, `final_price`) VALUES
(1, 2, 20, 1, '2022-11-09', '2023-03-03', 7000, 0.1, 6300);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role`) VALUES
(1, 'Chef'),
(2, 'General Manager'),
(3, 'Cashier'),
(4, 'Inventory Manager');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `unit_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `name`) VALUES
(1, 'kg'),
(2, 'grams'),
(3, 'ml'),
(4, 'litres'),
(5, 'packets'),
(6, 'bottles');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_email`, `user_pwd`) VALUES
(3, 'Dineth', 'dd@xmail.com', '$2y$10$OT5cnWG3vxO5oDxJEcTPOuiSwjWnmJNP61s2kJCAg9ss4kSS1c8ua'),
(6, 'Banner', 'bh@xmail.com', '$2y$10$RoFPqEjAKpSteE4D6zlsC.drNvVd.Tezz.vDazxAR2uCeXfvHWfVa'),
(9, 'Natasha', 'bw@xmail.com', '$2y$10$Oo5Z48PD34XDHFF25Zl46.yhUWs/SRn2gsMH85bNkcR81T11QQTeu');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `contactNo` varchar(50) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_id`, `name`, `address`, `company`, `contactNo`) VALUES
(1, 'Lana', 'Madrid, Spain', 'Rhoedes Inc.', '0724573075');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `current_stocks`
--
ALTER TABLE `current_stocks`
  ADD CONSTRAINT `current_stocks_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`purchase_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`);

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ingredients_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `units` (`unit_id`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`category`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`),
  ADD CONSTRAINT `menuitems_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`vendor`) REFERENCES `vendors` (`vendor_id`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
