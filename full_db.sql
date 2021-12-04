-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2020 at 03:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `AddressTypeId` int(11) NOT NULL,
  `AddressLine1` varchar(255) NOT NULL,
  `AddressLine2` varchar(255) DEFAULT NULL,
  `Town/City` varchar(255) NOT NULL,
  `County` varchar(255) NOT NULL,
  `CountryID` int(11) NOT NULL,
  `Postcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressID`, `AddressTypeId`, `AddressLine1`, `AddressLine2`, `Town/City`, `County`, `CountryID`, `Postcode`) VALUES
(1, 2, 'Airport Road', NULL, 'Belfast', 'Antrim', 1, 'BT29 4AB'),
(2, 2, 'Airport Road\r\n', NULL, 'Belfast', 'Down', 1, 'BT3 9JH'),
(3, 2, 'Airport Road', NULL, 'London', 'West Sussex', 2, 'RH6 0NP'),
(4, 1, '56 City Apartments', 'Falls Road', 'Belfast', 'Antrim', 1, 'BT34 9XQ'),
(23, 1, 'Charles De Gaulle Circuit', NULL, 'Paris', '8 Arrondissement', 3, '75008'),
(24, 1, 'Pariser Platz', NULL, 'Berlin', 'Mitte', 4, '10117'),
(25, 1, '29 Sundrive Rd', 'Kimmage', 'Dublin', 'Harold\'s Cross', 7, 'D12 V060'),
(26, 1, '1024 Via Principe Amedeo', NULL, 'Roma RM', 'Colosseo', 5, '00185'),
(27, 1, '238/A Carrer del Pintor Fortuny', '17', 'Barcelona', 'Sant Marti', 6, '08001'),
(28, 1, 'Tweede Helmersstraat 29', NULL, 'Amsterdam', 'Centrum', 8, '1054'),
(29, 1, '312 Duke\'s Rd', NULL, 'London', 'Kensington', 2, 'WC1H 9PJ'),
(30, 1, '231-2 Campus de Campolide', NULL, 'Lisbon', 'Santo Antonio', 10, '1070-312'),
(31, 1, 'Mikolajska 343', NULL, 'Krakow', 'Stare Miasto', 9, '31-027'),
(32, 1, 'Václavské nám 785', NULL, 'Prague', 'Nove Mesto', 11, '110 00'),
(33, 2, 'El Prat de Llobregat', NULL, 'Barcelona', 'de Llobregat', 6, '08820'),
(34, 2, 'Aviaticka\r\n', NULL, 'Prague', 'Prague 6', 11, '161 00 '),
(35, 2, '1 Kapitana Mieczyslawa Medweckiego ', NULL, 'Krakow', 'Balice', 9, '32-083'),
(36, 2, 'Avenue Charles de Gaulle', NULL, 'Avenue Charles de Gaulle', 'Roissy-en-France', 3, '95700'),
(37, 2, 'Saatwinkler Damm', NULL, 'Berlin', 'Reinickendorf', 4, '13405'),
(38, 2, 'R132 Corballis', NULL, 'Dublin', 'Collinstown', 7, 'K67 N4C8'),
(39, 2, 'Berliner Flughafen-Gesellschaft mbH\r\n', NULL, 'Berlin', 'Schönefeld', 4, '12521'),
(40, 1, '10 Downing Street', NULL, 'London', 'Westminster', 2, 'SW1A 2AB\r\n'),
(41, 1, '312 Wavers Marston', NULL, 'Birmingham', 'Marston Green', 2, 'B34 8GH'),
(42, 1, '39A Holyrood Road', NULL, 'Edinburgh', 'Old Town', 2, 'EH1 5HS'),
(43, 1, 'Buckingham Palace', NULL, 'London', 'Westminster', 2, 'SW1 1AA'),
(59, 1, '12 esquina', NULL, 'Barcelona', 'Carrer de la Fusteria', 6, '08002'),
(67, 1, '374 Lethal street', NULL, 'South Belfast', 'Belfast', 6, 'BT88 123');

-- --------------------------------------------------------

--
-- Table structure for table `address_type`
--

