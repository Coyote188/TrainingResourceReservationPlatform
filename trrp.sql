/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50626
Source Host           : 127.0.0.1:3306
Source Database       : trrp

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-07-18 21:30:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for driving_license_level
-- ----------------------------
DROP TABLE IF EXISTS `driving_license_level`;
CREATE TABLE `driving_license_level` (
  `level` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '级别 A1、A2、A3、B1、B2、C1、C2、C3、C4、D、E、F、M、N、P',
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '对应名称',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `id` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of driving_license_level
-- ----------------------------
INSERT INTO `driving_license_level` VALUES ('A1', '大型客车', null, '1');
INSERT INTO `driving_license_level` VALUES ('A3', '城市公交车', null, '2');
INSERT INTO `driving_license_level` VALUES ('B1', '中型客车', null, '3');
INSERT INTO `driving_license_level` VALUES ('B2', '大型货车', null, '4');
INSERT INTO `driving_license_level` VALUES ('C1', '小型汽车', null, '5');
INSERT INTO `driving_license_level` VALUES ('C2', '小型自动档汽车', null, '6');

-- ----------------------------
-- Table structure for instruction_vehicle_infomation
-- ----------------------------
DROP TABLE IF EXISTS `instruction_vehicle_infomation`;
CREATE TABLE `instruction_vehicle_infomation` (
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `plate_number` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '车牌号码',
  `status` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '状态(有效-10A，维修中-10B，无效-10X)',
  `coach` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '教练员（对应人员信息表主键）',
  `bands` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '车辆品牌',
  `model` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '车辆型号',
  `price` decimal(6,2) DEFAULT NULL COMMENT '车辆使用价格（元/小时）',
  `calculation_method` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '价格计算方式（预留）',
  `description` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `vehicle_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '车辆类型-关联车辆类型表主键',
  `belong` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '属于什么区域',
  `pic` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vehicle_1` (`id`),
  KEY `idx_vehicle_2` (`coach`),
  KEY `idx_vehicle_3` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of instruction_vehicle_infomation
-- ----------------------------
INSERT INTO `instruction_vehicle_infomation` VALUES ('', null, null, null, null, null, null, null, null, null, null, '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('006', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('009', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('013', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('014', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('015', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('016', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('018', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('019', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('020', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('021', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('026', null, '10A', null, '捷达', null, '100.00', null, '小型汽车自动档', 'C2', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('027', null, '10A', null, '捷达', null, '100.00', null, '小型汽车自动档', 'C2', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('51', null, '10A', null, '东风', null, '100.00', null, '大货车', 'B2', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('52', null, '10A', null, '东风', null, '100.00', null, '大货车', 'B2', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('53', null, '10A', null, '东风', null, '100.00', null, '大货车', 'B2', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('54', null, '10A', null, '东风', null, '100.00', null, '大货车', 'B2', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('55', null, '10A', null, '东风', null, '100.00', null, '大货车', 'B2', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('56', null, '10A', null, '东风', null, '100.00', null, '大货车', 'B2', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('61', null, '10A', null, '解放', null, '300.00', null, '大货车', 'B2', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('62', null, '10A', null, '解放', null, '300.00', null, '大货车', 'B2', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('63', null, '10A', null, '解放', null, '300.00', null, '大货车', 'B2', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('64', null, '10A', null, '解放', null, '300.00', null, '大货车', 'B2', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('65', null, '10A', null, '宇通', null, '200.00', null, '中巴', 'B1', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('66', null, '10A', null, '金龙', null, '200.00', null, '大客', 'A1|A3', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('68', null, '10A', null, '解放', null, '300.00', null, '大货车', 'B2', 'B', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK001', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK002', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK003', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK004', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK005', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK008', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK010', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK011', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK022', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK023', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK024', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');
INSERT INTO `instruction_vehicle_infomation` VALUES ('CK025', null, '10A', null, '捷达', null, '100.00', null, '小型汽车', 'C1', 'A', '/picture/vehicle/117144176.JPG');

-- ----------------------------
-- Table structure for license_level_vehicle_type_rela
-- ----------------------------
DROP TABLE IF EXISTS `license_level_vehicle_type_rela`;
CREATE TABLE `license_level_vehicle_type_rela` (
  `id` varchar(60) COLLATE utf8_bin NOT NULL,
  `license_level` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `vehicle_type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of license_level_vehicle_type_rela
-- ----------------------------

-- ----------------------------
-- Table structure for personnel_infomation
-- ----------------------------
DROP TABLE IF EXISTS `personnel_infomation`;
CREATE TABLE `personnel_infomation` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `gender` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `seniority` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '资历',
  `driving_experience` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '驾龄',
  `level` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '教学级别（暂定-初级、中级、高级）',
  `price` decimal(6,2) DEFAULT NULL,
  `star_level` int(11) DEFAULT NULL,
  `license_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '关联驾照类型表主建',
  `tech_license_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '培训驾照类型-关联驾照类型表主建',
  `tel_nbr` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `drving_experience` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of personnel_infomation
-- ----------------------------

-- ----------------------------
-- Table structure for resourcelock
-- ----------------------------
DROP TABLE IF EXISTS `resourcelock`;
CREATE TABLE `resourcelock` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `resource_id` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '资源ID',
  `resource_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '资源名',
  `resource_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '资源类型',
  `lock_time` datetime DEFAULT NULL COMMENT '加锁时间',
  `duration` int(11) DEFAULT NULL COMMENT '时间段',
  `unlock_time` datetime DEFAULT NULL COMMENT '解锁时间（计算得来）',
  `who_lock_resource` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '加锁用户',
  `status` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '状态（预锁定、锁定、解锁）',
  `status_date` datetime DEFAULT NULL COMMENT '状态变更时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of resourcelock
-- ----------------------------

-- ----------------------------
-- Table structure for train_resource_lock
-- ----------------------------
DROP TABLE IF EXISTS `train_resource_lock`;
CREATE TABLE `train_resource_lock` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `resource_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `resource_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lock_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `unlock_time` datetime DEFAULT NULL,
  `who_lock_resource` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of train_resource_lock
-- ----------------------------
INSERT INTO `train_resource_lock` VALUES ('146876499695890371', 'CK001', '捷达', 'VEHICLE', '2016-07-18 15:00:00', '1', null, 'U140176000619665260', '001', '2016-07-17 22:16:36');
INSERT INTO `train_resource_lock` VALUES ('146876524833157408', 'CK002', '捷达', 'VEHICLE', '2016-07-18 07:00:00', '1', null, 'U140176000619665260', '001', '2016-07-17 22:20:48');
INSERT INTO `train_resource_lock` VALUES ('146876543248566266', 'CK002', '捷达', 'VEHICLE', '2016-07-21 07:00:00', '1', null, 'U140176000619665260', '001', '2016-07-17 22:23:52');
INSERT INTO `train_resource_lock` VALUES ('146883375500479951', 'CK001', '捷达', 'VEHICLE', '2016-07-19 07:00:00', '1', null, 'U146882867205821359', '001', '2016-07-18 17:22:35');

-- ----------------------------
-- Table structure for traning_field_infomation
-- ----------------------------
DROP TABLE IF EXISTS `traning_field_infomation`;
CREATE TABLE `traning_field_infomation` (
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `field_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '场地名称',
  `status` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '场地状态（有效-10A，维护中-10B，作废-10X）',
  `field_idx` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '适用车辆（关联车辆类别表----限驾照类型c1\\c2\\c3 and so on）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_field_1` (`id`),
  KEY `idx_field_2` (`status`),
  KEY `idx_field_3` (`field_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of traning_field_infomation
-- ----------------------------
INSERT INTO `traning_field_infomation` VALUES ('F01', 'A区', '10A', 'A');
INSERT INTO `traning_field_infomation` VALUES ('F02', 'B区', '10A', 'B');

-- ----------------------------
-- Table structure for t_n_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_n_attachment`;
CREATE TABLE `t_n_attachment` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `att_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `descr` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `down_count` bigint(20) DEFAULT '0',
  `file_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `file_type` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_n_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for t_n_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_n_dict`;
CREATE TABLE `t_n_dict` (
  `id` varchar(32) NOT NULL,
  `BUSI_LEVEL` int(11) DEFAULT NULL,
  `BUSI_NAME` varchar(128) NOT NULL,
  `PARENT_ID` varchar(32) NOT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `busi_value` varchar(127) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_n_dict
-- ----------------------------
INSERT INTO `t_n_dict` VALUES ('A145723946120812553', '2', '武警中士', 'D145723943327402441', '4', '1', '4');
INSERT INTO `t_n_dict` VALUES ('A145723964890779820', '2', '武警上士', 'D145723943327402441', '5', '1', '5');
INSERT INTO `t_n_dict` VALUES ('A145723964890779822', '2', '武警四级警士长', 'D145723943327402441', '6', '1', '6');
INSERT INTO `t_n_dict` VALUES ('A245723946120812553', '2', '武警三级警士长', 'D145723943327402441', '7', '1', '7');
INSERT INTO `t_n_dict` VALUES ('A245723964890779820', '2', '武警二级警士长', 'D145723943327402441', '8', '1', '8');
INSERT INTO `t_n_dict` VALUES ('A245723964890779822', '2', '武警一级警士长', 'D145723943327402441', '9', '1', '9');
INSERT INTO `t_n_dict` VALUES ('D140124820434970883', '1', '状态', '0', '2', '1', 'DATA_STATE');
INSERT INTO `t_n_dict` VALUES ('D140124823266329733', '2', '有效', 'D140124820434970883', '1', '1', '1');
INSERT INTO `t_n_dict` VALUES ('D140305455956651340', '1', '组织机构类型', '0', '1', '1', 'ORG_TYPE');
INSERT INTO `t_n_dict` VALUES ('D140305457461845442', '2', '机构', 'D140305455956651340', '1', '1', 'org');
INSERT INTO `t_n_dict` VALUES ('D140305458545491814', '2', '部门', 'D140305455956651340', '2', '1', 'department');
INSERT INTO `t_n_dict` VALUES ('D140711518593669884', '1', '有无标识', '0', '3', '1', 'HAS_NO_STATE');
INSERT INTO `t_n_dict` VALUES ('D140711519961054473', '2', '无', 'D140711518593669884', '1', '1', '0');
INSERT INTO `t_n_dict` VALUES ('D140711521078842310', '2', '有', 'D140711518593669884', '2', '1', '1');
INSERT INTO `t_n_dict` VALUES ('D141069955504413400', '2', '无效', 'D140124820434970883', '2', '1', '0');
INSERT INTO `t_n_dict` VALUES ('D144906234223070186', '1', '知识分类', '0', '4', '1', 'knowlage');
INSERT INTO `t_n_dict` VALUES ('D144906235734117797', '2', '无线知识', 'D144906234223070186', '1', '1', 'wx');
INSERT INTO `t_n_dict` VALUES ('D144906237218128903', '2', '动中继', 'D144906234223070186', '4', '1', 'dzj');
INSERT INTO `t_n_dict` VALUES ('D144906238546008978', '2', '卫星', 'D144906234223070186', '3', '1', 'satellite');
INSERT INTO `t_n_dict` VALUES ('D144906555597568119', '1', '题目内容类型', '0', '5', '1', 'question_type');
INSERT INTO `t_n_dict` VALUES ('D144906558717109317', '2', '视频', 'D144906555597568119', '1', '1', 'Q_MOV');
INSERT INTO `t_n_dict` VALUES ('D144906559854638361', '2', '文字', 'D144906555597568119', '2', '1', 'Q_TXT');
INSERT INTO `t_n_dict` VALUES ('D144906561169221673', '2', '图片', 'D144906555597568119', '3', '1', 'Q_PIC');
INSERT INTO `t_n_dict` VALUES ('D144906562964145906', '2', '音频', 'D144906555597568119', '4', '1', 'Q_VIO');
INSERT INTO `t_n_dict` VALUES ('D145052365029855670', '2', '有线知识', 'D144906234223070186', '2', '1', 'yx');
INSERT INTO `t_n_dict` VALUES ('D145052369996147586', '2', '超短波电台', 'D144906234223070186', '5', '1', 'cdbdt');
INSERT INTO `t_n_dict` VALUES ('D145052371021602979', '2', '短波电台', 'D144906234223070186', '6', '1', 'dbdt');
INSERT INTO `t_n_dict` VALUES ('D145052372632783898', '2', '无线图传', 'D144906234223070186', '7', '1', 'wxtc');
INSERT INTO `t_n_dict` VALUES ('D145052374388447706', '2', '异频转接器', 'D144906234223070186', '8', '1', 'ypzj');
INSERT INTO `t_n_dict` VALUES ('D145723943327402441', '1', '学员等级', '0', '6', '1', 'stu_rank');
INSERT INTO `t_n_dict` VALUES ('D145723946120812553', '2', '武警列兵', 'D145723943327402441', '1', '1', '1');
INSERT INTO `t_n_dict` VALUES ('D145723964890779820', '2', '武警上等兵', 'D145723943327402441', '2', '1', '2');
INSERT INTO `t_n_dict` VALUES ('D145723964890779822', '2', '武警下士', 'D145723943327402441', '2', '1', '3');
INSERT INTO `t_n_dict` VALUES ('D146556606682101088', '2', '数据网络基础', 'D144906234223070186', '9', '1', '数据网络基础');

-- ----------------------------
-- Table structure for t_n_info
-- ----------------------------
DROP TABLE IF EXISTS `t_n_info`;
CREATE TABLE `t_n_info` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `content` longtext COLLATE utf8_bin,
  `contentAbstract` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `creatorId` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `html` longtext COLLATE utf8_bin,
  `imgAttId` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `infoType` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `imgUrl` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_n_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_n_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_n_login_log`;
CREATE TABLE `t_n_login_log` (
  `id` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `login_mode` varchar(32) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_n_login_log
-- ----------------------------
INSERT INTO `t_n_login_log` VALUES ('141169909366933680', '2014-09-26 10:38:13', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141170069613889825', '2014-09-26 11:04:56', '60.161.217.25', 'web', '用户名或密码错误', '-1', '', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141170070420086275', '2014-09-26 11:05:04', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141170106507543843', '2014-09-26 11:11:05', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141170193376301213', '2014-09-26 11:25:33', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141171461093521747', '2014-09-26 14:56:50', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141171517404491834', '2014-09-26 15:06:14', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141171645924771732', '2014-09-26 15:27:39', '116.52.158.194', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141171660291948789', '2014-09-26 15:30:02', '60.161.217.25', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141171813359180102', '2014-09-26 15:55:33', '60.161.217.25', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141171944109192472', '2014-09-26 16:17:21', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141171951573137115', '2014-09-26 16:18:35', '127.0.0.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141171963937273456', '2014-09-26 16:20:39', '60.161.217.25', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141172003616907975', '2014-09-26 16:27:16', '60.161.217.25', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141172036173119325', '2014-09-26 16:32:41', '60.161.217.25', 'web', '用户登录成功', '1', 'U141171637293520391', 'yzgl');
INSERT INTO `t_n_login_log` VALUES ('141172040373124415', '2014-09-26 16:33:23', '60.161.217.25', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141172048010611320', '2014-09-26 16:34:40', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141172133320080050', '2014-09-26 16:48:53', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141172299732511256', '2014-09-26 17:16:37', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141178396013822143', '2014-09-27 10:12:40', '112.117.97.166', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141182902623415990', '2014-09-27 22:43:46', '112.117.97.166', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141182969931241342', '2014-09-27 22:54:59', '112.117.97.166', 'web', '用户登录成功', '1', 'U141171637293520391', 'yzgl');
INSERT INTO `t_n_login_log` VALUES ('141182972135926192', '2014-09-27 22:55:21', '112.117.97.166', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141182985357827000', '2014-09-27 22:57:33', '112.117.97.166', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141182994362599999', '2014-09-27 22:59:03', '112.117.97.166', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141183000968791244', '2014-09-27 23:00:09', '112.117.97.166', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141183006264006338', '2014-09-27 23:01:02', '112.117.97.166', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141183065968769455', '2014-09-27 23:10:59', '112.117.97.166', 'web', '用户登录成功', '1', 'U141171637293520391', 'yzgl');
INSERT INTO `t_n_login_log` VALUES ('141183067389069142', '2014-09-27 23:11:13', '112.117.97.166', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141183141510983874', '2014-09-27 23:23:35', '112.117.97.166', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141183151600098431', '2014-09-27 23:25:16', '112.117.97.166', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141186538312540799', '2014-09-28 08:49:43', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141186592978195417', '2014-09-28 08:58:49', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141186664360980079', '2014-09-28 09:10:43', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141186667285945801', '2014-09-28 09:11:12', '60.161.217.25', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141186989143757929', '2014-09-28 10:04:51', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141187000543767050', '2014-09-28 10:06:45', '60.161.217.25', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195331637574622', '2014-09-29 09:15:16', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195343120351861', '2014-09-29 09:17:11', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195387926593823', '2014-09-29 09:24:39', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195436890630371', '2014-09-29 09:32:48', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195563581288231', '2014-09-29 09:53:55', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195617676562976', '2014-09-29 10:02:56', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195638129688068', '2014-09-29 10:06:21', '182.247.185.253', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195773345306289', '2014-09-29 10:28:53', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141195831162549088', '2014-09-29 10:38:31', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196045754674335', '2014-09-29 11:14:17', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196065553122321', '2014-09-29 11:17:35', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196097681209481', '2014-09-29 11:22:56', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196105314078969', '2014-09-29 11:24:13', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196106567140827', '2014-09-29 11:24:25', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196112551520524', '2014-09-29 11:25:25', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196148687596733', '2014-09-29 11:31:26', '182.247.185.253', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196157721882513', '2014-09-29 11:32:57', '60.161.217.31', 'web', '用户名或密码错误', '-1', '', ' nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141196159421802376', '2014-09-29 11:33:14', '60.161.217.31', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141196161712558477', '2014-09-29 11:33:37', '60.161.217.31', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141196180475073160', '2014-09-29 11:36:44', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196183154682984', '2014-09-29 11:37:11', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196187270373214', '2014-09-29 11:37:52', '60.161.217.31', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141196225184393462', '2014-09-29 11:44:11', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196230101554077', '2014-09-29 11:45:01', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196233657815932', '2014-09-29 11:45:36', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141196554581225406', '2014-09-29 12:39:05', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141197316067134524', '2014-09-29 14:46:00', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141197406315622010', '2014-09-29 15:01:03', '60.161.217.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206077540601062', '2014-09-30 15:06:15', '60.161.217.141', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206117817123857', '2014-09-30 15:12:58', '60.161.217.141', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206123746864977', '2014-09-30 15:13:57', '60.161.217.141', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206154557851417', '2014-09-30 15:19:05', '116.249.58.86', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206163782890065', '2014-09-30 15:20:37', '116.249.58.86', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206179354652417', '2014-09-30 15:23:13', '116.249.58.86', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206192640677599', '2014-09-30 15:25:26', '60.161.217.128', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141206396306246252', '2014-09-30 15:59:23', '60.161.217.141', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206399351568833', '2014-09-30 15:59:53', '116.249.71.68', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141206415778129533', '2014-09-30 16:02:37', '116.249.71.68', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141214449070319678', '2014-10-01 14:21:30', '116.52.130.57', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141215178992192170', '2014-10-01 16:23:09', '116.52.130.57', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141215764370353806', '2014-10-01 18:00:43', '116.52.130.57', 'web', '用户名或密码错误', '-1', '', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141215764734392901', '2014-10-01 18:00:47', '116.52.130.57', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141221905800312384', '2014-10-02 11:04:18', '218.63.135.147', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141222487536207415', '2014-10-02 12:41:15', '218.63.135.147', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141223565642520575', '2014-10-02 15:40:56', '218.63.135.147', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141240819392486247', '2014-10-04 15:36:33', '222.221.20.48', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141241412601801017', '2014-10-04 17:15:26', '222.221.20.48', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141266678065846839', '2014-10-07 15:26:20', '182.245.226.87', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141266691873757024', '2014-10-07 15:28:38', '182.245.226.87', 'web', '用户登录成功', '1', 'U141171637293520391', 'yzgl');
INSERT INTO `t_n_login_log` VALUES ('141266693659671448', '2014-10-07 15:28:56', '182.245.226.87', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141266744138555993', '2014-10-07 15:37:21', '182.245.226.87', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141273067513548814', '2014-10-08 09:11:15', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141273290944888551', '2014-10-08 09:48:29', '60.161.217.214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141273339526030354', '2014-10-08 09:56:35', '60.161.217.214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141273431519833757', '2014-10-08 10:11:55', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141273643229197285', '2014-10-08 10:47:12', '112.115.111.31', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141275108707325506', '2014-10-08 14:51:27', '116.55.107.69', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275136666633239', '2014-10-08 14:56:06', '116.55.107.69', 'web', '用户名或密码错误', '-1', '', 'nlyz');
INSERT INTO `t_n_login_log` VALUES ('141275138540181349', '2014-10-08 14:56:25', '116.55.107.69', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275146329178159', '2014-10-08 14:57:43', '116.55.85.7', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275186104151546', '2014-10-08 15:04:21', '106.60.185.127', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275254619857542', '2014-10-08 15:15:46', '182.240.7.47', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275322955760816', '2014-10-08 15:27:09', '182.240.7.47', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275342182341494', '2014-10-08 15:30:21', '182.240.57.247', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275477066669256', '2014-10-08 15:52:50', '60.161.217.165', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275835051027797', '2014-10-08 16:52:30', '60.161.217.223', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141275836388533082', '2014-10-08 16:52:43', '60.161.217.223', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141278167422901364', '2014-10-08 23:21:14', '182.245.227.79', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141278186313546769', '2014-10-08 23:24:23', '182.245.227.79', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141283124322353801', '2014-10-09 13:07:23', '116.52.158.194', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141286465630149040', '2014-10-09 22:24:16', '182.245.95.86', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141286467172327425', '2014-10-09 22:24:31', '182.245.95.86', 'web', '用户登录成功', '1', 'U141171625313861386', 'nfxlc');
INSERT INTO `t_n_login_log` VALUES ('141286748477076052', '2014-10-09 23:11:24', '182.245.95.86', 'web', '用户登录成功', '1', 'U141171637293520391', 'yzgl');
INSERT INTO `t_n_login_log` VALUES ('141286780486473933', '2014-10-09 23:16:44', '182.245.95.86', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141290175792669541', '2014-10-10 08:42:37', '116.55.121.74', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141290521895841110', '2014-10-10 09:40:18', '60.161.217.2', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141290526169285684', '2014-10-10 09:41:01', '60.161.217.2', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141290571998984587', '2014-10-10 09:48:39', '60.161.217.2', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141290574178604481', '2014-10-10 09:49:01', '60.161.217.2', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141290602300599335', '2014-10-10 09:53:43', '60.161.217.2', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141290605756786483', '2014-10-10 09:54:17', '60.161.217.2', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141290616497345929', '2014-10-10 09:56:04', '60.161.217.2', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141290620220800726', '2014-10-10 09:56:42', '60.161.217.2', 'web', '用户登录成功', '1', 'U141171628170069944', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141290623594233656', '2014-10-10 09:57:15', '60.161.217.2', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141291075759770235', '2014-10-10 11:12:37', '60.161.217.2', 'web', '用户登录成功', '1', 'U141291025989409769', 'hhxlc01');
INSERT INTO `t_n_login_log` VALUES ('141291078497218418', '2014-10-10 11:13:04', '60.161.217.2', 'web', '用户登录成功', '1', 'U141291038608209175', 'hhxlc02');
INSERT INTO `t_n_login_log` VALUES ('141292443409749337', '2014-10-10 15:00:34', '60.161.217.2', 'web', '用户登录成功', '1', 'U141291025989409769', 'hhxlc01');
INSERT INTO `t_n_login_log` VALUES ('141292456555137649', '2014-10-10 15:02:45', '60.161.217.2', 'web', '用户登录成功', '1', 'U141291038608209175', 'hhxlc02');
INSERT INTO `t_n_login_log` VALUES ('141301046833283496', '2014-10-11 14:54:28', '60.161.217.2', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141301096591031016', '2014-10-11 15:02:45', '60.161.217.2', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301097081648345', '2014-10-11 15:02:50', '60.161.217.2', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301098281644279', '2014-10-11 15:03:02', '60.161.217.2', 'web', '用户登录成功', '1', 'U141291025989409769', 'hhxlc01');
INSERT INTO `t_n_login_log` VALUES ('141301151691038076', '2014-10-11 15:11:56', '60.161.217.2', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('141301523930133178', '2014-10-11 16:13:59', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301524828592274', '2014-10-11 16:14:08', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301525791097545', '2014-10-11 16:14:17', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301526278576750', '2014-10-11 16:14:22', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301527725458725', '2014-10-11 16:14:37', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301561183233081', '2014-10-11 16:20:11', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301563914413761', '2014-10-11 16:20:39', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301567037942657', '2014-10-11 16:21:10', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301567216053510', '2014-10-11 16:21:12', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301569858248406', '2014-10-11 16:21:38', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301569987965113', '2014-10-11 16:21:39', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301618986355089', '2014-10-11 16:29:49', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301619959755737', '2014-10-11 16:29:59', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301621762965763', '2014-10-11 16:30:17', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301623050429060', '2014-10-11 16:30:30', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301628467625645', '2014-10-11 16:31:24', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301630684769651', '2014-10-11 16:31:46', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301631530180398', '2014-10-11 16:31:55', '182.240.40.38', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301661667652544', '2014-10-11 16:36:56', '182.240.40.37', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301674153554123', '2014-10-11 16:39:01', '182.240.40.37', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301674287965506', '2014-10-11 16:39:02', '182.240.40.37', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301677175487628', '2014-10-11 16:39:31', '182.240.40.37', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301690486355135', '2014-10-11 16:41:44', '182.240.40.37', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141301695092694008', '2014-10-11 16:42:30', '182.240.40.37', 'web', '用户名或密码错误', '-1', '', 'HHXLC');
INSERT INTO `t_n_login_log` VALUES ('141301695991083946', '2014-10-11 16:42:39', '182.240.40.37', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141316057762972132', '2014-10-13 08:36:17', '182.240.40.43', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141317223037933043', '2014-10-13 11:50:30', '60.161.217.36', 'web', '用户名或密码错误', '-1', '', 'hhxlc');
INSERT INTO `t_n_login_log` VALUES ('141317260692611036', '2014-10-13 11:56:46', '182.247.177.106', 'web', '用户登录成功', '1', 'U141291025989409769', 'hhxlc01');
INSERT INTO `t_n_login_log` VALUES ('141320403264418551', '2014-10-13 20:40:32', '116.52.188.13', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144326897132693552', '2015-09-26 20:02:51', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144326900908919340', '2015-09-26 20:03:29', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144326917445839593', '2015-09-26 20:06:14', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144332767194993086', '2015-09-27 12:21:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144406007012163919', '2015-10-05 23:47:50', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144406089484653077', '2015-10-06 00:01:34', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144415408129571222', '2015-10-07 01:54:41', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144415793954995015', '2015-10-07 02:58:59', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144415800667120471', '2015-10-07 03:00:06', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144415834292038875', '2015-10-07 03:05:42', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144415909897484644', '2015-10-07 03:18:18', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144415983884617087', '2015-10-07 03:30:38', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144446677343736965', '2015-10-10 16:46:13', '135.32.9.70', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144446741909306691', '2015-10-10 16:56:59', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144446744668793797', '2015-10-10 16:57:26', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144463006056281509', '2015-10-12 14:07:40', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144463012717118737', '2015-10-12 14:08:47', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144463014420340112', '2015-10-12 14:09:04', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144463181067421531', '2015-10-12 14:36:50', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144463203903041916', '2015-10-12 14:40:39', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144463206270121464', '2015-10-12 14:41:02', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144463220003435574', '2015-10-12 14:43:20', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144463224586573408', '2015-10-12 14:44:05', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144464454599945424', '2015-10-12 18:09:06', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144465079197879644', '2015-10-12 19:53:11', '106.60.172.105', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144465131242057531', '2015-10-12 20:01:52', '106.60.172.105', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522242034688275', '2015-10-19 10:40:20', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522246832968808', '2015-10-19 10:41:08', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522330720820600', '2015-10-19 10:55:07', '61.166.152.129', 'web', '用户登录成功', '1', 'U144522329137990023', 'teach_01');
INSERT INTO `t_n_login_log` VALUES ('144522332677457704', '2015-10-19 10:55:26', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522425878250609', '2015-10-19 11:10:58', '116.52.252.58', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522462712119878', '2015-10-19 11:17:07', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522463154960828', '2015-10-19 11:17:11', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522471004552701', '2015-10-19 11:18:30', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522492600171074', '2015-10-19 11:22:06', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522537358957197', '2015-10-19 11:29:33', '116.52.252.58', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522668413587008', '2015-10-19 11:51:24', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522895953425890', '2015-10-19 12:29:19', '14.215.222.183', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144522987313525115', '2015-10-19 12:44:33', '14.215.222.183', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144523126406287804', '2015-10-19 13:07:44', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144523514295073539', '2015-10-19 14:12:22', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144524311577794284', '2015-10-19 16:25:15', '106.57.83.227', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144524443758356926', '2015-10-19 16:47:17', '106.57.98.72', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144540869155890846', '2015-10-21 14:24:51', '116.52.252.58', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144660566577001150', '2015-11-04 10:54:25', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144660620360240475', '2015-11-04 11:03:23', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904275041007866', '2015-12-02 15:52:30', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904282771085432', '2015-12-02 15:53:47', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904290470773105', '2015-12-02 15:55:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904297488777733', '2015-12-02 15:56:14', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904302518982404', '2015-12-02 15:57:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904314519656628', '2015-12-02 15:59:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904333262352947', '2015-12-02 16:02:12', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904344049334575', '2015-12-02 16:04:00', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904387945845239', '2015-12-02 16:11:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904398949807518', '2015-12-02 16:13:09', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904405262417540', '2015-12-02 16:14:12', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904463796134367', '2015-12-02 16:23:57', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904556348970258', '2015-12-02 16:39:23', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904565779535332', '2015-12-02 16:40:57', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904569904692468', '2015-12-02 16:41:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904578253419354', '2015-12-02 16:43:02', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144904918081704255', '2015-12-02 17:39:40', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144905672795062199', '2015-12-02 19:45:27', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144905772084061650', '2015-12-02 20:02:00', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144905924268366926', '2015-12-02 20:27:22', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906081333651493', '2015-12-02 20:53:33', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906343864351964', '2015-12-02 21:37:18', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906420750357250', '2015-12-02 21:50:07', '2002:c000:204:0:0:0:c000:204', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906429736878114', '2015-12-02 21:51:37', '192.168.56.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906665960557697', '2015-12-02 22:30:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906821276864769', '2015-12-02 22:56:52', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906834131980096', '2015-12-02 22:59:01', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906836266802693', '2015-12-02 22:59:22', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906843778146542', '2015-12-02 23:00:37', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906854744674162', '2015-12-02 23:02:27', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906872222633230', '2015-12-02 23:05:22', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144906901030587163', '2015-12-02 23:10:10', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144919494875219494', '2015-12-04 10:09:08', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144933993952739436', '2015-12-06 02:25:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144934241357590275', '2015-12-06 03:06:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144936280421185606', '2015-12-06 08:46:44', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144936300961303795', '2015-12-06 08:50:09', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144936505504645943', '2015-12-06 09:24:15', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144936523151563853', '2015-12-06 09:27:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144938487526439778', '2015-12-06 14:54:35', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144938724111607110', '2015-12-06 15:34:01', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144938811381299639', '2015-12-06 15:48:33', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144938911506706928', '2015-12-06 16:05:15', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144938916667463816', '2015-12-06 16:06:06', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144939425250206244', '2015-12-06 17:30:52', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144940152641676951', '2015-12-06 19:32:06', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144940352951947971', '2015-12-06 20:05:29', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144941005513899405', '2015-12-06 21:54:15', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144941014114224911', '2015-12-06 21:55:41', '2002:c000:203:0:0:0:c000:203', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144941030263318152', '2015-12-06 21:58:22', '2001:0:9d38:90d7:3879:668:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144958181176418065', '2015-12-08 21:36:51', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144958536902930394', '2015-12-08 22:36:09', '2001:0:9d38:6abd:2ca6:182f:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144958575249913612', '2015-12-08 22:42:32', '2001:0:9d38:6abd:2ca6:182f:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144958584510261428', '2015-12-08 22:44:05', '2001:0:9d38:6abd:2ca6:182f:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144958640611655440', '2015-12-08 22:53:26', '2001:0:9d38:6abd:2ca6:182f:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144958763157941726', '2015-12-08 23:13:51', '2001:0:9d38:6abd:2ca6:182f:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144966189499991755', '2015-12-09 19:51:34', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144966448104603200', '2015-12-09 20:34:41', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144975197646738557', '2015-12-10 20:52:56', '192.0.2.9', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144992312565736045', '2015-12-12 20:25:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144992944449506072', '2015-12-12 22:10:44', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144992959674619288', '2015-12-12 22:13:16', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144993107947853022', '2015-12-12 22:37:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144993204585723051', '2015-12-12 22:54:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144993848869467396', '2015-12-13 00:41:28', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144993863900023253', '2015-12-13 00:43:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144993901110732536', '2015-12-13 00:50:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144993914664297442', '2015-12-13 00:52:26', '192.168.56.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144993927572984695', '2015-12-13 00:54:35', '2002:c000:211:0:0:0:c000:211', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997525635140641', '2015-12-13 10:54:16', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997581167486686', '2015-12-13 11:03:31', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997591926752009', '2015-12-13 11:05:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997608281995218', '2015-12-13 11:08:02', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997619497986132', '2015-12-13 11:09:54', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997660818007528', '2015-12-13 11:16:48', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997672097018297', '2015-12-13 11:18:40', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997704059119741', '2015-12-13 11:24:00', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997915905946448', '2015-12-13 11:59:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997947205763580', '2015-12-13 12:04:32', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144997959375472813', '2015-12-13 12:06:33', 'fe80:0:0:0:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144998042941361407', '2015-12-13 12:20:29', 'fe80:0:0:0:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144998056471270958', '2015-12-13 12:22:44', 'fe80:0:0:0:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144998058914854605', '2015-12-13 12:23:09', 'fe80:0:0:0:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144998063109835880', '2015-12-13 12:23:51', '2001:0:5ef5:79fd:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144998083195292157', '2015-12-13 12:27:11', '2001:0:5ef5:79fd:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144998108832461854', '2015-12-13 12:31:28', '2001:0:5ef5:79fd:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144998129469348642', '2015-12-13 12:34:54', '2001:0:5ef5:79fd:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('144998179158668204', '2015-12-13 12:43:11', '2001:0:5ef5:79fd:1cd8:552:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000294377957047', '2015-12-13 18:35:43', 'fe80:0:0:0:2c64:c62:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000319102690775', '2015-12-13 18:39:51', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000334407716634', '2015-12-13 18:42:24', '192.168.56.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000341959624620', '2015-12-13 18:43:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000376737985256', '2015-12-13 18:49:27', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000386473649575', '2015-12-13 18:51:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000406018262924', '2015-12-13 18:54:20', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000518151755806', '2015-12-13 19:13:01', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000541700366597', '2015-12-13 19:16:57', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000568811481075', '2015-12-13 19:21:28', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000590941125660', '2015-12-13 19:25:09', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000609724044330', '2015-12-13 19:28:17', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000650982675214', '2015-12-13 19:35:09', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000666003201266', '2015-12-13 19:37:40', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000712473564447', '2015-12-13 19:45:24', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000845825237259', '2015-12-13 20:07:38', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000855914772810', '2015-12-13 20:09:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145000977537264572', '2015-12-13 20:29:35', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145001015632181324', '2015-12-13 20:35:56', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145001033900151865', '2015-12-13 20:38:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145001044516425516', '2015-12-13 20:40:45', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145001055479479987', '2015-12-13 20:42:34', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145005922004465623', '2015-12-14 10:13:40', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145005959097454433', '2015-12-14 10:19:50', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145006180089866855', '2015-12-14 10:56:40', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145006219680446032', '2015-12-14 11:03:16', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145006289590038981', '2015-12-14 11:14:55', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145006836610068433', '2015-12-14 12:46:06', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145009642961332308', '2015-12-14 20:33:49', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145010386257129655', '2015-12-14 22:37:42', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145010406891574261', '2015-12-14 22:41:08', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145010416166095238', '2015-12-14 22:42:41', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145010445392047781', '2015-12-14 22:47:33', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145010455731341419', '2015-12-14 22:49:17', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145010469953290865', '2015-12-14 22:51:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145019292926210779', '2015-12-15 23:22:09', '10.0.0.7', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145019348731224851', '2015-12-15 23:31:27', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145019422692110628', '2015-12-15 23:43:46', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145035523859357297', '2015-12-17 20:27:18', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145036014933248593', '2015-12-17 21:49:09', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145036026484884330', '2015-12-17 21:51:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145036051411474457', '2015-12-17 21:55:14', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145042358611360966', '2015-12-18 15:26:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145049340979317918', '2015-12-19 10:50:09', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145051664239182066', '2015-12-19 17:17:22', '10.0.0.7', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145052225743765602', '2015-12-19 18:50:57', '10.0.0.7', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145052928171599218', '2015-12-19 20:48:01', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145053294524081316', '2015-12-19 21:49:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145053304615374841', '2015-12-19 21:50:46', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145053311033649914', '2015-12-19 21:51:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145053716475627609', '2015-12-19 22:59:24', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145053719058118550', '2015-12-19 22:59:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145053920992360208', '2015-12-19 23:33:29', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145054535348682351', '2015-12-20 01:15:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057276410526680', '2015-12-20 08:52:44', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057302368347304', '2015-12-20 08:57:03', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057320188793700', '2015-12-20 09:00:01', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057343840406538', '2015-12-20 09:03:58', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057400490204932', '2015-12-20 09:13:24', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057426748123603', '2015-12-20 09:17:47', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057584974113718', '2015-12-20 09:44:09', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057586199710474', '2015-12-20 09:44:21', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057604558593050', '2015-12-20 09:47:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057690364006566', '2015-12-20 10:01:43', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057826367687976', '2015-12-20 10:24:23', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057898691939470', '2015-12-20 10:36:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145057945281639268', '2015-12-20 10:44:12', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145058003428411706', '2015-12-20 10:53:54', '10.0.0.7', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145058141291616297', '2015-12-20 11:16:52', '2002:c000:20c:0:0:0:c000:20c', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145058161231779678', '2015-12-20 11:20:12', '2002:c000:20c:0:0:0:c000:20c', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145059781440700200', '2015-12-20 15:50:14', '2002:c000:20c:0:0:0:c000:20c', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145059877772904425', '2015-12-20 16:06:17', '2002:c000:20c:0:0:0:c000:20c', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145060522268516787', '2015-12-20 17:53:42', '2002:c000:20c:0:0:0:c000:20c', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145061246376507063', '2015-12-20 19:54:23', '2002:c000:20c:0:0:0:c000:20c', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145061310721282348', '2015-12-20 20:05:07', '2002:c000:20c:0:0:0:c000:20c', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145061390863058409', '2015-12-20 20:18:28', '2002:c000:20c:0:0:0:c000:20c', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145061459122465952', '2015-12-20 20:29:51', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145061672816127336', '2015-12-20 21:05:28', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145061797610767383', '2015-12-20 21:26:16', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145061980219846217', '2015-12-20 21:56:42', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145062043239184834', '2015-12-20 22:07:12', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145062082010023987', '2015-12-20 22:13:40', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145062355480724241', '2015-12-20 22:59:14', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145062701987362930', '2015-12-20 23:56:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145062735910832775', '2015-12-21 00:02:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145069733521987301', '2015-12-21 19:28:55', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145070374684054785', '2015-12-21 21:15:46', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145070386919170768', '2015-12-21 21:17:49', '112.112.247.107', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145070564834699602', '2015-12-21 21:47:28', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145078291164391966', '2015-12-22 19:15:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145078386163050720', '2015-12-22 19:31:01', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145078408520223207', '2015-12-22 19:34:45', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145078802059600348', '2015-12-22 20:40:20', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145079001156871902', '2015-12-22 21:13:31', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145079003003295574', '2015-12-22 21:13:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145079017005301871', '2015-12-22 21:16:10', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145079328415381439', '2015-12-22 22:08:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145079353338103679', '2015-12-22 22:12:13', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145079392994151252', '2015-12-22 22:18:49', '2002:c000:20e:0:0:0:c000:20e', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145079474358132184', '2015-12-22 22:32:23', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145087551780888688', '2015-12-23 20:58:37', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145092672722673744', '2015-12-24 11:12:07', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'stu');
INSERT INTO `t_n_login_log` VALUES ('145092713571901523', '2015-12-24 11:18:55', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145092737260757070', '2015-12-24 11:22:52', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145092737877967946', '2015-12-24 11:22:58', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145092738451949840', '2015-12-24 11:23:04', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea2');
INSERT INTO `t_n_login_log` VALUES ('145092739302255171', '2015-12-24 11:23:13', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145092739767744176', '2015-12-24 11:23:17', '61.166.152.129', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145092741263221939', '2015-12-24 11:23:32', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'stu2');
INSERT INTO `t_n_login_log` VALUES ('145092741497432870', '2015-12-24 11:23:34', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'stu2');
INSERT INTO `t_n_login_log` VALUES ('145092742049985317', '2015-12-24 11:23:40', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'stu2');
INSERT INTO `t_n_login_log` VALUES ('145092744454928048', '2015-12-24 11:24:04', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145092745429492645', '2015-12-24 11:24:14', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145092745820943429', '2015-12-24 11:24:18', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145092746083837937', '2015-12-24 11:24:20', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea2');
INSERT INTO `t_n_login_log` VALUES ('145092746464418184', '2015-12-24 11:24:24', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea2');
INSERT INTO `t_n_login_log` VALUES ('145092746864674474', '2015-12-24 11:24:28', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea2');
INSERT INTO `t_n_login_log` VALUES ('145092749678616599', '2015-12-24 11:24:56', '61.166.152.129', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145092753143345325', '2015-12-24 11:25:31', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092728714573693', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145092754659377153', '2015-12-24 11:25:46', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea2');
INSERT INTO `t_n_login_log` VALUES ('145092755723504310', '2015-12-24 11:25:57', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea2');
INSERT INTO `t_n_login_log` VALUES ('145092756399797180', '2015-12-24 11:26:03', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092734400355683', 'tea2');
INSERT INTO `t_n_login_log` VALUES ('145092758563325996', '2015-12-24 11:26:25', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145092786953121142', '2015-12-24 11:31:09', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145092787421201931', '2015-12-24 11:31:14', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092728714573693', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145092789199925264', '2015-12-24 11:31:31', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092734400355683', 'tea2');
INSERT INTO `t_n_login_log` VALUES ('145092808033855842', '2015-12-24 11:34:40', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092798733432755', 'system');
INSERT INTO `t_n_login_log` VALUES ('145092817674160312', '2015-12-24 11:36:16', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092798733432755', 'system');
INSERT INTO `t_n_login_log` VALUES ('145093384557928707', '2015-12-24 13:10:45', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'system');
INSERT INTO `t_n_login_log` VALUES ('145093385052775942', '2015-12-24 13:10:50', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092798733432755', 'system');
INSERT INTO `t_n_login_log` VALUES ('145093390525930130', '2015-12-24 13:11:45', '61.166.152.129', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145093400809380151', '2015-12-24 13:13:28', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145093406018643639', '2015-12-24 13:14:20', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145093410000229639', '2015-12-24 13:15:00', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145093421347196882', '2015-12-24 13:16:53', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145093731771187155', '2015-12-24 14:08:37', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145093765645301503', '2015-12-24 14:14:16', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145093766350600343', '2015-12-24 14:14:23', '61.166.152.129', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145093790252363074', '2015-12-24 14:18:22', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092798733432755', 'system');
INSERT INTO `t_n_login_log` VALUES ('145093818600281994', '2015-12-24 14:23:06', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145093894808437405', '2015-12-24 14:35:48', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145093983515934951', '2015-12-24 14:50:35', '61.166.152.129', 'web', '用户登录成功', '1', 'U145092728714573693', 'tea1');
INSERT INTO `t_n_login_log` VALUES ('145094007749325305', '2015-12-24 14:54:37', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145094020193908465', '2015-12-24 14:56:41', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145094107834020336', '2015-12-24 15:11:18', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145094120316073295', '2015-12-24 15:13:23', '61.166.152.129', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145094134224691177', '2015-12-24 15:15:42', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145096164864250760', '2015-12-24 20:54:08', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145096199444950999', '2015-12-24 20:59:54', '222.221.163.63', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145096724178990452', '2015-12-24 22:27:21', '222.221.163.63', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145096756106327922', '2015-12-24 22:32:41', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145096917224981847', '2015-12-24 22:59:32', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145096935646339499', '2015-12-24 23:02:36', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145097002765403474', '2015-12-24 23:13:47', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145097037408091477', '2015-12-24 23:19:34', '192.0.2.8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145097283143994049', '2015-12-25 00:00:31', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户名或密码错误', '-1', '', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145097284287867069', '2015-12-25 00:00:42', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145097290790690646', '2015-12-25 00:01:47', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145097553115234146', '2015-12-25 00:45:31', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145097666339770647', '2015-12-25 01:04:23', '2002:c000:208:0:0:0:c000:208', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145097687422028870', '2015-12-25 01:07:54', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145097733655520838', '2015-12-25 01:15:36', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145101973087186096', '2015-12-25 13:02:10', '14.215.222.181', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145102839881301548', '2015-12-25 15:26:38', '116.52.252.58', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145102849560486140', '2015-12-25 15:28:15', '116.52.252.58', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145110586187459457', '2015-12-26 12:57:41', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145111492892410122', '2015-12-26 15:28:48', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145111532586222490', '2015-12-26 15:35:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145111558290026219', '2015-12-26 15:39:42', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145111606049687729', '2015-12-26 15:47:40', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145111686411462983', '2015-12-26 16:01:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112137363756334', '2015-12-26 17:16:13', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112165421973356', '2015-12-26 17:20:54', '2001:0:5ef5:79fd:14ff:3f79:2122:ebbb', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112192869412518', '2015-12-26 17:25:28', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112349597746930', '2015-12-26 17:51:35', '2002:dedd:1444:0:0:0:dedd:1444', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112368807224776', '2015-12-26 17:54:48', '2002:dedd:1444:0:0:0:dedd:1444', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112433830000941', '2015-12-26 18:05:38', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112451375972153', '2015-12-26 18:08:33', '2002:dedd:1444:0:0:0:dedd:1444', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112480156054237', '2015-12-26 18:13:21', '2002:dedd:1444:0:0:0:dedd:1444', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145112522435276483', '2015-12-26 18:20:24', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145113721722004376', '2015-12-26 21:40:17', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145113887253428438', '2015-12-26 22:07:52', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145113968347130338', '2015-12-26 22:21:23', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145113977494895896', '2015-12-26 22:22:54', '2001:0:5ef5:79fb:4ee:3b6f:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145114004492779899', '2015-12-26 22:27:24', '2001:0:5ef5:79fb:4ee:3b6f:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145114477156321548', '2015-12-26 23:46:11', '2001:0:5ef5:79fb:4ee:3b6f:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145119776264892806', '2015-12-27 14:29:22', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145119788043202419', '2015-12-27 14:31:20', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145119793935085205', '2015-12-27 14:32:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145119848769900874', '2015-12-27 14:41:27', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145119869795695819', '2015-12-27 14:44:57', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145119904442557201', '2015-12-27 14:50:44', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120084806723238', '2015-12-27 15:20:48', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120093133538449', '2015-12-27 15:22:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120332296612658', '2015-12-27 16:02:02', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120335426572395', '2015-12-27 16:02:34', 'fe80:0:0:0:1cf8:259c:235c:b9b3', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120863131904273', '2015-12-27 17:30:31', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120869146459918', '2015-12-27 17:31:31', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120882303471604', '2015-12-27 17:33:43', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120896376793243', '2015-12-27 17:36:03', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120906647409205', '2015-12-27 17:37:46', 'fe80:0:0:0:1cf8:259c:235c:b9b3', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120913751364086', '2015-12-27 17:38:57', 'fe80:0:0:0:1cf8:259c:235c:b9b3', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120923523818691', '2015-12-27 17:40:35', '2002:c000:214:0:0:0:c000:214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120931984222616', '2015-12-27 17:41:59', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120935774524272', '2015-12-27 17:42:37', '2002:c000:214:0:0:0:c000:214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120944998946311', '2015-12-27 17:44:09', '2002:c000:214:0:0:0:c000:214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120950173668408', '2015-12-27 17:45:01', '2002:c000:214:0:0:0:c000:214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120954065745202', '2015-12-27 17:45:40', '2002:c000:214:0:0:0:c000:214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120962545508255', '2015-12-27 17:47:05', '2002:c000:214:0:0:0:c000:214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120967991158525', '2015-12-27 17:47:59', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145120986862290482', '2015-12-27 17:51:08', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121033992269567', '2015-12-27 17:58:59', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121044929847390', '2015-12-27 18:00:49', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121050686435870', '2015-12-27 18:01:46', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121073007509261', '2015-12-27 18:05:30', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121137048549976', '2015-12-27 18:16:10', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121153060962337', '2015-12-27 18:18:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121165188458484', '2015-12-27 18:20:51', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121188568478701', '2015-12-27 18:24:45', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121194801507979', '2015-12-27 18:25:48', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121210867214161', '2015-12-27 18:28:28', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121213285725886', '2015-12-27 18:28:52', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145121247505149194', '2015-12-27 18:34:35', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145122180301203382', '2015-12-27 21:10:03', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145130460196311954', '2015-12-28 20:10:01', '14.215.222.183', 'web', '用户名或密码错误', '-1', '', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145130461361736276', '2015-12-28 20:10:13', '14.215.222.183', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145137260577521062', '2015-12-29 15:03:25', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145137401348442537', '2015-12-29 15:26:53', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145137417140881794', '2015-12-29 15:29:31', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145137422398779825', '2015-12-29 15:30:23', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145137472269106260', '2015-12-29 15:38:42', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145137509598241327', '2015-12-29 15:44:55', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145181410124674320', '2016-01-03 17:41:41', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145181420546660969', '2016-01-03 17:43:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145181454071869189', '2016-01-03 17:49:00', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145181851506873887', '2016-01-03 18:55:15', '220.165.171.140', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145181945670427708', '2016-01-03 19:10:56', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145181975017448848', '2016-01-03 19:15:50', '220.165.171.140', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145182341181701581', '2016-01-03 20:16:51', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145182578962566173', '2016-01-03 20:56:29', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145182775746875389', '2016-01-03 21:29:17', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145182776919280520', '2016-01-03 21:29:29', '220.165.171.140', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145183322220606633', '2016-01-03 23:00:22', '220.165.171.140', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145183595353603499', '2016-01-03 23:45:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217040323763935', '2016-01-07 20:40:03', '116.54.13.136', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217294979470618', '2016-01-07 21:22:29', '116.54.13.136', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217378040052144', '2016-01-07 21:36:20', '182.245.82.135', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217419032807059', '2016-01-07 21:43:10', '116.54.13.136', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217422995728203', '2016-01-07 21:43:49', '182.245.82.135', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217447844804628', '2016-01-07 21:47:58', '182.245.82.135', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217500736699114', '2016-01-07 21:56:47', '182.245.82.135', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217506981975373', '2016-01-07 21:57:49', '182.245.82.135', 'web', '用户名或密码错误', '-1', '', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145217507200037419', '2016-01-07 21:57:52', '182.245.82.135', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145217526239690879', '2016-01-07 22:01:02', '182.245.82.135', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217543282008417', '2016-01-07 22:03:52', '182.245.82.135', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217569397407233', '2016-01-07 22:08:13', '182.245.82.135', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145217592986557341', '2016-01-07 22:12:09', '182.245.82.135', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145217603323236048', '2016-01-07 22:13:53', '182.245.82.135', 'web', '用户名或密码错误', '-1', '', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145217603690012859', '2016-01-07 22:13:56', '182.245.82.135', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145232372868150029', '2016-01-09 15:15:28', '106.57.81.248', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145232381683879550', '2016-01-09 15:16:56', '106.57.81.248', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145232383923947152', '2016-01-09 15:17:19', '106.57.81.248', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145232590317366803', '2016-01-09 15:51:43', '106.57.81.248', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145232743067453257', '2016-01-09 16:17:10', '106.57.81.248', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145232756565031244', '2016-01-09 16:19:25', '106.57.81.248', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145232870496967521', '2016-01-09 16:38:24', '106.57.81.248', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145277390640590752', '2016-01-14 20:18:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145358957044628971', '2016-01-24 06:52:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145390831875099705', '2016-01-27 23:25:18', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145390910731631476', '2016-01-27 23:38:27', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145390911992433224', '2016-01-27 23:38:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145390945246143662', '2016-01-27 23:44:12', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145390956579748433', '2016-01-27 23:46:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145404992218976956', '2016-01-29 14:45:22', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145405785756793448', '2016-01-29 16:57:37', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145405902083513802', '2016-01-29 17:17:00', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145405955892172415', '2016-01-29 17:25:58', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145405967985354467', '2016-01-29 17:27:59', '61.166.152.129', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145405995895669029', '2016-01-29 17:32:38', '61.166.152.129', 'web', '用户名或密码错误', '-1', '', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145405996201670774', '2016-01-29 17:32:42', '61.166.152.129', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145406014996863573', '2016-01-29 17:35:49', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145406023083725597', '2016-01-29 17:37:10', '61.166.152.129', 'web', '用户登录成功', '1', 'U145054239527900055', 'stu1');
INSERT INTO `t_n_login_log` VALUES ('145406034701916887', '2016-01-29 17:39:07', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145406037768843564', '2016-01-29 17:39:37', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145406058444004578', '2016-01-29 17:43:04', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145412234442897258', '2016-01-30 10:52:24', '116.52.63.219', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145412242651675001', '2016-01-30 10:53:46', '116.52.63.219', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145412253397528146', '2016-01-30 10:55:33', '116.52.63.219', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145412258323072724', '2016-01-30 10:56:23', '116.52.63.219', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145412703174646929', '2016-01-30 12:10:31', '116.52.63.219', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145424559015305349', '2016-01-31 21:06:30', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145546887599820397', '2016-02-15 00:54:35', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145547485530764746', '2016-02-15 02:34:15', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145547947795935107', '2016-02-15 03:51:17', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145551474250872456', '2016-02-15 13:39:02', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145554651448771625', '2016-02-15 22:28:34', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145557839422258220', '2016-02-16 07:19:54', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145558177602970478', '2016-02-16 08:16:16', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145558690951607672', '2016-02-16 09:41:49', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145559246659057018', '2016-02-16 11:14:26', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145559288190759107', '2016-02-16 11:21:21', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145559416583725083', '2016-02-16 11:42:45', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145559533564018925', '2016-02-16 12:02:15', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145560376399830624', '2016-02-16 14:22:43', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145560683390404840', '2016-02-16 15:13:53', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145561051688369585', '2016-02-16 16:15:16', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145561054033240347', '2016-02-16 16:15:40', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145561290357691453', '2016-02-16 16:55:03', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145561820660944848', '2016-02-16 18:23:26', '10.0.0.7', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145561840060822288', '2016-02-16 18:26:40', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145561852224052645', '2016-02-16 18:28:42', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145561871384683976', '2016-02-16 18:31:53', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145561900202661824', '2016-02-16 18:36:42', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145562370264412650', '2016-02-16 19:55:02', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145563153288815877', '2016-02-16 22:05:32', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145604437109363125', '2016-02-21 16:46:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145604550260782175', '2016-02-21 17:05:02', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145605327694723603', '2016-02-21 19:14:36', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145606435065775438', '2016-02-21 22:19:10', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145606598913801008', '2016-02-21 22:46:29', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145610551358305362', '2016-02-22 09:45:13', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145610561235879150', '2016-02-22 09:46:52', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145610574517953647', '2016-02-22 09:49:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145614939601104773', '2016-02-22 21:56:36', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145618834988968378', '2016-02-23 08:45:49', '192.0.2.7', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145618836285017945', '2016-02-23 08:46:02', '192.0.2.7', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145619857942670001', '2016-02-23 11:36:19', '135.32.89.118', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145620240967253836', '2016-02-23 12:40:09', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145620248625499753', '2016-02-23 12:41:26', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145620261322597589', '2016-02-23 12:43:33', '135.32.89.22', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145623238409969415', '2016-02-23 20:59:44', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145640951483827116', '2016-02-25 22:11:54', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145640998356742326', '2016-02-25 22:19:43', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145640998800605871', '2016-02-25 22:19:48', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145640999201118841', '2016-02-25 22:19:52', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641000401822666', '2016-02-25 22:20:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641004082710777', '2016-02-25 22:20:40', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641040069583844', '2016-02-25 22:26:40', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641377305093427', '2016-02-25 23:22:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641450346763428', '2016-02-25 23:35:03', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641455388364564', '2016-02-25 23:35:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641458649840608', '2016-02-25 23:36:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641465573654812', '2016-02-25 23:37:35', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641471846764498', '2016-02-25 23:38:38', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641512343694208', '2016-02-25 23:45:23', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145641612493027648', '2016-02-26 00:02:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145645257453277679', '2016-02-26 10:09:34', '192.0.2.12', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145646371085543877', '2016-02-26 13:15:10', '192.0.2.12', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145655383335780963', '2016-02-27 14:17:13', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145655384583716514', '2016-02-27 14:17:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145656100762633271', '2016-02-27 16:16:47', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145656728201281880', '2016-02-27 18:01:22', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145657266192372755', '2016-02-27 19:31:01', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145657470574814073', '2016-02-27 20:05:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145658300762613937', '2016-02-27 22:23:27', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145658487848566287', '2016-02-27 22:54:38', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145658696732207585', '2016-02-27 23:29:27', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户名或密码错误', '-1', '', 'cuiligang');
INSERT INTO `t_n_login_log` VALUES ('145658697675079348', '2016-02-27 23:29:36', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145659215045776600', '2016-02-28 00:55:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145662587175136134', '2016-02-28 10:17:51', 'fe80:0:0:0:855:497:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145664237466060050', '2016-02-28 14:52:54', 'fe80:0:0:0:855:497:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145664472845766725', '2016-02-28 15:32:08', 'fe80:0:0:0:855:497:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145665717983903460', '2016-02-28 18:59:39', 'fe80:0:0:0:855:497:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145667053814669426', '2016-02-28 22:42:18', 'fe80:0:0:0:855:497:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145667554867953472', '2016-02-29 00:05:48', 'fe80:0:0:0:855:497:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145672948576167691', '2016-02-29 15:04:45', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145674844474341682', '2016-02-29 20:20:44', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145675188227476985', '2016-02-29 21:18:02', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145675188256484333', '2016-02-29 21:18:02', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145675188473326505', '2016-02-29 21:18:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145675462268129073', '2016-02-29 22:03:42', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145676156100479394', '2016-02-29 23:59:21', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145683669236565665', '2016-03-01 20:51:32', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145683956444934927', '2016-03-01 21:39:24', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145685601930277008', '2016-03-02 02:13:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145688549378807006', '2016-03-02 10:24:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145689207550089319', '2016-03-02 12:14:35', 'fe80:0:0:0:18f6:2988:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145689268355972844', '2016-03-02 12:24:43', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145689972484326459', '2016-03-02 14:22:04', 'fe80:0:0:0:18f6:2988:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145690447334668290', '2016-03-02 15:41:13', 'fe80:0:0:0:18f6:2988:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145691222685049569', '2016-03-02 17:50:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145691655170992623', '2016-03-02 19:02:31', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145692311915610924', '2016-03-02 20:51:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145692316330155338', '2016-03-02 20:52:43', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145692328642473577', '2016-03-02 20:54:46', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145692347537826536', '2016-03-02 20:57:55', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145692361767854318', '2016-03-02 21:00:17', 'fe80:0:0:0:3cd0:2eb0:f5ff:fff8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145701237760053136', '2016-03-03 21:39:37', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145701717750844084', '2016-03-03 22:59:37', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145702318625152869', '2016-03-04 00:39:46', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145702328623846489', '2016-03-04 00:41:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145702336519340941', '2016-03-04 00:42:45', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145702361455725099', '2016-03-04 00:46:54', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145702457953346018', '2016-03-04 01:02:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145705343735626393', '2016-03-04 09:03:57', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145705496819113515', '2016-03-04 09:29:28', '2002:c000:214:0:0:0:c000:214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145705531906379418', '2016-03-04 09:35:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145705562138689609', '2016-03-04 09:40:21', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145705649857376283', '2016-03-04 09:54:58', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145706140865739419', '2016-03-04 11:16:48', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145706161032184446', '2016-03-04 11:20:10', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145706216280447080', '2016-03-04 11:29:22', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145706232805645158', '2016-03-04 11:32:08', '2002:c000:214:0:0:0:c000:214', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145706248039394683', '2016-03-04 11:34:40', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145707756768105416', '2016-03-04 15:46:07', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145708556877704035', '2016-03-04 17:59:28', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145708568606427393', '2016-03-04 18:01:26', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145708574399114496', '2016-03-04 18:02:23', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145708668838039929', '2016-03-04 18:18:08', '117.136.84.250', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145710099367034486', '2016-03-04 22:16:33', '117.136.85.53', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145715051832640406', '2016-03-05 12:01:58', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145717504130878994', '2016-03-05 18:50:41', '202.98.69.172', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145717569616221610', '2016-03-05 19:01:36', '202.98.69.172', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145717591103928145', '2016-03-05 19:05:11', '222.221.206.62', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145717594234361129', '2016-03-05 19:05:42', '202.98.69.172', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145717607727028792', '2016-03-05 19:07:57', '202.98.69.172', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145717620277618897', '2016-03-05 19:10:02', '202.98.69.172', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145717951054732852', '2016-03-05 20:05:10', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145718185936954964', '2016-03-05 20:44:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145718636691085080', '2016-03-05 21:59:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145718823026615493', '2016-03-05 22:30:30', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145718829890595728', '2016-03-05 22:31:38', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145718986450168365', '2016-03-05 22:57:44', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145719017367051673', '2016-03-05 23:02:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145722560714638007', '2016-03-06 08:53:27', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145722596585123289', '2016-03-06 08:59:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145722692305343455', '2016-03-06 09:15:23', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145722731735863130', '2016-03-06 09:21:57', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145723113462427290', '2016-03-06 10:25:34', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145723123438786392', '2016-03-06 10:27:14', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145723165413759995', '2016-03-06 10:34:14', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145723183855477569', '2016-03-06 10:37:18', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145723218444853925', '2016-03-06 10:43:04', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145723241314020005', '2016-03-06 10:46:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145723411610500098', '2016-03-06 11:15:16', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145724049314265570', '2016-03-06 13:01:33', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145724822626578743', '2016-03-06 15:10:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145724842797240675', '2016-03-06 15:13:47', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145724857127358672', '2016-03-06 15:16:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145725074468948580', '2016-03-06 15:52:24', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145725151311002629', '2016-03-06 16:05:13', 'fe80:0:0:0:93:47d:3f57:d426', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145725152093662768', '2016-03-06 16:05:20', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145759909952993793', '2016-03-10 16:38:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145759948353806516', '2016-03-10 16:44:43', '2002:8720:5976:0:0:0:8720:5976', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145759993948883378', '2016-03-10 16:52:19', '2002:8720:5976:0:0:0:8720:5976', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145761876929303324', '2016-03-10 22:06:09', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762190636230744', '2016-03-10 22:58:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762211692438341', '2016-03-10 23:01:56', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762232378419242', '2016-03-10 23:05:23', '2002:c000:203:0:0:0:c000:203', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762243263987577', '2016-03-10 23:07:12', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762271240582423', '2016-03-10 23:11:52', '2002:c000:203:0:0:0:c000:203', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762292924829747', '2016-03-10 23:15:29', '2002:c000:203:0:0:0:c000:203', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762308199604343', '2016-03-10 23:18:01', '2002:c000:203:0:0:0:c000:203', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762325391915516', '2016-03-10 23:20:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762377744926148', '2016-03-10 23:29:37', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762444958483192', '2016-03-10 23:40:49', '2001:0:9d38:6abd:2093:16b6:f5ff:fffa', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145762491910576095', '2016-03-10 23:48:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145769032596035423', '2016-03-11 17:58:45', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145770849328897169', '2016-03-11 23:01:33', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145771377403046998', '2016-03-12 00:29:34', 'fe80:0:0:0:28c6:34f5:f5ff:fffa', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145771618178925572', '2016-03-12 01:09:41', '2002:c000:203:0:0:0:c000:203', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145774140848587045', '2016-03-12 08:10:08', '2002:c000:203:0:0:0:c000:203', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775355642792142', '2016-03-12 11:32:36', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775359307137630', '2016-03-12 11:33:13', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775370504047970', '2016-03-12 11:35:05', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775384118411432', '2016-03-12 11:37:21', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775399788239334', '2016-03-12 11:39:57', '106.61.2.8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775406894422197', '2016-03-12 11:41:08', '106.61.2.8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775428558366113', '2016-03-12 11:44:45', '106.61.2.8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775438819105283', '2016-03-12 11:46:28', '106.61.2.8', 'web', '用户名或密码错误', '-1', '', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775439692817565', '2016-03-12 11:46:36', '106.61.2.8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775471621630301', '2016-03-12 11:51:56', '106.61.2.8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775477153339223', '2016-03-12 11:52:51', '106.61.2.8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145775535579594185', '2016-03-12 12:02:35', '106.61.2.8', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145784432264949246', '2016-03-13 12:45:22', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145787479120798754', '2016-03-13 21:13:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145804475194114708', '2016-03-15 20:25:51', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145806065695539076', '2016-03-16 00:50:56', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145822387147868463', '2016-03-17 22:11:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145847817540636627', '2016-03-20 20:49:35', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145848435360321480', '2016-03-20 22:32:33', '192.168.9.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145870815296315830', '2016-03-23 12:42:32', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145870825084866991', '2016-03-23 12:44:10', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145953929315341443', '2016-04-02 03:34:53', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145955997666962615', '2016-04-02 09:19:36', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145956733808917178', '2016-04-02 11:22:18', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145957731386742601', '2016-04-02 14:08:33', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145972635748920482', '2016-04-04 07:32:37', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145991376657401024', '2016-04-06 11:36:06', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145991431679217846', '2016-04-06 11:45:16', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145992275488709747', '2016-04-06 14:05:54', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145992292203974819', '2016-04-06 14:08:42', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145992808215386244', '2016-04-06 15:34:42', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145992825682730056', '2016-04-06 15:37:36', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145992849482537411', '2016-04-06 15:41:34', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145992909031134567', '2016-04-06 15:51:30', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145993102358352046', '2016-04-06 16:23:43', '2002:c000:20a:0:0:0:c000:20a', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145994356074569792', '2016-04-06 19:52:40', 'fe80:0:0:0:1c2b:21a1:c259:677e', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('145994839506316763', '2016-04-06 21:13:15', 'fe80:0:0:0:1c2b:21a1:c259:677e', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146020340024955141', '2016-04-09 20:03:20', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146020394306684280', '2016-04-09 20:12:23', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146021130355392931', '2016-04-09 22:15:03', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146021132656163340', '2016-04-09 22:15:26', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146021139511302671', '2016-04-09 22:16:35', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146021151563058522', '2016-04-09 22:18:35', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146021179100385907', '2016-04-09 22:23:11', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146021188448910656', '2016-04-09 22:24:44', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146044398285207405', '2016-04-12 14:53:02', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146044802554871860', '2016-04-12 16:00:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146055056887418892', '2016-04-13 20:29:28', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146060385541634643', '2016-04-14 11:17:35', '192.0.2.3', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146064127974817220', '2016-04-14 21:41:19', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146064256936168016', '2016-04-14 22:02:49', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146069064429108903', '2016-04-15 11:24:04', '2002:c000:205:0:0:0:c000:205', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146069157568378304', '2016-04-15 11:39:35', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088093284740703', '2016-04-17 16:15:32', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088307794889735', '2016-04-17 16:51:17', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088319500645141', '2016-04-17 16:53:15', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088363414743765', '2016-04-17 17:00:34', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088383695054149', '2016-04-17 17:03:56', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088390743461395', '2016-04-17 17:05:07', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088403175358651', '2016-04-17 17:07:11', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088409299200451', '2016-04-17 17:08:12', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088428646280671', '2016-04-17 17:11:26', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088440421246060', '2016-04-17 17:13:24', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户名或密码错误', '-1', '', 'cuiligang');
INSERT INTO `t_n_login_log` VALUES ('146088440812413372', '2016-04-17 17:13:28', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146088473049881177', '2016-04-17 17:18:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146142025073220814', '2016-04-23 22:04:10', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146142701012076636', '2016-04-23 23:56:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146143098898540112', '2016-04-24 01:03:08', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146143373681864544', '2016-04-24 01:48:56', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146143817023863861', '2016-04-24 03:02:50', 'fe80:0:0:0:24b5:7e1c:4e80:5555', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146145795978574342', '2016-04-24 08:32:39', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146146351691607526', '2016-04-24 10:05:16', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146146575562721648', '2016-04-24 10:42:35', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147214521048016', '2016-04-24 12:29:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147285051777790', '2016-04-24 12:40:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147301399972314', '2016-04-24 12:43:33', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147305486375392', '2016-04-24 12:44:14', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户名或密码错误', '-1', '', 'std1');
INSERT INTO `t_n_login_log` VALUES ('146147306586723114', '2016-04-24 12:44:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147312514370421', '2016-04-24 12:45:25', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U146147311664138629', 'stu3');
INSERT INTO `t_n_login_log` VALUES ('146147319014147288', '2016-04-24 12:46:30', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147327663885025', '2016-04-24 12:47:56', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U146147311664138629', 'stu3');
INSERT INTO `t_n_login_log` VALUES ('146147351929887572', '2016-04-24 12:51:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147388705126000', '2016-04-24 12:58:07', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147422686770530', '2016-04-24 13:03:46', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146147514525112516', '2016-04-24 13:19:05', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146168039048251475', '2016-04-26 22:19:50', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146228057198818949', '2016-05-03 21:02:51', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146228521691561178', '2016-05-03 22:20:16', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146228736857991380', '2016-05-03 22:56:08', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146229155511044671', '2016-05-04 00:05:55', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146241801084068124', '2016-05-05 11:13:30', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146270498189277799', '2016-05-08 18:56:21', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146271437484800193', '2016-05-08 21:32:54', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146271654132330441', '2016-05-08 22:09:01', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146272289959579426', '2016-05-08 23:54:59', 'fe80:0:0:0:b43d:9ab4:fda0:8970', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146556475631271136', '2016-06-10 21:19:16', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146556493726971972', '2016-06-10 21:22:17', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146556501318830496', '2016-06-10 21:23:33', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146556582478764873', '2016-06-10 21:37:04', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146556909921907944', '2016-06-10 22:31:39', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146556955030112839', '2016-06-10 22:39:10', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146556967662293498', '2016-06-10 22:41:16', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146557733335829333', '2016-06-11 00:48:53', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146558217972781303', '2016-06-11 02:09:39', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146558293716007483', '2016-06-11 02:22:17', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146558298972236012', '2016-06-11 02:23:09', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146558434386370665', '2016-06-11 02:45:43', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146563028205649959', '2016-06-11 15:31:22', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146563052597044110', '2016-06-11 15:35:25', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146563205408368438', '2016-06-11 16:00:54', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户名或密码错误', '-1', '', 'cuiligang');
INSERT INTO `t_n_login_log` VALUES ('146563206033448879', '2016-06-11 16:01:00', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146617942917828475', '2016-06-18 00:03:49', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146622866475094818', '2016-06-18 13:44:24', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146633866172203698', '2016-06-19 20:17:41', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146635448827471831', '2016-06-20 00:41:28', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146643015812685863', '2016-06-20 21:42:38', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146655836290392374', '2016-06-22 09:19:22', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146655890123933228', '2016-06-22 09:28:21', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146656258517774946', '2016-06-22 10:29:45', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146664617211056972', '2016-06-23 09:42:52', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146668489081601685', '2016-06-23 20:28:10', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146669080276509320', '2016-06-23 22:06:42', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146669372348946605', '2016-06-23 22:55:23', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146669409662215745', '2016-06-23 23:01:36', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146669468036315642', '2016-06-23 23:11:20', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146669502845201889', '2016-06-23 23:17:08', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146669774678352137', '2016-06-24 00:02:26', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146669822980911119', '2016-06-24 00:10:29', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146694800367182164', '2016-06-26 21:33:23', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146695659466050283', '2016-06-26 23:56:34', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146695747683514237', '2016-06-27 00:11:16', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146695818661174430', '2016-06-27 00:23:06', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146698996536561368', '2016-06-27 09:12:45', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146699196013822349', '2016-06-27 09:46:00', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146699251738383068', '2016-06-27 09:55:17', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146699389369554545', '2016-06-27 10:18:13', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146699788801140973', '2016-06-27 11:24:48', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146710183327057136', '2016-06-28 16:17:13', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146710193628352160', '2016-06-28 16:18:56', '61.166.152.129', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146711979917318353', '2016-06-28 21:16:39', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712194460473078', '2016-06-28 21:52:24', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712254465012845', '2016-06-28 22:02:24', '192.0.2.16', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712257620703821', '2016-06-28 22:02:56', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712312289458782', '2016-06-28 22:12:02', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712364365666135', '2016-06-28 22:20:43', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712392581210005', '2016-06-28 22:25:25', 'fe80:0:0:0:346d:1345:2122:313e', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712396062408720', '2016-06-28 22:26:00', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712398184176963', '2016-06-28 22:26:21', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712631681490923', '2016-06-28 23:05:16', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146712943392607670', '2016-06-28 23:57:13', 'fe80:0:0:0:9f2:2af9:4d01:fd96', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146717688802263101', '2016-06-29 13:08:08', 'fe80:0:0:0:995b:720f:a4ec:3ee6', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146725640753400097', '2016-06-30 11:13:27', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146729885334455153', '2016-06-30 23:00:53', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146729948597911133', '2016-06-30 23:11:25', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870061896333483', '2016-07-17 04:23:38', '0:0:0:0:0:0:0:1', 'web', '用户名或密码错误', '-1', '', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870062669479651', '2016-07-17 04:23:46', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870089407904973', '2016-07-17 04:28:14', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870093823744572', '2016-07-17 04:28:58', '127.0.0.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870113753924848', '2016-07-17 04:32:17', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870127479354360', '2016-07-17 04:34:34', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870145255870083', '2016-07-17 04:37:32', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870181906770484', '2016-07-17 04:43:39', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870329137033872', '2016-07-17 05:08:11', '127.0.0.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870359361084086', '2016-07-17 05:13:13', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870384692716410', '2016-07-17 05:17:26', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870394120393769', '2016-07-17 05:19:01', '127.0.0.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146870487917088482', '2016-07-17 05:34:39', '127.0.0.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146871965424171307', '2016-07-17 09:40:54', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146872246955273917', '2016-07-17 10:27:49', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146872360895736663', '2016-07-17 10:46:48', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146872373034972864', '2016-07-17 10:48:50', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146872403252933810', '2016-07-17 10:53:52', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146872714529986710', '2016-07-17 11:45:45', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146876397446186863', '2016-07-17 21:59:34', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146876453305668347', '2016-07-17 22:08:53', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146876471454046830', '2016-07-17 22:11:54', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146876486972143665', '2016-07-17 22:14:29', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146876520612024539', '2016-07-17 22:20:06', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146876536638143283', '2016-07-17 22:22:46', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146881278360680088', '2016-07-18 11:33:03', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146881327575103964', '2016-07-18 11:41:15', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146881349322114637', '2016-07-18 11:44:53', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882311257162739', '2016-07-18 14:25:12', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882313543094115', '2016-07-18 14:25:35', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146882316963777422', '2016-07-18 14:26:09', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882324060186618', '2016-07-18 14:27:20', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882426612894140', '2016-07-18 14:44:26', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882433415288729', '2016-07-18 14:45:34', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882441090707310', '2016-07-18 14:46:50', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882453291389327', '2016-07-18 14:48:52', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882458399494111', '2016-07-18 14:49:43', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882463568383620', '2016-07-18 14:50:35', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882467323113926', '2016-07-18 14:51:13', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882470535956610', '2016-07-18 14:51:45', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882477662229883', '2016-07-18 14:52:56', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882481945727875', '2016-07-18 14:53:39', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882493996506695', '2016-07-18 14:55:39', '127.0.0.1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146882495820948219', '2016-07-18 14:55:58', '127.0.0.1', 'web', '用户登录成功', '1', 'U146881326843757501', 'publicuser');
INSERT INTO `t_n_login_log` VALUES ('146882830338782324', '2016-07-18 15:51:43', '127.0.0.1', 'web', '用户名或密码错误', '-1', '', 'public1');
INSERT INTO `t_n_login_log` VALUES ('146882831766297683', '2016-07-18 15:51:57', '127.0.0.1', 'web', '用户名或密码错误', '-1', '', 'public1');
INSERT INTO `t_n_login_log` VALUES ('146882832373745460', '2016-07-18 15:52:03', '127.0.0.1', 'web', '用户名或密码错误', '-1', '', 'public1');
INSERT INTO `t_n_login_log` VALUES ('146882835631857100', '2016-07-18 15:52:36', '127.0.0.1', 'web', '用户名或密码错误', '-1', '', 'public1');
INSERT INTO `t_n_login_log` VALUES ('146882841756587520', '2016-07-18 15:53:37', '127.0.0.1', 'web', '用户名或密码错误', '-1', '', 'public1');
INSERT INTO `t_n_login_log` VALUES ('146882843681989151', '2016-07-18 15:53:56', '127.0.0.1', 'web', '用户名或密码错误', '-1', '', 'public1');
INSERT INTO `t_n_login_log` VALUES ('146882868637820182', '2016-07-18 15:58:06', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146882890488672749', '2016-07-18 16:01:44', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146882891439158440', '2016-07-18 16:01:54', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U140176000619665260', 'admin');
INSERT INTO `t_n_login_log` VALUES ('146882918720519612', '2016-07-18 16:06:27', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883241531008187', '2016-07-18 17:00:15', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883371172729914', '2016-07-18 17:21:51', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883435185911967', '2016-07-18 17:32:31', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883452073930328', '2016-07-18 17:35:20', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883454039963900', '2016-07-18 17:35:40', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883455263730327', '2016-07-18 17:35:52', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883503091362630', '2016-07-18 17:43:50', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883503744729429', '2016-07-18 17:43:57', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883508132310190', '2016-07-18 17:44:41', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883547660056402', '2016-07-18 17:51:16', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883552404014947', '2016-07-18 17:52:04', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883559272941327', '2016-07-18 17:53:12', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883578684508133', '2016-07-18 17:56:26', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883594012522027', '2016-07-18 17:59:00', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883594893612467', '2016-07-18 17:59:08', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883597755203087', '2016-07-18 17:59:37', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883611580576912', '2016-07-18 18:01:55', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883612093835358', '2016-07-18 18:02:00', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883655118770622', '2016-07-18 18:09:11', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883655837546322', '2016-07-18 18:09:18', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883662468991509', '2016-07-18 18:10:24', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883702260607636', '2016-07-18 18:17:02', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883703069191815', '2016-07-18 18:17:10', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883798408521360', '2016-07-18 18:33:04', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883798880131806', '2016-07-18 18:33:08', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883799115455703', '2016-07-18 18:33:11', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883799244837855', '2016-07-18 18:33:12', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883799336482539', '2016-07-18 18:33:13', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883799803279745', '2016-07-18 18:33:18', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883809706378384', '2016-07-18 18:34:57', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883810122869299', '2016-07-18 18:35:01', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883810237704808', '2016-07-18 18:35:02', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883810292341783', '2016-07-18 18:35:02', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883810334587940', '2016-07-18 18:35:03', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883810431100717', '2016-07-18 18:35:04', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883810511082611', '2016-07-18 18:35:05', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883810595496132', '2016-07-18 18:35:05', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883810691548982', '2016-07-18 18:35:06', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883944684688664', '2016-07-18 18:57:26', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146882867205821359', 'public3');
INSERT INTO `t_n_login_log` VALUES ('146883947928778756', '2016-07-18 18:57:59', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146883943486039507', 'public4');
INSERT INTO `t_n_login_log` VALUES ('146884237578247644', '2016-07-18 19:46:15', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146883943486039507', 'public4');
INSERT INTO `t_n_login_log` VALUES ('146884253938597916', '2016-07-18 19:48:59', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146883943486039507', 'public4');
INSERT INTO `t_n_login_log` VALUES ('146884254596847357', '2016-07-18 19:49:05', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146883943486039507', 'public4');
INSERT INTO `t_n_login_log` VALUES ('146884254944139631', '2016-07-18 19:49:09', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146883943486039507', 'public4');
INSERT INTO `t_n_login_log` VALUES ('146884259919636978', '2016-07-18 19:49:59', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146883943486039507', 'public4');
INSERT INTO `t_n_login_log` VALUES ('146884266396771337', '2016-07-18 19:51:03', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146883943486039507', 'public4');
INSERT INTO `t_n_login_log` VALUES ('146884267590289099', '2016-07-18 19:51:15', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146883943486039507', 'public4');
INSERT INTO `t_n_login_log` VALUES ('146884424755298359', '2016-07-18 20:17:27', '0:0:0:0:0:0:0:1', 'web', '用户名或密码错误', '-1', '', 'public5');
INSERT INTO `t_n_login_log` VALUES ('146884431628950269', '2016-07-18 20:18:36', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884431609200769', 'public5');
INSERT INTO `t_n_login_log` VALUES ('146884434090177046', '2016-07-18 20:19:00', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884431609200769', 'public5');
INSERT INTO `t_n_login_log` VALUES ('146884452449689848', '2016-07-18 20:22:04', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884431609200769', 'public5');
INSERT INTO `t_n_login_log` VALUES ('146884461153489210', '2016-07-18 20:23:31', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884431609200769', 'public5');
INSERT INTO `t_n_login_log` VALUES ('146884466650567952', '2016-07-18 20:24:26', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884431609200769', 'public5');
INSERT INTO `t_n_login_log` VALUES ('146884526829387962', '2016-07-18 20:34:28', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884526817847927', 'public6');
INSERT INTO `t_n_login_log` VALUES ('146884557795504753', '2016-07-18 20:39:37', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884557785509913', 'public7');
INSERT INTO `t_n_login_log` VALUES ('146884564272451511', '2016-07-18 20:40:42', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884557785509913', 'public7');
INSERT INTO `t_n_login_log` VALUES ('146884564579549142', '2016-07-18 20:40:45', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884557785509913', 'public7');
INSERT INTO `t_n_login_log` VALUES ('146884567451201302', '2016-07-18 20:41:14', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884567436175554', 'public8');
INSERT INTO `t_n_login_log` VALUES ('146884631236526446', '2016-07-18 20:51:52', '0:0:0:0:0:0:0:1', 'web', '用户名或密码错误', '-1', '', 'admin10');
INSERT INTO `t_n_login_log` VALUES ('146884649483987753', '2016-07-18 20:54:54', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884649469492608', 'pubusr1');
INSERT INTO `t_n_login_log` VALUES ('146884652095705985', '2016-07-18 20:55:20', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884649469492608', 'pubusr1');
INSERT INTO `t_n_login_log` VALUES ('146884653528656827', '2016-07-18 20:55:35', '0:0:0:0:0:0:0:1', 'web', '用户登录成功', '1', 'U146884649469492608', 'pubusr1');
INSERT INTO `t_n_login_log` VALUES ('146884674103049604', '2016-07-18 20:59:01', '0:0:0:0:0:0:0:1', 'web', '用户名或密码错误', '-1', '', 'admin10');
INSERT INTO `t_n_login_log` VALUES ('146884675558465790', '2016-07-18 20:59:15', '0:0:0:0:0:0:0:1', 'web', '用户名或密码错误', '-1', '', 'admin10');
INSERT INTO `t_n_login_log` VALUES ('146884758644651043', '2016-07-18 21:13:06', '0:0:0:0:0:0:0:1', 'web', '用户名或密码错误', '-1', '', 'public40');
INSERT INTO `t_n_login_log` VALUES ('146884774165921740', '2016-07-18 21:15:41', '0:0:0:0:0:0:0:1', 'web', '用户名或密码错误', '-1', '', 'public41');
INSERT INTO `t_n_login_log` VALUES ('146884821880232627', '2016-07-18 21:23:38', '0:0:0:0:0:0:0:1', 'web', '用户名或密码错误', '-1', '', 'plicuser');

-- ----------------------------
-- Table structure for t_n_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_n_menu`;
CREATE TABLE `t_n_menu` (
  `id` varchar(32) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `menu_name` varchar(64) DEFAULT NULL,
  `parent_id` varchar(32) NOT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `menu_type` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_n_menu
-- ----------------------------
INSERT INTO `t_n_menu` VALUES ('M140176000803374567', '1', '系统管理', '0', '10', '1', 'system', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M140176000818673982', '2', '菜单管理', 'M140176000803374567', '2', '1', 'showPage/menu_list', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M140176040904503673', '2', '权限管理', 'M140176000803374567', '1', '1', 'showPage/role_list', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M140176079018269146', '2', '本地角色管理', 'M140176040904503673', '1', '1', 'showPage/role_list', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M140176103998453060', '3', '组织机构管理', 'M140176040904503673', '2', '1', 'showPage/org_list', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M140176133468823709', '4', '用户管理', 'M140176040904503673', '3', '1', 'user', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M140176146066377305', '2', '数据字典管理', 'M140176000803374567', '3', '1', 'showPage/dict_list', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M140444051720061522', '3', '公共角色管理', 'M140176040904503673', '1', '1', 'showPage/roleCom_list', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M141006628690009172', '1', '个人中心', '0', '1', '1', 'index/个人中心', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M141006637490117545', '1', '基础知识维护', '0', '2', '1', 'index/基础知识维护', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406195900163064', '1', '装备知识维护', '0', '3', '1', 'index/装备知识维护', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406198373451421', '1', '考试系统维护', '0', '4', '1', 'index/考试系统维护', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406202674215104', '1', '仿真系统', '0', '5', '1', 'index/仿真系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406266205620364', '2', '考试记录', 'M141006628690009172', '2', '1', 'exam/myExamHis', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406269387486060', '3', '考试记录', 'M144406266205620364', '2', '1', 'exam/myExamHis', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406285413154511', '2', '试题管理', 'M144406198373451421', '1', '1', 'index/考试题管理', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406287001810534', '2', '试卷管理', 'M144406198373451421', '2', '1', 'index/试卷管理', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406297361739480', '3', '新建试卷', 'M144406287001810534', '1', '1', 'exam/newPaper', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406299674984233', '3', '我的考卷', 'M144406287001810534', '2', '1', 'exam/myPaperList', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406301425130609', '3', '考生管理', 'M144406287001810534', '3', '1', 'examination/paperStudents', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406313559769763', '3', '批量试题录入', 'M144406285413154511', '2', '1', 'exam/questionImport', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406315360162945', '3', '我的试题', 'M144406285413154511', '3', '1', 'exam/myQuestions', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406331414986785', '2', '短波电台设备', 'M144406195900163064', '1', '1', 'public/fileManager?file=all&kl=dbdt&viewer=owner', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406332366133527', '2', '超短波电台设备', 'M144406195900163064', '2', '1', 'public/fileManager?file=all&kl=cdbdt&viewer=owner', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406335271953889', '2', '异频转接器', 'M144406195900163064', '3', '1', 'public/fileManager?file=all&kl=ypzj&viewer=owner', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406336418826843', '2', '无线图传', 'M144406195900163064', '4', '1', 'public/fileManager?file=all&kl=wxtc&viewer=owner', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406337418715899', '2', '动中通', 'M144406195900163064', '5', '1', 'public/fileManager?file=all&kl=dzj&viewer=owner', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406338476428759', '2', '卫星', 'M144406195900163064', '6', '1', 'public/fileManager?file=all&kl=satellite&viewer=owner', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406346583857003', '2', '短波电台', 'M144406202674215104', '1', '1', 'index/sourceListIndex', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406347638975028', '2', '超短波电台', 'M144406202674215104', '2', '1', 'index/sourceListIndex', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406349171442167', '2', '异频转接器', 'M144406202674215104', '3', '1', 'index/sourceListIndex', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406350249875963', '2', '无线图传', 'M144406202674215104', '4', '1', 'index/sourceListIndex', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406351523190544', '2', '动中通', 'M144406202674215104', '5', '1', 'index/sourceListIndex', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144406352740443407', '2', '卫星', 'M144406202674215104', '6', '1', 'index/sourceListIndex', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M144415416469293961', '2', '收藏资源', 'M141006628690009172', '5', '1', 'favorate/index', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M145051671304149201', '1', '资源中心', '0', '13', '0', 'index/sourceListIndex', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M145051710458340376', '2', '基础知识资源', 'M145051671304149201', '1', '1', 'index/基础知识资源', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M145051724152280809', '2', '装备知识资源', 'M145051671304149201', '2', '1', 'resource/resourceViewer?file=all&kl=cdbdt|dbdt|dzj|wxtc|ypzj|satellite&viewer=all', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069083920633083', '2', '第一篇、通信网基础知识', 'M141006637490117545', '1', '1', 'index/通信网基础知识', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069090177965131', '2', '第三篇、数据网', 'M141006637490117545', '2', '1', 'index/数据网', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069090947638187', '2', '第四篇、传输网', 'M141006637490117545', '3', '1', 'index/传输网', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069091540497657', '2', '第五篇、交换网', 'M141006637490117545', '4', '1', 'index/交换网', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069094172854229', '3', '第一章、职业道德', 'M146069083920633083', '1', '1', 'public/fileManager?file=all&kl=zydd&viewer=owner', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069095675222114', '3', '第二章、法律法规', 'M146069083920633083', '2', '1', 'index/法律法规', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069105025295200', '3', '第三章、电信业务概述', 'M146069083920633083', '3', '1', 'index/电信业务概述', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069107648991192', '3', '第十一章、数据网络基础', 'M146069090177965131', '1', '1', 'index/数据网络基础', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069109143766592', '3', '第十二章、DDN', 'M146069090177965131', '2', '1', 'index/DDN', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069110470766513', '3', '第十三章、帧中继', 'M146069090177965131', '3', '1', 'index/帧中继', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069111223612529', '3', '第十四章、ATM网络', 'M146069090177965131', '4', '1', 'index/ATM网络', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069112320860554', '3', '第十五章、TCP/IP协议', 'M146069090177965131', '5', '1', 'index/TCP/IP协议', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069113191671320', '3', '第十六章、IPv6', 'M146069090177965131', '6', '1', 'index/IPv6', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069114209626358', '3', '第十七章、数据网的性能指标', 'M146069090177965131', '7', '1', 'index/数据网的性能指标', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069115445181207', '3', '第十八章、SDH基础原理', 'M146069090947638187', '1', '1', 'index/SDH基础原理', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069116468948972', '3', '第十九章、DWDM基本原理', 'M146069090947638187', '2', '1', 'index/DWDM基本原理', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069116995690883', '3', '第二十章、MSTP', 'M146069090947638187', '3', '1', 'index/MSTP', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069117787576209', '3', '第二十一章、ASON', 'M146069090947638187', '4', '1', 'index/ASON', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069119260274581', '3', '第二十二章、蜂蜜移动通信系统', 'M146069091540497657', '5', '1', 'index/蜂蜜移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069123313781857', '3', '第二十三章、GSM数字移动通信系统', 'M146069091540497657', '6', '1', 'index/GSM数字移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069124643397134', '3', '第二十四章、CDMA2000移动通信系统', 'M146069091540497657', '7', '1', 'index/CDMA2000移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069125706511072', '3', '第二十五章、TD-SCDMA移动通信系统', 'M146069091540497657', '8', '1', 'index/TD-SCDMA移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069126789091435', '3', '第二十六章、WCDMA移动通信系统', 'M146069091540497657', '9', '1', 'index/WCDMA移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146069128114464859', '3', '第二十七章、下一代移动通信系统概述', 'M146069091540497657', '10', '1', 'index/下一代移动通信系统概述', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088286050832758', '3', '第一篇、通信网基础知识', 'M146088368701313714', '1', '1', 'index/第一篇、通信网基础知识', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088286853385995', '3', '第三篇、数据网', 'M146088368701313714', '2', '1', 'index/第三篇、数据网', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088287392314643', '3', '第四篇、传输网', 'M146088368701313714', '3', '1', 'index/第四篇、传输网', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088288043663835', '3', '第五篇、交换网', 'M146088368701313714', '4', '1', 'index/第五篇、交换网', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088290127608987', '4', '第一章、职业道德', 'M146088286050832758', '1', '1', 'resource/resourceViewer?file=all&kl=zydd&viewer=all', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088291182117836', '4', '第二章、法律法规', 'M146088286050832758', '2', '1', 'index/第二章、法律法规', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088291790865341', '4', '第三章、电信业务概述', 'M146088286050832758', '3', '1', 'index/第三章、电信业务概述', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088293008349672', '4', '第十一章、数据网络基础', 'M146088286853385995', '1', '1', 'index/第十一章、数据网络基础', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088293626638737', '4', '第十二章、DDN', 'M146088286853385995', '2', '1', 'index/第十二章、DDN', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088294291836845', '4', '第十三章、帧中继', 'M146088286853385995', '3', '1', 'index/第十三章、帧中继', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088295236505082', '4', '第十四章、ATM网络', 'M146088286853385995', '4', '1', 'index/第十四章、ATM网络', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088295791156419', '4', '第十五章、TCP/IP协议', 'M146088286853385995', '5', '1', 'index/第十五章、TCP/IP协议', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088296532010385', '4', '第十六章、IPv6', 'M146088286853385995', '6', '1', 'index/第十六章、IPv6', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088297108888435', '4', '第十七章、数据网的性能指标', 'M146088286853385995', '7', '1', 'index/第十七章、数据网的性能指标', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088298481596532', '4', '第十八章、SDH基础原理', 'M146088287392314643', '1', '1', 'index/第十八章、SDH基础原理', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088299095201146', '4', '第十九章、DWDM基本原理', 'M146088287392314643', '2', '1', 'index/第十九章、DWDM基本原理', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088299784897535', '4', '第二十章、MSTP', 'M146088287392314643', '3', '1', 'index/第二十章、MSTP', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088300476007224', '4', '第二十一章、ASON', 'M146088287392314643', '4', '1', 'index/第二十一章、ASON', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088301430475918', '4', '第二十二章、蜂蜜移动通信系统', 'M146088288043663835', '1', '1', 'index/第二十二章、蜂蜜移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088302045811479', '4', '第二十三章、GSM数字移动通信系统', 'M146088288043663835', '2', '1', 'index/第二十三章、GSM数字移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088302526211375', '4', '第二十四章、CDMA2000移动通信系统', 'M146088288043663835', '3', '1', 'index/第二十四章、CDMA2000移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088303140255333', '4', '第二十五章、TD-SCDMA移动通信系统', 'M146088288043663835', '4', '1', 'index/第二十五章、TD-SCDMA移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088303673290850', '4', '第二十六章、WCDMA移动通信系统', 'M146088288043663835', '5', '1', 'index/第二十六章、WCDMA移动通信系统', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088304377363862', '4', '第二十七章、下一代移动通信系统概述', 'M146088288043663835', '6', '1', 'index/第二十七章、下一代移动通信系统概述', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088357366927823', '1', '资源中心', '0', '0', '1', 'index/资源中心', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088368701313714', '2', '基础知识资源', 'M146088357366927823', '5', '1', 'index/基础知识资源', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146088370736869163', '2', '装备知识资源', 'M146088357366927823', '6', '1', 'resource/resourceViewer?file=all&kl=cdbdt|dbdt|dzj|wxtc|ypzj|satellite&viewer=all', 'b_menu');
INSERT INTO `t_n_menu` VALUES ('M146881310092346523', '1', '公众网首页', '0', '14', '1', 'portal', 'b_menu');

-- ----------------------------
-- Table structure for t_n_org
-- ----------------------------
DROP TABLE IF EXISTS `t_n_org`;
CREATE TABLE `t_n_org` (
  `id` varchar(32) NOT NULL,
  `org_code` varchar(32) DEFAULT NULL,
  `org_contact` varchar(64) DEFAULT NULL,
  `org_level` int(11) DEFAULT NULL,
  `org_name` varchar(64) DEFAULT NULL,
  `org_seq` varchar(512) DEFAULT NULL,
  `org_tel` varchar(32) DEFAULT NULL,
  `parent_id` varchar(32) NOT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `org_seq_name` varchar(256) DEFAULT NULL,
  `is_extend` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_n_org
-- ----------------------------
INSERT INTO `t_n_org` VALUES ('1', '1000', 'asd', '1', 'XXX部队', '0.1', '1', '0', '1', 'org', 'XXX部队', 'true');
INSERT INTO `t_n_org` VALUES ('org141006703765177860', 'wxd', '1', '2', '理论知识教学部', '0.1.org141006703765177860', '1', '1', '1', 'department', 'XXX部队>>理论知识教学部', 'true');
INSERT INTO `t_n_org` VALUES ('org145009728462179485', '1000_01', '首长', '2', '装备知识教学部', '0.1.org145009728462179485', '133', '1', '1', 'department', 'XXX部队>>装备知识教学部', 'false');
INSERT INTO `t_n_org` VALUES ('org145009743921113084', '1000_02', '学员', '2', '学员', '0.1.org145009743921113084', '133', '1', '2', 'department', 'XXX部队>>学员', 'false');
INSERT INTO `t_n_org` VALUES ('org145009753722921494', '1000_03', '考试管理', '2', '考试管理', '0.1.org145009753722921494', '133', '1', '3', 'department', 'XXX部队>>考试管理', 'false');
INSERT INTO `t_n_org` VALUES ('org146147398641731598', 'XX总队', '11', '2', 'XX总队', '0.1.org146147398641731598', '11', '1', '1', 'org', 'XXX部队>>XX总队', 'true');
INSERT INTO `t_n_org` VALUES ('org146147401177009172', 'XX支队', '11', '3', 'XX支队', '0.1.org146147398641731598.org146147401177009172', '11', 'org146147398641731598', '1', 'org', 'XX总队>>XX支队', 'true');
INSERT INTO `t_n_org` VALUES ('org146147403338633147', 'XX大队', '11', '4', 'XX大队', '0.1.org146147398641731598.org146147401177009172.org146147403338633147', '11', 'org146147401177009172', '1', 'org', 'XX支队>>XX大队', 'true');
INSERT INTO `t_n_org` VALUES ('org146147405074290572', '基层单位', '1', '5', '基层单位', '0.1.org146147398641731598.org146147401177009172.org146147403338633147.org146147405074290572', '1', 'org146147403338633147', '1', 'org', 'XX大队>>基层单位', 'true');
INSERT INTO `t_n_org` VALUES ('org146881316216366940', 'None', '133', '2', '公众网', '0.1.org146881316216366940', '13308800013', '1', '2', 'org', 'XXX部队>>公众网', 'true');

-- ----------------------------
-- Table structure for t_n_permit
-- ----------------------------
DROP TABLE IF EXISTS `t_n_permit`;
CREATE TABLE `t_n_permit` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `menu_id` varchar(32) DEFAULT NULL,
  `permit_val` varchar(64) DEFAULT NULL,
  `permit_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_n_permit
-- ----------------------------

-- ----------------------------
-- Table structure for t_n_role
-- ----------------------------
DROP TABLE IF EXISTS `t_n_role`;
CREATE TABLE `t_n_role` (
  `id` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `org_id` varchar(32) DEFAULT NULL,
  `role_des` varchar(1024) DEFAULT NULL,
  `role_name` varchar(128) DEFAULT NULL,
  `role_type` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_n_role
-- ----------------------------
INSERT INTO `t_n_role` VALUES ('ROLE140176000792987194', null, 'admin', '0', '系统超级管理员角色', '超级管理员角色', 'base');
INSERT INTO `t_n_role` VALUES ('ROLE141006730160700652', '2014-09-07 13:21:42', '超级管理员', '1', '具备维护系统人员、权限、数据字典等信息', '系统管理', 'base');
INSERT INTO `t_n_role` VALUES ('ROLE141171556165393734', '2014-09-26 15:12:41', 'Manager', null, '进行用户数据字典', '后台管理', 'common');
INSERT INTO `t_n_role` VALUES ('ROLE144522301761659074', '2015-10-19 10:50:17', '超级管理员', null, '教员', '教员', 'common');
INSERT INTO `t_n_role` VALUES ('ROLE144522321875038417', '2015-10-19 10:53:38', '超级管理员', 'org141006703765177860', '理论知识教员', '理论知识教员', 'base');
INSERT INTO `t_n_role` VALUES ('ROLE145009735598663232', '2015-12-14 20:49:15', '超级管理员', 'org145009728462179485', '装备知识', '装备知识教员', 'base');
INSERT INTO `t_n_role` VALUES ('ROLE145009749723012955', '2015-12-14 20:51:37', '超级管理员', 'org145009743921113084', '在籍学员', '学员', 'base');
INSERT INTO `t_n_role` VALUES ('ROLE145009758542736371', '2015-12-14 20:53:05', '超级管理员', 'org145009753722921494', '考试管理', '教务管理', 'base');
INSERT INTO `t_n_role` VALUES ('ROLE145093416064454227', '2015-12-24 13:16:00', '超级管理员', '1', '超级管理员', '超级管理员', 'base');
INSERT INTO `t_n_role` VALUES ('ROLE146881311960340530', '2016-07-18 11:38:39', '超级管理员', null, '公众用户', '公众用户', 'common');
INSERT INTO `t_n_role` VALUES ('ROLE146881324287753023', '2016-07-18 11:40:42', '超级管理员', 'org146881316216366940', 'public-user', '公众用户', 'base');

-- ----------------------------
-- Table structure for t_n_role_link
-- ----------------------------
DROP TABLE IF EXISTS `t_n_role_link`;
CREATE TABLE `t_n_role_link` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `parent_role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_n_role_link
-- ----------------------------
INSERT INTO `t_n_role_link` VALUES ('ROLE140533788573435774', 'ROLE140533788523934192', 'ROLE140533778921561933');
INSERT INTO `t_n_role_link` VALUES ('ROLE145092781508798605', 'ROLE144522321875038417', 'ROLE144522301761659074');
INSERT INTO `t_n_role_link` VALUES ('ROLE145093416068255010', 'ROLE145093416064454227', 'ROLE144522301761659074');
INSERT INTO `t_n_role_link` VALUES ('ROLE145093416068278902', 'ROLE145093416064454227', 'ROLE141171556165393734');
INSERT INTO `t_n_role_link` VALUES ('ROLE146881324294758062', 'ROLE146881324287753023', 'ROLE146881311960340530');

-- ----------------------------
-- Table structure for t_n_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_n_role_menu`;
CREATE TABLE `t_n_role_menu` (
  `id` varchar(32) NOT NULL,
  `menu_id` varchar(32) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_n_role_menu
-- ----------------------------
INSERT INTO `t_n_role_menu` VALUES ('140176000807452879', 'M140176000803374567', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140176000822017894', 'M140176000818673982', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140176040920766353', 'M140176040904503673', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140176079025801537', 'M140176079018269146', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140176104002050847', 'M140176103998453060', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140176133482294338', 'M140176133468823709', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140176146070283675', 'M140176146066377305', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140186144922901078', 'M140186144857960838', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140186157944893902', 'M140186157940957046', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140193291483054081', 'M140193291472877608', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140193422653553088', 'M140193422640271165', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140193426917559049', 'M140193426914302669', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140193430832179886', 'M140193430828230054', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140195161115903755', 'M140195161095464071', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140195327360567607', 'M140195327353173024', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140202128139123259', 'M140202128115694314', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140229908717102381', 'M140229908708646781', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140229928596199344', 'M140229928589758263', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140229934157633457', 'M140229934151445394', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140229992346963691', 'M140229992339845830', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140229996816364613', 'M140229996753658673', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140230012823237712', 'M140230012814077922', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140230021893687987', 'M140230021889002903', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140238285130072090', 'M140238285102118793', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140238291344553186', 'M140238291338960122', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140314765190114539', 'M140314765132322586', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140351652454984574', 'M140351652446683713', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140444051739568542', 'M140444051720061522', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140533996544439224', 'M140533996539766282', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140533998183141109', 'M140533998180454870', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140534002146410584', 'M140534002142142398', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140534003562441659', 'M140534003559132068', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140534005166002801', 'M140534005162685408', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140534006933851681', 'M140534006931520039', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140534008918825415', 'M140534008915560554', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140534011226301367', 'M140534011223301606', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140599687189120584', 'M140599687163764401', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140601067768235572', 'M140601067743497300', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140602363399210186', 'M140602363396385706', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('140602369463617299', 'M140602369460908685', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('141006628696130511', 'M141006628690009172', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('141006637490771476', 'M141006637490117545', 'ROLE140176000792987194');
INSERT INTO `t_n_role_menu` VALUES ('144660642092829559', 'M144660642083043739', 'ROLE141006669883398835');
INSERT INTO `t_n_role_menu` VALUES ('144660642092853488', 'M144660642083043739', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('144660642092865238', 'M144660642083043739', 'ROLE141006682098890679');
INSERT INTO `t_n_role_menu` VALUES ('144660642092872914', 'M144660642083043739', 'ROLE141006682098890679');
INSERT INTO `t_n_role_menu` VALUES ('144660642092880613', 'M144660642083043739', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('144660642092977990', 'M144660642083043739', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('144660642092981946', 'M144660642083043739', 'ROLE141006669883398835');
INSERT INTO `t_n_role_menu` VALUES ('144660642092991922', 'M144660642083043739', 'ROLE141006682098890679');
INSERT INTO `t_n_role_menu` VALUES ('144660642093012523', 'M144660642083043739', 'ROLE141006682098890679');
INSERT INTO `t_n_role_menu` VALUES ('144660642093041817', 'M144660642083043739', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('144660642093081405', 'M144660642083043739', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('144660642093082780', 'M144660642083043739', 'ROLE141006669883398835');
INSERT INTO `t_n_role_menu` VALUES ('144660642093084690', 'M144660642083043739', 'ROLE141006669883398835');
INSERT INTO `t_n_role_menu` VALUES ('144660642093103348', 'M144660642083043739', 'ROLE141006669883398835');
INSERT INTO `t_n_role_menu` VALUES ('144660642093114736', 'M144660642083043739', 'ROLE141006682098890679');
INSERT INTO `t_n_role_menu` VALUES ('144660642093219480', 'M144660642083043739', 'ROLE141006669883398835');
INSERT INTO `t_n_role_menu` VALUES ('144660642093239790', 'M144660642083043739', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('144660642093250275', 'M144660642083043739', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('144660642093259560', 'M144660642083043739', 'ROLE141006682098890679');
INSERT INTO `t_n_role_menu` VALUES ('144660642093302492', 'M144660642083043739', 'ROLE141006682098890679');
INSERT INTO `t_n_role_menu` VALUES ('144660642093308075', 'M144660642083043739', 'ROLE141006669883398835');
INSERT INTO `t_n_role_menu` VALUES ('144660642093340861', 'M144660642083043739', 'ROLE141006669883398835');
INSERT INTO `t_n_role_menu` VALUES ('144660642093382106', 'M144660642083043739', 'ROLE141006682098890679');
INSERT INTO `t_n_role_menu` VALUES ('144660642093395247', 'M144660642083043739', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051671310702596', 'M145051671304149201', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051671310733815', 'M145051671304149201', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051671310741930', 'M145051671304149201', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051671310743117', 'M145051671304149201', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051710464208292', 'M145051710458340376', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051710464324709', 'M145051710458340376', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051710464345324', 'M145051710458340376', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051710464398980', 'M145051710458340376', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051724159161223', 'M145051724152280809', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051724159229768', 'M145051724152280809', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051724159254228', 'M145051724152280809', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('145051724159287654', 'M145051724152280809', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069083926820441', 'M146069083920633083', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069083926846270', 'M146069083920633083', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069083926857491', 'M146069083920633083', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069083926881287', 'M146069083920633083', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069083926882751', 'M146069083920633083', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069083926908559', 'M146069083920633083', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069083926962273', 'M146069083920633083', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069083926980069', 'M146069083920633083', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069083926989657', 'M146069083920633083', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090183680861', 'M146069090177965131', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069090183700630', 'M146069090177965131', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069090183723971', 'M146069090177965131', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090183740541', 'M146069090177965131', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090183801654', 'M146069090177965131', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069090183821808', 'M146069090177965131', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069090183843176', 'M146069090177965131', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090183865563', 'M146069090177965131', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090183974185', 'M146069090177965131', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069090952919474', 'M146069090947638187', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069090952925451', 'M146069090947638187', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069090952948226', 'M146069090947638187', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090952989550', 'M146069090947638187', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090953042337', 'M146069090947638187', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069090953065855', 'M146069090947638187', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090953067195', 'M146069090947638187', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069090953090711', 'M146069090947638187', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069090953108709', 'M146069090947638187', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069091544606937', 'M146069091540497657', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069091544612088', 'M146069091540497657', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069091544612682', 'M146069091540497657', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069091544665306', 'M146069091540497657', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069091544676405', 'M146069091540497657', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069091544680959', 'M146069091540497657', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069091544703493', 'M146069091540497657', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069091544723413', 'M146069091540497657', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069091544785472', 'M146069091540497657', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069094178289291', 'M146069094172854229', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069094178384954', 'M146069094172854229', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069094178390938', 'M146069094172854229', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069094178450435', 'M146069094172854229', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069094178515148', 'M146069094172854229', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069094178516975', 'M146069094172854229', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069094178604619', 'M146069094172854229', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069094178619539', 'M146069094172854229', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069094178627447', 'M146069094172854229', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069095681041370', 'M146069095675222114', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069095681054737', 'M146069095675222114', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069095681056459', 'M146069095675222114', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069095681072927', 'M146069095675222114', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069095681114028', 'M146069095675222114', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069095681120926', 'M146069095675222114', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069095681150398', 'M146069095675222114', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069095681170540', 'M146069095675222114', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069095681176745', 'M146069095675222114', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069105030638763', 'M146069105025295200', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069105030684276', 'M146069105025295200', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069105030711251', 'M146069105025295200', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069105030720370', 'M146069105025295200', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069105030722053', 'M146069105025295200', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069105030729872', 'M146069105025295200', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069105030730953', 'M146069105025295200', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069105030735949', 'M146069105025295200', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069105030755545', 'M146069105025295200', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069107655063152', 'M146069107648991192', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069107655079902', 'M146069107648991192', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069107655114825', 'M146069107648991192', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069107655146969', 'M146069107648991192', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069107655164407', 'M146069107648991192', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069107655192613', 'M146069107648991192', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069107655195072', 'M146069107648991192', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069107655212405', 'M146069107648991192', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069107655242741', 'M146069107648991192', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069109148700359', 'M146069109143766592', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069109148729789', 'M146069109143766592', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069109148772158', 'M146069109143766592', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069109148775571', 'M146069109143766592', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069109148811919', 'M146069109143766592', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069109148838869', 'M146069109143766592', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069109148850559', 'M146069109143766592', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069109148865196', 'M146069109143766592', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069109148882298', 'M146069109143766592', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069110475205975', 'M146069110470766513', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069110475219978', 'M146069110470766513', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069110475222702', 'M146069110470766513', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069110475226487', 'M146069110470766513', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069110475241544', 'M146069110470766513', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069110475266223', 'M146069110470766513', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069110475268466', 'M146069110470766513', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069110475276364', 'M146069110470766513', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069110475326237', 'M146069110470766513', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069111228455152', 'M146069111223612529', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069111228500562', 'M146069111223612529', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069111228506200', 'M146069111223612529', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069111228549877', 'M146069111223612529', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069111228552375', 'M146069111223612529', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069111228577326', 'M146069111223612529', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069111228589102', 'M146069111223612529', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069111228592573', 'M146069111223612529', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069111228685753', 'M146069111223612529', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069112326046720', 'M146069112320860554', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069112326067096', 'M146069112320860554', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069112326076346', 'M146069112320860554', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069112326105842', 'M146069112320860554', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069112326162602', 'M146069112320860554', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069112326175812', 'M146069112320860554', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069112326194566', 'M146069112320860554', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069112326195001', 'M146069112320860554', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069112326198736', 'M146069112320860554', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069113196259241', 'M146069113191671320', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069113196292193', 'M146069113191671320', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069113196310003', 'M146069113191671320', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069113196347006', 'M146069113191671320', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069113196348015', 'M146069113191671320', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069113196351685', 'M146069113191671320', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069113196367427', 'M146069113191671320', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069113196386957', 'M146069113191671320', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069113196387426', 'M146069113191671320', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069114213814912', 'M146069114209626358', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069114213842188', 'M146069114209626358', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069114213913189', 'M146069114209626358', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069114213913872', 'M146069114209626358', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069114213917234', 'M146069114209626358', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069114213920411', 'M146069114209626358', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069114213963599', 'M146069114209626358', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069114213982498', 'M146069114209626358', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069114213991667', 'M146069114209626358', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069115450416391', 'M146069115445181207', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069115450416954', 'M146069115445181207', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069115450469685', 'M146069115445181207', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069115450514193', 'M146069115445181207', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069115450559940', 'M146069115445181207', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069115450564393', 'M146069115445181207', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069115450573317', 'M146069115445181207', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069115450581367', 'M146069115445181207', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069115450593337', 'M146069115445181207', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069116474610165', 'M146069116468948972', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069116474616559', 'M146069116468948972', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069116474631814', 'M146069116468948972', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069116474700960', 'M146069116468948972', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069116474707101', 'M146069116468948972', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069116474707807', 'M146069116468948972', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069116474724929', 'M146069116468948972', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069116474730838', 'M146069116468948972', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069116474750199', 'M146069116468948972', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069116999904891', 'M146069116995690883', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069116999909404', 'M146069116995690883', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069116999923513', 'M146069116995690883', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069116999935551', 'M146069116995690883', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069116999943462', 'M146069116995690883', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069116999967838', 'M146069116995690883', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069116999988676', 'M146069116995690883', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069116999999067', 'M146069116995690883', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069117000017070', 'M146069116995690883', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069117792907938', 'M146069117787576209', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069117792942653', 'M146069117787576209', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069117792952071', 'M146069117787576209', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069117792955596', 'M146069117787576209', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069117792958510', 'M146069117787576209', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069117792972256', 'M146069117787576209', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069117792976344', 'M146069117787576209', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069117792982231', 'M146069117787576209', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069117792983480', 'M146069117787576209', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069119265424466', 'M146069119260274581', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069119265516736', 'M146069119260274581', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069119265516831', 'M146069119260274581', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069119265520887', 'M146069119260274581', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069119265548561', 'M146069119260274581', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069119265550487', 'M146069119260274581', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069119265564121', 'M146069119260274581', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069119265589269', 'M146069119260274581', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069119265654783', 'M146069119260274581', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069123318877139', 'M146069123313781857', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069123318935535', 'M146069123313781857', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069123318935704', 'M146069123313781857', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069123318959495', 'M146069123313781857', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069123318973760', 'M146069123313781857', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069123318996659', 'M146069123313781857', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069123319053639', 'M146069123313781857', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069123319070619', 'M146069123313781857', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069123319073592', 'M146069123313781857', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069124649380909', 'M146069124643397134', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069124649421448', 'M146069124643397134', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069124649421619', 'M146069124643397134', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069124649424033', 'M146069124643397134', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069124649449866', 'M146069124643397134', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069124649456965', 'M146069124643397134', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069124649457058', 'M146069124643397134', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069124649483175', 'M146069124643397134', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069124649493900', 'M146069124643397134', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069125711214959', 'M146069125706511072', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069125711226197', 'M146069125706511072', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069125711237750', 'M146069125706511072', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069125711239715', 'M146069125706511072', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069125711282573', 'M146069125706511072', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069125711337814', 'M146069125706511072', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069125711359765', 'M146069125706511072', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069125711377715', 'M146069125706511072', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069125711395049', 'M146069125706511072', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069126793810961', 'M146069126789091435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069126793816726', 'M146069126789091435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069126793822977', 'M146069126789091435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069126793824689', 'M146069126789091435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069126793825913', 'M146069126789091435', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069126793833233', 'M146069126789091435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069126793848192', 'M146069126789091435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069126793865381', 'M146069126789091435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069126793874418', 'M146069126789091435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069128119450447', 'M146069128114464859', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069128119458225', 'M146069128114464859', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069128119466123', 'M146069128114464859', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146069128119470101', 'M146069128114464859', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069128119482790', 'M146069128114464859', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069128119490894', 'M146069128114464859', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069128119498654', 'M146069128114464859', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146069128119539854', 'M146069128114464859', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146069128119592124', 'M146069128114464859', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286057683726', 'M146088286050832758', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088286057834520', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286057966478', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286058085483', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286058197394', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286058209868', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286058215774', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286058218869', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286058292213', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286058325884', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286058374639', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286058383125', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286058397150', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060580061', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060587113', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286060632449', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286060696159', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060708131', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060736163', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286060754489', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060769101', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286060775674', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060816427', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286060830576', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060834058', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286060846528', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060852806', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286060861590', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060901343', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286060982409', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060993320', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286060999690', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061132281', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061171563', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061239704', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061310009', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061315578', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061323120', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061330599', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061374398', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061383066', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061448170', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061459138', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061466377', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061471387', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061472701', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061487987', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061488193', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061491261', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061509927', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061525012', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061555166', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061564111', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061573688', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061577473', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061586683', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061593862', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061597046', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061639069', 'M146088286050832758', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286061671808', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286061697663', 'M146088286050832758', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859592460', 'M146088286853385995', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088286859612497', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859622074', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859632470', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859658439', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859663905', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859676503', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859677798', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859678387', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859679419', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859714132', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859721479', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859724515', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859727825', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859748041', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859761274', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859762648', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859764504', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859797255', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859801216', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859820438', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859821188', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859825359', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859839667', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859843555', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859867861', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859868172', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859909387', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859916145', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859932942', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859933708', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859947462', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859971368', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286859974293', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859977318', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286859980407', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860010102', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860018579', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860033094', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860033185', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860057708', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860070594', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860070689', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860073787', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860077631', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860096932', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860101205', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860112028', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860134206', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860138624', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860152508', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860156178', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860202701', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860216244', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860231306', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860244206', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860246340', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860311197', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860345587', 'M146088286853385995', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088286860382814', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088286860389989', 'M146088286853385995', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398058877', 'M146088287392314643', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088287398058999', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398072017', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398094502', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398100050', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398100510', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398103665', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398121378', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398128478', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398144836', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398169104', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398170671', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398172436', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398185626', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398221206', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398223270', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398224954', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398228130', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398231030', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398258531', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398271446', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398275129', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398280293', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398284333', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398301399', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398309123', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398312696', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398313393', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398334495', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398338031', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398370912', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398376152', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398380770', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398385422', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398391295', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398418943', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398427668', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398436484', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398441888', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398455170', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398461259', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398463062', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398466326', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398473177', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398473808', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398484907', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398500446', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398501581', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398529715', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398529926', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398538481', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398553689', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398555444', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398575582', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398577207', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398585650', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398596161', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398611608', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088287398614197', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398642362', 'M146088287392314643', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088287398697350', 'M146088287392314643', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050234146', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050255227', 'M146088288043663835', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088288050300022', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050327698', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050337992', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050351284', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050363850', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050375563', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050381969', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050384702', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050405466', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050428759', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050441536', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050454412', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050462812', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050475239', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050476148', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050482540', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050484919', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050508615', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050542689', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050557383', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050559458', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050576356', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050591233', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050604038', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050621317', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050635155', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050646510', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050648006', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050687764', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050731248', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050734121', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050735419', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050753149', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050774477', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050780375', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050810262', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050831627', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050833194', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050834577', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050855894', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050878474', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050882782', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050895009', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050945656', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050964893', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050968520', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288050972195', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050973458', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050974403', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288050995181', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288051009991', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288051025500', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288051027164', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288051036924', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088288051074425', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288051085639', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288051145638', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288051166954', 'M146088288043663835', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088288051186616', 'M146088288043663835', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134014777', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134023408', 'M146088290127608987', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088290134052104', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134106911', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134114385', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134116009', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134123788', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134124533', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134138731', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134141768', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134148324', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134152682', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134164318', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134180445', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134198983', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134240902', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134241995', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134250462', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134264541', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134267191', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134268056', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134272730', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134273137', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134301887', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134324106', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134338326', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134347193', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134349792', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134353114', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134356295', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134365453', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134371674', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134400484', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134404828', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134423666', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134428622', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134434066', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134472282', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134476823', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134484195', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134487948', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134491096', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134515004', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134521589', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134526715', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134536254', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134539493', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134568752', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134586795', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134587062', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134608197', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134609260', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134613331', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134614877', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134621367', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134624871', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134635277', 'M146088290127608987', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088290134666474', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134689488', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134693920', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088290134699280', 'M146088290127608987', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291199672883', 'M146088291182117836', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088291199718584', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291199729148', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291199736245', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291199743583', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291199743731', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291199774895', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291199799198', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291199844812', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291199857439', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291199942173', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291200037248', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291200113120', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291200243839', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291200659321', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291201045428', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291201139303', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291201218865', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291201237119', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291201314554', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291201552677', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291201727074', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291201911024', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291201922214', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291201979901', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291201982618', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202066456', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202076496', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202081748', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202109186', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202110077', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202125485', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202128720', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202178654', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202188175', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202192647', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202267407', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202275603', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202328649', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202340870', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202341471', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202390744', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202426494', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202428554', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202439944', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202441834', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202463461', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202464646', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202513932', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202523283', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202536978', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202556132', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202640800', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202649737', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202656844', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202704978', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202709395', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202713393', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202730662', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291202737497', 'M146088291182117836', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291202780787', 'M146088291182117836', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796410754', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796417597', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796432192', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796439774', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796457406', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796469738', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796471087', 'M146088291790865341', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088291796486140', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796508659', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796527860', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796530300', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796532189', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796534088', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796535838', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796553604', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796556073', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796557163', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796572708', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796587508', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796598806', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796603998', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796625074', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796625408', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796628505', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796634948', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796643547', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796652489', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796675138', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796680891', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796682089', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796697420', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796698290', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796703442', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796712880', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796722263', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796732518', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796744773', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796745038', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796751112', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796771817', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796772033', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796772719', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796775262', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796792992', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796804333', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796820772', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796822714', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796831248', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796858104', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796868938', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796873222', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796875421', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796886309', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796890171', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796891528', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796893967', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796927493', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796935340', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796944344', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088291796962870', 'M146088291790865341', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088291796998644', 'M146088291790865341', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013135559', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013137576', 'M146088293008349672', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088293013146938', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013222667', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013223857', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013225195', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013238220', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013261992', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013264875', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013269522', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013271882', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013272487', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013275424', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013279120', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013281619', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013292570', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013299961', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013302274', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013302369', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013307887', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013338166', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013338606', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013348894', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013350301', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013352851', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013359473', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013368969', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013380160', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013382502', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013384740', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013389836', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013405434', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013416243', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013418000', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013433067', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013434787', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013437956', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013445127', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013450414', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013453842', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013486760', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013488724', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013492012', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013496917', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013507960', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013514137', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013527461', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013532031', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013537353', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013544803', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013548384', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013558528', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013564820', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013573238', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013580840', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013589113', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013590760', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013604695', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013624436', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293013625479', 'M146088293008349672', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293013638430', 'M146088293008349672', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632220115', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632266042', 'M146088293626638737', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088293632325458', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632384595', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632385230', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632400333', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632410448', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632420999', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632431314', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632463305', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632480150', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632481357', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632512894', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632530372', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632543384', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632548341', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632566388', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632571748', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632592614', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632594773', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632595111', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632599373', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632600027', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632611059', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632616124', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632629877', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632630692', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632630965', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632654828', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632657222', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632666394', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632688262', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632703748', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632705806', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632708195', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632709235', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632720829', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632721209', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632736681', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632741487', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632759425', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632773543', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632785730', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632806998', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632815882', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632821813', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632821880', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632836349', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632844568', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632855349', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632863519', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632871478', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632888287', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632891638', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632896701', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632908370', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632930706', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632933310', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632958193', 'M146088293626638737', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088293632965407', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088293632970325', 'M146088293626638737', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297339965', 'M146088294291836845', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088294297371825', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297404380', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297428073', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297434751', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297437068', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297454302', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297454470', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297459749', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297469440', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297472794', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297486185', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297486548', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297490137', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297492104', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297502727', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297513499', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297532354', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297545598', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297552417', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297561049', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297564983', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297574621', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297575332', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297581715', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297591253', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297597849', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297600588', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297613740', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297620580', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297623949', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297629941', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297643286', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297655331', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297668790', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297670767', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297677760', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297678796', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297701377', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297716332', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297718539', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297733087', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297753242', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297758054', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297758659', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297764163', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297764659', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297767340', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297768035', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297806719', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297840315', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297842217', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297845889', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297847159', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297850584', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297861315', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297869464', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297883343', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297887057', 'M146088294291836845', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088294297888925', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088294297892162', 'M146088294291836845', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242505574', 'M146088295236505082', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088295242517468', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242534044', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242573597', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242596114', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242600138', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242613263', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242619642', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242624364', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242642246', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242661101', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242669200', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242674663', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242688590', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242698332', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242701886', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242705579', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242708515', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242715195', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242719988', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242722793', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242725460', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242727713', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242734113', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242736013', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242760731', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242763573', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242788962', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242799463', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242818833', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242821714', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242826762', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242829819', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242856130', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242857993', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242863854', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242867166', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242868231', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242869067', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242871265', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242875821', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242876268', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242892037', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242894992', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242904445', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242906131', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242930667', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242951332', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242960092', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242974177', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242975136', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295242981712', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242983802', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295242984950', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295243009103', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295243009998', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295243073214', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295243075652', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295243080884', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295243089011', 'M146088295236505082', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295243098847', 'M146088295236505082', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797400867', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797443231', 'M146088295791156419', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088295797457179', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797462348', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797472244', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797484028', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797490502', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797491975', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797492416', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797507491', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797511580', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797526655', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797539758', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797541868', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797549071', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797556497', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797556821', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797559475', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797564381', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797569166', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797571231', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797574111', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797595401', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797597573', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797612061', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797613016', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797634758', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797637964', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797642221', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797650226', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797653766', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797654108', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797665908', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797683360', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797696362', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797698503', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797716810', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797717952', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797719466', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797733320', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797741226', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797760203', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797760601', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797763879', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797769314', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797775215', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797780939', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797789129', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797791648', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797795204', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797830725', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797835072', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797842707', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797844901', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797847848', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797856915', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797858907', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797862588', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797871387', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088295797874255', 'M146088295791156419', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088295797885529', 'M146088295791156419', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296538936917', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296538938752', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296538947439', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296538970096', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296538992177', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296538992568', 'M146088296532010385', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088296539017012', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539022873', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539078325', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539088302', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539089779', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539123535', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539127499', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539137336', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539140147', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539142748', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539147053', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539147238', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539147953', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539162377', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539165990', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539177360', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539183941', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539191562', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539201314', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539207469', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539211297', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539227576', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539229933', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539239971', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539247847', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539267877', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539279938', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539283183', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539285146', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539293770', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539296774', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539305845', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539323413', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539328661', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539331412', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539332543', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539336915', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539338884', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539356321', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539359389', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539380065', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539390647', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539390822', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539391392', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539394983', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539399824', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539419123', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539419910', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539432464', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539449943', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539465690', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539472232', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539474281', 'M146088296532010385', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088296539476042', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088296539494367', 'M146088296532010385', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297114819534', 'M146088297108888435', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088297114906550', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297114911692', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297114920059', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297114942922', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297114953554', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297114968363', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297114976682', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297114983108', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115007091', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115009981', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115024946', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115027863', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115046153', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115047739', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115049853', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115079125', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115080937', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115082402', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115101495', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115105857', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115108656', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115150390', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115168523', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115181148', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115181263', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115183632', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115183675', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115240132', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115251483', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115257096', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115259043', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115270999', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115272964', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115275851', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115282881', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115288070', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115288882', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115341778', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115345884', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115348342', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115364111', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115364324', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115388304', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115397579', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115398183', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115399464', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115399794', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115406073', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115406505', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115410325', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115424665', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115453388', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115455687', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115463211', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088297115463820', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115477505', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115488754', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115490492', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115690939', 'M146088297108888435', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088297115746998', 'M146088297108888435', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487725439', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487730782', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487733349', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487735376', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487738597', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487741588', 'M146088298481596532', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088298487750121', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487753574', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487757353', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487781589', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487781646', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487793625', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487805312', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487807113', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487809369', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487812627', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487816885', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487822481', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487829298', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487830659', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487834451', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487836314', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487839814', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487846111', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487846643', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487846967', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487854418', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487890916', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487905014', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487907396', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487908818', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487909465', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487913148', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487914648', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487922848', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487924328', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487941500', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487953544', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487957977', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487958009', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487972329', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298487977741', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487986271', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298487994303', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488000297', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298488000838', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488010763', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298488014955', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298488016194', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488016823', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488019171', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488030986', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488030994', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488035604', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488039125', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298488060602', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298488063789', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298488071648', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298488079179', 'M146088298481596532', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088298488087875', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088298488147912', 'M146088298481596532', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101048762', 'M146088299095201146', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088299101120914', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101140094', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101143546', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101155394', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101160203', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101179676', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101180190', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101188229', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101194105', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101211054', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101221378', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101224926', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101233147', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101237735', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101261488', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101262301', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101286644', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101292386', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101292604', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101293294', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101295478', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101298601', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101298886', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101331448', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101346324', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101362009', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101367886', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101386684', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101392337', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101396790', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101408084', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101439820', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101514632', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101528201', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101532056', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101555627', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101582527', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101591676', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101651103', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101670151', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101681096', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101723376', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101781842', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101832165', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101849581', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101854306', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101888608', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101927453', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101949395', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101952076', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101973350', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299101973788', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101993762', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299101996545', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299102010064', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299102018727', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299102036458', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299102058988', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299102073642', 'M146088299095201146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299102076558', 'M146088299095201146', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790636045', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790636445', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790656009', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790656144', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790661810', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790682732', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790684685', 'M146088299784897535', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088299790689399', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790702476', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790728692', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790739411', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790750296', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790750507', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790753490', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790754700', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790756429', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790759510', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790771282', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790771352', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790781647', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790783637', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790789483', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790794129', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790799704', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790815140', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790820434', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790828283', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790832984', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790833563', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790837911', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790854240', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790859087', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790859707', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790867797', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790868643', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790870845', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790871121', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790873134', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790877733', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790881032', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790882213', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790919373', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790921465', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790926166', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790943429', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790954371', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790954928', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790962015', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790972776', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299790977619', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790978367', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299790984459', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299791005552', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299791009839', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299791010063', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299791025805', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299791038172', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299791055991', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299791059145', 'M146088299784897535', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088299791094854', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088299791098250', 'M146088299784897535', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481410704', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481420095', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481438422', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481459952', 'M146088300476007224', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088300481471684', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481482004', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481487107', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481494486', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481497724', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481497828', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481500351', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481502631', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481506277', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481525350', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481533030', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481544137', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481545584', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481547680', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481557172', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481560003', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481572567', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481576424', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481580798', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481582655', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481589438', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481590857', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481608415', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481609155', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481615487', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481618586', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481622129', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481623533', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481624757', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481640265', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481642424', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481644569', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481646068', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481653724', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481662275', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481662523', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481675958', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481696530', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481700154', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481703144', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481706864', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481709134', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481711601', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481711683', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481715846', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481717122', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481723986', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481736723', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481755130', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481766419', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481771857', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481771881', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481778016', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481791157', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088300481827970', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481830208', 'M146088300476007224', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088300481896965', 'M146088300476007224', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436813643', 'M146088301430475918', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088301436831961', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301436870663', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436890496', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436894682', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301436897932', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436903194', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436905738', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436909631', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301436917804', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301436928430', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436935971', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301436959264', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301436982128', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301436983982', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436988119', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301436998576', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437004009', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437006026', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437006645', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437020193', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437022478', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437030543', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437031544', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437054948', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437065917', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437076866', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437086263', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437088458', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437089239', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437090249', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437095353', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437118221', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437132964', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437143372', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437143690', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437145100', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437147577', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437149373', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437150544', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437152067', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437153154', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437160554', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437162708', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437169670', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437172396', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437183008', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437190149', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437194076', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437205608', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437207991', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437213287', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437231265', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437231378', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437247027', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437250667', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437251052', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437264586', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437271125', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088301437296812', 'M146088301430475918', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088301437298607', 'M146088301430475918', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050714519', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050733790', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050761823', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050773884', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050783025', 'M146088302045811479', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088302050801063', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050804582', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050805804', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050816064', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050822278', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050832821', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050834367', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050849270', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050856892', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050857866', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050871187', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050881415', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050886324', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050892552', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050895061', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050897479', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050898059', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050909577', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050914234', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050914783', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050920435', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050923721', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050941206', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050945334', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050960768', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050961218', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050968060', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050986369', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050988261', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050996992', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302050997838', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302050998925', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051002417', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051017040', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051026441', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051037851', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051046950', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051048242', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051048312', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051052257', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051055773', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051066537', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051067868', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051073550', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051077928', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051095193', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051099123', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051120169', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051133927', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051142846', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051158814', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051159256', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051166068', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302051168174', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051182387', 'M146088302045811479', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302051184647', 'M146088302045811479', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532525165', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532526923', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532529574', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532543690', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532566034', 'M146088302526211375', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088302532576554', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532587165', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532605013', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532605985', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532606728', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532612353', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532622135', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532626144', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532627452', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532639380', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532642500', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532649664', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532653678', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532654584', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532670165', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532671608', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532701376', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532710642', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532712745', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532714992', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532719770', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532734448', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532741960', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532745476', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532751993', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532764824', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532765573', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532768816', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532774066', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532793081', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532794288', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532800849', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532810521', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532817608', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532818117', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532819698', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532831974', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532834078', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532854630', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532854755', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532858099', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532859409', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532866350', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532866408', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532881728', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532885759', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532895799', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532903573', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532911977', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532928475', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532929554', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532930878', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532942543', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532943315', 'M146088302526211375', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088302532949171', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088302532967397', 'M146088302526211375', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146802821', 'M146088303140255333', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088303146871725', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146903536', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146907212', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146931581', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303146933482', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303146933776', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303146938791', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303146948890', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146951574', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303146964072', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303146964101', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303146970285', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146982666', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146995770', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146996593', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303146998309', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303146998817', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147000975', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147001019', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147003056', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147010732', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147017121', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147018896', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147029057', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147032686', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147038829', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147049665', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147056031', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147059571', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147061172', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147062072', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147065639', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147070233', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147100631', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147104481', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147117176', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147120394', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147125747', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147126583', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147132752', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147153151', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147159137', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147159826', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147162358', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147165203', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147167184', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147169638', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147182442', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147186492', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147197412', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147209235', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147222757', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147225868', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147227803', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147242260', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147265823', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147265929', 'M146088303140255333', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303147294915', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147296559', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303147297724', 'M146088303140255333', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680586991', 'M146088303673290850', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088303680601840', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680602625', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680627084', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680635186', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680653110', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680654027', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680695171', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680698927', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680708407', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680709231', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680720672', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680744841', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680755372', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680776961', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680785038', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680788612', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680798501', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680813780', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680820825', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680863854', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680881844', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680883100', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680883840', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680891226', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680892981', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680897947', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680905990', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680945529', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680959739', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680961071', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680963374', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680978561', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680981505', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303680981591', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680984889', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303680988329', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681005023', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681005894', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681030907', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681037941', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681040178', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681044682', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681048821', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681062895', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681069158', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681092804', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681104169', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681113549', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681115483', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681130407', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681162491', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681171497', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681173025', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681173140', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681196929', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681197004', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681235341', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681245071', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088303681272947', 'M146088303673290850', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088303681281488', 'M146088303673290850', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304383848215', 'M146088304377363862', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088304383900059', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304383902614', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304383909647', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304383922103', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304383923432', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304383931161', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304383938069', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304383944810', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304383944849', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304383948130', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304383980527', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304383985727', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304383991401', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384057829', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384212182', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384216142', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384237114', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384242400', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384246889', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384260279', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384282094', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384291693', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384297294', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384302581', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384304554', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384306448', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384306742', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384306800', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384311125', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384314836', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384324243', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384326113', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384350174', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384363920', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384378392', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384379088', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384379264', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384385068', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384392048', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384392650', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384402540', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384408959', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384409188', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384413858', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384420149', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384424653', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384427691', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384428235', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384433210', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384433704', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384438883', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384444571', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384470386', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384483282', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384484871', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384489874', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384501849', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384514988', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088304384517862', 'M146088304377363862', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088304384585403', 'M146088304377363862', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373105230', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373113613', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373124254', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373130800', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373140957', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373154666', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373187475', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373195041', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373195586', 'M146088357366927823', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088357373229582', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373259715', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373266712', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373267214', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373320565', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373365028', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373377387', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373380150', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373408577', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373416419', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373421201', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373441007', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373460677', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373476560', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373497708', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373499186', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373517220', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373536048', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373545248', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373564645', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373580338', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373602343', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373614554', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373649100', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373650579', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373671467', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373680725', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373689134', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373715637', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373741157', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373742619', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373743120', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373743963', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373781070', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373807117', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373812578', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373817576', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373876995', 'M146088357366927823', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088357373888135', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088357373889657', 'M146088357366927823', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707232273', 'M146088368701313714', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088368707424502', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707462881', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707501826', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707509715', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707524116', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707527251', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707543327', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707550201', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707555301', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707583883', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707599854', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707606027', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707655069', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707682957', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707691452', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707713981', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707732919', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707741402', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707763012', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707766263', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707768842', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707776780', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088368707852130', 'M146088368701313714', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088368707854009', 'M146088368701313714', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370742808402', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370742837824', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370742862570', 'M146088370736869163', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146088370742923141', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370742941602', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370742998798', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743009080', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370743020750', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370743026402', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743048922', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743130209', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370743157595', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743166421', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743174433', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743186443', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370743221484', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370743255262', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370743260040', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370743262294', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743290514', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743309087', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743324718', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146088370743325581', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743361757', 'M146088370736869163', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146088370743362659', 'M146088370736869163', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146881310097067015', 'M146881310092346523', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('146881310097082604', 'M146881310092346523', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146881310097184632', 'M146881310092346523', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146881310097189754', 'M146881310092346523', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146881310097267131', 'M146881310092346523', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('146881310097287055', 'M146881310092346523', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146881310097296905', 'M146881310092346523', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146881310097335934', 'M146881310092346523', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('146881310097380126', 'M146881310092346523', 'ROLE144522301761659074');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474088816273', 'M141006628690009172', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474088908269', 'M144415416469293961', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474088932026', 'M141006637490117545', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474089002445', 'M140176079018269146', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474089004392', 'M140176040904503673', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474089006316', 'M140176146066377305', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474089012567', 'M140176133468823709', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474089026123', 'M140176103998453060', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm144522474089090478', 'M140176000803374567', 'ROLE141171556165393734');
INSERT INTO `t_n_role_menu` VALUES ('rm145009758549023601', 'M144406287001810534', 'ROLE145009758542736371');
INSERT INTO `t_n_role_menu` VALUES ('rm145009758549027034', 'M144406198373451421', 'ROLE145009758542736371');
INSERT INTO `t_n_role_menu` VALUES ('rm145009758549039162', 'M144406297361739480', 'ROLE145009758542736371');
INSERT INTO `t_n_role_menu` VALUES ('rm145009758549040977', 'M144406315360162945', 'ROLE145009758542736371');
INSERT INTO `t_n_role_menu` VALUES ('rm145009758549049684', 'M144406301425130609', 'ROLE145009758542736371');
INSERT INTO `t_n_role_menu` VALUES ('rm145009758549055614', 'M144406285413154511', 'ROLE145009758542736371');
INSERT INTO `t_n_role_menu` VALUES ('rm145009758549072986', 'M144406299674984233', 'ROLE145009758542736371');
INSERT INTO `t_n_role_menu` VALUES ('rm145009758549084248', 'M144406313559769763', 'ROLE145009758542736371');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499402070', 'M144406297361739480', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499411768', 'M144406315360162945', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499442476', 'M144406287001810534', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499446047', 'M144406313559769763', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499485749', 'M144406285413154511', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499496137', 'M141006637490117545', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499496745', 'M144406198373451421', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499499765', 'M144406299674984233', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092781499593883', 'M144406301425130609', 'ROLE144522321875038417');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810220292', 'M144406195900163064', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810236306', 'M144406285413154511', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810246626', 'M144406335271953889', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810254275', 'M144406198373451421', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810260235', 'M144406332366133527', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810264718', 'M144406336418826843', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810270730', 'M144406337418715899', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810271835', 'M144406338476428759', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810277833', 'M144406331414986785', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810336318', 'M144406297361739480', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810337611', 'M144406315360162945', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810354346', 'M144406287001810534', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810366931', 'M144406313559769763', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810369903', 'M144406299674984233', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092784810372431', 'M144406301425130609', 'ROLE145009735598663232');
INSERT INTO `t_n_role_menu` VALUES ('rm145092816894253405', 'M140176079018269146', 'ROLE141006730160700652');
INSERT INTO `t_n_role_menu` VALUES ('rm145092816894255683', 'M140176000803374567', 'ROLE141006730160700652');
INSERT INTO `t_n_role_menu` VALUES ('rm145092816894267668', 'M140176133468823709', 'ROLE141006730160700652');
INSERT INTO `t_n_role_menu` VALUES ('rm145092816894276995', 'M140176103998453060', 'ROLE141006730160700652');
INSERT INTO `t_n_role_menu` VALUES ('rm145092816894280667', 'M140176040904503673', 'ROLE141006730160700652');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071406651', 'M144406195900163064', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071408942', 'M144406335271953889', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071414173', 'M144406332366133527', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071418309', 'M144406266205620364', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071422980', 'M144406331414986785', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071466391', 'M144406269387486060', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071479241', 'M144406280858700715', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071490288', 'M144406277834030962', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071500533', 'M144406315360162945', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071501873', 'M144406297361739480', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071508912', 'M144406285413154511', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071512349', 'M144406336418826843', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071520004', 'M140176000818673982', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071526748', 'M144406313559769763', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071528698', 'M144406299674984233', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071538899', 'M144406198373451421', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071541363', 'M144406287001810534', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071564709', 'M140444051720061522', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071570708', 'M144406301425130609', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm145093416071599849', 'M144406337418715899', 'ROLE145093416064454227');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645402764', 'M146088298481596532', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645402768', 'M146088293626638737', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645409277', 'M146088304377363862', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645410787', 'M146088301430475918', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645413002', 'M146088290127608987', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645416202', 'M144406266205620364', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645425048', 'M146088286853385995', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645425324', 'M146088303140255333', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645429598', 'M141006628690009172', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645433362', 'M146088287392314643', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645435895', 'M146088303673290850', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645439055', 'M146088299095201146', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645440192', 'M146088288043663835', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645445296', 'M146088299784897535', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645446637', 'M146088291182117836', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645447512', 'M146088302045811479', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645451503', 'M146088286050832758', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645451676', 'M146088296532010385', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645459049', 'M146088295236505082', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645460664', 'M144406269387486060', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645462748', 'M146088302526211375', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645467389', 'M146088295791156419', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645471565', 'M146088300476007224', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645472162', 'M144415416469293961', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645480826', 'M146088370736869163', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645481466', 'M146088357366927823', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645482917', 'M146088368701313714', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645485601', 'M146088294291836845', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645489835', 'M146088297108888435', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645493728', 'M146088291790865341', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146147325645499245', 'M146088293008349672', 'ROLE145009749723012955');
INSERT INTO `t_n_role_menu` VALUES ('rm146881311968257419', 'M146881310092346523', 'ROLE146881311960340530');
INSERT INTO `t_n_role_menu` VALUES ('rm146881324297126363', '', 'ROLE146881324287753023');

-- ----------------------------
-- Table structure for t_n_role_menu_permit
-- ----------------------------
DROP TABLE IF EXISTS `t_n_role_menu_permit`;
CREATE TABLE `t_n_role_menu_permit` (
  `id` varchar(32) NOT NULL,
  `permit_val` varchar(32) DEFAULT NULL,
  `role_menu_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_n_role_menu_permit
-- ----------------------------

-- ----------------------------
-- Table structure for t_n_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_n_role_user`;
CREATE TABLE `t_n_role_user` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_n_role_user
-- ----------------------------
INSERT INTO `t_n_role_user` VALUES ('140176000796268139', 'ROLE140176000792987194', 'U140176000619665259');
INSERT INTO `t_n_role_user` VALUES ('145054239535324529', 'ROLE145009749723012955', 'U145054239527900055');
INSERT INTO `t_n_role_user` VALUES ('145092721365687710', 'ROLE145009749723012955', 'U145092721361277162');
INSERT INTO `t_n_role_user` VALUES ('145092728716986322', 'ROLE144522321875038417', 'U145092728714573693');
INSERT INTO `t_n_role_user` VALUES ('145092734403340269', 'ROLE145009735598663232', 'U145092734400355683');
INSERT INTO `t_n_role_user` VALUES ('145092734403465663', 'ROLE145009758542736371', 'U145092734400355683');
INSERT INTO `t_n_role_user` VALUES ('145092798735119071', 'ROLE141006730160700652', 'U145092798733432755');
INSERT INTO `t_n_role_user` VALUES ('145093418723831868', 'ROLE145093416064454227', 'U140176000619665260');
INSERT INTO `t_n_role_user` VALUES ('146147311708734334', 'ROLE145009749723012955', 'U146147311664138629');
INSERT INTO `t_n_role_user` VALUES ('146881326849950486', 'ROLE146881324287753023', 'U146881326843757501');
INSERT INTO `t_n_role_user` VALUES ('146882828635503463', 'ROLE146881324287753023', 'U146882828609160890');
INSERT INTO `t_n_role_user` VALUES ('146882852303950280', 'ROLE146881324287753023', 'U146882852295456195');
INSERT INTO `t_n_role_user` VALUES ('146882867221703456', 'ROLE146881324287753023', 'U146882867205821359');
INSERT INTO `t_n_role_user` VALUES ('146883943494198073', 'ROLE146881324287753023', 'U146883943486039507');
INSERT INTO `t_n_role_user` VALUES ('146884431618780744', 'ROLE146881324287753023', 'U146884431609200769');
INSERT INTO `t_n_role_user` VALUES ('146884526825130800', 'ROLE146881324287753023', 'U146884526817847927');
INSERT INTO `t_n_role_user` VALUES ('146884557789471208', 'ROLE146881324287753023', 'U146884557785509913');
INSERT INTO `t_n_role_user` VALUES ('146884567442862117', 'ROLE146881324287753023', 'U146884567436175554');
INSERT INTO `t_n_role_user` VALUES ('146884649475302573', 'ROLE146881324287753023', 'U146884649469492608');

-- ----------------------------
-- Table structure for t_n_user
-- ----------------------------
DROP TABLE IF EXISTS `t_n_user`;
CREATE TABLE `t_n_user` (
  `id` varchar(255) NOT NULL,
  `call_name` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `mobile_no` varchar(32) DEFAULT NULL,
  `org_id` varchar(64) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `post_name` varchar(64) DEFAULT NULL,
  `profe_name` varchar(64) DEFAULT NULL,
  `qq_no` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `user_name` varchar(32) NOT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `id_type` varchar(32) DEFAULT NULL,
  `id_no` varchar(64) DEFAULT NULL,
  `portal` varchar(2) DEFAULT NULL,
  `license` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_n_user
-- ----------------------------
INSERT INTO `t_n_user` VALUES ('U140176000619665260', '超级管理员', '2014-06-03 09:46:46', 'admin@163.com', '133', '1', '21232f297a57a5a743894a0e4a801fc3', '管理员', '无', '10000', 'Manager', '1', '0871-0000', 'admin', null, null, null, '0', null);
INSERT INTO `t_n_user` VALUES ('U145054239527900055', '学员1', '2015-12-20 00:26:35', null, '13333333333', 'org145009743921113084', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', '1', null, 'stu1', null, null, null, null, null);
INSERT INTO `t_n_user` VALUES ('U145092721361277162', '学员1', '2015-12-24 11:20:13', null, '13300000000', 'org145009743921113084', '827ccb0eea8a706c4c34a16891f84e7b', null, null, null, '', '1', null, 'stu2', null, null, null, null, null);
INSERT INTO `t_n_user` VALUES ('U145092728714573693', '老师', '2015-12-24 11:21:27', null, '13333333333', 'org141006703765177860', '827ccb0eea8a706c4c34a16891f84e7b', null, null, null, '', '1', null, 'tea1', null, null, null, null, null);
INSERT INTO `t_n_user` VALUES ('U145092734400355683', '老师', '2015-12-24 11:22:24', null, '13308888888', 'org145009728462179485', '827ccb0eea8a706c4c34a16891f84e7b', null, null, null, '', '1', null, 'tea2', null, null, null, null, null);
INSERT INTO `t_n_user` VALUES ('U145092798733432755', '管理员', '2015-12-24 11:33:07', null, '13333333333', '1', '54b53072540eeeb8f8e9343e71f28176', null, null, null, '', '1', null, 'system', null, null, null, null, null);
INSERT INTO `t_n_user` VALUES ('U146147311664138629', 'stu3', '2016-04-24 12:45:16', null, '13300000000', 'org145009743921113084', 'f6c40d53d7bfcff74287fa4f72d7c97a', null, null, null, '', '1', null, 'stu3', null, null, null, null, null);
INSERT INTO `t_n_user` VALUES ('U146881326843757501', '公众用户', '2016-07-18 11:41:08', null, '13308800013', 'org146881316216366940', '0a0ec7dce5f09e5cf1bc3a5cf8f6fe05', null, null, null, '', '1', null, 'publicuser', null, null, null, '1', null);
INSERT INTO `t_n_user` VALUES ('U146882828609160890', 'abc', '2016-07-18 15:51:14', null, '13308800013', null, 'c47c74fb41495f88ecaa33c3b6979e78', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'public1', null, '身份证', '220', '1', 'C1');
INSERT INTO `t_n_user` VALUES ('U146882852295456195', 'abc', '2016-07-18 15:54:21', null, '13308800013', null, 'c3686eeff1f1ffaaff941a20f854fb86', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'public2', null, '身份证', '220', '1', 'C1');
INSERT INTO `t_n_user` VALUES ('U146882867205821359', 'abc', '2016-07-18 15:57:52', null, '13308800013', null, '5c1c8362831e766a32e8646796d0c5a5', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'public3', null, '身份证', '220', '1', 'C1');
INSERT INTO `t_n_user` VALUES ('U146883943486039507', '小王', '2016-07-18 18:57:14', null, '13333333333', null, 'e1e3719adf572387c715f982c517e2b0', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'public4', null, '身份证', '222', '1', 'C1');
INSERT INTO `t_n_user` VALUES ('U146884431609200769', '小李', '2016-07-18 20:18:36', null, '13333333333', null, 'fc8ce54607854df8b72e7324c8f6aa24', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'public5', null, '身份证', '222', '1', 'C1');
INSERT INTO `t_n_user` VALUES ('U146884526817847927', '小刘', '2016-07-18 20:34:28', null, '13398898899', null, '1e772b1e4d57560422e07565600aca48', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'public6', null, '身份证', '222', '1', 'C1');
INSERT INTO `t_n_user` VALUES ('U146884557785509913', '小张', '2016-07-18 20:39:37', null, '13333333333', null, '2fb0584d55b205f7aa3b478f6d6126e3', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'public7', null, '身份证', '2222', '1', 'C1');
INSERT INTO `t_n_user` VALUES ('U146884567436175554', 'abc', '2016-07-18 20:41:14', null, '13308800013', null, 'b9459ba0a51d3f013a3510c524c73585', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'public8', null, '身份证', '220', '1', 'C1');
INSERT INTO `t_n_user` VALUES ('U146884649469492608', 'Levi Tsui', '2016-07-18 20:54:54', null, '13333333333', null, '1d6a0ace3e136a56fb2f0f1d3bcae057', '公众用户', 'Public Visitor', null, 'Register via page', '1', '-- --', 'pubusr1', null, '身份证', '222', '1', 'C1');

-- ----------------------------
-- Table structure for t_n_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `t_n_user_ext`;
CREATE TABLE `t_n_user_ext` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `t_n_user_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `id_type` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `id_card_no` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_n_user_ext
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `serial_nbr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `order_status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `order_amount` decimal(10,0) DEFAULT NULL,
  `order_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `order_payment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `order_detail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `pre_status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('39b2644ce28b44a9a1c57bfeb2f27af4', null, null, '001', '100', 'U140176000619665260', 'ab1a4b2dc0d74ff59de105d378cd4a1a', 'cabbf0b6fb064f47bca028a40fa09ed9', '2016-07-17 22:23:50', null);
INSERT INTO `t_order` VALUES ('3a05c233d16043838e502b78491cf3d4', null, null, '001', '100', 'U146882867205821359', '718074f870b44b24bd8d330720009fce', '6e56b6dfb0f6473bbca97dfce578c69a', '2016-07-18 17:22:32', null);
INSERT INTO `t_order` VALUES ('a8fb4a67f7834e858c1ba9f87541ec47', null, null, '001', null, 'U140176000619665260', '861d17acfead47cf815840a531b318ce', 'e09886d4662146e196fb9ce64c821390', '2016-07-17 22:20:39', null);

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `license_level` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `license_level_money` decimal(10,0) DEFAULT NULL,
  `training_field` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_field_lock` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_field_money` decimal(10,0) DEFAULT NULL,
  `instruction_vehicle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `instruction_vehicle_lock` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `instruction_vehicle_money` decimal(10,0) DEFAULT NULL,
  `coach` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `coach_lock` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `coach_money` decimal(10,0) DEFAULT NULL,
  `training_start_time` datetime DEFAULT NULL,
  `duration` int(5) DEFAULT NULL,
  `training_end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES ('2fb80a705a134889b2df384f9bb6ae1f', null, null, null, null, null, null, null, null, null, null, null, null, '0', null);
INSERT INTO `t_order_detail` VALUES ('6e56b6dfb0f6473bbca97dfce578c69a', 'C1', null, 'A', null, null, 'CK001', '146883375500479951', '100', null, null, null, '2016-07-19 08:00:00', '1', '2016-07-19 07:00:00');
INSERT INTO `t_order_detail` VALUES ('cabbf0b6fb064f47bca028a40fa09ed9', 'C1', null, 'A', null, null, 'CK002', '146876543248566266', '100', null, null, null, '2016-07-21 08:00:00', '1', '2016-07-21 07:00:00');
INSERT INTO `t_order_detail` VALUES ('e09886d4662146e196fb9ce64c821390', null, null, null, null, null, null, null, null, null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for t_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_order_payment`;
CREATE TABLE `t_order_payment` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `time_received` datetime DEFAULT NULL,
  `money_received` decimal(10,0) DEFAULT NULL,
  `payment_method` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `pay_status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `pay_serial` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pay_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pay_request` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_order_payment
-- ----------------------------
INSERT INTO `t_order_payment` VALUES ('2f127b50be284c2eb29753b0c749c674', null, null, null, null, null, null, null, null);
INSERT INTO `t_order_payment` VALUES ('718074f870b44b24bd8d330720009fce', null, null, null, null, null, null, null, null);
INSERT INTO `t_order_payment` VALUES ('861d17acfead47cf815840a531b318ce', null, null, null, null, null, null, null, null);
INSERT INTO `t_order_payment` VALUES ('ab1a4b2dc0d74ff59de105d378cd4a1a', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_v_repair_person
-- ----------------------------
DROP TABLE IF EXISTS `t_v_repair_person`;
CREATE TABLE `t_v_repair_person` (
  `id` varchar(255) CHARACTER SET gbk NOT NULL,
  `user_name` varchar(32) CHARACTER SET gbk NOT NULL,
  `org_id` varchar(64) CHARACTER SET gbk DEFAULT NULL,
  `mobile_no` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `Index 2` (`create_time`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_v_repair_person
-- ----------------------------
INSERT INTO `t_v_repair_person` VALUES ('141182925050037274', '张XX', 'org141171591552802788', '123', '2014-09-27 22:47:30', '1');
INSERT INTO `t_v_repair_person` VALUES ('141182926890677695', '李ＸＸ', 'org141171593829446756', '１', '2014-09-27 22:47:48', '1');
INSERT INTO `t_v_repair_person` VALUES ('141275354218214894', '张', 'org141171593829446756', '1', '2014-10-08 15:32:22', '1');

-- ----------------------------
-- Table structure for t_v_vehicle_basicinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_v_vehicle_basicinfo`;
CREATE TABLE `t_v_vehicle_basicinfo` (
  `card_id` varchar(32) NOT NULL COMMENT '智能卡号',
  `license_place` varchar(16) NOT NULL COMMENT '车牌号',
  `frame_number` varchar(64) DEFAULT NULL COMMENT '车架号',
  `owner` varchar(64) DEFAULT NULL COMMENT '车主',
  `contacts` varchar(64) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `vehicle_company` varchar(64) DEFAULT NULL COMMENT '所属公司',
  `org_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `Index 2` (`license_place`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_v_vehicle_basicinfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_v_vehicle_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `t_v_vehicle_maintenance`;
CREATE TABLE `t_v_vehicle_maintenance` (
  `m_id` varchar(32) NOT NULL COMMENT '流水号',
  `license_place` varchar(32) DEFAULT NULL COMMENT '车牌号',
  `maintenance` varchar(1024) DEFAULT NULL COMMENT '保养情况说明',
  `inspector` varchar(64) DEFAULT NULL COMMENT '例保检测人',
  `note` varchar(1024) DEFAULT NULL COMMENT '备注',
  `mtn_time` datetime DEFAULT NULL COMMENT '保养时间',
  `org_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `Index 2` (`license_place`,`mtn_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_v_vehicle_maintenance
-- ----------------------------

-- ----------------------------
-- Table structure for vehicle_type
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_type`;
CREATE TABLE `vehicle_type` (
  `vehicle_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '车辆类型',
  `vehicle_type_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of vehicle_type
-- ----------------------------
