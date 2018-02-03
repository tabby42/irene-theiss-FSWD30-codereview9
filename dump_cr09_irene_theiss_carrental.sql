-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 03, 2018 at 06:35 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_irene_theiss_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch_office`
--

CREATE TABLE `branch_office` (
  `id` int(10) UNSIGNED NOT NULL,
  `office_name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fk_phone_country_code_id` int(10) UNSIGNED NOT NULL,
  `phone_nr` varchar(20) NOT NULL,
  `fk_city_id` int(10) UNSIGNED NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `street_nr` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch_office`
--

INSERT INTO `branch_office` (`id`, `office_name`, `email`, `fk_phone_country_code_id`, `phone_nr`, `fk_city_id`, `street`, `street_nr`) VALUES
(1, 'Office Wien 3', 'carrental_v3@carrental.com', 1, '699/129867', 3, 'Baumgasse', '4a'),
(2, 'Office LE', 'carrental_le@carrental.com', 1, '699/1298312', 1, 'Scheibenmais', '20'),
(3, 'Office Graz Gösting', 'carrental_gg@carrental.com', 1, '699/986512', 2, 'Annagasse', '14');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `brandname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brandname`) VALUES
(1, 'VW'),
(2, 'Opel'),
(3, 'BMW'),
(4, 'Tesla');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_nr` varchar(20) NOT NULL,
  `kilometer_status` int(10) UNSIGNED NOT NULL,
  `ps` int(10) UNSIGNED NOT NULL,
  `circuit` enum('hand','automatic') DEFAULT 'hand',
  `prod_year` year(4) NOT NULL,
  `navigation_system` enum('true','false') DEFAULT 'false',
  `air_condition` enum('true','false') DEFAULT 'false',
  `num_seats` tinyint(10) NOT NULL,
  `num_doors` tinyint(5) NOT NULL,
  `price_per_day` double NOT NULL,
  `fk_model_id` int(10) UNSIGNED NOT NULL,
  `fk_brand_id` int(10) UNSIGNED NOT NULL,
  `fk_current_office_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `license_nr`, `kilometer_status`, `ps`, `circuit`, `prod_year`, `navigation_system`, `air_condition`, `num_seats`, `num_doors`, `price_per_day`, `fk_model_id`, `fk_brand_id`, `fk_current_office_id`) VALUES