CREATE TABLE `address_type` (
  `AddressTypeID` int(11) NOT NULL,
  `AddressType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address_type`
--

INSERT INTO `address_type` (`AddressTypeID`, `AddressType`) VALUES
(1, 'UsersAddress'),
(2, 'AirportAddress');

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE `aircraft` (
  `AircraftID` int(11) NOT NULL,
  `AircraftRegistrationNumber` varchar(255) NOT NULL,
  `TotalSeats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`AircraftID`, `AircraftRegistrationNumber`, `TotalSeats`) VALUES
(1, 'G-EZWY', 156),
(2, 'F-EZEA', 180),
(3, 'L-EZTF', 186),
(4, 'G-EZDG', 235),
(5, 'F-HBXI', 156),
(6, 'J-AFDB', 235),
(7, 'G-HIAE', 186),
(8, 'F-GDAL', 156),
(9, 'B-AEFD', 180),
(10, 'J-GHSM', 235),
(11, 'A-HLAG', 156),
(12, 'G-WPTB', 180),
(13, 'T-AKGN', 186),
(14, 'G-QKGB', 156),
(15, 'G-CCBA', 180),
(16, 'G-AMFS', 156),
(17, 'G-HHSA', 156),
(18, 'A-DGGC', 180),
(19, 'D-FFGC', 156);

-- --------------------------------------------------------

--
-- Table structure for table `aircraft_seating_zones`
--

CREATE TABLE `aircraft_seating_zones` (
  `SeatingZoneId` int(11) NOT NULL,
  `SeatingZoneName` varchar(255) NOT NULL,
  `ZonePrice` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aircraft_seating_zones`
--

INSERT INTO `aircraft_seating_zones` (`SeatingZoneId`, `SeatingZoneName`, `ZonePrice`) VALUES
(1, 'extra_legroom_front', '12.00'),
(2, 'extra_legroom_rear', '10.00'),
(3, 'up_front', '8.00'),
(4, 'standard_forward', '6.00'),
(5, 'standard_rear', '5.00'),
(6, 'emergency_exit', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `AirportID` int(11) NOT NULL,
  `AirportName` varchar(255) NOT NULL,
  `AirportIATACode` varchar(255) NOT NULL,
  `AddressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`AirportID`, `AirportName`, `AirportIATACode`, `AddressID`) VALUES
(1, 'Belfast International Airport', 'BFS', 1),
(2, 'Belfast City Airport', 'BHD', 2),
(3, 'London Gatwick Airport', 'LGW', 3),
(4, 'Barcelona Airport', 'BCN', 33),
(5, 'Vaclav Havel Airport Prague', 'PRG', 34),
(6, 'Jana Pawla Airport Krakow', 'KRK', 35),
(7, 'Charles De Gaulle Airport', 'CDG', 36),
(8, 'Berlin Schoenefeld Airport\r\n', 'SXF', 39),
(9, 'Berlin Tegel Airport\r\n', 'TXL', 37),
(10, 'Dublin Airport', 'DUB', 38);

-- --------------------------------------------------------

--
-- Table structure for table `baggage_type`
--

CREATE TABLE `baggage_type` (
  `BaggageTypeID` int(11) NOT NULL,
  `BaggageTypeName` varchar(255) NOT NULL,
  `OnlineMinUnitPrice` decimal(12,2) NOT NULL,
  `AirportUnitPrice` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `baggage_type`
--

INSERT INTO `baggage_type` (`BaggageTypeID`, `BaggageTypeName`, `OnlineMinUnitPrice`, `AirportUnitPrice`) VALUES
(1, 'hold_max_15kg', '6.99', '0.00'),
(2, 'hold_max_23kg', '9.49', '45.00'),
(3, 'hold_max_26kg', '11.99', '45.00'),
(4, 'hold_max_29kg', '14.49', '55.00'),
(5, 'hold_max_32kg', '16.99', '55.00'),
(6, 'sports_bicycle', '45.00', '55.00'),
(7, 'sports_canoe', '45.00', '55.00'),
(8, 'sports_sporting_firearm', '37.00', '47.00'),
(9, 'sports_golf_bag', '37.00', '47.00'),
(10, 'sports_hang_glider', '45.00', '55.00'),
(11, 'sports_skis_or_boots', '37.00', '47.00'),
(12, 'sports_snowboard', '37.00', '47.00'),
(13, 'sports_windsurf_board', '45.00', '55.00'),
(14, 'sports_other_small', '37.00', '47.00');

-- --------------------------------------------------------

--
-- Table structure for table `booker`
--

CREATE TABLE `booker` (
  `BookerID` int(11) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `BookerFirstName` varchar(255) NOT NULL,
  `BookerLastName` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `TelephoneNumber` varchar(255) NOT NULL,
  `InternationalDialCode` int(11) NOT NULL,
  `EJPlusNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booker`
--

INSERT INTO `booker` (`BookerID`, `TitleID`, `BookerFirstName`, `BookerLastName`, `EmailAddress`, `AddressID`, `TelephoneNumber`, `InternationalDialCode`, `EJPlusNumber`) VALUES
(2, 1, 'Michael', 'Schumacher', 'mschu@berlin.dl', 24, '30847123740', 7, NULL),
(3, 2, 'Mary', 'O\'Connell', 'maryomary@ee.ie', 25, '1850230330', 3, NULL),
(4, 4, 'Carmella', 'Bonacelli', 'cbonelli@internet.it', 26, '06491330', 6, 'EZ235372'),
(5, 3, 'Maria', 'Garcia', 'm.garcia23@outlook.com', 27, '933151554', 9, NULL),
(6, 3, 'Sophie', 'Van Gaal', 'sopvangaal@hotmail.co.nl', 28, '104044655', 8, NULL),
(7, 1, 'Rupert', 'Scrivener', 'scrivy45@outlook.com', 29, '2078878888', 1, 'EZ4345451'),
(8, 1, 'Marco', 'Lopez', 'lopezthegreat@gmail.com', 30, '1213198642', 15, 'EZY323454'),
(9, 4, 'Aleksandra', 'Kaminski', 'alex_kaminski@gmail.com', 31, '124212144', 13, NULL),
(10, 4, 'Eliska', 'Novotny', 'novo_elis_12@outlook.com', 32, '0221803393', 14, 'EZY23753'),
(11, 1, 'David', 'Smith', 'weedavy42@gmail.co.uk', 4, '2890554643', 1, NULL),
(24, 3, 'Maria', 'Garcia', 'maria.garcia@work.co.esp', 27, '933151554', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `BookingReference` varchar(255) NOT NULL,
  `BookingDateTime` datetime NOT NULL,
  `BookerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `BookingReference`, `BookingDateTime`, `BookerID`) VALUES
(1, 'AX3TVEC', '2020-08-27 14:03:49', 2),
(2, 'EX56AF5', '2020-09-26 19:04:39', 7),
(3, 'EXQTVG3', '2020-10-28 13:52:28', 11),
(4, 'FG3KBUT', '2020-09-13 19:10:50', 4),
(5, 'FG4AANJ', '2020-10-02 19:11:59', 9),
(6, 'GHS5YHF', '2020-10-20 19:10:50', 3),
(7, 'HG2HDSV', '2020-11-10 14:18:43', 11),
(8, 'HW4RTJN', '2020-10-19 19:04:39', 4),
(9, 'KJA9DHF', '2020-10-22 19:12:39', 11),
(10, 'KJU5FCV', '2020-10-08 19:07:48', 11),
(11, 'NC7ADJX', '2020-10-25 19:07:48', 8),
(12, 'QV18JGV\r\n', '2020-10-20 19:12:39', 11),
(13, 'TDPA5VG', '2020-10-28 15:11:10', 6),
(23, 'GS4JGDN', '2020-11-11 10:11:39', 24);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `CountryID` int(11) NOT NULL,
  `CountryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`CountryID`, `CountryName`) VALUES
(1, 'Northern Ireland'),
(2, 'United Kingdom'),
(3, 'France'),
(4, 'Germany'),
(5, 'Italy'),
(6, 'Spain'),
(7, 'Republic of Ireland'),
(8, 'Netherlands'),
(9, 'Poland'),
(10, 'Portugal'),
(11, 'Czech Republic'),
(13, 'Denmark');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `CurrencyID` int(11) NOT NULL,
  `CurrencyName` varchar(255) NOT NULL,
  `CurrencyCode` varchar(255) NOT NULL,
  `CurrencySymbol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`CurrencyID`, `CurrencyName`, `CurrencyCode`, `CurrencySymbol`) VALUES
(1, 'Pounds Sterling', 'GBP', '£'),
(2, 'Euro', 'EUR', '€'),
(3, 'Hungarian Forint', 'HUF', 'Ft'),
(4, 'Danish Krone', 'DKK', 'kr'),
(7, 'Polish Zloty', 'PLN', 'zl'),
(8, 'Czech Crown', 'CZK', 'Kc'),
(12, 'Swiss Franc	', 'CHF', 'CHF'),
(13, 'Moroccan Dirhams', 'MAD', 'MD'),
(14, 'Swedish Kronor', 'SEK', 'kr'),
(15, 'US Dollars', 'USD', '$');

-- --------------------------------------------------------

--
-- Table structure for table `flight_route`
--

CREATE TABLE `flight_route` (
  `FlightRouteID` int(11) NOT NULL,
  `AircraftID` int(11) NOT NULL,
  `DepartureAirportID` int(11) NOT NULL,
  `ArrivalAirportID` int(11) NOT NULL,
  `RouteName` varchar(255) NOT NULL,
  `EstimatedDuration` varchar(255) NOT NULL,
  `DepartureTerminal` varchar(255) DEFAULT NULL,
  `ArrivalTerminal` varchar(255) DEFAULT NULL,
  `InterCountryTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_route`
--

INSERT INTO `flight_route` (`FlightRouteID`, `AircraftID`, `DepartureAirportID`, `ArrivalAirportID`, `RouteName`, `EstimatedDuration`, `DepartureTerminal`, `ArrivalTerminal`, `InterCountryTypeID`) VALUES
(1, 5, 4, 1, 'Barcelona to Belfast International', '2h 50min', '2', NULL, 2),
(2, 5, 1, 4, 'Belfast International to Barcelona', '2h 50min', NULL, '2', 2),
(3, 9, 1, 3, 'Belfast International to London Gatwick', '45min', NULL, '2', 1),
(4, 9, 3, 1, 'London Gatwick to Belfast International', '45min', '2', NULL, 1),
(5, 1, 9, 3, 'Berlin Tegel to London Gatwick', '2h', '3', '1', 2),
(6, 1, 3, 9, 'London Gatwick to Berlin Tegel', '2h', '1', '3', 2),
(7, 7, 9, 10, 'Berlin Tegel to Dublin', '2h 15min', '1', '2', 2),
(8, 7, 10, 9, 'Dublin to Berlin Tegel', '2h 15min', '2', '1', 2),
(9, 3, 5, 7, 'Prague to Paris Charles De Gaulle', '1h 45min', NULL, '3', 2),
(10, 3, 7, 5, 'Paris Charles De Gaulle to Prague', '1h 45min', '3', NULL, 2),
(11, 8, 6, 4, 'Krakow to Barcelona', '2h 50min', NULL, NULL, 2),
(12, 8, 4, 6, 'Barcelona to Krakow', '2h 50min', NULL, NULL, 2),
(13, 4, 7, 2, 'Belfast City to Paris Charles De Gaulle', '1h 50min', '2', NULL, 2),
(14, 4, 2, 7, 'Paris Charles De Gaulle to Belfast City.', '1h 50min', NULL, '2', 2),
(15, 10, 1, 6, 'Belfast International to Krakow', '3h 10min', NULL, NULL, 2),
(16, 10, 6, 1, 'Krakow to Belfast International', '3h 10min', NULL, NULL, 2),
(17, 11, 1, 5, 'Belfast International to Prague ', '3h 30min', NULL, NULL, 2),
(18, 11, 5, 1, 'Prague to Belfast International', '3h 30min', NULL, NULL, 2),
(19, 12, 1, 9, 'Belfast International to Berlin Tegel', '2h 30min', NULL, '2', 2),
(20, 12, 9, 1, 'Berlin Tegel to Belfast International', '2h 30min', '2', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `flight_schedule`
--

CREATE TABLE `flight_schedule` (
  `FlightScheduleID` int(11) NOT NULL,
  `FlightRouteID` int(11) NOT NULL,
  `DepartureDate` date NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalDate` date NOT NULL,
  `ArrivalTime` time NOT NULL,
  `Cost` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_schedule`
--

INSERT INTO `flight_schedule` (`FlightScheduleID`, `FlightRouteID`, `DepartureDate`, `DepartureTime`, `ArrivalDate`, `ArrivalTime`, `Cost`) VALUES
(3, 7, '2020-12-01', '09:00:00', '2020-12-01', '11:00:00', '86.99'),
(4, 8, '2020-12-05', '17:00:00', '2020-12-05', '19:00:00', '39.99'),
(5, 3, '2020-11-09', '07:30:00', '2020-11-09', '08:20:00', '36.99'),
(6, 4, '2020-11-12', '15:00:00', '2020-11-12', '16:20:00', '41.99'),
(7, 14, '2020-12-06', '22:30:00', '2020-12-07', '00:30:00', '50.99'),
(8, 13, '2020-12-13', '13:00:00', '2020-12-13', '15:00:00', '47.99'),
(9, 1, '2020-12-06', '06:15:00', '2020-12-06', '09:15:00', '34.99'),
(10, 2, '2020-12-06', '09:45:00', '2020-12-06', '12:45:00', '86.99'),
(11, 1, '2020-12-06', '13:45:00', '2020-12-06', '14:45:00', '56.99'),
(12, 2, '2020-12-06', '15:30:00', '2020-12-06', '18:30:00', '110.99'),
(13, 5, '2020-11-24', '05:30:00', '2020-11-22', '07:15:00', '73.99'),
(14, 6, '2020-11-22', '08:00:00', '2020-11-22', '10:15:00', '54.99'),
(15, 5, '2020-11-22', '11:00:00', '2020-11-22', '13:15:00', '65.99'),
(16, 6, '2020-11-22', '14:00:00', '2020-11-22', '16:15:00', '34.99'),
(17, 9, '2020-11-04', '06:20:00', '2020-11-04', '08:20:00', '84.99'),
(18, 10, '2020-11-04', '09:15:00', '2020-11-04', '11:15:00', '125.99'),
(19, 9, '2020-11-04', '12:00:00', '2020-11-04', '14:00:00', '75.99'),
(20, 10, '2020-11-04', '15:00:00', '2020-11-04', '17:00:00', '140.99'),
(21, 1, '2020-12-13', '07:00:00', '2020-12-13', '10:00:00', '96.99'),
(22, 2, '2020-12-13', '10:45:00', '2020-12-13', '13:45:00', '74.99'),
(27, 1, '2020-12-13', '14:30:00', '2020-12-13', '17:30:00', '54.99'),
(28, 2, '2020-12-13', '18:15:00', '2020-12-13', '21:15:00', '63.99');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `FoodID` int(11) NOT NULL,
  `FoodName` varchar(255) NOT NULL,
  `Cost` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FoodID`, `FoodName`, `Cost`) VALUES
(1, 'Food Voucher Large', '7.00'),
(2, 'Food Voucher Small', '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `intercountry_type`
--

CREATE TABLE `intercountry_type` (
  `InterCountryTypeID` int(11) NOT NULL,
  `InterCountryType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intercountry_type`
--

INSERT INTO `intercountry_type` (`InterCountryTypeID`, `InterCountryType`) VALUES
(1, 'Domestic'),
(2, 'International');

-- --------------------------------------------------------

--
-- Table structure for table `international_dial_codes`
--

CREATE TABLE `international_dial_codes` (
  `InternationalDialCodeID` int(11) NOT NULL,
  `CountryID` int(11) NOT NULL,
  `InternationalDialCode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `international_dial_codes`
--

INSERT INTO `international_dial_codes` (`InternationalDialCodeID`, `CountryID`, `InternationalDialCode`) VALUES
(1, 2, '+44'),
(3, 7, '+353'),
(5, 3, '+33'),
(6, 5, '+39'),
(7, 4, '+49'),
(8, 8, '+31'),
(9, 6, '+34'),
(10, 13, '+45'),
(13, 9, '+48\r\n'),
(14, 11, '+420'),
(15, 10, '+351');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `PassengerID` int(11) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `PassengerFirstName` varchar(255) NOT NULL,
  `PassengerLastName` varchar(255) NOT NULL,
  `PassengerAgeID` int(11) NOT NULL,
  `PassengerTypeID` int(11) NOT NULL,
  `ReasonForTravel` varchar(255) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `PassportID` int(11) DEFAULT NULL,
  `CheckedIn` tinyint(1) NOT NULL,
  `SeatID` int(11) NOT NULL,
  `EJPlusNumber` varchar(255) DEFAULT NULL,
  `IsFlexiFare` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`PassengerID`, `TitleID`, `PassengerFirstName`, `PassengerLastName`, `PassengerAgeID`, `PassengerTypeID`, `ReasonForTravel`, `BookingID`, `PassportID`, `CheckedIn`, `SeatID`, `EJPlusNumber`, `IsFlexiFare`) VALUES
(5, 1, 'Michael', 'Schumacher', 18, 1, 'Business', 1, 7, 1, 9, NULL, 0),
(6, 1, 'Michael', 'Schumacher', 18, 1, 'Business', 1, 7, 1, 10, NULL, 0),
(7, 1, 'David', 'Smith', 18, 1, 'Leisure', 3, NULL, 0, 16, NULL, 0),
(8, 1, 'Olga', 'Smith', 18, 1, 'Leisure', 3, NULL, 0, 15, NULL, 0),
(9, 1, 'David', 'Smith', 18, 1, 'Leisure', 3, NULL, 0, 17, NULL, 0),
(10, 1, 'Olga', 'Smith', 18, 1, 'Leisure', 3, NULL, 0, 18, NULL, 0),
(11, 1, 'David', 'Van Haal', 18, 1, 'Leisure', 13, 13, 1, 1, 'EZY4453487', 0),
(12, 4, 'Louise', 'Van Haal', 18, 1, 'Leisure', 13, 14, 1, 2, NULL, 0),
(13, 1, 'Michael', 'Van Haal', 14, 2, 'Leisure', 13, 15, 1, 3, NULL, 0),
(14, 1, 'Daan', 'Van Haal', 16, 2, 'Leisure', 13, 16, 1, 4, NULL, 0),
(15, 1, 'David', 'Van Haal', 18, 1, 'Leisure', 13, 13, 1, 5, 'EZY4453487', 0),
(16, 4, 'Louise', 'Van Haal', 18, 1, 'Leisure', 13, 14, 1, 6, NULL, 0),
(17, 1, 'Michael', 'Van Haal', 1, 3, 'Leisure', 13, 15, 1, 7, NULL, 0),
(18, 1, 'Daan', 'Van Haal', 16, 2, 'Leisure', 13, 16, 1, 8, NULL, 0),
(19, 1, 'Derek', 'Lopez', 18, 1, 'Leisure', 7, 10, 0, 11, 'EZY554675', 0),
(20, 4, 'Rachel', 'Lynch', 17, 1, 'Business', 9, NULL, 1, 13, NULL, 0),
(21, 1, 'Daniel', 'Peters', 18, 1, 'Business', 10, NULL, 1, 14, NULL, 0),
(58, 3, 'Anna', 'McKay', 18, 1, 'Leisure', 23, NULL, 1, 27, NULL, 0),
(59, 3, 'Katie', 'McKay', 1, 3, 'Leisure', 23, NULL, 1, 27, NULL, 0),
(60, 3, 'Anna', 'McKay', 18, 1, 'Leisure', 23, NULL, 1, 28, NULL, 0),
(61, 3, 'Katie', 'McKay', 1, 3, 'Leisure', 23, NULL, 1, 28, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_age`
--

CREATE TABLE `passenger_age` (
  `PassengerAgeId` int(11) NOT NULL,
  `PassengerAge` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_age`
--

INSERT INTO `passenger_age` (`PassengerAgeId`, `PassengerAge`) VALUES
(1, 'Under 2'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12'),
(13, '13'),
(14, '14'),
(15, '15'),
(16, '16'),
(17, '17'),
(18, '18+');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_baggage`
--

CREATE TABLE `passenger_baggage` (
  `PassengerBaggageId` int(11) NOT NULL,
  `BaggageTypeID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_baggage`
--

INSERT INTO `passenger_baggage` (`PassengerBaggageId`, `BaggageTypeID`, `PassengerID`) VALUES
(1, 2, 11),
(2, 2, 12),
(3, 2, 13),
(4, 2, 14),
(5, 1, 7),
(6, 2, 9),
(7, 8, 14),
(8, 8, 18),
(9, 9, 20),
(10, 4, 20),
(11, 4, 20),
(12, 2, 19),
(13, 11, 19),
(56, 1, 58),
(57, 2, 58),
(58, 1, 60),
(59, 2, 60);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_food`
--

CREATE TABLE `passenger_food` (
  `PassengerFoodID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_food`
--

INSERT INTO `passenger_food` (`PassengerFoodID`, `PassengerID`, `FoodID`) VALUES
(1, 5, 1),
(2, 6, 1),
(14, 58, 1);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_special_assistance`
--

CREATE TABLE `passenger_special_assistance` (
  `PassengerSpecialAssistanceID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `SpecialAssistanceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_special_assistance`
--

INSERT INTO `passenger_special_assistance` (`PassengerSpecialAssistanceID`, `PassengerID`, `SpecialAssistanceID`) VALUES
(1, 8, 1),
(2, 8, 6),
(3, 10, 1),
(4, 10, 6),
(5, 7, 4),
(6, 9, 4),
(7, 20, 6),
(8, 19, 3),
(9, 21, 4),
(31, 58, 6),
(32, 60, 6);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_type`
--

CREATE TABLE `passenger_type` (
  `PassengerTypeID` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_type`
--

INSERT INTO `passenger_type` (`PassengerTypeID`, `TypeName`) VALUES
(1, 'Adult'),
(2, 'Child'),
(3, 'Infant');

-- --------------------------------------------------------

--
-- Table structure for table `passport`
--

CREATE TABLE `passport` (
  `PassportID` int(11) NOT NULL,
  `NameOnPassport` varchar(255) NOT NULL,
  `PassportNumber` varbinary(255) NOT NULL,
  `CountryID` int(11) NOT NULL,
  `ExpiryDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passport`
--

INSERT INTO `passport` (`PassportID`, `NameOnPassport`, `PassportNumber`, `CountryID`, `ExpiryDate`) VALUES
(7, 'Michael David Schumacher', 0xeac7f13d52cd88fc4f79e9623fa2e37d, 4, '2022-03-18'),
(8, 'Carmella Bonacelli', 0x13dc7eb88ff08ed589e4f9282d3e2b22, 5, '2025-01-22'),
(9, 'Maria Anna Regina Garcia', 0x9fbf7fb03126cb184faaebed0d2e454a, 6, '2021-01-19'),
(10, 'Marco Emmanuel Lopez', 0x9f5725c76e5eea12c796ef801f606685, 10, '2025-08-15'),
(11, 'Eliska Adriana Novotny', 0xab88fb7e1d4e2bb1aa0c07442f76f419, 11, '2029-12-14'),
(12, 'David Michael Smith', 0x926abc7f27230ca744f24d030c1d4b35, 2, '2020-04-23'),
(13, 'David Van Haal', 0xc249789bf8c658c13a1e778961a32c35, 8, '2022-11-18'),
(14, 'Louise Van Haal', 0xa4b9a88da66bf1173a816f3efe15b69e, 8, '2025-01-04'),
(15, 'Michael Van Haal', 0x5ef618a3cd32d28108e7b12877fa1509, 8, '2021-01-07'),
(16, 'Daan Van Haal', 0xf8272dc3ccc55b2572f6e5a8302884a0, 8, '2020-09-02');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentTypeID` int(11) NOT NULL,
  `PaymentDateTime` datetime(6) NOT NULL,
  `PaymentVendorReference` varchar(255) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `UserCurrencyCost` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `PaymentTypeID`, `PaymentDateTime`, `PaymentVendorReference`, `CurrencyID`, `UserCurrencyCost`) VALUES
(5, 2, '2020-10-28 14:05:31.000000', 'VS-657-8743', 1, '157.96'),
(6, 6, '2020-10-28 13:54:28.000000', 'MC4553-4542', 2, '155.96'),
(7, 12, '2020-10-28 15:04:00.000000', 'CBF33-445-3422', 2, '459.88'),
(8, 2, '2020-10-28 16:45:46.000000', 'VS-435-4436', 1, '22.99'),
(9, 9, '2020-10-28 17:03:15.000000', 'VS-657-8743', 1, '31.98'),
(10, 5, '2020-07-15 17:48:19.000000', 'D-44565-234', 12, '115.98'),
(11, 9, '2020-07-22 17:48:19.000000', 'VDB-334599865', 14, '570.00'),
(12, 2, '2020-09-21 17:49:57.000000', 'VS-548-2245', 8, '5320.00'),
(13, 6, '2020-09-17 17:49:57.000000', 'VS-225-6346\r\n', 2, '45.98'),
(14, 6, '2020-10-19 17:51:22.000000', 'MC9965-0012', 3, '98550.00'),
(15, 10, '2020-08-13 17:51:22.000000', '445366765DE', 4, '830.00'),
(16, 3, '2020-10-18 17:53:58.000000', 'VS-E-3225-4453', 2, '173.58'),
(17, 1, '2020-08-13 17:53:58.000000', '43332-66754', 1, '322.88'),
(18, 12, '2020-10-29 19:31:51.000000', 'CBF67-112-3642', 2, '37.00'),
(19, 12, '2020-10-29 19:38:49.000000', 'CBF43-332-5644', 2, '37.00'),
(20, 2, '2020-10-30 12:55:19.000000', 'VS-122-4453', 1, '12.60'),
(35, 6, '2020-11-11 10:11:39.000000', 'MC4553-4542', 2, '280.94');

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `PaymentTypeID` int(11) NOT NULL,
  `PaymentType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`PaymentTypeID`, `PaymentType`) VALUES
(1, 'American Express'),
(2, 'Visa'),
(3, 'Visa Delta'),
(4, 'Diners Club\r\n'),
(5, 'Discover'),
(6, 'MasterCard'),
(7, 'Maestro / Solo'),
(8, 'Visa Electron'),
(9, 'Visa Debit'),
(10, 'UATP/Airplus'),
(11, 'Debit MasterCard'),
(12, 'Carte Bleue');

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `RevenueID` int(11) NOT NULL,
  `TransactionLineItemID` int(11) NOT NULL,
  `RevenueInEuro` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES
(1, 1, '40.95'),
(2, 2, '40.95'),
(3, 3, '46.58'),
(4, 4, '46.58'),
(5, 5, '86.99'),
(6, 6, '39.99'),
(7, 9, '12.99'),
(8, 10, '15.99'),
(9, 11, '50.99'),
(10, 12, '47.99'),
(11, 13, '50.99'),
(12, 14, '47.99'),
(13, 15, '50.99'),
(14, 16, '47.99'),
(15, 17, '50.99'),
(16, 18, '47.99'),
(17, 19, '15.99'),
(18, 20, '15.99'),
(19, 21, '15.99'),
(20, 22, '15.99'),
(21, 23, '25.46'),
(22, 24, '17.71'),
(23, 25, '17.71'),
(24, 26, '37.00'),
(25, 27, '37.00'),
(26, 28, '7.00'),
(27, 29, '7.00'),
(119, 122, '86.99'),
(120, 123, '25.00'),
(121, 124, '56.99'),
(122, 125, '25.00'),
(123, 126, '15.99'),
(124, 127, '15.99'),
(125, 128, '23.99'),
(126, 129, '23.99'),
(127, 130, '7.00');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `SeatID` int(11) NOT NULL,
  `SeatNumber` varchar(255) NOT NULL,
  `SeatingZoneID` int(11) DEFAULT NULL,
  `FlightScheduleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`SeatID`, `SeatNumber`, `SeatingZoneID`, `FlightScheduleID`) VALUES
(1, '15A', NULL, 7),
(2, '15B', NULL, 7),
(3, '15C', NULL, 7),
(4, '15D', NULL, 7),
(5, '23D', NULL, 8),
(6, '23E', NULL, 8),
(7, '17A', NULL, 8),
(8, '17B', NULL, 8),
(9, '2C', 1, 3),
(10, '24C', NULL, 4),
(11, '10A', 6, 13),
(12, '10B', 6, 14),
(13, '33C', 6, 14),
(14, '33D', 6, 13),
(15, '23A', NULL, 5),
(16, '23B', NULL, 5),
(17, '5D', 2, 6),
(18, '5E', 2, 6),
(19, '33A', NULL, 3),
(20, '21F', NULL, 4),
(21, '13B', 6, 4),
(22, '27D', NULL, 5),
(23, '13E', 6, 3),
(24, '14C', 6, 6),
(25, '9C', 4, 7),
(26, '2D', 1, 7),
(27, '1C', 1, 10),
(28, '1D', 1, 21),
(29, '13A', 4, 21),
(30, '13B', 4, 21),
(31, '15D', 6, 10),
(32, '15C', 6, 10),
(33, '23A', NULL, 21),
(34, '24F', NULL, 21),
(35, '1C', 1, 10),
(36, '1D', 1, 10),
(37, '23A', 4, 21),
(38, '23B', 4, 21),
(39, '15C', 6, 10),
(40, '15D', 6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `special_assistance_type`
--

CREATE TABLE `special_assistance_type` (
  `SpecialAssistanceID` int(11) NOT NULL,
  `AssistanceType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `special_assistance_type`
--

INSERT INTO `special_assistance_type` (`SpecialAssistanceID`, `AssistanceType`) VALUES
(1, 'Blind / sight impaired'),
(2, 'WheelUser or Assistance'),
(3, 'Recognised_guide / guide dog'),
(4, 'Deaf or Hearing impaired'),
(5, 'Intellectual or Development disability'),
(6, 'Nut Allergy');

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `TitleID` int(11) NOT NULL,
  `TitleName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`TitleID`, `TitleName`) VALUES
(1, 'Mr'),
(2, 'Ms'),
(3, 'Miss'),
(4, 'Mrs');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_line_items`
--

CREATE TABLE `transaction_line_items` (
  `TransactionLineItemID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `ItemDescription` varchar(255) NOT NULL,
  `UserCurrencyCost` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_line_items`
--

INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES
(1, 1, 'Flight Belfast to Gatwick - 1 Adult', '36.99', 1, 5),
(2, 1, 'Flight Belfast to Gatwick - 1 Adult', '36.99', 1, 5),
(3, 1, 'Flight Gatwick to Belfast - 1 Adult', '41.99', 1, 5),
(4, 1, 'Flight Gatwick to Belfast - 1 Adult', '41.99', 1, 5),
(5, 3, 'Flight Berlin to Dublin - 1 Adult', '86.99', 2, 6),
(6, 3, 'Flight Dublin to Berlin - 1 Adult', '39.99', 2, 6),
(9, 3, 'Luggage hold_max_15kg', '12.99', 2, 6),
(10, 3, 'Luggage hold_max_23kg', '15.99', 2, 6),
(11, 13, 'Flight Charles De Gaulle - Belfast City - 1 Adult', '50.99', 2, 7),
(12, 13, 'Flight Belfast City - Charles De Gaulle - 1 Adult', '47.99', 2, 7),
(13, 13, 'Flight Charles De Gaulle - Belfast City - 1 Adult', '50.99', 2, 7),
(14, 13, 'Flight Belfast City - Charles De Gaulle - 1 Adult', '47.99', 2, 7),
(15, 13, 'Flight Charles De Gaulle - Belfast City - 1 Adult', '50.99', 2, 7),
(16, 13, 'Flight Belfast City - Charles De Gaulle - 1 Adult', '47.99', 2, 7),
(17, 13, 'Flight Charles De Gaulle - Belfast City - 1 Adult', '50.99', 2, 7),
(18, 13, 'Flight Belfast City - Charles De Gaulle - 1 Adult', '47.99', 2, 7),
(19, 13, 'Luggage hold_max_23kg', '15.99', 2, 7),
(20, 13, 'Luggage hold_max_23kg', '15.99', 2, 7),
(21, 13, 'Luggage hold_max_23kg', '15.99', 2, 7),
(22, 13, 'Luggage hold_max_23kg', '15.99', 2, 7),
(23, 1, 'Seat Upgrade Extra Legroom front', '22.99', 1, 8),
(24, 3, 'Seat Upgrade Extra legroom rear', '15.99', 1, 9),
(25, 3, 'Seat Upgrade Extra legroom rear', '15.99', 1, 9),
(26, 13, 'Luggage Sports_sporting_firearm', '37.00', 2, 18),
(27, 13, 'Luggage Sports_sporting_firearm', '37.00', 2, 19),
(28, 1, 'Food Voucher Large', '6.30', 1, 20),
(29, 1, 'Food Voucher Large', '6.30', 1, 20),
(122, 23, 'Flight - Belfast to Barcelona - 1 Adult', '86.99', 2, 35),
(123, 23, 'Flight - Belfast to Barcelona - 1 Infant', '25.00', 2, 35),
(124, 23, 'Flight - Barcelona to Belfast - 1 Adult', '56.99', 2, 35),
(125, 23, 'Flight - Barcelona to Belfast - 1 Infant', '25.00', 2, 35),
(126, 23, 'Luggage - hold bag 15kg', '15.99', 2, 35),
(127, 23, 'Luggage - hold bag 15kg', '15.99', 2, 35),
(128, 23, 'Luggage - hold bag 23kg', '23.99', 2, 35),
(129, 23, 'Luggage - hold bag 23kg', '23.99', 2, 35),
(130, 23, 'Food Voucher - Large - Belfast to Barcelona', '7.00', 2, 35);

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `UserAccountID` int(11) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `UserFirstName` varchar(255) NOT NULL,
  `UserLastName` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `AccountPassword` varbinary(255) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `PrimaryPhoneNumber` varchar(255) NOT NULL,
  `AlternatePhoneNumber` varchar(255) DEFAULT NULL,
  `InternationalDialCode` int(11) NOT NULL,
  `EJOffers` tinyint(1) NOT NULL,
  `PartnerOffers` tinyint(1) NOT NULL,
  `EJPlusNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`UserAccountID`, `TitleID`, `UserFirstName`, `UserLastName`, `EmailAddress`, `AccountPassword`, `AddressID`, `PrimaryPhoneNumber`, `AlternatePhoneNumber`, `InternationalDialCode`, `EJOffers`, `PartnerOffers`, `EJPlusNumber`) VALUES
(3, 3, 'Maria', 'Garcia', 'm.garcia23@outlook.com', 0xfeb39df2b43869eece204650cd926cb4, 27, '933151554', '393496843', 9, 1, 0, NULL),
(4, 4, 'Aleksandra', 'Kaminski', 'alex_kaminski@gmail.com', 0x131a2f59a7f25ee5873bd941b3c3828c, 31, '124212144', NULL, 13, 0, 0, NULL),
(5, 1, 'David', 'Smith', 'weedavy42@gmail.co.uk', 0x4d5bf9dbc57450414b8053211776f780, 4, '2890554643', NULL, 1, 1, 1, NULL),
(6, 2, 'Mary', 'O\'Connell', 'maryomary@ee.ie', 0xf120fc5d942397a9f1208cd2d9eed9e2, 25, '1850230330', '5633955783', 3, 1, 0, NULL),
(7, 1, 'Michael', 'Schumacher', 'mschu@berlin.dl', 0xa2f4839177f927d31bd7a5dacb39144a, 24, '30847123740', NULL, 7, 0, 0, NULL),
(8, 1, 'Marco', 'Lopez', 'lopezthegreat@gmail.com', 0x0f4f28920171cd0478be19e5643f6818, 30, '1213198642', NULL, 15, 1, 0, 'EZY323454'),
(9, 4, 'Eliska', 'Novotny', 'novo_elis_12@outlook.com', 0x7f358f30f32a7141fb3cc8c37d686ab8, 32, '0221803393', '4568653246', 14, 1, 1, 'EZY23753'),
(10, 1, 'Rupert', 'Scrivener', 'scrivy45@outlook.com', 0xe12ff84c8b9932bcf5d8ce785771abd22efa6e587c2063e6fc8c34751a4b949f, 29, '2078878888', '34469493221', 1, 1, 0, 'EZ4345451'),
(11, 4, 'Carmella', 'Bonacelli', 'cbonelli@internet.it', 0x5ab5247e40017ac6009e62aee17ced00, 26, '06491330', NULL, 6, 1, 1, 'EZ235372'),
(12, 3, 'Sophie', 'Van Gaal', 'sopvangaal@hotmail.co.nl', 0x0029d016850374516ac48a176e141ee5, 28, '104044655', NULL, 8, 1, 0, NULL),
(13, 1, 'Boris', 'Johnston', 'bojoforever@downingstreet.co.uk', 0x312d70346dd422e37ec3160b108d214c, 40, '2045356644', '5435532241', 1, 1, 1, 'EZY4677842'),
(14, 4, 'Elizabeth', 'Crockett', 'lizac@gmail.com', 0xd35cc120cbe39bdafca7fac99076cd79, 41, '27454532245', NULL, 1, 0, 0, NULL),
(15, 1, 'Adam', 'Smith', 'capitalism@scotland.co.uk', 0x273d5d747a1c79e51b4d0bcd998ee5af, 42, '28350694305', NULL, 1, 1, 1, 'EZY2040542'),
(16, 1, 'Charles', 'Windsor', 'bonnyprince@royal.co.uk', 0xa907bca193e6ecba9b351a85e4fe78b3, 43, '29456311463', NULL, 1, 0, 0, 'EZ30567043'),
(27, 3, 'Maria', 'Garcia', 'maria.garcia@work.co.esp', 0x551cff71f885b947ead5484f28e6f9f7, 59, '876673342', NULL, 9, 1, 1, NULL),
(35, 1, 'Seamus', 'Heaney', 'seamus@gmail.com', 0xc0933754deaf3ab128212ffaf113d9d6, 67, '2890445324', NULL, 9, 1, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_AddresstypeID` (`AddressTypeId`),
  ADD KEY `FK_CountryID` (`CountryID`);

--
-- Indexes for table `address_type`
--
ALTER TABLE `address_type`
  ADD PRIMARY KEY (`AddressTypeID`);

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`AircraftID`),
  ADD UNIQUE KEY `AircraftRegistrationNumber` (`AircraftRegistrationNumber`);

--
-- Indexes for table `aircraft_seating_zones`
--
ALTER TABLE `aircraft_seating_zones`
  ADD PRIMARY KEY (`SeatingZoneId`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`AirportID`),
  ADD KEY `FK_AddressID` (`AddressID`);

--
-- Indexes for table `baggage_type`
--
ALTER TABLE `baggage_type`
  ADD PRIMARY KEY (`BaggageTypeID`);

--
-- Indexes for table `booker`
--
ALTER TABLE `booker`
  ADD PRIMARY KEY (`BookerID`),
  ADD KEY `FK_International_dial_code` (`InternationalDialCode`),
  ADD KEY `FK_title` (`TitleID`),
  ADD KEY `FK_address` (`AddressID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `FK_BookerID` (`BookerID`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`CountryID`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`CurrencyID`),
  ADD UNIQUE KEY `CurrencyName` (`CurrencyName`);

--
-- Indexes for table `flight_route`
--
ALTER TABLE `flight_route`
  ADD PRIMARY KEY (`FlightRouteID`),
  ADD UNIQUE KEY `RouteName` (`RouteName`),
  ADD KEY `FK_Intercountry` (`InterCountryTypeID`),
  ADD KEY `FK_AircraftID` (`AircraftID`),
  ADD KEY `FK_DepartureAirportID` (`DepartureAirportID`),
  ADD KEY `FK_ArrivalAirportID` (`ArrivalAirportID`);

--
-- Indexes for table `flight_schedule`
--
ALTER TABLE `flight_schedule`
  ADD PRIMARY KEY (`FlightScheduleID`),
  ADD KEY `FK_FlightRouteID` (`FlightRouteID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`FoodID`);

--
-- Indexes for table `intercountry_type`
--
ALTER TABLE `intercountry_type`
  ADD PRIMARY KEY (`InterCountryTypeID`);

--
-- Indexes for table `international_dial_codes`
--
ALTER TABLE `international_dial_codes`
  ADD PRIMARY KEY (`InternationalDialCodeID`),
  ADD KEY `FK_countryIdentity` (`CountryID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PassengerID`),
  ADD KEY `FK_SeatID` (`SeatID`),
  ADD KEY `FK_PassportID` (`PassportID`),
  ADD KEY `FK_PassengerTypeID` (`PassengerTypeID`),
  ADD KEY `FK_TItleID` (`TitleID`),
  ADD KEY `FK_PassengerAgeID` (`PassengerAgeID`),
  ADD KEY `FK_bookingIdentity` (`BookingID`);

--
-- Indexes for table `passenger_age`
--
ALTER TABLE `passenger_age`
  ADD PRIMARY KEY (`PassengerAgeId`);

--
-- Indexes for table `passenger_baggage`
--
ALTER TABLE `passenger_baggage`
  ADD PRIMARY KEY (`PassengerBaggageId`),
  ADD KEY `FK_BaggageTypeID` (`BaggageTypeID`),
  ADD KEY `FK_PassID` (`PassengerID`);

--
-- Indexes for table `passenger_food`
--
ALTER TABLE `passenger_food`
  ADD PRIMARY KEY (`PassengerFoodID`),
  ADD KEY `FK_passenID` (`PassengerID`),
  ADD KEY `FK_FoodID` (`FoodID`);

--
-- Indexes for table `passenger_special_assistance`
--
ALTER TABLE `passenger_special_assistance`
  ADD PRIMARY KEY (`PassengerSpecialAssistanceID`),
  ADD KEY `FK_PassengerID` (`PassengerID`),
  ADD KEY `FK_SpecialAssistanceID` (`SpecialAssistanceID`);

--
-- Indexes for table `passenger_type`
--
ALTER TABLE `passenger_type`
  ADD PRIMARY KEY (`PassengerTypeID`);

--
-- Indexes for table `passport`
--
ALTER TABLE `passport`
  ADD PRIMARY KEY (`PassportID`),
  ADD KEY `FK_Country_id` (`CountryID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `FK_PaymentTypeID` (`PaymentTypeID`),
  ADD KEY `FK_currency` (`CurrencyID`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`PaymentTypeID`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`RevenueID`),
  ADD KEY `FK_TransLineItemID` (`TransactionLineItemID`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`SeatID`),
  ADD KEY `FK_FlightScheduleID` (`FlightScheduleID`),
  ADD KEY `FK_SeatingZoneID` (`SeatingZoneID`);

--
-- Indexes for table `special_assistance_type`
--
ALTER TABLE `special_assistance_type`
  ADD PRIMARY KEY (`SpecialAssistanceID`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`TitleID`);

--
-- Indexes for table `transaction_line_items`
--
ALTER TABLE `transaction_line_items`
  ADD PRIMARY KEY (`TransactionLineItemID`),
  ADD KEY `FK_PaymentID` (`PaymentID`),
  ADD KEY `FK_Currencyid` (`CurrencyID`),
  ADD KEY `FK_BookingLink` (`BookingID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`UserAccountID`),
  ADD UNIQUE KEY `EmailAddress` (`EmailAddress`),
  ADD KEY `FK_title_id` (`TitleID`),
  ADD KEY `FK_address_id` (`AddressID`),
  ADD KEY `FK_International_dial_code_id` (`InternationalDialCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `address_type`
--
ALTER TABLE `address_type`
  MODIFY `AddressTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `aircraft`
--
ALTER TABLE `aircraft`
  MODIFY `AircraftID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `aircraft_seating_zones`
--
ALTER TABLE `aircraft_seating_zones`
  MODIFY `SeatingZoneId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `AirportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `baggage_type`
--
ALTER TABLE `baggage_type`
  MODIFY `BaggageTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `booker`
--
ALTER TABLE `booker`
  MODIFY `BookerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `CurrencyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `flight_route`
--
ALTER TABLE `flight_route`
  MODIFY `FlightRouteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `flight_schedule`
--
ALTER TABLE `flight_schedule`
  MODIFY `FlightScheduleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `intercountry_type`
--
ALTER TABLE `intercountry_type`
  MODIFY `InterCountryTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `international_dial_codes`
--
ALTER TABLE `international_dial_codes`
  MODIFY `InternationalDialCodeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `PassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `passenger_age`
--
ALTER TABLE `passenger_age`
  MODIFY `PassengerAgeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `passenger_baggage`
--
ALTER TABLE `passenger_baggage`
  MODIFY `PassengerBaggageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `passenger_food`
--
ALTER TABLE `passenger_food`
  MODIFY `PassengerFoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `passenger_special_assistance`
--
ALTER TABLE `passenger_special_assistance`
  MODIFY `PassengerSpecialAssistanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `passenger_type`
--
ALTER TABLE `passenger_type`
  MODIFY `PassengerTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `passport`
--
ALTER TABLE `passport`
  MODIFY `PassportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `PaymentTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `revenue`
--
ALTER TABLE `revenue`
  MODIFY `RevenueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `special_assistance_type`
--
ALTER TABLE `special_assistance_type`
  MODIFY `SpecialAssistanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `TitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction_line_items`
--
ALTER TABLE `transaction_line_items`
  MODIFY `TransactionLineItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `UserAccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_AddresstypeID` FOREIGN KEY (`AddressTypeId`) REFERENCES `address_type` (`AddressTypeID`),
  ADD CONSTRAINT `FK_CountryID` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`);

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `FK_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `booker`
--
ALTER TABLE `booker`
  ADD CONSTRAINT `FK_International_dial_code` FOREIGN KEY (`InternationalDialCode`) REFERENCES `international_dial_codes` (`InternationalDialCodeID`),
  ADD CONSTRAINT `FK_address` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `FK_title` FOREIGN KEY (`TitleID`) REFERENCES `title` (`TitleID`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_BookerID` FOREIGN KEY (`BookerID`) REFERENCES `booker` (`BookerID`);

--
-- Constraints for table `flight_route`
--
ALTER TABLE `flight_route`
  ADD CONSTRAINT `FK_AircraftID` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`),
  ADD CONSTRAINT `FK_ArrivalAirportID` FOREIGN KEY (`ArrivalAirportID`) REFERENCES `airport` (`AirportID`),
  ADD CONSTRAINT `FK_DepartureAirportID` FOREIGN KEY (`DepartureAirportID`) REFERENCES `airport` (`AirportID`),
  ADD CONSTRAINT `FK_Intercountry` FOREIGN KEY (`InterCountryTypeID`) REFERENCES `intercountry_type` (`InterCountryTypeID`);

--
-- Constraints for table `flight_schedule`
--
ALTER TABLE `flight_schedule`
  ADD CONSTRAINT `FK_FlightRouteID` FOREIGN KEY (`FlightRouteID`) REFERENCES `flight_route` (`FlightRouteID`);

--
-- Constraints for table `international_dial_codes`
--
ALTER TABLE `international_dial_codes`
  ADD CONSTRAINT `FK_countryIdentity` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`);

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `FK_PassengerAgeID` FOREIGN KEY (`PassengerAgeID`) REFERENCES `passenger_age` (`PassengerAgeId`),
  ADD CONSTRAINT `FK_PassengerTypeID` FOREIGN KEY (`PassengerTypeID`) REFERENCES `passenger_type` (`PassengerTypeID`),
  ADD CONSTRAINT `FK_PassportID` FOREIGN KEY (`PassportID`) REFERENCES `passport` (`PassportID`),
  ADD CONSTRAINT `FK_SeatID` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`),
  ADD CONSTRAINT `FK_TItleID` FOREIGN KEY (`TitleID`) REFERENCES `title` (`TitleID`),
  ADD CONSTRAINT `FK_bookingIdentity` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`);

--
-- Constraints for table `passenger_baggage`
--
ALTER TABLE `passenger_baggage`
  ADD CONSTRAINT `FK_BaggageTypeID` FOREIGN KEY (`BaggageTypeID`) REFERENCES `baggage_type` (`BaggageTypeID`),
  ADD CONSTRAINT `FK_PassID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`);

--
-- Constraints for table `passenger_food`
--
ALTER TABLE `passenger_food`
  ADD CONSTRAINT `FK_FoodID` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`),
  ADD CONSTRAINT `FK_passenID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`);

--
-- Constraints for table `passenger_special_assistance`
--
ALTER TABLE `passenger_special_assistance`
  ADD CONSTRAINT `FK_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  ADD CONSTRAINT `FK_SpecialAssistanceID` FOREIGN KEY (`SpecialAssistanceID`) REFERENCES `special_assistance_type` (`SpecialAssistanceID`);

--
-- Constraints for table `passport`
--
ALTER TABLE `passport`
  ADD CONSTRAINT `FK_Country_id` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_PaymentTypeID` FOREIGN KEY (`PaymentTypeID`) REFERENCES `payment_type` (`PaymentTypeID`),
  ADD CONSTRAINT `FK_currency` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`);

--
-- Constraints for table `revenue`
--
ALTER TABLE `revenue`
  ADD CONSTRAINT `FK_TransLineItemID` FOREIGN KEY (`TransactionLineItemID`) REFERENCES `transaction_line_items` (`TransactionLineItemID`);

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `FK_FlightScheduleID` FOREIGN KEY (`FlightScheduleID`) REFERENCES `flight_schedule` (`FlightScheduleID`),
  ADD CONSTRAINT `FK_SeatingZoneID` FOREIGN KEY (`SeatingZoneID`) REFERENCES `aircraft_seating_zones` (`SeatingZoneId`);

--
-- Constraints for table `transaction_line_items`
--
ALTER TABLE `transaction_line_items`
  ADD CONSTRAINT `FK_BookingLink` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `FK_Currencyid` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_PaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `FK_International_dial_code_id` FOREIGN KEY (`InternationalDialCode`) REFERENCES `international_dial_codes` (`InternationalDialCodeID`),
  ADD CONSTRAINT `FK_address_id` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `FK_title_id` FOREIGN KEY (`TitleID`) REFERENCES `title` (`TitleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
