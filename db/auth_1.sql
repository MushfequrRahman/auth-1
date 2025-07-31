-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 07:52 AM
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
('laravel_cache_modules', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:8:\"stdClass\":10:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"User\";s:5:\"route\";s:1:\"#\";s:4:\"icon\";s:12:\"fas fa-users\";s:4:\"slug\";s:1:\"#\";s:4:\"type\";s:6:\"module\";s:9:\"parent_id\";N;s:5:\"order\";i:0;s:10:\"created_at\";s:19:\"2025-07-24 04:56:02\";s:10:\"updated_at\";s:19:\"2025-07-24 04:56:02\";}i:1;O:8:\"stdClass\":10:{s:2:\"id\";i:2;s:4:\"name\";s:7:\"Profile\";s:5:\"route\";s:7:\"profile\";s:4:\"icon\";N;s:4:\"slug\";s:7:\"profile\";s:4:\"type\";s:10:\"permission\";s:9:\"parent_id\";i:1;s:5:\"order\";i:0;s:10:\"created_at\";s:19:\"2025-07-24 04:57:19\";s:10:\"updated_at\";s:19:\"2025-07-24 04:57:19\";}i:2;O:8:\"stdClass\":10:{s:2:\"id\";i:5;s:4:\"name\";s:4:\"Role\";s:5:\"route\";s:11:\"roles.index\";s:4:\"icon\";s:12:\"fas fa-users\";s:4:\"slug\";s:4:\"List\";s:4:\"type\";s:10:\"permission\";s:9:\"parent_id\";i:1;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-07-29 04:18:19\";s:10:\"updated_at\";s:19:\"2025-07-29 04:18:19\";}i:3;O:8:\"stdClass\":10:{s:2:\"id\";i:7;s:4:\"name\";s:8:\"Settings\";s:5:\"route\";s:1:\"#\";s:4:\"icon\";s:12:\"fas fa-users\";s:4:\"slug\";s:1:\"#\";s:4:\"type\";s:6:\"module\";s:9:\"parent_id\";N;s:5:\"order\";i:1;s:10:\"created_at\";s:19:\"2025-07-30 10:20:06\";s:10:\"updated_at\";s:19:\"2025-07-30 10:20:06\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1753935053);

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
(12, '2025_07_24_063616_create_user_module_permission_table', 2);

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `route`, `icon`, `slug`, `type`, `parent_id`, `order`, `created_at`, `updated_at`) VALUES
(1, 'User', '#', 'fas fa-users', '#', 'module', NULL, 0, '2025-07-23 22:56:02', '2025-07-23 22:56:02'),
(2, 'Profile', 'profile', NULL, 'profile', 'permission', 1, 0, '2025-07-23 22:57:19', '2025-07-23 22:57:19'),
(5, 'Role', 'roles.index', 'fas fa-users', 'List', 'permission', 1, 1, '2025-07-28 22:18:19', '2025-07-28 22:18:19'),
(7, 'Settings', '#', 'fas fa-users', '#', 'module', NULL, 1, '2025-07-30 04:20:06', '2025-07-30 04:20:06');

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
('40rLgkOBBDihwgrzfsZ94OocPWoBW9rHBrZI42bl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjM6e2k6MDtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO047czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6MjtzOjQ6Im5hbWUiO3M6NzoiUHJvZmlsZSI7czo1OiJyb3V0ZSI7czo3OiJwcm9maWxlIjtzOjQ6Imljb24iO047czo0OiJzbHVnIjtzOjc6InByb2ZpbGUiO3M6NDoidHlwZSI7czoxMDoicGVybWlzc2lvbiI7czo5OiJwYXJlbnRfaWQiO2k6MTtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7fWk6MjtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aTo1O3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjExOiJyb2xlcy5pbmRleCI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czo0OiJMaXN0IjtzOjQ6InR5cGUiO3M6MTA6InBlcm1pc3Npb24iO3M6OToicGFyZW50X2lkIjtpOjE7czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjY6Il90b2tlbiI7czo0MDoibEljNHZSWGJNTHlPNnNWaWNhUmdEMVlzaU1JUlpOTDNMbHJYYkxiRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9maWxlIjt9czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjo5OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjk6Ik11c2hmZXF1ciI7czo1OiJlbWFpbCI7czo5OiJtZUBtZS5jb20iO3M6Nzoicm9sZV9pZCI7aToxO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMiRsNDF6Y3dmaDh1OHFqcENHOVViY3JlcW5hbGFQSmFwTXJ3aGhkdURETlRFSXp2a1Q3cXlaTyI7czoxNDoicmVtZW1iZXJfdG9rZW4iO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yMiAwNjozMzoxNiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yMiAwNjozMzoxNiI7fX0=', 1753873893),
('8pZxNA1cNCkYKYmKYhwstVpFauSHVgGJA9H2VIEU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjQ6e2k6MDtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO047czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6MjtzOjQ6Im5hbWUiO3M6NzoiUHJvZmlsZSI7czo1OiJyb3V0ZSI7czo3OiJwcm9maWxlIjtzOjQ6Imljb24iO047czo0OiJzbHVnIjtzOjc6InByb2ZpbGUiO3M6NDoidHlwZSI7czoxMDoicGVybWlzc2lvbiI7czo5OiJwYXJlbnRfaWQiO2k6NDtzOjU6Im9yZGVyIjtpOjA7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7fWk6MjtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aTo0O3M6NDoibmFtZSI7czoxMzoiVXNlciBTZXR0aW5ncyI7czo1OiJyb3V0ZSI7czoxOiIjIjtzOjQ6Imljb24iO3M6MTI6ImZhcyBmYS11c2VycyI7czo0OiJzbHVnIjtzOjE6IiMiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6OToicGFyZW50X2lkIjtpOjE7czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjggMDc6NTc6MjkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjggMDc6NTc6MjkiO31pOjM7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6NTtzOjQ6Im5hbWUiO3M6NDoiUm9sZSI7czo1OiJyb3V0ZSI7czoxMToicm9sZXMuaW5kZXgiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6NDoiTGlzdCI7czo0OiJ0eXBlIjtzOjEwOiJwZXJtaXNzaW9uIjtzOjk6InBhcmVudF9pZCI7aTo0O3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI5IDA0OjE4OjE5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI5IDA0OjE4OjE5Ijt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6Im9tbmMyaDc5Q2toUDF4WEhMUmdOSnNXdVY2dER6UFpidk1xTDJ1MjMiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcm9sZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiTXVzaGZlcXVyIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGw0MXpjd2ZoOHU4cWpwQ0c5VWJjcmVxbmFsYVBKYXBNcndoaGR1REROVEVJenZrVDdxeVpPIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2Ijt9fQ==', 1753877317),
('8udxU74PUxYnhG3KTWGMUlxkzzWRkNdYdf0QOI2M', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjQ6e2k6MDtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO047czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6NTtzOjQ6Im5hbWUiO3M6NDoiUm9sZSI7czo1OiJyb3V0ZSI7czoxMToicm9sZXMuaW5kZXgiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6NDoiTGlzdCI7czo0OiJ0eXBlIjtzOjEwOiJwZXJtaXNzaW9uIjtzOjk6InBhcmVudF9pZCI7aTo2O3M6NToib3JkZXIiO2k6MDtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI5IDA0OjE4OjE5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI5IDA0OjE4OjE5Ijt9aToyO086ODoic3RkQ2xhc3MiOjEwOntzOjI6ImlkIjtpOjY7czo0OiJuYW1lIjtzOjg6IlNldHRpbmdzIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO2k6MTtzOjU6Im9yZGVyIjtpOjA7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0zMCAwOToxMjowNiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0zMCAwOToxMjowNiI7fWk6MztPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToyO3M6NDoibmFtZSI7czo3OiJQcm9maWxlIjtzOjU6InJvdXRlIjtzOjc6InByb2ZpbGUiO3M6NDoiaWNvbiI7TjtzOjQ6InNsdWciO3M6NzoicHJvZmlsZSI7czo0OiJ0eXBlIjtzOjEwOiJwZXJtaXNzaW9uIjtzOjk6InBhcmVudF9pZCI7aTo2O3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI0IDA0OjU3OjE5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI0IDA0OjU3OjE5Ijt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6IjVWM3h0UEcyTm9LcUtBemJFUDJwQVlqV3liWHk0RXJ3SzM3bUN4MWYiO3M6NjoiX2ZsYXNoIjthOjI6e3M6MzoibmV3IjthOjA6e31zOjM6Im9sZCI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcHJvZmlsZSI7fXM6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6OTp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo5OiJNdXNoZmVxdXIiO3M6NToiZW1haWwiO3M6OToibWVAbWUuY29tIjtzOjc6InJvbGVfaWQiO2k6MTtzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7TjtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIkbDQxemN3Zmg4dThxanBDRzlVYmNyZXFuYWxhUEphcE1yd2hoZHVERE5URUl6dmtUN3F5Wk8iO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjIgMDY6MzM6MTYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjIgMDY6MzM6MTYiO319', 1753875277),
('AcXPIdcpgWoGmxjcBUONLLjzkzWhIBaIc8P4EvMO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjQ6e2k6MDtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO047czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6MjtzOjQ6Im5hbWUiO3M6NzoiUHJvZmlsZSI7czo1OiJyb3V0ZSI7czo3OiJwcm9maWxlIjtzOjQ6Imljb24iO047czo0OiJzbHVnIjtzOjc6InByb2ZpbGUiO3M6NDoidHlwZSI7czoxMDoicGVybWlzc2lvbiI7czo5OiJwYXJlbnRfaWQiO2k6MTtzOjU6Im9yZGVyIjtpOjA7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7fWk6MjtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aTo1O3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjExOiJyb2xlcy5pbmRleCI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czo0OiJMaXN0IjtzOjQ6InR5cGUiO3M6MTA6InBlcm1pc3Npb24iO3M6OToicGFyZW50X2lkIjtpOjc7czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO31pOjM7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6NztzOjQ6Im5hbWUiO3M6ODoiU2V0dGluZ3MiO3M6NToicm91dGUiO3M6MToiIyI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czoxOiIjIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjk6InBhcmVudF9pZCI7aToxO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTMwIDEwOjIwOjA2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTMwIDEwOjIwOjA2Ijt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6ImhvOTdjbW5wQVJ6TzFnbDFoSmhjRzVYTDl6VXZod2cxdGRRajVPTjAiO3M6NjoiX2ZsYXNoIjthOjI6e3M6MzoibmV3IjthOjA6e31zOjM6Im9sZCI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO319', 1753877134),
('Al9jh73Ie8HjgHdzynSZ03KZDcWk1dWXWnX0RgnC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSUNUZG9FSGFSQXNnS1JSVXJTSmFxRWV6bXN6VHBSUzlETEVsUjQ2ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nZXQtdXNlci1wZXJtaXNzaW9ucz91c2VyX2lkPTIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiTXVzaGZlcXVyIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGw0MXpjd2ZoOHU4cWpwQ0c5VWJjcmVxbmFsYVBKYXBNcndoaGR1REROVEVJenZrVDdxeVpPIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2Ijt9fQ==', 1753935017),
('IJ84udvHqmejS8nm32xm0OP8o9ZQaOrf1bluLLOf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjQ6e2k6MDtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO047czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6MjtzOjQ6Im5hbWUiO3M6NzoiUHJvZmlsZSI7czo1OiJyb3V0ZSI7czo3OiJwcm9maWxlIjtzOjQ6Imljb24iO047czo0OiJzbHVnIjtzOjc6InByb2ZpbGUiO3M6NDoidHlwZSI7czoxMDoicGVybWlzc2lvbiI7czo5OiJwYXJlbnRfaWQiO2k6NztzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7fWk6MjtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aTo1O3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjExOiJyb2xlcy5pbmRleCI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czo0OiJMaXN0IjtzOjQ6InR5cGUiO3M6MTA6InBlcm1pc3Npb24iO3M6OToicGFyZW50X2lkIjtpOjc7czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO31pOjM7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6NztzOjQ6Im5hbWUiO3M6ODoiU2V0dGluZ3MiO3M6NToicm91dGUiO3M6MToiIyI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czoxOiIjIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjk6InBhcmVudF9pZCI7aToxO3M6NToib3JkZXIiO2k6MDtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTMwIDEwOjIwOjA2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTMwIDEwOjIwOjA2Ijt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6Im5WN01rZ3JIQUV5VlNNRFp2bjRkbDVXaVFyR05sbW1TeDZBY3JNUnQiO3M6NjoiX2ZsYXNoIjthOjI6e3M6MzoibmV3IjthOjA6e31zOjM6Im9sZCI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcHJvZmlsZSI7fXM6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6OTp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo5OiJNdXNoZmVxdXIiO3M6NToiZW1haWwiO3M6OToibWVAbWUuY29tIjtzOjc6InJvbGVfaWQiO2k6MTtzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7TjtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIkbDQxemN3Zmg4dThxanBDRzlVYmNyZXFuYWxhUEphcE1yd2hoZHVERE5URUl6dmtUN3F5Wk8iO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjIgMDY6MzM6MTYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjIgMDY6MzM6MTYiO319', 1753873650),
('sv1SuDhZ5vTK7b5ynY43no0BFuFOUWnMrqEX4Uw3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjM6e2k6MDtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO047czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6NTtzOjQ6Im5hbWUiO3M6NDoiUm9sZSI7czo1OiJyb3V0ZSI7czoxMToicm9sZXMuaW5kZXgiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6NDoiTGlzdCI7czo0OiJ0eXBlIjtzOjEwOiJwZXJtaXNzaW9uIjtzOjk6InBhcmVudF9pZCI7aToxO3M6NToib3JkZXIiO2k6MDtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI5IDA0OjE4OjE5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI5IDA0OjE4OjE5Ijt9aToyO086ODoic3RkQ2xhc3MiOjEwOntzOjI6ImlkIjtpOjI7czo0OiJuYW1lIjtzOjc6IlByb2ZpbGUiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7czo0OiJpY29uIjtOO3M6NDoic2x1ZyI7czo3OiJwcm9maWxlIjtzOjQ6InR5cGUiO3M6MTA6InBlcm1pc3Npb24iO3M6OToicGFyZW50X2lkIjtpOjE7czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTc6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTc6MTkiO319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjY6Il90b2tlbiI7czo0MDoiNVBKRmdjRWxiWDdVT3lVM21kdEEyNEIyNEt5SnlIYXlmdFo4aXFqWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yb2xlcyI7fXM6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6OTp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo5OiJNdXNoZmVxdXIiO3M6NToiZW1haWwiO3M6OToibWVAbWUuY29tIjtzOjc6InJvbGVfaWQiO2k6MTtzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7TjtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIkbDQxemN3Zmg4dThxanBDRzlVYmNyZXFuYWxhUEphcE1yd2hoZHVERE5URUl6dmtUN3F5Wk8iO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjIgMDY6MzM6MTYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjIgMDY6MzM6MTYiO319', 1753870917),
('uYJvq8aHKphv9ypmjsA3FRE5AYarNLeEPm5kPv9B', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjQ6e2k6MDtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO047czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6MjtzOjQ6Im5hbWUiO3M6NzoiUHJvZmlsZSI7czo1OiJyb3V0ZSI7czo3OiJwcm9maWxlIjtzOjQ6Imljb24iO047czo0OiJzbHVnIjtzOjc6InByb2ZpbGUiO3M6NDoidHlwZSI7czoxMDoicGVybWlzc2lvbiI7czo5OiJwYXJlbnRfaWQiO2k6MTtzOjU6Im9yZGVyIjtpOjA7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7fWk6MjtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aTo1O3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjExOiJyb2xlcy5pbmRleCI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czo0OiJMaXN0IjtzOjQ6InR5cGUiO3M6MTA6InBlcm1pc3Npb24iO3M6OToicGFyZW50X2lkIjtpOjc7czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO31pOjM7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6NztzOjQ6Im5hbWUiO3M6ODoiU2V0dGluZ3MiO3M6NToicm91dGUiO3M6MToiIyI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czoxOiIjIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjk6InBhcmVudF9pZCI7aToxO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTMwIDEwOjIwOjA2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTMwIDEwOjIwOjA2Ijt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6InRHM1JJczRNNkFjMGQ0ZmRhWHNVSTkwRGZud2p0eFpNME5CY0t5VVIiO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcm9sZXMiO31zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiTXVzaGZlcXVyIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGw0MXpjd2ZoOHU4cWpwQ0c5VWJjcmVxbmFsYVBKYXBNcndoaGR1REROVEVJenZrVDdxeVpPIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2Ijt9fQ==', 1753873739),
('xKNz6QCN9vIXRbmKfgKMgBR4sV4f0a0QHSqh2wkI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjQ6e2k6MDtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjQ6InNsdWciO3M6MToiIyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo5OiJwYXJlbnRfaWQiO047czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjQgMDQ6NTY6MDIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6MjtzOjQ6Im5hbWUiO3M6NzoiUHJvZmlsZSI7czo1OiJyb3V0ZSI7czo3OiJwcm9maWxlIjtzOjQ6Imljb24iO047czo0OiJzbHVnIjtzOjc6InByb2ZpbGUiO3M6NDoidHlwZSI7czoxMDoicGVybWlzc2lvbiI7czo5OiJwYXJlbnRfaWQiO2k6MTtzOjU6Im9yZGVyIjtpOjA7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNCAwNDo1NzoxOSI7fWk6MjtPOjg6InN0ZENsYXNzIjoxMDp7czoyOiJpZCI7aTo1O3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjExOiJyb2xlcy5pbmRleCI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czo0OiJMaXN0IjtzOjQ6InR5cGUiO3M6MTA6InBlcm1pc3Npb24iO3M6OToicGFyZW50X2lkIjtpOjc7czo1OiJvcmRlciI7aTowO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjkgMDQ6MTg6MTkiO31pOjM7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6NztzOjQ6Im5hbWUiO3M6ODoiU2V0dGluZ3MiO3M6NToicm91dGUiO3M6MToiIyI7czo0OiJpY29uIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6NDoic2x1ZyI7czoxOiIjIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjk6InBhcmVudF9pZCI7aToxO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTMwIDEwOjIwOjA2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTMwIDEwOjIwOjA2Ijt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6IktrZHNicUVpSGlRbFZqalJFYVNoQTVvUEc0R2RhekRmcHhaMkhmZFUiO3M6NjoiX2ZsYXNoIjthOjI6e3M6MzoibmV3IjthOjA6e31zOjM6Im9sZCI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcm9sZXMiO31zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiTXVzaGZlcXVyIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGw0MXpjd2ZoOHU4cWpwQ0c5VWJjcmVxbmFsYVBKYXBNcndoaGR1REROVEVJenZrVDdxeVpPIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTIyIDA2OjMzOjE2Ijt9fQ==', 1753873605);

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
(79, 1, 2, NULL, NULL),
(80, 1, 5, NULL, NULL),
(83, 2, 2, NULL, NULL);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_name_unique` (`name`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

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
