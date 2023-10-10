CREATE TABLE `moonshiner_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `gang` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `propid` int(11) NOT NULL,
  `proptype` varchar(50) DEFAULT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;