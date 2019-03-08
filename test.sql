SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `gorod` (
  `id_gorod` int(11) NOT NULL,
  `nazvanie_gorod` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `id_oblast` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `gorod` (`id_gorod`, `nazvanie_gorod`, `id_oblast`) VALUES
(4, 'Барнаул', 1),
(5, 'Бийск', 1),
(6, 'Рубцовск', 1);

CREATE TABLE `oblast` (
  `id_oblast` int(11) NOT NULL,
  `nazvanie_oblast` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_strana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oblast` (`id_oblast`, `nazvanie_oblast`, `id_strana`) VALUES
(1, 'Алтайский край', 1);

CREATE TABLE `strana` (
  `id_strana` int(11) NOT NULL,
  `nazvanie_strana` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `strana` (`id_strana`, `nazvanie_strana`) VALUES
(1, 'Россия');

ALTER TABLE `gorod`
  ADD PRIMARY KEY (`id_gorod`),
  ADD UNIQUE KEY `id_gorod` (`id_gorod`),
  ADD KEY `id_gorod_2` (`id_gorod`),
  ADD KEY `id_oblast` (`id_oblast`);

ALTER TABLE `oblast`
  ADD PRIMARY KEY (`id_oblast`),
  ADD UNIQUE KEY `id_oblast` (`id_oblast`),
  ADD KEY `id_strana` (`id_strana`);

ALTER TABLE `strana`
  ADD PRIMARY KEY (`id_strana`);

ALTER TABLE `gorod`
  MODIFY `id_gorod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `oblast`
  MODIFY `id_oblast` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `strana`
  MODIFY `id_strana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `gorod`
  ADD CONSTRAINT `gorod_ibfk_1` FOREIGN KEY (`id_oblast`) REFERENCES `oblast` (`id_oblast`);

ALTER TABLE `oblast`
  ADD CONSTRAINT `oblast_ibfk_1` FOREIGN KEY (`id_strana`) REFERENCES `strana` (`id_strana`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
