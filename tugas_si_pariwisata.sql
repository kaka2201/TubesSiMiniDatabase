-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 26, 2024 at 02:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_si_pariwisata`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_ADMIN` int NOT NULL,
  `ID_PENGUNJUNG` int DEFAULT NULL,
  `ID_TOUR_GUIDE` int DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `ID_FASILITAS` int NOT NULL,
  `ID_KAMAR` int DEFAULT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `DESKRIPSI` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `ID_HOTEL` int NOT NULL,
  `NAMA_HOTEL` varchar(255) DEFAULT NULL,
  `ALAMAT_HOTEL` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `WEBSITE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_hotel`
--

CREATE TABLE `jenis_hotel` (
  `ID_JENIS_HOTEL` int NOT NULL,
  `NAMA_JENIS_HOTEL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tempat_wisata`
--

CREATE TABLE `jenis_tempat_wisata` (
  `ID_JENIS_WISATA` int NOT NULL,
  `NAMA_JENIS_TEMPAT_WISATA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `ID_KAMAR` int NOT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `JENIS_KAMAR` varchar(255) DEFAULT NULL,
  `FASILITAS_KAMAR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `objek_atraksi`
--

CREATE TABLE `objek_atraksi` (
  `ID_ATRAKSI` int NOT NULL,
  `ID_WISATA` int DEFAULT NULL,
  `NAMA_OBJEK_ATRAKSI` varchar(255) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL,
  `DESKRIPSI` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `ID_PEMESANAN` int NOT NULL,
  `ID_WISATA` int DEFAULT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `ID_KAMAR` int DEFAULT NULL,
  `HARGA` decimal(10,2) DEFAULT NULL,
  `RATE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengunjung`
--

CREATE TABLE `pengunjung` (
  `ID_PENGUNJUNG` int NOT NULL,
  `ID_ADMIN` int DEFAULT NULL,
  `ID_TOUR_GUIDE` int DEFAULT NULL,
  `ID_PEMESANAN` int DEFAULT NULL,
  `ID_PENILAIAN` int DEFAULT NULL,
  `ID_JENIS_HOTEL` int DEFAULT NULL,
  `ID_JENIS_WISATA` int DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `NO_TELP` varchar(20) DEFAULT NULL,
  `KATA_SANDI` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `ID_PENILAIAN` int NOT NULL,
  `ID_WISATA` int DEFAULT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `RATE` float DEFAULT NULL,
  `ULASAN` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tempat_wisata`
--

CREATE TABLE `tempat_wisata` (
  `ID_WISATA` int NOT NULL,
  `NAMA_TEMPAT_WISATA` varchar(255) DEFAULT NULL,
  `ALAMAT_TEMPAT_WISATA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tour_guide`
--

CREATE TABLE `tour_guide` (
  `ID_TOUR_GUIDE` int NOT NULL,
  `ID_PENGUNJUNG` int DEFAULT NULL,
  `ID_WISATA` int DEFAULT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `ID_ADMIN` int DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `KATA_SANDI` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`),
  ADD KEY `ID_PENGUNJUNG` (`ID_PENGUNJUNG`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`ID_FASILITAS`),
  ADD KEY `ID_KAMAR` (`ID_KAMAR`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`ID_HOTEL`);

--
-- Indexes for table `jenis_hotel`
--
ALTER TABLE `jenis_hotel`
  ADD PRIMARY KEY (`ID_JENIS_HOTEL`);

--
-- Indexes for table `jenis_tempat_wisata`
--
ALTER TABLE `jenis_tempat_wisata`
  ADD PRIMARY KEY (`ID_JENIS_WISATA`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`ID_KAMAR`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`);

--
-- Indexes for table `objek_atraksi`
--
ALTER TABLE `objek_atraksi`
  ADD PRIMARY KEY (`ID_ATRAKSI`),
  ADD KEY `ID_WISATA` (`ID_WISATA`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`ID_PEMESANAN`),
  ADD KEY `ID_WISATA` (`ID_WISATA`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`),
  ADD KEY `ID_KAMAR` (`ID_KAMAR`);

--
-- Indexes for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`ID_PENGUNJUNG`),
  ADD KEY `ID_PEMESANAN` (`ID_PEMESANAN`),
  ADD KEY `ID_PENILAIAN` (`ID_PENILAIAN`),
  ADD KEY `ID_JENIS_HOTEL` (`ID_JENIS_HOTEL`),
  ADD KEY `ID_JENIS_WISATA` (`ID_JENIS_WISATA`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`ID_PENILAIAN`),
  ADD KEY `ID_WISATA` (`ID_WISATA`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`);

--
-- Indexes for table `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  ADD PRIMARY KEY (`ID_WISATA`);

--
-- Indexes for table `tour_guide`
--
ALTER TABLE `tour_guide`
  ADD PRIMARY KEY (`ID_TOUR_GUIDE`),
  ADD KEY `ID_PENGUNJUNG` (`ID_PENGUNJUNG`),
  ADD KEY `ID_WISATA` (`ID_WISATA`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_ADMIN` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `ID_FASILITAS` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `ID_HOTEL` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_hotel`
--
ALTER TABLE `jenis_hotel`
  MODIFY `ID_JENIS_HOTEL` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_tempat_wisata`
--
ALTER TABLE `jenis_tempat_wisata`
  MODIFY `ID_JENIS_WISATA` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `ID_KAMAR` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objek_atraksi`
--
ALTER TABLE `objek_atraksi`
  MODIFY `ID_ATRAKSI` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `ID_PEMESANAN` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `ID_PENGUNJUNG` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `ID_PENILAIAN` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  MODIFY `ID_WISATA` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tour_guide`
--
ALTER TABLE `tour_guide`
  MODIFY `ID_TOUR_GUIDE` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ID_PENGUNJUNG`) REFERENCES `pengunjung` (`ID_PENGUNJUNG`);

--
-- Constraints for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fasilitas_ibfk_1` FOREIGN KEY (`ID_KAMAR`) REFERENCES `kamar` (`ID_KAMAR`),
  ADD CONSTRAINT `fasilitas_ibfk_2` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`);

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`);

--
-- Constraints for table `objek_atraksi`
--
ALTER TABLE `objek_atraksi`
  ADD CONSTRAINT `objek_atraksi_ibfk_1` FOREIGN KEY (`ID_WISATA`) REFERENCES `tempat_wisata` (`ID_WISATA`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`ID_WISATA`) REFERENCES `tempat_wisata` (`ID_WISATA`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`),
  ADD CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`ID_KAMAR`) REFERENCES `kamar` (`ID_KAMAR`);

