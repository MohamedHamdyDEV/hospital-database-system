-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2020 at 04:34 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `massages`
--

CREATE TABLE `massages` (
  `ID` int(11) NOT NULL,
  `MASS_BODY` varchar(150) NOT NULL,
  `MASS_DATE` date NOT NULL,
  `FROM_USER` int(11) NOT NULL,
  `TO_USER` int(11) NOT NULL,
  `PATIENT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `massages`
--

INSERT INTO `massages` (`ID`, `MASS_BODY`, `MASS_DATE`, `FROM_USER`, `TO_USER`, `PATIENT_ID`) VALUES
(4, 'mmmmm', '0000-00-00', 1, 2, 620001),
(5, 'please send to me report for this patient', '0000-00-00', 1, 2, 620001),
(7, 'please send to me report for this patient', '2020-06-11', 1, 2, 620001);

-- --------------------------------------------------------

--
-- Table structure for table `patient_inf`
--

CREATE TABLE `patient_inf` (
  `ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(80) NOT NULL,
  `SECOND_NAME` varchar(80) NOT NULL,
  `ADDRESS` varchar(80) NOT NULL,
  `PHONE` varchar(80) NOT NULL,
  `EMAIL` varchar(80) NOT NULL,
  `AGE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_inf`
--

INSERT INTO `patient_inf` (`ID`, `FIRST_NAME`, `SECOND_NAME`, `ADDRESS`, `PHONE`, `EMAIL`, `AGE`) VALUES
(620001, 'Juan', 'ali', 'alex', '+201019757942', 'mo21@gmail.com', 50),
(53000121, 'mohamedv', 'aliv', 'cairo', '+201019757922', 'mo31@gmail.com', 30),
(2147483647, 'mohamed', 'ali', 'kafr el sheikh', '+201019757942', ' mo455@gmail.com ', 60);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `USER_TYPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `USER_NAME`, `PASSWORD`, `USER_TYPE`) VALUES
(1, 'khaled1234', '111223344', 2),
(2, 'ali54321', '11223344', 2),
(3, 'mohsen1234', '111223344', 4),
(4, 'ahmed548', '111223344', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE `users_details` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(80) NOT NULL,
  `SECOND_NAME` varchar(80) NOT NULL,
  `AGE` int(11) NOT NULL,
  `PHONE` varchar(80) NOT NULL,
  `EMAIL` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_details`
--

INSERT INTO `users_details` (`ID`, `USER_ID`, `FIRST_NAME`, `SECOND_NAME`, `AGE`, `PHONE`, `EMAIL`) VALUES
(5, 2, 'mohamed ', 'hossam', 20, '+201019757966', 'mohamedhossam12@gmail.com'),
(6, 1, 'khaled ', 'hamdy ', 35, '+201019757988', 'khaledhamdy@gmail.com'),
(7, 3, 'mohsen ', 'mohamed ', 41, '+201019757955', 'mohsen mohamed@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users_type`
--

CREATE TABLE `users_type` (
  `ID` int(11) NOT NULL,
  `TYPE` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_type`
--

INSERT INTO `users_type` (`ID`, `TYPE`) VALUES
(1, 'admin'),
(2, 'doctor'),
(3, 'nurse'),
(4, 'manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `massages`
--
ALTER TABLE `massages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FROM_USER` (`FROM_USER`),
  ADD KEY `TO_USER` (`TO_USER`),
  ADD KEY `PATIENT_ID` (`PATIENT_ID`);

--
-- Indexes for table `patient_inf`
--
ALTER TABLE `patient_inf`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USER_TYPE` (`USER_TYPE`);

--
-- Indexes for table `users_details`
--
ALTER TABLE `users_details`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `users_type`
--
ALTER TABLE `users_type`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `massages`
--
ALTER TABLE `massages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users_details`
--
ALTER TABLE `users_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users_type`
--
ALTER TABLE `users_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `massages`
--
ALTER TABLE `massages`
  ADD CONSTRAINT `massages_ibfk_2` FOREIGN KEY (`FROM_USER`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `massages_ibfk_3` FOREIGN KEY (`TO_USER`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `massages_ibfk_4` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient_inf` (`ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`USER_TYPE`) REFERENCES `users_type` (`ID`);

--
-- Constraints for table `users_details`
--
ALTER TABLE `users_details`
  ADD CONSTRAINT `users_details_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
