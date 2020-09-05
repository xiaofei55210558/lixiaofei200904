# 超管用户记录表
CREATE TABLE `st_admin` (
  `admin_user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`admin_user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='超管用户记录表';

INSERT INTO `st_admin` (`user_name`, `password`, `create_time`, `update_time`) VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', '1529926348', '1540194026');


#微信小程序记录表
CREATE TABLE `st_wxapp` (
  `wxapp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小程序id',
  'wxapp_name' varchar(255) NOT NULL DEFAULT '' COMMENT '商城名title',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序(数字越小越靠前)',
  `is_recycle` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否回收',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`wxapp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COMMENT='微信小程序记录表';

INSERT INTO `st_wxapp` VALUES ('10001', '邯钢车队', 0, 0, 0, '1529926348', '1532766653');


#微信小程序接口表
CREATE TABLE `st_wxapp_api` (
  `wxapp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小程序id',
  `app_id` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序AppID',
  `app_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序AppSecret',
  `mchid` varchar(50) NOT NULL DEFAULT '' COMMENT '微信商户号id',
  `apikey` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付密钥',
  `cert_pem` longtext COMMENT '证书文件cert',
  `key_pem` longtext COMMENT '证书文件key',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`wxapp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COMMENT='微信小程序记录表';

CREATE TABLE `st_car_user` (
  `store_user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名,后台使用',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真名',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序(数字越小越靠前)',
  `is_super` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否为超级管理员',
  `is_delete`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`store_user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COMMENT='商家用户记录表';

--alter table st_wxapp add wxapp_name varchar(255) NOT NULL DEFAULT '' comment '商城名title' after wxapp_id;



# 用户权限表
CREATE TABLE `st_car_access` (
  `access_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '权限名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '权限url',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '排序(数字越小越靠前)',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10114 DEFAULT CHARSET=utf8 COMMENT='商家用户权限表';

#司机信息表
CREATE TABLE `st_driver` (
  `driver_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '司机id',
  `name` varchar(50) NOT NULL  COMMENT '司机姓名',
  `tel1` varchar(20) NOT NULL  COMMENT '司机电话',
  `tel2` varchar(20) NOT NULL  COMMENT '紧急电话',
  `image_id1` int(11) NOT NULL COMMENT '身份证照片(关联文件记录表)',
  `image_id2` int(11) NOT NULL COMMENT '驾驶证照片(关联文件记录表)',
  `type` varchar(5) NOT NULL DEFAULT '' COMMENT '驾驶车型',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '住址',
  `pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '每趟活的工资',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`driver_id`),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='司机信息表';


# 车辆信息表
CREATE TABLE `st_car` (
  `car_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '车表id',
  `car_num` varchar(11) NOT NULL COMMENT '车牌号',
  `licence_name` varchar(50) NOT NULL DEFAULT '' COMMENT '产权人姓名',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`car_id`),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='车辆信息表';


# 车辆月供表
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
  FOREIGN KEY (car_id) REFERENCES st_car(car_id),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='车辆月供表';


#维修表
CREATE TABLE `st_service` (
  `service_id` int(11) unsigned AUTO_INCREMENT COMMENT '单号',
  `car_id` int(11) unsigned  COMMENT '车辆号',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '费用',
  `pay_well` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '付款方式，0保险，1自费',
  `driver_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '司机id',
  `service_list_id` int(11) unsigned NOT NULL  COMMENT '维修点表单号',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`service_id`),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id),
  FOREIGN KEY (driver_id) REFERENCES st_driver(driver_id),
  FOREIGN KEY (car_id) REFERENCES st_car(car_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='车辆维修表';

#维修点列表
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
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='车辆维修表';

#订单表
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
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id),
  FOREIGN KEY (car_id) REFERENCES st_car(car_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='订单信息表';




#油表
CREATE TABLE `st_oil` (
  `oil_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `car_id` int(11) unsigned NOT NULL  COMMENT '车辆id',
  `litre` double unsigned NOT NULL DEFAULT '0' COMMENT '油重量(L)',
  `unit_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `sum_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '小计',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`oil_id`),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id),
  FOREIGN KEY (car_id) REFERENCES st_car(car_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='油表';

#违章信息表
CREATE TABLE `st_penalty` (
  `penalty_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `driver_id` int(11) unsigned NOT NULL  COMMENT '违章司机id',
  `order_id` int(11) unsigned NOT NULL  COMMENT '订单号',
  `score` int(11) unsigned NOT NULL  COMMENT '分数',
  `penalty_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '罚款金额',
  `image_id1` int(11)  COMMENT '罚款图片1(关联文件记录表)',
  `image_id2` int(11)  COMMENT '罚款图片2(关联文件记录表)',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '详情',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`penalty_id`),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id),
  FOREIGN KEY (order_id) REFERENCES st_order(order_id),
  FOREIGN KEY (driver_id) REFERENCES st_driver(driver_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='违章信息表';


#高速收费表
CREATE TABLE `st_tollfee` (
  `tollfee_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '单号',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单号',
  `penalty_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '该订单高速收费金额',
  `image_id1` int(11)  COMMENT '收费截图1(关联文件记录表)',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '详情',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tollfee_id`),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='违章信息表';


#文件库记录表
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
  `is_recycle`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已回收',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '软删除',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`file_id`),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='文件库记录表';

#文件库分组记录表
CREATE TABLE `st_upload_group` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `group_type` varchar(10) NOT NULL DEFAULT '' COMMENT '文件类型',
  `group_name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类排序(数字越小越靠前)',
  `is_delete`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `wxapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`group_id`),
  FOREIGN KEY (wxapp_id) REFERENCES st_wxapp(wxapp_id)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='文件库分组记录表';