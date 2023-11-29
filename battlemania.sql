-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 06, 2022 at 09:48 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `battlemania`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountstatement`
--

CREATE TABLE `accountstatement` (
  `account_statement_id` int(11) NOT NULL,
  `member_id` int(50) NOT NULL,
  `pubg_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_mem_id` int(50) NOT NULL DEFAULT 0,
  `deposit` double NOT NULL,
  `withdraw` double NOT NULL,
  `join_money` double NOT NULL DEFAULT 0,
  `win_money` double NOT NULL DEFAULT 0,
  `match_id` int(11) NOT NULL DEFAULT 0,
  `note` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_id` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0 = add money to join wallet,1 = withdraw from win wallet,2 = match join,3 = register referral,4 = referral,5 = match reward,6 = refund,7 = add money to win wallet,8 = withdraw from join wallet,9 = pending withdraw,10 = Lottery Joined,11 = Lottery Reward,12=product order,13=watch and earn,14=Add Challenge,15=Accept Challenge,16=Cancel Challenge,17=Win Challenge,18=Panelty Charge',
  `pyatmnumber` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_method` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_from` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web,3=admin',
  `ip_detail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountstatement_dateCreated` datetime NOT NULL,
  `lottery_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_login` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=yes,1=no',
  `permission` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `craeted_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `default_login`, `permission`, `craeted_date`) VALUES
(1, 'admin', 'admin@xyz.com', '5f4dcc3b5aa765d61d8327deb882cf99', '0', '', '2019-01-10 17:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcement_id` int(11) NOT NULL,
  `announcement_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_upload`
--

