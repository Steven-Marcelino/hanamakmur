-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2023 at 10:52 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hanamakmur`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`) VALUES
(1, 'Admin', 'admin', '$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS', '01234567890', 'Indonesia', '2023-07-16 11:31:17', 'Admin'),
(2, 'Guest', 'guest', '$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K', '01234567890', 'Indonesia', '2023-07-16 11:30:40', 'Member'),
(4, 'ainun', 'ainunshnt@gmail.com', '$2y$10$gdmtgz0CeQkES4UB/Oh3WeeAjYq7nQ9tooLsIedPEiVfJv9tPkxoe', '081326597404', 'gejayan', '2023-07-24 21:26:06', 'Member'),
(7, 'shinta', 'shnt@gmail.com', '$2y$10$RMqByRuPF5/bPsDrk7wvXOpvicY25n4BHBuBsK/WQQSAzLf25OQ76', '6521781', 'pbg', '2023-07-29 06:28:45', 'Member'),
(12, 'savia', 'saviap@gmail.com', '$2y$10$lIWyj13RYOC9vM/msSa6fOSS/3/9MLkVoisD5fMBKD3uSpBgpyx4m', '08226457021', 'rabak', '2023-08-21 16:35:36', 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `bayar`
--

CREATE TABLE `bayar` (
  `idbayar` int(11) NOT NULL,
  `idcart` int(11) NOT NULL,
  `namapembeli` varchar(50) NOT NULL,
  `metodebayar` varchar(25) NOT NULL,
  `tglbayar` datetime NOT NULL,
  `jumlahbayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(51, '16rEd8vq.UqsA', 24, 1),
(52, '16SFRfGklW1Bk', 24, 1),
(53, '16QcnjxefOTWE', 24, 1),
(54, '168Et.ZlFABoE', 24, 1),
(55, '16jVGgRK83UE.', 24, 1),
(56, '16r4MjcnAHkEU', 24, 1),
(57, '16cuVju8Vaqww', 24, 1),
(58, '16Mnrk33124GA', 24, 1),
(59, '16jmAJITHRJuM', 24, 1),
(60, '16R18RRA3tv3Q', 24, 1),
(61, '16n2k3NcAUzCg', 24, 1),
(62, '16.zWI9fH0rws', 25, 1),
(63, '16tSIJ540p1Jk', 24, 1),
(64, '1651pN/7u1z5A', 24, 1),
(65, '16SCoR8ojB1ws', 24, 1),
(66, '16/L.z.wRUaGQ', 24, 1),
(67, '1659/9j0cT15A', 24, 1),
(68, '16vbQAcKkpZ9A', 24, 1),
(74, '163maQ4T6z2nY', 24, 1),
(79, '16FOsGP1G4ZAI', 24, 1),
(97, '16wrxBBrms9Tg', 31, 1),
(98, '162AgZaDnJSWI', 24, 1),
(120, '16dyrYMr21NEA', 26, 1),
(121, '15Swf8Ye0Fm.M', 25, 1),
(122, '16tiubRlt.O86', 29, 1),
(123, '16lp4ErFRN7Gk', 25, 1),
(125, '16VFEu74rPmOY', 24, 1),
(127, '16VFEu74rPmOY', 26, 1),
(128, '165okvhdVlAXA', 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(1, 'Nugget', '2023-07-19 08:52:17'),
(2, 'Sosis', '2023-07-19 08:52:17'),
(3, 'Dan lain-lain', '2022-05-18 08:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `namapeminjam` varchar(25) NOT NULL,
  `tglpinjam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`idkonfirmasi`, `orderid`, `userid`, `namapeminjam`, `tglpinjam`) VALUES
(12, '16wrxBBrms9Tg', 1, 'admin', '2023-07-31'),
(13, '15Swf8Ye0Fm.M', 2, 'guest', '2023-08-21'),
(14, '16tiubRlt.O86', 2, 'savia', '2023-08-22'),
(15, '16lp4ErFRN7Gk', 2, 'savia', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `idlaporan` int(11) NOT NULL,
  `idkonfirmasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `idkonfirmasi` int(11) NOT NULL,
  `tglpesanan` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`idcart`, `orderid`, `userid`, `idkonfirmasi`, `tglpesanan`, `status`) VALUES
(10, '15wKVT0nej25Y', 2, 0, '2023-07-16', 'Selesai'),
(11, '15Swf8Ye0Fm.M', 2, 0, '2023-07-16', 'Confirmed'),
(12, '15PzF03ejd8W2', 1, 0, '2023-07-13', 'Pengiriman'),
(13, '16KUZ1wKc7fLY', 1, 0, '2023-07-20', 'Confirmed'),
(14, '16iI9ToBA9NZU', 1, 0, '2023-07-13', 'Confirmed'),
(15, '16HoO.6ORttIc', 4, 0, '2023-07-29', 'Selesai'),
(16, '1618tXBOx8VyA', 4, 0, '2023-07-29', 'Confirmed'),
(17, '16XNk7nHJr1Sg', 4, 0, '2023-07-29', 'Selesai'),
(18, '16/QvNheGFHvQ', 4, 0, '2022-08-25', 'Selesai'),
(19, '164h5XBV4TKQA', 4, 0, '2022-08-25', 'Selesai'),
(20, '16FOsGP1G4ZAI', 1, 0, '2022-08-25', 'Payment'),
(21, '16OYYa2Ecnj5M', 4, 0, '2022-08-25', 'Selesai'),
(22, '16jlZy42rP7KY', 4, 0, '2022-09-04', 'Cart'),
(23, '161W.mWicfFB6', 7, 0, '2022-09-10', 'Selesai'),
(24, '16qKwRynwmh3g', 7, 0, '2022-09-10', 'Selesai'),
(25, '16wrxBBrms9Tg', 1, 0, '2022-09-10', 'Confirmed'),
(26, '162AgZaDnJSWI', 1, 0, '2022-09-10', 'Payment'),
(27, '16dyrYMr21NEA', 1, 0, '2022-09-10', 'Cart'),
(28, '16qchtogRR5z6', 1, 0, '2022-09-10', 'Cart'),
(29, '16YwesgeC2Fuw', 7, 0, '2022-09-10', 'Pengiriman'),
(30, '16qTHayLtQlzg', 7, 0, '2022-09-10', 'Cart'),
(31, '1644aH6a11ZwA', 7, 0, '2022-09-10', 'Cart'),
(32, '163qHxsLGCv6E', 7, 0, '2022-09-11', 'Cart'),
(33, '16uftygz5apyo', 7, 0, '2022-09-11', 'Cart'),
(34, '16nRd/D.Fm73.', 7, 0, '2022-09-11', 'Cart'),
(35, '16vZ.yKJt7/zs', 7, 0, '2022-09-11', 'Cart'),
(36, '16vJplsVRd2N2', 1, 0, '2022-09-11', 'Cart'),
(37, '16EN3KOM1A2/w', 7, 0, '2022-09-11', 'Cart'),
(38, '166OUy9U6npAs', 7, 0, '2022-09-11', 'Cart'),
(39, '16Db2Jx1iLxQE', 1, 0, '2022-09-11', 'Cart'),
(40, '16ZklOmxxuEN2', 1, 0, '2022-09-11', 'Cart'),
(41, '16guXXPIJyJ72', 1, 0, '2022-09-11', 'Cart'),
(42, '16743b8EN2Stg', 1, 0, '2022-09-11', 'Cart'),
(43, '16/X.506xzAX6', 1, 0, '2022-09-11', 'Cart'),
(44, '16rEd8vq.UqsA', 1, 0, '2023-07-19', 'Cart'),
(45, '16SFRfGklW1Bk', 1, 0, '2023-07-19', 'Cart'),
(46, '16QcnjxefOTWE', 1, 0, '2023-07-19', 'Cart'),
(47, '168Et.ZlFABoE', 1, 0, '2023-07-19', 'Cart'),
(48, '16jVGgRK83UE.', 1, 0, '2023-07-19', 'Cart'),
(49, '16r4MjcnAHkEU', 1, 0, '2023-07-19', 'Cart'),
(50, '16cuVju8Vaqww', 1, 0, '2023-07-19', 'Cart'),
(51, '16Mnrk33124GA', 1, 0, '2023-07-19', 'Cart'),
(52, '16jmAJITHRJuM', 1, 0, '2023-07-19', 'Cart'),
(53, '16R18RRA3tv3Q', 1, 0, '2023-07-19', 'Cart'),
(54, '16n2k3NcAUzCg', 1, 0, '2023-07-19', 'Cart'),
(56, '16.zWI9fH0rws', 1, 0, '2023-07-19', 'Cart'),
(57, '16tSIJ540p1Jk', 1, 0, '2023-07-24', 'Cart'),
(58, '1651pN/7u1z5A', 1, 0, '2023-07-24', 'Cart'),
(59, '16SCoR8ojB1ws', 1, 0, '2023-07-24', 'Cart'),
(60, '16/L.z.wRUaGQ', 1, 0, '2023-07-24', 'Cart'),
(61, '1659/9j0cT15A', 1, 0, '2023-07-24', 'Cart'),
(62, '16vbQAcKkpZ9A', 1, 0, '2023-07-24', 'Cart'),
(64, '163maQ4T6z2nY', 1, 0, '2023-07-24', 'Cart'),
(65, '16tiubRlt.O86', 2, 0, '2023-08-21', 'Confirmed'),
(66, '16lp4ErFRN7Gk', 2, 0, '2023-08-22', 'Confirmed'),
(67, '16VFEu74rPmOY', 2, 0, '2023-08-22', 'Payment'),
(68, '165okvhdVlAXA', 2, 0, '2023-08-22', 'Payment');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `gambar`, `deskripsi`, `harga`, `stok`) VALUES
(24, 3, 'Crab Stick 500 gram', 'produk/16RRn9K5NhvBg.jpg', 'Merupakan makanan beku dengan kandungan campuran kepiting', 5, 0),
(25, 3, 'ayam slice 250gram', 'produk/16kry0tIoNEK..jpeg', 'ayam slice beku....', 5, 0),
(26, 2, 'sosis ayam belfoods 500 gram', 'produk/165yv8p3jtXJY.jpeg', 'sosis ayam', 5, 0),
(27, 3, 'Bola Udang', 'produk/164ro83G8rF92.jpeg', 'Makanan Beku Dengan isian udang dibuat bulatan seperti bakso', 5, 0),
(28, 2, 'Sosis Sapi Champ 500gram', 'produk/16Sn3r78QwNB6.jpeg', 'Sosis sapi pilihan yang lezat ', 5, 0),
(29, 3, 'Daging Slice 250 gram', 'produk/16y6P117a6f5g.jpeg', 'Daging sapi slice siap di gunakan untuk grill', 5, 0),
(30, 3, 'Dumpling Keju', 'produk/16X4cJSTQlkzg.jpeg', 'makanan beku untuk steambot atau olahan lainnya', 5, 0),
(31, 1, 'Fish Cake', 'produk/16Hs20e30RnNw.jpeg', 'olahan ikan untuk pendamping membuat steambot', 5, 0),
(32, 2, 'Kanzler Beef 500 gram', 'produk/16Z285YhhmGXo.jpg', 'Sosis sapi siap santap dengan menggunakan daging premium yang pastinya untuk rasa sangat enak', 5, 0),
(33, 3, 'Shoestring (Kentang Goreng Bek', 'produk/16cIZbIXv8NcQ.jpg', 'Kentang goreng yang lezat di sajikan saat berkumpul bersama teman maupun keluarga', 5, 0),
(34, 3, 'Scallop 250 gram', 'produk/16Di3TK7VsnY6.jpeg', 'makanan', 5, 0),
(35, 3, 'Scallop 500 gram', 'produk/16Di3TK7VsnY6.jpeg', 'Makanan', 5, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `bayar`
--
ALTER TABLE `bayar`
  ADD PRIMARY KEY (`idbayar`),
  ADD UNIQUE KEY `idcart` (`idcart`);

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `idproduk` (`idproduk`),
  ADD KEY `orderid` (`orderid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`idlaporan`),
  ADD UNIQUE KEY `idkonfirmasi` (`idkonfirmasi`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `Idkonfirmasi` (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bayar`
--
ALTER TABLE `bayar`
  MODIFY `idbayar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `idlaporan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `pesanan` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `anggota` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `anggota` (`userid`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
