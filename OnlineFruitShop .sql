/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.26-log : Database - onlinefruitshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onlinefruitshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `onlinefruitshop`;

/*Table structure for table `dict` */

DROP TABLE IF EXISTS `dict`;

CREATE TABLE `dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dict` */

LOCK TABLES `dict` WRITE;

insert  into `dict`(`id`,`key`,`value`,`type`,`remark`) values (1,'man','男装','category',NULL),(2,'woman','女装','category',NULL),(3,'kid','童装','category',NULL);

UNLOCK TABLES;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(128) NOT NULL,
  `category` varchar(64) NOT NULL,
  `introduction` varchar(2048) DEFAULT NULL,
  `price` float NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `createTime` varchar(128) NOT NULL,
  `lastModifyTime` varchar(128) NOT NULL,
  `thumbnail` varchar(128) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `imageList` varchar(1028) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

LOCK TABLES `goods` WRITE;

insert  into `goods`(`id`,`goodsName`,`category`,`introduction`,`price`,`stock`,`createTime`,`lastModifyTime`,`thumbnail`,`isDeleted`,`imageList`) values (1,'小红','fresh','新鲜上市的小红',12,66600,'2016-02-21 22:05:11','2016-02-22 23:36:39','所虐他',1,'c://logs,c://logs,c://logs,c://logs'),(2,'凤梨','man','来之澳大利亚',12,1000,'2016-02-22 22:00:05','2016-02-22 22:02:44','c://logs',1,'c://logs,c://logs,c://logs,c://logs'),(3,'凤梨','man','来之澳大利亚',12,0,'2016-02-22 22:00:13','2016-02-25 23:23:47','c://logs',1,'c://logs,c://logs,c://logs,c://logs'),(4,'小红','man','新鲜上市的小红',12,66600,'2016-02-28 17:55:06','2016-02-28 17:55:06','所虐他',1,'c://logs,c://logs,c://logs,c://logs'),(5,'小小红','man','新鲜上市的小红',12,66600,'2016-02-28 18:01:31','2016-02-28 18:03:32','所虐他',1,'c://logs,c://logs,c://logs,c://logs'),(6,'翻领商务休闲夹克外套','man','防风抗皱 挺括有型 做工精细 商务休闲',849,983,'2016-02-28 18:10:05','2017-10-14 17:43:50','static/image/goods/man/1/t.jpg',0,'./static/image/goods/man/1/d1.jpg;./static/image/goods/man/1/d2.jpg;./static/image/goods/man/1/d3.jpg;./static/image/goods/man/1/d4.jpg;./static/image/goods/man/1/d5.jpg'),(7,'韩版春秋季休闲夹克','man','帅气个性风衣百搭男装秋冬潮',149,9987,'2016-02-28 18:19:09','2017-10-14 17:44:18','static/image/goods/man/2/t.jpg',0,'./static/image/goods/man/2/d1.jpg;./static/image/goods/man/2/d2.jpg;./static/image/goods/man/2/d3.jpg;./static/image/goods/man/2/d4.jpg;./static/image/goods/man/2/d5.jpg'),(8,'英爵伦','man','领券满168减10，满268减20',429,451,'2016-02-28 18:22:19','2017-10-15 18:30:01','static/image/goods/man/3/t.jpg',0,'./static/image/goods/man/3/d1.jpg;./static/image/goods/man/3/d2.jpg;./static/image/goods/man/3/d3.jpg;./static/image/goods/man/3/d4.jpg;./static/image/goods/man/3/d5.jpg'),(9,'修身麂皮绒翻领青年百搭潮流帅外套男','man','领子不变型,手感柔软。',329,994,'2016-02-29 22:02:27','2017-10-14 17:46:09','static/image/goods/man/4/t.jpg',0,'./static/image/goods/man/4/d1.jpg;./static/image/goods/man/4/d2.jpg;./static/image/goods/man/4/d3.jpg;./static/image/goods/man/4/d4.jpg;./static/image/goods/man/4/d5.jpg'),(10,'新款加绒加厚夹克男运动外套男外衣服','man','2017秋冬季新款',99,1000,'2016-02-29 22:13:52','2017-10-14 17:48:33','static/image/goods/man/5/t.jpg',0,'./static/image/goods/man/5/d1.jpg;./static/image/goods/man/5/d2.jpg;./static/image/goods/man/5/d3.jpg;./static/image/goods/man/5/d4.jpg;./static/image/goods/man/5/d5.jpg'),(11,'羊毛尼外套薄款修身爸爸装外衣男','man','夹克男休闲中年立领',132.9,1000,'2016-02-29 22:29:28','2017-10-14 17:50:18','static/image/goods/man/6/t.jpg',0,'./static/image/goods/man/6/d1.jpg;./static/image/goods/man/6/d2.jpg;./static/image/goods/man/6/d3.jpg;./static/image/goods/man/6/d4.jpg;./static/image/goods/man/6/d5.jpg'),(12,'长款袄子秋冬装加绒夹克男外衣','man','冬季外套男加厚2017新款',109,1000,'2016-02-29 22:33:40','2017-10-14 17:51:28','static/image/goods/man/7/t.jpg',0,'./static/image/goods/man/7/d1.jpg;./static/image/goods/man/7/d2.jpg;./static/image/goods/man/7/d3.jpg;./static/image/goods/man/7/d4.jpg;./static/image/goods/man/7/d5.jpg'),(13,'男外套2017秋冬新款薄款茄克衫','man','简约大气 合体修身 休闲薄款',39,500,'2016-02-29 22:37:08','2017-10-14 17:55:02','static/image/goods/man/8/t.jpg',0,'./static/image/goods/man/8/d1.jpg;./static/image/goods/man/8/d2.jpg;./static/image/goods/man/8/d3.jpg;./static/image/goods/man/8/d4.jpg;./static/image/goods/man/8/d5.jpg'),(14,'秋季韩版修身潮流帅气春秋冬装','man','2017冬季新款外套男加厚加绒',239,400,'2016-02-29 22:40:34','2017-10-14 18:32:25','static/image/goods/man/9/t.jpg',0,'./static/image/goods/man/9/d1.jpg;./static/image/goods/man/9/d2.jpg;./static/image/goods/man/9/d3.jpg;./static/image/goods/man/9/d4.jpg;./static/image/goods/man/9/d5.jpg'),(15,'夹克青少年男士修身棒球服','man','花花公子外套男韩版2017秋冬季新款',259,498,'2016-02-29 22:42:51','2017-10-14 18:34:33','static/image/goods/man/10/t.jpg',0,'./static/image/goods/man/10/d1.jpg;./static/image/goods/man/10/d2.jpg;./static/image/goods/man/10/d3.jpg;./static/image/goods/man/10/d4.jpg;./static/image/goods/man/10/d5.jpg\r\n\r\n');

