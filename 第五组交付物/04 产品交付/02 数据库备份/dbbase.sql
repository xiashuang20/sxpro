# Host: localhost  (Version: 5.5.54-log)
# Date: 2019-06-01 13:08:39
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) NOT NULL,
  `dinfo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "department"
#

INSERT INTO `department` VALUES (1,'null','null'),(3,'组织部','企业组织'),(4,'外交部','企业外交'),(5,'人才管理部','人才资源管理');

#
# Structure for table "employee"
#

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(20) NOT NULL,
  `eid` varchar(20) NOT NULL,
  `esex` int(2) NOT NULL DEFAULT '0',
  `ejob` varchar(20) NOT NULL,
  `etelphone` varchar(20) NOT NULL,
  `edepartment` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "employee"
#

INSERT INTO `employee` VALUES (11,'a','dd',1,'q','q','d');

#
# Structure for table "first_menu"
#

DROP TABLE IF EXISTS `first_menu`;
CREATE TABLE `first_menu` (
  `fid` int(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "first_menu"
#

INSERT INTO `first_menu` VALUES (1,'用户管理'),(2,'部门管理'),(3,'职位管理'),(4,'员工管理'),(5,'公告管理');

#
# Structure for table "gg"
#

DROP TABLE IF EXISTS `gg`;
CREATE TABLE `gg` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `gg_name` varchar(255) DEFAULT NULL,
  `gg_content` varchar(255) DEFAULT NULL,
  `gg_time` varchar(255) DEFAULT NULL,
  `gg_person` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "gg"
#


#
# Structure for table "job"
#

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(20) NOT NULL,
  `job_info` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "job"
#

INSERT INTO `job` VALUES (4,'we','ww'),(5,'d','D'),(6,'d','D'),(7,'d11','111'),(8,'d','Daa'),(9,'d11','D'),(10,'d','D'),(11,'d','111'),(12,'d11dd','ddd'),(13,'d','111'),(14,'null','null');

#
# Structure for table "second_menu"
#

DROP TABLE IF EXISTS `second_menu`;
CREATE TABLE `second_menu` (
  `sid` int(10) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `spath` varchar(20) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "second_menu"
#

INSERT INTO `second_menu` VALUES (1,'用户查询','yhcx.jsp',1),(2,'添加用户','tjyh.jsp',1),(3,'部门查询','bmcx.jsp',2),(4,'添加部门','tjbm.jsp',2),(5,'职位查询','zwcx.jsp',3),(6,'添加职位','tjzw.jsp',3),(7,'员工查询','ygcx.jsp',4),(8,'添加员工','tjyg.jsp',4),(9,'公告查询','ggcx.jsp',5),(10,'添加公告','tjgg.jsp',5);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (55,'xia','xia','123456',1),(56,'1','1','1',1);
