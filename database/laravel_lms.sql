-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2025 at 03:07 AM
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
-- Database: `laravel_lms`
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
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1743035211),
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1743035211;', 1743035211),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:2;', 1742969549),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1742969549;', 1742969549);

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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `photo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', 'makanan', 'gambar/01JQ8M2GNQJZE3YSDRPB799EAB.jpg', NULL, '2025-03-26 00:01:09', '2025-03-26 00:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `catering_bonuses`
--

CREATE TABLE `catering_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `catering_package_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catering_bonuses`
--

INSERT INTO `catering_bonuses` (`id`, `name`, `photo`, `category_id`, `catering_package_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'RSRS', 'gambar/01JQ93X9GM49QWERTJHQ88BCD7.jpg', 1, 1, NULL, '2025-03-26 04:37:55', '2025-03-26 04:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `catering_packages`
--

CREATE TABLE `catering_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `is_popular` tinyint(1) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `kitchen_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catering_packages`
--

INSERT INTO `catering_packages` (`id`, `name`, `slug`, `thumbnail`, `about`, `is_popular`, `category_id`, `city_id`, `kitchen_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', 'gambar/01JQ8RM8WHP6YQ1ANW4MG3C1BB.jpg', 'rfef', 1, 1, 1, 1, NULL, '2025-03-26 01:20:46', '2025-03-26 01:20:46'),
(2, 'test', 'test', 'gambar/01JQ8RM8WHP6YQ1ANW4MG3C1BB.jpg', 'rfef', 0, 1, 1, 1, NULL, '2025-03-26 01:21:23', '2025-03-26 01:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `catering_photos`
--

CREATE TABLE `catering_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) NOT NULL,
  `catering_package_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catering_photos`
--

INSERT INTO `catering_photos` (`id`, `photo`, `catering_package_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'gambar/01JQ8RNDQ2RJMH8NK23PQ2BZ3K.jpg', 2, NULL, '2025-03-26 01:21:23', '2025-03-26 01:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `catering_subscriptions`
--

CREATE TABLE `catering_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_trx_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `proof` varchar(255) NOT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `post_code` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `address` text NOT NULL,
  `total_amount` bigint(20) UNSIGNED NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `duration` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) UNSIGNED NOT NULL,
  `total_tax_amount` bigint(20) UNSIGNED NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `started_at` date NOT NULL,
  `ended_at` date NOT NULL,
  `catering_package_id` bigint(20) UNSIGNED NOT NULL,
  `catering_tier_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catering_subscriptions`
--

INSERT INTO `catering_subscriptions` (`id`, `booking_trx_id`, `name`, `phone`, `email`, `proof`, `delivery_time`, `post_code`, `city`, `notes`, `address`, `total_amount`, `price`, `duration`, `quantity`, `total_tax_amount`, `is_paid`, `started_at`, `ended_at`, `catering_package_id`, `catering_tier_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'KTRBWA876', 'test', '089797897', 'test@gmail.com', 'gambar/01JQ9N38HM115DPHJFBPVK8N78.jpg', '545555', '09576', 'BNTUL', 'diantar', 'bantul', 333000, 300000, 30, 10, 33000, 1, '2025-03-26', '2025-04-25', 1, 1, NULL, '2025-03-26 09:38:17', '2025-03-26 10:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `catering_testimonials`
--

CREATE TABLE `catering_testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `catering_package_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catering_testimonials`
--

INSERT INTO `catering_testimonials` (`id`, `name`, `message`, `photo`, `catering_package_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Alfa', 'makanan nya lezatnyoo', 'gambar/01JQAFVKYAEKCBS6F87M1ZNS51.jpg', 1, NULL, '2025-03-26 17:25:58', '2025-03-26 17:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `catering_tiers`
--

CREATE TABLE `catering_tiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `quantity` bigint(20) UNSIGNED NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `duration` bigint(20) UNSIGNED NOT NULL,
  `catering_package_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catering_tiers`
--

INSERT INTO `catering_tiers` (`id`, `name`, `photo`, `tagline`, `quantity`, `price`, `duration`, `catering_package_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ceria Aja', 'gambar/01JQ952KT1G3JRDJ94M4CX5HYA.jpg', 'untuk kamu', 10, 300000, 30, 1, NULL, '2025-03-26 04:58:18', '2025-03-26 04:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `slug`, `photo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Yogyakarta', 'yogyakarta', 'gambar/01JQ8MPZQ9EXTXK9HP9VFDHBMW.jpg', NULL, '2025-03-26 00:12:20', '2025-03-26 00:12:20'),
(2, 'Jkt', 'jkt', 'gambar/01JQAAY7HHXF0WPQ1CAMDDDD4D.jpg', NULL, '2025-03-26 16:00:01', '2025-03-26 16:00:01');

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
-- Table structure for table `kitchens`
--

CREATE TABLE `kitchens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kitchens`
--

INSERT INTO `kitchens` (`id`, `name`, `year`, `photo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Rendang', '2025', 'gambar/01JQ8M7RGYJ9ZCKQA3FSGWKJV4.jpg', NULL, '2025-03-26 00:04:01', '2025-03-26 00:04:01');

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
(4, '2025_03_26_015819_create_categories_table', 1),
(5, '2025_03_26_015821_create_cities_table', 1),
(6, '2025_03_26_015822_create_kitchens_table', 1),
(7, '2025_03_26_015823_create_catering_packages_table', 1),
(8, '2025_03_26_015825_create_catering_testimonials_table', 1),
(9, '2025_03_26_015826_create_catering_bonuses_table', 1),
(10, '2025_03_26_015827_create_catering_photos_table', 1),
(11, '2025_03_26_015828_create_catering_tiers_table', 1),
(12, '2025_03_26_015829_create_tier_benefits_table', 1),
(13, '2025_03_26_015831_create_catering_subscriptions_table', 1),
(14, '2025_03_26_181936_create_personal_access_tokens_table', 2);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
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
('jrxSoEbwQnjuo6ZM7PdwDfvwGhPWbPkL9KwOCmKn', NULL, '127.0.0.1', 'PostmanRuntime/7.43.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1MyZ3VKMWQ3WTlzUmNJaVNkdmczZWZ0eGlNQlNhUjFUdlM2UDhURCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743037275),
('n8AjQSLqVLRdmrMC6yc5GU0hAaI26txYrmegd3YP', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoic1A1SnhRd1M2czc4b0JrSDRqVXRDbXF6YUNHaVFuN2hOV29mcFhYTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJDZEMFNaT2NaVFp4QWphazN1cEtyOXU0YjFBZ05RbHVYeGJUZUNVMUlXRmpvVUtEOWxkLzlDIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluIjt9czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1743039981);

-- --------------------------------------------------------

--
-- Table structure for table `tier_benefits`
--

CREATE TABLE `tier_benefits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `catering_tier_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tier_benefits`
--

INSERT INTO `tier_benefits` (`id`, `name`, `catering_tier_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Banyak Protein', 1, NULL, '2025-03-26 04:58:19', '2025-03-26 04:58:19'),
(2, 'Pikiran Jdi fresh', 1, NULL, '2025-03-26 04:58:19', '2025-03-26 04:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'fafa', 'admin@gmail.com', NULL, '$2y$12$6D0SZOcZTZxAjak3upKr9u4b1AgNQluXxbTeCU1IWFjoUKD9ld/9C', 'GArFYHFcQtgjObIt3uS22wkUyDj9245scV2nh0jWx47FMIadoHZsW2hWzm23', '2025-03-25 23:11:18', '2025-03-25 23:11:18');

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catering_bonuses`
--
ALTER TABLE `catering_bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catering_bonuses_category_id_foreign` (`category_id`),
  ADD KEY `catering_bonuses_catering_package_id_foreign` (`catering_package_id`);

--
-- Indexes for table `catering_packages`
--
ALTER TABLE `catering_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catering_packages_category_id_foreign` (`category_id`),
  ADD KEY `catering_packages_city_id_foreign` (`city_id`),
  ADD KEY `catering_packages_kitchen_id_foreign` (`kitchen_id`);

--
-- Indexes for table `catering_photos`
--
ALTER TABLE `catering_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catering_photos_catering_package_id_foreign` (`catering_package_id`);

--
-- Indexes for table `catering_subscriptions`
--
ALTER TABLE `catering_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catering_subscriptions_catering_package_id_foreign` (`catering_package_id`),
  ADD KEY `catering_subscriptions_catering_tier_id_foreign` (`catering_tier_id`);

--
-- Indexes for table `catering_testimonials`
--
ALTER TABLE `catering_testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catering_testimonials_catering_package_id_foreign` (`catering_package_id`);

--
-- Indexes for table `catering_tiers`
--
ALTER TABLE `catering_tiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catering_tiers_catering_package_id_foreign` (`catering_package_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `kitchens`
--
ALTER TABLE `kitchens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tier_benefits`
--
ALTER TABLE `tier_benefits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tier_benefits_catering_tier_id_foreign` (`catering_tier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catering_bonuses`
--
ALTER TABLE `catering_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catering_packages`
--
ALTER TABLE `catering_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catering_photos`
--
ALTER TABLE `catering_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catering_subscriptions`
--
ALTER TABLE `catering_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catering_testimonials`
--
ALTER TABLE `catering_testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catering_tiers`
--
ALTER TABLE `catering_tiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `kitchens`
--
ALTER TABLE `kitchens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tier_benefits`
--
ALTER TABLE `tier_benefits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catering_bonuses`
--
ALTER TABLE `catering_bonuses`
  ADD CONSTRAINT `catering_bonuses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catering_bonuses_catering_package_id_foreign` FOREIGN KEY (`catering_package_id`) REFERENCES `catering_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catering_packages`
--
ALTER TABLE `catering_packages`
  ADD CONSTRAINT `catering_packages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catering_packages_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catering_packages_kitchen_id_foreign` FOREIGN KEY (`kitchen_id`) REFERENCES `kitchens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catering_photos`
--
ALTER TABLE `catering_photos`
  ADD CONSTRAINT `catering_photos_catering_package_id_foreign` FOREIGN KEY (`catering_package_id`) REFERENCES `catering_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catering_subscriptions`
--
ALTER TABLE `catering_subscriptions`
  ADD CONSTRAINT `catering_subscriptions_catering_package_id_foreign` FOREIGN KEY (`catering_package_id`) REFERENCES `catering_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catering_subscriptions_catering_tier_id_foreign` FOREIGN KEY (`catering_tier_id`) REFERENCES `catering_tiers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catering_testimonials`
--
ALTER TABLE `catering_testimonials`
  ADD CONSTRAINT `catering_testimonials_catering_package_id_foreign` FOREIGN KEY (`catering_package_id`) REFERENCES `catering_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catering_tiers`
--
ALTER TABLE `catering_tiers`
  ADD CONSTRAINT `catering_tiers_catering_package_id_foreign` FOREIGN KEY (`catering_package_id`) REFERENCES `catering_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tier_benefits`
--
ALTER TABLE `tier_benefits`
  ADD CONSTRAINT `tier_benefits_catering_tier_id_foreign` FOREIGN KEY (`catering_tier_id`) REFERENCES `catering_tiers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