UNLOCK TABLES;

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsId` int(10) unsigned NOT NULL,
  `src` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `image` */

LOCK TABLES `image` WRITE;

UNLOCK TABLES;

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `goodsId` int(10) unsigned NOT NULL,
  `orderCount` int(10) unsigned NOT NULL,
  `totalPrice` float NOT NULL,
  `createTime` varchar(64) NOT NULL,
  `lastModifyTime` varchar(64) NOT NULL,
  `orderStatus` varchar(64) NOT NULL,
  `expressNo` int(10) unsigned DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

LOCK TABLES `orders` WRITE;

insert  into `orders`(`id`,`userId`,`goodsId`,`orderCount`,`totalPrice`,`createTime`,`lastModifyTime`,`orderStatus`,`expressNo`,`isDeleted`) values (1,1,1,50,90,'2016-02-25 23:09:10','2016-02-25 23:09:10','等待收货',NULL,0),(2,3,3,50,50,'2016-02-25 23:10:30','2016-02-25 23:10:30','等待发货',NULL,0),(3,3,3,50,50,'2016-02-25 23:11:29','2016-02-25 23:11:29','等待发货',NULL,0),(4,3,3,50,50,'2016-02-25 23:14:11','2016-02-25 23:14:11','等待发货',NULL,0),(5,3,3,10,10,'2016-02-25 23:23:47','2016-02-25 23:23:47','等待发货',NULL,0),(6,3,8,1,49,'2016-03-01 22:13:05','2016-03-01 22:13:05','等待发货',NULL,0),(7,3,8,1,49,'2016-03-01 22:13:24','2016-03-01 22:13:24','等待发货',NULL,0),(8,3,8,10,490,'2016-03-01 22:13:43','2016-03-01 22:13:43','等待发货',NULL,0),(9,3,8,10,490,'2016-03-01 22:14:58','2016-03-01 22:14:58','等待发货',NULL,0),(10,3,8,1,49,'2016-03-01 22:16:03','2016-03-01 22:16:03','等待发货',NULL,0),(11,3,8,1,49,'2016-03-01 22:16:12','2016-03-01 22:16:12','等待发货',NULL,0),(12,3,9,1,39,'2016-03-01 22:16:39','2016-03-01 22:16:39','等待发货',NULL,0),(13,3,6,8,392,'2016-03-01 22:23:29','2016-03-01 22:23:29','等待发货',NULL,0),(14,3,6,1,49,'2016-03-01 22:37:11','2016-03-01 22:37:11','等待发货',NULL,0),(15,3,6,1,49,'2016-03-01 22:37:18','2016-03-01 22:37:18','等待发货',NULL,0),(16,3,6,1,49,'2016-03-01 22:38:38','2016-03-01 22:38:38','等待发货',NULL,0),(17,3,6,1,49,'2016-03-01 22:38:41','2016-03-01 22:38:41','等待发货',NULL,0),(18,3,6,1,49,'2016-03-01 22:38:49','2016-03-01 22:38:49','等待发货',NULL,0),(19,3,6,1,49,'2016-03-01 22:39:34','2016-03-01 22:39:34','等待发货',NULL,0),(20,3,6,1,49,'2016-03-01 22:42:30','2016-03-01 22:42:30','等待发货',NULL,0),(21,3,6,1,49,'2016-03-01 22:42:40','2016-03-01 22:42:40','等待发货',NULL,0),(22,3,15,1,59,'2016-03-01 22:52:54','2016-03-01 22:52:54','等待发货',NULL,0),(23,3,15,1,59,'2016-03-01 23:02:49','2016-03-01 23:02:49','等待发货',NULL,0),(24,3,8,5,245,'2016-03-02 22:19:48','2016-03-02 22:19:48','等待发货',NULL,0),(25,3,7,10,490,'2016-03-02 22:21:57','2016-03-02 22:21:57','等待发货',NULL,0),(26,3,6,1,49,'2016-03-06 13:31:34','2016-03-06 13:31:34','等待发货',NULL,0),(27,3,8,10,490,'2016-03-06 15:53:02','2016-03-06 15:53:02','等待发货',NULL,0),(28,4,8,10,490,'2016-03-06 15:56:49','2016-03-06 15:56:49','等待发货',NULL,0),(29,4,9,5,195,'2016-03-06 16:03:40','2016-03-06 16:03:40','等待发货',NULL,0),(30,1,7,1,49,'2017-10-14 14:35:56','2017-10-14 14:35:56','等待发货',NULL,0),(31,1,7,1,49,'2017-10-14 14:36:01','2017-10-14 14:36:01','等待发货',NULL,0),(32,1,7,1,49,'2017-10-14 14:36:20','2017-10-14 14:36:20','等待发货',NULL,0);

UNLOCK TABLES;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(48) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

LOCK TABLES `role` WRITE;

insert  into `role`(`id`,`roleName`) values (1,'admin'),(2,'registered'),(3,'visitor');

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `phone` varchar(128) NOT NULL,
  `address` varchar(1024) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `registerTime` varchar(128) NOT NULL,
  `lastUpdateTime` varchar(128) NOT NULL,
  `age` int(8) unsigned NOT NULL,
  `gender` varchar(32) NOT NULL DEFAULT 'male',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`username`,`password`,`userId`,`phone`,`address`,`isDeleted`,`registerTime`,`lastUpdateTime`,`age`,`gender`) values (1,'tom','123','0001','13122868630','上海市浦东新区',0,'','',0,''),(2,'yolanda','123','12','13212343212','上海市浦东新区',0,'2016-02-20 12:31:51','2016-02-20 12:31:51',12,'male'),(3,'ricky','123','2','13838017640','河南大学软件学院',0,'','2016-02-20 12:31:50',0,''),(4,'jerry','123456','2','13812321234','北京中关村',0,'','2016-02-20 12:31:51',0,'');

UNLOCK TABLES;

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

LOCK TABLES `user_role` WRITE;

insert  into `user_role`(`id`,`userId`,`roleId`) values (1,1,1),(2,2,2),(3,3,3);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
