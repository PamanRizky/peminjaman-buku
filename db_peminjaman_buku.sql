-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 02:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_peminjaman_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `no_kartu_anggota` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `no_induk` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`no_kartu_anggota`, `nama_anggota`, `jurusan`, `no_induk`) VALUES
(1, 'Wahyu', 'Teknik Informatika', 1123),
(2, 'Raib', 'Sistem Informasi', 1122);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `penerbit_tempat_tahun` varchar(100) NOT NULL,
  `sumber_pengadaan` varchar(50) NOT NULL,
  `tgl_terima` date NOT NULL,
  `kondisi_buku` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode_buku`, `judul_buku`, `pengarang`, `penerbit_tempat_tahun`, `sumber_pengadaan`, `tgl_terima`, `kondisi_buku`) VALUES
(1, 'Early Marriage', 'Bestheaa', 'Besthea, Banjarmasin, 2023', 'Beli', '2023-11-27', 'Bagus'),
(2, 'Belajar HTML', 'HTML', 'dasdjakje', 'Beli', '2023-11-20', 'Bagus');

-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE `denda` (
  `no_denda` int(11) NOT NULL,
  `tgl_denda` date NOT NULL,
  `jenis_denda` varchar(50) NOT NULL,
  `jumlah_denda` int(50) NOT NULL,
  `no_kembali` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `denda`
--

INSERT INTO `denda` (`no_denda`, `tgl_denda`, `jenis_denda`, `jumlah_denda`, `no_kembali`) VALUES
(1, '2023-11-20', '0', 10000, 1),
(2, '2023-11-29', 'Hilang', 80000, 2),
(3, '2023-11-29', 'terlambat', 7000, 3),
(4, '2023-11-29', 'terlambat', 2000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `detail_isi`
--

CREATE TABLE `detail_isi` (
  `no_pinjam` int(11) NOT NULL,
  `kode_buku` int(11) NOT NULL,
  `jenis_buku` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_isi`
--

INSERT INTO `detail_isi` (`no_pinjam`, `kode_buku`, `jenis_buku`) VALUES
(2, 1, 'Karya Ilmiah'),
(3, 2, 'Fiksi');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `no_pinjam` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `no_kartu_anggota` int(11) NOT NULL,
  `kode_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`no_pinjam`, `tgl_pinjam`, `no_kartu_anggota`, `kode_petugas`) VALUES
(1, '2023-11-30', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `no_kembali` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `no_pinjam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`no_kembali`, `tgl_kembali`, `no_pinjam`) VALUES
(1, '2023-11-29', 1),
(2, '2023-11-21', 2);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `kode_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`kode_petugas`, `nama_petugas`, `alamat`, `no_telp`) VALUES
(1, 'Ali', 'Bumi', '0877291219'),
(2, 'Selly', 'Matahari', '0879323982');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'pass'),
(2, 'ubahjuga', 'ubah');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`no_kartu_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indexes for table `denda`
--
ALTER TABLE `denda`
  ADD PRIMARY KEY (`no_denda`);

--
-- Indexes for table `detail_isi`
--
ALTER TABLE `detail_isi`
  ADD PRIMARY KEY (`no_pinjam`),
  ADD KEY `kode_buku` (`kode_buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`no_pinjam`),
  ADD KEY `no_kartu_anggota` (`no_kartu_anggota`,`kode_petugas`),
  ADD KEY `kode_petugas` (`kode_petugas`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`no_kembali`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`kode_petugas`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_isi`
--
ALTER TABLE `detail_isi`
  ADD CONSTRAINT `detail_isi_ibfk_1` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`no_kartu_anggota`) REFERENCES `anggota` (`no_kartu_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`kode_petugas`) REFERENCES `petugas` (`kode_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
