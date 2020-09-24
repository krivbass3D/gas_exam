-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.43 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица db_exam.admin_table
CREATE TABLE IF NOT EXISTS `admin_table` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_email_address` varchar(150) NOT NULL,
  `admin_password` varchar(150) NOT NULL,
  `admin_verfication_code` varchar(100) NOT NULL,
  `admin_type` enum('master','sub_master') NOT NULL,
  `admin_created_on` datetime NOT NULL,
  `email_verified` enum('no','yes') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы db_exam.admin_table: 1 rows
DELETE FROM `admin_table`;
/*!40000 ALTER TABLE `admin_table` DISABLE KEYS */;
INSERT INTO `admin_table` (`admin_id`, `admin_email_address`, `admin_password`, `admin_verfication_code`, `admin_type`, `admin_created_on`, `email_verified`) VALUES
	(2, 'admin@admin.com', '$2y$10$2a8RLkEr50wOf/OSQBvxCO4LBDdD1qihtyNxA1l1fDOL5c8YjZAzu', '84fcef5f33a44aa7ba32bb4779a49093', 'sub_master', '2020-06-22 22:00:26', 'yes');
/*!40000 ALTER TABLE `admin_table` ENABLE KEYS */;

-- Дамп структуры для таблица db_exam.online_exam_table
CREATE TABLE IF NOT EXISTS `online_exam_table` (
  `online_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `online_exam_title` varchar(250) NOT NULL,
  `online_exam_datetime` datetime NOT NULL,
  `online_exam_duration` varchar(30) NOT NULL,
  `total_question` int(5) NOT NULL,
  `marks_per_right_answer` varchar(30) NOT NULL,
  `marks_per_wrong_answer` varchar(30) NOT NULL,
  `online_exam_created_on` datetime NOT NULL,
  `online_exam_status` enum('Pending','Created','Started','Completed') NOT NULL,
  `online_exam_code` varchar(100) NOT NULL,
  PRIMARY KEY (`online_exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы db_exam.online_exam_table: ~6 rows (приблизительно)
DELETE FROM `online_exam_table`;
/*!40000 ALTER TABLE `online_exam_table` DISABLE KEYS */;
INSERT INTO `online_exam_table` (`online_exam_id`, `admin_id`, `online_exam_title`, `online_exam_datetime`, `online_exam_duration`, `total_question`, `marks_per_right_answer`, `marks_per_wrong_answer`, `online_exam_created_on`, `online_exam_status`, `online_exam_code`) VALUES
	(35, 2, 'Математика', '2020-06-30 09:50:00', '5', 5, '1', '1', '2020-06-30 09:33:47', 'Completed', '09d0b10c2af0f047ed7b884f3963afdf'),
	(36, 2, '1', '2020-06-30 10:35:00', '5', 5, '1', '1', '2020-06-30 10:25:56', 'Completed', 'a8af84a1874ae2e5a4cd0d01c6a43f31'),
	(37, 2, '2', '2020-06-30 11:25:00', '5', 5, '1', '1', '2020-06-30 11:11:25', 'Completed', '76d23311be2751cbe7bbf0eed88edb90'),
	(38, 2, '3', '2020-06-30 11:50:00', '5', 5, '1', '1', '2020-06-30 11:45:35', 'Completed', '6fa6ba020caa99b6a0ed4a4b44c0b85d'),
	(39, 2, '4', '2020-06-30 12:20:00', '5', 5, '1', '1', '2020-06-30 12:18:51', 'Completed', 'f186f653262d44ef309ab89353c2a22a'),
	(40, 2, '5', '2020-06-30 12:30:00', '5', 5, '1', '1', '2020-06-30 12:25:47', 'Completed', '9680c099a16dc0db53c63be776c99c79'),
	(41, 2, 'rtr', '2020-07-11 23:55:00', '5', 5, '1', '1', '2020-06-30 13:24:31', 'Completed', '3ffea5c40dc5f5eb00a2b5bae0ab7e61');
/*!40000 ALTER TABLE `online_exam_table` ENABLE KEYS */;

-- Дамп структуры для таблица db_exam.option_table
CREATE TABLE IF NOT EXISTS `option_table` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_number` int(2) NOT NULL,
  `option_title` varchar(250) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы db_exam.option_table: ~132 rows (приблизительно)
DELETE FROM `option_table`;
/*!40000 ALTER TABLE `option_table` DISABLE KEYS */;
INSERT INTO `option_table` (`option_id`, `question_id`, `option_number`, `option_title`) VALUES
	(1, 1, 1, '4'),
	(2, 1, 2, '7'),
	(3, 1, 3, '8'),
	(4, 1, 4, '1'),
	(5, 2, 1, '5'),
	(6, 2, 2, '4'),
	(7, 2, 3, '6'),
	(8, 2, 4, '3'),
	(9, 3, 1, '1'),
	(10, 3, 2, '3'),
	(11, 3, 3, '2'),
	(12, 3, 4, '7'),
	(13, 4, 1, '7'),
	(14, 4, 2, '5'),
	(15, 4, 3, '8'),
	(16, 4, 4, '1'),
	(17, 5, 1, '25'),
	(18, 5, 2, '1'),
	(19, 5, 3, '10'),
	(20, 5, 4, '4'),
	(21, 6, 1, '3'),
	(22, 6, 2, '3'),
	(23, 6, 3, '3'),
	(24, 6, 4, '3'),
	(25, 7, 1, '2'),
	(26, 7, 2, '2'),
	(27, 7, 3, '2'),
	(28, 7, 4, '2'),
	(29, 8, 1, '1'),
	(30, 8, 2, '1'),
	(31, 8, 3, '1'),
	(32, 8, 4, '1'),
	(33, 9, 1, '4'),
	(34, 9, 2, '4'),
	(35, 9, 3, '4'),
	(36, 9, 4, '4'),
	(37, 10, 1, '5'),
	(38, 10, 2, '5'),
	(39, 10, 3, '5'),
	(40, 10, 4, '5'),
	(41, 11, 1, '1'),
	(42, 11, 2, '1'),
	(43, 11, 3, '1'),
	(44, 11, 4, '1'),
	(45, 12, 1, '2'),
	(46, 12, 2, '2'),
	(47, 12, 3, '2'),
	(48, 12, 4, '2'),
	(49, 13, 1, '3'),
	(50, 13, 2, '3'),
	(51, 13, 3, '3'),
	(52, 13, 4, '3'),
	(53, 14, 1, '4'),
	(54, 14, 2, '4'),
	(55, 14, 3, '4'),
	(56, 14, 4, '4'),
	(57, 15, 1, '5'),
	(58, 15, 2, '5'),
	(59, 15, 3, '5'),
	(60, 15, 4, '5'),
	(61, 16, 1, '3'),
	(62, 16, 2, '3'),
	(63, 16, 3, '3'),
	(64, 16, 4, '3'),
	(65, 17, 1, '3'),
	(66, 17, 2, '3'),
	(67, 17, 3, '3'),
	(68, 17, 4, '3'),
	(69, 18, 1, '3'),
	(70, 18, 2, '3'),
	(71, 18, 3, '3'),
	(72, 18, 4, '3'),
	(73, 19, 1, '3'),
	(74, 19, 2, '3'),
	(75, 19, 3, '3'),
	(76, 19, 4, '3'),
	(77, 20, 1, '3'),
	(78, 20, 2, '3'),
	(79, 20, 3, '3'),
	(80, 20, 4, '3'),
	(81, 21, 1, '1'),
	(82, 21, 2, '1'),
	(83, 21, 3, '1'),
	(84, 21, 4, '1'),
	(85, 22, 1, '2'),
	(86, 22, 2, '2'),
	(87, 22, 3, '2'),
	(88, 22, 4, '2'),
	(89, 23, 1, '3'),
	(90, 23, 2, '3'),
	(91, 23, 3, '3'),
	(92, 23, 4, '3'),
	(93, 24, 1, '4'),
	(94, 24, 2, '4'),
	(95, 24, 3, '4'),
	(96, 24, 4, '4'),
	(97, 25, 1, '5'),
	(98, 25, 2, '5'),
	(99, 25, 3, '5'),
	(100, 25, 4, '5'),
	(101, 26, 1, '5'),
	(102, 26, 2, '5'),
	(103, 26, 3, '5'),
	(104, 26, 4, '5'),
	(105, 27, 1, '5'),
	(106, 27, 2, '5'),
	(107, 27, 3, '5'),
	(108, 27, 4, '5'),
	(109, 28, 1, '5'),
	(110, 28, 2, '5'),
	(111, 28, 3, '5'),
	(112, 28, 4, '5'),
	(113, 29, 1, '5'),
	(114, 29, 2, '5'),
	(115, 29, 3, '5'),
	(116, 29, 4, '5'),
	(117, 30, 1, '5'),
	(118, 30, 2, '5'),
	(119, 30, 3, '5'),
	(120, 30, 4, '5'),
	(121, 31, 1, 'rtr1'),
	(122, 31, 2, 'rtr1'),
	(123, 31, 3, 'rtr1'),
	(124, 31, 4, 'rtr1'),
	(125, 32, 1, 'rtr2'),
	(126, 32, 2, 'rtr2'),
	(127, 32, 3, 'rtr2'),
	(128, 32, 4, 'rtr3'),
	(129, 33, 1, 'df'),
	(130, 33, 2, 'df'),
	(131, 33, 3, 'df'),
	(132, 33, 4, 'df'),
	(133, 34, 1, 'df'),
	(134, 34, 2, 'df'),
	(135, 34, 3, 'df'),
	(136, 34, 4, 'df'),
	(137, 35, 1, 'dfdf'),
	(138, 35, 2, 'df'),
	(139, 35, 3, 'df'),
	(140, 35, 4, 'df');
/*!40000 ALTER TABLE `option_table` ENABLE KEYS */;

-- Дамп структуры для таблица db_exam.question_table
CREATE TABLE IF NOT EXISTS `question_table` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `online_exam_id` int(11) NOT NULL,
  `question_title` mediumtext NOT NULL,
  `answer_option` enum('1','2','3','4') NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы db_exam.question_table: ~31 rows (приблизительно)
DELETE FROM `question_table`;
/*!40000 ALTER TABLE `question_table` DISABLE KEYS */;
INSERT INTO `question_table` (`question_id`, `online_exam_id`, `question_title`, `answer_option`) VALUES
	(1, 35, '2+2', '1'),
	(2, 35, '2*2', '2'),
	(3, 35, '1+1', '3'),
	(4, 35, '1*1', '4'),
	(5, 35, '5*5', '1'),
	(6, 36, '3', '1'),
	(7, 36, '2', '2'),
	(8, 36, '1', '3'),
	(9, 36, '4', '4'),
	(10, 36, '5', '2'),
	(11, 37, '1', '1'),
	(12, 37, '2', '2'),
	(13, 37, '3', '3'),
	(14, 37, '4', '4'),
	(15, 37, '5', '1'),
	(16, 38, '3', '1'),
	(17, 38, '3', '2'),
	(18, 38, '3', '3'),
	(19, 38, '3', '4'),
	(20, 38, '3', '1'),
	(21, 39, '1', '1'),
	(22, 39, '2', '2'),
	(23, 39, '3', '3'),
	(24, 39, '4', '4'),
	(25, 39, '5', '3'),
	(26, 40, '5', '1'),
	(27, 40, '5', '2'),
	(28, 40, '5', '3'),
	(29, 40, '5', '4'),
	(30, 40, '5', '1'),
	(31, 41, 'rtr', '1'),
	(32, 41, 'rtr', '2'),
	(33, 41, 'f', '3'),
	(34, 41, 'df', '2'),
	(35, 41, 'df', '4');
/*!40000 ALTER TABLE `question_table` ENABLE KEYS */;

-- Дамп структуры для таблица db_exam.user_exam_enroll_table
CREATE TABLE IF NOT EXISTS `user_exam_enroll_table` (
  `user_exam_enroll_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `attendance_status` enum('Absent','Present') NOT NULL,
  PRIMARY KEY (`user_exam_enroll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы db_exam.user_exam_enroll_table: ~6 rows (приблизительно)
DELETE FROM `user_exam_enroll_table`;
/*!40000 ALTER TABLE `user_exam_enroll_table` DISABLE KEYS */;
INSERT INTO `user_exam_enroll_table` (`user_exam_enroll_id`, `user_id`, `exam_id`, `attendance_status`) VALUES
	(1, 1, 35, 'Present'),
	(2, 1, 36, 'Present'),
	(3, 1, 37, 'Absent'),
	(4, 1, 38, 'Present'),
	(5, 1, 39, 'Present'),
	(6, 1, 40, 'Present'),
	(7, 1, 41, 'Present');
/*!40000 ALTER TABLE `user_exam_enroll_table` ENABLE KEYS */;

-- Дамп структуры для таблица db_exam.user_exam_question_answer
CREATE TABLE IF NOT EXISTS `user_exam_question_answer` (
  `user_exam_question_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_answer_option` enum('0','1','2','3','4') NOT NULL,
  `marks` varchar(20) NOT NULL,
  PRIMARY KEY (`user_exam_question_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы db_exam.user_exam_question_answer: ~28 rows (приблизительно)
DELETE FROM `user_exam_question_answer`;
/*!40000 ALTER TABLE `user_exam_question_answer` DISABLE KEYS */;
INSERT INTO `user_exam_question_answer` (`user_exam_question_answer_id`, `user_id`, `exam_id`, `question_id`, `user_answer_option`, `marks`) VALUES
	(1, 1, 35, 1, '0', '0'),
	(2, 1, 35, 2, '0', '0'),
	(3, 1, 35, 3, '0', '0'),
	(4, 1, 35, 4, '0', '0'),
	(5, 1, 35, 5, '0', '0'),
	(6, 1, 36, 6, '4', '-1'),
	(7, 1, 36, 7, '0', '0'),
	(8, 1, 36, 8, '0', '0'),
	(9, 1, 36, 9, '0', '0'),
	(10, 1, 36, 10, '0', '0'),
	(11, 1, 38, 16, '0', '0'),
	(12, 1, 38, 17, '0', '0'),
	(13, 1, 38, 18, '0', '0'),
	(14, 1, 38, 19, '0', '0'),
	(15, 1, 38, 20, '0', '0'),
	(16, 1, 39, 21, '0', '0'),
	(17, 1, 39, 22, '0', '0'),
	(18, 1, 39, 23, '0', '0'),
	(19, 1, 39, 24, '0', '0'),
	(20, 1, 39, 25, '0', '0'),
	(21, 1, 40, 26, '1', '+1'),
	(22, 1, 40, 27, '3', '-1'),
	(23, 1, 40, 28, '2', '-1'),
	(24, 1, 40, 29, '3', '-1'),
	(25, 1, 40, 30, '1', '+1'),
	(26, 1, 41, 31, '4', '-1'),
	(27, 1, 41, 32, '1', '-1'),
	(28, 1, 41, 33, '2', '-1'),
	(29, 1, 41, 34, '2', '+1'),
	(30, 1, 41, 35, '4', '+1');
/*!40000 ALTER TABLE `user_exam_question_answer` ENABLE KEYS */;

-- Дамп структуры для таблица db_exam.user_table
CREATE TABLE IF NOT EXISTS `user_table` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email_address` varchar(250) NOT NULL,
  `user_password` varchar(150) NOT NULL,
  `user_verfication_code` varchar(100) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `user_gender` enum('Male','Female') NOT NULL,
  `user_address` mediumtext NOT NULL,
  `user_mobile_no` varchar(30) NOT NULL,
  `user_image` varchar(150) NOT NULL,
  `user_created_on` datetime NOT NULL,
  `user_email_verified` enum('no','yes') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы db_exam.user_table: ~2 rows (приблизительно)
DELETE FROM `user_table`;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` (`user_id`, `user_email_address`, `user_password`, `user_verfication_code`, `user_name`, `user_gender`, `user_address`, `user_mobile_no`, `user_image`, `user_created_on`, `user_email_verified`) VALUES
	(1, 'user@user.com', '$2y$10$PoyOw92/X.oY4QxT7to8KuqUTknseeUR3F4nann/0cYGjjXENatzy', '0d5d088d610ef333d48f10d96f871f54', 'user', 'Male', 'user аcvb  ва3453', '65854', '5ef4553a00514.jpg', '2020-06-25 10:41:45', 'yes');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
