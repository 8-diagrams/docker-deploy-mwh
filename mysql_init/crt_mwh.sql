-- --------------------------------------------------------
-- 主机:                           198.148.124.10
-- 服务器版本:                        5.7.40 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 mailwebhook 的数据库结构
CREATE DATABASE IF NOT EXISTS `mailwebhook` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mailwebhook`;

-- 导出  表 mailwebhook.domains 结构
CREATE TABLE IF NOT EXISTS `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) DEFAULT NULL,
  `dns_mx` varchar(255) DEFAULT NULL,
  `dns_ptr` varchar(255) DEFAULT NULL,
  `dns_spf` varchar(255) DEFAULT NULL,
  `dns_dmarc` text,
  `mx_valid` varchar(255) DEFAULT 'false',
  `spf_valid` varchar(255) DEFAULT 'false',
  `dmarc_valid` varchar(255) DEFAULT 'false',
  `domain_outer_ips` varchar(255) DEFAULT NULL,
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `send_count` int(11) NOT NULL DEFAULT '0',
  `recv_count` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `appid` varchar(32) DEFAULT NULL,
  `appsecret` varchar(50) DEFAULT NULL,
  `pem_private_key` text,
  `pem_cert` text,
  `dmarc_selector` varchar(50) DEFAULT 'default',
  `dmarc_key` text,
  `dmarc_txt` text,
  `rule_limit` int(11) DEFAULT '99999999',
  `rule_pwd` varchar(64) DEFAULT 'modify23-the01-pwd32',
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。

-- 导出  表 mailwebhook.mailaccounts 结构
CREATE TABLE IF NOT EXISTS `mailaccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_addr` varchar(255) DEFAULT NULL,
  `is_auto` int(11) DEFAULT '1',
  `receive_counts` int(11) DEFAULT '0',
  `parse_ok` int(11) DEFAULT '0',
  `parse_fail` int(11) DEFAULT '0',
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_passwd` varchar(255) DEFAULT NULL,
  `is_local` tinyint(4) DEFAULT '1',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_port` int(11) DEFAULT NULL,
  `smtp_ssl` int(11) DEFAULT '0',
  `smtp_tls` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addr` (`from_addr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。

-- 导出  表 mailwebhook.messages 结构
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_addr` varchar(250) NOT NULL,
  `from_name` varchar(250) NOT NULL,
  `to` varchar(250) DEFAULT NULL,
  `from_domain` varchar(250) DEFAULT NULL,
  `body` longtext,
  `subject` text,
  `parsed_code` varchar(32) DEFAULT NULL,
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `raw_mail_time` timestamp NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `is_read` int(11) DEFAULT '0',
  `ref_id` varchar(64) DEFAULT NULL,
  `msg_att` text,
  PRIMARY KEY (`id`),
  KEY `from_domain` (`from_domain`),
  KEY `c_time` (`c_time`),
  KEY `addr` (`from_addr`) USING BTREE,
  KEY `from` (`to`) USING BTREE,
  KEY `ref_id` (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126927 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。

-- 导出  表 mailwebhook.sendinglogs 结构
CREATE TABLE IF NOT EXISTS `sendinglogs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_id` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `from_addr` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `to` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `subject` varchar(512) DEFAULT NULL,
  `body` text,
  `raw_mail_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) DEFAULT NULL,
  `respond_code` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `respond_msg` text,
  `from_domain` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `to_domain` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`),
  KEY `from_addr` (`from_addr`),
  KEY `subject` (`subject`),
  KEY `to` (`to`),
  KEY `raw_mail_time` (`raw_mail_time`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='sending out logs';

-- 数据导出被取消选择。

-- 导出  表 mailwebhook.stconfigs 结构
CREATE TABLE IF NOT EXISTS `stconfigs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configs` text,
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1412 DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。

-- 导出  表 mailwebhook.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `passwd_hash` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。

-- 导出  表 mailwebhook.webhooklogs 结构
CREATE TABLE IF NOT EXISTS `webhooklogs` (
  `id` int(11) DEFAULT NULL,
  `addr` varchar(250) DEFAULT NULL,
  `from_addr` varchar(250) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `target` varchar(250) DEFAULT NULL,
  `body` text,
  `response` text,
  `res_status_code` int(11) DEFAULT NULL,
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。

-- 导出  表 mailwebhook.webhookrules 结构
CREATE TABLE IF NOT EXISTS `webhookrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_match_rules` varchar(255) DEFAULT NULL,
  `to_match_rules` varchar(255) DEFAULT NULL,
  `sub_match_rules` varchar(255) DEFAULT NULL,
  `target` varchar(512) DEFAULT NULL,
  `ok_count` int(11) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `direction` varchar(16) DEFAULT NULL COMMENT 'IN mail recv  OUT mail send',
  `send_status` varchar(50) DEFAULT NULL COMMENT 'OK send ok FAIL send fail, only for sending mail',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
