-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: statistics_car
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `st_admin`
--

DROP TABLE IF EXISTS `st_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_admin` (
  `admin_user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`admin_user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COMMENT='超管用户记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_admin`
--

LOCK TABLES `st_admin` WRITE;
/*!40000 ALTER TABLE `st_admin` DISABLE KEYS */;
INSERT INTO `st_admin` VALUES (10001,'admin','e10adc3949ba59abbe56e057f20f883e',1529926348,1540194026);
/*!40000 ALTER TABLE `st_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_car`
--

DROP TABLE IF EXISTS `st_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_car` (
  `car_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '车表id',
  `car_num` varchar(11) NOT NULL COMMENT '车牌号',
  `licence_name` varchar(50) NOT NULL DEFAULT '' COMMENT '产权人姓名',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`car_id`),
  KEY `wxapp_id` (`wxapp_id`),
  CONSTRAINT `st_car_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_car`
--

LOCK TABLES `st_car` WRITE;
/*!40000 ALTER TABLE `st_car` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_driver`
--

DROP TABLE IF EXISTS `st_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_driver` (
  `driver_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '司机id',
  `name` varchar(50) NOT NULL COMMENT '司机姓名',
  `tel1` varchar(20) NOT NULL COMMENT '司机电话',
  `tel2` varchar(20) NOT NULL COMMENT '紧急电话',
  `image_id1` int(11) NOT NULL COMMENT '身份证照片(关联文件记录表)',
  `image_id2` int(11) NOT NULL COMMENT '驾驶证照片(关联文件记录表)',
  `type` varchar(5) NOT NULL DEFAULT '' COMMENT '驾驶车型',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '住址',
  `pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '每趟活的工资',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`driver_id`),
  KEY `wxapp_id` (`wxapp_id`),
  CONSTRAINT `st_driver_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='司机信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_driver`
--

LOCK TABLES `st_driver` WRITE;
/*!40000 ALTER TABLE `st_driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_monthly`
--

DROP TABLE IF EXISTS `st_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_monthly` (
  `monthly_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `car_id` int(11) unsigned NOT NULL COMMENT '车牌号',
  `monthly_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '月供金',
  `repayment_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '每月还款时间',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始贷款时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束贷款时间',
  `initial_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '首付款',
  `car_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '全款金额',
  `source_name` varchar(50) NOT NULL DEFAULT '' COMMENT '卖车人姓名',
  `source_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '卖车人电话',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`monthly_id`),
  KEY `car_id` (`car_id`),
  KEY `wxapp_id` (`wxapp_id`),
  CONSTRAINT `st_monthly_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `st_car` (`car_id`),
  CONSTRAINT `st_monthly_ibfk_2` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆月供表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_monthly`
--

LOCK TABLES `st_monthly` WRITE;
/*!40000 ALTER TABLE `st_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_oil`
--

DROP TABLE IF EXISTS `st_oil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_oil` (
  `oil_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `car_id` int(11) unsigned NOT NULL COMMENT '车辆id',
  `litre` double unsigned NOT NULL DEFAULT '0' COMMENT '油重量(L)',
  `unit_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `sum_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '小计',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`oil_id`),
  KEY `wxapp_id` (`wxapp_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `st_oil_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`),
  CONSTRAINT `st_oil_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `st_car` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='油表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_oil`
--

LOCK TABLES `st_oil` WRITE;
/*!40000 ALTER TABLE `st_oil` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_oil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_order`
--

DROP TABLE IF EXISTS `st_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_order` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `car_id` int(11) unsigned NOT NULL COMMENT '车辆id',
  `driver1_id` int(11) unsigned NOT NULL COMMENT '司机1id',
  `driver2_id` int(11) unsigned NOT NULL COMMENT '司机2id',
  `start_site` varchar(50) NOT NULL DEFAULT '' COMMENT '开始地点',
  `start_log` varchar(50) NOT NULL DEFAULT '' COMMENT '开始地点坐标经度',
  `start_lat` varchar(50) NOT NULL DEFAULT '' COMMENT '开始地点坐标纬度',
  `end_site` varchar(50) NOT NULL DEFAULT '' COMMENT '结束地点',
  `end_log` varchar(50) NOT NULL DEFAULT '' COMMENT '结束地点坐标经度',
  `end_lat` varchar(50) NOT NULL DEFAULT '' COMMENT '结束地点坐标纬度',
  `source_name` varchar(50) NOT NULL DEFAULT '' COMMENT '货源方姓名',
  `source_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '货源方人电话',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收货方人姓名',
  `user_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '收货方电话',
  `ton` double unsigned NOT NULL DEFAULT '0' COMMENT '货物重量(t)',
  `unit_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `receipt_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '打款金额',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束交班时间',
  PRIMARY KEY (`order_id`),
  KEY `wxapp_id` (`wxapp_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `st_order_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`),
  CONSTRAINT `st_order_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `st_car` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_order`
--

LOCK TABLES `st_order` WRITE;
/*!40000 ALTER TABLE `st_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_penalty`
--

DROP TABLE IF EXISTS `st_penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_penalty` (
  `penalty_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `driver_id` int(11) unsigned NOT NULL COMMENT '违章司机id',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单号',
  `score` int(11) unsigned NOT NULL COMMENT '分数',
  `penalty_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '罚款金额',
  `image_id1` int(11) DEFAULT NULL COMMENT '罚款图片1(关联文件记录表)',
  `image_id2` int(11) DEFAULT NULL COMMENT '罚款图片2(关联文件记录表)',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '详情',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`penalty_id`),
  KEY `wxapp_id` (`wxapp_id`),
  KEY `order_id` (`order_id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `st_penalty_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`),
  CONSTRAINT `st_penalty_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `st_order` (`order_id`),
  CONSTRAINT `st_penalty_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `st_driver` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违章信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_penalty`
--

LOCK TABLES `st_penalty` WRITE;
/*!40000 ALTER TABLE `st_penalty` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_service`
--

DROP TABLE IF EXISTS `st_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_service` (
  `service_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `car_id` int(11) unsigned DEFAULT NULL COMMENT '车辆号',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '费用',
  `pay_well` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '付款方式，0保险，1自费',
  `driver_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '司机id',
  `service_list_id` int(11) unsigned NOT NULL COMMENT '维修点表单号',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`service_id`),
  KEY `wxapp_id` (`wxapp_id`),
  KEY `driver_id` (`driver_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `st_service_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`),
  CONSTRAINT `st_service_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `st_driver` (`driver_id`),
  CONSTRAINT `st_service_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `st_car` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆维修表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_service`
--

LOCK TABLES `st_service` WRITE;
/*!40000 ALTER TABLE `st_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_service_list`
--

DROP TABLE IF EXISTS `st_service_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_service_list` (
  `service_list_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '维修点表单号',
  `service_name` varchar(50) NOT NULL DEFAULT '' COMMENT '维修师傅姓名',
  `source_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '维修点联系电话',
  `site` varchar(50) NOT NULL DEFAULT '' COMMENT '处理地点',
  `longitude` varchar(50) NOT NULL DEFAULT '' COMMENT '维修地店坐标经度',
  `latitude` varchar(50) NOT NULL DEFAULT '' COMMENT '维修地点坐标纬度',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`service_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆维修表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_service_list`
--

LOCK TABLES `st_service_list` WRITE;
/*!40000 ALTER TABLE `st_service_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_service_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_store_access`
--

DROP TABLE IF EXISTS `st_store_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_store_access` (
  `access_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '权限名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '权限url',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '排序(数字越小越靠前)',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家用户权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_store_access`
--

LOCK TABLES `st_store_access` WRITE;
/*!40000 ALTER TABLE `st_store_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_store_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_store_user`
--

DROP TABLE IF EXISTS `st_store_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_store_user` (
  `store_user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名,后台使用',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商城命名',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序(数字越小越靠前)',
  `is_super` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为超级管理员',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`store_user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COMMENT='商家用户记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_store_user`
--

LOCK TABLES `st_store_user` WRITE;
/*!40000 ALTER TABLE `st_store_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_store_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tollfee`
--

DROP TABLE IF EXISTS `st_tollfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_tollfee` (
  `tollfee_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单号',
  `penalty_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '该订单高速收费金额',
  `image_id1` int(11) DEFAULT NULL COMMENT '收费截图1(关联文件记录表)',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '详情',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tollfee_id`),
  KEY `wxapp_id` (`wxapp_id`),
  CONSTRAINT `st_tollfee_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违章信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tollfee`
--

LOCK TABLES `st_tollfee` WRITE;
/*!40000 ALTER TABLE `st_tollfee` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_tollfee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_upload_file`
--

DROP TABLE IF EXISTS `st_upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_upload_file` (
  `file_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `storage` varchar(20) NOT NULL DEFAULT '' COMMENT '存储方式',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件分组id',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '存储域名',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小(字节)',
  `file_type` varchar(20) NOT NULL DEFAULT '' COMMENT '文件类型',
  `extension` varchar(20) NOT NULL DEFAULT '' COMMENT '文件扩展名',
  `is_user` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否为c端用户上传',
  `is_recycle` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已回收',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '软删除',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`file_id`),
  KEY `wxapp_id` (`wxapp_id`),
  CONSTRAINT `st_upload_file_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件库记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_upload_file`
--

LOCK TABLES `st_upload_file` WRITE;
/*!40000 ALTER TABLE `st_upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_upload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_upload_group`
--

DROP TABLE IF EXISTS `st_upload_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_upload_group` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `group_type` varchar(10) NOT NULL DEFAULT '' COMMENT '文件类型',
  `group_name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类排序(数字越小越靠前)',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`group_id`),
  KEY `wxapp_id` (`wxapp_id`),
  CONSTRAINT `st_upload_group_ibfk_1` FOREIGN KEY (`wxapp_id`) REFERENCES `st_wxapp` (`wxapp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件库分组记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_upload_group`
--

LOCK TABLES `st_upload_group` WRITE;
/*!40000 ALTER TABLE `st_upload_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_upload_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wxapp`
--

DROP TABLE IF EXISTS `st_wxapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wxapp` (
  `wxapp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小程序id',
  `app_id` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序AppID',
  `app_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序AppSecret',
  `mchid` varchar(50) NOT NULL DEFAULT '' COMMENT '微信商户号id',
  `apikey` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付密钥',
  `cert_pem` longtext COMMENT '证书文件cert',
  `key_pem` longtext COMMENT '证书文件key',
  `is_recycle` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否回收',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`wxapp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COMMENT='微信小程序记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wxapp`
--

LOCK TABLES `st_wxapp` WRITE;
/*!40000 ALTER TABLE `st_wxapp` DISABLE KEYS */;
INSERT INTO `st_wxapp` VALUES (10001,'','','','','','',0,0,1529926348,1532766653);
/*!40000 ALTER TABLE `st_wxapp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-01 14:28:46
