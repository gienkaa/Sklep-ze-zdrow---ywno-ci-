-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Lis 2023, 08:53
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sklep_ze_zdrową_żywnością`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `diety`
--

CREATE TABLE `diety` (
  `dieta_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `czas` int(11) NOT NULL,
  `nazwa` varchar(128) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `diety`
--

INSERT INTO `diety` (`dieta_id`, `user_id`, `czas`, `nazwa`) VALUES
(1, 1, 2, 'Dąbrowskiej'),
(2, 1, 4, 'ok');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarze`
--

CREATE TABLE `lekarze` (
  `lekarz_nazwisko` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `lekarz_imie` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `lekarz_tel` varchar(9) COLLATE utf8mb4_polish_ci NOT NULL,
  `lekarz_email` varchar(100) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `lekarze`
--

INSERT INTO `lekarze` (`lekarz_nazwisko`, `lekarz_imie`, `lekarz_tel`, `lekarz_email`) VALUES
('Błoch', 'Zuzanna', '555468976', 'z.bloch@gmail.com'),
('Ćwiek', 'Anna', '567908345', 'a.cwiek@gmail.com'),
('Karp', 'Antoni', '456783472', 'a.karp@gmail.com'),
('Kwiecień', 'Lidia', '', 'l.kwiecien@gmail.com'),
('Nowicki', 'Maciej', '123456789', 'm.nowicki@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `portfel`
--

CREATE TABLE `portfel` (
  `portfel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wartość` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `portfel`
--

INSERT INTO `portfel` (`portfel_id`, `user_id`, `wartość`) VALUES
(1, 1, '1552.67');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sposoby_platnosci`
--

CREATE TABLE `sposoby_platnosci` (
  `pl_id` varchar(10) COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwa` varchar(128) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `sposoby_platnosci`
--

INSERT INTO `sposoby_platnosci` (`pl_id`, `nazwa`) VALUES
('bk', 'BLIK'),
('kkd', 'Karta kredytowa/debetowa'),
('kp', 'Karta podarunkowa'),
('ka', 'Klarna'),
('PPl', 'Pay-Pal'),
('pt', 'Przelew tradycyjny'),
('sp', 'Szybki przelew(PayU, TPay, Przelewy24)'),
('zp', 'Za pobraniem');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login` varchar(128) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_name` varchar(128) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_surname` varchar(128) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_tel` int(9) NOT NULL,
  `user_email` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_address` varchar(128) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_city` varchar(128) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_streetnum` int(6) NOT NULL,
  `user_postalcode` varchar(10) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_password` varchar(128) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_name`, `user_surname`, `user_tel`, `user_email`, `user_address`, `user_city`, `user_streetnum`, `user_postalcode`, `user_password`) VALUES
(1, 'eka123', 'Emilia', 'Korba', 693254178, 'emka.ka@gmail.com', 'Moskiewska', 'Chodzibolice', 23, '34-897', '1qazXSW@'),
(2, 'milka45', 'Emilia', 'Foka', 523685742, 'emilia23@onet.pl', 'Wilijska', 'Charczew', 9, '45-789', 'qweasd12#'),
(3, 'iza12', 'Izabela', 'Opolska', 698752143, 'iza.opolska@gmail.com', 'Chodkiewicza', 'Tychy', 23, ' 34-765', '$2y$10$VCNHCH47a4jaFq1uexUxyOLRJo39gMJREXT6rPbrcjN34hBtRmdj2'),
(4, 'anka99', 'Anna', 'Zaradna', 567890234, 'anulaaa@gmail.com', 'Pomorska', 'Ełk', 12, ' 67-098', 'P1lk469@');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wizyty`
--

CREATE TABLE `wizyty` (
  `wizyta_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `lekarz_nazwisko` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `wizyty`
--

INSERT INTO `wizyty` (`wizyta_id`, `user_id`, `data`, `lekarz_nazwisko`) VALUES
(1, 1, '2022-07-12', 'Błoch'),
(3, 1, '2022-06-15', 'Kwiecień'),
(4, 1, '2022-06-15', 'Kwiecień'),
(5, 1, '2022-06-15', 'Kwiecień'),
(16, 1, '2022-06-15', 'Kwiecień');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `zam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ilosc_dni` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `zgubione_kg` decimal(7,2) NOT NULL,
  `spos_plat` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`zam_id`, `user_id`, `ilosc_dni`, `data`, `zgubione_kg`, `spos_plat`, `status`) VALUES
(1, 1, 15, '2022-06-13 00:02:56', '25.00', 'bk', 'w trakcie realizacji');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ćwiczenia`
--

CREATE TABLE `ćwiczenia` (
  `ćw_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nazwa` varchar(200) COLLATE utf8mb4_polish_ci NOT NULL,
  `czas_w_min` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ćwiczenia`
--

INSERT INTO `ćwiczenia` (`ćw_id`, `user_id`, `nazwa`, `czas_w_min`) VALUES
(1, 1, 'Jogging', 90),
(4, 1, 'orbitreki', 30);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `diety`
--
ALTER TABLE `diety`
  ADD PRIMARY KEY (`dieta_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `lekarze`
--
ALTER TABLE `lekarze`
  ADD PRIMARY KEY (`lekarz_nazwisko`);

--
-- Indeksy dla tabeli `portfel`
--
ALTER TABLE `portfel`
  ADD PRIMARY KEY (`portfel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `sposoby_platnosci`
--
ALTER TABLE `sposoby_platnosci`
  ADD PRIMARY KEY (`pl_id`),
  ADD KEY `nazwa` (`nazwa`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unikalnyemail` (`user_email`);

--
-- Indeksy dla tabeli `wizyty`
--
ALTER TABLE `wizyty`
  ADD PRIMARY KEY (`wizyta_id`),
  ADD KEY `user_id` (`user_id`,`lekarz_nazwisko`),
  ADD KEY `lekarz_nazwisko` (`lekarz_nazwisko`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`zam_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `spos_plat` (`spos_plat`);

--
-- Indeksy dla tabeli `ćwiczenia`
--
ALTER TABLE `ćwiczenia`
  ADD PRIMARY KEY (`ćw_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `diety`
--
ALTER TABLE `diety`
  MODIFY `dieta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `portfel`
--
ALTER TABLE `portfel`
  MODIFY `portfel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `wizyty`
--
ALTER TABLE `wizyty`
  MODIFY `wizyta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `zam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `ćwiczenia`
--
ALTER TABLE `ćwiczenia`
  MODIFY `ćw_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `diety`
--
ALTER TABLE `diety`
  ADD CONSTRAINT `diety_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `portfel`
--
ALTER TABLE `portfel`
  ADD CONSTRAINT `portfel_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `wizyty`
--
ALTER TABLE `wizyty`
  ADD CONSTRAINT `wizyty_ibfk_1` FOREIGN KEY (`lekarz_nazwisko`) REFERENCES `lekarze` (`lekarz_nazwisko`),
  ADD CONSTRAINT `wizyty_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`spos_plat`) REFERENCES `sposoby_platnosci` (`pl_id`);

--
-- Ograniczenia dla tabeli `ćwiczenia`
--
ALTER TABLE `ćwiczenia`
  ADD CONSTRAINT `ćwiczenia_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
