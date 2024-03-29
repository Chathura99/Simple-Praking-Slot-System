-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 09, 2024 at 03:26 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parking_system`
--
CREATE DATABASE IF NOT EXISTS `parking_system` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `parking_system`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `slot_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `nic_number` varchar(15) NOT NULL,
  `car_number` varchar(15) NOT NULL,
  `booking_time` datetime DEFAULT NULL,
  `payment_status` enum('pending','completed') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `slot_id` (`slot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `slot_id`, `name`, `mobile_number`, `nic_number`, `car_number`, `booking_time`, `payment_status`) VALUES
(11, 1, 3, 'Chathura ', '0702244584', '999999999v', 'NW-7895', '2024-03-02 18:30:53', 'pending'),
(10, 3, 2, 'Madhura', '0712255485', '995995995v', 'NW-1234', '2024-03-02 18:28:37', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `parking_history`
--

DROP TABLE IF EXISTS `parking_history`;
CREATE TABLE IF NOT EXISTS `parking_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `booking_time` datetime NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `slot_id` (`slot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parking_history`
--

INSERT INTO `parking_history` (`id`, `user_id`, `slot_id`, `booking_time`, `payment_status`) VALUES
(1, 3, 2, '2024-03-02 18:28:37', 'paid'),
(2, 1, 3, '2024-03-02 18:30:53', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

DROP TABLE IF EXISTS `slots`;
CREATE TABLE IF NOT EXISTS `slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot_number` int(11) NOT NULL,
  `status` enum('available','booked') DEFAULT 'available',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`id`, `slot_number`, `status`) VALUES
(1, 1, 'available'),
(2, 2, 'booked'),
(3, 3, 'booked'),
(4, 4, 'available'),
(5, 5, 'available'),
(6, 6, 'available'),
(7, 7, 'available'),
(8, 8, 'available'),
(9, 9, 'available'),
(10, 10, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'chathura', '$2y$10$KJFYlM6DHvntklrr0sIqLOi4z.ZY.W/2m03xX0q/pYrdrtTixif9.', 'user'),
(2, 'admin', '$2y$10$ucnQwQyiI9fZuurNCTrNweRoWSB70XyDDsgVshGH1X3WXrlLGwJmy', 'admin'),
(3, 'madhura', '$2y$10$2vzvzsC3LnTHaE.rU4o8Vu3optIKZBkO.CP/.r9o.jhOOGrEt51za', 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
