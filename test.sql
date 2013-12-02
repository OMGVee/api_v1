-- Host: localhost
-- Generation Time: Aug 25, 2013 at 09:35 PM
-- Server version: 5.6.12
-- PHP Version: 5.5.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `test`;


CREATE DATABASE IF NOT EXISTS `test`;
USE `test`;

--
-- Database: `test`
--
-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--
-- Creation: Aug 25, 2013 at 04:36 PM
--
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `limit`, `used`) VALUES
(1, 'test_token', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Creation: Aug 25, 2013 at 03:44 PM
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='user table for the API example' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`) VALUES
(1, 'johndoe'),
(2, 'janedoe'),
(3, 'jd'),
(4, '789'),
(5, 'trololol'),
(6, 'lolovich');
COMMIT;

