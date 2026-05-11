-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2026 at 03:49 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `locarial`
--

-- --------------------------------------------------------

--
-- Table structure for table `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aspnetroles`
--

INSERT INTO `aspnetroles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('0e942025-01f4-4233-bae3-a1b84752517d', 'User', 'USER', NULL),
('3101c855-1cc8-45b6-a8a8-fb9d75293d30', 'Manager', 'MANAGER', NULL),
('f8904d6b-f07d-474d-a09c-f18f9f82bc8e', 'Admin', 'ADMIN', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aspnetuserroles`
--

INSERT INTO `aspnetuserroles` (`UserId`, `RoleId`) VALUES
('00904b64-cb27-4cbb-abf2-759f1dfa436d', '0e942025-01f4-4233-bae3-a1b84752517d'),
('171a08ee-d835-4c4e-bafc-e6db823f34e3', '0e942025-01f4-4233-bae3-a1b84752517d'),
('1ade55a8-6b35-404d-b3ee-e41675a2ba68', '0e942025-01f4-4233-bae3-a1b84752517d'),
('2065e624-a4ea-4bb2-9361-526c7c8d8ac5', '0e942025-01f4-4233-bae3-a1b84752517d'),
('658b9da8-56c6-48b3-90c8-83846dcac292', '0e942025-01f4-4233-bae3-a1b84752517d'),
('6a621f47-da5c-4aed-952c-06d6a0222d8e', '0e942025-01f4-4233-bae3-a1b84752517d'),
('7d82be23-e138-4e9c-8322-98b817fcb1b9', '0e942025-01f4-4233-bae3-a1b84752517d'),
('c36d8136-848d-4b31-a9bd-6cfe50127456', '0e942025-01f4-4233-bae3-a1b84752517d'),
('d47c6633-73d3-4ff3-a502-1b6596e38471', '0e942025-01f4-4233-bae3-a1b84752517d'),
('d937ee17-1706-4e3e-a57b-e8bfe0eeb74f', '0e942025-01f4-4233-bae3-a1b84752517d'),
('f769ebc9-b1e5-4b09-82f8-ade2019707e5', '0e942025-01f4-4233-bae3-a1b84752517d');

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusers`
--

CREATE TABLE `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aspnetusers`
--

INSERT INTO `aspnetusers` (`Id`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('00904b64-cb27-4cbb-abf2-759f1dfa436d', 'test16@test.com', 'TEST16@TEST.COM', 'test16@test.com', 'TEST16@TEST.COM', 0, 'AQAAAAIAAYagAAAAEDkHYJjX3dAip/0OrCtheknatMUeYlQWK2n8M2VQdL0cuI8L8vuIvrOf8Al8MJNVGQ==', '5CRC5ZS32BATGG7ZDMB77HVC67VDNNY7', '19350164-571f-4216-9f58-8d9a7c5e747a', NULL, 0, 0, NULL, 1, 0),
('171a08ee-d835-4c4e-bafc-e6db823f34e3', 'test15@test.com', 'TEST15@TEST.COM', 'test15@test.com', 'TEST15@TEST.COM', 0, 'AQAAAAIAAYagAAAAEGDuEOk16rWV25BU7RJlJEgp/TIi0ed+Qldyk9G8GzTnyz9RDFIBZUjDS+RJ9K6SGg==', 'OU3LWIW3JCZ4Z76KGSVSMQG5DWI6G6O7', 'ebfc8393-8fd5-41eb-8e26-984a47fb67d2', NULL, 0, 0, NULL, 1, 0),
('1ade55a8-6b35-404d-b3ee-e41675a2ba68', 'tesfdst1ds7@test.com', 'TESFDST1DS7@TEST.COM', 'tesfdst1ds7@test.com', 'TESFDST1DS7@TEST.COM', 0, 'AQAAAAIAAYagAAAAEOrsMjPcEYujUCxWL1r8XhWgRjWellRzQ7ptCl+Tob8sIESk8G6p70TeNM4Rf7fxzQ==', 'CMHT2Q6L6I4QNUSSUV2WL34PIHB65A4N', '7bf2ae55-98b3-4d49-906f-53e71cfd7cac', NULL, 0, 0, NULL, 1, 0),
('2065e624-a4ea-4bb2-9361-526c7c8d8ac5', 'test17@test.com', 'TEST17@TEST.COM', 'test17@test.com', 'TEST17@TEST.COM', 0, 'AQAAAAIAAYagAAAAEJycxI4a2Zy6KqslbNBJtsXGwUidK5KLXLn+V/THZqR/30xZva58oGvhNFQ915faxg==', '7FNHUVKZ2P46OUDT2DQWNXZMHUX27CSP', 'd3d321fe-fc13-440e-b966-89aff0d9f8e4', NULL, 0, 0, NULL, 1, 0),
('658b9da8-56c6-48b3-90c8-83846dcac292', 'test2@test122.com', 'TEST2@TEST122.COM', 'test2@test122.com', 'TEST2@TEST122.COM', 0, 'AQAAAAIAAYagAAAAEPFvnO4UT3JwlJxRswvGFB6yhs7R9ZzHJX7s99livbHqeIO8osoFtVgYOmyJAYe6FA==', 'RGNSEOFRGD6EJZIVX6JERYEN4Y5EHRLR', 'f8afb1ca-6bbc-476f-a01c-2bd41f45b64f', NULL, 0, 0, NULL, 1, 0),
('6a621f47-da5c-4aed-952c-06d6a0222d8e', 'test@test.com', 'TEST@TEST.COM', 'test@test.com', 'TEST@TEST.COM', 0, 'AQAAAAIAAYagAAAAENmwjackpw2U8hIDpxGDskEYHf13azK22zzEPsAPlSB7ZbaJupk2OUxlrmytNz8coQ==', 'ERGUS642TBPIVXVJ3VIRYO5UB4XU54H2', '57e62864-502a-4402-937e-eaab3abd9910', NULL, 0, 0, NULL, 1, 0),
('7d82be23-e138-4e9c-8322-98b817fcb1b9', 'test3@test.com', 'TEST3@TEST.COM', 'test3@test.com', 'TEST3@TEST.COM', 0, 'AQAAAAIAAYagAAAAEB139KCn2EO+bH19t3V/cVHtceqCQS3c/+Vf3opaaB0ezh94NdvM4r7xcpyHcpt6Dw==', 'W47QZIP6GNTBMJWSHZ77C4COCORWO7DE', '6800ab18-562c-42ba-bbc1-28122bb5194c', NULL, 0, 0, NULL, 1, 0),
('c36d8136-848d-4b31-a9bd-6cfe50127456', 'test2@test.com', 'TEST2@TEST.COM', 'test2@test.com', 'TEST2@TEST.COM', 0, 'AQAAAAIAAYagAAAAEDIvwKiuBIe2absVldwX8QUpgA3wx2r3WYWmnXf0chbRSSZ1YZtNd7EMIEwAuo4TuQ==', 'PS3Q2RVOZ5AZ3R3Z4O3BAHHHKQDYO3XN', '6cf12025-55ca-4366-8141-990542aae0ab', NULL, 0, 0, NULL, 1, 0),
('d47c6633-73d3-4ff3-a502-1b6596e38471', 'tesfds45t1ds7@test.com', 'TESFDS45T1DS7@TEST.COM', 'tesfds45t1ds7@test.com', 'TESFDS45T1DS7@TEST.COM', 0, 'AQAAAAIAAYagAAAAEL2iI6CRmxMt6961wRJrtPZgNzs064V7CURGaksyS6OlWYO3LGBJnNwpZSmrTEvxiA==', 'QIMDR4VNX6HB24YM5PHGFJLNSR7FJK32', '9d7788f4-7285-47e7-bc34-cca1da5fd104', NULL, 0, 0, NULL, 1, 0),
('d937ee17-1706-4e3e-a57b-e8bfe0eeb74f', 'test1ds7@test.com', 'TEST1DS7@TEST.COM', 'test1ds7@test.com', 'TEST1DS7@TEST.COM', 0, 'AQAAAAIAAYagAAAAEGUaRJQ7CpX80ErWw497mTyTrUoZW9Nq6rx3oebG5rOidwI0BTrwQ33uhR5KbcVPzA==', 'SXLNTINX6ANMMVDWEZAP4CTTBG3BZUCT', '43651da1-653e-4fce-8686-67f8a88a702f', NULL, 0, 0, NULL, 1, 0),
('f769ebc9-b1e5-4b09-82f8-ade2019707e5', 'tesfds45t1dffds7@test.com', 'TESFDS45T1DFFDS7@TEST.COM', 'tesfds45t1dffds7@test.com', 'TESFDS45T1DFFDS7@TEST.COM', 0, 'AQAAAAIAAYagAAAAENsGiqg7vR9u2fs6Il6yer4B9OjcnXYjustvFJF8vQstBl6o/rS3c1pfTIjcoNWLjA==', 'KQO2XVAKX5PXGMSF4AD6B3AFZRWG6RHF', '987d0a9e-0ffb-4bac-bba1-f7bf7939e195', NULL, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `Id_Categorie` int NOT NULL,
  `libelle_categorie` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`Id_Categorie`, `libelle_categorie`) VALUES
(1, 'Ordinateurs Portables'),
(2, 'Ordinateurs Bureau'),
(3, 'USB'),
(4, 'Imprimantes'),
(6, 'Claviers'),
(7, 'Téléphones'),
(8, 'Tablettes'),
(9, 'Écrans'),
(10, 'Vidéoprojecteurs'),
(11, 'Câbles et Adaptateurs'),
(12, 'Stockage'),
(13, 'Audio'),
(14, 'Webcams'),
(15, 'Accessoires Gaming');

-- --------------------------------------------------------

--
-- Table structure for table `materiel`
--

CREATE TABLE `materiel` (
  `Id_Materiel` int NOT NULL,
  `nom_materiel` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `valeur` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_categorie` int NOT NULL,
  `image` text COLLATE utf8mb4_general_ci,
  `prix` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materiel`
--

INSERT INTO `materiel` (`Id_Materiel`, `nom_materiel`, `description`, `valeur`, `id_categorie`, `image`, `prix`) VALUES
(19, 'Dell XPS', 'Ordinateur portable puissant, Intel Core i7, 16 Go RAM, SSD 512 Go', 'Bon état', 1, 'dell.jpg', 20.00),
(20, 'Lenovo ThinkPad', 'Ordinateur portable fiable, Intel Core i5, 8 Go RAM, SSD 256 Go', 'Bon état', 1, 'lenovo.jpg', 25.00),
(21, 'PC Gamer', 'PC bureau gaming, Ryzen 9 9800X3D, RTX 4070, 32 Go RAM', 'Bon état', 2, 'pc.jpg', 40.00),
(22, 'Asus VivoPC', 'PC bureau compact et silencieux, Intel Core i5, 16 Go RAM', 'Bon état', 2, 'asus.jpg', 35.00),
(23, 'Usb KingStone', 'USB 32 GB haute vitesse, USB 3.0', 'Bon état', 3, 'usb.jpg', 30.00),
(24, 'SanDisk Ultra', 'USB 64 GB haute vitesse', 'Bon état', 3, 'sandisk.jpg', 15.00),
(25, 'Imprimante HP', 'Imprimante laser blanche, Wi-Fi et USB', 'Bon état', 4, 'hp.jpg', 10.00),
(26, 'Canon Pixma', 'Imprimante couleur compacte avec scanner', 'Bon état', 4, 'canon.jpg', 12.00),
(27, 'Clavier mécanique', 'Clavier mécanique RGB, switches de qualité', 'Bon état', 6, 'clavier.jpg', 80.00),
(28, 'Souris Gamer', 'Souris gaming 16000 DPI, boutons programmables', 'Bon état', 6, 'souris.jpg', 50.00),
(29, 'iPhone 14', 'Smartphone Apple, écran 6.1 pouces, 128 Go, excellent état', 'Bon état', 7, 'iphone14.jpg', 15.00),
(30, 'Samsung Galaxy S23', 'Smartphone Android, écran 6.1 pouces, 256 Go', 'Bon état', 7, 'galaxys23.jpg', 12.00),
(31, 'Google Pixel 7', 'Smartphone Google, écran 6.3 pouces, 128 Go', 'Bon état', 7, 'pixel7.jpg', 10.00),
(32, 'iPad Pro 12.9', 'Tablette Apple, écran 12.9 pouces, 256 Go, Wi-Fi', 'Bon état', 8, 'ipadpro.jpg', 20.00),
(33, 'Samsung Galaxy Tab S8', 'Tablette Android, écran 11 pouces, 128 Go', 'Bon état', 8, 'tabs8.jpg', 15.00),
(34, 'Microsoft Surface Pro 9', 'Tablette Windows, écran 13 pouces, 256 Go', 'Bon état', 8, 'surfacepro9.jpg', 25.00),
(35, 'Dell UltraSharp 27\"', 'Écran 4K 27 pouces, USB-C, DisplayPort', 'Bon état', 9, 'dellultrasharp.jpg', 10.00),
(36, 'LG 32\" 4K', 'Écran 4K 32 pouces, HDR, HDMI', 'Bon état', 9, 'lg32.jpg', 12.00),
(37, 'Samsung 24\" FHD', 'Écran Full HD 24 pouces, HDMI, VGA', 'Bon état', 9, 'samsung24.jpg', 8.00),
(38, 'Epson EB-X51', 'Vidéoprojecteur XGA 3800 lumens, HDMI', 'Bon état', 10, 'epsonx51.jpg', 20.00),
(39, 'BenQ MH535', 'Vidéoprojecteur Full HD 3600 lumens', 'Bon état', 10, 'benqmh535.jpg', 25.00),
(40, 'Câble HDMI 2m', 'Câble HDMI 2.0, 4K, 2 mètres', 'Bon état', 11, 'hdmi2m.jpg', 2.00),
(41, 'Adaptateur USB-C vers HDMI', 'Adaptateur USB-C vers HDMI 4K', 'Bon état', 11, 'usbc-hdmi.jpg', 3.00),
(42, 'Câble USB-C 1m', 'Câble USB-C charge rapide 1 mètre', 'Bon état', 11, 'usbc1m.jpg', 2.00),
(43, 'Disque dur externe 1To', 'Disque dur portable USB 3.0, 1 To', 'Bon état', 12, 'hdd1to.jpg', 8.00),
(44, 'SSD externe 500Go', 'SSD portable USB 3.1, 500 Go, rapide', 'Bon état', 12, 'ssd500.jpg', 10.00),
(45, 'Casque Sony WH-1000XM5', 'Casque Bluetooth, réduction de bruit active', 'Bon état', 13, 'sonywh1000.jpg', 15.00),
(46, 'Enceinte JBL Charge 5', 'Enceinte Bluetooth portable, waterproof', 'Bon état', 13, 'jblcharge5.jpg', 8.00),
(47, 'Micro Blue Yeti', 'Microphone USB professionnel, idéal streaming', 'Bon état', 13, 'blueyeti.jpg', 10.00),
(48, 'Logitech C920', 'Webcam Full HD 1080p, idéale visioconférence', 'Bon état', 14, 'logitechc920.jpg', 5.00),
(49, 'Logitech StreamCam', 'Webcam 1080p 60fps, USB-C, streaming', 'Bon état', 14, 'streamcam.jpg', 8.00),
(50, 'Manette Xbox Series X', 'Manette sans fil Xbox, USB-C, compatible PC', 'Bon état', 15, 'xboxcontroller.jpg', 5.00),
(51, 'Tapis de souris XXL', 'Tapis de souris gaming grand format 90x40cm', 'Bon état', 15, 'mousepat.jpg', 3.00),
(52, 'Casque gaming HyperX', 'Casque gaming 7.1 surround, microphone rétractable', 'Bon état', 15, 'hyperx.jpg', 8.00),
(53, 'MacBook Pro 14\"', 'Apple M3 Pro, 18 Go RAM, SSD 512 Go, écran Liquid Retina', 'Bon état', 1, 'macbookpro14.jpg', 35.00),
(54, 'HP EliteBook 840', 'Intel Core i7, 16 Go RAM, SSD 512 Go, écran 14 pouces FHD', 'Bon état', 1, 'hpelitebook840.jpg', 22.00),
(55, 'Asus ZenBook 15', 'Intel Core i5, 8 Go RAM, SSD 256 Go, écran OLED 15 pouces', 'Bon état', 1, 'asuszenbook15.jpg', 18.00),
(56, 'Mac Mini M2', 'Apple M2, 16 Go RAM, SSD 256 Go, compact et silencieux', 'Bon état', 2, 'macminim2.jpg', 30.00),
(57, 'HP ProDesk 400', 'Intel Core i5, 8 Go RAM, SSD 256 Go, tour compacte', 'Bon état', 2, 'hpprodesk400.jpg', 20.00),
(58, 'Lenovo ThinkCentre M720', 'Intel Core i7, 16 Go RAM, SSD 512 Go, format mini', 'Bon état', 2, 'lenovom720.jpg', 25.00),
(59, 'Corsair Flash Voyager 128Go', 'USB 3.2, 128 Go, lecture 400 Mo/s', 'Bon état', 3, 'corsairvoyager.jpg', 10.00),
(60, 'Samsung Bar Plus 64Go', 'USB 3.1, 64 Go, design métal résistant', 'Bon état', 3, 'samsungbar.jpg', 8.00),
(61, 'Epson EcoTank ET-2850', 'Imprimante jet d encre couleur, Wi-Fi, réservoir rechargeable', 'Bon état', 4, 'epsonetank.jpg', 15.00),
(62, 'Brother HL-L2350DW', 'Imprimante laser noir et blanc, Wi-Fi, recto-verso automatique', 'Bon état', 4, 'brotherhl.jpg', 12.00),
(63, 'Logitech MX Keys', 'Clavier sans fil rétroéclairé, multi-appareils, rechargeable', 'Bon état', 6, 'logitechmxkeys.jpg', 15.00),
(64, 'Keychron K2', 'Clavier mécanique compact 75%, switches Brown, rétroéclairage RGB', 'Bon état', 6, 'keychronk2.jpg', 20.00),
(65, 'Apple Magic Keyboard', 'Clavier sans fil Apple, Touch ID, compatible Mac et iPad', 'Bon état', 6, 'applemagic.jpg', 12.00),
(66, 'iPhone 15 Pro', 'Smartphone Apple, puce A17 Pro, 256 Go, titane naturel', 'Bon état', 7, 'iphone15pro.jpg', 20.00),
(67, 'Samsung Galaxy S24', 'Smartphone Android, Snapdragon 8 Gen 3, 256 Go', 'Bon état', 7, 'galaxys24.jpg', 18.00),
(68, 'OnePlus 12', 'Smartphone Android, Snapdragon 8 Gen 3, 256 Go, charge 100W', 'Bon état', 7, 'oneplus12.jpg', 15.00),
(69, 'iPad Air 5', 'Tablette Apple, puce M1, écran 10.9 pouces, 64 Go', 'Bon état', 8, 'ipadair5.jpg', 18.00),
(70, 'Lenovo Tab P12', 'Tablette Android, écran 12.7 pouces, 128 Go, stylet inclus', 'Bon état', 8, 'lenovotabp12.jpg', 15.00),
(71, 'BenQ PD2705U', 'Écran 4K 27 pouces, USB-C, calibré usine pour design', 'Bon état', 9, 'benqpd2705u.jpg', 15.00),
(72, 'ASUS ProArt 32\"', 'Écran 4K 32 pouces, HDR, 99% sRGB, idéal création', 'Bon état', 9, 'asusproart32.jpg', 18.00),
(73, 'Optoma HD28HDR', 'Vidéoprojecteur Full HD, 3600 lumens, HDR', 'Bon état', 10, 'optimahd28.jpg', 22.00),
(74, 'ViewSonic PX748-4K', 'Vidéoprojecteur 4K, 4000 lumens, HDR10', 'Bon état', 10, 'viewsonicpx748.jpg', 30.00),
(75, 'Hub USB-C 7 en 1', 'Hub USB-C avec HDMI, USB 3.0, SD, microSD, USB-C PD', 'Bon état', 11, 'hubusbс.jpg', 5.00),
(76, 'Câble DisplayPort 2m', 'Câble DisplayPort 1.4, 4K 144Hz, 2 mètres', 'Bon état', 11, 'cabledp2m.jpg', 3.00),
(77, 'WD My Passport 2To', 'Disque dur portable USB 3.0, 2 To, noir', 'Bon état', 12, 'wdpassport2to.jpg', 12.00),
(78, 'Samsung T7 1To', 'SSD portable USB 3.2, 1 To, 1050 Mo/s', 'Bon état', 12, 'samsungt71to.jpg', 15.00),
(79, 'AirPods Pro 2', 'Écouteurs Apple, réduction de bruit active, USB-C', 'Bon état', 13, 'airpodspro2.jpg', 10.00),
(80, 'Bose QuietComfort 45', 'Casque Bluetooth, réduction de bruit, 24h autonomie', 'Bon état', 13, 'bosequietcomfort45.jpg', 12.00),
(81, 'Razer Kiyo Pro', 'Webcam 1080p 60fps, capteur STARVIS, USB', 'Bon état', 14, 'razerkiyo.jpg', 10.00),
(82, 'Elgato Facecam', 'Webcam 1080p 60fps, capteur Sony, pour streaming', 'Bon état', 14, 'elgatofacecam.jpg', 12.00),
(83, 'Manette PS5 DualSense', 'Manette PlayStation 5, retour haptique, compatible PC', 'Bon état', 15, 'dualsense.jpg', 8.00),
(84, 'Clavier gaming Corsair K70', 'Clavier mécanique gaming, switches Cherry MX, RGB', 'Bon état', 15, 'corsaik70.jpg', 15.00),
(85, 'Souris gaming Razer DeathAdder', 'Souris gaming 20000 DPI, ergonomique, RGB', 'Bon état', 15, 'razerda.jpg', 8.00),
(86, 'Acer Aspire 5', 'Intel Core i5, 8 Go RAM, SSD 512 Go, écran 15.6 pouces FHD', 'Bon état', 1, 'acerasp5.jpg', 18.00),
(87, 'MSI Modern 14', 'Intel Core i7, 16 Go RAM, SSD 512 Go, écran 14 pouces FHD', 'Bon état', 1, 'msimodern14.jpg', 22.00),
(88, 'HP Pavilion 15', 'AMD Ryzen 5, 8 Go RAM, SSD 256 Go, écran 15.6 pouces', 'Bon état', 1, 'hppavilion15.jpg', 16.00),
(89, 'Razer Blade 15', 'Intel Core i7, RTX 3070, 16 Go RAM, SSD 1 To', 'Bon état', 1, 'razerblade15.jpg', 45.00),
(90, 'Samsung Galaxy Book3', 'Intel Core i5, 8 Go RAM, SSD 256 Go, écran AMOLED 15 pouces', 'Bon état', 1, 'galaxybook3.jpg', 20.00),
(91, 'Toshiba Satellite Pro', 'Intel Core i3, 8 Go RAM, SSD 128 Go, écran 14 pouces', 'Bon état', 1, 'toshibasatpro.jpg', 14.00),
(92, 'Huawei MateBook D15', 'AMD Ryzen 5, 16 Go RAM, SSD 512 Go, écran 15.6 pouces', 'Bon état', 1, 'huaweimatebd15.jpg', 18.00),
(93, 'LG Gram 14', 'Intel Core i5, 16 Go RAM, SSD 512 Go, ultraléger 999g', 'Bon état', 1, 'lggram14.jpg', 25.00),
(94, 'Fujitsu LifeBook E5512', 'Intel Core i5, 8 Go RAM, SSD 256 Go, robuste entreprise', 'Bon état', 1, 'fujitsulifebook.jpg', 19.00),
(95, 'Sony VAIO SX14', 'Intel Core i7, 16 Go RAM, SSD 512 Go, ultraléger carbone', 'Bon état', 1, 'sonyvaiosx14.jpg', 28.00),
(96, 'Alienware m15 R7', 'AMD Ryzen 9, RTX 3080, 32 Go RAM, SSD 1 To gaming', 'Bon état', 1, 'alienwarem15.jpg', 55.00),
(97, 'Gigabyte Aero 16', 'Intel Core i7, RTX 3070 Ti, 16 Go RAM, écran OLED 4K', 'Bon état', 1, 'gigabyteaero16.jpg', 42.00),
(98, 'Panasonic Toughbook 55', 'Intel Core i5, 8 Go RAM, SSD 256 Go, robuste militaire', 'Bon état', 1, 'panasonictoughbook.jpg', 30.00),
(99, 'Dell OptiPlex 7090', 'Intel Core i7, 16 Go RAM, SSD 512 Go, format mini tour', 'Bon état', 2, 'delloptiplex7090.jpg', 28.00),
(100, 'Acer Veriton X4', 'Intel Core i5, 8 Go RAM, SSD 256 Go, tour compacte', 'Bon état', 2, 'acerveritonx4.jpg', 18.00),
(101, 'HP Z2 Tower G9', 'Intel Core i9, 32 Go RAM, SSD 1 To, workstation professionnelle', 'Bon état', 2, 'hpz2tower.jpg', 60.00),
(102, 'Lenovo IdeaCentre 5', 'AMD Ryzen 5, 16 Go RAM, SSD 512 Go, tour familiale', 'Bon état', 2, 'lenovoideacentre5.jpg', 22.00),
(103, 'Apple iMac 24\"', 'Apple M3, 8 Go RAM, SSD 256 Go, écran Retina 24 pouces intégré', 'Bon état', 2, 'imac24.jpg', 50.00),
(104, 'MSI MAG Infinite S3', 'Intel Core i5, RTX 3060, 16 Go RAM, SSD 512 Go gaming', 'Bon état', 2, 'msimaginfinite.jpg', 38.00),
(105, 'NEC Mate ML', 'Intel Core i5, 8 Go RAM, SSD 256 Go, compact entreprise', 'Bon état', 2, 'necmateml.jpg', 20.00),
(106, 'Fujitsu Esprimo P9010', 'Intel Core i7, 16 Go RAM, SSD 512 Go, tour entreprise', 'Bon état', 2, 'fujitsuesprimo.jpg', 30.00),
(107, 'HP Envy Desktop TE02', 'Intel Core i7, 16 Go RAM, SSD 1 To, tour multimédia', 'Bon état', 2, 'hpenvy te02.jpg', 35.00),
(108, 'Acer Predator Orion 3000', 'Intel Core i7, RTX 3070, 16 Go RAM, SSD 1 To gaming', 'Bon état', 2, 'acerpredatororion.jpg', 48.00),
(109, 'Dell XPS Tower', 'Intel Core i9, 32 Go RAM, SSD 1 To, design premium', 'Bon état', 2, 'dellxpstower.jpg', 55.00),
(110, 'Lenovo Legion T5', 'AMD Ryzen 7, RTX 3060, 16 Go RAM, SSD 512 Go gaming', 'Bon état', 2, 'lenovolegiont5.jpg', 40.00),
(111, 'Shuttle XH610', 'Intel Core i5, 8 Go RAM, SSD 256 Go, mini PC compact', 'Bon état', 2, 'shuttlexh610.jpg', 22.00),
(112, 'Lexar JumpDrive 256Go', 'USB 3.1, 256 Go, lecture 150 Mo/s', 'Bon état', 3, 'lexarjd256.jpg', 12.00),
(113, 'PNY Turbo 128Go', 'USB 3.0, 128 Go, design compact', 'Bon état', 3, 'pnyturbo128.jpg', 8.00),
(114, 'Verbatim Store n Go 64Go', 'USB 3.0, 64 Go, capuchon rétractable', 'Bon état', 3, 'verbatimstorongo.jpg', 6.00),
(115, 'Transcend JetFlash 920 256Go', 'USB 3.2, 256 Go, lecture 420 Mo/s', 'Bon état', 3, 'transcendjf920.jpg', 14.00),
(116, 'Kingston DataTraveler Max 512Go', 'USB 3.2 Gen 2, 512 Go, lecture 1000 Mo/s', 'Bon état', 3, 'kingstondtmax.jpg', 20.00),
(117, 'Toshiba TransMemory 32Go', 'USB 3.0, 32 Go, compact et léger', 'Bon état', 3, 'toshibatransmemory.jpg', 5.00),
(118, 'Silicon Power Blaze B05 128Go', 'USB 3.2, 128 Go, résistant eau et chocs', 'Bon état', 3, 'spblazeB05.jpg', 9.00),
(119, 'Emtec Click Secure 64Go', 'USB 3.2, 64 Go, chiffrement matériel AES', 'Bon état', 3, 'emtecclicksecure.jpg', 10.00),
(120, 'HP x796w 256Go', 'USB 3.1, 256 Go, design métal brossé', 'Bon état', 3, 'hpx796w.jpg', 13.00),
(121, 'Integral Fusion 128Go', 'USB 3.0, 128 Go, corps métal ultra compact', 'Bon état', 3, 'integralfusion.jpg', 8.00),
(122, 'Patriot Supersonic Rage 512Go', 'USB 3.2, 512 Go, lecture 600 Mo/s', 'Bon état', 3, 'patriotsupersonic.jpg', 18.00),
(123, 'Sandisk Ultra Dual 128Go', 'USB-C et USB-A, 128 Go, compatible smartphones', 'Bon état', 3, 'sandiskdual128.jpg', 11.00),
(124, 'Crucial 64Go', 'USB 3.0, 64 Go, fiable et rapide', 'Bon état', 3, 'crucial64.jpg', 7.00),
(125, 'HP LaserJet Pro M404', 'Imprimante laser monochrome, Wi-Fi, 38 ppm', 'Bon état', 4, 'hplaserprom404.jpg', 14.00),
(126, 'Epson Expression Home XP-5200', 'Imprimante jet encre couleur, Wi-Fi, scanner intégré', 'Bon état', 4, 'epsonxp5200.jpg', 10.00),
(127, 'Brother MFC-L2750DW', 'Imprimante laser multifonction, Wi-Fi, recto-verso', 'Bon état', 4, 'brothermfcl2750.jpg', 15.00),
(128, 'Canon PIXMA TS8350', 'Imprimante jet encre couleur, Wi-Fi, Bluetooth, 6 couleurs', 'Bon état', 4, 'canonpixmats8350.jpg', 12.00),
(129, 'Lexmark MB2236adw', 'Imprimante laser multifonction, Wi-Fi, scanner ADF', 'Bon état', 4, 'lexmarkmb2236.jpg', 16.00),
(130, 'Samsung Xpress M2020W', 'Imprimante laser monochrome, Wi-Fi, compacte', 'Bon état', 4, 'samsungxpressm2020.jpg', 10.00),
(131, 'Ricoh SP 150SUw', 'Imprimante laser multifonction, Wi-Fi, 22 ppm', 'Bon état', 4, 'ricohsp150.jpg', 12.00),
(132, 'OKI C332dn', 'Imprimante laser couleur, réseau, 26 ppm', 'Bon état', 4, 'okic332dn.jpg', 18.00),
(133, 'Xerox B210', 'Imprimante laser monochrome, Wi-Fi, 31 ppm', 'Bon état', 4, 'xeroxb210.jpg', 13.00),
(134, 'Kodak Hero 9.1', 'Imprimante jet encre multifonction, Wi-Fi, écran tactile', 'Bon état', 4, 'kodakhero91.jpg', 11.00),
(135, 'Dell E525w', 'Imprimante laser couleur multifonction, Wi-Fi', 'Bon état', 4, 'delle525w.jpg', 15.00),
(136, 'Pantum P2500W', 'Imprimante laser monochrome, Wi-Fi, compacte économique', 'Bon état', 4, 'pantump2500w.jpg', 9.00),
(137, 'Kyocera ECOSYS M2040dn', 'Imprimante laser multifonction, réseau, recto-verso', 'Bon état', 4, 'kyoceraecosysm2040.jpg', 20.00),
(138, 'Razer BlackWidow V3', 'Clavier mécanique gaming, switches Razer Green, RGB', 'Bon état', 6, 'razerblackwidowv3.jpg', 18.00),
(139, 'Microsoft Ergonomic Keyboard', 'Clavier ergonomique sans fil, repose-poignets intégré', 'Bon état', 6, 'msergokbd.jpg', 12.00),
(140, 'Corsair K95 RGB Platinum', 'Clavier mécanique gaming, Cherry MX Speed, macro keys', 'Bon état', 6, 'corsairk95.jpg', 25.00),
(141, 'Logitech G915 TKL', 'Clavier mécanique sans fil, switches GL Tactile, RGB', 'Bon état', 6, 'logitechg915tkl.jpg', 22.00),
(142, 'SteelSeries Apex Pro', 'Clavier mécanique, switches ajustables OmniPoint, OLED', 'Bon état', 6, 'steelseriesapexpro.jpg', 28.00),
(143, 'Ducky One 3', 'Clavier mécanique 100%, Cherry MX Brown, double shot PBT', 'Bon état', 6, 'duckyone3.jpg', 20.00),
(144, 'Anne Pro 2', 'Clavier mécanique 60%, Bluetooth, switches Gateron', 'Bon état', 6, 'annepro2.jpg', 18.00),
(145, 'HHKB Professional Hybrid', 'Clavier Topre 60%, sans fil, ultra premium', 'Bon état', 6, 'hhkbhybrid.jpg', 35.00),
(146, 'Varmilo VA87M', 'Clavier mécanique TKL, Cherry MX Red, PBT keycaps', 'Bon état', 6, 'varmilova87m.jpg', 22.00),
(147, 'Filco Majestouch 2', 'Clavier mécanique TKL, Cherry MX Brown, robuste', 'Bon état', 6, 'filcomajestouch2.jpg', 20.00),
(148, 'Leopold FC900R', 'Clavier mécanique 100%, Cherry MX Red, PBT double shot', 'Bon état', 6, 'leopoldfc900r.jpg', 22.00),
(149, 'Topre Realforce R2', 'Clavier Topre 100%, switches électrostatiques premium', 'Bon état', 6, 'toprerealforcer2.jpg', 40.00),
(150, 'Akko 3068B', 'Clavier mécanique 65%, Bluetooth, switches Akko CS', 'Bon état', 6, 'akko3068b.jpg', 15.00),
(151, 'Xiaomi 13 Pro', 'Snapdragon 8 Gen 2, 256 Go, charge 120W, Leica camera', 'Bon état', 7, 'xiaomi13pro.jpg', 14.00),
(152, 'Sony Xperia 5 V', 'Snapdragon 8 Gen 2, écran OLED 6.1 pouces, 128 Go', 'Bon état', 7, 'sonyxperia5v.jpg', 16.00),
(153, 'OnePlus 11', 'Snapdragon 8 Gen 2, 256 Go, charge 100W, Hasselblad', 'Bon état', 7, 'oneplus11.jpg', 15.00),
(154, 'Motorola Edge 40 Pro', 'Snapdragon 8 Gen 2, 256 Go, charge 125W, IP68', 'Bon état', 7, 'motorolaedge40pro.jpg', 14.00),
(155, 'Nokia XR21', 'Snapdragon 695, 128 Go, robuste IP69K, 5G', 'Bon état', 7, 'nokiaxr21.jpg', 12.00),
(156, 'Fairphone 5', 'Snapdragon 8 Gen 1, 256 Go, éco-responsable, réparable', 'Bon état', 7, 'fairphone5.jpg', 13.00),
(157, 'Oppo Find X6 Pro', 'Snapdragon 8 Gen 2, 256 Go, charge 80W, Hasselblad', 'Bon état', 7, 'oppofindx6pro.jpg', 16.00),
(158, 'Realme GT 5 Pro', 'Snapdragon 8 Gen 3, 256 Go, charge 240W ultra rapide', 'Bon état', 7, 'realmegt5pro.jpg', 15.00),
(159, 'Asus ROG Phone 7', 'Snapdragon 8 Gen 2, 512 Go, gaming phone, 165Hz', 'Bon état', 7, 'asusrogphone7.jpg', 20.00),
(160, 'Vivo X90 Pro', 'Dimensity 9200, 256 Go, Zeiss camera, charge 120W', 'Bon état', 7, 'vivox90pro.jpg', 16.00),
(161, 'Honor Magic 5 Pro', 'Snapdragon 8 Gen 2, 512 Go, charge 66W, triple camera', 'Bon état', 7, 'honormagic5pro.jpg', 18.00),
(162, 'ZTE Axon 50 Ultra', 'Snapdragon 8 Gen 1, 256 Go, caméra sous écran', 'Bon état', 7, 'zteaxon50ultra.jpg', 14.00),
(163, 'Samsung Galaxy Tab A8', 'Android, écran 10.5 pouces, 64 Go, Wi-Fi', 'Bon état', 8, 'samsungtaba8.jpg', 10.00),
(164, 'Huawei MatePad 11', 'Android, écran 10.95 pouces, 128 Go, stylet compatible', 'Bon état', 8, 'huaweimatepad11.jpg', 14.00),
(165, 'Lenovo Tab M10 Plus', 'Android, écran 10.6 pouces, 128 Go, Wi-Fi', 'Bon état', 8, 'lenovotabm10plus.jpg', 12.00),
(166, 'Amazon Fire HD 10', 'Fire OS, écran 10.1 pouces, 32 Go, Alexa intégré', 'Bon état', 8, 'amazonfireHD10.jpg', 8.00),
(167, 'Xiaomi Pad 6', 'Snapdragon 870, écran 11 pouces 144Hz, 128 Go', 'Bon état', 8, 'xiaomipad6.jpg', 16.00),
(168, 'Realme Pad X', 'Snapdragon 695, écran 11 pouces, 128 Go, 4G', 'Bon état', 8, 'realmepadx.jpg', 12.00),
(169, 'Nokia T21', 'Android 12, écran 10.4 pouces, 64 Go, batterie 8200 mAh', 'Bon état', 8, 'nokiat21.jpg', 10.00),
(170, 'Oppo Pad Air', 'Snapdragon 680, écran 10.36 pouces, 128 Go, léger', 'Bon état', 8, 'oppopadair.jpg', 12.00),
(171, 'Vivo Pad 2', 'Dimensity 9000, écran 12.1 pouces 144Hz, 256 Go', 'Bon état', 8, 'vivopad2.jpg', 18.00),
(172, 'TCL NXTPAPER 11', 'MediaTek, écran 11 pouces anti-reflet, 128 Go', 'Bon état', 8, 'tclnxtpaper11.jpg', 11.00),
(173, 'Blackview Tab 16 Pro', 'Helio G99, écran 11 pouces 2K, 256 Go, robuste', 'Bon état', 8, 'blackviewtab16pro.jpg', 14.00),
(174, 'Chuwi HiPad X Pro', 'MediaTek, écran 10.51 pouces, 128 Go, économique', 'Bon état', 8, 'chuwihipadxpro.jpg', 9.00),
(175, 'Acer Nitro 27\" 144Hz', 'FHD 27 pouces, 144Hz, 1ms, HDMI, gaming', 'Bon état', 9, 'acernitro27.jpg', 10.00),
(176, 'LG UltraWide 34\"', 'Ultra-large 34 pouces, 2560x1080, IPS, HDMI', 'Bon état', 9, 'lgultrawide34.jpg', 20.00),
(177, 'AOC 24G2', 'FHD 24 pouces, 144Hz, IPS, FreeSync, gaming', 'Bon état', 9, 'aoc24g2.jpg', 8.00),
(178, 'MSI Optix MAG274QRF', 'QHD 27 pouces, 165Hz, IPS, 1ms, gaming', 'Bon état', 9, 'msioptixmag274.jpg', 15.00),
(179, 'Philips 275M1RZ', 'QHD 27 pouces, 240Hz, Nano IPS, gaming premium', 'Bon état', 9, 'philips275m1rz.jpg', 20.00),
(180, 'ViewSonic VP2768', 'QHD 27 pouces, IPS, calibré usine, professionnel', 'Bon état', 9, 'viewsonicvp2768.jpg', 18.00),
(181, 'Eizo FlexScan EV2760', 'QHD 27 pouces, IPS, anti-reflets, bureau', 'Bon état', 9, 'eizoflexscanev2760.jpg', 22.00),
(182, 'NEC MultiSync EA271U', '4K 27 pouces, IPS, USB-C, professionnel', 'Bon état', 9, 'necmultisync ea271u.jpg', 25.00),
(183, 'Iiyama ProLite XUB2792QSU', 'QHD 27 pouces, IPS, hub USB, ergonomique', 'Bon état', 9, 'iiyamaxub2792.jpg', 16.00),
(184, 'Gigabyte M32U', '4K 32 pouces, 144Hz, IPS, USB-C, gaming', 'Bon état', 9, 'gigabytem32u.jpg', 28.00),
(185, 'Corsair Xeneon 27QHD240', 'QHD 27 pouces, 240Hz, OLED, gaming ultra', 'Bon état', 9, 'corsairxeneon27.jpg', 35.00),
(186, 'HP Z27k G3', '4K 27 pouces, IPS, USB-C 90W, professionnel', 'Bon état', 9, 'hpz27kg3.jpg', 24.00),
(187, 'Anker Nebula Capsule', 'Mini portable, Android, Wi-Fi, 200 lumens', 'Bon état', 10, 'ankernebula.jpg', 15.00),
(188, 'Epson EH-TW7000', '4K PRO-UHD, 3000 lumens, HDR', 'Bon état', 10, 'epsonehтw7000.jpg', 35.00),
(189, 'LG CineBeam HU810P', '4K laser, 2700 lumens, Wi-Fi, Bluetooth', 'Bon état', 10, 'lgcinebeamhu810p.jpg', 40.00),
(190, 'Xiaomi Mi Smart Projector 2', 'FHD, Android TV, Wi-Fi, 1300 lumens', 'Bon état', 10, 'xiaomiprojector2.jpg', 20.00),
(191, 'Acer H6543BDK', 'FHD, 4500 lumens, HDMI, portable', 'Bon état', 10, 'acerh6543bdk.jpg', 22.00),
(192, 'Sony VPL-XW5000ES', '4K laser, 5000 lumens, haut de gamme', 'Bon état', 10, 'sonyvplxw5000es.jpg', 60.00),
(193, 'Samsung The Freestyle', 'FHD portable, 360°, Tizen OS, 550 lumens', 'Bon état', 10, 'samsungfreestyle.jpg', 25.00),
(194, 'Nebula Cosmos Laser 4K', '4K laser, 2200 lumens, Android TV, Wi-Fi', 'Bon état', 10, 'nebulacosmos4k.jpg', 45.00),
(195, 'Vivitek DU4771Z', 'WUXGA laser, 6000 lumens, installation fixe', 'Bon état', 10, 'vivitekdu4771z.jpg', 50.00),
(196, 'Optoma ZK507', '4K laser, 5000 lumens, 3D, HDR', 'Bon état', 10, 'optimazk507.jpg', 55.00),
(197, 'Barco ClickShare Bar', 'FHD, conférence sans fil, collaboration', 'Bon état', 10, 'barcobar.jpg', 30.00),
(198, 'Casio XJ-F20XN', 'WXGA laser LED, 3500 lumens, longue durée de vie', 'Bon état', 10, 'casioxjf20xn.jpg', 28.00),
(199, 'Hub USB-C 7 en 1', 'HDMI, USB 3.0 x3, SD, microSD, USB-C PD', 'Bon état', 11, 'hubusbс7en1.jpg', 5.00),
(200, 'Câble DisplayPort 2m', 'DP 1.4, 4K 144Hz, 2 mètres', 'Bon état', 11, 'cabledp2m.jpg', 3.00),
(201, 'Câble HDMI 5m', 'HDMI 2.0, 4K 60Hz, 5 mètres', 'Bon état', 11, 'hdmi5m.jpg', 4.00),
(202, 'Adaptateur VGA vers HDMI', 'Convertisseur VGA vers HDMI avec audio', 'Bon état', 11, 'vga-hdmi.jpg', 5.00),
(203, 'Adaptateur USB-C vers Jack 3.5mm', 'DAC intégré, compatible Android et Mac', 'Bon état', 11, 'usbc-jack35.jpg', 3.00),
(204, 'Câble Thunderbolt 4 1m', 'TB4, 40 Gbps, 100W PD, 8K vidéo', 'Bon état', 11, 'thunderbolt4-1m.jpg', 8.00),
(205, 'Hub USB-A 4 ports', 'USB 3.0, 4 ports, alimentation externe', 'Bon état', 11, 'hubusbа4ports.jpg', 4.00),
(206, 'Adaptateur HDMI vers VGA', 'Convertisseur HDMI vers VGA, 1080p', 'Bon état', 11, 'hdmi-vga.jpg', 4.00),
(207, 'Câble USB-C vers Lightning 1m', 'Charge rapide iPhone, MFi certifié', 'Bon état', 11, 'usbc-lightning1m.jpg', 5.00),
(208, 'Multiprise USB 6 ports', '6x USB-A, charge rapide 60W total', 'Bon état', 11, 'multiprise6usb.jpg', 8.00),
(209, 'Câble Ethernet Cat6 3m', 'RJ45, 1 Gbps, 3 mètres, blindé', 'Bon état', 11, 'ethernet-cat6-3m.jpg', 3.00),
(210, 'Docking Station USB-C', 'HDMI x2, USB 3.0 x4, Ethernet, SD, 100W PD', 'Bon état', 11, 'dockingstation.jpg', 15.00),
(211, 'Câble VGA 2m', 'VGA mâle/mâle, 2 mètres, blindé', 'Bon état', 11, 'cablevga2m.jpg', 2.00),
(212, 'Seagate Backup Plus 4To', 'HDD portable USB 3.0, 4 To, noir', 'Bon état', 12, 'seagatebackup4to.jpg', 18.00),
(213, 'LaCie Rugged 1To', 'SSD portable résistant, USB-C, IP67', 'Bon état', 12, 'lacierugged1to.jpg', 20.00),
(214, 'WD Black P50 2To', 'SSD portable gaming, USB 3.2, 2000 Mo/s', 'Bon état', 12, 'wdblackp50.jpg', 25.00),
(215, 'Toshiba Canvio Advance 2To', 'HDD portable USB 3.0, 2 To, logiciel sauvegarde', 'Bon état', 12, 'toshibacanvioadvance.jpg', 14.00),
(216, 'Samsung T5 EVO 4To', 'SSD portable USB 3.2, 4 To, compact', 'Bon état', 12, 'samsungt5evo4to.jpg', 30.00),
(217, 'Crucial X9 Pro 2To', 'SSD portable USB 3.2, 2 To, IP55 résistant', 'Bon état', 12, 'crucialx9pro2to.jpg', 22.00),
(218, 'SanDisk Extreme Pro 1To', 'SSD portable USB 3.2, 1 To, 2000 Mo/s', 'Bon état', 12, 'sandiskextremepro1to.jpg', 20.00),
(219, 'ADATA SD810 1To', 'SSD portable USB 3.2, 1 To, IP68 waterproof', 'Bon état', 12, 'adatasd810.jpg', 18.00),
(220, 'Iomega Zip Drive 250Mo', 'Lecteur Zip externe USB, 250 Mo, vintage', 'Bon état', 12, 'iomagazip250.jpg', 5.00),
(221, 'OWC Envoy Pro FX 1To', 'SSD portable Thunderbolt 3 et USB-C, 2800 Mo/s', 'Bon état', 12, 'owcenvoyprofx.jpg', 28.00),
(222, 'Buffalo MiniStation 1To', 'HDD portable USB 3.0, 1 To, compact', 'Bon état', 12, 'buffaloministation.jpg', 10.00),
(223, 'Intenso Memory Station 2To', 'HDD portable USB 3.0, 2 To, économique', 'Bon état', 12, 'intensomemorystation.jpg', 12.00),
(224, 'JBL Clip 4', 'Enceinte Bluetooth portable, waterproof, mousqueton', 'Bon état', 13, 'jblclip4.jpg', 5.00),
(225, 'Rode NT-USB Mini', 'Microphone USB compact, podcast et streaming', 'Bon état', 13, 'rodentusb.jpg', 12.00),
(226, 'Sennheiser HD 599', 'Casque audio open-back, Hi-Fi, câble détachable', 'Bon état', 13, 'sennheiserhd599.jpg', 12.00),
(227, 'Audio-Technica ATH-M50x', 'Casque studio fermé, référence monitoring', 'Bon état', 13, 'athatm50x.jpg', 15.00),
(228, 'Focusrite Scarlett Solo', 'Interface audio USB, enregistrement guitar et micro', 'Bon état', 13, 'focusritesoloscarlett.jpg', 15.00),
(229, 'Harman Kardon Onyx Studio 8', 'Enceinte Bluetooth, 50W, design premium', 'Bon état', 13, 'harmankardononyx8.jpg', 15.00),
(230, 'Marshall Emberton II', 'Enceinte Bluetooth portable, 20h autonomie, robuste', 'Bon état', 13, 'marshallemb2.jpg', 10.00),
(231, 'Shure MV7', 'Microphone USB/XLR hybride, podcast professionnel', 'Bon état', 13, 'shuremv7.jpg', 18.00),
(232, 'Beyerdynamic DT 770 Pro', 'Casque studio 80 Ohm, fermé, référence', 'Bon état', 13, 'beyerdynamicdt770.jpg', 15.00),
(233, 'Anker Soundcore Motion+', 'Enceinte Bluetooth, 30W, Hi-Res Audio', 'Bon état', 13, 'ankersoundcoremotion.jpg', 8.00),
(234, 'Plantronics Voyager Focus 2', 'Casque Bluetooth professionnel, ANC, Teams certifié', 'Bon état', 13, 'plantronicsvoyager2.jpg', 18.00),
(235, 'Creative Pebble V3', 'Enceintes PC USB-C, 8W, compact design', 'Bon état', 13, 'creativepebblev3.jpg', 5.00),
(236, 'Microsoft LifeCam HD-3000', 'HD 720p, microphone intégré, USB', 'Bon état', 14, 'mslifecamhd.jpg', 4.00),
(237, 'Razer Kiyo Pro', '1080p 60fps, capteur STARVIS, USB', 'Bon état', 14, 'razerkiyo.jpg', 10.00),
(238, 'Elgato Facecam', '1080p 60fps, capteur Sony, streaming', 'Bon état', 14, 'elgatofacecam.jpg', 12.00),
(239, 'Aukey PC-LM3', '1080p 30fps, grand angle 90°, USB', 'Bon état', 14, 'aukeyPClm3.jpg', 5.00),
(240, 'Nexigo N960E', '4K 30fps, autofocus, microphone stéréo', 'Bon état', 14, 'nexigon960e.jpg', 15.00),
(241, 'Anker PowerConf C300', '1080p, autofocus AI, grand angle 95°', 'Bon état', 14, 'ankerpowerconfc300.jpg', 10.00),
(242, 'Insta360 Link', '4K PTZ, suivi automatique AI, HDR', 'Bon état', 14, 'insta360link.jpg', 18.00),
(243, 'Dell UltraSharp WB7022', '4K, autofocus, grand angle 90°, USB-C', 'Bon état', 14, 'dellwb7022.jpg', 20.00),
(244, 'Poly Studio P5', '1080p, autofocus, certifiée Zoom et Teams', 'Bon état', 14, 'polystudioP5.jpg', 12.00),
(245, 'Obsbot Tiny 2', '4K PTZ AI, suivi automatique, USB-C', 'Bon état', 14, 'obsbot tiny2.jpg', 20.00),
(246, 'Jabra PanaCast 20', '4K, grand angle 90°, certifiée Teams', 'Bon état', 14, 'jabrapanacast20.jpg', 18.00),
(247, 'Creative Live! Cam Sync V3', '1080p, grand angle 90°, microphone double', 'Bon état', 14, 'creativelivecamv3.jpg', 6.00),
(248, 'Manette PS5 DualSense', 'Retour haptique, gâchettes adaptatives, USB-C', 'Bon état', 15, 'dualsense.jpg', 8.00),
(249, 'Clavier gaming Corsair K70', 'Mécanique, Cherry MX Speed, RGB, aluminium', 'Bon état', 15, 'corsaik70.jpg', 15.00),
(250, 'Souris gaming Razer DeathAdder V3', '30000 DPI, ergonomique, sans fil, 90h', 'Bon état', 15, 'razerda v3.jpg', 10.00),
(251, 'Logitech G Pro X Superlight 2', 'Souris gaming 32000 DPI, 60g, sans fil', 'Bon état', 15, 'logitechgprox2.jpg', 12.00),
(252, 'SteelSeries Arctis Nova Pro', 'Casque gaming sans fil, ANC, multiplateforme', 'Bon état', 15, 'steelseriesarctisnovapro.jpg', 20.00),
(253, 'Razer Huntsman V2', 'Clavier optique, switches Razer Optical, RGB', 'Bon état', 15, 'razerhuntsmanv2.jpg', 18.00),
(254, 'Corsair HS80 RGB', 'Casque gaming sans fil, Dolby Atmos, USB', 'Bon état', 15, 'corsairhs80rgb.jpg', 12.00),
(255, 'ASUS ROG Strix Impact III', 'Souris gaming légère 59g, 12000 DPI, USB-C', 'Bon état', 15, 'asusrogstriximpact3.jpg', 8.00),
(256, 'HyperX Alloy Origins', 'Clavier mécanique, switches HyperX Red, RGB', 'Bon état', 15, 'hyperxalloyorigins.jpg', 15.00),
(257, 'Thrustmaster T248', 'Volant de course, force feedback, compatible PS4/PS5/PC', 'Bon état', 15, 'thrustmastertT248.jpg', 20.00),
(258, '8BitDo Pro 2', 'Manette sans fil multiplateforme, switches mécaniques', 'Bon état', 15, '8bitdopro2.jpg', 8.00),
(259, 'Elgato Stream Deck MK.2', 'Panneau de contrôle streaming, 15 touches LCD', 'Bon état', 15, 'elgatostreamdeck.jpg', 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `Id_Resa` int NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `date_reservation` datetime NOT NULL,
  `prix_total` decimal(15,2) NOT NULL,
  `Id_Utilisateurs` int NOT NULL,
  `Id_Materiel` int NOT NULL,
  `Id_statut` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statut`
