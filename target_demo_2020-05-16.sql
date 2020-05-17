# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29-0ubuntu0.18.04.1)
# Database: target_demo
# Generation Time: 2020-05-16 23:43:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'test','test@test.com',NULL,'$2y$10$i93NXJ8gpZyxaQf0QE3KgOkOXaZ38CA0pli.a2pTIauVw/DBqCHs.',NULL,'2020-05-16 15:12:34','2020-05-16 03:12:34'),
	(2,'admin','admin@admin.com',NULL,'$2y$10$rTWKhiJWpLsCcgE4YbfL1uyAubPUnGH1FNokiYi12XOexOZhpMlU2',NULL,'2020-05-16 15:48:14','2020-05-16 15:48:14'),
	(3,'customer','customer@customer.com',NULL,'$2y$10$9.7d7zE7Av0q9l9sCH/1WO.q7Ol3vu8NyuCVXxtH1x/idzt1lqXUq',NULL,'2020-05-16 15:52:10','2020-05-16 15:52:10'),
	(4,'customer1','customer1@customer1.com',NULL,'$2y$10$q93E7AvtMAjs4MsFpiv9Auw.JfYA09OtMNLAdrW8RadxuHJ7rGJ2m',NULL,'2020-05-16 16:24:21','2020-05-16 16:24:21');

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table login_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_activity`;

CREATE TABLE `login_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login_activity_customer_id_foreign` (`customer_id`),
  CONSTRAINT `login_activity_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `login_activity` WRITE;
/*!40000 ALTER TABLE `login_activity` DISABLE KEYS */;

INSERT INTO `login_activity` (`id`, `customer_id`, `email_address`, `ip_address`, `created_at`, `updated_at`, `is_success`)
VALUES
	(1,1,'test@test.com','192.168.10.1','2020-05-16 15:47:28','2020-05-16 15:47:28',1),
	(2,2,'admin@admin.com','192.168.10.1','2020-05-16 15:48:58','2020-05-16 15:48:58',1),
	(3,3,'customer@customer.com','192.168.10.1','2020-05-16 15:52:30','2020-05-16 15:52:30',1),
	(4,NULL,'test99@test99.com','192.168.10.1','2020-05-16 15:53:31','2020-05-16 15:53:31',0),
	(5,1,'test@test.com','192.168.10.1','2020-05-16 15:54:00','2020-05-16 15:54:00',0),
	(6,3,'customer@customer.com','192.168.10.1','2020-05-16 15:54:15','2020-05-16 15:54:15',0),
	(7,3,'customer@customer.com','192.168.10.1','2020-05-16 15:54:22','2020-05-16 15:54:22',1),
	(8,2,'admin@admin.com','192.168.10.1','2020-05-16 15:54:45','2020-05-16 15:54:45',0),
	(9,2,'admin@admin.com','192.168.10.1','2020-05-16 15:54:50','2020-05-16 15:54:50',1),
	(10,NULL,'customer21@example.com','192.168.10.1','2020-05-16 16:24:59','2020-05-16 16:24:59',0),
	(11,4,'customer1@customer1.com','192.168.10.1','2020-05-16 16:25:29','2020-05-16 16:25:29',0),
	(12,4,'customer1@customer1.com','192.168.10.1','2020-05-16 16:25:40','2020-05-16 16:25:40',1),
	(13,2,'admin@admin.com','192.168.10.1','2020-05-16 16:25:58','2020-05-16 16:25:58',0),
	(14,2,'admin@admin.com','192.168.10.1','2020-05-16 16:26:03','2020-05-16 16:26:03',1),
	(15,NULL,'admin@admin','192.168.10.1','2020-05-16 16:27:19','2020-05-16 16:27:19',0),
	(16,NULL,'admin@admin','192.168.10.1','2020-05-16 16:27:23','2020-05-16 16:27:23',0),
	(17,NULL,'admin@admin','192.168.10.1','2020-05-16 16:27:28','2020-05-16 16:27:28',0),
	(18,NULL,'admin@admin','192.168.10.1','2020-05-16 16:27:33','2020-05-16 16:27:33',0),
	(19,2,'admin@admin.com','192.168.10.1','2020-05-16 16:27:45','2020-05-16 16:27:45',0),
	(20,2,'admin@admin.com','192.168.10.1','2020-05-16 16:27:49','2020-05-16 16:27:49',0),
	(21,2,'admin@admin.com','192.168.10.1','2020-05-16 16:27:54','2020-05-16 16:27:54',1),
	(22,1,'test@test.com','192.168.10.1','2020-05-16 16:29:03','2020-05-16 16:29:03',1);

/*!40000 ALTER TABLE `login_activity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_100000_create_password_resets_table',1),
	(2,'2019_08_19_000000_create_failed_jobs_table',1),
	(3,'2020_05_15_000000_create_customers_table',1),
	(4,'2020_05_16_073339_create_login_activity_table',2),
	(5,'2020_05_16_180708_add_is_success',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
