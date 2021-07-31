-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 04:51 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_donation`
--

CREATE TABLE `tbl_donation` (
  `Donation_ID` int(11) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Zip_Code` varchar(10) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Donation_Category` varchar(50) NOT NULL,
  `Donation_Quantity` int(255) DEFAULT NULL,
  `Amount` mediumtext NOT NULL,
  `Frequency` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_donation`
--

INSERT INTO `tbl_donation` (`Donation_ID`, `First_Name`, `Last_Name`, `Address`, `User_ID`, `City`, `State`, `Zip_Code`, `Country`, `Donation_Category`, `Donation_Quantity`, `Amount`, `Frequency`) VALUES
(5, 'Shital', 'Kumari', 'Sumerpur', 4, 'Sumerpur', 'Rajasthan', '306902', 'India', 'Money', NULL, '100', 'Once'),
(6, 'Komal', 'rathore', 'Suzuki', 2, 'Sheoganj', 'rajasthan', '306902', 'IN', 'Money', NULL, '100', 'weekly');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `ID` int(11) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Phone_No` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `User_Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_registration`
--

INSERT INTO `tbl_registration` (`ID`, `First_Name`, `Last_Name`, `Email`, `Phone_No`, `Address`, `Password`, `User_Type`) VALUES
(2, 'dheeraj', 'parmar', 'dheerajparmar777@gmail.com', '9982743247', 'sumerpur', 'dheeraj123', 'Customer'),
(3, 'Hitesh', 'Kumar', '1042180893@gmail.com', '6377084075', 'Sumerpur', 'hgk2328#', 'Admin'),
(4, 'ankit', 'rathore', 'ankitrathore777@gmail.com', '1234567890', 'Sumerpur', 'ankit123', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_donation`
--
ALTER TABLE `tbl_donation`
  ADD PRIMARY KEY (`Donation_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_donation`
--
ALTER TABLE `tbl_donation`
  MODIFY `Donation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_donation`
--
ALTER TABLE `tbl_donation`
  ADD CONSTRAINT `User_ID` FOREIGN KEY (`User_ID`) REFERENCES `tbl_registration` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
