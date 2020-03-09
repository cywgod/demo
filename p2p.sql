/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.27 : Database - p2p
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`p2p` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `p2p`;

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `adminusername` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '后台用户名',
  `adminpassword` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '后台用户密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `adminuser` */

insert  into `adminuser`(`id`,`adminusername`,`adminpassword`) values (1,'admin','123');

/*Table structure for table `bankcard` */

DROP TABLE IF EXISTS `bankcard`;

CREATE TABLE `bankcard` (
  `id` int(20) DEFAULT NULL,
  `card` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '卡号',
  `bank` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行名字',
  `bid` int(20) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`bid`),
  KEY `id` (`id`),
  CONSTRAINT `bankcard_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bankcard` */

insert  into `bankcard`(`id`,`card`,`bank`,`bid`,`money`) values (5,'1232131','中国银行',3,NULL),(5,'1235567','中国银行',4,NULL),(5,'131231231','中国银行',5,NULL),(5,'12321321','中国银行',6,NULL);

/*Table structure for table `credit` */

DROP TABLE IF EXISTS `credit`;

CREATE TABLE `credit` (
  `id3` int(20) NOT NULL AUTO_INCREMENT,
  `lid` int(20) DEFAULT NULL COMMENT 'loan外键',
  `level` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信用等级',
  `itemname` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `invest` double DEFAULT NULL COMMENT '放款金额',
  `downinvest` double DEFAULT NULL COMMENT '已投金额',
  `guarantors` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '担保机构',
  PRIMARY KEY (`id3`),
  KEY `lid` (`lid`),
  CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`lid`) REFERENCES `loan` (`id2`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `credit` */

insert  into `credit`(`id3`,`lid`,`level`,`itemname`,`invest`,`downinvest`,`guarantors`) values (1,19,'a','ddd',20000,18000,'中国平安'),(2,1,'b','dduua',30000,30000,'中国平安'),(3,3,'b','ccop',30000,28000,'中国平安'),(4,25,'a','bttt',30000,8000,'中国平安'),(5,16,'a','qwer',30000,0,'中国平安');

/*Table structure for table `invest` */

DROP TABLE IF EXISTS `invest`;

CREATE TABLE `invest` (
  `id6` int(20) NOT NULL AUTO_INCREMENT COMMENT '投资表',
  `usid` int(20) DEFAULT NULL COMMENT '用户id，外键',
  `crid` int(20) DEFAULT NULL COMMENT '信用标id，外键',
  `money` double DEFAULT NULL COMMENT '投资金额',
  `intime` date DEFAULT NULL COMMENT '投资时间',
  `describ` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id6`),
  KEY `usid` (`usid`),
  KEY `crid` (`crid`),
  CONSTRAINT `invest_ibfk_1` FOREIGN KEY (`usid`) REFERENCES `user` (`id`),
  CONSTRAINT `invest_ibfk_2` FOREIGN KEY (`crid`) REFERENCES `credit` (`id3`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `invest` */

insert  into `invest`(`id6`,`usid`,`crid`,`money`,`intime`,`describ`) values (3,7,1,5000,NULL,'投资'),(4,7,1,2500,NULL,'投资'),(5,5,2,10000,NULL,'投资'),(6,18,2,1000,NULL,'投资'),(7,19,2,1000,NULL,'投资'),(8,20,2,10000,NULL,'投资'),(9,20,2,5000,NULL,'投资'),(10,20,2,1000,NULL,'投资'),(11,5,2,1000,NULL,'投资'),(12,5,1,1000,NULL,'投资'),(13,20,1,1000,NULL,'投资'),(14,21,1,2500,NULL,'投资'),(15,22,2,200,NULL,'投资'),(16,23,2,300,NULL,'投资'),(17,4,2,500,NULL,'投资'),(18,5,3,5000,'2019-12-01','投资'),(19,5,3,300,'2019-12-02','投资'),(20,5,3,300,'2019-12-02','投资'),(21,5,3,200,'2019-12-02','投资'),(22,7,1,3000,'2019-12-02','投资'),(23,7,1,1000,'2019-12-02','投资'),(24,7,1,2000,'2019-12-02','投资'),(25,7,3,1000,'2019-12-02','投资'),(26,7,3,300,'2019-12-02','投资'),(27,24,3,1000,'2019-12-02','投资'),(28,24,3,200,'2019-12-02','投资'),(29,5,3,1000,'2019-12-03','投资'),(30,5,4,5000,'2019-12-06','投资'),(31,25,4,1000,'2019-12-06','投资'),(32,5,3,1000,'2019-12-09','投资'),(33,5,4,200,'2019-12-09','投资'),(34,5,4,200,'2019-12-09','投资'),(35,5,4,600,'2019-12-09','投资'),(36,27,4,1000,'2019-12-09','投资'),(37,5,3,1000,'2019-12-09','投资');

/*Table structure for table `invit` */

DROP TABLE IF EXISTS `invit`;

CREATE TABLE `invit` (
  `id5` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) DEFAULT NULL COMMENT '邀请码主人',
  `bid` int(20) DEFAULT NULL COMMENT '被邀请人的id外键',
  `onece` double DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`id5`),
  KEY `bid` (`bid`),
  CONSTRAINT `invit_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `invit` */

insert  into `invit`(`id5`,`uid`,`bid`,`onece`) values (1,5,18,1000),(2,5,19,1000),(3,5,20,10000),(4,7,21,2500),(5,5,22,200),(6,4,23,300),(7,21,24,1000),(8,5,25,1000),(9,5,27,1000);

/*Table structure for table `loan` */

DROP TABLE IF EXISTS `loan`;

CREATE TABLE `loan` (
  `id2` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) DEFAULT NULL COMMENT '用户主键',
  `city` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '居住城市',
  `name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '移动电话',
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `birthday` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '出生日期',
  `loanmoney` double DEFAULT NULL COMMENT '借款金额',
  `loanuptime` int(30) DEFAULT NULL COMMENT '借款期限',
  `wages` int(30) DEFAULT NULL COMMENT '工资',
  `pd` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '该借款的状态',
  `describ` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '借款描述',
  `requesttype` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求交易的类型',
  `time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '时间',
  `fabiao` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发标/已发标',
  `rate` double DEFAULT NULL COMMENT '年利率',
  PRIMARY KEY (`id2`),
  KEY `uid` (`uid`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `loan` */

insert  into `loan`(`id2`,`uid`,`city`,`name`,`mobile`,`sex`,`birthday`,`loanmoney`,`loanuptime`,`wages`,`pd`,`describ`,`requesttype`,`time`,`fabiao`,`rate`) values (1,8,'哈哈哈','狙击','15812341234','先生','2019-11-19',30000,12,3000,'审核通过','123123','借款','2019-11-27 12:01:11','已发标',12),(3,4,'江阴','宝宝','15812351456','先生','2019-11-01',30000,18,6000,'审核通过','213qwe','借款','2019-11-27 12:01:11','已发标',18),(4,7,'长沙','哈哈哈','13512341234','女士','2003-11-04',300000,24,20000,'审核不通过','12312321','借款','2019-11-27 12:01:11','发标',24),(5,8,'湖南','李云龙','13612341256','女士','2019-11-01',30000,12,8000,'审核通过','11231qw','借款','2019-11-27 12:01:11','发标',12),(6,8,'黄山','鹅鹅鹅','13512341236','先生','2019-11-01',30000,12,30000,'审核通过','wwwwwwww','借款','2019-11-27 13:15:33','发标',12),(8,5,'你那','好好','15815671234','先生','2019-11-12',30000,12,5000,'审核通过','fdddd','借款','2019-11-27 12:01:11','发标',12),(13,8,'江阴','茄子','15812341234','先生','2019-11-01',4000,12,8000,'审核通过','sdfsdfsdfs','借款','2019-11-27 12:11:44','发标',12),(16,5,'江阴','cyw','15812351456','先生','2019-11-12',300000,12,20000,'审核通过','哈哈哈哈','借款','2019-11-27 13:01:20','已发标',12),(17,5,'江阴','cyw','15812341234','先生','2019-11-04',30000,12,20000,'审核通过','sdfsdfsdfs1111111111','借款','2019-11-27 13:08:08','发标',12),(18,8,'江阴','cyw','15812341234','先生','2019-11-13',40000,12,8000,'审核通过','哈哈哈哈ewrre','借款','2019-11-27 13:12:30','发标',12),(19,8,'长沙','cyw','15812341234','先生','2019-11-01',40000,12,30000,'审核通过','eeeee','借款','2019-11-27 13:15:33','已发标',12),(20,7,'湖南','asd','15812351456','先生','2019-11-06',30000,18,20000,'待审核','哈哈哈哈','借款','2019-11-29 10:55:50','发标',18),(21,5,'江阴','qwasd','15812341234','先生','2001-12-01',30000,12,8000,'待审核','哈哈哈哈','借款','2019-12-02 10:12:20','发标',12),(22,5,'江阴','cyw','15812351456','先生','2019-12-02',40000,12,20000,'待审核','哈哈哈哈ewrre','借款','2019-12-03 10:59:21','发标',12),(23,5,'江阴','茄子','15812341234','先生','2019-12-02',30000,12,8000,'待审核','eeeee','借款','2019-12-03 13:17:17','发标',12),(24,5,'江阴','茄子','15812341234','先生','2019-12-02',30000,12,6000,'待审核','dddd1312321','借款','2019-12-03 13:22:58','发标',12),(25,5,'江阴','茄子','15812341234','先生','2019-12-02',30000,12,8000,'审核通过','sdfsdfsdfs1111111111','借款','2019-12-03 13:24:41','已发标',12),(26,5,'江阴','茄子','15812341234','先生','2002-12-11',30000,12,8000,'审核通过','sfsd','借款','2019-12-09 13:26:56','发标',12);

/*Table structure for table `someinfo` */

DROP TABLE IF EXISTS `someinfo`;

CREATE TABLE `someinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '查询表',
  `time` datetime DEFAULT NULL,
  `userid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户',
  `transaction` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易类型',
  `transdescribe` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易详情',
  `handlemoney` double DEFAULT NULL COMMENT '操作金额',
  `moneyrate` double DEFAULT NULL COMMENT '利率',
  `balance` double DEFAULT NULL COMMENT '账户余额',
  `number` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '投资订单号',
  `moneyget` double DEFAULT NULL COMMENT '代收money',
  `xmname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `checkid` int(20) DEFAULT NULL COMMENT 'id',
  PRIMARY KEY (`id`),
  KEY `loid` (`time`),
  KEY `inid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `someinfo` */

insert  into `someinfo`(`id`,`time`,`userid`,`transaction`,`transdescribe`,`handlemoney`,`moneyrate`,`balance`,`number`,`moneyget`,`xmname`,`checkid`) values (1,'2019-12-02 09:46:52','www','充值','已充值',200,NULL,1800,NULL,NULL,NULL,NULL),(2,'2019-12-02 09:55:26','www','充值','已充值',200,NULL,2000,NULL,NULL,NULL,NULL),(3,'2019-12-02 09:55:39','www','提现','已提现',500,NULL,1500,NULL,NULL,NULL,NULL),(4,'2019-12-02 10:12:20','www','借款','待审核',30000,12,1500,NULL,NULL,NULL,NULL),(5,'2019-12-02 10:32:56','www','充值','已充值',500,NULL,2000,NULL,NULL,NULL,NULL),(6,'2019-12-02 10:33:17','www','提现','已提现',200,NULL,1800,NULL,NULL,NULL,NULL),(7,'2019-12-02 13:58:32','www','投资','投资成功',200,18,1800,'8e32e87c1a444582ab75e43542ad3a13',54,'ddd',NULL),(8,'2019-12-02 14:22:43','ccc','投资','投资成功',3000,12,0,'5228a77738014350bc483b6d3e918ae4',810,'ccop',NULL),(9,'2019-12-02 14:23:03','ccc','充值','已充值',2000,NULL,2000,NULL,NULL,NULL,NULL),(10,'2019-12-02 14:59:24','ccc','投资','投资成功',2000,12,2000,'62675a4848d34b099f38e5de1ccf6521',360,'ddd',NULL),(11,'2019-12-02 15:02:42','ccc','投资','投资成功',1000,18,2000,'38f6d438f1a84f28b4cceb32930af5fa',270,'ddd',NULL),(12,'2019-12-02 15:58:13','ccc','投资','投资成功',300,18,2000,'e134ffa677224c888a63ac13963d5c62',81,'ccop',NULL),(13,'2019-12-02 16:09:44','vnm','投资','投资成功',1000,18,0,'566231eb0332443f9bd8b09b3d6a3978',270,'ccop',NULL),(14,'2019-12-02 16:10:40','vnm','投资','投资成功',200,18,0,'68cf2ed40fb147d78b1a68633dd65b45',54,'ccop',NULL),(15,'2019-11-03 10:59:21','www','借款','待审核',40000,12,1800,NULL,NULL,NULL,NULL),(16,'2019-12-03 13:17:17','www','借款','待审核',30000,12,1800,NULL,NULL,NULL,NULL),(17,'2019-12-03 13:24:41','www','借款','审核通过',30000,12,1800,NULL,NULL,'bttt',25),(18,'2019-12-03 23:01:25','www','投资','投资成功',1000,18,1800,'642bf8256f7e4e07ada9bf4cce5bbcad',270,'ccop',NULL),(19,'2019-12-04 18:28:26','www','充值','已充值',200,NULL,2000,NULL,NULL,NULL,NULL),(20,'2019-12-06 21:38:46','www','充值','已充值',100,NULL,2100,NULL,NULL,NULL,NULL),(21,'2019-12-06 21:40:02','www','投资','投资成功',5000,12,2100,'e98c11782bd84c28b2be02ddd505d9cd',900,'bttt',NULL),(22,'2019-12-06 21:49:44','ppap','充值','已充值',2000,NULL,2000,NULL,NULL,NULL,NULL),(23,'2019-12-06 21:50:10','ppap','投资','投资成功',1000,12,2000,'65f79171a30443bd86bedaf853255133',180,'bttt',NULL),(24,'2019-12-09 11:20:20','www','充值','已充值',200,NULL,2310,NULL,NULL,NULL,NULL),(25,'2019-12-09 12:47:12','www','投资','投资成功',1000,18,1310,'09c02d693535461cb77c1a108b6a1ffa',270,'ccop',NULL),(26,'2019-12-09 12:53:23','www','投资','投资成功',200,12,1110,'53a6a219b8a24bf4afd6dec4a62309cf',36,'bttt',NULL),(27,'2019-12-09 13:01:46','www','投资','投资成功',200,12,910,'edecf1418c6c4f5e9212015a56490a97',36,'bttt',NULL),(28,'2019-12-09 13:26:56','www','借款','审核通过',30000,12,910,NULL,NULL,NULL,26),(29,'2019-12-09 14:13:57','www','充值','已充值',100,NULL,31010,NULL,NULL,NULL,NULL),(30,'2019-12-09 14:14:54','www','投资','投资成功',600,12,30410,'ecadfe4527254060a0f50c3a5cfda099',108,'bttt',NULL),(31,'2019-12-09 14:31:06','www','提现','已提现',410,NULL,30000,NULL,NULL,NULL,NULL),(32,'2019-12-09 16:12:45','tt6','充值','已充值',1000,NULL,1000,NULL,NULL,NULL,NULL),(33,'2019-12-09 16:12:54','tt6','投资','投资成功',1000,12,0,'d3fa213379cf43188ec049459ba57d61',180,'bttt',NULL),(34,'2019-12-09 16:30:06','www','充值','已充值',1000,NULL,31010,NULL,NULL,NULL,NULL),(35,'2019-12-09 16:30:52','www','投资','投资成功',1000,18,30010,'8aa5cd3f8a1241b48e8ea80121c08b49',270,'ccop',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `dealword` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易密码',
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电子邮箱',
  `account` double DEFAULT NULL COMMENT '账户金额',
  `inviting` int(10) DEFAULT NULL COMMENT '邀请码',
  `logintime` date DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phone`,`dealword`,`email`,`account`,`inviting`,`logintime`) values (4,'qwe','1123','1232132',NULL,NULL,10,335622,NULL),(5,'www','1111','123',NULL,NULL,30010,175323,NULL),(7,'ccc','123','1234',NULL,NULL,2000,995321,NULL),(8,'eee','123','123',NULL,NULL,0,332891,NULL),(11,'ddd','123','12312321',NULL,NULL,0,324781,NULL),(12,'qqq','123','15612341234',NULL,NULL,0,490968,NULL),(13,'zzzz','123','12343213',NULL,NULL,0,513259,NULL),(14,'qqc','123','12312321',NULL,NULL,0,248384,NULL),(15,'rtr','123','13213',NULL,NULL,0,407695,'2019-11-30'),(16,'reman','123','1321312',NULL,NULL,0,127082,'2019-12-01'),(17,'rrt','123','123124',NULL,NULL,0,415308,'2019-12-01'),(18,'wwe','123','12143',NULL,NULL,0,536094,'2019-12-01'),(19,'ttre','123','1231354',NULL,NULL,0,766389,'2019-12-01'),(20,'hhb','123','123444',NULL,NULL,2000,377141,'2019-12-01'),(21,'ggh','123','123445',NULL,NULL,10,157517,'2019-12-01'),(22,'zzzzq','123','341213',NULL,NULL,10,927319,'2019-12-01'),(23,'ccyw','123','1243324',NULL,NULL,0,742052,'2019-12-01'),(24,'vnm','123','21314',NULL,NULL,0,628260,'2019-12-02'),(25,'ppap','123','1234315',NULL,NULL,2000,830128,'2019-12-06'),(26,'ccv1','123','12321414',NULL,NULL,0,186469,'2019-12-09'),(27,'tt6','123','12',NULL,NULL,0,109393,'2019-12-09');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
