-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2025 at 02:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auth_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_modules', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:9:{i:0;O:8:\"stdClass\":11:{s:2:\"id\";i:2;s:4:\"name\";s:7:\"Profile\";s:5:\"route\";s:7:\"profile\";s:4:\"icon\";N;s:4:\"slug\";s:7:\"profile\";s:4:\"type\";s:10:\"permission\";s:9:\"parent_id\";i:1;s:5:\"order\";i:0;s:10:\"created_at\";s:19:\"2025-07-24 04:57:19\";s:10:\"updated_at\";s:19:\"2025-07-24 04:57:19\";s:15:\"show_in_sidebar\";i:1;}i:1;O:8:\"stdClass\":11:{s:2:\"id\";i:8;s:4:\"name\";s:9:\"User List\";s:5:\"route\";s:15:\"users.user_list\";s:4:\"icon\";s:12:\"fas fa-users\";s:4:\"slug\";s:9:\"User List\";s:4:\"type\";s:10:\"permission\";s:9:\"parent_id\";i:7;s:5:\"order\";i:0;s:10:\"created_at\";s:19:\"2025-08-04 07:47:39\";s:10:\"updated_at\";s:19:\"2025-08-04 07:47:39\";s:15:\"show_in_sidebar\";i:1;}i:2;O:8:\"stdClass\":11:{s:2:\"id\";i:9;s:4:\"name\";s:11:\"Master Data\";s:5:\"route\";s:1:\"#\";s:4:\"icon\";N;s:4:\"slug\";s:1:\"#\";s:4:\"type\";s:6:\"module\";s:9:\"parent_id\";N;s:5:\"order\";i:0;s:10:\"created_at\";s:19:\"2025-08-07 06:57:13\";s:10:\"updated_at\";s:19:\"2025-08-07 06:57:13\";s:15:\"show_in_sidebar\";i:1;}i:3;O:8:\"stdClass\":11:{s:2:\"id\";i:10;s:4:\"name\";s:4:\"Unit\";s:5:\"route\";s:10:\"unit.index\";s:4:\"icon\";N;s:4:\"slug\";s:9:\"Unit List\";s:4:\"type\";s:10:\"permission\";s:9:\"parent_id\";i:9;s:5:\"order\";i:0;s:10:\"created_at\";s:19:\"2025-08-07 06:58:12\";s:10:\"updated_at\";s:19:\"2025-08-07 06:58:12\";s:15:\"show_in_sidebar\";i:1;}i:4;O:8:\"stdClass\":11:{s:2:\"id\";i:11;s:4:\"name\";s:7:\"Modules\";s:5:\"route\";s:13:\"modules.index\";s:4:\"icon\";N;s:4:\"slug\";s:12:\"Modules List\";s:4:\"type\";s:10:\"permission\";s:9:\"parent_id\";i:9;s:5:\"order\";i:0;s:10:\"created_at\";s:19:\"2025-08-07 07:12:13\";s:10:\"updated_at\";s:19:\"2025-08-07 07:12:13\";s:15:\"show_in_sidebar\";i:1;}i:5;O:8:\"stdClass\":11:{s:2:\"id\";i:12;s:4:\"name\";s:17:\"Permission Assign\";s:5:\"route\";s:17:\"permission.assign\";s:4:\"icon\";N;s:4:\"slug\";s:6:\"Assign\";s:4:\"type\";s:10:\"permission\";s:9:\"parent_id\";i:7;s:5:\"order\";i:0;s:10:\"created_at\";s:19:\"2025-08-07 10:33:14\";s:10:\"updated_at\";s:19:\"2025-08-07 10:33:14\";s:15:\"show_in_sidebar\";i:0;}i:6;O:8:\"stdClass\":11:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"User\";s:5:\"route\";s:1:\"#\";s:4:\"icon\";s:12:\"fas fa-users\";s:4:\"slug\";s:1:\"#\";s:4:\"type\";s:6:\"module\";s:9:\"parent_id\";N;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-07-24 04:56:02\";s:10:\"updated_at\";s:19:\"2025-07-24 04:56:02\";s:15:\"show_in_sidebar\";i:1;}i:7;O:8:\"stdClass\":11:{s:2:\"id\";i:5;s:4:\"name\";s:4:\"Role\";s:5:\"route\";s:11:\"roles.index\";s:4:\"icon\";s:12:\"fas fa-users\";s:4:\"slug\";s:4:\"List\";s:4:\"type\";s:10:\"permission\";s:9:\"parent_id\";i:1;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-07-29 04:18:19\";s:10:\"updated_at\";s:19:\"2025-07-29 04:18:19\";s:15:\"show_in_sidebar\";i:1;}i:8;O:8:\"stdClass\":11:{s:2:\"id\";i:7;s:4:\"name\";s:8:\"Settings\";s:5:\"route\";s:1:\"#\";s:4:\"icon\";s:12:\"fas fa-users\";s:4:\"slug\";s:1:\"#\";s:4:\"type\";s:6:\"module\";s:9:\"parent_id\";N;s:5:\"order\";i:2;s:10:\"created_at\";s:19:\"2025-07-30 10:20:06\";s:10:\"updated_at\";s:19:\"2025-07-30 10:20:06\";s:15:\"show_in_sidebar\";i:1;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1754568044);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_16_094812_create_roles_table', 1),
(5, '2025_06_16_105458_create_modules_table', 1),
(6, '2025_06_19_024449_add_route_to_modules_table', 1),
(7, '2025_06_19_073549_create_permissions_table', 1),
(8, '2025_06_19_073602_create_role_module_permission_table', 1),
(9, '2025_06_21_054228_add_role_id_to_users_table', 1),
(10, '2025_06_21_111328_create_user_module_permission_table', 1),
(11, '2025_07_01_062056_add_icon_to_modules_table', 1),
(12, '2025_07_24_063616_create_user_module_permission_table', 2),
(13, '2025_08_07_045521_create_unit_table', 3),
(14, '2025_08_07_102223_add_show_in_sidebar_to_modules_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `type` enum('module','permission') NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_in_sidebar` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `route`, `icon`, `slug`, `type`, `parent_id`, `order`, `created_at`, `updated_at`, `show_in_sidebar`) VALUES
(1, 'User', '#', 'fas fa-users', '#', 'module', NULL, 1, '2025-07-23 22:56:02', '2025-07-23 22:56:02', 1),
(2, 'Profile', 'profile', NULL, 'profile', 'permission', 1, 0, '2025-07-23 22:57:19', '2025-07-23 22:57:19', 1),
(5, 'Role', 'roles.index', 'fas fa-users', 'List', 'permission', 1, 1, '2025-07-28 22:18:19', '2025-07-28 22:18:19', 1),
(7, 'Settings', '#', 'fas fa-users', '#', 'module', NULL, 2, '2025-07-30 04:20:06', '2025-07-30 04:20:06', 1),
(8, 'User List', 'users.user_list', 'fas fa-users', 'User List', 'permission', 7, 0, '2025-08-04 01:47:39', '2025-08-04 01:47:39', 1),
(9, 'Master Data', '#', NULL, '#', 'module', NULL, 0, '2025-08-07 00:57:13', '2025-08-07 00:57:13', 1),
(10, 'Unit', 'unit.index', NULL, 'Unit List', 'permission', 9, 0, '2025-08-07 00:58:12', '2025-08-07 00:58:12', 1),
(11, 'Modules', 'modules.index', NULL, 'Modules List', 'permission', 9, 0, '2025-08-07 01:12:13', '2025-08-07 01:12:13', 1),
(12, 'Permission Assign', 'permissions.assign-form', NULL, 'Assign', 'permission', 7, 0, '2025-08-07 04:33:14', '2025-08-07 04:33:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_module_permission`
--

CREATE TABLE `role_module_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4fE1JZ49jql87GBGx0BXN890gUYiXo0s7ADjhKtU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2VWV1czcWE1cm1uWnVSUmJQUnhrZ2pJTWJkaFdIa0NranBiT3paQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1754563593),
('AydqljvcurfJ1aSeH9qkjA7IzkUBkBcQ9dEPfYDy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM2didEpqdlJaNU5IWFZlRFJvcE01QU9TZHpLTDZTS0d6c3dkU1pUeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiTXVzaGZlcXVyIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGw0MXpjd2ZoOHU4cWpwQ0c5VWJjcmVxbmFsYVBKYXBNcndoaGR1REROVEVJenZrVDdxeVpPIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2Ijt9fQ==', 1754567990),
('ixhi3V2AklkYyo4XJvNQ3xyrmKSCfFCYgyTwJRrY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNkMwOTRBQU9HVms4MVpuUXcxNXM2MjFCeWtSTEVLazZvYzlESjFFMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiTXVzaGZlcXVyIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGw0MXpjd2ZoOHU4cWpwQ0c5VWJjcmVxbmFsYVBKYXBNcndoaGR1REROVEVJenZrVDdxeVpPIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2Ijt9fQ==', 1754563715),
('PvkQ6flUMNbeGHmmJvuMgLH4uwAjjWChP1DjDKDh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUHlIaHRtbHBCWVY1MHJhUTZGdkR2TGxWRHFoRnQzZ05NMjl2T3labCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yb3V0ZS1saXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjo5OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjk6Ik11c2hmZXF1ciI7czo1OiJlbWFpbCI7czo5OiJtZUBtZS5jb20iO3M6Nzoicm9sZV9pZCI7aToxO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMiRsNDF6Y3dmaDh1OHFqcENHOVViY3JlcW5hbGFQSmFwTXJ3aGhkdURETlRFSXp2a1Q3cXlaTyI7czoxNDoicmVtZW1iZXJfdG9rZW4iO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yMiAwNjozMzoxNiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yMiAwNjozMzoxNiI7fX0=', 1754568024),
('q9C5NcSsFX6KmHESQy9BpUbRrQZuUjJhNRC4sRnH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoianJEUGJ0QUN0UmxoeTJEZkVOa2lXRGVFUmpuMTFyaUZacDVGbFNPVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiTXVzaGZlcXVyIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGw0MXpjd2ZoOHU4cWpwQ0c5VWJjcmVxbmFsYVBKYXBNcndoaGR1REROVEVJenZrVDdxeVpPIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2Ijt9fQ==', 1754564212),
('qDjUQY2YWqvCRfFSkIrFi7XbHmqaf0pi9xlD3pHr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkswa2pOOW5sUzBDVGdOakh0RTJMTFZyT3BXaklsNTdLU0RDTzlIaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1754563610),
('S29opWCapNKuAYGhU6Wd0XOyxpLsHC06lJQ1N8aV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYUlaREswVTBzbzh2R2dIQlpaM2lWUjRnV0lsZWZWZFVTSUtLamNLdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiTXVzaGZlcXVyIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGw0MXpjd2ZoOHU4cWpwQ0c5VWJjcmVxbmFsYVBKYXBNcndoaGR1REROVEVJenZrVDdxeVpPIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2Ijt9fQ==', 1754563738);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
('AKL', 'Aboni Knitwear Limited', 'Hemayetpur', '2025-08-07 00:30:14', '2025-08-07 00:30:14'),
('BGL', 'Babylon Garments Limited', 'Mirpur', '2025-08-07 00:29:45', '2025-08-07 01:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mushfequr', 'me@me.com', 1, NULL, '$2y$12$l41zcwfh8u8qjpCG9UbcreqnalaPJapMrwhhduDDNTEIzvkT7qyZO', NULL, '2025-07-22 00:33:16', '2025-07-22 00:33:16'),
(2, 'test', 'test@test.com', 1, NULL, '$2y$12$alWYDhWcTREVQ6WmZStilecU7dWaj3rscMP.eEm/xqhAsUsuw6de6', NULL, '2025-07-28 02:10:18', '2025-07-28 02:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_module_permission`
--

CREATE TABLE `user_module_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_module_permission`
--

INSERT INTO `user_module_permission` (`id`, `user_id`, `module_id`, `created_at`, `updated_at`) VALUES
(83, 2, 2, NULL, NULL),
(106, 1, 10, NULL, NULL),
(107, 1, 11, NULL, NULL),
(108, 1, 2, NULL, NULL),
(109, 1, 5, NULL, NULL),
(110, 1, 8, NULL, NULL),
(111, 1, 12, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_module_permission`
--
ALTER TABLE `role_module_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_module_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_module_permission_module_id_foreign` (`module_id`),
  ADD KEY `role_module_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_module_permission`
--
ALTER TABLE `user_module_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_module_permission_user_id_module_id_unique` (`user_id`,`module_id`),
  ADD KEY `user_module_permission_module_id_foreign` (`module_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_module_permission`
--
ALTER TABLE `role_module_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_module_permission`
--
ALTER TABLE `user_module_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_module_permission`
--
ALTER TABLE `role_module_permission`
  ADD CONSTRAINT `role_module_permission_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_module_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_module_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_module_permission`
--
ALTER TABLE `user_module_permission`
  ADD CONSTRAINT `user_module_permission_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_module_permission_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
