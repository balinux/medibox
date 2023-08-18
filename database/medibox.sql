-- -------------------------------------------------------------
-- TablePlus 5.3.8(500)
--
-- https://tableplus.com/
--
-- Database: medibox
-- Generation Time: 2023-08-17 19:34:57.4260
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `drug_shelves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shelf_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `medications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `medication_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dosage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `shelf_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medications_user_id_foreign` (`user_id`),
  KEY `medications_shelf_id_foreign` (`shelf_id`),
  CONSTRAINT `medications_shelf_id_foreign` FOREIGN KEY (`shelf_id`) REFERENCES `drug_shelves` (`id`),
  CONSTRAINT `medications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pill_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `medication_id` bigint unsigned NOT NULL,
  `dosage_taken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pill_histories_user_id_foreign` (`user_id`),
  KEY `pill_histories_medication_id_foreign` (`medication_id`),
  CONSTRAINT `pill_histories_medication_id_foreign` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`id`),
  CONSTRAINT `pill_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reminders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `medication_id` bigint unsigned NOT NULL,
  `reminder_datetime` datetime NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminders_user_id_foreign` (`user_id`),
  KEY `reminders_medication_id_foreign` (`medication_id`),
  CONSTRAINT `reminders_medication_id_foreign` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`id`),
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `drug_shelves` (`id`, `shelf_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'box 1', 'box 1 obat kering', '2023-08-17 02:15:50', '2023-08-17 02:15:50'),
(2, 'box 2', 'box 2', '2023-08-17 03:16:33', '2023-08-17 03:16:33');

INSERT INTO `medications` (`id`, `user_id`, `medication_name`, `dosage`, `image`, `start_date`, `end_date`, `frequency`, `notes`, `shelf_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'asd', 'asd', 'EAjt4TO98NnyI20Of8mHTXplussFp2-metaU2NyZWVuc2hvdCAyMDIzLTAxLTI4IGF0IDE2LjMxLjI1LnBuZw==-.png', '2023-08-17', '2023-08-18', '22', 'asd', 1, '2023-08-17 02:19:36', '2023-08-17 02:19:36'),
(2, 2, 'zxc', '22', 'RqNuwemZ7RfE98Jg3IpCD26Or8BHZK-metaU2NyZWVuc2hvdCAyMDIzLTA3LTI2IGF0IDA3LjM4LjIwLnBuZw==-.png', '2023-08-17', '2023-08-17', '33', '22', 1, '2023-08-17 03:14:53', '2023-08-17 03:14:53'),
(3, 1, 'ccc', '22', 'qGfJbhakAxeBgn2M5STWCwnnWfXhZo-metaU2NyZWVuc2hvdCAyMDIzLTA3LTI2IGF0IDEwLjAxLjMwLnBuZw==-.png', '2023-08-17', '2023-08-24', '12', '12', 2, '2023-08-17 03:17:29', '2023-08-17 03:17:29');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_14_040521_create_drug_shelves_table', 1),
(6, '2023_08_14_054319_create_medications_table', 1),
(7, '2023_08_14_061725_create_reminders_table', 1),
(8, '2023_08_14_070108_create_pill_histories_table', 1);

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'd06d87e155101727981c3b2208f077f8fb53803fe3ea4ef7dd0654b82845bd80', '[\"*\"]', '2023-08-17 09:08:04', NULL, '2023-08-17 02:14:46', '2023-08-17 09:08:04'),
(2, 'App\\Models\\User', 2, 'auth_token', '3ba4b6b1879247cfd39c03afbcebe665fb09f6a30a61a049174a641d615c4830', '[\"*\"]', NULL, NULL, '2023-08-17 03:13:08', '2023-08-17 03:13:08'),
(3, 'App\\Models\\User', 1, 'auth_token', 'ecd12c1069b9d8e4e673ba02f38f87f3465cd111460073404ac6700b2d70cf7e', '[\"*\"]', NULL, NULL, '2023-08-17 03:14:59', '2023-08-17 03:14:59'),
(4, 'App\\Models\\User', 1, 'auth_token', 'c738247ba6200e825026b4ba2c3512a562394659d06b24667c5dbaf2c2be887c', '[\"*\"]', '2023-08-17 17:21:30', NULL, '2023-08-17 08:58:15', '2023-08-17 17:21:30');

INSERT INTO `reminders` (`id`, `user_id`, `medication_id`, `reminder_datetime`, `is_completed`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-08-17 17:20:44', 1, '2023-08-17 02:22:51', '2023-08-17 17:21:35'),
(2, 1, 3, '2023-08-17 17:22:06', 0, '2023-08-17 07:28:11', '2023-08-17 17:21:02');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'ryojuniyantara@gmail.com', NULL, '$2y$10$AbfwsqbGqdFMq.HyQ04i3uAJMGpp2R47.XbC2036eM2uHJDWWncC6', NULL, '2023-08-17 02:10:04', '2023-08-17 02:10:04'),
(2, 'rio', 'rio@medibox.com', NULL, '$2y$10$8cY0efDTwnQNt/Z761L0KuDHIqbSlUB9HI1UMlR6ZhJiezJKh5Tt.', NULL, '2023-08-17 03:13:08', '2023-08-17 03:13:08');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;