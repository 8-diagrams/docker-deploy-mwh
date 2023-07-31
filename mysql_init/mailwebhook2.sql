-- --------------------------------------------------------
-- 主机:                           107.175.219.114
-- 服务器版本:                        5.7.39 - MySQL Community Server (GPL)
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

-- 导出  表 webmailhook.domains 结构
CREATE TABLE IF NOT EXISTS `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) DEFAULT NULL,
  `dns_mx` varchar(255) DEFAULT NULL,
  `dns_ptr` varchar(255) DEFAULT NULL,
  `dns_spf` varchar(255) DEFAULT NULL,
  `dns_dmarc` varchar(255) DEFAULT NULL,
  `mx_valid` varchar(255) DEFAULT 'false',
  `spf_valid` varchar(255) DEFAULT 'false',
  `dmarc_valid` varchar(255) DEFAULT 'false',
  `domain_outer_ips` varchar(255) DEFAULT NULL,
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `send_count` int(11) NOT NULL DEFAULT 0,
  `recv_count` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  webmailhook.domains 的数据：~0 rows (大约)

-- 导出  表 webmailhook.mailaccounts 结构
CREATE TABLE IF NOT EXISTS `mailaccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) DEFAULT NULL,
  `is_auto` int(11) DEFAULT NULL,
  `receive_counts` int(11) DEFAULT '0',
  `parse_ok` int(11) DEFAULT '0',
  `parse_fail` int(11) DEFAULT '0',
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addr` (`addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  webmailhook.mailaccounts 的数据：~0 rows (大约)

-- 导出  表 webmailhook.messages 结构
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(250) NOT NULL,
  `from` varchar(250) DEFAULT NULL,
  `from_domain` varchar(250) DEFAULT NULL,
  `body` text,
  `parsed_code` varchar(32) DEFAULT NULL,
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `raw_mail_time` timestamp NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addr` (`addr`),
  KEY `from` (`from`),
  KEY `from_domain` (`from_domain`),
  KEY `c_time` (`c_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  webmailhook.messages 的数据：~0 rows (大约)

-- 导出  表 webmailhook.stconfigs 结构
CREATE TABLE IF NOT EXISTS `stconfigs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configs` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

-- 正在导出表  webmailhook.stconfigs 的数据：~1 rows (大约)
INSERT IGNORE INTO `stconfigs` (`id`, `configs`) VALUES
	(1000, '{}');

-- 导出  表 webmailhook.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `passwd_hash` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uname` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  webmailhook.users 的数据：~0 rows (大约)

-- 导出  表 webmailhook.webhooklogs 结构
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

-- 正在导出表  webmailhook.webhooklogs 的数据：~0 rows (大约)

-- 导出  表 webmailhook.webhookrules 结构
CREATE TABLE IF NOT EXISTS `webhookrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_match_rules` varchar(255) DEFAULT NULL,
  `to_match_rules` varchar(255) DEFAULT NULL,
  `sub_match_rules` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `ok_count` int(11) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  webmailhook.webhookrules 的数据：~0 rows (大约)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
