-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2025 at 08:53 AM
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
-- Database: `enterprise_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`log_id`, `user_id`, `login_time`) VALUES
(1, 3, '2025-02-03 14:48:53'),
(2, 3, '2025-02-03 14:50:17'),
(3, 2, '2025-02-03 15:01:18'),
(4, 3, '2025-02-10 14:40:29'),
(5, 2, '2025-02-10 14:40:39'),
(6, 2, '2025-02-10 15:27:43'),
(7, 2, '2025-03-10 14:39:19'),
(8, 2, '2025-03-10 14:47:09'),
(9, 2, '2025-03-10 14:47:45'),
(10, 2, '2025-03-10 14:48:45'),
(11, 2, '2025-03-10 14:49:55'),
(12, 4, '2025-03-10 14:51:08'),
(13, 4, '2025-03-10 14:52:18'),
(14, 2, '2025-03-10 14:53:52'),
(15, 4, '2025-03-10 14:54:14'),
(16, 5, '2025-03-10 15:00:44'),
(17, 5, '2025-03-10 15:12:41'),
(18, 5, '2025-03-10 15:14:06'),
(19, 5, '2025-03-10 15:14:33'),
(20, 5, '2025-03-10 15:25:11'),
(21, 5, '2025-03-10 15:26:43'),
(22, 5, '2025-03-10 15:27:22'),
(23, 5, '2025-03-10 15:28:57'),
(24, 5, '2025-03-10 15:40:36'),
(25, 5, '2025-03-10 15:41:27'),
(26, 5, '2025-03-10 15:42:06'),
(27, 3, '2025-03-10 15:44:55'),
(28, 3, '2025-03-10 15:50:15'),
(29, 3, '2025-03-10 15:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `check_in_time` datetime NOT NULL,
  `check_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_attendance`
--

INSERT INTO `tbl_attendance` (`id`, `user_id`, `attendance_date`, `check_in_time`, `check_out_time`) VALUES
(1, 5, '2025-03-10', '0000-00-00 00:00:00', NULL),
(2, 5, '2025-03-10', '0000-00-00 00:00:00', NULL),
(3, 3, '2025-03-10', '0000-00-00 00:00:00', '2025-03-10 15:51:10'),
(4, 3, '2025-03-10', '0000-00-00 00:00:00', '2025-03-10 15:51:10'),
(5, 3, '2025-03-10', '0000-00-00 00:00:00', '2025-03-10 15:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('admin','user') NOT NULL DEFAULT 'user',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `user_type`, `last_login`, `created_at`) VALUES
(2, 'admin', '$2y$10$PG/BQ1gBZt/zEzFib/gpze3GRITLic65XbRXX9EHza/hEXWyX/jnm', 'admin', '2025-03-10 14:53:52', '2025-02-03 06:46:34'),
(3, 'user', '$2y$10$lgQsiEhqkCKGCJX.CSHfjOwAVNZSR6Rpps/j/IOvd9mdPRZpyw59G', 'user', '2025-03-10 15:52:41', '2025-02-03 06:48:45'),
(4, 'me', '$2y$10$TCYAbVkoKv0P02E3.0RPEeIX.xt2ErJT6i0PNqULArq4K12jgc8C6', 'admin', '2025-03-10 14:54:14', '2025-03-10 06:51:03'),
(5, 'mer', '$2y$10$JnORcs9j7WsA22dS/vCZveKla4BUXMDFuMfZ/PJk4yxoYuOQ9mVqm', 'admin', '2025-03-10 15:42:06', '2025-03-10 07:00:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD CONSTRAINT `login_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD CONSTRAINT `tbl_attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
