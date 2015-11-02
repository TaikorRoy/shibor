-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-08-28 10:32:19
-- 服务器版本： 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shibor`
--

-- --------------------------------------------------------

--
-- 表的结构 `shibor`
--

CREATE TABLE IF NOT EXISTS `shibor` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `term` varchar(16) NOT NULL COMMENT '期限',
  `rate` float(11,4) NOT NULL COMMENT ' Shibor(%)',
  `shifting` float(11,2) NOT NULL COMMENT '涨跌(BP)',
  `linkurl` varchar(64) DEFAULT NULL COMMENT '连接的URL',
  `clientip` varchar(30) DEFAULT NULL COMMENT '客户端IP',
  `issuetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `logtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '日志时间'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='shibor表（上海银行间同业拆放利率表）';

--
-- 转存表中的数据 `shibor`
--

INSERT INTO `shibor` (`id`, `term`, `rate`, `shifting`, `linkurl`, `clientip`, `issuetime`, `updatetime`, `logtime`) VALUES
(1, 'O/N', 1.7740, 1.50, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:05', '0000-00-00 00:00:00'),
(2, '1W', 2.3920, -0.60, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:06', '0000-00-00 00:00:00'),
(3, '2W', 2.9100, 12.50, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:06', '0000-00-00 00:00:00'),
(4, '1M', 2.9990, 4.10, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:06', '0000-00-00 00:00:00'),
(5, '3M', 3.0980, 0.20, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:06', '0000-00-00 00:00:00'),
(6, '6M', 3.2595, 0.05, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:06', '0000-00-00 00:00:00'),
(7, '9M', 3.2895, 0.30, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:06', '0000-00-00 00:00:00'),
(8, '1Y', 3.4000, 0.00, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:06', '0000-00-00 00:00:00'),
(9, 'O/N', 1.7740, 1.50, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:12', '0000-00-00 00:00:00'),
(10, '1W', 2.3920, -0.60, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:12', '0000-00-00 00:00:00'),
(11, '2W', 2.9100, 12.50, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:12', '0000-00-00 00:00:00'),
(12, '1M', 2.9990, 4.10, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:12', '0000-00-00 00:00:00'),
(13, '3M', 3.0980, 0.20, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:12', '0000-00-00 00:00:00'),
(14, '6M', 3.2595, 0.05, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:13', '0000-00-00 00:00:00'),
(15, '9M', 3.2895, 0.30, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:13', '0000-00-00 00:00:00'),
(16, '1Y', 3.4000, 0.00, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:13', '0000-00-00 00:00:00'),
(17, 'O/N', 1.7740, 1.50, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:18', '0000-00-00 00:00:00'),
(18, '1W', 2.3920, -0.60, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:18', '0000-00-00 00:00:00'),
(19, '2W', 2.9100, 12.50, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:18', '0000-00-00 00:00:00'),
(20, '1M', 2.9990, 4.10, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:18', '0000-00-00 00:00:00'),
(21, '3M', 3.0980, 0.20, 'http://www.shibor.org/shibor/web/html/shibor.html', NULL, '2015-08-28 01:30:00', '2015-08-28 08:32:18', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shibor`
--
ALTER TABLE `shibor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shibor`
--
ALTER TABLE `shibor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