--

CREATE TABLE `statut` (
  `Id_statut` int NOT NULL,
  `libelle_statut` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `Id_Utilisateurs` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rue` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero_de_telephone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code_postal` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AspNetUserId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`Id_Utilisateurs`, `nom`, `mot_de_passe`, `prenom`, `email`, `ville`, `rue`, `numero_de_telephone`, `code_postal`, `AspNetUserId`) VALUES
(1, 'Dupont', '', 'Jean', 'test15@test.com', 'Bourg-en-Bresse', '1 rue de la Paix', '0612345678', '01000', '171a08ee-d835-4c4e-bafc-e6db823f34e3'),
(2, 'Dupont', '', 'Jean', 'test16@test.com', 'Bourg-en-Bresse', '1 rue de la Paix', '0612345678', '01000', '00904b64-cb27-4cbb-abf2-759f1dfa436d'),
(3, 'Dupont', '', 'Jean', 'test17@test.com', 'Bourg-en-Bresse', '1 rue de la Paix', '0612345678', '01000', '2065e624-a4ea-4bb2-9361-526c7c8d8ac5'),
(4, 'Dupont', '', 'Jean', 'test1ds7@test.com', 'Bourg-en-Bresse', '1 rue de la Paix', '0612345678', '01000', 'd937ee17-1706-4e3e-a57b-e8bfe0eeb74f'),
(5, 'Dupont', '', 'Jean', 'tesfdst1ds7@test.com', 'Bourg-en-Bresse', '1 rue de la Paix', '0612345678', '01000', '1ade55a8-6b35-404d-b3ee-e41675a2ba68'),
(6, 'Dupont', '', 'Jean', 'tesfds45t1ds7@test.com', 'Bourg-en-Bresse', '1 rue de la Paix', '0612345678', '01000', 'd47c6633-73d3-4ff3-a502-1b6596e38471'),
(7, 'Dupont', '', 'Jean', 'tesfds45t1dffds7@test.com', 'Bourg-en-Bresse', '1 rue de la Paix', '0612345678', '01000', 'f769ebc9-b1e5-4b09-82f8-ade2019707e5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Indexes for table `aspnetroles`
--
ALTER TABLE `aspnetroles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Indexes for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Indexes for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Indexes for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Indexes for table `aspnetusers`
--
ALTER TABLE `aspnetusers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`Id_Categorie`);

--
-- Indexes for table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`Id_Materiel`),
  ADD KEY `fk_materiel_categorie` (`id_categorie`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Id_Resa`),
  ADD KEY `fk_resa_utilisateur` (`Id_Utilisateurs`),
  ADD KEY `fk_resa_materiel` (`Id_Materiel`),
  ADD KEY `fk_resa_statut` (`Id_statut`);

--
-- Indexes for table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`Id_statut`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`Id_Utilisateurs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `Id_Categorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `Id_Materiel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `Id_Resa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statut`
--
ALTER TABLE `statut`
  MODIFY `Id_statut` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `Id_Utilisateurs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `fk_materiel_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`Id_Categorie`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_resa_materiel` FOREIGN KEY (`Id_Materiel`) REFERENCES `materiel` (`Id_Materiel`),
  ADD CONSTRAINT `fk_resa_statut` FOREIGN KEY (`Id_statut`) REFERENCES `statut` (`Id_statut`),
  ADD CONSTRAINT `fk_resa_utilisateur` FOREIGN KEY (`Id_Utilisateurs`) REFERENCES `utilisateurs` (`Id_Utilisateurs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
