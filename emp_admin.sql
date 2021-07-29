/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : emp_admin

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 18/04/2021 22:36:27
*/
use emp_admin
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001776205F6B07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'LAPTOP-CUL9BHTU1618745228386', 1618749641580, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1618750800000, 1618749000000, 5, 'WAITING', 'CRON', 1612257351000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001776205F6B07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2021-02-02 17:14:54');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-02 18:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-03 11:30:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-03 12:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-03 13:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-03 16:30:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-03 17:00:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-03 17:30:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-04 12:00:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-04 12:30:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-04 13:00:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-04 17:00:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-04 17:30:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-04 18:00:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-04 18:30:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-05 11:30:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-05 12:00:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-05 12:30:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-05 13:30:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-05 14:00:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-06 12:30:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-06 13:30:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-06 14:00:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-06 17:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-06 17:30:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-06 18:00:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-07 12:00:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-07 12:30:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-07 13:00:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-07 17:00:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-07 17:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-07 18:00:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-07 18:30:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-08 17:00:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-08 19:30:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-09 12:00:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-09 12:30:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-09 13:00:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-09 13:30:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-09 14:00:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-09 14:30:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-09 19:30:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-09 20:00:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-23 11:30:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-23 12:00:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-23 17:30:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-23 18:00:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-23 18:30:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-24 12:30:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-24 13:00:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 1, '2021-02-24 13:30:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 0, '2021-02-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-01 14:00:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-02 12:30:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-02 13:00:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-02 13:30:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-03 13:00:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-03 17:30:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-03 21:00:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-03 21:30:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-03 22:00:00');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-04 12:00:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-04 12:30:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-04 13:00:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 0, '2021-03-04 21:00:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-06 12:30:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-16 20:00:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-03 19:30:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-03 20:00:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-04 20:30:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-04 21:00:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-04 21:30:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-05 19:30:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-05 20:00:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-05 20:30:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-06 19:30:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-06 20:00:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-08 19:30:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-09 19:00:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-09 19:30:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-09 20:30:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-12 20:00:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-12 20:30:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-13 20:00:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-13 20:30:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-13 21:00:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-14 21:00:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-14 21:30:00');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-14 22:00:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-15 10:30:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-15 20:00:00');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-15 20:30:00');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-15 21:30:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 2, '2021-04-16 16:30:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-16 17:00:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-16 17:30:00');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-16 19:00:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-16 19:30:00');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-16 20:00:00');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-16 21:00:00');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-16 21:30:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-17 17:30:00');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-17 20:00:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-17 20:30:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-17 21:00:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-17 21:30:00');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-17 22:00:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 0, '2021-04-18 20:00:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-18 20:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统验证码' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('031aad83-e135-4e26-8f5f-f3c9bae86257', '7ga8n', '2021-03-04 13:48:00');
INSERT INTO `sys_captcha` VALUES ('0ab31c55-b066-4a53-8513-21c23b625870', 'f5gny', '2021-03-03 17:53:19');
INSERT INTO `sys_captcha` VALUES ('0b03ba03-1a04-43c3-848c-2167ab4b1f43', 'nfgc5', '2021-03-03 22:16:30');
INSERT INTO `sys_captcha` VALUES ('0cbec95d-23c7-41b4-8e8e-adb0acb79a7f', 'y32nw', '2021-03-03 22:00:47');
INSERT INTO `sys_captcha` VALUES ('11a1831b-21a7-4d94-8789-788b8e04beb5', 'mandc', '2021-03-03 21:31:07');
INSERT INTO `sys_captcha` VALUES ('1527c43e-eaeb-4f8a-8425-daad2bf77d26', 'm6gww', '2021-03-03 22:25:21');
INSERT INTO `sys_captcha` VALUES ('1c479789-e260-46ec-8224-821909a85be7', 'm5apc', '2021-03-03 22:16:25');
INSERT INTO `sys_captcha` VALUES ('1ee002f9-17e9-485c-840e-c831c10e64fb', 'c583f', '2021-03-04 21:03:09');
INSERT INTO `sys_captcha` VALUES ('2629f8f7-1472-4502-83f5-016a23643ab8', '8dxb5', '2021-03-03 17:35:31');
INSERT INTO `sys_captcha` VALUES ('27aba458-eea6-4e15-81df-4236448081b1', 'paaa7', '2021-03-04 13:42:05');
INSERT INTO `sys_captcha` VALUES ('2a1d05ab-4555-4eb6-8d50-950e870bee17', 'd8wex', '2021-04-07 21:12:25');
INSERT INTO `sys_captcha` VALUES ('2dc0d57e-2399-47c5-8f0f-1f2e5bd5de3d', 'cgf5d', '2021-03-03 22:21:18');
INSERT INTO `sys_captcha` VALUES ('3864bf95-8cbf-463c-878c-172e50ebd8d1', '3ygm3', '2021-03-03 22:10:48');
INSERT INTO `sys_captcha` VALUES ('3dc4b063-79fe-4d2b-8755-ceb2fc3f9623', '387ad', '2021-03-03 22:17:00');
INSERT INTO `sys_captcha` VALUES ('409c2f49-bf65-461f-8c96-14bbf739e015', 'mb6ew', '2021-03-04 13:58:25');
INSERT INTO `sys_captcha` VALUES ('4d6b5223-4538-43bf-8ae8-2cfcc8d409b4', '7m7yc', '2021-03-03 17:44:17');
INSERT INTO `sys_captcha` VALUES ('4fd023ac-8e93-41c8-8bbd-b495d7ea25f9', '765py', '2021-03-04 13:41:24');
INSERT INTO `sys_captcha` VALUES ('5143dbed-2348-4464-8997-e34b97bd41e4', '7em7e', '2021-03-03 22:06:07');
INSERT INTO `sys_captcha` VALUES ('540c3cd2-146d-4ea2-88ef-236a90046522', '2g6pf', '2021-03-03 21:23:43');
INSERT INTO `sys_captcha` VALUES ('546d05e1-b341-4bcf-8d93-ac98104768a4', 'dnm63', '2021-03-03 22:26:09');
INSERT INTO `sys_captcha` VALUES ('5b51c1e6-cb11-43cb-802c-1772c707d398', 'e748n', '2021-03-03 22:06:38');
INSERT INTO `sys_captcha` VALUES ('5c931939-f302-4fd4-8586-dd948a10d62a', 'xw5wy', '2021-03-03 22:18:29');
INSERT INTO `sys_captcha` VALUES ('65c6fd16-e80f-4024-8ba6-d60e06b0eeb5', 'yda55', '2021-03-04 13:43:30');
INSERT INTO `sys_captcha` VALUES ('6ca7dd53-ede1-4240-8e76-4ff133654af5', 'c2nxe', '2021-04-18 20:19:03');
INSERT INTO `sys_captcha` VALUES ('6d24d717-3eb8-43ee-8c15-9f8104d0e4f3', '7n2nf', '2021-03-03 17:44:11');
INSERT INTO `sys_captcha` VALUES ('6f10714e-fbf7-4410-8be4-921f2f11f96a', 'n23wn', '2021-04-18 19:32:40');
INSERT INTO `sys_captcha` VALUES ('7036ade6-34a3-4d01-873b-27e515b4bd25', 'a2nxg', '2021-03-04 13:50:24');
INSERT INTO `sys_captcha` VALUES ('707e7322-f807-46b0-89ae-cd3c2ea74259', 'dnfnm', '2021-03-03 22:03:49');
INSERT INTO `sys_captcha` VALUES ('70ddcdce-29d3-4999-8941-0a7af6b7b006', 'x3nbc', '2021-03-03 21:18:54');
INSERT INTO `sys_captcha` VALUES ('7128bc59-b082-40e7-84a7-097847daada7', '4xw6a', '2021-04-17 21:25:44');
INSERT INTO `sys_captcha` VALUES ('7202b452-c43b-47ba-8dba-8afe6abafd97', 'ewpdn', '2021-03-03 22:07:47');
INSERT INTO `sys_captcha` VALUES ('7249edc5-0e0d-41dd-8b2f-0657c96d1206', '277pp', '2021-03-04 13:28:16');
INSERT INTO `sys_captcha` VALUES ('75f89374-de82-41c4-85da-4381635e9a4f', 'g4npx', '2021-03-04 13:53:35');
INSERT INTO `sys_captcha` VALUES ('79ce446f-aee2-4c1b-8115-84150194b401', 'mc8fg', '2021-03-03 22:18:51');
INSERT INTO `sys_captcha` VALUES ('79d0458f-a9ed-4905-8c31-e32e45af42cb', '66apf', '2021-03-03 22:32:16');
INSERT INTO `sys_captcha` VALUES ('7c91fea6-5f16-4c39-8dfa-2e382db564cd', '84pe4', '2021-04-07 21:13:04');
INSERT INTO `sys_captcha` VALUES ('8098c4b1-b8f4-473b-87f0-670f699e33fc', 'ma7yg', '2021-03-03 22:27:58');
INSERT INTO `sys_captcha` VALUES ('82fb220d-0681-4451-85a6-12b4abbed846', 'p7nn4', '2021-03-03 22:32:34');
INSERT INTO `sys_captcha` VALUES ('835e95c5-2db6-49c9-8bf2-e2391ce284bb', 'x57g8', '2021-03-03 17:40:32');
INSERT INTO `sys_captcha` VALUES ('8518a93d-6fc5-4353-8da0-d8481e1a2039', '8f6d6', '2021-03-03 22:11:54');
INSERT INTO `sys_captcha` VALUES ('89f7bb16-373c-4831-8757-0392e98da43e', 'ngw4m', '2021-04-08 21:20:43');
INSERT INTO `sys_captcha` VALUES ('9097af8d-d9da-47d7-8a33-cd422d067ca2', 'ne452', '2021-03-04 21:09:50');
INSERT INTO `sys_captcha` VALUES ('97729d14-d300-46df-8be8-6316ed5fc1bc', '43wcy', '2021-04-18 20:13:06');
INSERT INTO `sys_captcha` VALUES ('9ccbc31a-e27a-42e1-8539-926575cf8307', 'mna7y', '2021-03-04 13:28:26');
INSERT INTO `sys_captcha` VALUES ('a21ca6c4-3992-44d2-80e2-4adefb077091', 'e44xg', '2021-03-03 21:18:40');
INSERT INTO `sys_captcha` VALUES ('a4e1db50-d178-4ee9-8228-f944a47d9a19', 'd5xgw', '2021-03-03 17:40:17');
INSERT INTO `sys_captcha` VALUES ('b44a7ff7-4690-4f1c-870a-e6ac8cd7590f', 'gx7g5', '2021-04-18 20:26:37');
INSERT INTO `sys_captcha` VALUES ('b4b06141-2a2e-41b8-8070-2e579b2b5b2e', '5ya3a', '2021-03-03 22:24:05');
INSERT INTO `sys_captcha` VALUES ('b992bcd8-b2d8-4f5d-833c-5b803f8a0914', 'dncfp', '2021-03-04 13:47:12');
INSERT INTO `sys_captcha` VALUES ('bd9a9528-e5b6-4655-8940-e2fc6c3db801', 'm5m6c', '2021-04-18 20:26:16');
INSERT INTO `sys_captcha` VALUES ('be29af4c-3ac7-4b36-827b-2db6d2a15937', 'yn6eg', '2021-04-08 20:17:43');
INSERT INTO `sys_captcha` VALUES ('beb5cc19-368c-48ac-8db6-d818f223e54a', '4p2pd', '2021-03-03 22:05:14');
INSERT INTO `sys_captcha` VALUES ('c0c31246-93de-41fe-889f-417a2c6ec7bc', 'g6c88', '2021-04-03 19:21:23');
INSERT INTO `sys_captcha` VALUES ('c159aca6-750e-4cea-82d1-ed243423954c', 'ae45m', '2021-03-03 22:22:51');
INSERT INTO `sys_captcha` VALUES ('c6bec450-854d-475c-8e44-16609dae7b46', 'ec336', '2021-03-03 22:05:25');
INSERT INTO `sys_captcha` VALUES ('d39d48cb-7b81-4943-8643-bbd4b319c38e', 'e6ggn', '2021-03-04 13:32:14');
INSERT INTO `sys_captcha` VALUES ('d4073d21-99a2-4c16-8902-ad31e009a326', 'em6ae', '2021-03-03 17:44:23');
INSERT INTO `sys_captcha` VALUES ('d79672b8-08ab-4a8e-8da6-4dc8cfce06a9', 'f46f7', '2021-03-03 21:58:59');
INSERT INTO `sys_captcha` VALUES ('d8252ffd-d994-44cb-8c6e-390909ce3cc0', 'nm3nw', '2021-04-18 19:32:22');
INSERT INTO `sys_captcha` VALUES ('dc2b8231-9734-4b89-8347-151d51ab5075', '4dffa', '2021-03-04 13:50:35');
INSERT INTO `sys_captcha` VALUES ('dd4cad5d-f474-4835-84e0-cbcc6e71bba7', '6pxna', '2021-03-03 22:23:41');
INSERT INTO `sys_captcha` VALUES ('e35c0ff9-4a6d-4e57-8c0c-94e707422a5f', '5mgfn', '2021-03-03 22:11:23');
INSERT INTO `sys_captcha` VALUES ('e6e0695d-eb40-4d0c-86da-6c6225092b27', 'ymdna', '2021-03-04 13:59:35');
INSERT INTO `sys_captcha` VALUES ('e86c24df-9306-4e79-87ca-ab8290e526ef', 'y3abp', '2021-03-03 21:23:51');
INSERT INTO `sys_captcha` VALUES ('ec3f4afb-e666-43ae-85f9-8b3c9c481225', 'fp4dp', '2021-03-03 22:28:38');
INSERT INTO `sys_captcha` VALUES ('ec6df675-da16-4547-8f2a-35becfb11dc6', 'yb4gf', '2021-03-03 22:27:26');
INSERT INTO `sys_captcha` VALUES ('f875e722-6a24-4e6f-876c-0444295f37a5', 'mnfnf', '2021-04-04 20:16:07');
INSERT INTO `sys_captcha` VALUES ('fbcb4d0d-93f6-454c-8ccd-59cd9d4b49ca', '2dff4', '2021-04-04 20:15:37');
INSERT INTO `sys_captcha` VALUES ('ffb6dbf7-8321-4cf7-8746-462bdb7e06f9', '2wcm2', '2021-03-04 12:34:20');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"人员招聘\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"log\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-02-02 17:19:26');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"人员信息\",\"url\":\"employee-employee\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0}]', 10, '0:0:0:0:0:0:0:1', '2021-02-02 17:20:40');
INSERT INTO `sys_log` VALUES (3, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[32]', 18, '0:0:0:0:0:0:0:1', '2021-02-02 17:20:57');
INSERT INTO `sys_log` VALUES (4, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"人员信息\",\"url\":\"employee-employee\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-02-02 17:21:30');
INSERT INTO `sys_log` VALUES (5, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"人员信息\",\"url\":\"emp-employee\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-02-02 17:28:06');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"人员信息\",\"url\":\"emp/employee\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-02-02 17:29:08');
INSERT INTO `sys_log` VALUES (7, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"qw\",\"password\":\"8eda8ca08de52e8d410c572d17ecc0021becd39a4f5427345a5d4871bd383af6\",\"salt\":\"h9YySVHXL2G1JPTsQUjc\",\"email\":\"12345@qq.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Feb 2, 2021 5:32:48 PM\"}]', 82, '0:0:0:0:0:0:0:1', '2021-02-02 17:32:48');
INSERT INTO `sys_log` VALUES (8, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[31,33,-666666],\"createTime\":\"Feb 2, 2021 5:34:53 PM\"}]', 22, '0:0:0:0:0:0:0:1', '2021-02-02 17:34:53');
INSERT INTO `sys_log` VALUES (9, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"qw\",\"salt\":\"h9YySVHXL2G1JPTsQUjc\",\"email\":\"12345@qq.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 7, '0:0:0:0:0:0:0:1', '2021-02-02 17:35:14');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":31,\"name\":\"投递简历入口\",\"url\":\"emp/employee-add-or-update\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-02-02 17:37:52');
INSERT INTO `sys_log` VALUES (11, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":31,\"name\":\"投递简历入口\",\"url\":\"emp/addemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 3, '0:0:0:0:0:0:0:1', '2021-02-02 17:50:11');
INSERT INTO `sys_log` VALUES (12, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":0,\"name\":\"岗位三级分类\",\"url\":\"comp/category\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-02-03 11:48:45');
INSERT INTO `sys_log` VALUES (13, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":31,\"name\":\"岗位三级分类\",\"url\":\"comp/category\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-02-03 11:48:56');
INSERT INTO `sys_log` VALUES (14, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":31,\"name\":\"岗位求职者分类\",\"url\":\"comp/categoryemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-02-03 16:41:44');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":31,\"name\":\"求职者分组\",\"url\":\"comp/categoryemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-02-03 16:44:12');
INSERT INTO `sys_log` VALUES (16, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":31,\"name\":\"生成统计\",\"url\":\"comp/create\",\"perms\":\"\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', 16, '0:0:0:0:0:0:0:1', '2021-02-04 16:53:19');
INSERT INTO `sys_log` VALUES (17, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":31,\"name\":\"图表显示\",\"url\":\"comp/view\",\"perms\":\"\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-02-04 16:54:27');
INSERT INTO `sys_log` VALUES (18, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":31,\"name\":\"简历初步筛选\",\"url\":\"/comp/select\",\"perms\":\"\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', 15, '0:0:0:0:0:0:0:1', '2021-02-06 12:28:55');
INSERT INTO `sys_log` VALUES (19, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":31,\"name\":\"简历初步筛选\",\"url\":\"comp/select\",\"perms\":\"\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-02-06 13:06:10');
INSERT INTO `sys_log` VALUES (20, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":31,\"name\":\"个人简历信息\",\"url\":\"/emp/seeemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2021-02-07 18:09:52');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":31,\"name\":\"个人简历信息\",\"url\":\"emp/seeemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-02-08 17:31:15');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[33,34,-666666,31]}]', 85, '0:0:0:0:0:0:0:1', '2021-02-08 18:00:14');
INSERT INTO `sys_log` VALUES (23, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"简历最终筛选\",\"url\":\"emp/lastPass\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 7, '0:0:0:0:0:0:0:1', '2021-02-09 11:50:13');
INSERT INTO `sys_log` VALUES (24, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[34,40,-666666,31]}]', 88, '0:0:0:0:0:0:0:1', '2021-02-09 20:06:06');
INSERT INTO `sys_log` VALUES (25, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":0,\"name\":\"公司员工信息\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-02-22 15:47:03');
INSERT INTO `sys_log` VALUES (26, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"员工档案\",\"url\":\"/comp/empmen\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-02-22 15:49:37');
INSERT INTO `sys_log` VALUES (27, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"员工档案\",\"url\":\"comp/empmen\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-02-22 15:49:58');
INSERT INTO `sys_log` VALUES (28, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"员工档案\",\"url\":\"comp/performence\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2021-02-22 15:53:47');
INSERT INTO `sys_log` VALUES (29, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"员工出勤情况\",\"url\":\"comp/performence\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-02-23 11:41:35');
INSERT INTO `sys_log` VALUES (30, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":42,\"name\":\"员工大事件记录\",\"url\":\"comp/particulars\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2021-02-23 11:44:14');
INSERT INTO `sys_log` VALUES (31, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":42,\"name\":\"员工离职信息\",\"url\":\"comp/departure\",\"perms\":\"\",\"type\":1,\"icon\":\"shanchu\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-02-23 11:45:17');
INSERT INTO `sys_log` VALUES (32, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":42,\"name\":\"添加宣传视频\",\"url\":\"/comp/uploadVideo\",\"perms\":\"\",\"type\":1,\"icon\":\"shoucangfill\",\"orderNum\":0}]', 15, '0:0:0:0:0:0:0:1', '2021-03-01 13:47:21');
INSERT INTO `sys_log` VALUES (33, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":42,\"name\":\"观看宣传视频\",\"url\":\"/comp/video\",\"perms\":\"\",\"type\":1,\"icon\":\"shoucang\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-03-01 13:48:31');
INSERT INTO `sys_log` VALUES (34, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":0,\"name\":\"/comp/newVideo\",\"url\":\"/comp/newVideo\",\"perms\":\"\",\"type\":1,\"icon\":\"tixing\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-03-02 13:38:43');
INSERT INTO `sys_log` VALUES (35, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[48]', 24, '0:0:0:0:0:0:0:1', '2021-03-04 13:19:05');
INSERT INTO `sys_log` VALUES (36, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[47]', 15, '0:0:0:0:0:0:0:1', '2021-03-04 13:19:14');
INSERT INTO `sys_log` VALUES (37, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"用户信息\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"log\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-03-16 20:13:16');
INSERT INTO `sys_log` VALUES (38, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":31,\"name\":\"企业申请入口\",\"url\":\"emp/addemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-03-16 20:14:18');
INSERT INTO `sys_log` VALUES (39, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":31,\"name\":\"地区三级分类\",\"url\":\"comp/category\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-03-16 20:14:38');
INSERT INTO `sys_log` VALUES (40, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":31,\"name\":\"个人申请信息\",\"url\":\"emp/seeemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-03-16 20:14:59');
INSERT INTO `sys_log` VALUES (41, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":31,\"name\":\"企业申请信息\",\"url\":\"emp/seeemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 6, '0:0:0:0:0:0:0:1', '2021-03-16 20:15:21');
INSERT INTO `sys_log` VALUES (42, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":42,\"name\":\"查看用户以往信息\",\"url\":\"/comp/seeMessage\",\"perms\":\"\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-04-03 19:20:18');
INSERT INTO `sys_log` VALUES (43, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":42,\"name\":\"查看用户以往信息\",\"url\":\"/emp/employee\",\"perms\":\"\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-04-03 19:25:34');
INSERT INTO `sys_log` VALUES (44, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":42,\"name\":\"查看用户以往信息\",\"url\":\"/emp/employeecomp\",\"perms\":\"\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-03 19:27:26');
INSERT INTO `sys_log` VALUES (45, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":42,\"name\":\"我的信息\",\"url\":\"/emp/mymessage\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-03 19:38:33');
INSERT INTO `sys_log` VALUES (46, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":0,\"name\":\"qw\",\"url\":\"qw\",\"perms\":\"\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":0}]', 3, '0:0:0:0:0:0:0:1', '2021-04-03 19:58:42');
INSERT INTO `sys_log` VALUES (47, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[49]', 24, '0:0:0:0:0:0:0:1', '2021-04-03 20:06:10');
INSERT INTO `sys_log` VALUES (48, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"qw1\",\"salt\":\"h9YySVHXL2G1JPTsQUjc\",\"email\":\"12345@qq.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 104, '0:0:0:0:0:0:0:1', '2021-04-05 19:46:48');
INSERT INTO `sys_log` VALUES (49, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[34,40,48,-666666,31,42]}]', 18, '0:0:0:0:0:0:0:1', '2021-04-05 19:48:24');
INSERT INTO `sys_log` VALUES (50, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":42,\"name\":\"充值入口\",\"url\":\"/emp/play\",\"perms\":\"\",\"type\":1,\"icon\":\"jiesuo\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-05 20:13:31');
INSERT INTO `sys_log` VALUES (51, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":42,\"name\":\"充值入口\",\"url\":\"/emp/toplay\",\"perms\":\"\",\"type\":1,\"icon\":\"jiesuo\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2021-04-05 20:26:12');
INSERT INTO `sys_log` VALUES (52, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,-666666]}]', 125, '0:0:0:0:0:0:0:1', '2021-04-06 18:58:20');
INSERT INTO `sys_log` VALUES (53, 'qw1', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"qw\",\"password\":\"8c03c63eaa80f22b937df72ba1d102e2b79dc211cd6d8d347cac332419427c8e\",\"salt\":\"eGwlXVO2EGLUk24mR9Yy\",\"email\":\"123@qq.com\",\"mobile\":\"19881700738\",\"status\":1,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Apr 8, 2021 7:32:09 PM\"}]', 94, '0:0:0:0:0:0:0:1', '2021-04-08 19:32:09');
INSERT INTO `sys_log` VALUES (54, 'qw1', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"qw_2\",\"remark\":\"测试\",\"createUserId\":2,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,-666666],\"createTime\":\"Apr 8, 2021 7:32:42 PM\"}]', 67, '0:0:0:0:0:0:0:1', '2021-04-08 19:32:42');
INSERT INTO `sys_log` VALUES (55, 'qw1', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":42,\"name\":\"查询入口\",\"url\":\"/comp/selectmess\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 9, '0:0:0:0:0:0:0:1', '2021-04-09 19:11:04');
INSERT INTO `sys_log` VALUES (56, 'qw1', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[50]', 20, '0:0:0:0:0:0:0:1', '2021-04-09 20:21:59');
INSERT INTO `sys_log` VALUES (57, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":42,\"name\":\"查询信息入口\",\"url\":\"/comp/selectmess\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 6, '0:0:0:0:0:0:0:1', '2021-04-09 20:23:05');
INSERT INTO `sys_log` VALUES (58, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,-666666]}]', 125, '0:0:0:0:0:0:0:1', '2021-04-09 20:23:33');
INSERT INTO `sys_log` VALUES (59, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":42,\"name\":\"生成数据\",\"url\":\"/comp/import\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 15, '0:0:0:0:0:0:0:1', '2021-04-10 20:21:19');
INSERT INTO `sys_log` VALUES (60, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,-666666]}]', 119, '0:0:0:0:0:0:0:1', '2021-04-10 20:23:00');
INSERT INTO `sys_log` VALUES (61, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"qw_2\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,-666666]}]', 65, '0:0:0:0:0:0:0:1', '2021-04-10 20:23:04');
INSERT INTO `sys_log` VALUES (62, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":42,\"name\":\"分享页面\",\"url\":\"/emp/share\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]', 16, '0:0:0:0:0:0:0:1', '2021-04-11 19:06:39');
INSERT INTO `sys_log` VALUES (63, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,-666666]}]', 136, '0:0:0:0:0:0:0:1', '2021-04-11 19:06:59');
INSERT INTO `sys_log` VALUES (64, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"qw_2\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,-666666]}]', 67, '0:0:0:0:0:0:0:1', '2021-04-11 19:07:02');
INSERT INTO `sys_log` VALUES (65, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":42,\"name\":\"支付记录\",\"url\":\"/emp/tpaylog\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]', 15, '0:0:0:0:0:0:0:1', '2021-04-12 19:52:47');
INSERT INTO `sys_log` VALUES (66, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":42,\"name\":\"意见反馈\",\"url\":\"/emp/sendmess\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-04-12 19:55:51');
INSERT INTO `sys_log` VALUES (67, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":42,\"name\":\"回复结果页面\",\"url\":\"/emp/backmess\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-12 19:57:51');
INSERT INTO `sys_log` VALUES (68, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":42,\"name\":\"处理邮件信息\",\"url\":\"/emp/handlemess\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 15, '0:0:0:0:0:0:0:1', '2021-04-13 19:41:56');
INSERT INTO `sys_log` VALUES (69, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":42,\"name\":\"审核页面\",\"url\":\"/comp/particulars1\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]', 16, '0:0:0:0:0:0:0:1', '2021-04-14 20:53:33');
INSERT INTO `sys_log` VALUES (70, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,-666666]}]', 158, '0:0:0:0:0:0:0:1', '2021-04-14 22:01:03');
INSERT INTO `sys_log` VALUES (71, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"qw_2\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,-666666]}]', 65, '0:0:0:0:0:0:0:1', '2021-04-14 22:01:07');
INSERT INTO `sys_log` VALUES (72, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":42,\"name\":\"申诉页面\",\"url\":\"/emp/addstaff\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0}]', 16, '0:0:0:0:0:0:0:1', '2021-04-15 19:27:49');
INSERT INTO `sys_log` VALUES (73, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":60,\"parentId\":42,\"name\":\"用户申诉处理页面\",\"url\":\"/emp/staff\",\"perms\":\"\",\"type\":1,\"icon\":\"tixing\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-04-15 19:47:19');
INSERT INTO `sys_log` VALUES (74, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":61,\"parentId\":42,\"name\":\"调查数据页面\",\"url\":\"/emp/survey\",\"perms\":\"\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":0}]', 18, '0:0:0:0:0:0:0:1', '2021-04-16 15:37:02');
INSERT INTO `sys_log` VALUES (75, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,59,60,61,-666666]}]', 135, '0:0:0:0:0:0:0:1', '2021-04-16 16:56:32');
INSERT INTO `sys_log` VALUES (76, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"qw_2\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,59,60,61,-666666]}]', 62, '0:0:0:0:0:0:0:1', '2021-04-16 16:56:36');
INSERT INTO `sys_log` VALUES (77, 'qw1', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":62,\"parentId\":42,\"name\":\"查看申诉信息\",\"url\":\"/emp/seestaff\",\"perms\":\"\",\"type\":1,\"icon\":\"oss\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-04-16 17:31:06');
INSERT INTO `sys_log` VALUES (78, 'qw1', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[62]', 16, '0:0:0:0:0:0:0:1', '2021-04-16 17:31:23');
INSERT INTO `sys_log` VALUES (79, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":63,\"parentId\":42,\"name\":\"查看申诉信息\",\"url\":\"/emp/seestaff\",\"perms\":\"\",\"type\":1,\"icon\":\"oss\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-04-16 17:32:10');
INSERT INTO `sys_log` VALUES (80, 'qw1', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"审核企业申请页面\",\"url\":\"emp/lastPass\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-04-16 20:22:01');
INSERT INTO `sys_log` VALUES (81, 'qw1', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":64,\"parentId\":31,\"name\":\"企业申请页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":0}]', 7, '0:0:0:0:0:0:0:1', '2021-04-16 20:23:53');
INSERT INTO `sys_log` VALUES (82, 'qw1', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[64]', 36, '0:0:0:0:0:0:0:1', '2021-04-16 20:25:03');
INSERT INTO `sys_log` VALUES (83, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":65,\"parentId\":0,\"name\":\"企业申请页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-04-16 20:26:20');
INSERT INTO `sys_log` VALUES (84, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":65,\"name\":\"企业申请入口\",\"url\":\"emp/addemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2021-04-16 20:26:40');
INSERT INTO `sys_log` VALUES (85, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":65,\"name\":\"企业申请信息\",\"url\":\"emp/seeemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2021-04-16 20:26:55');
INSERT INTO `sys_log` VALUES (86, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":66,\"parentId\":0,\"name\":\"用户申诉页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"config\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-04-16 20:27:43');
INSERT INTO `sys_log` VALUES (87, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":63,\"parentId\":66,\"name\":\"查看申诉信息\",\"url\":\"/emp/seestaff\",\"perms\":\"\",\"type\":1,\"icon\":\"oss\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-04-16 20:28:12');
INSERT INTO `sys_log` VALUES (88, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":59,\"parentId\":66,\"name\":\"申诉页面\",\"url\":\"/emp/addstaff\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-16 20:28:27');
INSERT INTO `sys_log` VALUES (89, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":67,\"parentId\":0,\"name\":\"企业使用页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"log\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-16 20:30:42');
INSERT INTO `sys_log` VALUES (90, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":48,\"parentId\":67,\"name\":\"我的信息\",\"url\":\"/emp/mymessage\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-16 20:31:04');
INSERT INTO `sys_log` VALUES (91, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":67,\"name\":\"充值入口\",\"url\":\"/emp/toplay\",\"perms\":\"\",\"type\":1,\"icon\":\"jiesuo\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-16 20:31:19');
INSERT INTO `sys_log` VALUES (92, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":67,\"name\":\"查询信息入口\",\"url\":\"/comp/selectmess\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-04-16 20:31:36');
INSERT INTO `sys_log` VALUES (93, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":52,\"parentId\":67,\"name\":\"生成数据\",\"url\":\"/comp/import\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-16 20:31:48');
INSERT INTO `sys_log` VALUES (94, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":53,\"parentId\":67,\"name\":\"分享页面\",\"url\":\"/emp/share\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-16 20:31:59');
INSERT INTO `sys_log` VALUES (95, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":54,\"parentId\":67,\"name\":\"支付记录\",\"url\":\"/emp/tpaylog\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-16 20:32:13');
INSERT INTO `sys_log` VALUES (96, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":56,\"parentId\":67,\"name\":\"回复结果页面\",\"url\":\"/emp/backmess\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-04-16 20:32:25');
INSERT INTO `sys_log` VALUES (97, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":55,\"parentId\":67,\"name\":\"意见反馈\",\"url\":\"/emp/sendmess\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2021-04-16 20:32:49');
INSERT INTO `sys_log` VALUES (98, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"审核企业及用户申请页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-04-16 20:34:28');
INSERT INTO `sys_log` VALUES (99, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[39]', 17, '0:0:0:0:0:0:0:1', '2021-04-16 20:35:02');
INSERT INTO `sys_log` VALUES (100, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[38]', 17, '0:0:0:0:0:0:0:1', '2021-04-16 20:35:17');
INSERT INTO `sys_log` VALUES (101, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[37]', 15, '0:0:0:0:0:0:0:1', '2021-04-16 20:35:25');
INSERT INTO `sys_log` VALUES (102, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":31,\"name\":\"企业申请分区\",\"url\":\"comp/categoryemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-16 20:36:50');
INSERT INTO `sys_log` VALUES (103, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-role\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,35,36,41,42,43,44,45,46,47,57,58,60,61,65,34,40,59,67,48,49,51,52,53,54,55,56,-666666,66]}]', 140, '0:0:0:0:0:0:0:1', '2021-04-17 15:40:41');
INSERT INTO `sys_log` VALUES (104, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"qw_2\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,33,35,36,41,42,43,44,45,46,47,57,58,60,61,65,34,40,59,67,48,49,51,52,53,54,55,56,-666666,66]}]', 68, '0:0:0:0:0:0:0:1', '2021-04-17 15:40:45');
INSERT INTO `sys_log` VALUES (105, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":68,\"parentId\":42,\"name\":\"日志记录\",\"url\":\"/emp/record\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-04-17 15:47:37');
INSERT INTO `sys_log` VALUES (106, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":58,\"parentId\":67,\"name\":\"审核页面\",\"url\":\"/comp/particulars1\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-04-17 16:01:45');
INSERT INTO `sys_log` VALUES (107, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"审核企业及用户申请页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":1}]', 12, '0:0:0:0:0:0:0:1', '2021-04-17 16:02:20');
INSERT INTO `sys_log` VALUES (108, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":58,\"parentId\":31,\"name\":\"审核页面\",\"url\":\"/comp/particulars1\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-04-17 16:02:54');
INSERT INTO `sys_log` VALUES (109, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":60,\"parentId\":31,\"name\":\"用户申诉处理页面\",\"url\":\"/emp/staff\",\"perms\":\"\",\"type\":1,\"icon\":\"tixing\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-04-17 16:03:12');
INSERT INTO `sys_log` VALUES (110, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[47]', 19, '0:0:0:0:0:0:0:1', '2021-04-17 16:03:28');
INSERT INTO `sys_log` VALUES (111, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":57,\"parentId\":31,\"name\":\"处理邮件信息\",\"url\":\"/emp/handlemess\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-04-17 16:03:44');
INSERT INTO `sys_log` VALUES (112, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":66,\"parentId\":0,\"name\":\"用户申诉页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"config\",\"orderNum\":2}]', 12, '0:0:0:0:0:0:0:1', '2021-04-17 16:04:34');
INSERT INTO `sys_log` VALUES (113, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"审核企业及用户申请页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2021-04-17 16:05:03');
INSERT INTO `sys_log` VALUES (114, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":42,\"name\":\"人员信息\",\"url\":\"emp/employee\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-04-17 16:05:15');
INSERT INTO `sys_log` VALUES (115, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":42,\"name\":\"地区三级分类\",\"url\":\"comp/category\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2021-04-17 16:05:35');
INSERT INTO `sys_log` VALUES (116, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":42,\"name\":\"企业详细信息展示\",\"url\":\"comp/categoryemployee\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2021-04-17 16:06:28');
INSERT INTO `sys_log` VALUES (117, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":58,\"parentId\":31,\"name\":\"上传信息审核页面\",\"url\":\"/comp/particulars1\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-04-17 16:08:39');
INSERT INTO `sys_log` VALUES (118, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":42,\"parentId\":0,\"name\":\"系统重要数据\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2021-04-17 16:10:09');
INSERT INTO `sys_log` VALUES (119, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":52,\"parentId\":67,\"name\":\"上传数据\",\"url\":\"/comp/import\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2021-04-17 16:13:19');
INSERT INTO `sys_log` VALUES (120, 'qw1', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"小明\",\"password\":\"99d334901fb7766703f50efe5182f360084d7e638461b8d154b785ef9a186697\",\"salt\":\"VIDtd0Or5CJmiGeprzIZ\",\"email\":\"123@qq.com\",\"mobile\":\"19881700703\",\"status\":1,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Apr 17, 2021 5:46:48 PM\"}]', 48, '0:0:0:0:0:0:0:1', '2021-04-17 17:46:48');
INSERT INTO `sys_log` VALUES (121, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"xm_1\",\"remark\":\"企业使用的权限\",\"createUserId\":1,\"menuIdList\":[67,48,49,51,52,53,54,55,56,-666666],\"createTime\":\"Apr 17, 2021 7:34:35 PM\"}]', 92, '0:0:0:0:0:0:0:1', '2021-04-17 19:34:35');
INSERT INTO `sys_log` VALUES (122, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":4,\"username\":\"小明\",\"salt\":\"VIDtd0Or5CJmiGeprzIZ\",\"email\":\"123@qq.com\",\"mobile\":\"19881700703\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1}]', 42, '0:0:0:0:0:0:0:1', '2021-04-17 19:35:33');
INSERT INTO `sys_log` VALUES (123, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"qw\",\"salt\":\"eGwlXVO2EGLUk24mR9Yy\",\"email\":\"123@qq.com\",\"mobile\":\"19881700738\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 16, '0:0:0:0:0:0:0:1', '2021-04-17 21:33:02');
INSERT INTO `sys_log` VALUES (124, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"qw1\",\"salt\":\"h9YySVHXL2G1JPTsQUjc\",\"email\":\"12345@qq.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 14, '0:0:0:0:0:0:0:1', '2021-04-17 21:33:15');
INSERT INTO `sys_log` VALUES (125, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"as\",\"password\":\"8eda8ca08de52e8d410c572d17ecc0021becd39a4f5427345a5d4871bd383af6\",\"salt\":\"h9YySVHXL2G1JPTsQUjc\",\"email\":\"12345@qq.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 16, '0:0:0:0:0:0:0:1', '2021-04-17 21:33:31');
INSERT INTO `sys_log` VALUES (126, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-企业使用\",\"remark\":\"人员投递简历人口\",\"createUserId\":1,\"menuIdList\":[65,34,40,-666666]}]', 20, '0:0:0:0:0:0:0:1', '2021-04-17 21:34:26');
INSERT INTO `sys_log` VALUES (127, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"as_申诉\",\"remark\":\"用户申诉\",\"createUserId\":1,\"menuIdList\":[66,59,63,-666666]}]', 17, '0:0:0:0:0:0:0:1', '2021-04-17 21:35:08');
INSERT INTO `sys_log` VALUES (128, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"qw-企业使用\",\"remark\":\"企业申请\",\"createUserId\":1,\"menuIdList\":[65,34,40,-666666]}]', 17, '0:0:0:0:0:0:0:1', '2021-04-17 21:35:25');
INSERT INTO `sys_log` VALUES (129, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"as_申诉使用\",\"remark\":\"用户申诉\",\"createUserId\":1,\"menuIdList\":[66,59,63,-666666]}]', 16, '0:0:0:0:0:0:0:1', '2021-04-17 21:35:37');
INSERT INTO `sys_log` VALUES (130, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[30]', 0, '0:0:0:0:0:0:0:1', '2021-04-17 21:36:19');
INSERT INTO `sys_log` VALUES (131, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[6]', 0, '0:0:0:0:0:0:0:1', '2021-04-17 21:36:46');
INSERT INTO `sys_log` VALUES (132, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[5]', 0, '0:0:0:0:0:0:0:1', '2021-04-17 21:37:06');
INSERT INTO `sys_log` VALUES (133, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"qw\",\"password\":\"d75d96292159b6197003f875fde5199084d0009c58bb15661810acdc4635e2c4\",\"salt\":\"eGwlXVO2EGLUk24mR9Yy\",\"email\":\"123@qq.com\",\"mobile\":\"19881700738\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 14, '0:0:0:0:0:0:0:1', '2021-04-17 21:38:28');
INSERT INTO `sys_log` VALUES (134, '小明', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '[{\"password\":\"19881700703\",\"newPassword\":\"123456\"}]', 21, '0:0:0:0:0:0:0:1', '2021-04-17 21:39:59');
INSERT INTO `sys_log` VALUES (135, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"xm_1\",\"remark\":\"企业使用的权限\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,3,19,20,21,22,67,48,49,51,52,53,54,55,56,-666666,1]}]', 28, '0:0:0:0:0:0:0:1', '2021-04-17 21:41:43');
INSERT INTO `sys_log` VALUES (136, '小明', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":5,\"username\":\"xm_1\",\"password\":\"8f89cc81fd9059ff741b9e64e3e120a8ca2a5a48932b005e5658d276785b00af\",\"salt\":\"HeUlwInFzV0x7scbs0zI\",\"email\":\"123@qq.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[],\"createUserId\":4,\"createTime\":\"Apr 17, 2021 9:43:06 PM\"}]', 24, '0:0:0:0:0:0:0:1', '2021-04-17 21:43:06');
INSERT INTO `sys_log` VALUES (137, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"xm_1\",\"remark\":\"企业使用的权限\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,67,48,49,51,52,53,54,55,56,-666666,1]}]', 25, '0:0:0:0:0:0:0:1', '2021-04-17 21:44:30');
INSERT INTO `sys_log` VALUES (138, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":5,\"username\":\"xm_1\",\"salt\":\"HeUlwInFzV0x7scbs0zI\",\"email\":\"123@qq.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1}]', 15, '0:0:0:0:0:0:0:1', '2021-04-17 21:46:57');
INSERT INTO `sys_log` VALUES (139, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[5]]', 7, '0:0:0:0:0:0:0:1', '2021-04-17 21:49:19');
INSERT INTO `sys_log` VALUES (140, '小明', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":6,\"username\":\"xm\",\"password\":\"d2d7307e533c8fa90a2ada2fd514feb6f4a468fcc698354b1fa55789fd467c22\",\"salt\":\"aVpbWfbHyx28oowM8k5z\",\"email\":\"123@qq.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[],\"createUserId\":4,\"createTime\":\"Apr 17, 2021 9:50:26 PM\"}]', 13, '0:0:0:0:0:0:0:1', '2021-04-17 21:50:26');
INSERT INTO `sys_log` VALUES (141, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"xm_1\",\"remark\":\"企业使用的权限\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,3,19,20,21,22,67,48,49,51,52,53,54,55,56,-666666,1]}]', 20, '0:0:0:0:0:0:0:1', '2021-04-17 21:51:18');
INSERT INTO `sys_log` VALUES (142, '小明', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":5,\"roleName\":\"xm_xm\",\"remark\":\"xm\",\"createUserId\":4,\"menuIdList\":[67,48,49,51,52,53,54,55,56,-666666],\"createTime\":\"Apr 17, 2021 9:52:24 PM\"}]', 14, '0:0:0:0:0:0:0:1', '2021-04-17 21:52:25');
INSERT INTO `sys_log` VALUES (143, '小明', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":5,\"roleName\":\"xm_xm\",\"remark\":\"xm\",\"createUserId\":4,\"menuIdList\":[51,-666666,67]}]', 17, '0:0:0:0:0:0:0:1', '2021-04-17 21:52:50');
INSERT INTO `sys_log` VALUES (144, '小明', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":6,\"username\":\"xm\",\"salt\":\"aVpbWfbHyx28oowM8k5z\",\"email\":\"123@qq.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[5],\"createUserId\":4}]', 12, '0:0:0:0:0:0:0:1', '2021-04-17 21:52:58');
INSERT INTO `sys_log` VALUES (145, '小明', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[5]]', 14, '0:0:0:0:0:0:0:1', '2021-04-17 21:55:40');
INSERT INTO `sys_log` VALUES (146, '小明', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[6]]', 4, '0:0:0:0:0:0:0:1', '2021-04-17 21:55:45');
INSERT INTO `sys_log` VALUES (147, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"审核企业及用户申请页面\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":1}]', 6, '0:0:0:0:0:0:0:1', '2021-04-18 19:33:28');
INSERT INTO `sys_log` VALUES (148, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":61,\"parentId\":31,\"name\":\"调查数据页面\",\"url\":\"/emp/survey\",\"perms\":\"\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2021-04-18 19:33:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 0, '审核企业及用户申请页面', '', '', 0, 'mudedi', 1);
INSERT INTO `sys_menu` VALUES (33, 42, '人员信息', 'emp/employee', '', 1, 'role', 0);
INSERT INTO `sys_menu` VALUES (34, 65, '企业申请入口', 'emp/addemployee', '', 1, 'daohang', 0);
INSERT INTO `sys_menu` VALUES (35, 42, '地区三级分类', 'comp/category', '', 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (36, 42, '企业详细信息展示', 'comp/categoryemployee', '', 1, 'geren', 0);
INSERT INTO `sys_menu` VALUES (40, 65, '企业申请信息', 'emp/seeemployee', '', 1, 'log', 0);
INSERT INTO `sys_menu` VALUES (41, 31, '审核企业申请页面', 'emp/lastPass', '', 1, 'daohang', 0);
INSERT INTO `sys_menu` VALUES (42, 0, '系统重要数据', '', '', 0, 'admin', 0);
INSERT INTO `sys_menu` VALUES (43, 42, '员工出勤情况', 'comp/performence', '', 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (44, 42, '员工大事件记录', 'comp/particulars', '', 1, 'config', 0);
INSERT INTO `sys_menu` VALUES (45, 42, '员工离职信息', 'comp/departure', '', 1, 'shanchu', 0);
INSERT INTO `sys_menu` VALUES (46, 42, '添加宣传视频', '/comp/uploadVideo', '', 1, 'shoucangfill', 0);
INSERT INTO `sys_menu` VALUES (48, 67, '我的信息', '/emp/mymessage', '', 1, 'admin', 0);
INSERT INTO `sys_menu` VALUES (49, 67, '充值入口', '/emp/toplay', '', 1, 'jiesuo', 0);
INSERT INTO `sys_menu` VALUES (51, 67, '查询信息入口', '/comp/selectmess', '', 1, 'log', 0);
INSERT INTO `sys_menu` VALUES (52, 67, '上传数据', '/comp/import', '', 1, 'daohang', 0);
INSERT INTO `sys_menu` VALUES (53, 67, '分享页面', '/emp/share', '', 1, 'zhedie', 0);
INSERT INTO `sys_menu` VALUES (54, 67, '支付记录', '/emp/tpaylog', '', 1, 'pinglun', 0);
INSERT INTO `sys_menu` VALUES (55, 67, '意见反馈', '/emp/sendmess', '', 1, 'daohang', 0);
INSERT INTO `sys_menu` VALUES (56, 67, '回复结果页面', '/emp/backmess', '', 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (57, 31, '处理邮件信息', '/emp/handlemess', '', 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (58, 31, '上传信息审核页面', '/comp/particulars1', '', 1, 'pinglun', 0);
INSERT INTO `sys_menu` VALUES (59, 66, '申诉页面', '/emp/addstaff', '', 1, 'role', 0);
INSERT INTO `sys_menu` VALUES (60, 31, '用户申诉处理页面', '/emp/staff', '', 1, 'tixing', 0);
INSERT INTO `sys_menu` VALUES (61, 31, '调查数据页面', '/emp/survey', '', 1, 'sousuo', 0);
INSERT INTO `sys_menu` VALUES (63, 66, '查看申诉信息', '/emp/seestaff', '', 1, 'oss', 0);
INSERT INTO `sys_menu` VALUES (65, 0, '企业申请页面', '', '', 0, 'menu', 0);
INSERT INTO `sys_menu` VALUES (66, 0, '用户申诉页面', '', '', 0, 'config', 2);
INSERT INTO `sys_menu` VALUES (67, 0, '企业使用页面', '', '', 0, 'log', 0);
INSERT INTO `sys_menu` VALUES (68, 42, '日志记录', '/emp/record', '', 1, 'log', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'qw-企业使用', '企业申请', 1, '2021-02-02 17:34:53');
INSERT INTO `sys_role` VALUES (2, 'as_申诉使用', '用户申诉', 1, '2021-04-08 19:32:42');
INSERT INTO `sys_role` VALUES (3, 'xm_1', '企业使用的权限', 1, '2021-04-17 19:34:35');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (731, 1, 65);
INSERT INTO `sys_role_menu` VALUES (732, 1, 34);
INSERT INTO `sys_role_menu` VALUES (733, 1, 40);
INSERT INTO `sys_role_menu` VALUES (734, 1, -666666);
INSERT INTO `sys_role_menu` VALUES (735, 2, 66);
INSERT INTO `sys_role_menu` VALUES (736, 2, 59);
INSERT INTO `sys_role_menu` VALUES (737, 2, 63);
INSERT INTO `sys_role_menu` VALUES (738, 2, -666666);
INSERT INTO `sys_role_menu` VALUES (776, 3, 2);
INSERT INTO `sys_role_menu` VALUES (777, 3, 15);
INSERT INTO `sys_role_menu` VALUES (778, 3, 16);
INSERT INTO `sys_role_menu` VALUES (779, 3, 17);
INSERT INTO `sys_role_menu` VALUES (780, 3, 18);
INSERT INTO `sys_role_menu` VALUES (781, 3, 3);
INSERT INTO `sys_role_menu` VALUES (782, 3, 19);
INSERT INTO `sys_role_menu` VALUES (783, 3, 20);
INSERT INTO `sys_role_menu` VALUES (784, 3, 21);
INSERT INTO `sys_role_menu` VALUES (785, 3, 22);
INSERT INTO `sys_role_menu` VALUES (786, 3, 67);
INSERT INTO `sys_role_menu` VALUES (787, 3, 48);
INSERT INTO `sys_role_menu` VALUES (788, 3, 49);
INSERT INTO `sys_role_menu` VALUES (789, 3, 51);
INSERT INTO `sys_role_menu` VALUES (790, 3, 52);
INSERT INTO `sys_role_menu` VALUES (791, 3, 53);
INSERT INTO `sys_role_menu` VALUES (792, 3, 54);
INSERT INTO `sys_role_menu` VALUES (793, 3, 55);
INSERT INTO `sys_role_menu` VALUES (794, 3, 56);
INSERT INTO `sys_role_menu` VALUES (795, 3, -666666);
INSERT INTO `sys_role_menu` VALUES (796, 3, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'as', '8eda8ca08de52e8d410c572d17ecc0021becd39a4f5427345a5d4871bd383af6', 'h9YySVHXL2G1JPTsQUjc', '12345@qq.com', '12345678912', 1, 1, '2021-02-02 17:32:48');
INSERT INTO `sys_user` VALUES (3, 'qw', 'd75d96292159b6197003f875fde5199084d0009c58bb15661810acdc4635e2c4', 'eGwlXVO2EGLUk24mR9Yy', '123@qq.com', '19881700738', 1, 1, '2021-04-08 19:32:09');
INSERT INTO `sys_user` VALUES (4, '小明', '7bfb263b0e907cb13c96550558595e3fe805b8d566218a2165d3b21cc0ae63ed', 'VIDtd0Or5CJmiGeprzIZ', '123@qq.com', '19881700703', 1, 1, '2021-04-17 17:46:48');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (3, 4, 3);
INSERT INTO `sys_user_role` VALUES (6, 2, 2);
INSERT INTO `sys_user_role` VALUES (7, 3, 1);
INSERT INTO `sys_user_role` VALUES (8, 5, 3);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'd9bc3c222954d945f299022b031001c6', '2021-04-19 08:31:54', '2021-04-18 20:31:54');
INSERT INTO `sys_user_token` VALUES (2, '3785cde970afe5de4e7c1bf3aba98a16', '2021-04-19 08:38:17', '2021-04-18 20:38:17');
INSERT INTO `sys_user_token` VALUES (3, '21eb1995a9128f269620e674f0b21180', '2021-04-18 09:38:41', '2021-04-17 21:38:41');
INSERT INTO `sys_user_token` VALUES (4, '81a986c01ffb522736b70ad86f6d6936', '2021-04-19 08:39:01', '2021-04-18 20:39:01');
INSERT INTO `sys_user_token` VALUES (5, '842b149bd89529c73bba6c99916f5c3a', '2021-04-18 09:48:11', '2021-04-17 21:48:11');
INSERT INTO `sys_user_token` VALUES (6, '50467e8b494795e4e739dc6d4142dcd7', '2021-04-18 09:53:16', '2021-04-17 21:53:16');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
