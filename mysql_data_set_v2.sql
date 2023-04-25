-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.31 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for minecart
DROP DATABASE IF EXISTS `minecart`;
CREATE DATABASE IF NOT EXISTS `minecart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `minecart`;

-- Dumping structure for table minecart.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_quantity` int NOT NULL,
  `o_date` varchar(450) NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table minecart.orders: ~5 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`o_id`, `p_id`, `u_id`, `o_quantity`, `o_date`) VALUES
	(25, 3, 1, 3, '2021-05-15'),
	(26, 2, 1, 1, '2021-05-15'),
	(48, 1, 3, 1, '2022-11-22'),
	(49, 10, 3, 1, '2022-11-22'),
	(50, 14, 3, 1, '2022-11-22');

-- Dumping structure for table minecart.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `category` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(450) NOT NULL,
  `detail` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table minecart.products: ~18 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `detail`) VALUES
	(1, 'APPLE iPhone 14 Pro (Silver, 1 TB)', 'Mobile', 189900, 'iphone-1.jpeg', NULL),
	(2, 'SAMSUNG S20 FE 5G (Cloud Navy, 128 GB)', 'Mobile', 31990, 'samsung.jpeg', NULL),
	(3, 'SAMSUNG Galaxy S22 Plus 5G (Green, 128 GB)', 'Mobile', 84999, 'samsung-s22.jpeg', NULL),
	(4, 'ASUS ROG Strix G15 Ryzen 7 Octa Core 4800H', 'Laptop', 87990, 'asus-laptop1.jpeg', NULL),
	(5, 'Lenovo Tab M8 (2nd Gen) FHD 3 GB RAM 32 GB ROM 8 inch with Wi-Fi+4G Tablet', 'Tablet', 11999, 'lenovo-tab1.jpeg', NULL),
	(6, 'Lenovo Legion 5 Ryzen 5 Hexa Core 4600H', 'Laptop', 67999, 'lenovo-laptop1.jpeg', NULL),
	(7, 'ASUS ROG 5s (Phantom Black, 256 GB)', 'Mobile', 57999, 'asus-5s.jpeg', NULL),
	(8, 'HP Pavilion Core i5 (4 GB DDR4/1 TB/Windows 10 Home/21.45 Inch Screen/22C0015IN)', 'Computer', 59990, 'HP-Pavilion-Core-i5.jpeg', NULL),
	(9, 'MSI 12700k  16 GB RAM/RTX 3070 LHR Graphics/1 TB SSD Capacity', 'Computer', 276000, 'MSI-12700k.jpeg', NULL),
	(10, 'Mi 5A 80 cm (32 inch) HD Ready LED Smart Android TV with Dolby Audio (2022 Model)', 'TV', 13999, 'Mi-5A.jpeg', NULL),
	(11, 'HOLA SynerGe WIRELESS Smart Headphones  (Wireless)', 'Earphone', 249, 'Syska-20000.jpeg', NULL),
	(12, 'Syska 20000 mAh Power Bank (18 W, Fast Charging) ', 'Accessories', 1549, 'MANYCAST.jpeg', NULL),
	(13, 'MANYCAST 4K Mini PC Box with Bluetooth, Android 10, 4GB Ram 32 GB', 'PC', 4449, 'ENTWINO.jpeg', NULL),
	(14, 'ENTWINO Intel Core i5 8 GB DDR3/1 TB/120 GB SSD/Windows 10 Home', 'Desktop', 23799, 'ZEBRONICS.jpeg', NULL),
	(15, 'ZEBRONICS ZEB-WARRIOR 10 W Laptop/Desktop Speaker', 'Speaker', 699, 'PHILIPS.jpeg', NULL),
	(16, 'PHILIPS FC9352/01 (883935201280) Bagless Dry Vacuum Cleaner', 'Home-Kitchen', 8999, 'Spigen.jpeg', NULL),
	(17, 'NIKON Z6II-24-120MM DSLR Camera 24-120MM', 'Camera', 262990, 'NIKON.jpeg', NULL),
	(18, 'SONY ILCE-7SM3/BQ IN5 Mirrorless Camera Mirrorless', 'DSLR', 296990, 'ILCE-7SM3.jpeg', NULL);

-- Dumping structure for table minecart.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table minecart.users: ~2 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
	(3, 'dev', 'dev@dev.in', '123'),
	(6, 'test', 'test@test.ok', '123'),
	(7, 'test', 'test@gmail.com', '123'),
	(8, 'srhs', 'shf@dtj.dht', 'srh'),
	(9, 'srhs', 'srhsw@dthd.fgj', 'srh'),
	(10, 'test', 'testhh@wrs.dtj', '123');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
