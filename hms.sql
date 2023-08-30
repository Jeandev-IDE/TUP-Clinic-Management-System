-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 02:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'password', '16-06-2023 01:08:41 PM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`) VALUES
(1, 'ENT', 1, 1, 500, '2022-11-10', '12:45 PM', '2022-11-06 12:21:48', 1, 0, '2022-11-06 12:23:35'),
(2, 'ENT', 1, 2, 500, '2022-11-17', '7:00 PM', '2022-11-06 13:16:18', 1, 1, NULL),
(3, 'Burger Steak', 0, 3, 0, '2023-06-02', '8:00 PM', '2023-06-01 12:00:45', 1, 1, NULL),
(4, 'Burger Steak', 4, 3, 500, '2023-06-02', '8:15 AM', '2023-06-01 12:07:05', 1, 1, NULL),
(5, 'Burger Steak', 8, 8, 500, '2023-06-17', '12:30 PM', '2023-06-14 04:31:37', 0, 1, '2023-06-14 04:52:08'),
(6, 'Burger Steak', 8, 8, 500, '2023-06-14', '12:54 PM', '2023-06-14 04:53:33', 1, 1, NULL),
(7, 'Radiology', 6, 3, 500, '2023-06-13', '1:15 PM', '2023-06-15 05:08:05', 1, 1, NULL),
(8, 'Programmer', 10, 8, 1500, '2023-06-13', '11:15 PM', '2023-06-16 11:01:52', 1, 1, NULL),
(9, 'Psychologist', 9, 9, 789, '2023-06-21', '10:30 PM', '2023-06-16 11:18:26', 1, 1, NULL),
(10, 'Programmer', 10, 10, 1500, '2023-06-23', '10:45 PM', '2023-06-20 14:45:24', 1, 1, NULL),
(11, 'Programmer', 10, 11, 1500, '2023-06-30', '1:45 PM', '2023-06-20 17:34:29', 1, 1, NULL),
(12, 'Programmer', 12, 12, 1500, '2023-06-24', '1:30 AM', '2023-06-20 19:11:08', 1, 1, NULL),
(13, 'Diagnostic radiology', 11, 13, 0, '2023-06-23', '4:00 AM', '2023-06-20 19:57:26', 1, 1, NULL),
(14, 'Diagnostic radiology', 11, 13, 0, '2023-06-29', '5:15 AM', '2023-06-20 21:11:14', 1, 1, NULL),
(15, 'Diagnostic radiology', 11, 14, 0, '2023-06-30', '3:30 PM', '2023-06-21 07:19:18', 0, 1, '2023-06-21 07:22:23'),
(16, 'Diagnostic radiology', 11, 15, 0, '2023-06-29', '10:00 PM', '2023-06-21 14:00:39', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(9, 'Psychologist', 'Pam Kimmy', 'Cavite laguna st. barangay Laspinas metro subway phillippines station one ', '789 student meal', 9233127311, 'SalamatDocPam@gmail.com', '9b39dd75fd8db2204e291b2c0c6abc96', '2023-06-16 09:29:50', '2023-06-16 09:34:38'),
(10, 'Programmer', 'Denisse Shells', 'Block 6 Lot 9 Nebula Homes, Baclaran Street, Brgy. Poblacion Cavite City hall Manila', '1500 student meal', 923131372, 'DocrammerDenissels@gmail.com', '3920bdbd4c000dd392e2501e89747173', '2023-06-16 09:34:07', '0000-00-00 00:00:00'),
(11, 'Diagnostic radiology', 'Doc Ysa Frilan Galang', 'Antipolo Rizal ', '0.00', 63923173213, 'DocYsa@gmail.com', '5dc02296a6dd7bbe7501a3ca72892ef1', '2023-06-20 13:50:34', '2023-06-20 19:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(37, 9, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 10:57:48', '16-06-2023 04:28:26 PM', 1),
(38, 10, 'DocrammerDenissels@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:03:12', '16-06-2023 04:40:44 PM', 1),
(39, NULL, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:15:30', NULL, 0),
(40, NULL, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:15:39', NULL, 0),
(41, 9, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:15:54', '16-06-2023 04:46:12 PM', 1),
(42, NULL, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:19:02', NULL, 0),
(43, 9, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:19:11', '16-06-2023 04:51:20 PM', 1),
(44, NULL, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:23:58', NULL, 0),
(45, 9, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:24:04', NULL, 1),
(46, NULL, 'ssa', 0x3a3a3100000000000000000000000000, '2023-06-16 11:25:58', NULL, 0),
(47, NULL, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 14:43:29', NULL, 0),
(48, 11, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 14:43:36', '20-06-2023 08:14:44 PM', 1),
(49, 11, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 14:45:52', '20-06-2023 08:16:10 PM', 1),
(50, 10, 'DocrammerDenissels@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 14:46:19', '20-06-2023 08:18:52 PM', 1),
(51, 11, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 15:08:52', '20-06-2023 08:39:01 PM', 1),
(52, 10, 'DocrammerDenissels@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 15:09:28', '20-06-2023 08:40:27 PM', 1),
(53, NULL, 'DocrammerDenissels@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 15:11:26', NULL, 0),
(54, NULL, 'DocrammerDenissels@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 15:11:41', NULL, 0),
(55, 10, 'DocrammerDenissels@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 15:11:48', NULL, 1),
(56, 9, 'SalamatDocPam@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 17:27:59', '20-06-2023 10:58:24 PM', 1),
(57, 10, 'DocrammerDenissels@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 17:35:18', NULL, 1),
(58, NULL, 'baralskie@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:11:23', NULL, 0),
(59, 12, 'Baralskie@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:11:41', '21-06-2023 12:42:07 AM', 1),
(60, 12, 'Baralskie@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:13:03', '21-06-2023 12:43:35 AM', 1),
(61, 12, 'Baralskie@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:13:41', '21-06-2023 12:46:17 AM', 1),
(62, 12, 'Baralskie@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:16:48', '21-06-2023 12:48:23 AM', 1),
(63, 12, 'Baralskie@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:18:55', NULL, 1),
(64, 11, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:53:04', '21-06-2023 01:23:27 AM', 1),
(65, 11, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:57:46', '21-06-2023 01:30:05 AM', 1),
(66, 11, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 20:00:08', '21-06-2023 01:40:21 AM', 1),
(67, 11, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-21 07:09:57', NULL, 1),
(68, 11, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-21 14:01:43', '21-06-2023 07:40:58 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(20, 'Programmer', '2023-06-16 09:22:18', NULL),
(21, 'Psychologist', '2023-06-16 09:24:39', NULL),
(22, 'Government', '2023-06-16 09:25:24', '2023-06-16 09:25:52'),
(23, 'Diagnostic radiology', '2023-06-20 13:47:10', NULL),
(24, 'Emergency medicine', '2023-06-20 13:47:23', NULL),
(25, 'Family medicine', '2023-06-20 13:47:29', NULL),
(26, 'Internal medicine', '2023-06-20 13:47:38', NULL),
(27, 'Medical genetics', '2023-06-20 13:47:44', NULL),
(28, 'Neurology', '2023-06-20 13:47:51', NULL),
(29, 'Obstetrics and gynecology', '2023-06-20 13:47:59', NULL),
(30, 'Ophthalmology', '2023-06-20 13:48:05', NULL),
(31, 'Pathology', '2023-06-20 13:48:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(1, 'Anuj kumar', 'anujk30@test.com', 1425362514, 'This is for testing purposes.   This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.', '2022-10-30 16:52:03', 'pak you', '2023-06-16 10:39:52', 1),
(2, 'Anuj kumar', 'ak@gmail.com', 1111122233, 'This is for testing', '2022-11-06 13:13:41', 'Contact the patient', '2022-11-06 13:13:57', 1),
(3, 'rommel', 'rommel123@gmail.com', 9231317231, 'iiwan na namin kayo sa groupings pam kaya nyo yan malaki na kayo', '2023-06-03 09:41:39', 'ok', '2023-06-16 08:39:53', 1),
(4, 'Clive I Oximana', 'hello@gmail.com', 253013001, 'hello', '2023-06-14 04:56:59', '\'', '2023-06-20 19:50:11', 1),
(5, 'Clive I Oximana', 'Burgersteaksavilliongco@asim.com', 9231317231, 'saan kana bren', '2023-06-15 04:43:05', './.', '2023-06-20 19:49:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

CREATE TABLE `tblmedicalhistory` (
  `ID` int(10) NOT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `CreationDate`) VALUES
(1, 1, '80/120', '120', '85', '98', 'Test', '2022-11-06 13:19:41'),
(2, 2, '100', '50', '50', '1000', '1hour na tulog every day tas isang pirasong saging ', '2023-06-14 05:04:01'),
(3, 4, '4000', '50% wash', '8FT', '39', 'pumunta para humingi ng sagot sa groupo nila ayaw tumulong sa programming at ang dami gusto ipagawa lets gooo \r\n-brenn', '2023-06-16 11:06:32'),
(4, 0, '122', '50', '150', '28', 'may hikaa', '2023-06-20 19:21:54'),
(5, 0, '122', '90', '190', '39', 'may saket', '2023-06-21 07:11:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT current_timestamp(),
  `OpenningTime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `OpenningTime`) VALUES
(1, 'aboutus', 'About Us', 'Welcome to the Technological University of the Philippines (TUP) Clinic! We are dedicated to providing high-quality healthcare services to the TUP community, including students, faculty, and staff. Our clinic is committed to promoting the overall well-being of individuals and fostering a healthy campus environment.\r\n\r\nAt TUP Clinic, we have a team of experienced and compassionate healthcare professionals who are dedicated to delivering exceptional medical care. Our staff includes doctors, nurses, and support personnel who are well-versed in addressing a wide range of health concerns.<div><br></div><div>The TUP Clinic is committed to promoting health education and awareness within the university community.&nbsp; We value your feedback and strive to continuously improve our services. If you have any suggestions or concerns, please do not hesitate to<img>&nbsp;reach out to us. Your satisfaction and well-being are our top priorities. Thank you for choosing the TUP Clinic for your healthcare needs. We look forward to serving you and helping you achieve and maintain optimal health throughout your journey at the Technological University of the Philippines.</div>', NULL, NULL, '2020-05-20 07:21:52', NULL),
(2, 'contactus', 'Contact Details', '<font color=\"#ffffff\"><span style=\"font-family: Roboto, sans-serif; font-size: 16px;\">Technological University of the Philippines </span><font face=\"Roboto, sans-serif\"><span style=\"font-size: 16px;\">&nbsp;Ayala Boulevard Ermita Metro Manila</span></font></font>', 'Tup@tup.edu.ph', 253013001, '2020-05-20 07:24:07', '9 am To 8 Pm');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE `tblpatient` (
  `ID` int(10) NOT NULL,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext DEFAULT NULL,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `CreationDate`, `UpdationDate`) VALUES
(1, 1, 'Amit Kumar', 1231231230, 'amitk@gmail.com', 'male', 'New Delhi india', 35, 'NA', '2022-11-06 13:18:31', NULL),
(2, 8, 'Clive', 1234567, 'Burgersteaksavilliongco@asim.com', 'male', '232 Viliongco Street Barangay Commonwealth', 21, 'None', '2023-06-14 04:39:24', NULL),
(3, 8, 'Clive', 1234567, 'Burgersteaksavilliongco1@asim.com', 'male', '232 Viliongco Street Barangay Commonwealth', 21, 'May cancer', '2023-06-14 05:01:16', NULL),
(4, 10, 'Bren cruss', 93213172, 'Bren@gmail.com', 'Male', '232 munting kunting sa lupa barangay saan si pedro Quezon Ave Davao City', 32, 'nag patuli', '2023-06-16 11:04:20', '2023-06-16 11:06:53'),
(5, 12, 'patricsy', 9231231, 'sndjandjn@gmail.com', 'female', 'Antipolo Rizal', 29, 'may trust issue', '2023-06-20 19:22:50', NULL),
(6, 11, 'Gab', 92318312, 'Gab@gmail.com', 'male', '189 Canada USA chinatown Metro manila', 23, 'nacutetan kay doc', '2023-06-21 14:04:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image_url` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `user_id`, `image_url`) VALUES
(1, 12, 'IMG-6491fb13cb3c02.38776707.jpg'),
(2, 12, 'IMG-6491fb17e36189.21236250.jpg'),
(3, 12, 'IMG-6491fb938b14c9.53920085.jpg'),
(4, 12, 'IMG-6491fb97d018a4.90586555.jpg'),
(5, 13, 'IMG-6492a345e1a9d6.82692874.png'),
(6, 14, 'IMG-6492a48aba3365.59951380.jpg'),
(7, 15, 'IMG-649303a7afbfc2.97097231.jpg'),
(8, 15, 'IMG-649303ed6c0d61.96405174.jpg'),
(9, 13, 'IMG-64930734af8468.21144802.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(23, NULL, 'jassal@gmaii.com', 0x3a3a3100000000000000000000000000, '2023-06-16 10:53:23', NULL, 0),
(24, NULL, 'jassal@gmaii.com', 0x3a3a3100000000000000000000000000, '2023-06-16 10:53:34', NULL, 0),
(25, NULL, 'jassal@gmaii.com', 0x3a3a3100000000000000000000000000, '2023-06-16 10:54:43', NULL, 0),
(26, NULL, 'jassal@gmaii.com', 0x3a3a3100000000000000000000000000, '2023-06-16 10:55:53', NULL, 0),
(27, NULL, 'jassal@gmaii.com', 0x3a3a3100000000000000000000000000, '2023-06-16 10:57:10', NULL, 0),
(28, NULL, 'jassal@gmaii.com', 0x3a3a3100000000000000000000000000, '2023-06-16 10:57:17', NULL, 0),
(29, NULL, 'jassal@gmaii.com', 0x3a3a3100000000000000000000000000, '2023-06-16 10:58:39', NULL, 0),
(30, 8, 'HITea@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:01:11', '16-06-2023 04:32:07 PM', 1),
(31, 8, 'HITea@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:13:46', '16-06-2023 04:44:51 PM', 1),
(32, 9, 'clive@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:17:59', '16-06-2023 04:48:47 PM', 1),
(33, 9, 'clive@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:21:39', '16-06-2023 04:54:36 PM', 1),
(34, 8, 'HITea@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:44:30', '16-06-2023 05:14:53 PM', 1),
(35, 8, 'HITea@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 11:46:53', NULL, 1),
(36, 8, 'HITea@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-16 12:05:09', NULL, 1),
(37, NULL, 'Jean', 0x3a3a3100000000000000000000000000, '2023-06-20 13:30:10', NULL, 0),
(38, NULL, 'Jean', 0x3a3a3100000000000000000000000000, '2023-06-20 13:30:19', NULL, 0),
(39, 10, 'Jean@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 13:30:57', '20-06-2023 07:01:32 PM', 1),
(40, 10, 'Jean@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 14:42:09', '20-06-2023 08:12:44 PM', 1),
(41, 10, 'Jean@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 14:44:53', '20-06-2023 08:15:40 PM', 1),
(42, 10, 'Jean@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 14:54:13', NULL, 1),
(43, 10, 'Jean@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 15:07:32', '20-06-2023 08:38:44 PM', 1),
(44, 10, 'Jean@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 15:10:33', '20-06-2023 10:57:50 PM', 1),
(45, NULL, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 17:31:52', NULL, 0),
(46, NULL, 'DocYsa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 17:32:22', NULL, 0),
(47, 11, 'Christian@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 17:34:17', '20-06-2023 11:04:32 PM', 1),
(48, 12, 'Roseann@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:09:02', '21-06-2023 12:39:22 AM', 1),
(49, 12, 'Roseann@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:10:53', '21-06-2023 12:41:11 AM', 1),
(50, 12, 'Roseann@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:12:19', '21-06-2023 12:42:54 AM', 1),
(51, 12, 'Roseann@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:16:24', '21-06-2023 12:46:41 AM', 1),
(52, 12, 'Roseann@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:18:31', '21-06-2023 12:48:49 AM', 1),
(53, 12, 'Roseann@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:20:18', NULL, 1),
(54, 13, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 19:57:03', '21-06-2023 01:27:39 AM', 1),
(55, NULL, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 20:05:05', NULL, 0),
(56, NULL, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 20:05:13', NULL, 0),
(57, NULL, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 20:05:39', NULL, 0),
(58, 13, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 20:05:47', '21-06-2023 01:36:02 AM', 1),
(59, 13, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 20:07:07', '21-06-2023 01:41:14 AM', 1),
(60, NULL, 'rSD', 0x3a3a3100000000000000000000000000, '2023-06-20 20:12:03', NULL, 0),
(61, 13, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 21:10:47', NULL, 1),
(62, 13, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 21:10:58', NULL, 1),
(63, NULL, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-21 07:12:27', NULL, 0),
(64, 13, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-21 07:12:31', '21-06-2023 12:48:15 PM', 1),
(65, 14, 'Brenden@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-21 07:19:05', NULL, 1),
(66, 15, 'Brentulfo@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-21 13:59:33', NULL, 1),
(67, 13, 'Rommel@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-21 14:20:28', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(7, 'Jassal', 'Tondo mundo street fighter barangay Manila metro subway station tondo JJ king apartment', 'Metro Manila subway system', 'male', 'Jassal@gmail.com', '482c811da5d5b4bc6d497ffa98491e38', '2023-06-16 10:55:43', '2023-06-16 10:57:05'),
(8, 'Alek sandro', '232 munting kunting sa lupa barangay saan si pedro Quezon Ave Davao City', 'Davao Nation City', 'male', 'HITea@gmail.com', 'e553f309eb66d4f43463eb806b1d2ac5', '2023-06-16 11:01:06', NULL),
(9, 'Clive ', 'Las pinsan ng kapatid st. Barangay TUP manila Quezon City', ' Metro Manila', 'male', 'clive@gmail.com', '203538b7888d38ffa2e4b2af6b8908a4', '2023-06-16 11:17:50', NULL),
(10, 'Jean', '189 Canada USA chinatown Metro manila', 'ukraine', 'male', 'Jean@gmail.com', '819125d5869e61ed6b086aca07e99aca', '2023-06-20 13:30:03', '2023-06-20 13:30:48'),
(11, 'Christian', 'qcu', 'manila', 'male', 'Christian@gmail.com', '96f3377dba4055a53c6b0f72ed134bf4', '2023-06-20 17:34:12', NULL),
(12, 'Rose Ann Batayog', '1823 SISIHIN st. Metro manila', 'manila', 'female', 'Roseann@gmail.com', '54fae51e93f95f3ef21f5c043ba387a3', '2023-06-20 19:08:53', '2023-06-20 19:20:59'),
(13, 'Rommel C. Laman', '232 Viliongco Street Barangay Commonwealth', 'Quezon City', 'male', 'Rommel@gmail.com', 'cfcb2f26b68a5b94306e0f24b8ed57ec', '2023-06-20 19:56:08', NULL),
(14, 'Brenden', '1823 Don jose rizel cirle', 'Rizal', 'male', 'Brenden@gmail.com', 'ac6ea25260dffae74626eb166f1e27c5', '2023-06-21 07:19:01', NULL),
(15, 'Brentulfo', 'GMA Channel 5 idol st. barangay idol ko ', 'Metro Manila', 'male', 'Brentulfo@gmail.com', 'f5b3d15adc24233e0684b1837e9594bb', '2023-06-21 13:59:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorslog`
--
ALTER TABLE `doctorslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatient`
--
ALTER TABLE `tblpatient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `doctorslog`
--
ALTER TABLE `doctorslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpatient`
--
ALTER TABLE `tblpatient`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