CREATE TABLE `app_upload` (
  `app_upload_id` int(11) NOT NULL,
  `app_upload` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_version` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `force_update` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL,
  `force_logged_out` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_upload`
--

INSERT INTO `app_upload` (`app_upload_id`, `app_upload`, `app_version`, `app_description`, `date_created`, `force_update`, `force_logged_out`) VALUES
(1, 'battlemaniav5-0-1-0.apk', '1', '<p>Test</p>', '2021-01-21 13:25:30', 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `banner_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_link_type` enum('app','web') COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_id` int(11) NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `banner_title`, `banner_image`, `banner_link_type`, `banner_link`, `link_id`, `status`, `date_created`) VALUES
(1, 'Refer and Earn', '202205301820281666444828__refer_and_earn.png', 'app', 'Refer and Earn', 0, '1', '2021-01-19 18:01:37'),
(2, 'Watch and Earn', '202205301820191733740419__Watch_And_Earn.png', 'app', 'Watch and Earn', 0, '1', '2021-01-19 18:01:49'),
(3, 'Buy Product', '202205301820121705860312__buy_product.png', 'app', 'Buy Product', 0, '1', '2021-01-19 18:02:01'),
(4, 'Lucky Draw', '202205301820031745605603__lucky_draw.png', 'app', 'Luckey Draw', 0, '1', '2021-01-19 18:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `challenge_result_upload`
--

CREATE TABLE `challenge_result_upload` (
  `challenge_result_upload_id` int(10) NOT NULL,
  `ludo_challenge_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `result_uploded_by_flag` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=by addedd,1=by accepted',
  `result_image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=win,1=lost,2=error',
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `challenge_room_code`
--

CREATE TABLE `challenge_room_code` (
  `challenge_room_code_id` int(10) NOT NULL,
  `challenge_id` int(10) NOT NULL,
  `room_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `p_code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=inactive,1=active',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `p_code`, `country_name`, `country_status`, `date_created`) VALUES
(1, '+93', 'Afghanistan', '1', '2020-05-29 12:10:01'),
(2, '+355', 'Albania', '1', '2020-05-29 12:10:01'),
(3, '+213', 'Algeria', '1', '2020-05-29 12:10:01'),
(4, '+684', 'American Samoa', '1', '2020-05-29 12:10:01'),
(5, '+376', 'Andorra', '1', '2020-05-29 12:10:01'),
(6, '+244', 'Angola', '1', '2020-05-29 12:10:01'),
(7, '+1264', 'Anguilla', '1', '2020-05-29 12:10:01'),
(8, '+672', 'Antarctica', '1', '2020-05-29 12:10:01'),
(9, '+1268', 'Antigua', '1', '2020-05-29 12:10:01'),
(10, '+54', 'Argentina', '1', '2020-05-29 12:10:01'),
(11, '+374', 'Armenia', '1', '2020-05-29 12:10:01'),
(12, '+297', 'Aruba', '1', '2020-05-29 12:10:01'),
(13, '+247', 'Ascension', '1', '2020-05-29 12:10:01'),
(14, '+61', 'Australia', '1', '2020-05-29 12:10:01'),
(15, '+43', 'Austria', '1', '2020-05-29 12:10:01'),
(16, '+994', 'Azerbaijan', '1', '2020-05-29 12:10:01'),
(17, '+1242', 'Bahamas', '1', '2020-05-29 12:10:01'),
(18, '+973', 'Bahrain', '1', '2020-05-29 12:10:01'),
(19, '+880', 'Bangladesh', '1', '2020-05-29 12:10:01'),
(20, '+1246', 'Barbados', '1', '2020-05-29 12:10:01'),
(21, '+1268', 'Barbuda', '1', '2020-05-29 12:10:01'),
(22, '+375', 'Belarus', '1', '2020-05-29 12:10:01'),
(23, '+32', 'Belgium', '1', '2020-05-29 12:10:01'),
(24, '+501', 'Belize', '1', '2020-05-29 12:10:01'),
(25, '+229', 'Benin', '1', '2020-05-29 12:10:01'),
(26, '+1441', 'Bermuda', '1', '2020-05-29 12:10:01'),
(27, '+975', 'Bhutan', '1', '2020-05-29 12:10:01'),
(28, '+591', 'Bolivia', '1', '2020-05-29 12:10:01'),
(29, '+267', 'Botswana', '1', '2020-05-29 12:10:01'),
(30, '+55', 'Brazil', '1', '2020-05-29 12:10:01'),
(31, '+1284', 'British Virgin Islands', '1', '2020-05-29 12:10:01'),
(32, '+673', 'Brunei Darussalam', '1', '2020-05-29 12:10:01'),
(33, '+359', 'Bulgaria', '1', '2020-05-29 12:10:01'),
(34, '+226', 'Burkina Faso', '1', '2020-05-29 12:10:01'),
(35, '+257', 'Burundi', '1', '2020-05-29 12:10:01'),
(36, '+855', 'Cambodia', '1', '2020-05-29 12:10:01'),
(37, '+237', 'Cameroon', '1', '2020-05-29 12:10:01'),
(38, '+124432', 'Canada', '1', '2020-05-29 12:10:01'),
(39, '+238', 'Cape Verde Islands', '1', '2020-05-29 12:10:01'),
(40, '+1345', 'Cayman Islands', '1', '2020-05-29 12:10:01'),
(41, '+236', 'Central African Republic', '1', '2020-05-29 12:10:01'),
(42, '+235', 'Chad', '1', '2020-05-29 12:10:01'),
(43, '+56', 'Chile', '1', '2020-05-29 12:10:01'),
(44, '+86', 'China', '1', '2020-05-29 12:10:01'),
(45, '+57', 'Colombia', '1', '2020-05-29 12:10:01'),
(46, '+269', 'Comoros', '1', '2020-05-29 12:10:01'),
(47, '+242', 'Congo', '1', '2020-05-29 12:10:01'),
(48, '+682', 'Cook Islands', '1', '2020-05-29 12:10:01'),
(49, '+506', 'Costa Rica', '1', '2020-05-29 12:10:01'),
(50, '+385', 'Croatia', '1', '2020-05-29 12:10:01'),
(51, '+53', 'Cuba', '1', '2020-05-29 12:10:01'),
(52, '+599', 'Cura?ao', '1', '2020-05-29 12:10:01'),
(53, '+357', 'Cyprus', '1', '2020-05-29 12:10:01'),
(54, '+420', 'Czech Republic', '1', '2020-05-29 12:10:01'),
(55, '+45', 'Denmark', '1', '2020-05-29 12:10:01'),
(56, '+246', 'Diego Garcia', '1', '2020-05-29 12:10:01'),
(57, '+253', 'Djibouti', '1', '2020-05-29 12:10:01'),
(58, '+1767', 'Dominica', '1', '2020-05-29 12:10:01'),
(59, '+670', 'East Timor', '1', '2020-05-29 12:10:01'),
(60, '+56', 'Easter Island', '1', '2020-05-29 12:10:01'),
(61, '+593', 'Ecuador', '1', '2020-05-29 12:10:01'),
(62, '+20', 'Egypt', '1', '2020-05-29 12:10:01'),
(63, '+503', 'El Salvador', '1', '2020-05-29 12:10:01'),
(64, '+240', 'Equatorial Guinea', '1', '2020-05-29 12:10:01'),
(65, '+291', 'Eritrea', '1', '2020-05-29 12:10:01'),
(66, '+372', 'Estonia', '1', '2020-05-29 12:10:01'),
(67, '+251', 'Ethiopia', '1', '2020-05-29 12:10:01'),
(68, '+298', 'Faroe Islands', '1', '2020-05-29 12:10:01'),
(69, '+679', 'Fiji Islands', '1', '2020-05-29 12:10:01'),
(70, '+358', 'Finland', '1', '2020-05-29 12:10:01'),
(71, '+33', 'France', '1', '2020-05-29 12:10:01'),
(72, '+596', 'French Antilles', '1', '2020-05-29 12:10:01'),
(73, '+594', 'French Guiana', '1', '2020-05-29 12:10:01'),
(74, '+689', 'French Polynesia', '1', '2020-05-29 12:10:01'),
(75, '+241', 'Gabonese Republic', '1', '2020-05-29 12:10:01'),
(76, '+220', 'Gambia', '1', '2020-05-29 12:10:01'),
(77, '+995', 'Georgia', '1', '2020-05-29 12:10:01'),
(78, '+49', 'Germany', '1', '2020-05-29 12:10:01'),
(79, '+233', 'Ghana', '1', '2020-05-29 12:10:01'),
(80, '+350', 'Gibraltar', '1', '2020-05-29 12:10:01'),
(81, '+30', 'Greece', '1', '2020-05-29 12:10:01'),
(82, '+299', 'Greenland', '1', '2020-05-29 12:10:01'),
(83, '+1473', 'Grenada', '1', '2020-05-29 12:10:01'),
(84, '+590', 'Guadeloupe', '1', '2020-05-29 12:10:01'),
(85, '+1671', 'Guam', '1', '2020-05-29 12:10:01'),
(86, '+5399', 'Guantanamo Bay', '1', '2020-05-29 12:10:01'),
(87, '+502', 'Guatemala', '1', '2020-05-29 12:10:01'),
(88, '+245', 'Guinea-Bissau', '1', '2020-05-29 12:10:01'),
(89, '+224', 'Guinea', '1', '2020-05-29 12:10:01'),
(90, '+592', 'Guyana', '1', '2020-05-29 12:10:01'),
(91, '+509', 'Haiti', '1', '2020-05-29 12:10:01'),
(92, '+504', 'Honduras', '1', '2020-05-29 12:10:01'),
(93, '+852', 'Hong Kong', '1', '2020-05-29 12:10:01'),
(94, '+36', 'Hungary', '1', '2020-05-29 12:10:01'),
(95, '+354', 'Iceland', '1', '2020-05-29 12:10:01'),
(96, '+91', 'India', '1', '2020-05-29 12:10:01'),
(97, '+62', 'Indonesia', '1', '2020-05-29 12:10:01'),
(98, '+98', 'Iran', '1', '2020-05-29 12:10:01'),
(99, '+964', 'Iraq', '1', '2020-05-29 12:10:01'),
(100, '+353', 'Ireland', '1', '2020-05-29 12:10:01'),
(101, '+972', 'Israel', '1', '2020-05-29 12:10:01'),
(102, '+39', 'Italy', '1', '2020-05-29 12:10:01'),
(103, '+1876', 'Jamaica', '1', '2020-05-29 12:10:01'),
(104, '+81', 'Japan', '1', '2020-05-29 12:10:01'),
(105, '+962', 'Jordan', '1', '2020-05-29 12:10:01'),
(106, '+7', 'Kazakhstan', '1', '2020-05-29 12:10:01'),
(107, '+254', 'Kenya', '1', '2020-05-29 12:10:01'),
(108, '+686', 'Kiribati', '1', '2020-05-29 12:10:01'),
(109, '+850', 'Korea (North)', '1', '2020-05-29 12:10:01'),
(110, '+82', 'Korea (South)', '1', '2020-05-29 12:10:01'),
(111, '+965', 'Kuwait', '1', '2020-05-29 12:10:01'),
(112, '+996', 'Kyrgyz Republic', '1', '2020-05-29 12:10:01'),
(113, '+856', 'Laos', '1', '2020-05-29 12:10:01'),
(114, '+371', 'Latvia', '1', '2020-05-29 12:10:01'),
(115, '+961', 'Lebanon', '1', '2020-05-29 12:10:01'),
(116, '+266', 'Lesotho', '1', '2020-05-29 12:10:01'),
(117, '+231', 'Liberia', '1', '2020-05-29 12:10:01'),
(118, '+218', 'Libya', '1', '2020-05-29 12:10:01'),
(119, '+423', 'Liechtenstein', '1', '2020-05-29 12:10:01'),
(120, '+370', 'Lithuania', '1', '2020-05-29 12:10:01'),
(121, '+352', 'Luxembourg', '1', '2020-05-29 12:10:01'),
(122, '+853', 'Macao', '1', '2020-05-29 12:10:01'),
(123, '+261', 'Madagascar', '1', '2020-05-29 12:10:01'),
(124, '+265', 'Malawi', '1', '2020-05-29 12:10:01'),
(125, '+60', 'Malaysia', '1', '2020-05-29 12:10:01'),
(126, '+960', 'Maldives', '1', '2020-05-29 12:10:01'),
(127, '+223', 'Mali Republic', '1', '2020-05-29 12:10:01'),
(128, '+356', 'Malta', '1', '2020-05-29 12:10:01'),
(129, '+692', 'Marshall Islands', '1', '2020-05-29 12:10:01'),
(130, '+596', 'Martinique', '1', '2020-05-29 12:10:01'),
(131, '+222', 'Mauritania', '1', '2020-05-29 12:10:01'),
(132, '+230', 'Mauritius', '1', '2020-05-29 12:10:01'),
(133, '+269', 'Mayotte Island', '1', '2020-05-29 12:10:01'),
(134, '+52', 'Mexico', '1', '2020-05-29 12:10:01'),
(135, '+1808', 'Midway Island', '1', '2020-05-29 12:10:01'),
(136, '+373', 'Moldova', '1', '2020-05-29 12:10:01'),
(137, '+377', 'Monaco', '1', '2020-05-29 12:10:01'),
(138, '+976', 'Mongolia', '1', '2020-05-29 12:10:01'),
(139, '+382', 'Montenegro', '1', '2020-05-29 12:10:01'),
(140, '+1664', 'Montserrat', '1', '2020-05-29 12:10:01'),
(141, '+212', 'Morocco', '1', '2020-05-29 12:10:01'),
(142, '+258', 'Mozambique', '1', '2020-05-29 12:10:01'),
(143, '+95', 'Myanmar', '1', '2020-05-29 12:10:01'),
(144, '+264', 'Namibia', '1', '2020-05-29 12:10:01'),
(145, '+674', 'Nauru', '1', '2020-05-29 12:10:01'),
(146, '+977', 'Nepal', '1', '2020-05-29 12:10:01'),
(147, '+31', 'Netherlands', '1', '2020-05-29 12:10:01'),
(148, '+599', 'Netherlands Antilles', '1', '2020-05-29 12:10:01'),
(149, '+1869', 'Nevis', '1', '2020-05-29 12:10:01'),
(150, '+687', 'New Caledonia', '1', '2020-05-29 12:10:01'),
(151, '+64', 'New Zealand', '1', '2020-05-29 12:10:01'),
(152, '+505', 'Nicaragua', '1', '2020-05-29 12:10:01'),
(153, '+227', 'Niger', '1', '2020-05-29 12:10:01'),
(154, '+234', 'Nigeria', '1', '2020-05-29 12:10:01'),
(155, '+683', 'Niue', '1', '2020-05-29 12:10:01'),
(156, '+672', 'Norfolk Island', '1', '2020-05-29 12:10:01'),
(157, '+47', 'Norway', '1', '2020-05-29 12:10:01'),
(158, '+968', 'Oman', '1', '2020-05-29 12:10:01'),
(159, '+92', 'Pakistan', '1', '2020-05-29 12:10:01'),
(160, '+680', 'Palau', '1', '2020-05-29 12:10:01'),
(161, '+970', 'Palestinian Settlements', '1', '2020-05-29 12:10:01'),
(162, '+507', 'Panama', '1', '2020-05-29 12:10:01'),
(163, '+675', 'Papua New Guinea', '1', '2020-05-29 12:10:01'),
(164, '+595', 'Paraguay', '1', '2020-05-29 12:10:01'),
(165, '+51', 'Peru', '1', '2020-05-29 12:10:01'),
(166, '+63', 'Philippines', '1', '2020-05-29 12:10:01'),
(167, '+48', 'Poland', '1', '2020-05-29 12:10:01'),
(168, '+351', 'Portugal', '1', '2020-05-29 12:10:01'),
(169, '+974', 'Qatar', '1', '2020-05-29 12:10:01'),
(170, '+262', 'R?union Island', '1', '2020-05-29 12:10:01'),
(171, '+40', 'Romania', '1', '2020-05-29 12:10:01'),
(172, '+7', 'Russia', '1', '2020-05-29 12:10:01'),
(173, '+250', 'Rwandese Republic', '1', '2020-05-29 12:10:01'),
(174, '+290', 'St. Helena', '1', '2020-05-29 12:10:01'),
(175, '+1869', 'St. Kitts/Nevis', '1', '2020-05-29 12:10:01'),
(176, '+1758', 'St. Lucia', '1', '2020-05-29 12:10:01'),
(177, '+508', 'St. Pierre & Miquelon', '1', '2020-05-29 12:10:01'),
(178, '+1784', 'St. Vincent & Grenadines', '1', '2020-05-29 12:10:01'),
(179, '+685', 'Samoa', '1', '2020-05-29 12:10:01'),
(180, '+378', 'San Marino', '1', '2020-05-29 12:10:01'),
(181, '+239', 'S?o Tom? and Principe', '1', '2020-05-29 12:10:01'),
(182, '+966', 'Saudi Arabia', '1', '2020-05-29 12:10:01'),
(183, '+221', 'Senegal', '1', '2020-05-29 12:10:01'),
(184, '+381', 'Serbia', '1', '2020-05-29 12:10:01'),
(185, '+248', 'Seychelles Republic', '1', '2020-05-29 12:10:01'),
(186, '+232', 'Sierra Leone', '1', '2020-05-29 12:10:01'),
(187, '+65', 'Singapore', '1', '2020-05-29 12:10:01'),
(188, '+421', 'Slovak Republic', '1', '2020-05-29 12:10:01'),
(189, '+386', 'Slovenia', '1', '2020-05-29 12:10:01'),
(190, '+677', 'Solomon Islands', '1', '2020-05-29 12:10:01'),
(191, '+252', 'Somali Democratic Republic', '1', '2020-05-29 12:10:01'),
(192, '+27', 'South Africa', '1', '2020-05-29 12:10:01'),
(193, '+34', 'Spain', '1', '2020-05-29 12:10:01'),
(194, '+94', 'Sri Lanka', '1', '2020-05-29 12:10:01'),
(195, '+249', 'Sudan', '1', '2020-05-29 12:10:01'),
(196, '+597', 'Suriname', '1', '2020-05-29 12:10:01'),
(197, '+268', 'Swaziland', '1', '2020-05-29 12:10:01'),
(198, '+46', 'Sweden', '1', '2020-05-29 12:10:01'),
(199, '+41', 'Switzerland', '1', '2020-05-29 12:10:01'),
(200, '+963', 'Syria', '1', '2020-05-29 12:10:01'),
(201, '+886', 'Taiwan', '1', '2020-05-29 12:10:01'),
(202, '+992', 'Tajikistan', '1', '2020-05-29 12:10:01'),
(203, '+255', 'Tanzania', '1', '2020-05-29 12:10:01'),
(204, '+66', 'Thailand', '1', '2020-05-29 12:10:01'),
(205, '+670', 'Timor Leste', '1', '2020-05-29 12:10:01'),
(206, '+228', 'Togolese Republic', '1', '2020-05-29 12:10:01'),
(207, '+690', 'Tokelau', '1', '2020-05-29 12:10:01'),
(208, '+676', 'Tonga Islands', '1', '2020-05-29 12:10:01'),
(209, '+1868', 'Trinidad & Tobago', '1', '2020-05-29 12:10:01'),
(210, '+216', 'Tunisia', '1', '2020-05-29 12:10:01'),
(211, '+90', 'Turkey', '1', '2020-05-29 12:10:01'),
(212, '+993', 'Turkmenistan', '1', '2020-05-29 12:10:01'),
(213, '+1649', 'Turks and Caicos Islands', '1', '2020-05-29 12:10:01'),
(214, '+688', 'Tuvalu', '1', '2020-05-29 12:10:01'),
(215, '+256', 'Uganda', '1', '2020-05-29 12:10:01'),
(216, '+380', 'Ukraine', '1', '2020-05-29 12:10:01'),
(217, '+971', 'United Arab Emirates', '1', '2020-05-29 12:10:01'),
(218, '+44', 'United Kingdom', '1', '2020-05-29 12:10:01'),
(219, '+1', 'United States of America', '1', '2020-05-29 12:10:01'),
(220, '+1340', 'US Virgin Islands', '1', '2020-05-29 12:10:01'),
(221, '+598', 'Uruguay', '1', '2020-05-29 12:10:01'),
(222, '+998', 'Uzbekistan', '1', '2020-05-29 12:10:01'),
(223, '+678', 'Vanuatu', '1', '2020-05-29 12:10:01'),
(224, '+58', 'Venezuela', '1', '2020-05-29 12:10:01'),
(225, '+84', 'Vietnam', '1', '2020-05-29 12:10:01'),
(226, '+808', 'Wake Island', '1', '2020-05-29 12:10:01'),
(227, '+967', 'Yemen', '1', '2020-05-29 12:10:01'),
(228, '+260', 'Zambia', '1', '2020-05-29 12:10:01'),
(229, '+255', 'Zanzibar', '1', '2020-05-29 12:10:01'),
(230, '+263', 'Zimbabwe', '0', '2020-05-29 12:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `courier_id` int(11) NOT NULL,
  `courier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courier_link` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`courier_id`, `courier_name`, `courier_link`, `status`, `date_created`) VALUES
(1, 'test', 'http://xyz.com', '1', '2021-01-20 11:14:03');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `currency_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_decimal_place` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `currency_name`, `currency_code`, `currency_symbol`, `currency_decimal_place`, `currency_status`, `currency_dateCreated`) VALUES
(3, 'India Rupee', 'INR', '₹', '2', '1', '2019-03-29 15:05:12'),
(5, 'US Dollar', 'USD', '$', '2', '1', '2019-03-29 15:31:23'),
(6, 'Token', 'TRX', 'TRX', '2', '1', '2021-10-18 14:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `deposit_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `deposit_amount` double NOT NULL,
  `wallet_address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_key` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_key` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_hex` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_transection_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=pending,1=complete,2 = failed',
  `deposit_by` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_from` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web',
  `deposit_dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE `download` (
  `download_id` int(11) NOT NULL,
  `download_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dp_order` int(11) NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=deactive,1=active',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`download_id`, `download_image`, `dp_order`, `status`, `date_created`) VALUES
(1, '202205301818301700765010__install1.png', 1, '1', '2021-01-19 12:26:01'),
(2, '202205301818361739759016__install2.png', 2, '1', '2021-01-19 12:26:08'),
(3, '202205301818431691390023__install3.png', 3, '1', '2021-01-19 12:26:15'),
(4, '202205301818491733155129__install4.png', 4, '1', '2021-01-19 12:26:22'),
(5, '202205301819011705003841__install5.png', 5, '1', '2021-01-19 12:26:30'),
(6, '202205301819081671033148__install6.png', 6, '1', '2021-01-19 12:26:37'),
(7, '202205301819151689465455__install7.png', 7, '1', '2021-01-19 12:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `features_tab`
--

CREATE TABLE `features_tab` (
  `f_id` int(11) NOT NULL,
  `f_tab_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_tab_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_tab_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_tab_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_tab_img_position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_tab_order` int(10) NOT NULL,
  `f_tab_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features_tab`
--

INSERT INTO `features_tab` (`f_id`, `f_tab_name`, `f_tab_title`, `f_tab_text`, `f_tab_image`, `f_tab_img_position`, `f_tab_order`, `f_tab_status`, `date_created`) VALUES
(1, 'Join Contest', 'Join Contest', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled', '202205301817231655756043__11.png', 'left', 1, '1', '2020-01-23 16:18:42'),
(2, 'Participates', 'Participates', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled', '202205301817161682347836__11.png', 'center', 2, '1', '2020-01-23 16:18:45'),
(3, 'Contest Results', 'Contest Results', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled', '202205301817081694727428__11.png', 'right', 3, '1', '2020-01-23 16:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `features_tab_content`
--

CREATE TABLE `features_tab_content` (
  `ftc_id` int(11) NOT NULL,
  `features_tab_id` int(11) NOT NULL,
  `content_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features_tab_content`
--

INSERT INTO `features_tab_content` (`ftc_id`, `features_tab_id`, `content_title`, `content_text`, `content_icon`, `content_status`, `date_created`) VALUES
(1, 1, 'Free Contests', 'You can join any contest of your liking and of your desired time for free as a launch offer.', 'fa fa-inr', '1', '2020-01-20 17:38:54'),
(2, 1, 'Cash Prizes', 'As a true core gamer you will be competing some of the best players of india and also can win exiting cash prizes.\r\n', 'fa fa-gift', '1', '2020-01-20 17:39:49'),
(3, 1, 'Gamer Profile', 'You\'ll be given a gamer profile where you can showcase your skills and stats. Be popular in rising gaming community of india.', 'fa fa-users', '1', '2020-01-20 17:58:16'),
(4, 1, 'Leader Boards', 'There will be leader boards of all the pro players to see who got the guts and skills at the same time.', 'fa fa-bar-chart', '1', '2020-01-20 17:58:59'),
(5, 1, 'Fair Play', 'With the respect of gaming community we have made some rules for the players. No Emulators, No Hackers.', 'fa fa-play', '1', '2020-01-20 18:00:12'),
(6, 1, 'Share & Earn', 'You can Refer Other gamers to play on platform. You will get refer bonus of it.', 'fa fa-share-alt', '1', '2020-01-20 18:00:48'),
(7, 2, ' Various Modes', 'We will post daily new contests based on various modes such as Squad,Duo,Solo and also FPP and TPP matches.', 'fa fa-filter', '1', '2020-01-20 18:22:25'),
(8, 2, 'Kill Prizes', 'In kill prizes match you will get prizes of decided per kill prize at the time of declaration.', 'fa fa-snapchat-ghost', '1', '2020-01-20 18:35:41'),
(9, 2, ' Strict Rules', 'Anytype of misconduct or cheating will not be allowed in all the games so you don\'t have to worry about fair play.', 'fa fa-calendar-check-o', '1', '2020-01-20 18:25:06'),
(10, 2, ' No Restrictions!', 'You can play as many free games as you want during the launch offer, So make sure you win that juicy prizes.', 'fa fa-exclamation-triangle', '1', '2020-01-20 18:25:46'),
(11, 3, 'Big Prizes', 'All Winning Prizes will be given in just 30 minutes of match completion and you can also make withdraw requests of prize whenever you want.', 'fa fa-gift', '1', '2020-01-20 18:26:16'),
(12, 3, 'Fast Withdraw', 'We will process withdrawal request in 24 hours of submission.', 'fa fa-credit-card', '1', '2020-01-20 18:29:48'),
(13, 3, 'Community Support', 'We also provide community support to our players via email and WhatsApp too for better experience of tournaments incase anything goes wrong!', 'fa fa-question', '1', '2020-01-20 18:27:45'),
(14, 3, 'Notification', 'You\'ll be notified by the app once the results are available. You\'ll be also notified about the winnings of yours', 'fa fa-bell', '1', '2020-01-20 18:28:07');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `game_id` int(11) NOT NULL,
  `game_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_image` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `game_type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '''0=normal,1=ludo functionality''',
  `follower` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_prefix` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `game_logo` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`game_id`, `game_name`, `package_name`, `game_image`, `game_rules`, `status`, `game_type`, `follower`, `id_prefix`, `date_created`, `game_logo`) VALUES
(1, 'Garena Free Fire - New Age', 'com.dts.freefireth', '202205301750561663667056__ff.jpg', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<p>Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n\r\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301750561665768356__freefirelogo.png'),
(2, 'PUBG MOBILE: Arcane', 'com.tencent.ig', '202205301751241708500784__pubg.jpg', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<p>Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n\r\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301751241710365284__pubgarcanelogo.png'),
(3, 'BGMI', 'com.pubg.imobile', '202205301754321662038872__bgmibaner.jpg', '<p>BGMI</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301754321676558872__bgmi.png'),
(4, 'PUBG: NEW STATE', 'com.pubg.newstate', '202205301755371694919337__newstatebaner.jpg', '<p>PUBG: NEW STATE</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301755371707817437__newstatelogo.png'),
(5, 'PUBG MOBILE LITE', 'com.tencent.iglite', '202205301756121660868272__pubglitebaner.jpg', '<p>PUBG MOBILE LITE</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301756121670894072__pubglite.png'),
(6, 'Call of Duty®: Mobile', 'com.activision.callofduty.shooter', '202205301757031691259123__newcodbaner.jpg', '<p>Call of Duty&reg;: Mobile</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301757031707727923__newcodlogo.png'),
(7, 'Fortnite', 'com.epicgames.fortnite', '202205301757401661931160__fortnightbaner.jpg', '<p><strong>Fortnite</strong></p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301757401675690360__fortnightlogo.jpg'),
(8, 'Clash Royale', 'com.supercell.clashroyale', '202205301758071678528287__clashroyalbaner.jpg', '<h1>Clash Royale</h1>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301758071687926587__clashroyallogo.png'),
(9, 'Apex Legends Mobile', 'com.ea.gp.apexlegendsmobilefps', '202205301758351696336215__apexlegendsbaner.jpg', '<h1>Apex Legends Mobile</h1>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301758351714230215__apexlegendslogo.png'),
(10, 'Valorant', '.', '202205301759001664073940__Valorant-baner.jpg', '<p>Valorant</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301759001678832540__valorant.png'),
(11, 'FIFA Football', 'com.ea.gp.fifamobile', '202205301759241719428764__fifabaner.jpg', '<p>FIFA Football</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301759241726814464__fifalogo.png'),
(12, 'WCC3', 'com.nextwave.wcc3', '202205301759441706628284__wcc3baner.jpg', '<p>WCC3</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301759441718850584__wcc3baner.jpg'),
(13, 'Asphalt 9: Legends', 'com.gameloft.android.ANMP.GloftA9HM', '202205301800011699707201__asphalt9baner.jpg', '<p>Asphalt 9: Legends</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301800011719934101__asphalt9logo.png'),
(14, 'Turbo league', 'com.zerofour.turboleague', '202205301800231735778723__turboleaguebaner.jpg', '<h1>Turbo league</h1>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301800231743885123__turboleaguelogo.png'),
(15, 'Mario Kart Tour', 'com.nintendo.zaka', '202205301800431653978943__Mario-Kart-Tourbaner.jpg', '<p>Mario Kart Tour</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301800431664835643__mariokarttourlogo.png'),
(16, 'Brawl Stars', 'com.supercell.brawlstars', '202205301801061733695266__brawl-stars-banner.jpg', '<h1>Brawl Stars</h1>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301801061747772966__brawlstarslogo.png'),
(17, 'Critical Ops', 'com.criticalforceentertainment.criticalops', '202205301801561752374316__criticalopsbaner.png', '<h1>Critical Ops</h1>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301801381706245998__criticalopslogo.png'),
(18, 'Ludo King™', 'com.ludo.king', '202205301802191698561839__Ludo-King-baner.jpg', '<p>Ludo King&trade;</p>\r\n', '1', '1', '[]', 'LK', '2022-05-26 00:00:00', '202205301802191712622439__ludokinglogo.png'),
(19, 'Carrom King™', 'com.git.carromking', '202205301802441656777064__carromkingbaner.jpg', '<p>Carrom King&trade;</p>\r\n', '1', '1', '[]', 'CK', '2022-05-26 00:00:00', '202205301802441665073464__carromkinglogo.jpg'),
(20, 'Snakes and Ladders King', 'com.gametion.snakesladders', '202205301804051655051745__download.jpeg', '<p>Snakes and Ladders King</p>\r\n', '1', '1', '[]', 'SLK', '2022-05-26 00:00:00', '202205301804051660380345__download.jpeg'),
(21, 'Arena of Valor', 'com.ngame.allstar.eu', '202205301805211752882621__WeChat_Image_20220418163209.png', '<p>Arena of Valor</p>\r\n', '1', '0', '[]', '', '2022-05-26 00:00:00', '202205301805221686718822__WeChat_Image_20220418163151.png'),
(22, 'UNO!™', 'com.matteljv.uno', '202205301750221698945822__uno_image.jpeg', '<p>Uno</p>\r\n', '1', '0', '[]', '', '2022-05-26 17:59:07', '202205301750221706753522__uno_logo.png'),
(23, 'Mobile Legends: Bang Bang', 'com.mobile.legends', '202205301749411709003481__mobile_legend_image.jpeg', '<p>Mobile Legends: Bang Bang</p>\r\n', '1', '0', '[]', '', '2022-05-26 18:03:07', '202205301749411716639081__mobile_legend_logo.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `howtoplay_content`
--

CREATE TABLE `howtoplay_content` (
  `htp_content_id` int(11) NOT NULL,
  `htp_content_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `htp_content_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `htp_content_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `htp_order` int(10) NOT NULL,
  `htp_content_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `howtoplay_content`
--

INSERT INTO `howtoplay_content` (`htp_content_id`, `htp_content_title`, `htp_content_text`, `htp_content_image`, `htp_order`, `htp_content_status`, `date_created`) VALUES
(1, 'How To Play', '<ul>\r\n	<li><strong>Solo Mode:</strong></li>\r\n	<li>You can join a tournament whatever works for you (modes: Top Position, Most Kills or Damage).</li>\r\n	<li>Top 10 winners get prizes up to $50.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><strong>Duo Mode:</strong></li>\r\n	<li>Play PUBG with your friend and you both can win cash prizes.</li>\r\n	<li>Just invite your teammate and join 100-team tournament.</li>\r\n	<li>The top prize is $100. It?s possible to join 3 tournaments at once.</li>\r\n</ul>\r\n', '202205301818111685321191__howtoplay.jpg', 1, '1', '2022-05-30 18:18:11'),
(2, 'What To Do', '<ul>\r\n	<li><strong>Registration</strong></li>\r\n	<li>Create a free account</li>\r\n	<li>Connect your steam account or play PUBG via consoles (PS4, Xbox One)</li>\r\n	<li>That?s all! You?re ready to play.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><strong>Additional Information</strong></li>\r\n	<li>FREE PUBG tournaments are available 24/7.</li>\r\n	<li>We support both SOLO and DUO modes.</li>\r\n	<li>When competing, always try to do your best/get more kills.</li>\r\n	<li>The top 10 winners get prizes up to $50.</li>\r\n	<li>Your chances to win are 1 to 10 (places 6-10 win $1).</li>\r\n	<li>There is no limit, participate in PUBG tournaments as often as you want.</li>\r\n</ul>\r\n', '202205301818031661800683__whattodo.jpg', 2, '1', '2022-05-30 18:18:03'),
(3, 'Money Prizes', '<p>Once you win your first tournament, you can request your earnings to be withdrawn from your Battlemania account.<br />\r\nIt?s also possible to keep playing to get bigger prizes.<br />\r\n<br />\r\nThe following payments systems are supported on our website:</p>\r\n\r\n<ul>\r\n	<li>Credit cards</li>\r\n	<li>PayPal</li>\r\n	<li>Crypto currencies</li>\r\n	<li>Payeer</li>\r\n	<li>QIWI</li>\r\n</ul>\r\n\r\n<p>Happy earning!</p>\r\n', '202205301817551682084075__moneyprize.jpg', 3, '1', '2022-05-30 18:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `image_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `image_title`, `image_name`, `created_date`) VALUES
(1, 'free fire image', '202207061052221756617142__ff.jpg', '2021-01-19 17:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `lottery`
--

CREATE TABLE `lottery` (
  `lottery_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `lottery_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lottery_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lottery_time` datetime NOT NULL,
  `lottery_rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lottery_fees` double NOT NULL,
  `lottery_prize` double NOT NULL,
  `lottery_size` double NOT NULL,
  `total_joined` int(11) NOT NULL,
  `lottery_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=ongoing,2 = result',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lottery_member`
--

CREATE TABLE `lottery_member` (
  `lottery_member_id` int(11) NOT NULL,
  `lottery_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `lottery_prize` double NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '1=winner',
  `entry_from` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ludo_challenge`
--

CREATE TABLE `ludo_challenge` (
  `ludo_challenge_id` int(10) NOT NULL,
  `game_id` int(10) NOT NULL,
  `auto_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) NOT NULL,
  `accepted_member_id` int(10) NOT NULL,
  `ludo_king_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accepted_ludo_king_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin` int(10) NOT NULL,
  `winning_price` float NOT NULL,
  `room_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0= not accept,1=accepted',
  `challenge_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=canceled,3=completed,4=pending',
  `with_password` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `challenge_password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0= not send,1=send',
  `canceled_by` int(10) NOT NULL,
  `winner_id` int(10) NOT NULL,
  `accepted_date` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `m_id` int(11) NOT NULL,
  `match_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_time` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `win_prize` double NOT NULL,
  `prize_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_kill` double NOT NULL,
  `entry_fee` double NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MAP` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_id` int(11) NOT NULL,
  `match_type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=unpaid,1=paid',
  `match_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_private_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_player` int(11) NOT NULL,
  `match_status` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0=deactive,1=active,2 =complete,3 = start,4=cancel',
  `date_created` datetime NOT NULL,
  `number_of_position` int(11) NOT NULL,
  `result_notification` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_banner` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_sponsor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_match` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`m_id`, `match_name`, `match_url`, `match_time`, `win_prize`, `prize_description`, `room_description`, `per_kill`, `entry_fee`, `type`, `MAP`, `game_id`, `match_type`, `match_desc`, `match_private_desc`, `no_of_player`, `match_status`, `date_created`, `number_of_position`, `result_notification`, `match_banner`, `match_sponsor`, `pin_match`, `image_id`) VALUES
(1, 'Solo BattleMania', 'https://www.youtube.com/watch?v=x-IvnctgF9c', '22/01/2021 11:00 pm', 45, '<p>Winner : 2500 $<br />\r\nPer Kill : 50 $<br />\r\n-----------------</p>\r\n\r\n<p>Total : 7500 $</p>\r\n', NULL, 50, 100, 'Solo', 'Erangel', 1, '1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<p>Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n\r\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, '1', '2021-01-19 17:40:37', 100, '', '202205301807091668626329__ffbarmuda.jpg', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to</p>\r\n', '0', 0),
(2, 'Duo Night Battlemania', 'https://www.youtube.com/watch?v=x-IvnctgF9c', '22/01/2021 11:00 pm', 50, '', NULL, 45, 50, 'Duo', 'Miramar', 2, '1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<p>Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n\r\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, '1', '2021-01-19 17:41:51', 100, '', '202205301806531708701013__download.jpeg', '', '1', 0),
(3, 'Duo BattleMania', 'https://www.youtube.com/watch?v=NXpvC24rM-Y', '22/01/2021 11:00 pm', 50, '<p>Winner : 200</p>\r\n\r\n<p>Per Kill : 5</p>\r\n\r\n<p>--------------</p>\r\n\r\n<p>Total : 500</p>\r\n', NULL, 45, 10, 'Duo', 'Bermuda', 1, '1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<p>Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n\r\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, '1', '2021-01-19 17:43:06', 60, '', '202205301806391720397299__ffbarmuda.jpg', '', '0', 0),
(4, 'Squad BattleMania', 'https://www.youtube.com/watch?v=x-IvnctgF9c', '22/01/2021 11:00 pm', 75, '<p>Winner : 2500 $<br />\r\nPer Kill : 50 $<br />\r\n-----------------</p>\r\n\r\n<p>Total : 7500 $</p>\r\n', '<p>code : test1</p>\r\n\r\n<p>password : 123456</p>\r\n', 20, 10, 'Squad', 'Erangel', 2, '1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<p>Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n\r\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, '1', '2021-01-19 17:44:45', 100, '', '202205301806251698304485__ffbarmuda.jpg', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to</p>\r\n', '0', 0),
(5, 'Squad BattleMania', 'https://www.youtube.com/watch?v=x-IvnctgF9c', '22/01/2021 11:00 pm', 50, '<p>Winner : 200</p>\r\n\r\n<p>Per Kill : 5</p>\r\n\r\n<p>--------------</p>\r\n\r\n<p>Total : 500</p>\r\n', NULL, 45, 50, 'Squad', 'Miramar', 1, '1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<p>Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n\r\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, '1', '2021-01-19 17:46:02', 60, '', '', '', '0', 1),
(6, 'Solo BattleMania', 'https://www.youtube.com/watch?v=x-IvnctgF9c', '22/01/2021 11:00 pm', 50, '<p>Winner : 2500 $<br />\r\nPer Kill : 50 $<br />\r\n-----------------</p>\r\n\r\n<p>Total : 7500 $</p>\r\n', '<p>code : test1</p>\r\n\r\n<p>password : 123456</p>\r\n', 45, 100, 'Solo', 'Miramar', 2, '1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<p>Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n\r\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, '1', '2021-01-19 17:49:17', 100, '', '202205301806031703541963__pubgErangel.jpg', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to</p>\r\n', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `match_join_member`
--

CREATE TABLE `match_join_member` (
  `match_join_member_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `pubg_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` double NOT NULL,
  `place_point` double NOT NULL,
  `killed` int(11) NOT NULL,
  `win` double NOT NULL,
  `win_prize` double NOT NULL,
  `bonus` double NOT NULL,
  `total_win` double NOT NULL,
  `refund` double NOT NULL,
  `entry_from` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web',
  `date_craeted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `pubg_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('0','1','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '0=male,1=female',
  `dob` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referral_id` int(50) NOT NULL,
  `join_money` double DEFAULT 0,
  `wallet_balance` double DEFAULT 0,
  `member_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `member_package_upgraded` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `player_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `api_token` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `country_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb_id` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_via` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=simple,1= fb,2 = google',
  `new_user` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `profile_image` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_template` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bmuserapp',
  `budy_list` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `push_noti` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=off,1=on',
  `entry_from` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '	0=unknown,1=app,2=web',
  `ludo_username` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `pubg_id`, `first_name`, `last_name`, `user_name`, `password`, `email_id`, `gender`, `dob`, `mobile_no`, `referral_id`, `join_money`, `wallet_balance`, `member_status`, `member_package_upgraded`, `player_id`, `created_date`, `api_token`, `country_id`, `country_code`, `fb_id`, `login_via`, `new_user`, `profile_image`, `user_template`, `budy_list`, `push_noti`, `entry_from`, `ludo_username`) VALUES
(1, NULL, 'Battle', 'Mania', 'bm555', 'cc128b529512cab810540ac13ccaf56b', 'support@thebattlemania.com', '1', '15/08/1998', '123456789', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a3522TzlSbkUwQTFaZmNDUDVlTldYcVQ4c1VpbEltekIzN2FWSE1rd3BTZA==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(2, NULL, 'Battle1', 'Mania1', 'bm556', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+1@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a3585VVNZQ2J2M3FwSnJjRW5abE9QNUJtOHh6TE5odFYyZmRSVEZzNjFLOQ==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(3, NULL, 'Battle2', 'Mania2', 'bm557', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+2@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a3589aG94U2paOWU0cWw3RGdVZFlPa1Fzd1Q1V0EwekhyTkpHUHljNnBDVg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(4, NULL, 'Battle3', 'Mania3', 'bm558', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+3@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a358cM3NBSWp3bUZrYU9YN29nVUtiRWQweXhQODY0dkQ5TnRIY1RTQ3JuVg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(5, NULL, 'Battle4', 'Mania4', 'bm559', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+4@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a358fQ3NVeGxFaHp1NTlNSEx5bVBuVDNBMDIxSXZXd2c0cHRHZE5EY0JWOA==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(6, NULL, 'Battle5', 'Mania5', 'bm560', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+5@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a3591b1BNRzNIV3U1eTBFVTRTQkRpS0ZzVmFKbUFacGhScTJkZnhDN0lRNg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(7, NULL, 'Battle6', 'Mania6', 'bm561', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+6@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a3593S0Foa0dIOE9kRXg2TjV3UWJJOXZtQnNEUEMxVDdMUlozZ1YwenJhMg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(8, NULL, 'Battle7', 'Mania7', 'bm562', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+7@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a3596Q3RSbDhoeHpYWUFmRmRlRE01bjdvY0d5NGF1SkkzdjFMaUJzWktqNg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(9, NULL, 'Battle8', 'Mania8', 'bm563', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+8@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a3598THVNQkhvOEFHZDlLYUVuY2lKeVhtbHJmemdPNFd0VlJJREZUMmIxUA==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(10, NULL, 'Battle9', 'Mania9', 'bm564', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+9@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a359bcllPTUJtM2dqY0pDZHlSNjBBcHFQU0Z0Vks5SGlzekxsUW5oMnZaNQ==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(11, NULL, 'Battle10', 'Mania10', 'bm565', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+10@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a359dVXZrUVhtNnl4UnRyRDB6ZE1hMldxUEhUcHdTOUFlbFpvR25CRXNWOA==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(12, NULL, 'Battle11', 'Mania11', 'bm566', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+11@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35a1Mmhjb1BFV2lOMDlHTTF4Nnc1VGpScURwRkpJc3ZTbEw4WENiUVlLTw==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(13, NULL, 'Battle12', 'Mania12', 'bm567', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+12@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35a3S29zNzRjMUpnRnRCVWpZVGJMWElyZEh6ZXBobE14aWtxNUVQWjlEMA==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(14, NULL, 'Battle13', 'Mania13', 'bm568', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+13@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35a5VDVQRUhlTTZLM09qaFFCWExZdkc0MHkxcUp4cDluN2ZJbGROYld1Vg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(15, NULL, 'Battle14', 'Mania14', 'bm569', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+14@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35a8RHpJeUVQbEJmalVuNml3UlNoRjJrVG1jcjlaMXU1Z3E3THhhQW90OA==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(16, NULL, 'Battle15', 'Mania15', 'bm570', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+15@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35aadmFOQkpWS0hVdU1sUml5bXdqWmJoUDlRcVRYQU9Jc2VZNmswOEQyUw==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(17, NULL, 'Battle16', 'Mania16', 'bm571', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+16@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35acckUyd1NnTTZWcTR2RENsZVFPSkwzbmhwUGZac0hYRlUwaThXek41SQ==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(18, NULL, 'Battle17', 'Mania17', 'bm572', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+17@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35afSWtKV0tYRkFvdlRwTzBNSFU0NWJCckNQd2Y3ZDlteWgxU0dRNnFMMg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(19, NULL, 'Battle18', 'Mania18', 'bm573', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+18@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35b1MlpZdXJCalQzNG5GcWNTb3ZJUE5PaENzZUxiNmFXcGwwUWdLdDdBSA==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(20, NULL, 'Battle19', 'Mania19', 'bm574', 'f5f8faa7f8eb2fc5142477e78418443c', 'support+19@thebattlemania.com', '0', '21/1/2020', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc3e9a35b3Z1hFVFBNOTNwOG1kcUhBU3psY3ZJREdmWmVWMEN3Mk51b0I2eUpybg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', ''),
(21, NULL, 'Demo', 'User', 'demouser', '5f4dcc3b5aa765d61d8327deb882cf99', 'demouser@thebattlemania.com', '', '', '9966339966', 0, 0, 0, '1', '0', NULL, '2020-01-21 11:48:44', '5f2bc4e9a35b3Z1hFVFBNOTNwOG1kcUhBU3psY3ZJREdmWmVWMEN3Mk51b0I2eUpybg==', 0, '', '', '0', 'No', '', 'bmuserapp', '', '1', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notifications_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `game_id` int(5) NOT NULL,
  `id` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `order_no` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courier_id` int(11) NOT NULL,
  `tracking_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_from` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=unknown,1=app,2=web',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_banner_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_browsertitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_menutitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_metatitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_metakeyword` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_publish` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_to_menu` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_to_footer` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_order` int(5) NOT NULL,
  `parent` int(10) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`page_id`, `page_title`, `page_slug`, `page_content`, `page_banner_image`, `page_browsertitle`, `page_menutitle`, `page_metatitle`, `page_metakeyword`, `page_metadesc`, `page_publish`, `add_to_menu`, `add_to_footer`, `page_order`, `parent`, `created_date`) VALUES
(6, 'Contact Us', 'contact', '', '202205301813021748779982__main_bg.jpg', 'Contact Us', 'Contact', 'Contact Us', 'Contact Us', 'Contact Us', '1', '1', '0', 4, 0, '2020-01-06'),
(7, 'How To Install', 'how_to_install', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n', '202205301812541679753074__Main.jpg', 'How To Install', 'How To Install', 'How To Install', 'How To Install', 'How To Install', '1', '1', '0', 3, 0, '2020-01-06'),
(8, 'Home', 'home', '', '', 'Home', 'Home', 'Home', 'Home', 'Home', '1', '1', '0', 1, 0, '2020-01-09'),
(9, 'About Us', 'about-us', '<p><strong><a href=\"http://thebattlemania.com/\" target=\"_blank\">BattleMania</a>&nbsp;</strong>is an Ultimate Solution to all your eSports Games.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br />\r\n<br />\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '202205301812361748926656__Main.jpg', '', 'About Us', '', 'Battlemania', 'Battlemania', '1', '1', '0', 3, 0, '2020-01-18'),
(10, 'Privacy Policy', 'privacy-policy', '<p><strong><a href=\"http://thebattlemania.com/\" target=\"_blank\">BattleMania</a>&nbsp;</strong>is an Ultimate Solution to all your eSports Games.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br />\r\n<br />\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<ul>\r\n	<li>Lorem Ipsum is simply dummy</li>\r\n	<li>Lorem Ipsum is simply dummy</li>\r\n	<li>Lorem Ipsum is simply dummy</li>\r\n</ul>\r\n\r\n<p>Lorem Ipsum</p>\r\n\r\n<p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n', '202205301812291657423949__main_bg.jpg', '', 'Privacy Policy', '', 'Battlemania', 'Battlemania', '1', '1', '0', 4, 9, '2020-01-18'),
(11, 'Terms & Conditions', 'terms_conditions', '<p><strong><a href=\"http://thebattlemania.com/\" target=\"_blank\">BattleMania</a>&nbsp;</strong>is an Ultimate Solution to all your eSports Games.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br />\r\n<br />\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>\r\n\r\n<ul>\r\n	<li>Lorem Ipsum is simply dummy</li>\r\n	<li>Lorem Ipsum is simply dummy</li>\r\n	<li>Lorem Ipsum is simply dummy</li>\r\n</ul>\r\n\r\n<p>Lorem Ipsum</p>\r\n\r\n<p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '202205301812201753219540__main_bg.jpg', '', 'Terms & Conditions', '', 'Battlemania', 'Battlemania', '1', '1', '0', 5, 9, '2020-01-18'),
(12, 'Login', 'login', '', '202205301812121696859832__Main.jpg', '', 'login', '', 'Battlemania', 'Battlemania', '1', '0', '0', 0, 0, '2020-08-21'),
(13, 'Sign Up', 'sign-up', '', '202205301810591665970859__Main.jpg', '', 'Sign Up', '', 'Battlemania', 'Battlemania', '1', '0', '0', 0, 0, '2020-08-21');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `permission_id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permission_id`, `name`, `code_name`, `parent_status`) VALUES
(1, 'Member', 'members', 'parent'),
(2, 'View', 'members_view', '1'),
(3, 'Delete', 'members_delete', '1'),
(4, 'Register Referral', 'register_referral', 'parent'),
(5, 'Join Referral', 'referral', 'parent'),
(6, 'Game', 'game', 'parent'),
(7, 'Edit', 'game_edit', '6'),
(8, 'Delete', 'game_delete', '6'),
(9, 'Matches', 'matches', 'parent'),
(10, 'Edit', 'matches_edit', '9'),
(11, 'Delete', 'matches_delete', '9'),
(12, 'Image', 'image', 'parent'),
(13, 'Edit', 'image_edit', '12'),
(14, 'Delete', 'image_delete', '12'),
(15, 'Product', 'product', 'parent'),
(16, 'Edit', 'product_edit', '15'),
(17, 'Delete', 'product_delete', '15'),
(18, 'Order', 'order', 'parent'),
(19, 'View', 'order_view', '18'),
(20, 'Courier', 'courier', 'parent'),
(21, 'Edit', 'courier_edit', '20'),
(22, 'Delete', 'courier_delete', '20'),
(23, 'Country', 'country', 'parent'),
(24, 'Edit', 'country_edit', '23'),
(25, 'Delete', 'country_delete', '23'),
(26, 'Money Order', 'pgorder', 'parent'),
(27, 'Withdrawal Request', 'withdraw', 'parent'),
(28, 'Top Player', 'topplayers', 'parent'),
(29, 'LeaderBoard', 'leaderboard', 'parent'),
(30, 'Announcement', 'announcement', '30'),
(31, 'Edit', 'announcement_edit', '30'),
(32, 'Delete', 'announcement_delete', '30'),
(33, 'Lottery', 'lottery', 'parent'),
(34, 'Edit', 'lottery_edit', '33'),
(35, 'Delete', 'lottery_delete', '33'),
(36, 'View', 'lottery_view', '33'),
(37, 'Page', 'page', 'parent'),
(38, 'Edit', 'page_edit', '37'),
(39, 'Delete', 'page_delete', '37'),
(40, 'Main Banner', 'homeheader', 'parent'),
(41, 'Screenshots', 'screenshots', 'parent'),
(42, 'Edit', 'screenshots_delete', '41'),
(43, 'Delete', 'screenshots_delete', '41'),
(44, 'Features', 'features', 'parent'),
(45, 'Edit', 'features_edit', '44'),
(46, 'Delete', 'features_delete', '44'),
(47, 'Tab Content', 'tab_content', 'parent'),
(48, 'Edit', 'tab_content_edit', '47'),
(49, 'Delete', 'tab_content_delete', '47'),
(50, 'How to Play', 'how_to_play', 'parent'),
(51, 'Edit', 'how_to_play_edit', '50'),
(52, 'Delete', 'how_to_play_delete', '50'),
(53, 'How to Install', 'download', 'parent'),
(54, 'Edit', 'download_edit', '53'),
(55, 'Delete', 'download_delete', '53'),
(56, 'AppSetting', 'appsetting', 'parent'),
(57, 'Currency', 'currency', 'parent'),
(58, 'Edit', 'currency_edit', '57'),
(59, 'Delete', 'currency_delete', '57'),
(60, 'Withdrawal Method', 'withdraw_method', 'parent'),
(61, 'Edit', 'withdraw_method_edit', '60'),
(62, 'Delete', 'withdraw_method_delete', '60'),
(63, 'PaymentGateway', 'pgdetail', 'parent'),
(64, 'Edit', 'pgdetail_edit', '63'),
(65, 'Delete', 'pgdetail_delete', '63'),
(66, 'App Tutorial', 'youtube', 'parent'),
(67, 'Edit', 'youtube_edit', '66'),
(68, 'Delete', 'youtube_delete', '66'),
(69, 'Slider', 'slider', 'parent'),
(70, 'Edit', 'slider_edit', '69'),
(71, 'Delete', 'slider_delete', '69'),
(72, 'Banner', 'banner', 'parent'),
(73, 'Edit', 'banner_edit', '72'),
(74, 'Delete', 'banner_delete', '72'),
(75, 'License', 'license', 'parent'),
(76, 'Push Notification', 'custom_notification', 'parent'),
(77, 'Admin', 'admin', 'parent'),
(78, 'Edit', 'admin_edit', '77'),
(79, 'Delete', 'admin_delete', '77'),
(80, 'Profile Setting', 'profilesetting', 'parent'),
(81, 'Change Password', 'changepassword', 'parent'),
(82, 'Join Match', 'matches_member_position', '9'),
(83, 'Update Result', 'matches_member_join_match', '9'),
(85, 'Challenge', 'ludo_challenge', 'parent'),
(86, 'View', 'ludo_challenge_view', '85'),
(87, 'Delete', 'ludo_challenge_delete', '85');

-- --------------------------------------------------------

--
-- Table structure for table `pg_detail`
--

CREATE TABLE `pg_detail` (
  `id` int(11) NOT NULL,
  `payment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mid` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkey` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wname` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `itype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` int(11) NOT NULL,
  `currency_point` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pg_detail`
--

INSERT INTO `pg_detail` (`id`, `payment_name`, `payment_description`, `payment_status`, `name`, `mid`, `mkey`, `wname`, `itype`, `currency`, `currency_point`, `date`, `status`, `created_date`) VALUES
(1, 'PayTm', '', '', '', '', '', '', 'Retail', 0, '0', '', '0', '2019-01-29 09:25:19'),
(2, 'PayPal', '', '', '', '', '', '', '', 0, '0', '', '0', '2020-01-07 06:37:18'),
(3, 'Offline', '', '', '', '', '', '', '', 3, '1', '', '1', '2020-03-28 19:45:33'),
(4, 'PayStack', '', '', '', '', '', '', '', 0, '0', '', '0', '2020-04-04 21:45:44'),
(5, 'Instamojo', '', '', '', '', '', '', '', 0, '0', '', '0', '2020-05-02 19:16:40'),
(6, 'Razorpay', '', '', '', '', '', '', '', 0, '0', '', '0', '2020-05-02 19:16:40'),
(7, 'Cashfree', '', '', '', '', '', '', '', 0, '0', '', '0', '2020-05-02 19:16:40'),
(9, 'Tron', '', '', '', '', '', '', '', 6, '1', '', '0', '2021-10-18 14:17:10'),
(10, 'PayU', '', '', '', '', '', '', '', 2, '1', '', '0', '2021-10-18 14:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_actual_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_image`, `product_short_description`, `product_description`, `product_actual_price`, `product_selling_price`, `product_status`, `date_created`) VALUES
(1, 'T-shirt', '202207061052001694149920__pubg-t-shirt.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n', 400, 299, '1', '2021-01-19 17:52:08'),
(2, 'Key Tech Pubg Pocket Watch Metal Keychain ', '202207061051511680236811__pubg_keychain.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n', 300, 149, '1', '2021-01-19 17:52:40');

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `from_mem_id` int(11) NOT NULL,
  `referral_amount` double NOT NULL,
  `referral_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=referral,1=register referral',
  `entry_from` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web',
  `referral_dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `screenshots`
--

CREATE TABLE `screenshots` (
  `screenshots_id` int(11) NOT NULL,
  `screenshot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dp_order` int(11) NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `screenshots`
--

INSERT INTO `screenshots` (`screenshots_id`, `screenshot`, `dp_order`, `status`, `created_date`) VALUES
(1, '202205301814411681102381__1.png', 1, '1', '2020-01-20 17:05:49'),
(2, '202205301814501705148790__2.png', 2, '1', '2020-01-20 17:06:02'),
(3, '202205301815131666421413__3.png', 3, '1', '2020-01-20 17:06:17'),
(4, '202205301815221664734222__4.png', 4, '1', '2020-01-20 17:06:25'),
(5, '202205301815311664794831__5.png', 5, '1', '2020-01-20 17:06:35'),
(6, '202205301815381725734138__6.png', 6, '1', '2020-01-20 17:06:48'),
(7, '202205301815571681172757__7.png', 7, '1', '2020-01-20 17:06:57'),
(8, '202205301816121696021972__8.png', 8, '1', '2020-01-20 17:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL,
  `slider_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_link_type` enum('app','web','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slider_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_id` int(11) NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slider_id`, `slider_title`, `slider_image`, `slider_link_type`, `slider_link`, `link_id`, `status`, `date_created`) VALUES
(1, 'My Wallet', '202205301819491727938289__my_wallet.png', 'app', 'My Wallet', 0, '1', '2021-01-19 18:00:58'),
(2, 'Battle Mania', '202205301819401676792580__BATTLEMANIA.png', 'web', 'http://thebattlemania.com', 0, '1', '2021-01-19 18:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `watch_earn`
--

CREATE TABLE `watch_earn` (
  `watch_earn_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `rewards` int(11) NOT NULL,
  `earning` int(11) NOT NULL,
  `watch_earn_date` date NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_config`
--

CREATE TABLE `web_config` (
  `id` int(11) NOT NULL,
  `web_config_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_config_value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_config`
--

INSERT INTO `web_config` (`id`, `web_config_name`, `web_config_value`) VALUES
(1, 'admin', 'admin2020'),
(3, 'company_address', ''),
(4, 'comapny_phone', ''),
(5, 'company_email', 'xyz@gmail.com'),
(7, 'referral', '5'),
(8, 'referral_level1', '10'),
(9, 'template', 'front'),
(11, 'admin_photo', 'uploads'),
(12, 'company_street', ''),
(13, 'company_time', ''),
(15, 'game_rules', ''),
(16, 'match_url', 'https://demowebapp.thebattlemania.com/'),
(17, 'company_email_for_mail', 'xyz@gmail.com'),
(18, 'copyright_text', '<p>Copyright &copy; 2020 All right Reversed.</p>\r\n'),
(19, 'active_referral', '1'),
(20, 'currency', ' 5'),
(21, 'share_description', 'Refer & earn description'),
(22, 'referandearn_description', 'Invite your friends on App using your Referral Code to Earn 10 When they join First Paid match, with minimum match fee of 20. Your friends also get 5 as Signup Bonus!'),
(23, 'page_banner_image', '202001040944081676039648__card1.jpg'),
(24, 'features_title', 'Features'),
(25, 'features_text', 'Battlemania Application will give you stage to play eSports on <br/> your preferred portable games.'),
(26, 'home_sec_title', 'It’s all about Gaming means BATTLEMANIA App'),
(27, 'home_sec_text', 'Win real cash via playing MOBILE turnaments for free. Get it now!                      '),
(28, 'home_sec_btn', 'Download Now!'),
(29, 'home_sec_bnr_image', '202205301814171742819357__main_bg.jpg'),
(30, 'home_sec_side_image', '202205301814171751435257__11.png'),
(31, 'htp_title', 'How To Play'),
(32, 'htp_text', '  Begin Your Game Now'),
(33, 'min_withdrawal', '30'),
(34, 'one_signal_notification', '1'),
(35, 'payment', ''),
(36, 'min_addmoney', '10'),
(37, 'fb_link', ''),
(38, 'insta_link', ''),
(39, 'twitter_link', ''),
(40, 'google_link', ''),
(41, 'company_about', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n'),
(42, 'company_logo', '202205301820461747783246__logo.png'),
(43, 'company_favicon', '202205301820461748897446__fevicon.png'),
(44, 'app_id', ''),
(45, 'rest_api_key', ''),
(46, 'company_name', 'Battle mania'),
(47, 'user_panel', 'bmuser'),
(48, 'msg91_otp', '0'),
(49, 'under_maintenance', '0'),
(50, 'msg91_authkey', ''),
(51, 'msg91_sender', ''),
(52, 'msg91_route', ''),
(53, 'purchase_code', ''),
(54, 'purchase_code_valid', 'no'),
(55, 'purchase_code_msg', ''),
(56, 'purchase_domain', ''),
(57, 'admin_user', '1'),
(58, 'demo_user', '0'),
(59, 'fb_login', 'no'),
(60, 'firebase_otp', 'no'),
(61, 'google_login', 'no'),
(62, 'user_template', 'bmuserapp'),
(63, 'firebase_api_key', ''),
(64, 'google_client_id', ''),
(65, 'fb_app_id', ''),
(66, 'web_payment', ''),
(69, 'smtp_host', ''),
(70, 'smtp_user', ''),
(71, 'smtp_pass', ''),
(72, 'smtp_port', ''),
(73, 'smtp_secure', ''),
(74, 'comapny_country_code', ''),
(75, 'place_point_show', 'yes'),
(76, 'watch_ads_per_day', '0'),
(77, 'point_on_watch_ads', '0'),
(78, 'watch_earn_description', ''),
(79, 'watch_earn_note', ''),
(80, 'banner_ads_show', 'no'),
(81, 'timezone', 'Asia/Kolkata'),
(82, 'supported_language', '{\"ar\":\"arabic\",\"en\":\"english\"}'),
(83, 'rtl_supported_language', '{\"ar\":\"arabic\",\"arc\":\"aramaic\",\"dv\":\"divehi\",\"fa\":\"persian\",\"ha\":\"hausa\",\"he\":\"hebrew\",\"khw\":\"khowar\",\"ks\":\"kashmiri\",\"ku\":\"kurdish\",\"ps\":\"pashto\",\"ur\":\"urdu\",\"yi\":\"yiddish\"}'),
(84, 'footer_script', ''),
(85, 'firebase_script', ''),
(86, 'coin_up_to_hundrade', '5'),
(87, 'coin_under_hundrade', '10'),
(88, 'admin_profit', '5'),
(89, 'min_require_balance_for_withdrawal', '30'),
(90, 'referral_min_paid_fee', '20');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_method`
--

CREATE TABLE `withdraw_method` (
  `withdraw_method_id` int(11) NOT NULL,
  `withdraw_method` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_method_field` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_method_currency` int(11) NOT NULL,
  `withdraw_method_currency_point` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_method_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_method_dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `youtube_link`
--

CREATE TABLE `youtube_link` (
  `youtube_link_id` int(11) NOT NULL,
  `youtube_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_link_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountstatement`
--
ALTER TABLE `accountstatement`
  ADD PRIMARY KEY (`account_statement_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `app_upload`
--
ALTER TABLE `app_upload`
  ADD PRIMARY KEY (`app_upload_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `challenge_result_upload`
--
ALTER TABLE `challenge_result_upload`
  ADD PRIMARY KEY (`challenge_result_upload_id`);

--
-- Indexes for table `challenge_room_code`
--
ALTER TABLE `challenge_room_code`
  ADD PRIMARY KEY (`challenge_room_code_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`courier_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`deposit_id`);

--
-- Indexes for table `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `features_tab`
--
ALTER TABLE `features_tab`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `features_tab_content`
--
ALTER TABLE `features_tab_content`
  ADD PRIMARY KEY (`ftc_id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `howtoplay_content`
--
ALTER TABLE `howtoplay_content`
  ADD PRIMARY KEY (`htp_content_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `lottery`
--
ALTER TABLE `lottery`
  ADD PRIMARY KEY (`lottery_id`);

--
-- Indexes for table `lottery_member`
--
ALTER TABLE `lottery_member`
  ADD PRIMARY KEY (`lottery_member_id`);

--
-- Indexes for table `ludo_challenge`
--
ALTER TABLE `ludo_challenge`
  ADD PRIMARY KEY (`ludo_challenge_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `match_join_member`
--
ALTER TABLE `match_join_member`
  ADD PRIMARY KEY (`match_join_member_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notifications_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `pg_detail`
--
ALTER TABLE `pg_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`referral_id`);

--
-- Indexes for table `screenshots`
--
ALTER TABLE `screenshots`
  ADD PRIMARY KEY (`screenshots_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `watch_earn`
--
ALTER TABLE `watch_earn`
  ADD PRIMARY KEY (`watch_earn_id`);

--
-- Indexes for table `web_config`
--
ALTER TABLE `web_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_method`
--
ALTER TABLE `withdraw_method`
  ADD PRIMARY KEY (`withdraw_method_id`);

--
-- Indexes for table `youtube_link`
--
ALTER TABLE `youtube_link`
  ADD PRIMARY KEY (`youtube_link_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountstatement`
--
ALTER TABLE `accountstatement`
  MODIFY `account_statement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_upload`
--
ALTER TABLE `app_upload`
  MODIFY `app_upload_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `challenge_result_upload`
--
ALTER TABLE `challenge_result_upload`
  MODIFY `challenge_result_upload_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challenge_room_code`
--
ALTER TABLE `challenge_room_code`
  MODIFY `challenge_room_code_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `courier`
--
ALTER TABLE `courier`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `deposit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `features_tab`
--
ALTER TABLE `features_tab`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `features_tab_content`
--
ALTER TABLE `features_tab_content`
  MODIFY `ftc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `howtoplay_content`
--
ALTER TABLE `howtoplay_content`
  MODIFY `htp_content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lottery`
--
ALTER TABLE `lottery`
  MODIFY `lottery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lottery_member`
--
ALTER TABLE `lottery_member`
  MODIFY `lottery_member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ludo_challenge`
--
ALTER TABLE `ludo_challenge`
  MODIFY `ludo_challenge_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `match_join_member`
--
ALTER TABLE `match_join_member`
  MODIFY `match_join_member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notifications_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `pg_detail`
--
ALTER TABLE `pg_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `referral`
--
ALTER TABLE `referral`
  MODIFY `referral_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `screenshots`
--
ALTER TABLE `screenshots`
  MODIFY `screenshots_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `watch_earn`
--
ALTER TABLE `watch_earn`
  MODIFY `watch_earn_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `web_config`
--
ALTER TABLE `web_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `withdraw_method`
--
ALTER TABLE `withdraw_method`
  MODIFY `withdraw_method_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `youtube_link`
--
ALTER TABLE `youtube_link`
  MODIFY `youtube_link_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