(1, 'W1234', 12000, 100, 'hand', 2000, 'true', 'false', 5, 5, 85.7, 1, 1, 3),
(2, 'KO4321', 45000, 110, 'automatic', 2010, 'true', 'true', 4, 3, 99.7, 2, 2, NULL),
(3, 'G9807', 8000, 130, 'hand', 2012, 'true', 'true', 5, 5, 105.7, 3, 3, NULL),
(4, 'W9807', 14000, 100, 'automatic', 2014, 'true', 'false', 5, 5, 99.8, 4, 1, 1),
(5, 'W7765', 25000, 200, 'automatic', 2015, 'true', 'true', 5, 3, 110.8, 1, 3, 1),
(6, 'KO2243', 11000, 230, 'hand', 2016, 'true', 'true', 5, 5, 210.9, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(10) UNSIGNED NOT NULL,
  `zipcode` varchar(16) NOT NULL,
  `city_name` varchar(55) NOT NULL,
  `fk_country_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `zipcode`, `city_name`, `fk_country_id`) VALUES
(1, '2103', 'Langenzersdorf', 1),
(2, '8010', 'Graz', 1),
(3, '1030', 'Wien Landstraße', 1),
(4, '80331', 'München', 2),
(5, '1050', 'Wien Margareten', 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(8) NOT NULL,
  `country_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_code`, `country_name`) VALUES
(1, 'A', 'Austria'),
(2, 'D', 'Germany');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `salutation` enum('Ms','Mr','Mrs','Co') DEFAULT NULL,
  `firstname` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `fk_phone_country_code_id` int(10) UNSIGNED NOT NULL,
  `phone_nr` varchar(20) NOT NULL,
  `fk_city_id` int(10) UNSIGNED NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `street_nr` varchar(6) DEFAULT NULL,
  `drivers_license_nr` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `salutation`, `firstname`, `lastname`, `birthdate`, `email`, `fk_phone_country_code_id`, `phone_nr`, `fk_city_id`, `street`, `street_nr`, `drivers_license_nr`) VALUES
(1, 'Ms', 'Maria', 'Muster', '1970-12-13', 'test@gmail.com', 1, '650/676767', 2, 'Herrengasse', '5b/3', '12341234B'),
(2, 'Mr', 'Herbert', 'Herbst', '1966-04-09', 'test2@gmail.com', 1, '676/8654', 5, 'Margaretenstraße', '120/5', '43214321A'),
(3, 'Mrs', 'Ludmilla', 'Lodenmantel', '1993-10-31', 'test3@gmail.com', 1, '676/098707', 1, 'Hauptstraße', '45/7', '98769876C');

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `id` int(10) UNSIGNED NOT NULL,
  `extra_name` varchar(55) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `extra`
--

INSERT INTO `extra` (`id`, `extra_name`, `price`) VALUES
(1, 'young driver fee', 12.99),
(2, 'limitation of liability', 10.99),
(3, 'additional driver', 8.99),
(4, 'personal accident protection', 12.89),
(5, 'gasoline fee', 25.89),
(6, 'late return', 49.5),
(7, 'border crossing fee', 39.5),
(8, 'cancellation fee', 25.5);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_reservation_id` int(10) UNSIGNED NOT NULL,
  `discount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `fk_reservation_id`, `discount`) VALUES
(1, 1, 0.03),
(2, 2, 0.1);

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id` int(10) UNSIGNED NOT NULL,
  `car_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `car_type`) VALUES
(1, 'Limousine'),
(2, 'Kombi'),
(3, 'SUV'),
(4, 'Minibus');

-- --------------------------------------------------------

--
-- Table structure for table `phone_country_code`
--

CREATE TABLE `phone_country_code` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone_country_code`
--

INSERT INTO `phone_country_code` (`id`, `country_code`) VALUES
(1, '+43'),
(2, '+49');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_customer_id` int(10) UNSIGNED NOT NULL,
  `fk_car_id` int(10) UNSIGNED NOT NULL,
  `fk_pickup_office_id` int(10) UNSIGNED NOT NULL,
  `fk_return_office_id` int(10) UNSIGNED NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `pickup_time` time NOT NULL,
  `return_time` time NOT NULL,
  `cancel_date` date DEFAULT NULL,
  `is_returned` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `fk_customer_id`, `fk_car_id`, `fk_pickup_office_id`, `fk_return_office_id`, `pickup_date`, `return_date`, `pickup_time`, `return_time`, `cancel_date`, `is_returned`) VALUES
(1, 1, 1, 3, 3, '2018-01-21', '2018-01-22', '09:00:00', '12:00:00', NULL, 'true'),
(2, 2, 2, 1, 2, '2018-02-02', '2018-02-06', '10:00:00', '13:00:00', NULL, 'false'),
(3, 3, 3, 2, 3, '2018-04-02', '2018-02-07', '08:00:00', '10:00:00', NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_extra`
--

CREATE TABLE `reservation_extra` (
  `fk_reservation_id` int(10) UNSIGNED NOT NULL,
  `fk_extra_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation_extra`
--

INSERT INTO `reservation_extra` (`fk_reservation_id`, `fk_extra_id`) VALUES
(1, 2),
(1, 5),
(2, 3),
(2, 4),
(3, 1),
(3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch_office`
--
ALTER TABLE `branch_office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_branch_office__phone_country_code` (`fk_phone_country_code_id`),
  ADD KEY `fk_branch_office_city` (`fk_city_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_car_model` (`fk_model_id`),
  ADD KEY `fk_car_brand` (`fk_brand_id`),
  ADD KEY `fk_car__branch_office` (`fk_current_office_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_city_country` (`fk_country_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer__phone_country_code` (`fk_phone_country_code_id`),
  ADD KEY `fk_customer_city` (`fk_city_id`);

--
-- Indexes for table `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_invoice_reservation` (`fk_reservation_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_country_code`
--
ALTER TABLE `phone_country_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservation_customer` (`fk_customer_id`),
  ADD KEY `fk_reservation_car` (`fk_car_id`),
  ADD KEY `fk_reservation__branch_office_pickup` (`fk_pickup_office_id`),
  ADD KEY `fk_reservation__branch_office_return` (`fk_return_office_id`);

--
-- Indexes for table `reservation_extra`
--
ALTER TABLE `reservation_extra`
  ADD PRIMARY KEY (`fk_reservation_id`,`fk_extra_id`),
  ADD KEY `fk_reservation_extra__extra` (`fk_extra_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch_office`
--
ALTER TABLE `branch_office`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `extra`
--
ALTER TABLE `extra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `phone_country_code`
--
ALTER TABLE `phone_country_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch_office`
--
ALTER TABLE `branch_office`
  ADD CONSTRAINT `fk_branch_office__phone_country_code` FOREIGN KEY (`fk_phone_country_code_id`) REFERENCES `phone_country_code` (`id`),
  ADD CONSTRAINT `fk_branch_office_city` FOREIGN KEY (`fk_city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `fk_car__branch_office` FOREIGN KEY (`fk_current_office_id`) REFERENCES `branch_office` (`id`),
  ADD CONSTRAINT `fk_car_brand` FOREIGN KEY (`fk_brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `fk_car_model` FOREIGN KEY (`fk_model_id`) REFERENCES `model` (`id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_country` FOREIGN KEY (`fk_country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer__phone_country_code` FOREIGN KEY (`fk_phone_country_code_id`) REFERENCES `phone_country_code` (`id`),
  ADD CONSTRAINT `fk_customer_city` FOREIGN KEY (`fk_city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_invoice_reservation` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation__branch_office_pickup` FOREIGN KEY (`fk_pickup_office_id`) REFERENCES `branch_office` (`id`),
  ADD CONSTRAINT `fk_reservation__branch_office_return` FOREIGN KEY (`fk_return_office_id`) REFERENCES `branch_office` (`id`),
  ADD CONSTRAINT `fk_reservation_car` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`id`),
  ADD CONSTRAINT `fk_reservation_customer` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `reservation_extra`
--
ALTER TABLE `reservation_extra`
  ADD CONSTRAINT `fk_reservation_extra__extra` FOREIGN KEY (`fk_extra_id`) REFERENCES `extra` (`id`),
  ADD CONSTRAINT `fk_reservation_extra__reseravtion` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
