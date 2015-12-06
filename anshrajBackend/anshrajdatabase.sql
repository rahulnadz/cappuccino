-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2015 at 09:18 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anshrajdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `alacartechannel`
--

CREATE TABLE IF NOT EXISTS `alacartechannel` (
  `id` int(10) NOT NULL,
  `packageid` int(10) NOT NULL,
  `channelname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alacartejunk`
--

CREATE TABLE IF NOT EXISTS `alacartejunk` (
  `id` int(11) NOT NULL,
  `alacartepackageid` int(11) NOT NULL,
  `alacartechannelid` int(11) NOT NULL,
  `vcid` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `duration` enum('monthy','quaterly','yearly') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alacartepackage`
--

CREATE TABLE IF NOT EXISTS `alacartepackage` (
  `id` int(3) NOT NULL,
  `pacakge` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alacartepackage`
--

INSERT INTO `alacartepackage` (`id`, `pacakge`) VALUES
(1, 'regional tamil'),
(2, 'regional telagu'),
(3, 'regional marathi'),
(4, 'sports');

-- --------------------------------------------------------

--
-- Table structure for table `custinfo`
--

CREATE TABLE IF NOT EXISTS `custinfo` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(13) NOT NULL,
  `remainingbalance` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custinfo`
--

INSERT INTO `custinfo` (`id`, `cid`, `name`, `address`, `contact`, `remainingbalance`) VALUES
(1, 0, 'rahul', '', '7208681534', 0),
(2, 0, 'rahul', 'kamraj nagar', '7208681534', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lcocode`
--

CREATE TABLE IF NOT EXISTS `lcocode` (
  `id` int(11) NOT NULL,
  `lcocode` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lcocode`
--

INSERT INTO `lcocode` (`id`, `lcocode`) VALUES
(1, 'mb007'),
(2, 'mb598');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `amount` int(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `cid`, `amount`, `date`) VALUES
(1, 1, 1200, '2015-12-03 15:44:04'),
(2, 1, 1200, '2015-12-03 15:46:40'),
(3, 1, 300, '2015-12-03 15:47:40'),
(4, 1, 300, '2015-12-03 15:49:53'),
(5, 1, 300, '2015-12-03 15:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `properiter`
--

CREATE TABLE IF NOT EXISTS `properiter` (
  `id` int(11) NOT NULL,
  `lcocode` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(13) NOT NULL,
  `address` varchar(255) NOT NULL,
  `networkname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'inactive'),
(3, 'transfer');

-- --------------------------------------------------------

--
-- Table structure for table `statusjunk`
--

CREATE TABLE IF NOT EXISTS `statusjunk` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stbinfo`
--

CREATE TABLE IF NOT EXISTS `stbinfo` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `vcnumber` varchar(20) NOT NULL,
  `lcocode` int(10) NOT NULL,
  `package` int(10) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stbinfo`
--

INSERT INTO `stbinfo` (`id`, `cid`, `vcnumber`, `lcocode`, `package`, `status`) VALUES
(1, 1, '00001231331', 0, 0, 0),
(2, 2, '00001231321', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE IF NOT EXISTS `transfer` (
  `id` int(11) NOT NULL,
  `vcid` int(11) NOT NULL,
  `tolco` int(11) NOT NULL,
  `fromlco` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(13) NOT NULL,
  `lcocode` int(11) NOT NULL,
  `access` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alacartechannel`
--
ALTER TABLE `alacartechannel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alacartejunk`
--
ALTER TABLE `alacartejunk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alacartepackage`
--
ALTER TABLE `alacartepackage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custinfo`
--
ALTER TABLE `custinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lcocode`
--
ALTER TABLE `lcocode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properiter`
--
ALTER TABLE `properiter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statusjunk`
--
ALTER TABLE `statusjunk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stbinfo`
--
ALTER TABLE `stbinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alacartechannel`
--
ALTER TABLE `alacartechannel`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `alacartejunk`
--
ALTER TABLE `alacartejunk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `alacartepackage`
--
ALTER TABLE `alacartepackage`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `custinfo`
--
ALTER TABLE `custinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lcocode`
--
ALTER TABLE `lcocode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `properiter`
--
ALTER TABLE `properiter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `statusjunk`
--
ALTER TABLE `statusjunk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stbinfo`
--
ALTER TABLE `stbinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
