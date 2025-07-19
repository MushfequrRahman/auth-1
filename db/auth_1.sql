-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2025 at 08:34 AM
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
('laravel_cache_user_permissions_1', 'a:4:{i:0;s:11:\"roles.index\";i:1;s:12:\"roles.create\";i:2;s:12:\"modules.list\";i:3;s:12:\"routes.index\";}', 1752903668);

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
(4, '2025_06_16_093451_create_roles_table', 2),
(5, '2025_06_16_094812_create_roles_table', 3),
(6, '2025_06_16_105458_create_modules_table', 4),
(7, '2025_06_18_043632_add_parent_id_to_modules_table', 5),
(8, '2025_06_19_024449_add_route_to_modules_table', 6),
(9, '2025_06_19_073549_create_permissions_table', 7),
(10, '2025_06_19_073602_create_role_module_permission_table', 7),
(11, '2025_06_21_054228_add_role_id_to_users_table', 8),
(12, '2025_06_21_111328_create_user_module_permission_table', 9),
(13, '2025_07_01_062056_add_icon_to_modules_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `parent_id`, `name`, `route`, `icon`, `order`, `created_at`, `updated_at`) VALUES
(36, NULL, 'Role', '#', 'fas fa-users', 1, '2025-06-18 21:10:50', '2025-07-01 01:24:39'),
(38, 41, 'Role Read', 'roles.index', NULL, 1, '2025-06-23 00:32:12', '2025-06-23 00:32:12'),
(39, 41, 'Role Write', 'roles.create', NULL, 2, '2025-06-23 00:32:49', '2025-06-23 00:32:49'),
(41, 36, 'Module', '#', NULL, 1, '2025-06-23 00:41:48', '2025-06-23 00:41:48'),
(42, NULL, 'Route', '#', NULL, 2, '2025-06-27 22:16:09', '2025-06-27 22:16:09'),
(43, 42, 'Route Read', 'routes.index', NULL, 1, '2025-06-27 22:16:49', '2025-06-27 22:16:49'),
(44, NULL, 'test', NULL, NULL, 3, '2025-06-29 00:32:12', '2025-06-29 00:32:12'),
(45, 44, 'test1', NULL, 'fas fa-cog', 1, '2025-07-01 00:42:35', '2025-07-01 00:42:35'),
(46, 41, 'Module List', 'modules.list', 'fas fa-cog', 3, '2025-07-01 01:25:22', '2025-07-01 01:25:22');

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

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(25, 36, 'Read', 'roles.index', '2025-06-27 22:24:47', '2025-07-01 03:18:01'),
(26, 36, 'Write', 'roles.create', '2025-06-27 22:25:44', '2025-07-01 03:18:01'),
(27, 42, 'Read', 'routes.index', '2025-06-27 22:43:33', '2025-06-27 22:43:33'),
(28, 36, 'List', 'modules.list', '2025-07-01 01:26:21', '2025-07-01 06:59:21');

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
(2, 'Admin', '2025-06-16 03:50:01', '2025-06-19 02:19:00'),
(4, 'User', '2025-06-16 04:25:06', '2025-06-16 04:25:06'),
(5, 'IE', '2025-06-19 02:23:15', '2025-06-19 02:23:15');

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
('785CpUNxfjkiJQEXSMz3J29DxCGJa6Bvam1H00sM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjk6e2k6MDtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjM2O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0xOSAwMzoxMDo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0wMSAwNzoyNDozOSI7fWk6MTtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjM4O3M6OToicGFyZW50X2lkIjtpOjQxO3M6NDoibmFtZSI7czo5OiJSb2xlIFJlYWQiO3M6NToicm91dGUiO3M6MTE6InJvbGVzLmluZGV4IjtzOjQ6Imljb24iO047czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6MzI6MTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6MzI6MTIiO31pOjI7Tzo4OiJzdGRDbGFzcyI6ODp7czoyOiJpZCI7aTozOTtzOjk6InBhcmVudF9pZCI7aTo0MTtzOjQ6Im5hbWUiO3M6MTA6IlJvbGUgV3JpdGUiO3M6NToicm91dGUiO3M6MTI6InJvbGVzLmNyZWF0ZSI7czo0OiJpY29uIjtOO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5Ijt9aTozO086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDE7czo5OiJwYXJlbnRfaWQiO2k6MzY7czo0OiJuYW1lIjtzOjY6Ik1vZHVsZSI7czo1OiJyb3V0ZSI7czoxOiIjIjtzOjQ6Imljb24iO047czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6NDE6NDgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6NDE6NDgiO31pOjQ7Tzo4OiJzdGRDbGFzcyI6ODp7czoyOiJpZCI7aTo0MjtzOjk6InBhcmVudF9pZCI7TjtzOjQ6Im5hbWUiO3M6NToiUm91dGUiO3M6NToicm91dGUiO3M6MToiIyI7czo0OiJpY29uIjtOO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI4IDA0OjE2OjA5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI4IDA0OjE2OjA5Ijt9aTo1O086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDM7czo5OiJwYXJlbnRfaWQiO2k6NDI7czo0OiJuYW1lIjtzOjEwOiJSb3V0ZSBSZWFkIjtzOjU6InJvdXRlIjtzOjEyOiJyb3V0ZXMuaW5kZXgiO3M6NDoiaWNvbiI7TjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7fWk6NjtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjQ0O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJ0ZXN0IjtzOjU6InJvdXRlIjtOO3M6NDoiaWNvbiI7TjtzOjU6Im9yZGVyIjtpOjM7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOSAwNjozMjoxMiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOSAwNjozMjoxMiI7fWk6NztPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjQ1O3M6OToicGFyZW50X2lkIjtpOjQ0O3M6NDoibmFtZSI7czo1OiJ0ZXN0MSI7czo1OiJyb3V0ZSI7TjtzOjQ6Imljb24iO3M6MTA6ImZhcyBmYS1jb2ciO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA2OjQyOjM1IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA2OjQyOjM1Ijt9aTo4O086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDY7czo5OiJwYXJlbnRfaWQiO2k6NDQ7czo0OiJuYW1lIjtzOjExOiJNb2R1bGUgTGlzdCI7czo1OiJyb3V0ZSI7czoxMjoibW9kdWxlcy5saXN0IjtzOjQ6Imljb24iO3M6MTA6ImZhcyBmYS1jb2ciO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA3OjI1OjIyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA3OjI1OjIyIjt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6ImJpQ2FaWTU1Z3VlaXZUeUVSTk5vRHZTTUlUVG1oOEMzNG9JOVdYSFMiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGVybWlzc2lvbnMvY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjo5OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjE2OiJNdXNoZmVxdXIgUmFobWFuIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJERhZWlhUnlmbHU2SUdzOFNwczREYWVwaW5yQ2hRSHZLcXJEd0xkUmxsQXgvVHk0eGVUUm5HIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTE2IDA1OjQzOjE5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTE2IDA1OjQzOjE5Ijt9fQ==', 1752903611),
('bjvan6VFEmYd4qtTKY6pUTPbutvYQgW2hW0NcHSI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', 'YTo0OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjk6e2k6MDtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjM2O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0xOSAwMzoxMDo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0wMSAwNzoyNDozOSI7fWk6MTtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjM4O3M6OToicGFyZW50X2lkIjtpOjQxO3M6NDoibmFtZSI7czo5OiJSb2xlIFJlYWQiO3M6NToicm91dGUiO3M6MTE6InJvbGVzLmluZGV4IjtzOjQ6Imljb24iO047czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6MzI6MTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6MzI6MTIiO31pOjI7Tzo4OiJzdGRDbGFzcyI6ODp7czoyOiJpZCI7aTozOTtzOjk6InBhcmVudF9pZCI7aTo0MTtzOjQ6Im5hbWUiO3M6MTA6IlJvbGUgV3JpdGUiO3M6NToicm91dGUiO3M6MTI6InJvbGVzLmNyZWF0ZSI7czo0OiJpY29uIjtOO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5Ijt9aTozO086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDE7czo5OiJwYXJlbnRfaWQiO2k6MzY7czo0OiJuYW1lIjtzOjY6Ik1vZHVsZSI7czo1OiJyb3V0ZSI7czoxOiIjIjtzOjQ6Imljb24iO047czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6NDE6NDgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6NDE6NDgiO31pOjQ7Tzo4OiJzdGRDbGFzcyI6ODp7czoyOiJpZCI7aTo0MjtzOjk6InBhcmVudF9pZCI7TjtzOjQ6Im5hbWUiO3M6NToiUm91dGUiO3M6NToicm91dGUiO3M6MToiIyI7czo0OiJpY29uIjtOO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI4IDA0OjE2OjA5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI4IDA0OjE2OjA5Ijt9aTo1O086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDM7czo5OiJwYXJlbnRfaWQiO2k6NDI7czo0OiJuYW1lIjtzOjEwOiJSb3V0ZSBSZWFkIjtzOjU6InJvdXRlIjtzOjEyOiJyb3V0ZXMuaW5kZXgiO3M6NDoiaWNvbiI7TjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7fWk6NjtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjQ0O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJ0ZXN0IjtzOjU6InJvdXRlIjtOO3M6NDoiaWNvbiI7TjtzOjU6Im9yZGVyIjtpOjM7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOSAwNjozMjoxMiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOSAwNjozMjoxMiI7fWk6NztPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjQ1O3M6OToicGFyZW50X2lkIjtpOjQ0O3M6NDoibmFtZSI7czo1OiJ0ZXN0MSI7czo1OiJyb3V0ZSI7TjtzOjQ6Imljb24iO3M6MTA6ImZhcyBmYS1jb2ciO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA2OjQyOjM1IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA2OjQyOjM1Ijt9aTo4O086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDY7czo5OiJwYXJlbnRfaWQiO2k6NDQ7czo0OiJuYW1lIjtzOjExOiJNb2R1bGUgTGlzdCI7czo1OiJyb3V0ZSI7czoxMjoibW9kdWxlcy5saXN0IjtzOjQ6Imljb24iO3M6MTA6ImZhcyBmYS1jb2ciO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA3OjI1OjIyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA3OjI1OjIyIjt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6IllDUlBkU21XcW9YSHhTbHlpTFVKNzg5cVhMZ0JrTXNBRUltZVFndnYiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1752656985),
('cAUVkIML9n1urIzNY2gOOkvOHyKNjZWJwb8BEtDc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjc6e2k6MDtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjM2O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTE5IDAzOjEwOjUwIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTE5IDAzOjEwOjUwIjt9aToxO086ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO2k6Mzg7czo5OiJwYXJlbnRfaWQiO2k6NDE7czo0OiJuYW1lIjtzOjk6IlJvbGUgUmVhZCI7czo1OiJyb3V0ZSI7czoxMToicm9sZXMuaW5kZXgiO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjEyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjEyIjt9aToyO086ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO2k6Mzk7czo5OiJwYXJlbnRfaWQiO2k6NDE7czo0OiJuYW1lIjtzOjEwOiJSb2xlIFdyaXRlIjtzOjU6InJvdXRlIjtzOjEyOiJyb2xlcy5jcmVhdGUiO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5Ijt9aTozO086ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO2k6NDE7czo5OiJwYXJlbnRfaWQiO2k6MzY7czo0OiJuYW1lIjtzOjY6Ik1vZHVsZSI7czo1OiJyb3V0ZSI7czoxOiIjIjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yMyAwNjo0MTo0OCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yMyAwNjo0MTo0OCI7fWk6NDtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjQyO3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo1OiJSb3V0ZSI7czo1OiJyb3V0ZSI7czoxOiIjIjtzOjU6Im9yZGVyIjtpOjI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjowOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjowOSI7fWk6NTtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjQzO3M6OToicGFyZW50X2lkIjtpOjQyO3M6NDoibmFtZSI7czoxMDoiUm91dGUgUmVhZCI7czo1OiJyb3V0ZSI7czoxMjoicm91dGVzLmluZGV4IjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7fWk6NjtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjQ0O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJ0ZXN0IjtzOjU6InJvdXRlIjtOO3M6NToib3JkZXIiO2k6MztzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI5IDA2OjMyOjEyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI5IDA2OjMyOjEyIjt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6InhsU1dCSFhpZHk1RUhIVHUwdmVWZ3YwUnZDd2kzQmc2aHE0ZmZJMzIiO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGVybWlzc2lvbnMiO31zOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjk6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6MTY6Ik11c2hmZXF1ciBSYWhtYW4iO3M6NToiZW1haWwiO3M6OToibWVAbWUuY29tIjtzOjc6InJvbGVfaWQiO2k6MTtzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7TjtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIkRGFlaWFSeWZsdTZJR3M4U3BzNERhZXBpbnJDaFFIdktxckR3TGRSbGxBeC9UeTR4ZVRSbkciO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMTYgMDU6NDM6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMTYgMDU6NDM6MTkiO319', 1751374763),
('lhFLjSI3knnf6f3kBpzdZaJwscPE5CnNcMsSamkE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjk6e2k6MDtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjM2O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0xOSAwMzoxMDo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0wMSAwNzoyNDozOSI7fWk6MTtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjM4O3M6OToicGFyZW50X2lkIjtpOjQxO3M6NDoibmFtZSI7czo5OiJSb2xlIFJlYWQiO3M6NToicm91dGUiO3M6MTE6InJvbGVzLmluZGV4IjtzOjQ6Imljb24iO047czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6MzI6MTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6MzI6MTIiO31pOjI7Tzo4OiJzdGRDbGFzcyI6ODp7czoyOiJpZCI7aTozOTtzOjk6InBhcmVudF9pZCI7aTo0MTtzOjQ6Im5hbWUiO3M6MTA6IlJvbGUgV3JpdGUiO3M6NToicm91dGUiO3M6MTI6InJvbGVzLmNyZWF0ZSI7czo0OiJpY29uIjtOO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5Ijt9aTozO086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDE7czo5OiJwYXJlbnRfaWQiO2k6MzY7czo0OiJuYW1lIjtzOjY6Ik1vZHVsZSI7czo1OiJyb3V0ZSI7czoxOiIjIjtzOjQ6Imljb24iO047czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6NDE6NDgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6NDE6NDgiO31pOjQ7Tzo4OiJzdGRDbGFzcyI6ODp7czoyOiJpZCI7aTo0MjtzOjk6InBhcmVudF9pZCI7TjtzOjQ6Im5hbWUiO3M6NToiUm91dGUiO3M6NToicm91dGUiO3M6MToiIyI7czo0OiJpY29uIjtOO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI4IDA0OjE2OjA5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI4IDA0OjE2OjA5Ijt9aTo1O086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDM7czo5OiJwYXJlbnRfaWQiO2k6NDI7czo0OiJuYW1lIjtzOjEwOiJSb3V0ZSBSZWFkIjtzOjU6InJvdXRlIjtzOjEyOiJyb3V0ZXMuaW5kZXgiO3M6NDoiaWNvbiI7TjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7fWk6NjtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjQ0O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJ0ZXN0IjtzOjU6InJvdXRlIjtOO3M6NDoiaWNvbiI7TjtzOjU6Im9yZGVyIjtpOjM7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOSAwNjozMjoxMiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOSAwNjozMjoxMiI7fWk6NztPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjQ1O3M6OToicGFyZW50X2lkIjtpOjQ0O3M6NDoibmFtZSI7czo1OiJ0ZXN0MSI7czo1OiJyb3V0ZSI7TjtzOjQ6Imljb24iO3M6MTA6ImZhcyBmYS1jb2ciO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA2OjQyOjM1IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA2OjQyOjM1Ijt9aTo4O086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDY7czo5OiJwYXJlbnRfaWQiO2k6NDE7czo0OiJuYW1lIjtzOjExOiJNb2R1bGUgTGlzdCI7czo1OiJyb3V0ZSI7czoxMjoibW9kdWxlcy5saXN0IjtzOjQ6Imljb24iO3M6MTA6ImZhcyBmYS1jb2ciO3M6NToib3JkZXIiO2k6MztzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA3OjI1OjIyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA3OjI1OjIyIjt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6ImpLSDNiNjdEbmJ0VWl4V1prTXRxQmx6TXZEUWJlb25WYUVvdHNWeVYiO3M6NjoiX2ZsYXNoIjthOjI6e3M6MzoibmV3IjthOjA6e31zOjM6Im9sZCI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO319', 1751361707),
('ZCyyjSnU93EniD9u8nIowDV6Zw08gIVLFZniR64Z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjc6Im1vZHVsZXMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjk6e2k6MDtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjM2O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJSb2xlIjtzOjU6InJvdXRlIjtzOjE6IiMiO3M6NDoiaWNvbiI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0xOSAwMzoxMDo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0wMSAwNzoyNDozOSI7fWk6MTtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjM4O3M6OToicGFyZW50X2lkIjtpOjQxO3M6NDoibmFtZSI7czo5OiJSb2xlIFJlYWQiO3M6NToicm91dGUiO3M6MTE6InJvbGVzLmluZGV4IjtzOjQ6Imljb24iO047czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6MzI6MTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6MzI6MTIiO31pOjI7Tzo4OiJzdGRDbGFzcyI6ODp7czoyOiJpZCI7aTozOTtzOjk6InBhcmVudF9pZCI7aTo0MTtzOjQ6Im5hbWUiO3M6MTA6IlJvbGUgV3JpdGUiO3M6NToicm91dGUiO3M6MTI6InJvbGVzLmNyZWF0ZSI7czo0OiJpY29uIjtOO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTIzIDA2OjMyOjQ5Ijt9aTozO086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDE7czo5OiJwYXJlbnRfaWQiO2k6MzY7czo0OiJuYW1lIjtzOjY6Ik1vZHVsZSI7czo1OiJyb3V0ZSI7czoxOiIjIjtzOjQ6Imljb24iO047czo1OiJvcmRlciI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6NDE6NDgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMjMgMDY6NDE6NDgiO31pOjQ7Tzo4OiJzdGRDbGFzcyI6ODp7czoyOiJpZCI7aTo0MjtzOjk6InBhcmVudF9pZCI7TjtzOjQ6Im5hbWUiO3M6NToiUm91dGUiO3M6NToicm91dGUiO3M6MToiIyI7czo0OiJpY29uIjtOO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI4IDA0OjE2OjA5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTI4IDA0OjE2OjA5Ijt9aTo1O086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDM7czo5OiJwYXJlbnRfaWQiO2k6NDI7czo0OiJuYW1lIjtzOjEwOiJSb3V0ZSBSZWFkIjtzOjU6InJvdXRlIjtzOjEyOiJyb3V0ZXMuaW5kZXgiO3M6NDoiaWNvbiI7TjtzOjU6Im9yZGVyIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOCAwNDoxNjo0OSI7fWk6NjtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjQ0O3M6OToicGFyZW50X2lkIjtOO3M6NDoibmFtZSI7czo0OiJ0ZXN0IjtzOjU6InJvdXRlIjtOO3M6NDoiaWNvbiI7TjtzOjU6Im9yZGVyIjtpOjM7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOSAwNjozMjoxMiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0yOSAwNjozMjoxMiI7fWk6NztPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtpOjQ1O3M6OToicGFyZW50X2lkIjtpOjQ0O3M6NDoibmFtZSI7czo1OiJ0ZXN0MSI7czo1OiJyb3V0ZSI7TjtzOjQ6Imljb24iO3M6MTA6ImZhcyBmYS1jb2ciO3M6NToib3JkZXIiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA2OjQyOjM1IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA2OjQyOjM1Ijt9aTo4O086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO2k6NDY7czo5OiJwYXJlbnRfaWQiO2k6NDQ7czo0OiJuYW1lIjtzOjExOiJNb2R1bGUgTGlzdCI7czo1OiJyb3V0ZSI7czoxMjoibW9kdWxlcy5saXN0IjtzOjQ6Imljb24iO3M6MTA6ImZhcyBmYS1jb2ciO3M6NToib3JkZXIiO2k6MjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA3OjI1OjIyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTAxIDA3OjI1OjIyIjt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo2OiJfdG9rZW4iO3M6NDA6Ik9hdzVyMmFWa1ZXc05QMEx5N1V0eVRKQ05IbmRSOTRRWXd5M1BmRE4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6MzoibmV3IjthOjA6e31zOjM6Im9sZCI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcm9sZXMvY3JlYXRlIjt9czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjo5OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjE2OiJNdXNoZmVxdXIgUmFobWFuIjtzOjU6ImVtYWlsIjtzOjk6Im1lQG1lLmNvbSI7czo3OiJyb2xlX2lkIjtpOjE7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJERhZWlhUnlmbHU2SUdzOFNwczREYWVwaW5yQ2hRSHZLcXJEd0xkUmxsQXgvVHk0eGVUUm5HIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTE2IDA1OjQzOjE5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA2LTE2IDA1OjQzOjE5Ijt9fQ==', 1751361777);

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
(1, 'Mushfequr Rahman', 'me@me.com', 1, NULL, '$2y$12$DaeiaRyflu6IGs8Sps4DaepinrChQHvKqrDwLdRllAx/Ty4xeTRnG', NULL, '2025-06-15 23:43:19', '2025-06-15 23:43:19'),
(2, 'm', 'me1@me.com', 1, NULL, '$2y$12$6.Vbw4kuzZyjouctibhY5.HNe0lsoNyl3WuyFvgLZ3Y870whriy12', NULL, '2025-06-16 03:16:44', '2025-06-16 03:16:44'),
(3, 'test', 'test@me.com', 4, NULL, '$2y$12$svRrtcoxungyF.1xVvESTu9QuACvn6gYw8RuN4lQgpE8rT2Sacwja', NULL, '2025-06-21 00:24:15', '2025-06-21 00:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_module_permission`
--

CREATE TABLE `user_module_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_module_permission`
--

INSERT INTO `user_module_permission` (`id`, `user_id`, `module_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(26, 2, 36, 25, '2025-06-27 23:22:44', '2025-06-27 23:22:44'),
(31, 2, 36, 26, '2025-06-28 00:11:36', '2025-06-28 00:11:36'),
(37, 1, 36, 25, '2025-06-28 02:21:08', '2025-06-28 02:21:08'),
(38, 1, 36, 26, '2025-06-28 02:21:20', '2025-06-28 02:21:20'),
(39, 1, 42, 27, '2025-06-28 05:20:10', '2025-06-28 05:20:10'),
(40, 1, 36, 28, '2025-07-01 01:26:35', '2025-07-01 01:26:35');

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
  ADD UNIQUE KEY `user_module_permission_user_id_module_id_permission_id_unique` (`user_id`,`module_id`,`permission_id`),
  ADD KEY `user_module_permission_module_id_foreign` (`module_id`),
  ADD KEY `user_module_permission_permission_id_foreign` (`permission_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_module_permission`
--
ALTER TABLE `role_module_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_module_permission`
--
ALTER TABLE `user_module_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  ADD CONSTRAINT `user_module_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_module_permission_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
