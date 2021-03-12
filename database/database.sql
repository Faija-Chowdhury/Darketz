-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2021 at 05:42 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `darketz`
--

-- --------------------------------------------------------

--
-- Table structure for table `bikashes`
--

CREATE TABLE `bikashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL,
  `trncsation_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bikashes`
--

INSERT INTO `bikashes` (`id`, `number`, `trncsation_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1772459368, '01772459368', 8, '2021-03-12 00:29:26', '2021-03-12 00:29:26'),
(2, 1772459368, '01772459368', 8, '2021-03-12 00:30:15', '2021-03-12 00:30:15'),
(3, 12345677, '12456677', 8, '2021-03-12 10:50:07', '2021-03-12 10:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `carousels`
--

CREATE TABLE `carousels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousels`
--

INSERT INTO `carousels` (`id`, `img`, `caption`, `created_at`, `updated_at`) VALUES
(4, '/images/banner/LWMuSWNGjOjtEiTs.webp', 'Offer Eid', '2021-03-11 22:45:28', '2021-03-11 22:45:28'),
(5, '/images/banner/lggzB0ClCGhJ4AHS.webp', 'Offer 11.11', '2021-03-11 22:45:46', '2021-03-11 22:45:46'),
(6, '/images/banner/XtmWjN5flfbmpvVf.webp', 'Mega Offer', '2021-03-11 22:46:00', '2021-03-11 22:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(6, 8, 25, 1),
(7, 8, 1, 1),
(10, 8, 32, 1),
(11, 8, 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(2, 'Electronic Accessories', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(3, 'Personal Care', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(4, 'Babys & Toys', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(5, 'Grocery & Pets', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(6, 'Home & Lifestyle', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(7, 'Sports & Outdoors', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(8, 'AutoMotive & Motorbike', '2021-03-11 22:05:33', '2021-03-11 22:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `customer_questions`
--

CREATE TABLE `customer_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_questions`
--

INSERT INTO `customer_questions` (`id`, `user_id`, `product_id`, `question`, `reply`, `created_at`, `updated_at`) VALUES
(1, 4, 5, 'hkjkfjsbfiu', 'sdbgfsdbgdbgdb', '2021-03-11 22:40:55', '2021-03-11 23:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `flash_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_sales`
--

INSERT INTO `flash_sales` (`id`, `product_id`, `flash_price`, `created_at`, `updated_at`) VALUES
(1, 1, '45000', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(2, 2, '40500', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(3, 3, '20700', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(4, 4, '18000', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(5, 5, '3870', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(6, 6, '225', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(7, 7, '2700', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(8, 8, '270', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(9, 9, '135', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(10, 10, '4500', '2021-03-11 22:05:34', '2021-03-11 22:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_01_12_000000_create_users_table', 1),
(2, '2021_01_12_100000_create_password_resets_table', 1),
(3, '2021_01_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2021_01_19_000000_create_failed_jobs_table', 1),
(5, '2021_02_09_052349_create_bikashes_table', 1),
(6, '2021_02_27_131607_create_permission_tables', 1),
(7, '2021_02_27_135657_create_categories_table', 1),
(8, '2021_02_28_111215_create_products_table', 1),
(9, '2021_02_28_111216_create_product_images_table', 1),
(10, '2021_02_28_111217_create_orders_table', 1),
(11, '2021_02_28_111218_create_user_infos_table', 1),
(12, '2021_02_28_111219_create_carts_table', 1),
(13, '2021_02_28_111220_create_customer_questions_table', 1),
(14, '2021_02_28_111221_create_flash_sales_table', 1),
(15, '2021_02_28_111222_create_carousels_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` smallint(6) NOT NULL DEFAULT 1,
  `shipping_cost` int(11) NOT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transtion_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `printed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `order_number`, `quantity`, `shipping_cost`, `payment`, `price`, `transtion_id`, `status`, `printed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 10, '2791615480824', 1, 100, 'paypal', '2500', NULL, 'DELIVERED', 1, NULL, '2021-03-11 22:40:24', '2021-03-11 22:42:23'),
(2, 8, 2, '2261615483723', 1, 100, 'cash', '25000', NULL, 'PENDING', 0, NULL, '2021-03-11 23:28:43', '2021-03-11 23:28:43'),
(3, 8, 2, '2021615487366', 1, 100, 'bikash', '25000', '01772459368', 'PENDING', 0, NULL, '2021-03-12 00:29:26', '2021-03-12 00:29:26'),
(4, 8, 2, '2921615487415', 1, 100, 'bikash', '25000', '01772459368', 'PENDING', 0, NULL, '2021-03-12 00:30:15', '2021-03-12 00:30:15'),
(5, 8, 9, '2251615524505', 1, 100, 'cash', '135', NULL, 'READY TO SHIP', 0, NULL, '2021-03-12 10:48:25', '2021-03-12 11:36:17'),
(6, 8, 12, '2011615524607', 1, 100, 'bikash', '850', '12456677', 'READY TO SHIP', 1, NULL, '2021-03-12 10:50:07', '2021-03-12 11:36:28'),
(7, 8, 33, '2571615564390', 1, 100, 'cash', '1500', NULL, 'PENDING', 0, NULL, '2021-03-12 21:53:10', '2021-03-12 21:53:10'),
(8, 8, 32, '2841615564522', 5, 100, 'cash', '22440', NULL, 'READY TO SHIP', 1, NULL, '2021-03-12 21:55:22', '2021-03-12 22:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('zaman.faija@gmail.com', '$2y$10$tsWRIqs.q9g0ddGJ8np3LOh/Wgot9xvrfePltgkzOL4DSqn0mW7em', '2021-03-12 10:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(2, 'create-products', 'web', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(3, 'edit-products', 'web', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(4, 'delete-products', 'web', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(5, 'manage-users', 'web', '2021-03-11 22:05:33', '2021-03-11 22:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subCategory` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onSale` tinyint(1) NOT NULL DEFAULT 0,
  `live` tinyint(1) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` smallint(6) NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No brand',
  `warranty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `subCategory`, `title`, `slug`, `product_code`, `price`, `sale_price`, `onSale`, `live`, `description`, `stock`, `brand`, `warranty`, `color`, `size`, `created_at`, `updated_at`) VALUES
(1, 1, 'Phone Cases', 'Apple iphone se 128gb', 'apple-iphone-se-128gb', 'CW56T8', '50000', '40000', 1, 1, '<p>\r\n        </p><p><br></p>', 3, 'Apple', '6 months', 'Multicolor', '4Xl', '2021-03-11 22:05:33', '2021-03-12 21:51:19'),
(2, 1, 'Mobile', 'Samsung new phone', 'samsung-new-phone', 'FEG43O', '45000', '25000', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 33, 'Samsung', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(3, 1, 'Mobile', 'Samsung budget phone 2gb 64gb', 'samsung-budget-phone-2gb-64gb', '6F9VV0', '23000', '53000', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 50, 'Samsung', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(4, 1, 'Kitchen Utensils', 'Silicone Cooking Oil Bottle with Basting Brush palstic Round Pastry', 'silicone-cooking-oil-bottle-with-basting-brush-palstic-round-pastry', 'IT16JU', '20000', '14000', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 11, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(5, 1, 'Riding gear', 'high grade genuine leather-touchscreen-gloves', 'high-grade-genuine-leather-touchscreen-gloves', 'WKOHBR', '4300', '2200', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 4, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(6, 1, 'Mens grooming', 'blackblue m1 ninja full face mask', 'blackblue-m1-ninja-full-face-mask', 'UTDV9V', '250', '200', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 42, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(7, 1, 'Desktops', 'Ram 2gb', 'ram-2gb', 'BHKJHN', '3000', '2400', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 32, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(8, 1, 'Phone cases', 'Luxury Shockproof Semi Transparent Matte Finish Case for Oneplus 7T', 'luxury-shockproof-semi-transparent-matte-finish-case-for-oneplus-7t', 'XPM8IJ', '300', '240', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 24, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(9, 1, 'Phone cases', 'Masala Beads Luxury Fashion Diamond Crystal Bracelet Hand Chain Bling Glitter Soft Case Cover', 'masala-beads-luxury-fashion-diamond-crystal-bracelet-hand-chain-bling-glitter-soft-case-cover', 'RTH2U0', '150', '120', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 4, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(10, 1, 'Womens Collections', 'Blackmaroon baseball t-shirt for women', 'blackmaroon-baseball-t-shirt-for-women', 'EGQDQM', '5000', '2500', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 27, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(11, 1, 'Bath', 'Pure Cotton Home And Bath Towel', 'pure-cotton-home-and-bath-towel', 'XVYMGD', '500', '450', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 41, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(12, 1, 'Bath', 'Imperial Leather Classic Soap 115G', 'imperial-leather-classic-soap-115g', 'E2KWHN', '900', '850', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 33, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(13, 1, 'Appliances & Electicals', 'multifunctional electric skillet cooker', 'multifunctional-electric-skillet-cooker', 'E6XMSG', '4500', '4200', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 36, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(14, 1, 'Mens Collections', 'pack of 3 autumn full sleeves tshirt', 'pack-of-3-autumn-full-sleeves-tshirt', 'TDVAOG', '5499', '4500', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 14, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(15, 1, 'Chargers', 'Samsung mobile charger with usb-cable', 'samsung-mobile-charger-with-usb-cable', 'CIJZVF', '400', '250', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 37, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(16, 1, 'Mens grooming', 'Geemy rechargeable grooming-kit', 'geemy-rechargeable-grooming-kit', 'RZUB32', '5400', '3400', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 7, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(17, 1, 'Toys & Games', 'Educational laptop for kids abc-and-123-learning', 'educational-laptop-for-kids-abc-and-123-learning', 'SNNYKE', '5000', '3500', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 50, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(18, 1, 'Toys & Games', 'lego mclaren 720s i101136940', 'lego-mclaren-720s-i101136940', 'YOZX4F', '6000', '4500', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 50, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(19, 1, 'Beverages', 'Slice mango tropicana', 'slice-mango-tropicana', 'YDMIJZ', '250', '200', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 37, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(20, 1, 'Breakfast', 'bru-3-in-1 premix coffee-330gm', 'bru-3-in-1-premix-coffee-330gm', '4QAY8I', '5400', '3400', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 43, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(21, 1, 'Screen protectors', 'wiwu laptop screen protector-film-for-macbook-13', 'wiwu-laptop-screen-protector-film-for-macbook-13', 'XQERXM', '600', '500', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 24, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(22, 1, 'Laptops', 'Apple Mac book', 'apple-mac-book', 'DFNBGN', '60000', '55000', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 13, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(23, 1, 'Appliances & Electicals', 'Manual hand crank single auger juicer', 'manual-hand-crank-single-auger-juicer', 'ROJ0UA', '5500', '3400', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 38, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(24, 1, 'Exercise & Fitness', 'caliber-shoes-white-ultralight', 'caliber-shoes-white-ultralight', 'STQQOV', '5000', '3500', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 24, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(25, 1, 'Travel & Luggage', 'lenovo blue laptop backpack', 'lenovo-blue-laptop-backpack', 'OU72YS', '4500', '4200', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 47, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(26, 1, 'Pet Food', 'Dog food best quality', 'dog-food-best-quality', 'Q5RWIG', '4500', '4200', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 8, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(27, 1, 'Beverages', 'Coke 2lr bottle', 'coke-2lr-bottle', '7LVFGN', '450', '420', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 49, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(28, 1, 'Deodrants', 'Dettol soap', 'dettol-soap', '2QA1ZI', '450', '420', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 13, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(29, 1, 'Fruits', 'Apple 2kg', 'apple-2kg', 'AI5M0E', '350', '240', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 49, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(30, 1, 'Diapers', 'diaper baby soft material', 'diaper-baby-soft-material', '6S6BXQ', '500', '450', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 42, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(31, 1, 'Furniture', 'Bed sheet', 'bed-sheet', 'LEMTRA', '3530', '2440', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 15, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(32, 1, 'Furniture', 'Furnitute for dining', 'furnitute-for-dining', 'ML5TYD', '32530', '22440', 1, 1, '\n        <div>\n           <div>\n              <ul>\n                 <li>\n                    <span>Brand  </span>\n                    <div>Lenovo</div>\n                 </li>\n                 <li>\n                    <span>SKU  </span>\n                    <div>LE599FA08295GNAFAMZ-185623</div>\n                 </li>\n                 <li>\n                    <span>Compatible Laptop Size  </span>\n                    <div  key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span>Closure Type  </span>\n                    <div  key-value>Zippers</div>\n                 </li>\n                 <li>\n                    <span> Dust Resistant  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span > Lockable  </span>\n                    <div key-value>Not Specified</div>\n                 </li>\n                 <li>\n                    <span> Model </span>\n                    <div>GX40Q17226</div>\n                 </li>\n              </ul>\n           </div>\n           <div >\n              <span>What’s in the box</span>\n              <div box-content-html>Blue B210 15.6 Laptop Backpack- GX40Q17226</div>\n           </div>\n        </div>', 5, '', NULL, NULL, NULL, '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(33, 1, 'kindle', 'kindle', 'kindle', 'UL0RPN', '2500', '1500', 1, 1, '<p><span style=\"color: rgb(15, 17, 17);\">Available at a lower price from&nbsp;</span><a href=\"https://www.amazon.com/gp/offer-listing/B084127MVC/ref=dp_olp_pn\" target=\"_blank\" style=\"color: rgb(0, 113, 133); background-color: rgb(255, 255, 255);\">other sellers</a><span style=\"color: rgb(15, 17, 17);\">&nbsp;that may not offer free Prime shipping.</span></p>', 20, 'No brand', '3 months', 'Black', 'M', '2021-03-12 00:00:08', '2021-03-12 00:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `original` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `original`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 1, 'images/products/apple2.jpg', 'images/products/apple2.jpg', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(2, 2, 'images/products/phone3.jpg', 'images/products/phone3.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(3, 3, 'images/products/phone2.jpg', 'images/products/phone2.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(4, 4, 'images/products/pan.jpg', 'images/products/pan.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(5, 5, 'images/products/iconglove.jpg', 'images/products/iconglove.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(6, 6, 'images/products/mask.jpg', 'images/products/mask.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(7, 7, 'images/products/ram.jpg', 'images/products/ram.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(8, 8, 'images/products/phonecase.jpg', 'images/products/phonecase.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(9, 9, 'images/products/phonecase1.jpg', 'images/products/phonecase1.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(10, 10, 'images/products/female-tshirt.jpg', 'images/products/female-tshirt.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(11, 11, 'images/products/bath.jpg', 'images/products/bath.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(12, 12, 'images/products/bath1.jpg', 'images/products/bath1.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(13, 13, 'images/products/kitchen2.jpg', 'images/products/kitchen2.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(14, 14, 'images/products/tshirt2.jpg', 'images/products/tshirt2.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(15, 15, 'images/products/charger.jpg', 'images/products/charger.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(16, 16, 'images/products/grooming1.jpg', 'images/products/grooming1.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(17, 17, 'images/products/lego2.jpg', 'images/products/lego2.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(18, 18, 'images/products/lego1.jpg', 'images/products/lego1.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(19, 19, 'images/products/mango.jpg', 'images/products/mango.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(20, 20, 'images/products/coffee.jpg', 'images/products/coffee.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(21, 21, 'images/products/macbook2.jpg', 'images/products/macbook2.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(22, 22, 'images/products/macbook2.jpg', 'images/products/macbook2.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(23, 23, 'images/products/kitchen3.jpg', 'images/products/kitchen3.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(24, 24, 'images/products/shoes.jpg', 'images/products/shoes.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(25, 25, 'images/products/bag.jpg', 'images/products/bag.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(26, 26, 'images/products/pet.jpg', 'images/products/pet.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(27, 27, 'images/products/coke.jpg', 'images/products/coke.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(28, 28, 'images/products/detol.jpg', 'images/products/detol.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(29, 29, 'images/products/apple.jpg', 'images/products/apple.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(30, 30, 'images/products/diaper.jpg', 'images/products/diaper.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(31, 31, 'images/products/bed.jpg', 'images/products/bed.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(32, 32, 'images/products/bed2.jpg', 'images/products/bed2.jpg', '2021-03-11 22:05:34', '2021-03-11 22:05:34'),
(33, 33, '/images/products/h2lGsR9yISkKQQt9.jpeg', '/images/products/h2lGsR9yISkKQQt9_thumb.jpeg', '2021-03-12 00:01:27', '2021-03-12 00:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(2, 'shipper', 'web', '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(3, 'user', 'web', '2021-03-11 22:05:33', '2021-03-11 22:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subCategory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `subCategory_name`, `logo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mobile', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(2, 1, 'Laptops', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(3, 1, 'Desktops', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(4, 2, 'Phone Cases', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(5, 2, 'Chargers', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(6, 2, 'Screen protectors', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(7, 3, 'Mens grooming', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(8, 3, 'Deodrants', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(9, 4, 'Toys & Games', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(10, 5, 'Beverages', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(11, 5, 'Breakfast', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(12, 5, 'Fruits', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(13, 5, 'Pet Food', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(14, 6, 'Bath', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(15, 6, 'Decor', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(16, 6, 'Furniture', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(17, 6, 'Appliances & Electicals', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(18, 6, 'Kitchen Utensils', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(19, 7, 'Mens Collections', 'logo/ZPkOP3KRsyPNCGN5qH0wrOSTLrDdR4wIoGUMCR74.jpg', '2021-03-11 22:05:33', '2021-03-11 22:57:37'),
(20, 7, 'Exercise & Fitness', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(21, 7, 'Travel & Luggage', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(22, 8, 'Riding gear', NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `logo`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Default', 'admin@mail.com', NULL, '$2y$10$sKKXZP8cG6prL8kFOxkUkO9LeglP/2K4H/7jhcoU9iKZP9KvGhoRy', NULL, NULL, NULL, 1, NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(2, 'User Default', 'user@mail.com', NULL, '$2y$10$r3b5CVNTWHFd12HAAnY.Pe62Deo4uiGj6VuUgzxYXh9wtJ5UKzsSi', NULL, NULL, 'avater/7eiJeQz8SahJnDAYQqRO9FPO0JdpH3kfrRpoK4OS.png', 1, NULL, '2021-03-11 22:05:33', '2021-03-11 22:35:27'),
(3, 'Shipper Default', 'shipper@mail.com', NULL, '$2y$10$RQGF9LQUybTcSA2b4y23BO1mFFHyNVMot/YbajPr0kbpAr0jJEGIe', NULL, NULL, NULL, 1, NULL, '2021-03-11 22:05:33', '2021-03-11 22:05:33'),
(8, 'Faiza', 'zaman.faija@gmail.com', NULL, '$2y$10$rPAoDJ78ifNviGISSE3eJetznBXv8TVs002Y6N.f9EmYtX2V1nRX6', NULL, NULL, 'avater/avtKcscnZ6cmaf54cZN3qK3DyqaTuAXBZHmzZAB3.jpg', 1, NULL, '2021-03-11 23:25:35', '2021-03-11 23:25:35'),
(9, 'Ratul', 'deliveryboy@mail.com', NULL, '$2y$10$d7pyINj0tyG6vMk9OXzb/OMOrRzrIq51PbEF8bQoZy8A5Ozwdnrz.', NULL, NULL, NULL, 1, NULL, '2021-03-12 11:37:49', '2021-03-12 11:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `user_id`, `phone`, `address`) VALUES
(1, 8, '0171234567', 'Fazil chest, subidbazar'),
(2, 9, '8801512345678', 'biyanibazar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bikashes`
--
ALTER TABLE `bikashes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bikashes_user_id_foreign` (`user_id`);

--
-- Indexes for table `carousels`
--
ALTER TABLE `carousels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Indexes for table `customer_questions`
--
ALTER TABLE `customer_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flash_sales_product_id_unique` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_subcategory_name_unique` (`subCategory_name`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bikashes`
--
ALTER TABLE `bikashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carousels`
--
ALTER TABLE `carousels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer_questions`
--
ALTER TABLE `customer_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bikashes`
--
ALTER TABLE `bikashes`
  ADD CONSTRAINT `bikashes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