--
-- Constraints for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD CONSTRAINT `pengunjung_ibfk_1` FOREIGN KEY (`ID_PEMESANAN`) REFERENCES `pemesanan` (`ID_PEMESANAN`),
  ADD CONSTRAINT `pengunjung_ibfk_2` FOREIGN KEY (`ID_PENILAIAN`) REFERENCES `penilaian` (`ID_PENILAIAN`),
  ADD CONSTRAINT `pengunjung_ibfk_3` FOREIGN KEY (`ID_JENIS_HOTEL`) REFERENCES `jenis_hotel` (`ID_JENIS_HOTEL`),
  ADD CONSTRAINT `pengunjung_ibfk_4` FOREIGN KEY (`ID_JENIS_WISATA`) REFERENCES `jenis_tempat_wisata` (`ID_JENIS_WISATA`);

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`ID_WISATA`) REFERENCES `tempat_wisata` (`ID_WISATA`),
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`);

--
-- Constraints for table `tour_guide`
--
ALTER TABLE `tour_guide`
  ADD CONSTRAINT `tour_guide_ibfk_1` FOREIGN KEY (`ID_PENGUNJUNG`) REFERENCES `pengunjung` (`ID_PENGUNJUNG`),
  ADD CONSTRAINT `tour_guide_ibfk_2` FOREIGN KEY (`ID_WISATA`) REFERENCES `tempat_wisata` (`ID_WISATA`),
  ADD CONSTRAINT `tour_guide_ibfk_3` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
