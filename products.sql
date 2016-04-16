-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2016. Ápr 16. 17:15
-- Kiszolgáló verziója: 10.1.9-MariaDB
-- PHP verzió: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE product;
USE product;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `account`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` mediumint(9) DEFAULT NULL,
  `stock` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`) VALUES
(1, 'Abigail K. Morse', 85672, 90),
(2, 'Brielle X. Dejesus', 64904, 86),
(3, 'Jonas F. Zimmerman', 42837, 86),
(4, 'Kyla E. Goff', 81507, 8),
(5, 'Maite D. Vance', 64107, 52),
(6, 'Alden E. Douglas', 30019, 96),
(7, 'Bevis G. Cooper', 31876, 94),
(8, 'Cameran K. David', 94472, 78),
(9, 'Ina U. Nixon', 75067, 8),
(10, 'Jane C. Gill', 53495, 52),
(11, 'Evelyn K. Ewing', 73190, 62),
(12, 'Carissa K. Baxter', 36352, 52),
(13, 'Kenyon N. Mosley', 31694, 76),
(14, 'Iona M. Logan', 89700, 46),
(15, 'Venus D. Dyer', 44249, 13),
(16, 'Maris J. Harrison', 97429, 31),
(17, 'Brittany E. Albert', 96817, 25),
(18, 'Chloe U. Grant', 49895, 9),
(19, 'Irene B. Huff', 62163, 13),
(20, 'Barrett L. Bean', 67605, 23),
(21, 'Bethany F. Barr', 42599, 96),
(22, 'Victoria Z. Silva', 23753, 54),
(23, 'Cailin W. Kramer', 56474, 16),
(24, 'Nero N. Fitzpatrick', 78122, 22),
(25, 'Sylvester G. Hickman', 35662, 57),
(26, 'Jamal F. Booth', 99430, 67),
(27, 'Carlos Y. Walters', 24785, 43),
(28, 'Amaya W. Bishop', 83950, 63),
(29, 'Chantale A. Ayers', 47097, 66),
(30, 'Regan L. Hays', 24736, 77),
(31, 'Noel Z. Craig', 30005, 9),
(32, 'Gregory F. Pitts', 40315, 45),
(33, 'Aline D. Soto', 91370, 87),
(34, 'Fritz M. Clayton', 95092, 14),
(35, 'Maia D. Rios', 25017, 69),
(36, 'Colby S. Holland', 38554, 60),
(37, 'Jeremy X. Mcdonald', 97066, 76),
(38, 'Eugenia V. Quinn', 73183, 27),
(39, 'Zephr W. Roy', 28440, 8),
(40, 'Orson P. Howell', 94466, 87),
(41, 'Halla W. Dickerson', 97185, 16),
(42, 'Sopoline T. Wallace', 32349, 14),
(43, 'Richard K. Bonner', 82762, 83),
(44, 'Lavinia X. Dotson', 65586, 53),
(45, 'Salvador P. Bryant', 64358, 93),
(46, 'Ferris X. Wolf', 65393, 63),
(47, 'Amber B. Moran', 68899, 12),
(48, 'Indira Y. Wolfe', 24942, 20),
(49, 'Forrest X. Lindsay', 65964, 52),
(50, 'Carter C. Richards', 72701, 69),
(51, 'Shafira R. Howard', 53856, 62),
(52, 'Trevor L. Maxwell', 23626, 41),
(53, 'Echo Z. Powell', 31901, 72),
(54, 'Colton W. Fleming', 21609, 81),
(55, 'Dahlia X. Kent', 32127, 6),
(56, 'Benjamin W. Peck', 61066, 96),
(57, 'Gloria C. Levy', 73160, 22),
(58, 'Wallace K. Perez', 37324, 95),
(59, 'Anastasia V. Freeman', 64677, 55),
(60, 'Russell I. Forbes', 27685, 86),
(61, 'Jeremy B. Jacobson', 20644, 8),
(62, 'Vivian S. Perez', 58623, 60),
(63, 'Zenia F. West', 61704, 83),
(64, 'Odysseus U. Justice', 44630, 18),
(65, 'Naida G. Walton', 35813, 12),
(66, 'Germaine B. Mcdowell', 99614, 33),
(67, 'Debra S. Thomas', 28378, 55),
(68, 'Flynn A. Ingram', 25055, 30),
(69, 'Lars I. Harrington', 70058, 13),
(70, 'Garth X. David', 49358, 66),
(71, 'Kenyon C. Ellis', 83908, 7),
(72, 'Cailin G. Carter', 80880, 11),
(73, 'Uriah E. Mooney', 57857, 88),
(74, 'Sebastian W. Fitzgerald', 93056, 86),
(75, 'Melvin J. Byrd', 83245, 3),
(76, 'Hyatt D. Mcclain', 28829, 41),
(77, 'Demetrius E. Noble', 22307, 13),
(78, 'Sandra J. Chavez', 78133, 73),
(79, 'Scarlett B. Norman', 69602, 30),
(80, 'Naida F. Moses', 84594, 28),
(81, 'Darrel L. Flowers', 51845, 99),
(82, 'Sopoline M. Mcclain', 32732, 57),
(83, 'Angela B. Bennett', 27612, 48),
(84, 'Hannah F. Todd', 34607, 80),
(85, 'Linus F. Battle', 95758, 74),
(86, 'Naida W. Dillard', 54601, 26),
(87, 'Aiko Y. Cervantes', 38377, 21),
(88, 'Demetria P. Richard', 52877, 98),
(89, 'Odette O. Gibbs', 63660, 79),
(90, 'Cheyenne D. Wolf', 56585, 76),
(91, 'Lyle F. Avila', 82763, 62),
(92, 'Sylvia Q. Kirk', 42255, 29),
(93, 'Aspen M. Rosa', 20411, 2),
(94, 'Kenyon B. Larsen', 82161, 93),
(95, 'Gail P. Gonzalez', 25087, 61),
(96, 'Porter L. Robles', 73363, 34),
(97, 'Garth Y. Chambers', 20779, 45),
(98, 'Mara I. Parrish', 63005, 42),
(99, 'Nell D. Larsen', 66278, 92),
(100, 'Lawrence T. Garner', 25933, 91);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
