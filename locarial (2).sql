-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2026 at 03:13 PM
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
(85, 'Souris gaming Razer DeathAdder', 'Souris gaming 20000 DPI, ergonomique, RGB', 'Bon état', 15, 'razerda.jpg', 8.00);

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
  MODIFY `Id_Materiel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

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
