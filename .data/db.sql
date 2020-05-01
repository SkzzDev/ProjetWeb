-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 01, 2020 at 07:21 PM
-- Server version: 10.4.12-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `type` enum('LAB','THE','TFE') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'THE',
  `teacher` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `name_group` varchar(50) DEFAULT NULL,
  `name_local` varchar(50) DEFAULT NULL,
  `showedCourse` tinyint(1) NOT NULL DEFAULT 1,
  `grade` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `type`, `teacher`, `name_group`, `name_local`, `showedCourse`, `grade`, `id_user`) VALUES
(1, 'Analyse et gestion des données', 'LAB', 'Costa Corinne', '2102', 'LPO1', 1, 'BLOC 1', 219),
(2, 'Anglais technique', 'LAB', 'Randaxhe Veronique', '2102', 'LPO2', 1, 'BLOC 1', 219),
(3, 'Langage et logique de programmation 2', 'LAB', 'Costa Corinne', '2101', 'LPO3', 1, 'BLOC 1', 219),
(4, 'Développement orientés objets java', 'THE', 'Vilvens Claude', '2201', 'PV 2', 1, 'BLOC 1', 219),
(5, 'Comptabilité appliquée et langue', 'THE', 'Giovanizzo Florence', '2101', 'LPO1', 1, 'BLOC 1', 219),
(6, 'Mathématiques appliquées au traitement d\'images', 'THE', 'Collinet Didier', '2203', 'LPO3', 1, 'BLOC 1', 219),
(7, 'Présentation de stage et TFE par les étudiants de 3ème année', 'TFE', 'Vilvens Claude', '2301', 'PV 1', 1, 'BLOC 1', 219),
(8, 'Programmation Web', 'LAB', 'Thiernnesse Cédric', '2202', 'PV 4', 1, 'BLOC 1', 219);

-- --------------------------------------------------------

--
-- Table structure for table `courses_programmation`
--

CREATE TABLE `courses_programmation` (
  `id_course` int(11) NOT NULL,
  `day` enum('1','2','3','4','5') NOT NULL,
  `startHour` time NOT NULL,
  `endHour` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses_programmation`
--

INSERT INTO `courses_programmation` (`id_course`, `day`, `startHour`, `endHour`) VALUES
(1, '1', '08:50:00', '10:30:00'),
(2, '1', '09:20:00', '10:20:00'),
(3, '1', '08:20:00', '10:20:00'),
(4, '1', '08:20:00', '10:20:00'),
(5, '1', '10:30:00', '13:30:00'),
(6, '1', '10:30:00', '12:30:00'),
(7, '1', '10:30:00', '12:00:00'),
(8, '1', '15:30:00', '17:00:00'),
(3, '1', '13:30:00', '15:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `courses_sections`
--

CREATE TABLE `courses_sections` (
  `id_course` int(11) NOT NULL,
  `id_section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses_sections`
--

INSERT INTO `courses_sections` (`id_course`, `id_section`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `establishments`
--

CREATE TABLE `establishments` (
  `id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `postcode` int(11) NOT NULL,
  `locality` varchar(26) NOT NULL,
  `street` varchar(30) NOT NULL,
  `streetNumber` varchar(7) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(14) DEFAULT NULL,
  `email` varchar(57) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `establishments`
--

INSERT INTO `establishments` (`id`, `name`, `postcode`, `locality`, `street`, `streetNumber`, `phone`, `fax`, `email`) VALUES
(1, 'Academie \"Jean Absil\" musique, danse et arts de la parole', 1040, 'ETTERBEEK', 'Rue Fetis', '29', '02-647 19 57', '02-644 53 98', NULL),
(2, 'Academie \"Julien Gerstmans\" de Hannut', 4280, 'HANNUT', 'Rue des Combattants', '1', '019-51 14 83', '019-51 14 83', 'jeanpayon@compuserve.com'),
(3, 'Academie \"Marcel Desiron\" à Amay', 4540, 'AMAY', 'Chaussee Freddy Terwagne', '26', '085/312011', '085/312199', 'academie.desiron@skynet.be'),
(4, 'Academie \"Rene Defossez\" à Spa', 4900, 'SPA', 'Rue Xhrouet', '29', '087-77 17 69', '087-22 96 56', 'secretariat@academiedespa.be'),
(5, 'Academie \"V. de Becker\" musique-theâtre-danse', 5030, 'GEMBLOUX', 'Rue Gustave Docq', '32', '081-62 63 96', '081-62 63 76', NULL),
(6, 'Academie Albert Gossiaux de Marcinelle', 6001, 'MARCINELLE', 'Rue Aurelien Thibaut', '20', '071-36 13 80', NULL, NULL),
(7, 'Academie Andre Souris de Marchienne-au-Pont', 6030, 'MARCHIENNE-AU-PONT', 'Rue de Chatelet', '28', '071-51 84 67', '071-51 52 83', 'aca.marchienne@brutele.be'),
(8, 'Academie communale de musique \"Amelie Dengis\"', 4100, 'SERAING', 'Rue Deleval', '9', '04-336 27 97', '04-336 84 66', NULL),
(9, 'Academie communale de musique \"G.-H. Luytgaerens\"', 1090, 'JETTE', 'Rue du Saule', '1', '02-426 35 56', '02-427 60 72', NULL),
(10, 'Academie communale de musique - danse - arts de la parole de Bastogne', 6600, 'BASTOGNE', 'Rue des Remparts', '45', '061-21 25 01', '061-21 82 39', 'th.chleide@skynet.be'),
(11, 'Academie communale de musique de Morlanwelz', 7140, 'MORLANWELZ-MARIEMONT', 'Place Franklin Roosevelt', '18-20', '064/431 666', '064/431 667', NULL),
(12, 'Academie de Chênee', 4032, 'CHENEE', 'Rue de l\'Eglise', '3', '04-365 12 14', '04-365 12 14', 'info@academiedechenee.be'),
(13, 'Academie de Couillet', 6010, 'COUILLET', 'Route de Philippeville', '304', '071-36 33 72', '071-36 33 72', NULL),
(14, 'Academie de Dessin et des Arts decoratifs \"Gustave Camus\" de Châtelet', 6200, 'CHATELET', 'Place Jean Guyot', '29 / 31', '071-39 53 92', '071-39 53 92', NULL),
(15, 'Academie de dessin et des arts visuels de Molenbeek-Saint-Jean', 1080, 'MOLENBEEK-SAINT-JEAN', 'Rue Mommaerts', NULL, '02-411 79 92', '02-414 82 43', 'academie.molenbeek@euronet.be'),
(16, 'Academie de Gosselies', 6041, 'GOSSELIES', 'Rue Saint-Roch', '81', '071-35 57 03', '071-35 57 03', NULL),
(17, 'Academie de Jumet-Lodelinsart', 6040, 'JUMET', 'Rue Surlet', '35', '071-37 51 33', NULL, 'aca.jumetlodelinsart@charleroi.be'),
(18, 'Academie de Mont-Sur-Marchienne', 6032, 'MONT-SUR-MARCHIENNE', 'Rue Adolphe Max', '13', '071-43 07 81', '071-43 07 81', NULL),
(19, 'Academie de Montignies-sur-Sambre', 6061, 'MONTIGNIES-SUR-SAMBRE', 'Rue FranÃ§ois Reconnu', NULL, '071-33 11 56', '071-33 11 56', NULL),
(20, 'Academie de musique \"Arthur De Greef\" de Saint-Gilles', 1060, 'SAINT-GILLES', 'Rue de NeufchÃ¢tel', '16', '02-538 64 50', '02-539 45 73', 'acadegreef@gmail.com'),
(21, 'Academie de musique \"Cesar Franck\" à Vise', 4600, 'VISE', 'Rue de la Chinstree', '2A', '04-379 38 25', '04-379 84 69', NULL),
(22, 'Academie de musique \"La Chantrerie\"', 7060, 'SOIGNIES', 'Rue Ferrer', '8', '067-34 16 07', '067-34 51 08', NULL),
(23, 'Academie de musique \"Yolande Uyttenhove\" de Braine-l\'Alleud', 1420, 'BRAINE-L\'ALLEUD', 'Rue du ChÃ¢teau', '49', '02/854.07.20/21', NULL, NULL),
(24, 'Academie de musique d\'Anderlecht', 1070, 'ANDERLECHT', 'Rue de la Procession', '78', '02/5213731', '02/5205298', NULL),
(25, 'Academie de musique d\'Arlon', 6700, 'ARLON', 'Place des Chasseurs Ardennais', '10', '063/22 76 97', '063/23 30 99', NULL),
(26, 'Academie de musique d\'Ath', 7800, 'ATH', 'Rue de Pintamont', '55', '068/841437', '068/841438', 'academie.de.musique@ath.be'),
(27, 'Academie de musique d\'Enghien', 7850, 'ENGHIEN', 'Rue des Ecoles', '30', '02-395 59 62', NULL, 'academie.musique@enghien-edingen.be'),
(28, 'Academie de musique d\'Evere', 1140, 'EVERE', 'Rue Edouard Stuckens', '125', '02-216 89 33', '02-215 45 69', 'academie.evere@skynet.be'),
(29, 'Academie de musique d\'Ixelles', 1050, 'IXELLES', 'Avenue des Eperons d\'Or', '16', '02-515 78 31', '02-515 78 35', 'academie.musique@ixelles.brussels'),
(30, 'Academie de musique d\'Uccle', 1180, 'UCCLE', 'Rue du Doyenne', '60', '02-343 30 63', '02-343 95 67', 'directeur@aca-uccle.be'),
(31, 'Academie de musique de Baudour', 7331, 'BAUDOUR', 'Parc Communal de Baudour', NULL, '065-64 49 39', '065-78 09 79', NULL),
(32, 'Academie de musique de Beloeil', 7972, 'QUEVAUCAMPS', 'Rue Paul Pastur', '33', '069-56 13 75', '069-56 13 75', 'academie@beloeil.be'),
(33, 'Academie de musique de Bertrix', 6880, 'BERTRIX', 'Rue de la Retraite', '15', '061-41 53 92', '061-41 53 93', 'acabertrix@belgacom.net'),
(34, 'Academie de musique de Bouillon', 6830, 'BOUILLON', 'Rue des Bastions', '4', '061-46 75 22', '061-46 80 92', 'academie.bouillon@skynet.be'),
(35, 'Academie de musique de Braine-le-Comte', 7090, 'BRAINE-LE-COMTE', 'Rue Britannique', '17', '067-89 54 17', '067-55 26 35', NULL),
(36, 'Academie de musique de Colfontaine', 7340, 'WASMES', 'Rue du General Leman', '4', '065-67 12 57', '065-67 12 57', NULL),
(37, 'Academie de musique de Courcelles - Ecole du Trieu', 6180, 'COURCELLES', 'Rue Hubert Bayet', '10', '071-46 63 57', '071-46 63 57', 'academie@courcelles.eu'),
(38, 'Academie de musique de Farciennes', 6240, 'FARCIENNES', 'Grand\'Place', '2', '071-39 58 67', '071-39 58 67', NULL),
(39, 'Academie de musique de Fontaine-l\'evÃªque', 6140, 'FONTAINE-L\'EVEQUE', 'Boulevard du Nord', '16', '071-54 16 01', '071-52 40 63', NULL),
(40, 'Academie de musique de Grez-Doiceau', 1390, 'GREZ-DOICEAU', 'Chaussee de la Liberation', '30', '010-84 00 83', '010-84 00 83', NULL),
(41, 'Academie de musique de La Bouverie', 7080, 'LA BOUVERIE', 'Rue Cure Malengreau', '10', '065-67 10 26', '065-67 10 26', NULL),
(42, 'Academie de musique de la Hulpe', 1310, 'LA HULPE', 'Rue des Combattants', '3', '02-654 12 83', '02-654 12 83', 'lahulpe.academie@skynet.be'),
(43, 'Academie de musique de Malmedy', 4960, 'MALMEDY', 'Ruelle des Capucins', '2', '080-33 89 25', '080-77 16 07', NULL),
(44, 'Academie de musique de Mons', 7000, 'MONS', 'Rue des Cinq Visages', '6', '065-35 37 07', '065-35 37 07', 'annik.bertin@gmail.com'),
(45, 'Academie de musique de Montigny-Le-Tilleul Paulin Marchand', 6110, 'MONTIGNY-LE-TILLEUL', 'Rue Wilmet', '19', '071-56 09 59', '071-56 02 24', NULL),
(46, 'Academie de musique de Peruwelz', 7600, 'PERUWELZ', 'Boulevard Leopold III', '38', '069-77 23 54', '069-77 23 54', NULL),
(47, 'Academie de musique de Quaregnon', 7390, 'QUAREGNON', 'Rue de l\'Egalite', '102', '065-79 37 39', NULL, NULL),
(48, 'Academie de musique de Saint-Ghislain', 7330, 'SAINT-GHISLAIN', 'Venelle Saint-Georges', '1', '065-79 17 28', '065-79 17 28', NULL),
(49, 'Academie de musique de Saint-Hubert', 6870, 'SAINT-HUBERT', 'Rue du Parc', '14', '061-61 22 44', '061-61 22 06', NULL),
(50, 'Academie de musique de Saint-Josse-Ten-Noode - Schaerbeek', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Place Quetelet', '3', '02-219 23 80', '02-219 23 80', 'acad.sjtn@sec.cfwb.be'),
(51, 'Academie de musique de Waremme', 4300, 'WAREMME', 'Rue Charles Lejeune', '4', '019-32 77 50', '019-33 02 23', NULL),
(52, 'Academie de musique de Waterloo', 1410, 'WATERLOO', 'Chaussee de Bruxelles', '267', '02-351 09 77', '02-354 72 02', 'aca-waterloo@tiscalinet.be'),
(53, 'Academie de musique de Watermael-Boitsfort', 1170, 'WATERMAEL-BOITSFORT', 'Rue FranÃ§ois Ruytinx', '31', '02-673 76 97', '02-672 56 66', NULL),
(54, 'Academie de musique de Wavre', 1300, 'WAVRE', 'Avenue des Deportes', '69', '010-22 28 06', '010-22 28 06', NULL),
(55, 'Academie de musique de Welkenraedt', 4840, 'WELKENRAEDT', 'Rue Leonard Brecht', '1', '087-89 80 11', '087-88 11 27', NULL),
(56, 'Academie de musique de Woluwe-Saint-Lambert', 1200, 'WOLUWE-SAINT-LAMBERT', 'Avenue des Deux Tilleuls', '2A', '02-739 30 70', '02-739 30 72', 'academie@1200.be'),
(57, 'Academie de musique de Woluwe-Saint-Pierre', 1150, 'WOLUWE-SAINT-PIERRE', 'Avenue Charles Thielemans', '30', '02-773 06 42', '02-773 18 11', 'academie.musique@woluwe1150.irisnet.be'),
(58, 'Academie de musique et de danse de la Botte du Hainaut', 6470, 'RANCE', 'Grand Rue', '51A', '060-41 23 57', '060-41 28 24', 'academiebh@ecoles.cfwb.be'),
(59, 'Academie de musique et des arts de la parole \"Franz Constant\"', 1160, 'AUDERGHEM', 'Rue des Ecoliers', '7', '02/6735498', '02/6735017', 'info@academie-auderghem.be'),
(60, 'Academie de musique et des arts de la parole \"Rene Louthe\"', 7110, 'HOUDENG-AIMERIES', 'Rue EugÃ¨ne Valentin', '22', '064-22 84 76', '064-22 84 76', 'ear1@llenseignement.org'),
(61, 'Academie de musique et des arts de la parole de Molenbeek-Saint-Jean', 1080, 'MOLENBEEK-SAINT-JEAN', 'Rue Kindergeluk', '1', '02-415 96 25', '02-415 96 25', NULL),
(62, 'Academie de musique et des arts parles de Fleurus', 6220, 'FLEURUS', 'Rue Joseph LefÃ¨bvre', '74', '071-82 04 20', '071-82 04 20', NULL),
(63, 'Academie de musique Gretry', 4020, 'LIEGE', 'Bld de la Constitution', '81', '04-342 61 60', '04-342 03 06', 'rossius@be.packardbell.org'),
(64, 'Academie de musique instrumentale de Schaerbeek', 1030, 'SCHAERBEEK', 'Avenue Ernest Renan', '12', '02-241 27 26', '02-216 39 18', NULL),
(65, 'Academie de musique Saint-Gregoire', 7500, 'TOURNAI', 'Rue des Jesuites', '28', '069-22 41 33', NULL, NULL),
(66, 'Academie de musique, arts de la parole et danse de Rixensart', 1330, 'RIXENSART', 'Rue Albert Croy', '2', '02-652 00 09', '02-652 10 30', 'academierix@tiscalinet.be'),
(67, 'Academie de musique, arts parles et danse de Tubize', 1480, 'TUBIZE', 'Rue de Stimbert', '21', '02-355 40 00', '02-391 39 12', NULL),
(68, 'Academie de musique, arts parles, danse à Thuin', 6530, 'THUIN', 'Clos de l\'Harmonie', '7', '071-59 52 05', '071-59 52 05', NULL),
(69, 'Academie de musique, danse et arts de la parole de Jodoigne', 1370, 'JODOIGNE', 'Pl Dr Edouard Lodewijckx', '19', '010-81 15 01', '010-81 15 01', NULL),
(70, 'Academie de musique, danse et arts parles de Gilly', 6060, 'GILLY', 'Chaussee Imperiale', '75', '071-41 32 47', '071-41 32 47', NULL),
(71, 'Academie de musique, de danse et des arts de la parole de Nivelles', 1400, 'NIVELLES', 'avenue Albert et Elisabeth', '10', '067-21 62 46', '067-34 25 60', NULL),
(72, 'Academie de musique, de la danse et des arts de la parole de Berchem-Sainte-Agathe', 1082, 'BERCHEM-SAINTE-AGATHE', 'Place du Roi Baudouin', '1', '02-468 02 36', NULL, NULL),
(73, 'Academie de musique, theâtre, danse et beaux-arts de Mouscron', 7700, 'MOUSCRON', 'Rue des Brasseurs', '1B', '056-86 01 90', '056-86 01 94', NULL),
(74, 'Academie de musique,de danse et des arts parles de FOREST', 1190, 'FOREST', 'Rue Timmermans', '53-55', '02-343 70 40', '02-343 70 40', 'info@acaforest.be'),
(75, 'Academie de Ransart', 6043, 'RANSART', 'Rue Paul Pastur', '62', '071-34 08 65', NULL, NULL),
(76, 'Academie des Arts de la Ville de Bruxelles', 1020, 'LAEKEN', 'Rue Claessens ( www.acabxl.eu)', '10', '02-422 03 30', '02-422 03 38', 'sec.arts@brucity.education'),
(77, 'Academie des Arts de Woluwe-Saint-Pierre', 1150, 'WOLUWE-SAINT-PIERRE', 'Avenue Charles Thielemans', '30', '02-773 06 44', '02-773 06 44', 'academie.arts@woluwe1150.irisnet.be'),
(78, 'Academie des Arts et Metiers \"Constantin Meunier\"', 1040, 'ETTERBEEK', 'Rue General Tombeur', '78', '02-735 37 43', '02-733 54 53', 'academie.desarts@chello.be'),
(79, 'Academie des Beaux-Arts \"Jean-Jacques Gailliard\" de Saint-Gilles', 1060, 'SAINT-GILLES', 'Rue HÃ´tel des Monnaies', '108-110', '02-538 12 70', '02-534 48 22', 'aca.beaux.arts.stgilles@gmail.com'),
(80, 'Academie des Beaux-Arts Alphonse Darville', 6000, 'CHARLEROI', 'Rue Dourlet', '26', '071-41 75 11', NULL, 'acabacharleroi@gmail.com'),
(81, 'Academie des Beaux-Arts d\'Arlon', 6700, 'ARLON', 'Rue Godefroid Kurth', '2', '063/217953', '063/226125', 'beaux.arts.arlon@belgacom.net'),
(82, 'Academie des Beaux-Arts de la Ville de Tournai', 7500, 'TOURNAI', 'Rue de l\'HÃ´pital Notre-Dame', '14', '+32 69 84 12 63', NULL, 'academie@skynet.be'),
(83, 'Academie des Beaux-Arts de Namur', 5000, 'NAMUR', 'Rue du Lombard', '20', '081-25 51 53', '081-25 51 55', 'Academie.beaux-arts@namur.be'),
(84, 'Academie des Beaux-Arts de Saint-Josse-Ten-Noode', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Rue PotagÃ¨re', '52', '02-220 27 61', NULL, NULL),
(85, 'Academie des Beaux-Arts de Sambreville', 5060, 'TAMINES', 'Place du Jumelage', '1', '071-77 47 47', '071-77 47 47', 'beauxarts.tamines@sambreville.be'),
(86, 'Academie des Beaux-Arts de Verviers', 4800, 'VERVIERS', 'Place du Palais de Justice', '15', '087-22 45 42', '087-22 45 42', NULL),
(87, 'Academie des Beaux-Arts de Watermael-Boitsfort', 1170, 'WATERMAEL-BOITSFORT', 'Place Andree Payfa-Fosseprez', '10', '02-673 76 92', NULL, 'pierrefromont@hotmail.com'),
(88, 'Academie des Beaux-Arts et des arts decoratifs de Binche', 7130, 'BINCHE', 'Rue aux Mourdreux', '27', '064-36 78 83', '064-36 78 83', NULL),
(89, 'Academie des Beaux-Arts et des Arts decoratifs de Tournai', 7500, 'TOURNAI', 'Rue de l\'HÃ´pital Notre-Dame', '13', '069-21 31 59', NULL, NULL),
(90, 'Academie intercommunale de musique, danse et arts de la parole de Court-Saint-Etienne et Ottignies - Louvain-la-Neuve', 1490, 'COURT-SAINT-ETIENNE', 'Rue des Ecoles', '32', '010-61 42 36', '010-61 57 63', 'academie.cseo@swing.be'),
(91, 'Academie Jean Charlier de Monceau-sur-Sambre', 6031, 'MONCEAU-SUR-SAMBRE', 'Rue des Combattants', '64', '071-30 62 94', '071-30 62 94', NULL),
(92, 'Academie musicale et artistique de Saint-Nicolas', 4420, 'MONTEGNEE', 'Rue des Botresses', '2', '04-247 80 80', '04-247 80 81', NULL),
(93, 'Academie Ourthe-Vesdre-Amblève', 4920, 'SOUGNE-REMOUCHAMPS', 'Rue Marsale', '10', '04-384 60 11', '04-384 75 49', NULL),
(94, 'ACADEMIE PROVINCIALE DES METIERS', 7000, 'MONS', 'Bld President Kennedy', '10', '065-39 89 79', '065-39 89 78', 'martine.savonet@hainaut.be   helena.zaimniotis@hainaut.be'),
(95, 'ACADEMIE ROYALE DES BEAUX-ARTS DE BRUXELLES', 1000, 'BRUXELLES', 'Rue du PoinÃ§on', '28', '02-274 05 90', '02-274 06 08', 'arbasecondaire@brucity.education'),
(96, 'Academie royale des Beaux-Arts de la Ville de Bruxelles - ecole superieure des Arts', 1000, 'BRUXELLES', 'Rue du Midi', '144', '+32 2 506 10 10', NULL, 'info@arba-esa.be'),
(97, 'Academie royale des Beaux-Arts de Liège', 4000, 'LIEGE', 'Rue des Anglais', '21', '04-221 70 77', '04-221 70 76', 'ps.academie@swing.be'),
(98, 'Ados Pilifs - Enseignement secondaire specialise libre', 1120, 'NEDER-OVER-HEEMBEEK', 'Rue de Heembeek', '127', '02/420.32.23', NULL, NULL),
(99, 'Arts²', 7000, 'MONS', 'Rue de Nimy', '7', '+32 65 47 52 00', NULL, NULL),
(100, 'Ateliers Saint-Luc', 1060, 'SAINT-GILLES', 'Rue d\'Irlande', '57', '02-537 36 45', NULL, 'st.luc.bx@skynet.be'),
(101, 'ATHENEE ADOLPHE MAX', 1000, 'BRUXELLES', 'Boulevard Clovis', '40', '02-740 24 60', '02-740 24 88', 'admax@brucity.education'),
(102, 'ATHENEE COMMUNAL CHARLES JANSSENS', 1050, 'IXELLES', 'Place de Londres', '5', '02-515 75 64', '02-515 75 56', NULL),
(103, 'ATHENEE COMMUNAL FERNAND BLUM', 1030, 'SCHAERBEEK', 'Avenue Ernest Renan', '12', '02-243 17 80', '02-243 17 86', 'afbrenan@gmail.com'),
(104, 'ATHENEE COMMUNAL LEONIE DE WAHA', 4000, 'LIEGE', 'Boulevard d\'Avroy', '96', '04-222 34 26', '04-222 23 56', NULL),
(105, 'ATHENEE COMMUNAL MAURICE DESTENAY', 4020, 'LIEGE', 'Boulevard Saucy', '16', '04-343 04 28', '04-343 02 73', NULL),
(106, 'ATHENEE DES PAGODES', 1120, 'NEDER-OVER-HEEMBEEK', 'Rue de Beyseghem', '141', '02-266 11 50', '02-266 11 68', 'sec.pagodes@brucity.education'),
(107, 'ATHENEE EMILE BOCKSTAEL', 1020, 'LAEKEN', 'Rue Reper-Vreven', '80', '02-475 73 00', '02-478 87 40', 'sec.bockstael@brucity.education'),
(108, 'ATHENEE GANENOU', 1180, 'UCCLE', 'Rue du Melkriek', '3', '02-376 11 76', '02-332 11 00', 'athenee.ganenou@sec.cfwb.be'),
(109, 'ATHENEE JOSEPH BRACOPS', 1070, 'ANDERLECHT', 'Rue de la Procession', '78', '02-431 94 01', '02-527 10 89', NULL),
(110, 'ATHENEE LEON LEPAGE', 1000, 'BRUXELLES', 'Rue des Riches Claires', '30', '02-548 27 10', '02-548 27 38', 'sec.lepage@brucity.education'),
(111, 'ATHENEE MARGUERITE YOURCENAR', 1020, 'LAEKEN', 'Rue Claessens', '10', '02-421 42 40', NULL, 'sec.yourcenar@brucity.education'),
(112, 'ATHENEE PROVINCIAL', 7100, 'LA LOUVIERE', 'Boulevard du Tivoli', '2B', '064-22 65 49', '064-22 67 42', NULL),
(113, 'ATHENEE PROVINCIAL DE FLEMALLE GUY LANG', 4400, 'FLEMALLE', 'Grand\'Route', '317', '04-234 93 00', '04-233 25 56', NULL),
(114, 'ATHENEE PROVINCIAL JEAN D\'AVESNES', 7000, 'MONS', 'Av du Gouverneur E. Cornez', '1', '065-40 01 01', '065-40 01 02', 'apja.mons@hainaut.be'),
(115, 'ATHENEE PROVINCIAL WAROCQUE', 7140, 'MORLANWELZ-MARIEMONT', 'Rue de l\'Enseignement', '8-10', '064-43 20 30', '064-43 20 47', NULL),
(116, 'ATHENEE ROBERT CATTEAU', 1000, 'BRUXELLES', 'Rue Ernest Allard', '49', '02-500 72 30', '02-500 72 49', 'sec.catteau@brucity.education'),
(117, 'ATHENEE ROYAL \"AIR PUR\"', 4100, 'SERAING', 'Rue des Nations-Unies', '1', '04-330 32 30', '04-330 32 35', 'secretariat@athenee-airpur.be'),
(118, 'ATHENEE ROYAL \"JEAN ROSTAND\" DE PHILIPPEVILLE', 5600, 'PHILIPPEVILLE', 'Avenue de Samart', '2B', '071-66 69 57', '071-66 60 43', NULL),
(119, 'ATHENEE ROYAL AGRI-SAINT-GEORGES', 4500, 'HUY', 'Rue Saint-Victor', '5', '085-21 67 70', '085-25 07 54', 'itcf.huy@sec.cfwb.be'),
(120, 'ATHENEE ROYAL ALFRED VERWEE', 1030, 'SCHAERBEEK', 'Rue Verwee', '12', '02-244 91 91', '02-244 91 82', 'prefet@averwee.be'),
(121, 'ATHENEE ROYAL ANDREE THOMAS', 1190, 'FOREST', 'Avenue Reine Marie-Henriette', '47', '02-344 69 77', '02-344 05 29', NULL),
(122, 'ATHENEE ROYAL ARDENNE - HAUTES FAGNES', 4960, 'MALMEDY', 'Route de Falize', '21', '080-79 11 22', '080-79 11 24', 'mirianne.jurion@sec.cfwb.be'),
(123, 'ATHENEE ROYAL ARLON', 6700, 'ARLON', 'Rue de Sesselich', '83', '063-24 50 20', '063-23 31 86', NULL),
(124, 'ATHENEE ROYAL ATH', 7800, 'ATH', 'Rue des Recollets', '9', '068-26 90 00', '068-26 90 09', 'secretara@live.be'),
(125, 'ATHENEE ROYAL ATHUS', 6791, 'ATHUS', 'Rue Neuve', '32', '063-38 02 70', '063-38 02 82', NULL),
(126, 'ATHENEE ROYAL AYWAILLE', 4920, 'AYWAILLE', 'Avenue FranÃ§ois Cornesse', '48', '04-384 42 45', '04-384 64 01', 'ar.aywaille@sec.cfwb.be'),
(127, 'ATHENEE ROYAL BAUDOUIN I ER', 5190, 'JEMEPPE-SUR-SAMBRE', 'Rue FranÃ§ois Hittelet', '89', '071-75 00 91', '071-75 00 98', 'arbaudouin.jemeppe@skynet.be'),
(128, 'ATHENEE ROYAL CROMMELYNCK', 1150, 'WOLUWE-SAINT-PIERRE', 'Avenue Orban', '73', '02-770 06 20', '02-763 01 50', NULL),
(129, 'ATHENEE ROYAL D\'ANS', 4432, 'ALLEUR', 'Rue Georges Truffaut', '37', '04-246 76 00', '04-246 76 06', 'direction@.ar-alleur.be'),
(130, 'ATHENEE ROYAL D\'AUDERGHEM', 1160, 'AUDERGHEM', 'Avenue du Parc de Woluwe', '25-27', '02-663 17 02', '02-675 47 29', 'secretariat@arauderghem.be'),
(131, 'ATHENEE ROYAL D\'ENGHIEN', 7850, 'ENGHIEN', 'Rue Montgomery', '73', '02-395 38 49', '02-395 35 73', 'ar.enghien@sec.cfwb.be'),
(132, 'ATHENEE ROYAL D\'ESNEUX', 4130, 'ESNEUX', 'Rue de l\'Athenee', '6', '04-380 16 96', '04-380 07 29', NULL),
(133, 'ATHENEE ROYAL D\'EVERE', 1140, 'EVERE', 'Avenue Constant Permeke', '2', '02-701 97 11', '02-701 97 22', NULL),
(134, 'ATHENEE ROYAL D\'IXELLES', 1050, 'IXELLES', 'Rue de la Croix', '40', '02-626 96 30', '02-626 96 01', 'info@arixelles.be'),
(135, 'ATHENEE ROYAL D\'OUFFET', 4590, 'OUFFET', 'Rue Mognee', '21', '086-36 62 77', '086-36 61 81', NULL),
(136, 'ATHENEE ROYAL D\'UCCLE I', 1180, 'UCCLE', 'Avenue Houzeau', '87', '02-374 05 84', '02-375 28 91', 'secretariat.aru1@ens.irisnet.be'),
(137, 'ATHENEE ROYAL D\'UCCLE II', 1180, 'UCCLE', 'Avenue des Tilleuls', '24', '02-374 37 91', '02-374 23 11', 'info@aru2.be'),
(138, 'ATHENEE ROYAL DE BASTOGNE - HOUFFALIZE', 6600, 'BASTOGNE', 'Avenue de la Gare', '12', '061-68 02 04', '061-68 02 02', NULL),
(139, 'ATHENEE ROYAL DE BINCHE', 7130, 'BINCHE', 'Place des Droits de l\'Homme', '16', '064-31 16 00', '064-31 16 01', NULL),
(140, 'ATHENEE ROYAL DE BOUILLON - PALISEUL', 6830, 'BOUILLON', 'Rue du CollÃ¨ge', '35', '061-46 72 92', '061-46 86 23', 'etienne.micha@sec.cfwb.be'),
(141, 'ATHENEE ROYAL DE BRUXELLES II', 1020, 'LAEKEN', 'Rue Marie-Christine', '37', '02-425 14 00', '02-420 41 23', NULL),
(142, 'ATHENEE ROYAL DE CHENEE', 4032, 'CHENEE', 'Rue Bourdon', '32', '04-365 44 29', '04-367 41 59', NULL),
(143, 'ATHENEE ROYAL DE CHIMAY', 6460, 'CHIMAY', 'Rue de Noailles', '3', '060-41 41 00', '060-21 18 84', 'ar.chimay@sec.cfwb.be'),
(144, 'ATHENEE ROYAL DE GANSHOREN', 1083, 'GANSHOREN', 'Rue Auguste De Cock', '1', '02-426 83 00', '02-420 28 86', NULL),
(145, 'ATHENEE ROYAL DE HERSTAL', 4040, 'HERSTAL', 'Rue Jean Lambert Sauveur', '59', '04-264 45 48', '04-264 66 23', NULL),
(146, 'ATHENEE ROYAL DE HUY', 4500, 'HUY', 'Quai d\'Arona', '5', '085-27 13 50', '085-24 01 26', 'alloo_delatte@yahoo.fr'),
(147, 'ATHENEE ROYAL DE JAMBES', 5100, 'JAMBES', 'Rue de Geronsart', '150', '081-33 16 20', '081-33 16 21', 'arjdirection@gmail.com'),
(148, 'ATHENEE ROYAL DE JETTE', 1090, 'JETTE', 'Avenue de Levis Mirepoix', '100', '02-426 05 29', '02-428 13 88', NULL),
(149, 'ATHENEE ROYAL DE KOEKELBERG', 1081, 'KOEKELBERG', 'Rue Omer Lepreux', '15', '02-414 77 28', '02-411 05 03', 'cdemunck.2022@ens.irisnet.be'),
(150, 'ATHENEE ROYAL DE LA RIVE GAUCHE', 1020, 'LAEKEN', 'Rue Marie-Christine', '83', '02-427 97 67', '02-427 05 77', NULL),
(151, 'ATHENEE ROYAL DE LA ROCHE-EN-ARDENNE', 6980, 'LA ROCHE-EN-ARDENNE', 'Rue des EvÃªts', '4', '084-41 12 62', '084-41 15 92', NULL),
(152, 'ATHENEE ROYAL DE NAMUR', 5000, 'NAMUR', 'Rue du CollÃ¨ge', '8', '081-22 30 35', '081-22 16 50', NULL),
(153, 'ATHENEE ROYAL DE NEUFCHATEAU - BERTRIX', 6840, 'NEUFCHATEAU', 'Avenue de la Victoire', '28', '061-27 72 02', '061-27 98 26', 'ar.neufchateau-bertrix@sec.cfwb.be'),
(154, 'ATHENEE ROYAL DE QUIEVRAIN', 7380, 'QUIEVRAIN', 'Rue Debast', '26', '065-45 70 81', '065-43 13 89', NULL),
(155, 'ATHENEE ROYAL DE WATERLOO', 1410, 'WATERLOO', 'Rue de la Station', '118', '02-354 92 76', '02-354 99 56', 'arwaterloo@skynet.be'),
(156, 'ATHENEE ROYAL DE WELKENRAEDT', 4840, 'WELKENRAEDT', 'Rue Gerard Delvoye', '2', '087-88 02 30', '087-88 32 30', NULL),
(157, 'Athenee royal Dinant-Herbuchenne', 5500, 'DINANT', 'Chemin d\'Herbuchenne', '1', '082-22 25 65', '082-22 52 81', 'direction@ardh.be'),
(158, 'ATHENEE ROYAL DOUR', 7370, 'DOUR', 'Rue de l\'Athenee', '23', '065-71 87 87', '065-63 33 50', NULL),
(159, 'ATHENEE ROYAL DU CONDROZ JULES DELOT', 5590, 'CINEY', 'Square Omer Bertrand', '1', '083-21 15 12', '083-21 29 30', 'direction.arciney@skynet.be'),
(160, 'ATHENEE ROYAL DU SIPPELBERG', 1080, 'MOLENBEEK-SAINT-JEAN', 'Avenue du Sippelberg', '2', '02-414 35 75', '02-414 46 23', NULL),
(161, 'ATHENEE ROYAL ERNEST SOLVAY', 6000, 'CHARLEROI', 'Boulevard Emile Devreux', '27', '071-20 27 00', '071-70 16 34', NULL),
(162, 'ATHENEE ROYAL ET ECOLE D\'HOTELLERIE DE SPA', 4900, 'SPA', 'Rue des Capucins', '8', '087-79 54 80', '087-77 37 80', NULL),
(163, 'ATHENEE ROYAL FERNAND JACQUEMIN', 7780, 'COMINES-WARNETON', 'Chaussee de Warneton', '26', '056-56 11 40', '056-55 72 44', NULL),
(164, 'ATHENEE ROYAL FLORENNES', 5620, 'FLORENNES', 'Rue des Ecoles', '21', '071-68 83 23', '071-68 96 81', 'arf.florennes@swing.be'),
(165, 'ATHENEE ROYAL FRAGNEE', 4000, 'LIEGE', 'Rue de Fragnee', '73', '04-229 67 50', '04-254 16 33', 'prefet.arf@gmail.com'),
(166, 'ATHENEE ROYAL GATTI DE GAMOND', 1000, 'BRUXELLES', 'Rue du Marais', '65', '02-2140180', '02-2140198', NULL),
(167, 'ATHENEE ROYAL GEMBLOUX', 5030, 'GEMBLOUX', 'Rue Gustave Docq', '26', '081-61 14 13', '081-61 07 95', 'info@atheneegembloux.be'),
(168, 'ATHENEE ROYAL GERMAIN ET GILBERT GILSON', 6810, 'IZEL', 'Rue de l\'Institut', '47', '061-31 24 55', '061-31 24 84', NULL),
(169, 'ATHENEE ROYAL GILLY', 6060, 'GILLY', 'Rue du Calvaire', '20', '071-41 42 98', '071-41 41 20', 'ar.gilly@sec.cfwb.be'),
(170, 'ATHENEE ROYAL HANNUT', 4280, 'HANNUT', 'Rue de Tirlemont', '22', '019-63 03 40', '019-51 17 39', 'sabine.haot@sec.cfwb.be'),
(171, 'ATHENEE ROYAL JEAN ABSIL', 1040, 'ETTERBEEK', 'Avenue Hansen-Soulie', '27', '02-736 59 76', '02-736 04 15', 'ar.absil.etterbeek@sec.cfwb.be'),
(172, 'ATHENEE ROYAL JEAN REY', 5660, 'COUVIN', 'La Croisette', '1', '060-34 46 74', '060-34 55 50', NULL),
(173, 'ATHENEE ROYAL JEAN TOUSSEUL', 5300, 'ANDENNE', 'Rue Adeline Henin', '4', '085-27 87 70', '085-84 49 25', 'info@arandenne.be'),
(174, 'ATHENEE ROYAL JODOIGNE', 1370, 'JODOIGNE', 'Chaussee de Hannut', '61', '010-81 35 26', '010-81 44 67', 'secretariatdirection@arjodoigne.be'),
(175, 'ATHENEE ROYAL JOURDAN', 6220, 'FLEURUS', 'Rue de Fleurjoux', '3', '071-81 37 77', '071-82 70 27', 'adm.e6220arj1@win.be'),
(176, 'ATHENEE ROYAL JULES BARA', 7500, 'TOURNAI', 'Rue Duquesnoy', '24', '069-89 06 02', '069-84 14 45', 'prefete@atheneejulesbara.be'),
(177, 'ATHENEE ROYAL JULES BORDET', 7060, 'SOIGNIES', 'Boulevard Roosevelt', '27', '067-33 44 44', '067-34 05 87', NULL),
(178, 'ATHENEE ROYAL JULES DESTREE', 6001, 'MARCINELLE', 'Rue des Haies', '76', '071-36 11 73', '071-43 08 01', NULL),
(179, 'ATHENEE ROYAL LA LOUVIERE', 7100, 'LA LOUVIERE', 'Rue de Bouvy', '15', '064-22 26 67', '064-21 59 83', NULL),
(180, 'ATHENEE ROYAL LEONARDO DA VINCI', 1070, 'ANDERLECHT', 'Rue Chome-Wyns', '5', '02-526 83 83', '02-523 26 39', 'afaure.2019@ens.irisnet.be'),
(181, 'ATHENEE ROYAL LES MARLAIRES', 6041, 'GOSSELIES', 'Rue de la Providence', '12', '071-25 87 70', '071-25 87 87', NULL),
(182, 'ATHENEE ROYAL LIEGE 1 CHARLES ROGIER', 4000, 'LIEGE', 'Rue des Clarisses', '13', '04-222 14 82', '04-223 09 45', 'direction@atheneecharlesrogier.be'),
(183, 'ATHENEE ROYAL LIEGE ATLAS', 4000, 'LIEGE', 'Quai Saint-Leonard', '80', '04-227 27 56', '04-227 06 27', 'ar.liege.atlas@sec.cfwb.be'),
(184, 'ATHENEE ROYAL LOUIS DELATTRE', 6140, 'FONTAINE-L\'EVEQUE', 'Rue de l\'Athenee', '32', '071-52 35 23', '071-54 12 98', 'francoise.grege@sec.cfwb.be'),
(185, 'ATHENEE ROYAL LUCIE DEJARDIN', 4100, 'SERAING', 'Rue de l\'Industrie', '127', '04-337 21 02', '04-336 41 30', 'secretariat@arluciedejardin.be'),
(186, 'ATHENEE ROYAL LUCIENNE TELLIER', 7910, 'ANVAING', 'Chemin du Carnois', '32A', '069-87 18 20', '069-87 18 21', 'aranvaing@hotmail.com'),
(187, 'ATHENEE ROYAL MARCHE-BOMAL', 6900, 'MARCHE-EN-FAMENNE', 'Avenue de la Toison d\'Or', '71', '084-32 04 60', '084-32 04 61', 'armarche-bomal@hotmail.com'),
(188, 'ATHENEE ROYAL MARGUERITE BERVOETS', 7000, 'MONS', 'Avenue Victor Maistriau', '11', '065-40 80 70', '065-35 25 50', NULL),
(189, 'ATHENEE ROYAL MONS I', 7000, 'MONS', 'Rue de l\'Athenee', '4', '065-40 40 70', '065-31 93 19', NULL),
(190, 'ATHENEE ROYAL NESTOR OUTER', 6760, 'VIRTON', 'Faubourg d\'Arival', '48', '063-57 73 30', '063-57 95 93', NULL),
(191, 'ATHENEE ROYAL NIVELLES', 1400, 'NIVELLES', 'Avenue du Centenaire', '34', '067-21 24 58', '067-84 04 50', NULL),
(192, 'ATHENEE ROYAL NORBERT COLLARD', 5570, 'BEAURAING', 'Rue de Dinant', '23', '082-71 13 02', '082-71 40 70', NULL),
(193, 'ATHENEE ROYAL ORSINI DEWERPE', 6040, 'JUMET', 'Rue Gendebien', '1', '071-25 69 00', '071-25 69 19', 'contact@athenee-orsini.be'),
(194, 'ATHENEE ROYAL PAUL BRUSSON', 4420, 'MONTEGNEE', 'Rue Felix Bernard', '1', '04-263 73 63', '04-263 43 00', NULL),
(195, 'ATHENEE ROYAL PAUL DELVAUX', 1340, 'OTTIGNIES', 'Avenue des Villas', '15', '010-42 04 20', '010-42 04 10', 'secretariat@arolln.be'),
(196, 'ATHENEE ROYAL PERUWELZ', 7600, 'PERUWELZ', 'Rue des FranÃ§ais', '31', '069-77 95 50', '069-77 41 18', 'info@arperuwelz.be'),
(197, 'ATHENEE ROYAL PIERRE PAULUS', 6200, 'CHATELET', 'Rue des Gaux', '100', '071-38 10 31', '071-38 55 17', 'ar.paulus.chatelet@sec.cfwb.be'),
(198, 'ATHENEE ROYAL PONT-A-CELLES', 6230, 'PONT-A-CELLES', 'Rue de l\'Eglise', '107B', '071-84 45 09', '071-84 60 58', NULL),
(199, 'ATHENEE ROYAL PRINCE BAUDOUIN', 4570, 'MARCHIN', 'Rue Fourneau', '40', '085-27 33 00', '085-25 12 24', 'ar.baudouin.marchin@sec.cfwb.be'),
(200, 'ATHENEE ROYAL RENE MAGRITTE', 6200, 'CHATELET', 'Rue du CollÃ¨ge', '16', '071-38 05 69', '071-39 79 96', 'magritte@caramail.com'),
(201, 'ATHENEE ROYAL RIVA-BELLA', 1420, 'BRAINE-L\'ALLEUD', 'Place Riva Bella', NULL, '02-389 09 32', '02-384 44 47', NULL),
(202, 'ATHENEE ROYAL RIXENSART WAVRE', 1330, 'RIXENSART', 'Rue Albert Croy', '3', '02-634 04 72', '02-652 15 47', 'ar.rixensart@sec.cfwb.be'),
(203, 'ATHENEE ROYAL ROBERT CAMPIN', 7500, 'TOURNAI', 'Rue du ChÃ¢teau', '18', '069-22 26 66', '069-84 33 29', NULL),
(204, 'ATHENEE ROYAL ROCHEFORT-JEMELLE', 5580, 'ROCHEFORT', 'Rue Jacquet', '102', '084-34 09 10', '084-21 29 94', 'secretariatarrochefort@hotmail.com'),
(205, 'ATHENEE ROYAL SAINT-GHISLAIN', 7330, 'SAINT-GHISLAIN', 'Avenue de l\'Enseignement', '20', '065-78 40 52', '065-78 50 66', NULL),
(206, 'ATHENEE ROYAL SIMONE VEIL', 6500, 'BEAUMONT', 'Rue Germain Michiels', '3', '071-58 81 27', '071-58 84 55', NULL),
(207, 'ATHENEE ROYAL SOUMAGNE', 4630, 'SOUMAGNE', 'Rue des Prairies', '30', '04-377 10 00', '04-377 14 91', NULL),
(208, 'ATHENEE ROYAL TAMINES', 5060, 'TAMINES', 'Avenue President Roosevelt', '57', '071-26 04 60', '071-74 19 02', NULL),
(209, 'ATHENEE ROYAL THIL LORRAIN VERVIERS I', 4800, 'VERVIERS', 'Rue Thil Lorrain', '1-3', '087-30 79 30', '087-30 79 36', 'prefet.arv1@skynet.be'),
(210, 'ATHENEE ROYAL THOMAS EDISON MOUSCRON', 7700, 'MOUSCRON', 'Place de la Justice', '1', '056 - 85 98 98', NULL, NULL),
(211, 'ATHENEE ROYAL THUIN', 6530, 'THUIN', 'DrÃ¨ve des Allies', '11', '071-59 05 30', '071-59 46 99', NULL),
(212, 'Athenee Royal Toots Thielemans', 1080, 'MOLENBEEK-SAINT-JEAN', 'Rue de la Prosperite', '14', '02/544 00 05', NULL, NULL),
(213, 'ATHENEE ROYAL VAUBAN', 6000, 'CHARLEROI', 'Rue Emile Tumelaire', '12', '071-32 07 02', '071-32 78 53', 'secretariat@arv.be'),
(214, 'ATHENEE ROYAL VERDI', 4800, 'VERVIERS', 'Rue des Wallons', '57', '087-32 43 60', '087-32 43 70', 'direction@arverdi.be'),
(215, 'ATHENEE ROYAL VICTOR HORTA', 1060, 'SAINT-GILLES', 'Rue de la Rhetorique', '16', '02-538 27 42', '02-538 94 13', 'mohamed.elhamouti@sec.cfwb.be'),
(216, 'Athenee royal Victor Hugo', 1130, 'HAREN', 'Avenue de la Metrologie', '2-4', '02 - 897 28 41', NULL, 'direction.arvh@gmail.com'),
(217, 'ATHENEE ROYAL VIELSALM - MANHAY', 6690, 'VIELSALM', 'Les Grands Champs', '18A', '080-29 26 70', '080-29 26 71', NULL),
(218, 'ATHENEE ROYAL VISE', 4600, 'VISE', 'Rue du Gollet', '2', '04-379 96 60', '04-379 46 41', NULL),
(219, 'ATHENEE ROYAL WAIMES', 4950, 'WAIMES', 'Rue des HÃªtres', '2A', '080-67 95 64', '080-67 98 19', 'dir@arwaimes.be'),
(220, 'ATHENEE ROYAL WAREMME', 4300, 'WAREMME', 'Rue Gustave Renier', '1', '019-32 26 06', '019-32 68 28', NULL),
(221, 'ATHENEE ROYAL WOLUWE-SAINT-LAMBERT', 1200, 'WOLUWE-SAINT-LAMBERT', 'Rue de l\'Athenee Royal', '75-77', '02-776 82 60', '02-776 82 90', 'info@arwsl.be'),
(222, 'ATHENEE ROYAL YVONNE VIESLET', 6030, 'MARCHIENNE-AU-PONT', 'Rue des Remparts', '35', '071-29 73 31', '071-51 64 73', 'arm@brutele.be'),
(223, 'C.H.U. Enfants Reine Fabiola - Ecole Robert Dubois', 1020, 'LAEKEN', 'Avenue Jean-Joseph Crocq', '15', '02-4773162', '02-4773361', 'ecole.r.dubois@brucity.education'),
(224, 'Campus Saint-Jean', 1080, 'MOLENBEEK-SAINT-JEAN', 'Rue de Birmingham', '41', '02-412 04 80', '02-412 04 81', NULL),
(225, 'CEFA - \"BASSE SAMBRE\"', 5060, 'TAMINES', 'Rue du CollÃ¨ge', '27', '071-74 11 36', '071-74 39 44', NULL),
(226, 'CEFA - ARLON', 6700, 'ARLON', 'Chemin de Weyler', '2', '063-23 02 26', '063-23 02 25', NULL),
(227, 'CEFA - ATH', 7800, 'ATH', 'Avenue Vauban', '6', '068-84 32 71', '068-84 32 72', NULL),
(228, 'CEFA - ATHENEE PROVINCIAL LEUZE-EN-HAINAUT', 7900, 'LEUZE-EN-HAINAUT', 'Rue du Rempart', '16', '069-67 21 10', '068-26 46 79', NULL),
(229, 'CEFA - BASTOGNE', 6600, 'BASTOGNE', 'Avenue Mathieu', '48', '061-21 66 68', NULL, NULL),
(230, 'CEFA - Bruxelles-Ville', 1000, 'BRUXELLES', 'Boulevard de l\'Abattoir', '50', '02-279 52 20', '02-279 52 29', 'sec.cefa@brucity.education'),
(231, 'CEFA - CENTRE EDUCATIF COMMUNAL SECONDAIRE \"LA GARENNE\"', 6000, 'CHARLEROI', 'Rue de Lodelinsart', '200', '071-86 24 00', '071-32 01 86', NULL),
(232, 'CEFA - CENTRE SCOLAIRE EPERONNIERS-MERCELIS', 1050, 'IXELLES', 'Rue Mercelis', '36-38', '02-512 60 98', '02-512 18 53', NULL),
(233, 'CEFA - COLLEGE NOTRE-DAME', 5500, 'DINANT', 'Rue de Bonsecours', '2', '082-22 48 04', '082-21 35 29', NULL),
(234, 'CEFA - COLLEGE SAINT-MARTIN - I.S.M. PAIRAY', 4100, 'SERAING', 'Rue de la Province', '101', '04-385 11 46', '04-330 18 96', NULL),
(235, 'CEFA - COLLEGE TECHNIQUE SAINT-HENRI', 7700, 'MOUSCRON', 'Avenue Royale', '50', '056-85 57 00', '056-85 57 01', NULL),
(236, 'CEFA - COLLEGE TECHNIQUE SAINT-JEAN', 1300, 'WAVRE', 'Rue du Pont Saint-Jean', '48', '010-22 28 29', '010-23 10 55', NULL),
(237, 'CEFA - DINANT \"L\'ATOUT\"', 5500, 'DINANT', 'Chemin d\'Herbuchenne', '1', '082-71 04 48', '082-64 79 04', NULL),
(238, 'CEFA - ECOLE POLYTECHNIQUE DE HERSTAL -  ENSEIGNEMENT DE LA PROVINCE DE LIEGE', 4040, 'HERSTAL', 'Rue de l\'Ecole Technique', '34', '04-248 42 00', '04-248 42 04', NULL),
(239, 'CEFA - ECOLE POLYTECHNIQUE DE HUY-ENSEIGNEMENT DE LA PROVINCE DE LIEGE', 4500, 'HUY', 'Rue Saint-Pierre', '48', '085-27 37 21', '085-27 37 02', NULL),
(240, 'CEFA - ECOLE POLYTECHNIQUE DE SERAING - ENSEIGNEMENT DE LA PROVINCE DE LIEGE', 4100, 'SERAING', 'Rue de Colard Trouillet', '48', '04-330 72 21', '04-330 72 99', NULL),
(241, 'CEFA - ECOLE POLYTECHNIQUE DE VERVIERS - ENSEIGNEMENT DE LA PROVINCE DE LIEGE', 4800, 'VERVIERS', 'Rue aux Laines', '69', '087-32 70 64', '087-31 05 20', NULL),
(242, 'CEFA - ECOLE PROFESSIONNELLE', 5002, 'SAINT-SERVAIS', 'Rue Florent Dethier', '31', '081-72 90 11', '081-74 30 47', NULL),
(243, 'CEFA - GLONS', 4690, 'GLONS', 'Rue Saint-Laurent', '45', '04-286 91 23', NULL, NULL),
(244, 'CEFA - INSTITUT D\'ENSEIGNEMENT TECHNIQUE SAINT-ELOI', 7900, 'LEUZE-EN-HAINAUT', 'Tour Saint-Pierre', '11', '069-66 96 10', '069-66 96 29', NULL),
(245, 'CEFA - INSTITUT DE LA PROVIDENCE', 1070, 'ANDERLECHT', 'Rue Haberman', '27', '02-523 01 82', '02-521 67 44', NULL),
(246, 'CEFA - INSTITUT DES ARTS ET METIERS', 6760, 'VIRTON', 'Rue de Pierrard', '112', '063-58 89 20', '063-57 70 95', NULL),
(247, 'CEFA - INSTITUT DON BOSCO', 4500, 'HUY', 'Rue des Cotillages', '2', '085-27 07 50', '085-23 55 29', NULL),
(248, 'CEFA - Institut Emile Gryzon', 1180, 'UCCLE', 'Rue de Stalle', '292B', '02-800 82 05', NULL, 'cefaceria@spfb.edu.brussels'),
(249, 'CEFA - INSTITUT NOTRE-DAME - SEMINAIRE', 6600, 'BASTOGNE', 'Rue Piconrue', '4-6', '061-24 06 30', '061-24 06 39', NULL),
(250, 'CEFA - INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE', 1480, 'TUBIZE', 'Route Provinciale', '11', '02-355 66 87', NULL, NULL),
(251, 'CEFA - INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE LEON HUREZ', 7100, 'LA LOUVIERE', 'Rue Bonne Esperance', '1', '064-22 22 80', '064-26 61 92', NULL),
(252, 'CEFA - INSTITUT SAINT-LUC', 7000, 'MONS', 'Rue Saint-Luc', '3', '065-33 71 21', '065-31 15 57', NULL),
(253, 'CEFA - INSTITUT SAINT-ROCH', 6900, 'MARCHE-EN-FAMENNE', 'Rue Americaine', '28', '084-32 01 50', '084-32 01 57', NULL),
(254, 'CEFA - INSTITUT SAINTE-ANNE', 6041, 'GOSSELIES', 'Rue Circulaire', '5', '071-25 82 20', '071-25 82 21', NULL),
(255, 'CEFA - INSTITUT SAINTE-CLAIRE', 4800, 'VERVIERS', 'Rue SÃ¨cheval', '32', '087-31 08 53', '087-31 07 24', NULL),
(256, 'CEFA - INSTITUT SAINTE-MARIE', 6140, 'FONTAINE-L\'EVEQUE', 'Rue de l\'Enseignement', '1', '071-52 52 17', '071-52 27 93', NULL),
(257, 'CEFA - INSTITUT TECHNIQUE SAINT-GABRIEL', 7090, 'BRAINE-LE-COMTE', 'Rue de Mons', '80', '067-55 21 46', '067-56 03 00', NULL),
(258, 'CEFA - LAEKEN', 1020, 'LAEKEN', 'Rue Marie-Christine', '83', '02-426 69 37', NULL, NULL),
(259, 'CEFA - LIBRAMONT', 6800, 'LIBRAMONT', 'Avenue Herbofin', '39', '061-26 09 20', NULL, NULL),
(260, 'CEFA - MONS - HOUDENG', 7000, 'MONS', 'Boulevard President Kennedy', '10', '065-39 89 79', NULL, NULL),
(261, 'CEFA - MORLANWELZ', 7140, 'MORLANWELZ', 'Rue Raoul Warocque', '46', '064-43 21 88', NULL, NULL),
(262, 'CEFA - MOUSCRON', 7700, 'MOUSCRON', 'Place de la Justice', '1', '056-85 98 64', NULL, NULL),
(263, 'CEFA - SUARLEE', 5020, 'SUARLEE', 'Chaussee de Nivelles', '204', '081-58 22 28', NULL, 'cefanamur@outlook.be'),
(264, 'CEFA - UNIVERSITE DU TRAVAIL - INSTITUT D\'ENSEIGNEMENT TECHNIQUE SECONDAIRE', 6000, 'CHARLEROI', 'Boulevard Gustave Roullier', '1', '071-38 66 91', NULL, NULL),
(265, 'CEFA - VILLE DE LIEGE', 4000, 'LIEGE', 'Rue des Beaux-Arts', '4', '04-229 80 80', '04-252 20 33', NULL),
(266, 'Centre Arthur Regniers Enseignement specialise provincial', 6543, 'BIENNE-LEZ-HAPPART', 'Rue Evelyn Drory Van Den Eynde', '2', '071-55-20-00', '071-55 65 97', NULL),
(267, 'Centre d\'enseignement secondaire d\'Etterbeek Ernest Richard', 1040, 'ETTERBEEK', 'Place Saint-Pierre', '5', '02-734 28 09', '02-733 76 09', NULL),
(268, 'CENTRE D\'ENSEIGNEMENT SECONDAIRE LEON MIGNON', 4000, 'LIEGE', 'Rue Leon Mignon', '2', '04-223 71 08', '04-223 20 29', NULL),
(269, 'CENTRE D\'ENSEIGNEMENT SECONDAIRE LEONARD DEFRANCE', 4000, 'LIEGE', 'Rue de l\'Esperance', '62', '04-226 37 64', '04-226 93 47', NULL),
(270, 'CENTRE D\'ENSEIGNEMENT SECONDAIRE LIBRE NOTRE-DAME DES CHAMPS', 1180, 'UCCLE', 'Rue Edith Cavell', '143', '02-374 58 40', '02-374 41 43', 'info@e-ndc.org'),
(271, 'Centre d\'enseignement superieur de promotion et de formation continuee en brabant wallon', 1348, 'LOUVAIN-LA-NEUVE', 'Rue des Wallons', '6', '010-47 82 49', '010-47 82 46', 'secretariat-cpfb@uclouvain.be'),
(272, 'Centre d\'enseignement superieur pour adultes', 6044, 'ROUX', 'Rue de Courcelles', '10', '071-45 11 08', '071-45 53 63', 'CESA@educ.be'),
(273, 'Centre d\'Etudes superieures d\'Optometrie appliquee', 5100, 'JAMBES', 'Rue D\'Enhaive', '158', '081-58 91 21', NULL, 'cesoa@sec.cfwb.be'),
(274, 'Centre de formation culturelle et sociale', 1000, 'BRUXELLES', 'Boulevard de l\'Abattoir', '28', '02-209 23 23', '02-513 46 92', 'cfcs.@viefeminine.be'),
(275, 'Centre de formation pour les secteurs infirmier et de la sante de l\'A.C.N.', 1200, 'WOLUWE-SAINT-LAMBERT', 'Avenue Hippocrate', '91', '02-762 34 45', '02-762 50 56', 'cpsi.bxl@sec.cfwb.be'),
(276, 'Centre de Phonetique appliquee de Bruxelles', 1000, 'BRUXELLES', 'Avenue Louise', '113', '02-511 01 09', '02-512 51 39', 'info@cpab.be'),
(277, 'CENTRE EDUCATIF COMMUNAL SECONDAIRE \"LA GARENNE\"', 6000, 'CHARLEROI', 'Rue de Lodelinsart', '200', '071-86 24 00', '071-32 01 86', 'garenne@brutele.be'),
(278, 'Centre educatif communal secondaire de Couillet-Marcinelle', 6010, 'COUILLET', 'Route de Philippeville', '304', '071-36 80 68', '071-36 29 82', NULL),
(279, 'CENTRE EDUCATIF DE LA SAINTE-UNION', 7500, 'TOURNAI', 'Chaussee de Lille', '12', '069-22 18 22', '069-84 17 32', NULL),
(280, 'Centre provincial d\'enseignement secondaire (CEPES)', 1370, 'JODOIGNE', 'Chaussee de Tirlemont', '85', '010-81 88 00', '010-81 18 23', NULL),
(281, 'Centre provincial d\'enseignement specialise Ã  Mons', 7011, 'GHLIN', 'Rue du Temple', '2', '065-40 88 59', '065-84 09 95', NULL),
(282, 'Centre Scolaire Claire d\'Assise Ecole d\'enseignement secondaire specialise', 5004, 'BOUGE', 'Rue des anges', '2', '081-20 77 00', '081-21 25 71', 'epsissainteclairebouge@skynet.be'),
(283, 'CENTRE SCOLAIRE DE MA CAMPAGNE', 1050, 'IXELLES', 'Rue Africaine', '3', '02-538 08 38', '02-537 50 79', 'direction@csmc.be'),
(284, 'CENTRE SCOLAIRE DES DAMES DE MARIE-HAECHT-PHILOMENE-LIMITE', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Chaussee de Haecht', '68', '02-217 67 47', '02-218 73 66', NULL),
(285, 'CENTRE SCOLAIRE DON BOSCO', 7380, 'QUIEVRAIN', 'Rue Grande', '21', '065-45 06 20', '065-45 06 22', NULL),
(286, 'CENTRE SCOLAIRE DU SACRE-COEUR', 6000, 'CHARLEROI', 'Boulevard Audent', '58', '071-23 10 68', '071-31 17 56', 'cssc.charleroi@sec.cfwb.be'),
(287, 'Centre scolaire du Sacre-Coeur - Section Humanites', 1090, 'JETTE', 'Avenue du Sacre-Coeur', '8', '02-478 71 90', '02-478 21 76', NULL),
(288, 'CENTRE SCOLAIRE DU SACRE-COEUR DE LINDTHOUT', 1200, 'WOLUWE-SAINT-LAMBERT', 'Avenue Henri Dietrich', '20', '02-736 00 94', '02-732 00 47', 'direction@lindthout.be'),
(289, 'Centre scolaire Eddy Merckx', 1150, 'WOLUWE-SAINT-PIERRE', 'Avenue Salome', '2', '02-773 18 32', '02-773 18 16', NULL),
(290, 'CENTRE SCOLAIRE EPERONNIERS-MERCELIS', 1050, 'IXELLES', 'Rue Mercelis', '36-38', '02-512 60 98', '02-512 18 53', NULL),
(291, 'Centre Scolaire Notre-Dame', 4632, 'CEREXHE-HEUSEUX', 'Rue de l\'Institut', '40', '04-377 17 29', NULL, NULL),
(292, 'CENTRE SCOLAIRE NOTRE-DAME DE LA SAGESSE', 1083, 'GANSHOREN', 'Avenue Van Overbeke', '10', '02-428 11 27', '02-420 76 73', NULL),
(293, 'CENTRE SCOLAIRE SAINT-ADRIEN - VAL DUCHESSE', 1050, 'IXELLES', 'Schoolgat', '5', '02-672 36 08', '02-672 18 67', NULL),
(294, 'Centre scolaire Saint-Benoît Saint-Servais (2ème et 3ème degres)', 4000, 'LIEGE', 'Rue Lambert-le-BÃ¨gue', '44', '04-223 59 65', '04-221 15 85', 'stbenoit.stservais@win.be'),
(295, 'CENTRE SCOLAIRE SAINT-FRANCOIS-XAVIER', 4800, 'VERVIERS', 'Rue de Rome', '18', '087-39 39 39', '087-39 39 13', 'college.sfx1@skynet.be'),
(296, 'CENTRE SCOLAIRE SAINT-JOSEPH - NOTRE-DAME', 6040, 'JUMET', 'Rue Emile Strimelle', '1', '071-35 32 25', '071-35 46 67', NULL),
(297, 'CENTRE SCOLAIRE SAINT-JOSEPH - SAINT-RAPHAEL', 4920, 'SOUGNE-REMOUCHAMPS', 'Avenue de la Porallee', '40', '04-246 74 20', '04-384 46 53', NULL),
(298, 'CENTRE SCOLAIRE SAINT-LOUIS', 4020, 'LIEGE', 'Rue Alfred Magis', '20', '04-349 53 00', '04-344 04 94', 'fschoebrechts@swing.be'),
(299, 'Centre scolaire Saint-Michel', 1040, 'ETTERBEEK', 'Boulevard Saint-Michel', '24', '02 739 34 16', '02-739 34 26', NULL),
(300, 'CENTRE SCOLAIRE SAINT-STANISLAS', 7000, 'MONS', 'Rue des Dominicains', '15', '065-40 12 50', '065-40 12 59', 'saint-stanislas.mons@sec.cfwb.be'),
(301, 'Centre scolaire Sainte-Julienne (D1)', 4620, 'FLERON', 'Avenue des Martyrs', '246', '04-358 42 71', '04-358 95 39', 'stlaurent.fleron@sec.cfwb.be'),
(302, 'Centre scolaire Sainte-Julienne (D2 D3)', 4620, 'FLERON', 'Avenue des Martyrs', '246', '04-358 42 71', '04-358 75 25', NULL),
(303, 'CENTRE SCOLAIRE SAINTE-MARIE - LA SAGESSE', 1030, 'SCHAERBEEK', 'Chaussee de Haecht', '164', '02-216 81 67', '02-240 18 19', NULL),
(304, 'CENTRE SCOLAIRE SAINTE-VERONIQUE - MARIE-JOSE', 4000, 'LIEGE', 'Rue Rennequin Sualem', '15', '04-252 40 72', '04-254 28 40', 'isv@skynet.be'),
(305, 'CENTRE SCOLAIRE SAINTE-VERONIQUE - MARIE-JOSE DOA', 4000, 'LIEGE', 'Rue Rennequin Sualem', '20', '04 252 40 72', NULL, NULL),
(306, 'Centre scolaire secondaire specialise Saint-Joseph', 4830, 'LIMBOURG', 'Avenue Victor David', '12', '087-76 31 17', '087-59 68 91', NULL),
(307, 'Charles Gheude Enseignement secondaire specialise professionnel', 1000, 'BRUXELLES', 'Rue des Tanneurs', '41', '02-512 41 94', '02-511 59 44', 'jmotte.2097@ens.irisnet.be'),
(308, 'Clairs Vallons - Enseignement specialise fondamental et secondaire libre', 1340, 'OTTIGNIES', 'Rue de Mont-Saint-Guibert', '24', '010-48 02 15', '010-48 02 07', NULL),
(309, 'COLLEGE \"LES TOURNESOLS\"', 1070, 'ANDERLECHT', 'Boulevard Maurice Herbette', '24', '0460 - 94 96 72', NULL, 'infos@lestournesols.com'),
(310, 'COLLEGE ABBE NOEL', 5310, 'EGHEZEE', 'Rue du CollÃ¨ge', '4', '081-81 02 10', '081-81 02 39', 'csjh.eghezee@sec.cfwb.be'),
(311, 'COLLEGE ARCHIEPISCOPAL CARDINAL MERCIER', 1420, 'BRAINE-L\'ALLEUD', 'Chee de Mont-Saint-Jean', '83', '02-386 15 11', '02-386 15 73', NULL),
(312, 'COLLEGE D\'ALZON', 6927, 'BURE', 'Rue de Han', '1', '084-36 02 80', '084-36 62 49', 'administration@alzon.be'),
(313, 'Collège Da Vinci', 1360, 'PERWEZ', 'Avenue des Tourterelles', '28', '081-23 11 86', NULL, NULL),
(314, 'COLLEGE DE GODINNE-BURNOT D.O.A.', 5530, 'GODINNE', 'Carrefour de l\'Europe', '3', '082-61 04 00', '082-61 04 01', NULL),
(315, 'COLLEGE DE GODINNE-BURNOT D2-D3', 5530, 'GODINNE', 'Carrefour de l\'Europe', '3', '082-61 04 00', '082-61 04 01', NULL),
(316, 'COLLEGE DE L\'ALLIANCE', 6031, 'MONCEAU-SUR-SAMBRE', 'Rue de Mons', '106', '071 - 31 72 37', '071 - 30 21 84', 'collegedelalliance@yahoo.com'),
(317, 'COLLEGE DE LA LYS', 7780, 'COMINES-WARNETON', 'Rue Romaine', '40', '056-89 09 09', NULL, NULL),
(318, 'COLLEGE DES AUMONIERS DU TRAVAIL DE CHARLEROI', 6000, 'CHARLEROI', 'Grand\'rue', '185', '071-41 39 39', '071-41 01 04', NULL),
(319, 'COLLEGE DES ETOILES', 1130, 'HAREN', 'Avenue de la Metrologie', '5', '02-216 91 20', '02-227 97 73', NULL),
(320, 'COLLEGE DON BOSCO', 1200, 'WOLUWE-SAINT-LAMBERT', 'Chaussee de Stockel', '270', '02-771 98 48', '02-771 18 23', 'direction.dbwsl@gmail.com'),
(321, 'COLLEGE DU CHRIST-ROI', 1340, 'OTTIGNIES-LOUVAIN-LA-NEUVE', 'Rue de Renivaux', '25', '010-42 04 70', '010-41 44 98', 'college.christroi.lln@sec.cfwb.be'),
(322, 'COLLEGE DU SACRE-COEUR', 1083, 'GANSHOREN', 'Rue Louis Delhove', '65', '02-425 87 22', '02-421 65 40', 'secondaire@cscg.be'),
(323, 'COLLEGE EPISCOPAL DU SARTAY', 4053, 'EMBOURG', 'Rue Pierre Henvard', '64', '04-361 69 58', '04-361 69 52', 'buckinx@sartay.be'),
(324, 'Collège Fra Angelico', 1140, 'EVERE', 'Avenue des Anciens Combattants', '190', '02/897 50 50', NULL, NULL),
(325, 'COLLEGE JEAN XXIII', 1150, 'WOLUWE-SAINT-PIERRE', 'Boulevard de la Woluwe', '22', '02-771 01 78', '02-771 72 43', 'martial.schtickzelle@sec.cfwb.be'),
(326, 'COLLEGE LA FRATERNITE', 1020, 'LAEKEN', 'Rue Drootbeek', '2', '02-426 71 14', '02-421 68 59', 'daniele.vandommele@clfb.be'),
(327, 'Collège Matteo Ricci', 1070, 'ANDERLECHT', 'Boulevard Poincare', '67', '02/582 86 47', NULL, NULL),
(328, 'Collège Notre-Dame', 1300, 'WAVRE', 'Rue du Calvaire', '4', '010-23 83 00', '010-23 83 09', 'college@cndbw.be'),
(329, 'COLLEGE NOTRE-DAME DE BON SECOURS', 7130, 'BINCHE', 'Rue de Merbes', '25', '064-23 99 99', '064-23 99 98', 'eric.daubie@sec.cfwb.be'),
(330, 'COLLEGE NOTRE-DAME DE LA PAIX', 5101, 'ERPENT', 'Pl Notre-Dame de la Paix', '5', '081-30 19 61', '081-30 84 27', NULL),
(331, 'COLLEGE NOTRE-DAME DE LA TOMBE', 7540, 'KAIN', 'Rue Abbe Dropsy', '2', '069-88 08 60', '069-88 08 69', NULL),
(332, 'COLLEGE NOTRE-DAME DES TROIS VALLEES', 1332, 'GENVAL', 'Rue du Couvent', '2', '02-654 07 82', '02-653 71 83', 'cnd3v.rixensart@sec.cfwb.be'),
(333, 'Collège Notre-Dame du Bonlieu', 6760, 'VIRTON', 'Rue Chanoine Crousse', '1', '063-58 86 30', '063-58 86 39', NULL),
(334, 'COLLEGE NOTRE-DAME ET SAINT-LAMBERT ET INSTITUT SAINT-LAURENT', 4040, 'HERSTAL', 'Rue Elisa Dumonceau', '75', '04-264 00 49', '04-248 15 36', 'indsl.herstal@sec.cfwb.be'),
(335, 'COLLEGE PROVIDENCE I - D.O.A.', 4650, 'HERVE', 'Avenue Reine Astrid', '9', '087-67 40 75', '087-66 04 37', 'doa.providence.herve@sec.cfwb.be'),
(336, 'COLLEGE PROVIDENCE II D.O.A.', 4650, 'HERVE', 'Avenue Reine Astrid', '9', '087-67 40 75', '087-66 04 37', 'direction2@cph-herve.be'),
(337, 'COLLEGE ROI BAUDOUIN', 1030, 'SCHAERBEEK', 'Avenue Felix Marchal', '62', '02-734 95 16', '02-732 13 25', NULL),
(338, 'COLLEGE ROI BAUDOUIN ENSEIGNEMENT TECHNIQUE ET PROFESSIONNEL', 1030, 'SCHAERBEEK', 'Avenue EugÃ¨ne Plasky', '184', '02-734 38 85', '02-734 78 05', NULL),
(339, 'COLLEGE ROYAL MARIE-THERESE', 4650, 'HERVE', 'Rue de Charneux', '36', '087-67 41 37', '087-67 59 33', NULL),
(340, 'COLLEGE SAINT PIE X', 6200, 'CHATELINEAU', 'Rue Lloyd George', '15', '071-38 38 48', '071-38 93 23', 'pie10@brutele.be'),
(341, 'COLLEGE SAINT-ANDRE (enseignement general)', 5060, 'AUVELAIS', 'Rue des Auges', '22', '071-26 05 00', '071-26 05 12', NULL),
(342, 'COLLEGE SAINT-ANDRE (enseignement technique et professionnel)', 5060, 'AUVELAIS', 'Rue des Auges', '22', '071-77 26 91', '071-76 13 02', 'standrevoisin@adm.cfwb.be'),
(343, 'Collège Saint-Augustin', 6280, 'GERPINNES', 'Avenue Astrid', '13', '071-50 90 80', '071-50 90 89', NULL),
(344, 'COLLEGE SAINT-BARTHELEMY', 4000, 'LIEGE', 'En-Hors-ChÃ¢teau', '31', '04-223 73 71', '04-221 17 16', 'jm.drieskens@hotmail.com'),
(345, 'COLLEGE SAINT-BENOIT DE MAREDSOUS', 5537, 'DENEE', 'Rue de Maredsous', '12', '082-69 82 05', '082-69 82 56', 'college@maredsous.com'),
(346, 'COLLEGE SAINT-ELOI', 7900, 'LEUZE-EN-HAINAUT', 'Tour Saint-Pierre', '11', '069-66 96 11', '069-66 96 29', 'cespdir@skynet.be'),
(347, 'COLLEGE SAINT-ETIENNE CAMPUS', 1490, 'COURT-SAINT-ETIENNE', 'Av Prisonniers de Guerre', '36', '010-61 27 56', '010-61 18 67', 'thomas.jadin@collegestetienne.be'),
(348, 'COLLEGE SAINT-ETIENNE DES HAYEFFES', 1435, 'MONT-SAINT-GUIBERT', 'Rue des Hayeffes', '35', NULL, NULL, NULL),
(349, 'COLLEGE SAINT-FRANCOIS D\'ASSISE', 1480, 'TUBIZE', 'Rue de Mons', '74', '02-355 83 77', '02-390 03 33', NULL),
(350, 'COLLEGE SAINT-GUIBERT (D2-D3)', 5030, 'GEMBLOUX', 'Place de l\'Orneau', '21', '081-62 64 80', '081-61 45 54', NULL),
(351, 'COLLEGE SAINT-GUIBERT D.O.A.', 5030, 'GEMBLOUX', 'Place de l\'Orneau', '21', '081-62 64 80', '081-61 45 54', NULL),
(352, 'Collège Saint-Hadelin', 4600, 'VISE', 'Rue Saint-Hadelin', '15', '04-379 15 39', '04-379 13 21', NULL),
(353, 'COLLEGE SAINT-HUBERT', 1170, 'WATERMAEL-BOITSFORT', 'Avenue Charle-Albert', '9', '02-660 19 40', '02-675 42 37', NULL),
(354, 'COLLEGE SAINT-JOSEPH', 6460, 'CHIMAY', 'Rue de Virelles', '75', '060-21 04 10', '060-21 11 68', NULL),
(355, 'COLLEGE SAINT-JULIEN', 7800, 'ATH', 'Rue de la Station', '17', '068-28 50 20', '068-28 50 07', NULL),
(356, 'COLLEGE SAINT-LOUIS', 4300, 'WAREMME', 'Avenue du Prince Regent', '30', '019-32 24 84', '019-33 08 83', NULL),
(357, 'COLLEGE SAINT-MARTIN - I.S.M. PAIRAY', 4100, 'SERAING', 'Rue de la Province', '101', '04-337 04 96', '04-336 68 33', NULL),
(358, 'Collège Saint-Michel', 6041, 'GOSSELIES', 'Faubourg de Charleroi', '15', '071-35 36 74', '071-37 81 16', NULL),
(359, 'COLLEGE SAINT-PIERRE', 1090, 'JETTE', 'Rue Jean-Baptiste Verbeyst', '25', '02-421 43 30', '02-427 55 13', NULL),
(360, 'COLLEGE SAINT-QUIRIN', 4500, 'HUY', 'Rue Entre-Deux-Portes', '75', '085-21 14 49', '085-25 11 72', 'college@st-quirin.be'),
(361, 'COLLEGE SAINT-REMACLE', 4970, 'STAVELOT', 'Avenue Ferdinand Nicolay', '35', '080-89 20 61', '080-89 20 69', NULL),
(362, 'COLLEGE SAINT-REMACLE D.O.A.', 4970, 'STAVELOT', 'Avenue Ferdinand Nicolay', '35', '080-89 20 62', '080-89 20 69', NULL),
(363, 'Collège Saint-Roch Ferrières', 4190, 'FERRIERES', 'Allee de Bernardfagne', '7', '086-40 00 06', '086-40 04 57', NULL),
(364, 'COLLEGE SAINT-SERVAIS', 5002, 'SAINT-SERVAIS', 'Rue de la PepiniÃ¨re', '101', '081-72 90 11', '081-74 30 47', 'dir.generale@asty-moulin.be'),
(365, 'COLLEGE SAINT-VINCENT - 2e-3e DEGRES', 7060, 'SOIGNIES', 'Chaussee de Braine', '22', '067-34 70 00', '067-34 70 01', NULL),
(366, 'COLLEGE SAINT-VINCENT - DOA', 7060, 'SOIGNIES', 'Chaussee de Braine', '22', '067-34 70 00', '067-34 70 01', NULL);
INSERT INTO `establishments` (`id`, `name`, `postcode`, `locality`, `street`, `streetNumber`, `phone`, `fax`, `email`) VALUES
(367, 'Collège Saint-Vincent - Saint-François', 1050, 'IXELLES', 'Chaussee de Vleurgat', '55', '02-648 10 70', '02-644 28 92', NULL),
(368, 'COLLEGE SAINTE-CROIX ET NOTRE-DAME', 4280, 'HANNUT', 'Rue de Crehen', '1', '019-51 94 50', '019-51 94 60', 'sainte-croix@infonie.be'),
(369, 'COLLEGE SAINTE-GERTRUDE', 1400, 'NIVELLES', 'Faubourg de Mons', '1', '067-21 12 60', '067-84 15 32', NULL),
(370, 'COLLEGE SAINTE-MARIE', 7330, 'SAINT-GHISLAIN', 'Rue du Port', '115-127', '065-78 61 31', '065-78 29 20', NULL),
(371, 'COLLEGE SAINTE-MARIE D.O.A.', 7700, 'MOUSCRON', 'Rue de Tournai', '17', '056-85 49 11', '056-33 62 05', NULL),
(372, 'Collège technique \"Aumôniers du travail\"', 6000, 'CHARLEROI', 'Grand\'rue', '185', '071-285.905', NULL, 'cetat.charleroi@sec.cfwb.be'),
(373, 'Collège technique Saint-Henri', 7700, 'MOUSCRON', 'Avenue Royale', '50', '056-85 57 00', '056-85 57 01', 'promsoc@sthenri.be'),
(374, 'COLLEGE TECHNIQUE SAINT-JEAN', 1300, 'WAVRE', 'Rue du Pont Saint-Jean', '48', '010-22 28 29', '010-23 10 55', NULL),
(375, 'COLLEGE VISITATION - LA BERLIERE', 7860, 'LESSINES', 'Parvis Saint-Pierre', '13', '068-26 87 10', '068-26 87 16', 'visitation.lessines@swing.be'),
(376, 'COMMUNAUTE EDUCATIVE SAINT-JEAN-BAPTISTE', 5060, 'TAMINES', 'Rue du CollÃ¨ge', '27', '071-77 11 07', '071-74 19 71', NULL),
(377, 'COMMUNAUTE EDUCATIVE SAINT-JEAN-BAPTISTE (2E ET 3E DEGRES)', 5060, 'TAMINES', 'Rue du CollÃ¨ge', '27', '071-77 11 07', '071-74 19 71', 'cesjb@cesjb.com'),
(378, 'COMMUNAUTE SCOLAIRE SAINT-BENOIT 1er DEGRE', 6720, 'HABAY-LA-NEUVE', 'Avenue de la Gare', '68', '063-42 22 48', '063-42 22 91', NULL),
(379, 'COMMUNAUTE SCOLAIRE SAINT-BENOIT 2E ET 3E DEGRES', 6720, 'HABAY-LA-NEUVE', 'Rue de Luxembourg', '2', '063-42 22 27', '063-42 44 63', NULL),
(380, 'COMMUNAUTE SCOLAIRE SAINTE-MARIE', 5000, 'NAMUR', 'Rue du President', '28', '081-22 92 04', '081-22 79 49', 'dir.sec@cssm.be'),
(381, 'Conservatoire  \"Arthur Grumiaux\" de Charleroi', 6000, 'CHARLEROI', 'Rue Adolphe Biarent', '1', '071-31 05 37', '071-32 61 65', 'christian.delcoux@skynet.be'),
(382, 'Conservatoire \"Marcel Quinet\"', 7130, 'BINCHE', 'Faubourg Saint-Paul', '42', '064-33 40 60', '064-33 40 00', NULL),
(383, 'Conservatoire Adolphe SAX - Arts et Scènes', 5500, 'DINANT', 'Rue Saint-Michel', '9', '082-40.48.65', '082-22 20 07', 'academie.musique@dinant.be'),
(384, 'Conservatoire d\'Auvelais', 5060, 'AUVELAIS', 'Rue Hicguet', '19', '071-26 00 35', '071-26 00 38', NULL),
(385, 'Conservatoire de musique de Ciney', 5590, 'CINEY', 'Avenue du Sainfoin', '8', '083-21 31 92', '083-22 03 53', NULL),
(386, 'Conservatoire de musique de Huy', 4500, 'HUY', 'Quai d\'Arona', '5', '085-21 32 31', '085-21 32 31', 'cons-mus-huy@tiscalinet.be'),
(387, 'Conservatoire de musique de La Louvière', 7100, 'LA LOUVIERE', 'Place Communale', '26', '064-22 53 55', '064-22 73 24', NULL),
(388, 'Conservatoire de musique de Namur', 5100, 'JAMBES', 'Av du Bourg. Jean Materne', '162', '081-30 49 35', '081-33 07 27', NULL),
(389, 'Conservatoire de musique de Tournai', 7500, 'TOURNAI', 'Place Reine Astrid', '2', '069-45 25 90', '069-45 25 99', NULL),
(390, 'Conservatoire de musique et des arts parles \"Maurice Guillaume\" à Châtelet', 6200, 'CHATELET', 'Place du Baquet', '3', NULL, NULL, NULL),
(391, 'Conservatoire de musique, danse et arts de la parole \"Lucien Robert de Tamines', 5060, 'TAMINES', 'Place du Jumelage', '1', '071-77 28 21', '071-77 25 30', NULL),
(392, 'Conservatoire de Verviers : Musique - Arts de la parole et du theâtre - Danse', 4800, 'VERVIERS', 'Rue Chapuis', '6', '087-39 49 89', '087-39 49 99', NULL),
(393, 'Conservatoire royal de musique de Bruxelles', 1000, 'BRUXELLES', 'Rue de la Regence', '30', '+32 2 511 04 27', NULL, 'info@conservatoire.be'),
(394, 'Conservatoire royal de musique de Liège', 4000, 'LIEGE', 'Boulevard Piercot', '29', '+32 4 222 03 06', NULL, 'dir.conservatoire.liege@sup.cfwb.be'),
(395, 'Cours commerciaux du soir', 1030, 'SCHAERBEEK', 'Chaussee de Haecht', '237', '02-431 65 00', NULL, NULL),
(396, 'Cours communaux de coupe-couture', 7500, 'TOURNAI', 'Rue Galterie Saint-Jean', '15', '069-21 30 76', '069-21 30 76', NULL),
(397, 'Cours communaux de langues modernes', 1200, 'WOLUWE-SAINT-LAMBERT', 'Rue Abbe Jean Heymans', '29', '02-761 75 28', NULL, 'cours.langues@chello.be'),
(398, 'Cours de promotion sociale', 1060, 'SAINT-GILLES', 'Rue Vlogaert', '4', '02-537 97 21', '02-543 34 78', NULL),
(399, 'Cours de promotion sociale d\'Uccle', 1180, 'UCCLE', 'Avenue De Fre', '62A', '02-374 05 48', '02-374 05 48', 'promsoc.uccle@sec.cfwb.be'),
(400, 'Cours de promotion sociale Erasme', 1070, 'ANDERLECHT', 'Chaussee de Mons', '700', '02-522 25 86', '02-522 27 38', 'philippe.lambotte@sec.cfwb.be'),
(401, 'Cours de promotion sociale Saint-Luc', 4000, 'LIEGE', 'Rue Louvrex', '111', '04-223 06 12', '04-223 39 68', 'saint-lucps.liege@skynet.be'),
(402, 'Cours des Metiers d\'Art du Hainaut', 7000, 'MONS', 'Grand-Route', '105', '065-33 55 46', '065-36 35 37', 'cmah.mons@sec.cfwb.be'),
(403, 'Cours du soir de langues', 1000, 'BRUXELLES', 'Rue Ernest Allard', '49', '02-513 06 82', '02-512 47 55', 'cslangues@brucity.education'),
(404, 'Cours industriels', 1000, 'BRUXELLES', 'Boulevard de l\'Abattoir', '50', '02-279 51 00', '02-279 51 04', 'sec.coursindustriels@brucity.education'),
(405, 'Cours industriels et commerciaux', 7190, 'ECAUSSINNES-D\'ENGHIEN', 'Rue Ernest Martel', '6', '067-44 38 32', NULL, NULL),
(406, 'Cours industriels et commerciaux de Chimay', 6460, 'CHIMAY', 'Rue de l\'Athenee', '1', '060-21 18 24', '060-21 18 24', 'coursindustrielsetcommerciauxchimay@hotmail.com'),
(407, 'Cours menagers et professionnels de la Ville de La Louvière', 7110, 'LA LOUVIERE', 'Chaussee Paul Houtart', '316', '064-21 22 40', '064-84 87 14', 'cpms.prom.soc.II@ibelgique.com'),
(408, 'Cours pour educateurs en fonction', 4030, 'GRIVEGNEE', 'Rue des Fortifications', '25', '04-343 00 54', '04-343 21 40', 'cpse.liÃƒÂ¨ge@swing.be'),
(409, 'Cours professionnels pour adultes', 6000, 'CHARLEROI', 'Boulevard Joseph Tirou', '167', '071-30 22 17', '071-79 62 60', NULL),
(410, 'Cours techniques commerciaux et professionnels secondaires', 7860, 'LESSINES', 'Ancien Chemin d\'Ollignies', '2', '068-33 28 26', '068-34 05 26', NULL),
(411, 'CYCLE D\'OBSERVATION AUTONOME CARDINAL MERCIER', 1420, 'BRAINE-L\'ALLEUD', 'Chee de Mont-Saint-Jean', '83', '02-386 15 11', '02-386 15 73', NULL),
(412, 'D.O.A. Saint-Hadelin', 4600, 'VISE', 'Rue Saint-Hadelin', '15', '04-379 15 39', '04-379 13 21', NULL),
(413, 'D.O.A. Saint-Louis', 4020, 'LIEGE', 'Rue Alfred Magis', '20', '04-349 53 00', '04-344 04 94', 'mailto:direction@collegesaintlouis.be'),
(414, 'DAMES DE L\'INSTRUCTION CHRETIENNE D.I.C. COLLEGE', 4000, 'LIEGE', 'Rue Sur-la-Fontaine', '70', '04-223 20 18', '04-232 17 15', NULL),
(415, 'De l\'Autre CÃ´te de l\'Ecole', 1160, 'AUDERGHEM', 'Chaussee de Wavre', '1789', '02-675 77 02', NULL, NULL),
(416, 'DIVISION PREPARATOIRE A L\'ECOLE ROYALE MILITAIRE', 1020, 'LAEKEN', 'DrÃ¨ve Sainte-Anne', '90', '02-474 48 80', '02-474 47 56', NULL),
(417, 'E.P.S.I.S. Ecole professionnelle secondaire inferieure specialisee libre de Schaltin', 5364, 'SCHALTIN', 'Rue Cardijn', '6', '083-61 19 12', '083-61 52 19', NULL),
(418, 'Ecole \"Pluri-elles\"', 4000, 'LIEGE', 'Rue de Souvret', '71/011', '04-232 20 66', '04-232 20 66', 'plurielles@advalvas.be'),
(419, 'ECOLE AVE MARIA', 5002, 'SAINT-SERVAIS', 'Rue de Bricgniot', '205', '081-73 12 34', '081-74 17 03', 'avemaria.mons@sec.cfwb.be'),
(420, 'Ecole communale de promotion sociale', 5660, 'COUVIN', 'Rue des Bercet', '4', '060-34 68 86', '060-34 68 86', 'jp.mgtx@swing.be'),
(421, 'Ecole communale de promotion sociale d\'Angleur', 4031, 'ANGLEUR', 'Rue de la Vaussale', '2', '04-367 22 23', '04-361 29 73', 'jlamby@ibelgique.com'),
(422, 'ECOLE D\'ARTS ET METIERS', 6560, 'ERQUELINNES', 'Rue Sainte-TherÃ¨se', '47', '071-55 51 27', '071-55 34 40', NULL),
(423, 'Ecole d\'enseignement secondaire specialise communal EPSIS Roger Roch', 7100, 'LA LOUVIERE', 'Rue Gustave Brichant', '60', '064-22 63 01', '064-84 72 38', NULL),
(424, 'Ecole d\'enseignement secondaire specialise de la Communaute franÃ§aise', 6150, 'ANDERLUES', 'Rue Auguste Guerlement', '36', '071-52 79 95', '071-52 23 29', NULL),
(425, 'Ecole d\'enseignement specialise secondaire libre Jean Bosco', 1450, 'CHASTRE-VILLEROUX-BLANMONT', 'Venelle des Sorbiers', '1', '010-65 45 65', '010-65 45 66', 'jeanbosco@freegates.be'),
(426, 'ECOLE D\'HOTELLERIE ET DE TOURISME', 4000, 'LIEGE', 'En-Hors-ChÃ¢teau', '13', '04-223 22 25', '04-222 18 69', 'info@ehtliege.be'),
(427, 'ECOLE DE COIFFURE ET DE BIOESTHETIQUE', 4020, 'LIEGE', 'Rue de Pitteurs', '31', '04-343 92 91', '04-342 59 14', NULL),
(428, 'Ecole de commerce et d\'informatique - Enseignement de promotion sociale', 4000, 'LIEGE', 'Rue Hazinelle', '2', '04-221 37 86', '04-221 43 35', 'CCSCI.liÃƒÂ¨ge@restode.cfwb.be'),
(429, 'Ecole de photographie et de techniques visuelles Agnès Varda', 1020, 'LAEKEN', 'Rue Claessens', '57', '02-422 03 60', '02-422 03 68', 'mail@ecoledephoto.be'),
(430, 'Ecole de promotion sociale \"Vie feminine\"', 7000, 'MONS', 'Rue d\'Havre', '116', '065-36 14 49', '065-40 29 13', NULL),
(431, 'Ecole de Promotion Sociale de la Ville de Saint-Ghislain', 7330, 'SAINT-GHISLAIN', 'Rue QuatriÃ¨me', '42', '065-80 35 21', '065-78 42 73', 'avril.lamberti@eps-saintghislain.be'),
(432, 'Ecole de promotion sociale des Femmes prevoyantes socialistes de Verviers - Reseau Solidaris', 4800, 'VERVIERS', 'Pont Saint-Laurent', '25', '087-30 05 51', '087-30 05 51', 'dorothÃƒÂ©e.noÃƒÂ«l@sec.cfwb.be'),
(433, 'Ecole de promotion sociale des Femmes prevoyantes socialistes de Waremme', 4300, 'WAREMME', 'Avenue de la Resistance', '1A', '019-32 52 32', '019-33 03 05', NULL),
(434, 'Ecole de promotion sociale des Femmes prevoyantes socialistes du Brabant', 1150, 'WOLUWE-SAINT-PIERRE', 'Rue du Duc', '100', '02/334.74.95', '02/332.28.76', NULL),
(435, 'ECOLE DECROLY', 1180, 'UCCLE', 'DrÃ¨ve des Gendarmes', '45', '02-374 17 03', '02-374 02 71', NULL),
(436, 'Ecole des Arts d\'Anderlecht', 1070, 'ANDERLECHT', 'Chaussee de Mons', '882', '02/5206557', '02/5206670', NULL),
(437, 'Ecole des Arts d\'Ixelles', 1050, 'IXELLES', 'Rue Sans-Souci', '128', '02-515 78 50', '02-515 78 55', 'ecart@ixelles.be'),
(438, 'Ecole des Arts d\'Uccle', 1180, 'UCCLE', 'Rue Rouge', '2', '02-375 66 46', '02-348 65 19', NULL),
(439, 'Ecole des Arts de Braine-l\'Alleud', 1420, 'BRAINE-L\'ALLEUD', 'Rue du ChÃ¢teau', '49', '02/854.07.00/01', NULL, 'ecoledesarts@braine-lalleud.be'),
(440, 'Ecole des Arts et Metiers', 4000, 'LIEGE', 'Rue Agimont', '9', '04-223 04 83', '04-223 28 21', 'ps.artsmetiers@ecl.be'),
(441, 'Ecole des Arts et metiers promotion sociale', 6560, 'ERQUELINNES', 'Rue Sainte-TherÃ¨se', '47', '071-55 62 21', '071-59 83 70', NULL),
(442, 'Ecole des Beaux-Arts de Wavre', 1300, 'WAVRE', 'Rue du Chemin de Fer', '18', '010-22 53 31', '010-22 53 31', NULL),
(443, 'Ecole des Femmes prevoyantes socialistes d\'Ans', 4000, 'LIEGE', 'Rue Darchis', '20', '04-223 13 74', '04-223 06 09', 'info@ecolesfps.be'),
(444, 'Ecole des Femmes prevoyantes socialistes de Charleroi', 6000, 'CHARLEROI', 'Avenue des Allies', '2', '071-50 78 23', '071-50 78 37', NULL),
(445, 'Ecole des Femmes prevoyantes socialistes de Liège', 4020, 'LIEGE', 'Quai du Longdoz', '22', '04-223 68 61', '04-223 06 09', 'info@ecolesfps.be'),
(446, 'Ecole des Femmes prevoyantes socialistes de Liège-Seraing', 4000, 'LIEGE', 'Rue Darchis', '20', '04/223.68.61', '04/223.03.02', 'info@ecolesfps.be'),
(447, 'ECOLE DU FUTUR', 7000, 'MONS', 'Rue des Etampes', '2', '065-39 93 40', '065-33 87 55', NULL),
(448, 'Ecole du Manoir d\'Anjou - Ecole secondaire d\'enseignement specialise libre', 1410, 'WATERLOO', 'DrÃ¨ve d\'Argenteuil', '10', '02-372 26 30', '02-372 26 30', 'manoirdanjou@hotmail.com'),
(449, 'ECOLE DU SHAPE SECTION BELGE', 7010, 'SHAPE', 'Avenue de Paris', '705', '065-44 57 08', '065-84 03 43', NULL),
(450, 'Ecole Escale secondaire 1', 1340, 'OTTIGNIES-LOUVAIN-LA-NEUVE', 'Allee de Clerlande', '6', '010/41 42 33', NULL, NULL),
(451, 'Ecole Escale secondaire 2', 1180, 'UCCLE', 'Dieweg', '69a', NULL, NULL, NULL),
(452, 'Ecole Escalpade secondaire', 1300, 'LIMAL', 'Place Albert 1er', '1', '010/.411.054', NULL, NULL),
(453, 'Ecole fondamentale et secondaire communale specialisee Type 5 Leopold Mottet', 4000, 'LIEGE', 'Place Sainte-Walburge', '1', '04-227 79 13', '04-237.57.10', 'sec.mottet@swing.be'),
(454, 'ECOLE HOTELIERE PROVINCIALE DE NAMUR', 5000, 'NAMUR', 'Avenue de l\'Ermitage', '7', '081-77 68 34', '081-43 36 70', 'ecole.hoteliere@province.namur.be'),
(455, 'Ecole industrielle commerciale et de sauvetage', 5060, 'TAMINES', 'Rue du CollÃ¨ge', '27', '071-77 82 02', '071-77 06 58', NULL),
(456, 'Ecole industrielle et commerciale', 7090, 'BRAINE-LE-COMTE', 'Rue de Mons', '87', '067-55 27 57', '067-56 08 64', 'eicb@skynet.be'),
(457, 'Ecole industrielle et commerciale communale de Thuin', 6530, 'THUIN', 'Rue Verte', '1', '071-51 55 04', '071-59 04 69', 'eic.thuin@ecoles.cfwb.be'),
(458, 'Ecole industrielle et commerciale d\'Arlon', 6700, 'ARLON', 'Rue Godefroid Kurth', '2', '063-23 33 90', '063-23 69 17', NULL),
(459, 'Ecole industrielle et commerciale d\'Auvelais', 5060, 'AUVELAIS', 'Rue Hicguet', '19', '071-26 00 30', '071-26 00 34', 'francis.daiche@skynet.be'),
(460, 'Ecole industrielle et commerciale de Courcelles', 6180, 'COURCELLES', 'Pl Franklin D. Roosevelt', '2-3', '071-46 63 50/53', NULL, 'eicourcelles@swing.be'),
(461, 'Ecole industrielle et commerciale de la Ville d\'Andenne', 5300, 'ANDENNE', 'Rue Adeline Henin', '1', '085-84 49 63', '085-24 53 70', 'eic@andenne.be'),
(462, 'Ecole industrielle et commerciale de la Ville de Namur', 5000, 'NAMUR', 'Rue Pepin', '2B', '081-25 74 00', '081-25 74 09', 'ecoleindustrielle-nam@skynet.be'),
(463, 'ECOLE INTERNATIONALE \"LE VERSEAU\" - E.L.C.E.', 1301, 'BIERGES', 'Rue de Wavre', '60', '010-23 17 27', '010-24 39 35', NULL),
(464, 'Ecole Jean-Louis Thys - Cours de promotion sociale', 1090, 'JETTE', 'Rue Esseghem', '101', '02-421 19 15/17', NULL, 'ecolejlt@jette.irisnet.be'),
(465, 'Ecole Les Rocailles - Enseignement secondaire specialise libre', 7110, 'HOUDENG-AIMERIES', 'Rue Salvotte', NULL, '064-22 34 38', '064-22 34 20', 'les.rocailles@skynet.be'),
(466, 'Ecole Namuroise de soins Sainte-Elisabeth', 5000, 'NAMUR', 'Place Louise Godin', '15', '081-72 34 80', '081-73 85 78', 'secretariat.eleves@ecnas-sainte-elisabeth.be'),
(467, 'ecole nationale superieure des Arts visuels de La Cambre', 1000, 'BRUXELLES', 'Abbaye de la Cambre', '21', '+32 2 626 17 80', NULL, 'lacambre@lacambre.be'),
(468, 'Ecole plurielle', 1332, 'GENVAL', 'Rue de la BruyÃ¨re', '98', '0470-67 09 84', NULL, NULL),
(469, 'ECOLE POLYTECHNIQUE DE HERSTAL - ENSEIGNEMENT DE LA PROVINCE DE LIEGE', 4040, 'HERSTAL', 'Rue de l\'Ecole Technique', '34', '04-248 42 00', '04-248 42 04', NULL),
(470, 'ECOLE POLYTECHNIQUE DE HUY- ENSEIGNEMENT DE LA PROVINCE DE LIEGE', 4500, 'HUY', 'Rue Saint-Pierre', '48', '085-27 37 00', '085-27 37 02', NULL),
(471, 'ECOLE POLYTECHNIQUE DE SERAING - ENSEIGNEMENT DE LA PROVINCE DE LIEGE', 4100, 'SERAING', 'Rue de Colard Trouillet', '48', '04-330 72 21', '04-330 72 99', NULL),
(472, 'ECOLE POLYTECHNIQUE DE VERVIERS - ENSEIGNEMENT DE LA PROVINCE DE LIEGE', 4800, 'VERVIERS', 'Rue aux Laines', '69', '04-279 70 70', '04-279 70 50', NULL),
(473, 'ECOLE PROFESSIONNELLE', 5002, 'SAINT-SERVAIS', 'Rue Florent Dethier', '31', '081-72 90 11', '081-74 30 47', 'dir.generale@asty-moulin.be'),
(474, 'Ecole professionnelle d\'enseignement specialise libre', 4430, 'ANS', 'Rue du Zoning', '120', '04-246 29 05', '04-246 43 06', NULL),
(475, 'Ecole professionnelle d\'enseignement specialise libre \"La Cime\"', 1190, 'FOREST', 'Rue de Merode', '398-400', '02-538 27 26', '02-538 06 28', NULL),
(476, 'Ecole professionnelle d\'enseignement specialise libre \"La ClairiÃ¨re\"', 1170, 'WATERMAEL-BOITSFORT', 'Avenue des Hannetons', '58', '02-661 78 58', '02-661 78 59', 'caps.clairiere@sec.cfwb.be'),
(477, 'Ecole professionnelle d\'enseignement specialise libre Saint-Vincent Ferrer', 4020, 'LIEGE', 'Boulevard de Froidmont', '10', '04-343 25 62', '04-343 58 01', 'eps.froidmont.lg@sec.cfwb.be'),
(478, 'Ecole Professionnelle d\'Enseignement Specialise Â« Reumonjoie / Clair Val Â»', 5020, 'MALONNE', 'Chemin de Reumont', '143', '081-44 92 40', '081-44 92 49', 'info@rjcv.be'),
(479, 'Ecole professionnelle Edmond Peeters - EPEP', 1050, 'IXELLES', 'Rue du Viaduc', '97', '02-515 65 20', '02-515 65 25', 'info@epep.be'),
(480, 'Ecole professionnelle secondaire inferieure Saint-Lambert', 5300, 'BONNEVILLE', 'Rue d\'Anton', '302', '085-84 93 95', NULL, NULL),
(481, 'Ecole professionnelle secondaire specialisee \"Le Château Vert\"', 4500, 'BEN-AHIN', 'Chemin de Perwez', '16', '085-61 26 70', '085-61 32 41', NULL),
(482, 'Ecole professionnelle secondaire specialisee Saint-Nicolas', 5000, 'NAMUR', 'Rue de Balart', '44', '081-64 91 75', '081-64 91 76', NULL),
(483, 'Ecole professionnelle specialisee \"La Sitree\"', 5020, 'VEDRIN', 'Rue Pierre Houbotte', '6', '081-20 74 11', '081-20 74 10', 'la.sitree@restode.cfwb.be'),
(484, 'Ecole provinciale d\'agronomie et des sciences de Ciney', 5590, 'CINEY', 'Rue Saint-Quentin', '14', '081-77 67 90', '081-77 69 89', 'ecole.agrosciences@province.namur.be'),
(485, 'Ecole Provinciale des Metiers (E.P.M.)', 1400, 'NIVELLES', 'Chemin du Malgras', '4', '067-63.48.60', '067-21 20 65', NULL),
(486, 'Ecole Reine Astrid', 4420, 'MONTEGNEE', 'Chaussee Churchill', '10', '04-247 16 35', '04-246 51 54', 'direction@ecolereineastrid.be'),
(487, 'ECOLE ROYALE DES SOUS-OFFICIERS NR. 1 DEPARTEMENT FORMATION DES ELEVES', 5500, 'DINANT', 'Rue Arthur Defoin', '215', '082-21 31 10', '082-21 31 99', NULL),
(488, 'ECOLE ROYALE TECHNIQUE QUARTIER COL. AVI RENSON', 3800, 'SINT-TRUIDEN', 'Luikersteenweg', '371', '011-70 24 20', '011-70 26 06', NULL),
(489, 'Ecole Saints-Jean-et-Nicolas', 1030, 'SCHAERBEEK', 'Rue d\'Anethan', '33', '02-218 36 84', '02-218 48 98', NULL),
(490, 'ECOLE SECOND\'AIR \'SINGELIJN\'', 1030, 'SCHAERBEEK', 'Place des Carabiniers', '18A', '02/705.49.25', NULL, NULL),
(491, 'Ecole secondaire à pedagogie active', 7730, 'ESTAIMPUIS', 'Rue de Menin', '4B', NULL, NULL, NULL),
(492, 'Ecole secondaire d\'enseignement specialise Communal \"Les Forges\"', 5590, 'CINEY', 'Quai de l\'Industrie', '28C', '083-21 82 28', '083-21 82 33', NULL),
(493, 'Ecole secondaire d\'enseignement specialise communal I.R.H.O.V.', 4000, 'LIEGE', 'Rue Monulphe', '80', '04-223 62 16', '04-223 68 08', NULL),
(494, 'Ecole secondaire d\'enseignement specialise libre \"Les Trieux\"', 7730, 'LEERS-NORD', 'Rue du Cornet', '47', '056-48 10 10', '056-48 10 19', 'lestrieux@les-trieux.be'),
(495, 'Ecole secondaire d\'enseignement specialise libre \"Saint-Exupery\"', 6142, 'LEERNES', 'Rue de l\'Abbaye d\'Aulne', '2', '071-51 98 08', '071-56 10 65', NULL),
(496, 'Ecole secondaire d\'enseignement specialise libre de Clairval', 6940, 'BARVAUX-SUR-OURTHE', 'Terre aux Ris', '1', '086-21 12 20', '086-21 26 57', NULL),
(497, 'Ecole secondaire d\'enseignement specialise libre du Mardasson', 6600, 'BASTOGNE', 'Rue des Maies', '29', '061-21 23 61', '061-21 68 82', NULL),
(498, 'Ecole secondaire La Plume', 1080, 'MOLENBEEK-SAINT-JEAN', 'Rue Vanderstraeten', '9', NULL, NULL, NULL),
(499, 'ECOLE SECONDAIRE LIBRE SAINT-HUBERT', 6870, 'SAINT-HUBERT', 'Rue Saint-Gilles', '41', '061-23 06 70', NULL, NULL),
(500, 'Ecole secondaire NESPA-BW', 1471, 'GENAPPE', 'Rue de la Sucrerie', '24', NULL, NULL, NULL),
(501, 'Ecole Secondaire Plurielle Karreveld', 1080, 'MOLENBEEK-SAINT-JEAN', 'Chaussee de Gand', '615', '02-206 12 90', NULL, NULL),
(502, 'Ecole Secondaire Plurielle Maritime', 1080, 'MOLENBEEK-SAINT-JEAN', 'Avenue Jean Dubrucq', '175', '02-210 20 90', NULL, NULL),
(503, 'Ecole secondaire professionnelle libre d\'enseignement specialise \"Joie de Vivre\"', 1090, 'JETTE', 'Avenue Jean-Joseph Crocq', '10', '02-478 24 97', '02-479 04 45', 'direction@ecolejdv.be'),
(504, 'ECOLE SECONDAIRE THEO LAMBERT', 1070, 'ANDERLECHT', 'Av Victor et Jules Bertaux', '45', '02-521 91 45', '02-521 43 46', NULL),
(505, 'Ecole superieure des Affaires', 5000, 'NAMUR', 'Rue du CollÃ¨ge', '8', '081-22 15 80', '081-22 31 92', 'secretariat@esa-namur.be'),
(506, 'ecole superieure des Arts - ecole de Recherche graphique', 1060, 'SAINT-GILLES', 'Rue d\'Irlande', '57', '02-538 98 29', '02-539 33 93', 'kelly.josse@erg.be'),
(507, 'ecole superieure des Arts - Saint-Luc de Bruxelles', 1060, 'SAINT-GILLES', 'Rue d\'Irlande', '57', '02-537 08 70', '02-537 00 63', 'info@stluc-bruxelles.be'),
(508, 'ecole superieure des Arts de l\'Image LE 75', 1200, 'WOLUWE-SAINT-LAMBERT', 'Avenue Jean-FranÃ§ois Debecker', '10', '+32 2 761 01 22', NULL, 'secretariat@le75.be'),
(509, 'ecole superieure des Arts de la Ville de Liège', 4000, 'LIEGE', 'Rue des Anglais', '21', '+32 4 221 70 70', NULL, 'arba.liege@sup.cfwb.be'),
(510, 'ecole superieure des Arts du Cirque', 1070, 'ANDERLECHT', 'Avenue Emile Gryzon', '1', '+32 2 526 79 00', NULL, 'info@esac.be'),
(511, 'ecole superieure des Arts Institut Saint-Luc Tournai', 7520, 'RAMEGNIES-CHIN', 'Chaussee de Tournai', '7', '+32 69 25 03 66', NULL, 'secretariat-sup@st-luc-tournai.be'),
(512, 'ecole superieure des Arts Saint-Luc de Liège', 4020, 'LIEGE', 'Boulevard de la Constitution', '41', '+32 4 341 80 00', NULL, 'info@saintluc.com'),
(513, 'Ecole technique provinciale d\'enseignement specialise - Ecole clinique provinciale', 6061, 'MONTIGNIES-SUR-SAMBRE', 'Rue de Lodelinsart', '157', '071-41 13 18', '071-42 04 10', NULL),
(514, 'Enseignement communal de promotion sociale', 7390, 'QUAREGNON', 'Rue Alphonse Brenez', '13', '065-79 32 93', '065-45 75 47', NULL),
(515, 'Enseignement de Promotion et de Formation continue EPFC 1', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'info@epfc.eu'),
(516, 'Enseignement de Promotion et de Formation continue EPFC 2', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'info@epfc.eu'),
(517, 'Enseignement de Promotion et de Formation continue EPFC 3', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'info@epfc.eu'),
(518, 'Enseignement de Promotion et de Formation continue EPFC 4', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'info@epfc.eu'),
(519, 'Enseignement de Promotion et de Formation continue EPFC 5', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'info@epfc.eu'),
(520, 'Enseignement de Promotion et de Formation continue EPFC 6', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'info@epfc.eu'),
(521, 'Enseignement de Promotion et de Formation continue EPFC 7', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'info@epfc.eu'),
(522, 'Enseignement de Promotion et de Formation continue EPFC 8', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'info@epfc.eu'),
(523, 'Enseignement de Promotion et de Formation continue EPFC 9', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Avenue de l\'Astronomie', '19', '02-777 10 10', NULL, 'jahofman@ulb.ac.be'),
(524, 'Enseignement de Promotion sociale d\'Enghien', 7850, 'MARCQ', 'Rue du Village', '50', '02-395 60 23', '02-395 61 51', 'epse@skynet.be'),
(525, 'Enseignement professionnel secondaire inferieur specialise \"L\'Institut libre des Metiers\"', 7500, 'TOURNAI', 'Chaussee de Lille', '198', '069-88 92 61', '069-88 92 73', 'ilm@sylviemichel.be'),
(526, 'Enseignement Professionnel secondaire inferieur specialise libre Saint-François de Sales', 7900, 'LEUZE-EN-HAINAUT', 'Rue Saint-Martin', '3', '069-66 56 50', '069-67 00 83', 'saintfrancois.leuze@gmail.com'),
(527, 'Enseignement secondaire specialise \"Le Snark\"', 7110, 'HOUDENG-AIMERIES', 'Rue du Vivier', '43', '064-22 00 32', '064-22 41 27', NULL),
(528, 'Enseignement secondaire specialise communal \"Les Murets\"', 6180, 'COURCELLES', 'Rue Hubert Bayet', '10', '071-45 66 79', '071-46 63 58', 'Lesmurets.direction@hotmail.Com'),
(529, 'Enseignement secondaire specialise libre Saint-Edouard', 4987, 'STOUMONT', 'Route de l\'AmblÃ¨ve', '88', '080-78 51 47', '080-78 51 00', NULL),
(530, 'Enseignement specialise professionnel libre Jean XXIII', 4610, 'BEYNE-HEUSAY', 'Cite Cowette', '18', '04-358 43 86', '04-358 47 06', 'jean23@skynet.be'),
(531, 'Enseignement specialise secondaire libre Ecole Artisanale populaire', 6110, 'MONTIGNY-LE-TILLEUL', 'Rue Wilmet', '42', '071-51 59 98', '071-43 06 90', 'direction@ecoleartisanale.be'),
(532, 'EPHEC Enseignement superieur de promotion sociale', 1200, 'WOLUWE-SAINT-LAMBERT', 'Avenue Konrad Adenauer', '3', '02-775 97 01', '02-775 97 03', 'eps@ephec.be'),
(533, 'EPSIS Le Foyer', 7601, 'ROUCOURT', 'Place de Roucourt', '11', '069-77 99 00', '069-77 99 05', 'epsis.le.foyer@skynet.be'),
(534, 'Espace formations - Enseignement de promotion sociale', 6230, 'PONT-A-CELLES', 'Rue de l\'Atelier Central', '2', '071-84 70 00', '071-84 09 55', NULL),
(535, 'etablissement Communal d\'Enseignement de Promotion sociale - Charleroi Cours menagers', 6000, 'CHARLEROI', 'Rue des Olympiades', NULL, '071-32  51 99', NULL, NULL),
(536, 'etablissement Communal d\'Enseignement de Promotion sociale - Couillet', 6010, 'COUILLET', 'Rue Alfred Nobel', '3', '071-43 48 08', NULL, NULL),
(537, 'etablissement Communal d\'Enseignement de Promotion sociale - Gilly', 6060, 'GILLY', 'Place Jules Destree', '9', '071-41 26 64', '071-41 26 64', 'eigilly@yahoo.fr'),
(538, 'etablissement Communal d\'Enseignement de Promotion sociale - Jumet', 6040, 'JUMET', 'Rue Jean-Baptiste Ledoux', '23A', '071-34 08 12', '071-34 08 12', 'eceps.jumet@charleroi.be'),
(539, 'etablissement Communal d\'Enseignement de Promotion sociale - Marchienne-au-Pont', 6030, 'MARCHIENNE-AU-PONT', 'Rue Georges Tourneur', '1', '071-51 60 88', '071-51 74 58', 'ecmarchienne@gmail.com'),
(540, 'etablissement Communal d\'Enseignement de Promotion sociale - Marcinelle/Monceau', 6001, 'MARCINELLE', 'Rue du Chemin Vert', '66', '071-36 50 39', '071-36 50 39', 'Direction.eimm@hotmail.com'),
(541, 'etablissement Communal d\'Enseignement de Promotion sociale - Mont-sur-Marchienne', 6032, 'MONT-SUR-MARCHIENNE', 'Rue Louise Michel', '6', '071-43 07 76', '071-43 41 82', NULL),
(542, 'etablissement Communal d\'Enseignement de Promotion sociale-Charleroi Langues', 6000, 'CHARLEROI', 'Boulevard Emile Devreux', '27', '071-33 30 43', '071-30 48 97', 'ccc.charle@brutele.be'),
(543, 'Etablissement communal d\'enseignement technique industriel et commercial', 6200, 'CHATELET', 'Place de l\'HÃ´tel de Ville', '6', '071-38 59 72', '071-40 23 00', 'ecetic@outlook.com'),
(544, 'Etablissement d\'enseignement professionnel specialise communal', 7060, 'HORRUES', 'Chemin Ã  Rocs', '4', '067-33 41 04', '067-33 47 02', NULL),
(545, 'Etablissement d\'enseignement secondaire specialise de la Communaute franÃ§aise', 4540, 'AMAY', 'Rue d\'Ampsin', '9', '085-31 41 40', '085-31 76 14', 'eesscf.amay@sec.cfwb.be'),
(546, 'Etablissement d\'enseignement secondaire specialise de la Communaute franÃ§aise \"Le TrÃ¨fle\"', 7740, 'PECQ', 'Rue de Lannoy', '53', '069-22 75 82', '069-21 56 16', NULL),
(547, 'Etablissement d\'enseignement specialise primaire et secondaire de la Communaute franÃ§aise', 1160, 'AUDERGHEM', 'Avenue Charles Schaller', '87', '02-672 33 81', '02-660 14 38', 'direction@ecoleschaller.org'),
(548, 'Etablissement d\'enseignement specialise primaire et secondaire de la Communaute franÃ§aise \"Henri Rikir\"', 4041, 'MILMORT', 'Rue de Fexhe', '76', '04-278 56 90', '04-278 01 17', 'escf.milmort@sec.cfwb.be'),
(549, 'Etablissement d\'enseignement specialise primaire et secondaire de la Communaute franÃ§aise \"L\'Envol\"', 4400, 'FLEMALLE-HAUTE', 'Rue du Herdier', '6', '04-275 58 88', '04-275 36 13', NULL),
(550, 'Etablissement d\'enseignement specialise secondaire de la Communaute franÃ§aise', 4800, 'VERVIERS', 'Rue des Wallons', '59', '087-35 53 26', '087-35 40 58', 'directeur.eesscfv@skynet.be'),
(551, 'Etablissement des Soeurs de Notre-Dame', 5000, 'NAMUR', 'Rue du Lombard', '41', '081-25 50 10', '081-22 02 38', NULL),
(552, 'Etablissement libre d\'enseignement secondaire specialise \"Le Soleil Levant\"', 6061, 'MONTIGNIES-SUR-SAMBRE', 'Rue Grimard', '175', '071-32 46 23', '071-32 38 98', 'ecole_soleil_levant@hotmail.com'),
(553, 'Etablissement mixte d\'enseignement secondaire specialise Maghin-Outremeuse', 4000, 'LIEGE', 'Rue Maghin', '22', '04-227 30 31', '04-343 63 13', NULL),
(554, 'Faculte universitaire de Theologie protestante', 1040, 'ETTERBEEK', 'Rue des Bollandistes', '40', '02-735 67 46', '02/7354731', 'info@protestafac.ac.be'),
(555, 'Format 21 - Centre de formation continuee \"Gustave Piton\"', 7100, 'LA LOUVIERE', 'Jean-Baptiste Berger', '1', '064-236-900', '064-21 33 11', 'info@format21.com'),
(556, 'Haute ecole Albert Jacquard', 5000, 'NAMUR', 'Rue  Godefroid', '32', '+32 81 23 43 80', NULL, 'presidence@heaj.be'),
(557, 'Haute ecole Bruxelles-Brabant', 1180, 'UCCLE', 'Chaussee de Waterloo', '749', '+32 2 340 12 95', NULL, 'info@he2b.be'),
(558, 'Haute ecole Charlemagne', 4000, 'LIEGE', 'Rue des Rivageois', '6', '+32 4 254 76 11', NULL, 'secr.presidence@hech.be'),
(559, 'Haute ecole de la Province de Liège', 4101, 'JEMEPPE-SUR-MEUSE', 'Avenue Montesquieu', '6', '+32 4 237 95 86', NULL, 'hepl@provincedeliege.be'),
(560, 'Haute ecole de la Province de Namur', 5000, 'NAMUR', 'Rue Henri BlÃ¨s', '192', '+32 81 77 67 56', NULL, 'haute.ecole@province.namur.be'),
(561, 'Haute ecole de la Ville de Liège', 4000, 'LIEGE', 'Rue Hazinelle', '2', '+32 4 238 38 00', NULL, 'info@hel.be'),
(562, 'Haute ecole de Namur-Liège-Luxembourg', 5002, 'SAINT-SERVAIS', 'Rue Saint-Donat', '130', '+32 81 46 85 00', NULL, 'info@henallux.be'),
(563, 'Haute ecole en Hainaut', 7000, 'MONS', 'Rue Pierre-Joseph Dumenil', '4', '+32 65 34 79 83', NULL, 'info@heb.be'),
(564, 'Haute ecole Ephec', 1200, 'WOLUWE-SAINT-LAMBERT', 'Avenue Konrad Adenauer', '3', '+32 2 772 65 75', NULL, 'ephec@ephec.be'),
(565, 'Haute ecole Francisco Ferrer', 1000, 'BRUXELLES', 'Rue de la Fontaine', '4', '+32 2 279 58 10', NULL, 'info@he-ferrer.eu'),
(566, 'Haute ecole Galilee', 1030, 'SCHAERBEEK', 'Rue Royale', '336', '+32 2 613 19 20', NULL, 'heg@galilee.be'),
(567, 'Haute Ecole ICHEC - ECAM - ISFSC', 1150, 'WOLUWE-SAINT-PIERRE', 'Boulevard Brand Whitlock', '6', '+32 2 739 37 11', NULL, 'info@isfsc.be'),
(568, 'Haute ecole Leonard de Vinci', 1200, 'WOLUWE-SAINT-LAMBERT', 'Place de l\'Alma', '2', '+32 2 761 06 80', NULL, 'info@vinci.be'),
(569, 'Haute ecole Libre de Bruxelles Ilya Prigogine', 1190, 'FOREST', 'Avenue Besme', '97', '+32 2 349 68 11', NULL, 'direction.presidence@helb-prigogine.be'),
(570, 'Haute ecole Libre Mosane', 4000, 'LIEGE', 'Mont Saint-Martin', '41', '+32 4 222 22 00', NULL, 'info@helmo.be'),
(571, 'Haute ecole Louvain en Hainaut', 7000, 'MONS', 'Chaussee de Binche', '159', '+32 65 40 41 41', NULL, 'info@helha.be'),
(572, 'Haute ecole Lucia de Brouckère', 1070, 'ANDERLECHT', 'Avenue Emile Gryson', '1', '+32 2 526 75 24', NULL, 'info@heldb.be'),
(573, 'Haute ecole provinciale de Hainaut - Condorcet', 7000, 'MONS', 'Chemin du Champ de Mars', '17', '+32 65 40 12 20', NULL, NULL),
(574, 'Haute ecole Robert Schuman', 6800, 'LIBRAMONT', 'Rue Fontaine aux MÃ»res', '13B', '+32 61 23 01 20', NULL, 'dp@hers.be'),
(575, 'Heureux Abri Momignies - Enseignement Secondaire Specialise', 6590, 'MOMIGNIES', 'Rue Mahy', '11', '060-51 10 06', '060-51 18 77', NULL),
(576, 'HOGESCHOOL GENT VESALIUS DEPARTEMENT GEZONDHEIDSZORG', 9600, 'RENAIX', 'Rue de Ninove', '161', NULL, NULL, NULL),
(577, 'Institut \"Etienne Meylaers\" Enseignement specialise primaire et secondaire de la Communaute Française', 4030, 'GRIVEGNEE', 'Rue Nicolas Spiroux', '62', '04-365 92 57', '04-365 94 61', NULL),
(578, 'Institut auderghemois de promotion sociale', 1160, 'AUDERGHEM', 'Chaussee de Wavre', '1649', '02-673 09 25', NULL, 'info@iaps.be'),
(579, 'INSTITUT BISCHOFFSHEIM', 1000, 'BRUXELLES', 'Rue de la Blanchisserie', '52', '02-250 07 00', '02-250 07 28', 'sec.blanchisserie@brucity.education'),
(580, 'INSTITUT CARDIJN LORRAINE - ENSEIGNEMENT GENERAL', 6791, 'ATHUS', 'Rue Luttgens', '10', '063-38 12 20', '063-38 12 26', NULL),
(581, 'INSTITUT CARDIJN LORRAINE - ENSEIGNEMENT TECHNIQUE ET PROFESSIONNEL', 6700, 'ARLON', 'Rue de NeufchÃ¢teau', '69', '063-24 28 50', '063-24 28 51', 'institut.arlon@cardijn.be'),
(582, 'Institut communal d\'enseignement professionnel specialise des Polders', 1180, 'UCCLE', 'Rue des Polders', '51-53', '02-377 48 73', '02-378 37 48', NULL),
(583, 'INSTITUT COMMUNAL D\'ENSEIGNEMENT SECONDAIRE', 7390, 'QUAREGNON', 'Grand-Place', '3', '065-77 72 68', '065-52 94 49', 'ices.quaregnon@sec.cfwb.be'),
(584, 'INSTITUT COMMUNAL D\'ENSEIGNEMENT TECHNIQUE', 7711, 'DOTTIGNIES', 'Rue de France', '65', '056-85 44 70', NULL, NULL),
(585, 'INSTITUT COMMUNAL MARIUS RENARD', 1070, 'ANDERLECHT', 'Rue Georges Moreau', '107', '02-529 44 60', '02-523 75 24', NULL),
(586, 'INSTITUT COMMUNAL TECHNIQUE FRANS FISCHER', 1030, 'SCHAERBEEK', 'Rue General Eenens', '66', '02-240 17 80', '02-240 17 89', NULL),
(587, 'INSTITUT D\'ENSEIGNEMENT CARDINAL MERCIER', 1410, 'WATERLOO', 'Chemin des Roussettes', '10', '02-386 15 47', '02-386 15 61', 'institut@collegecardinalmercier.be'),
(588, 'Institut d\'enseignement de promotion sociale de la Communaute franÃ§aise', 1140, 'EVERE', 'Avenue Constant Permeke', '4', '02-701 97 97', '02-701 97 90', 'info@iepsEvere.be'),
(589, 'Institut d\'enseignement de promotion sociale de la Communaute franÃ§aise - Cadets', 5000, 'NAMUR', 'Pl de l\'Ecole des Cadets', '6', '081-22 29 03', '081-22 85 87', 'info@iepscf-namur.be'),
(590, 'Institut d\'enseignement de promotion sociale de la Communaute franÃ§aise - Cefor', 5000, 'NAMUR', 'Boulevard Cauchy', '9-10', '081-25 51 80', NULL, 'cefor.ieps.namur@sec.cfwb.be'),
(591, 'Institut d\'enseignement de promotion sociale de la Communaute franÃ§aise - Ecole de Marechalerie', 1070, 'ANDERLECHT', 'Rue Leon Delacroix', '28', '02-410 26 73', '02-410 66 45', 'ecoledemarechalerie@hotmail.com'),
(592, 'Institut d\'enseignement de promotion sociale de la Communaute franÃ§aise de Dison', 4820, 'DISON', 'Avenue Jardin Ecole', '87', '087-23 04 60', '087-22 41 21', 'iepscf.verviers@sec.cfwb.be'),
(593, 'Institut d\'enseignement de promotion sociale de la Communaute franÃ§aise de Peruwelz', 7600, 'PERUWELZ', 'Boulevard Leopold III', '40', '069-77 10 35', '069-77 64 72', NULL),
(594, 'Institut d\'enseignement de promotion sociale de la Communaute franÃ§aise Jemappes-Quievrain', 7012, 'JEMAPPES', 'Avenue Roi Albert', '643', '065-88 15 00', '065-82 38 18', 'administration@iepsjemappes.be'),
(595, 'Institut d\'enseignement de promotion sociale de la Communaute franÃ§aise Rixensart-Court-Saint-Etienne-Jodoigne', 1330, 'RIXENSART', 'Rue Albert Croy', '3', '02-654 00 30', '02-652 25 46', 'ieps.courtstetienne@restode.cfwb.be'),
(596, 'INSTITUT D\'ENSEIGNEMENT DES ARTS, TECHNIQUES, SCIENCES ET ARTISANAT - I.A.T.A.', 5000, 'NAMUR', 'Rue de la Montagne', '43A', '081-25 60 60', '081-25 60 85', 'iata@iata.be'),
(597, 'INSTITUT D\'ENSEIGNEMENT SECONDAIRE COMPLEMENTAIRE CATHOLIQUE - I.E.S.C.A.', 7301, 'HORNU', 'Rue de Mons', '63', '065-77 94 68', '065-79 39 32', 'delgusted.iesca@gmail.com'),
(598, 'Institut d\'enseignement secondaire des Sacres-Coeurs', 1410, 'WATERLOO', 'Place Albert Ier', NULL, '02-354 01 86', '02-354 98 29', 'isc.wellington@belgacom.net'),
(599, 'INSTITUT D\'ENSEIGNEMENT SECONDAIRE PARAMEDICAL PROVINCIAL', 7000, 'MONS', 'Bld President Kennedy', '2A', '065-32 89 00', '065-32 89 09', NULL),
(600, 'INSTITUT D\'ENSEIGNEMENT SECONDAIRE PROVINCIAL PARAMEDICAL', 7500, 'TOURNAI', 'Rue de la Lys', '1', '069-88 40 60', '069-88 40 61', NULL),
(601, 'INSTITUT D\'ENSEIGNEMENT SECONDAIRE SAINT-LUC', 4000, 'LIEGE', 'Rue Louvrex', '111', '04-232 99 80', '04-221 19 84', 'ies.stluc.liege@sec.cfwb.be'),
(602, 'Institut d\'enseignement secondaire specialise libre \"La Porte Ouverte\"', 7903, 'BLICQUY', 'Rue du Couvent', '42', '069-64 69 50', '069-64 69 59', 'ademan@belgacom.net'),
(603, 'Institut d\'enseignement secondaire specialise libre \"Le Tremplin\"', 7700, 'MOUSCRON', 'Rue de la Bouverie', '25', '056-85 47 80', '056-85 47 83', 'secretariat@letremplinmouscron.be'),
(604, 'Institut d\'enseignement secondaire specialise libre \"Les BruyÃ¨res\"', 6120, 'JAMIOULX', 'Rue du Sanatorium', '74', '071-36 06 24', '071-43 17 31', NULL),
(605, 'Institut d\'enseignement secondaire specialise libre Notre-Dame de Joie', 1000, 'BRUXELLES', 'Rue Ernest Allard', '28', '02-512 85 22', '02-512 27 52', NULL),
(606, 'Institut d\'enseignement specialise Alexandre Herlin', 1082, 'BERCHEM-SAINTE-AGATHE', 'Rue de Dilbeek', '1', '02-465 59 60', '02-465 67 11', 'mgolbert@skynet.be'),
(607, 'Institut d\'enseignement specialise fondamental et secondaire provincial Rene ThÃ´ne', 6030, 'MARCHIENNE-AU-PONT', 'Rue de Beaumont', '266', '071-29 19 14', '071-56 05 19', NULL),
(608, 'Institut d\'enseignement specialise maternel, primaire et secondaire de la Communaute franÃ§aise \"Les Orchidees - Les Lauriers', 4280, 'HANNUT', 'Rue de Huy', '28', '019-51 32 83', '019-51 35 68', NULL),
(609, 'Institut d\'enseignement specialise primaire et secondaire de la Communaute franÃ§aise', 7911, 'FRASNES-LEZ-BUISSENAL', 'Route de Lessines', '27', '069-86 68 55', '069-86 85 67', NULL),
(610, 'Institut d\'enseignement specialise primaire et secondaire de la Communaute franÃ§aise \"Mariette Delahaut\"', 5100, 'JAMBES', 'Rue de Sedent', '28', '081-33 16 31', '081-33 16 34', 'delahaut.sectionprimaire@skynet.be'),
(611, 'Institut d\'enseignement technique de Mecanique et d\'Electricite - Marguerite Massart', 1000, 'BRUXELLES', 'Boulevard de l\'Abattoir', '50', '02-279 52 60', '02-279 52 96', 'sec.itme@brucity.education'),
(612, 'INSTITUT D\'ENSEIGNEMENT TECHNIQUE DON BOSCO', 4800, 'VERVIERS', 'Rue des Allies', '70', '087-33 20 08', '087-33 95 29', NULL),
(613, 'INSTITUT D\'ENSEIGNEMENT TECHNIQUE NOTRE-DAME', 6000, 'CHARLEROI', 'Rue de la Science', '50-62', '071-30 23 30', '071-31 54 10', 'info@iet-notre-dame.be'),
(614, 'INSTITUT D\'ENSEIGNEMENT TECHNIQUE SAINT-ELOI', 7900, 'LEUZE-EN-HAINAUT', 'Tour Saint-Pierre', '11', '069-66 96 10', '069-66 96 29', 'cespdir@skynet.be'),
(615, 'Institut de formation continuee', 4000, 'LIEGE', 'Rue Jonfosse', '80', '04-223 67 17', '04-223 67 17', NULL),
(616, 'Institut de Formation de cadres pour le Developpement', 1050, 'IXELLES', 'Avenue Legrand', '57', '02-640 46 69', '02-649 41 09', 'ifcad@ibelgique.com'),
(617, 'Institut de formation superieure de Wavre - IFOSUP', 1300, 'WAVRE', 'Rue de la Limite', '6', '010-22 20 26', '010-24 52 46', 'ifosupwavre@ifosupwavre.be'),
(618, 'INSTITUT DE L\'ASSOMPTION', 1170, 'WATERMAEL-BOITSFORT', 'Avenue Alfred Solvay', '4', '02-663 82 90', NULL, 'secretariat@assomption-edu.be'),
(619, 'INSTITUT DE L\'ENFANT-JESUS', 1040, 'ETTERBEEK', 'Rue General Leman', '74', '02-230 46 04', '02-230 05 33', 'iej.2082@ens.irisnet.be'),
(620, 'INSTITUT DE L\'ENFANT-JESUS LYCEE', 1400, 'NIVELLES', 'Rue de Sotriamont', '1', '067-89 38 00', '067-89 38 01', 'icj.lycee.nivelles@sec.cfwb.be'),
(621, 'INSTITUT DE L\'INSTRUCTION CHRETIENNE-ABBAYE DE FLONE', 4540, 'AMAY', 'Chaussee Romaine', '2', '085-31 13 34', '085-31 61 98', 'institut@flone.be'),
(622, 'INSTITUT DE LA CONSTRUCTION, DES ARTS DECORATIFS ET DE L\'INFOGRAPHIE', 4000, 'LIEGE', 'Rue de Fragnee', '76', '04-252 16 25', '04-252 20 33', 'icadi68@swing.be'),
(623, 'Institut de la Parure et de la Bijouterie Jeanne Toussaint', 1000, 'BRUXELLES', 'Boulevard de l\'Abattoir', '50', '02-279 51 15', '02-279 51 19', 'info@parure-bijouterie.be'),
(624, 'INSTITUT DE LA PROVIDENCE', 1070, 'ANDERLECHT', 'Rue Haberman', '27', '02-523 01 82', '02-521 67 44', NULL),
(625, 'Institut de la Providence Enseignement secondaire specialise', 6740, 'ETALLE', 'Rue Saint-Antoine', '199A', '063-45 52 12', '063-45 54 61', 'direction@ecoleprovidence.be'),
(626, 'Institut de la Providence Humanites', 6041, 'GOSSELIES', 'Faubourg de Bruxelles', '105', '071-34 93 10', '071-35 49 56', 'gph@gph.be'),
(627, 'Institut de la Sainte Famille I.S.F.', 6760, 'VIRTON', 'Rue de Montmedy', '2', '063-58 88 60', '063-58 88 70', 'isf.virton@sec.cfwb.be'),
(628, 'INSTITUT DE LA SAINTE-FAMILLE', 7000, 'MONS', 'Avenue du Tir', '12', '065-40 23 23', '065-40 23 25', 'dir.isf@ursulines-mons.be'),
(629, 'INSTITUT DE LA SAINTE-FAMILLE D\'HELMET', 1030, 'SCHAERBEEK', 'Rue Chaumontel', '9', '02-216 61 81', '02-245 89 27', 'direction@sainte-famille.be'),
(630, 'INSTITUT DE LA SAINTE-UNION', 7370, 'DOUR', 'Rue du Roi Albert', '10', '065-65 28 45', '065-63 26 60', NULL),
(631, 'INSTITUT DE LA VALLEE BAILLY (Enseignement general)', 1420, 'BRAINE-L\'ALLEUD', 'Rue de la Vallee Bailly', '102', '02-389 49 50', '02-384 19 33', NULL),
(632, 'INSTITUT DE LA VALLEE BAILLY (Enseignement technique)', 1420, 'BRAINE-L\'ALLEUD', 'Rue de la Vallee Bailly', '102', '02-389 49 50', '02-384 19 33', NULL),
(633, 'INSTITUT DE LA VIERGE FIDELE', 1030, 'SCHAERBEEK', 'Place de Jamblinne de Meux', '14', '02-736 84 97', '02-734 25 61', 'secretariat@vf-bxl.be'),
(634, 'INSTITUT DE MOT-COUVREUR', 1000, 'BRUXELLES', 'Pl Nouveau Marche Grains', '24', '02-505 59 00', '02-505 59 08', 'sec.couvreur@brucity.education'),
(635, 'INSTITUT DE RADIOELECTRICITE ET CINEMATOGRAPHIE', 1190, 'FOREST', 'Avenue Victor Rousseau', '75', '02-340 11 00', '02-340 11 16', 'inraci@inraci.be'),
(636, 'Institut de rythmique Jaques-Dalcroze de Belgique', 1060, 'SAINT-GILLES', 'Rue Henri Wafelaerts', '53', '02-537 47 93', '02-648 20 64', 'officedalcroze@gmail.com'),
(637, 'Institut de techniques artisanales', 4020, 'LIEGE', 'Rue de la Liberte', '27', '04-343 90 47', '04-349 08 90', NULL),
(638, 'Institut de technologie - Enseignement de promotion sociale', 4020, 'LIEGE', 'Quai du Condroz', '15', '04-343 48 60', '04-343 48 60', 'info@itlg.be'),
(639, 'Institut de Travaux publics - Enseignement de promotion sociale', 4000, 'LIEGE', 'Rue Pouplin', '27', '04-222 02 62', '04-222 02 62', 'direction@itplg.be'),
(640, 'Institut Decroly - Secondaire', 1180, 'UCCLE', 'Rue du Bambou', '9', '02-332 02 39', '02-332 06 78', NULL),
(641, 'Institut des Arts de Diffusion', 1348, 'LOUVAIN-LA-NEUVE', 'Route de Blocry', '5', '+32 10 33 02 00', NULL, 'iad@iad-arts.be'),
(642, 'INSTITUT DES ARTS ET METIERS', 1000, 'BRUXELLES', 'Boulevard de l\'Abattoir', '50', '02-279 52 20', '02-279 52 29', 'sec.iam@brucity.education'),
(643, 'Institut des carrières commerciales', 1000, 'BRUXELLES', 'Rue de la Fontaine', '4', '02-279 58 40', NULL, 'icc@brucity.education'),
(644, 'INSTITUT DES DAMES DE MARIE', 1200, 'WOLUWE-SAINT-LAMBERT', 'Rue Vergote', '40', '02-743 27 90', '02 732 69 30', 'info@ddm-vergote.be'),
(645, 'INSTITUT DES FILLES DE MARIE', 1060, 'SAINT-GILLES', 'Rue Theodore Verhaegen', '8', '02-537 78 51', '02-543 34 12', NULL),
(646, 'INSTITUT DES FRERES MARISTES', 7700, 'MOUSCRON', 'Rue des Etudiants', '8', '056-33 12 60', '056-33 24 46', NULL),
(647, 'Institut des Langues modernes - Enseignement de promotion sociale', 4000, 'LIEGE', 'Rue Hazinelle', '2', '04-223 34 22', '04-221 31 72', NULL),
(648, 'Institut des Metiers de la Construction et de l\'Environnement', 6560, 'ERQUELINNES', 'Rue  de Maubeuge', '172', '071-55 59 65', '071-55 68 88', NULL),
(649, 'Institut des Soeurs de Notre-Dame', 1070, 'ANDERLECHT', 'Rue de Veeweyde', '40', '02-521 04 41', '02-526 13 29', NULL),
(650, 'INSTITUT DES TECHNIQUES ET DES COMMERCES AGRO-ALIMENTAIRES', 5020, 'SUARLEE', 'Chaussee de Nivelles', '204', '081-56 90 64', '081-56 90 83', 'itca.direction@skynet.be'),
(651, 'INSTITUT DES TECHNIQUES HOSPITALIERES (I.T.E.H.O) JEANNE D\'ARC', 7500, 'TOURNAI', 'Quai des Salines', '28', '069-89 05 10', '069-89 05 12', NULL),
(652, 'INSTITUT DES URSULINES', 1081, 'KOEKELBERG', 'Rue Jules Debecker', '71', '02-414 11 11', '02-414 01 69', NULL),
(653, 'INSTITUT DES URSULINES - LA MADELEINE', 7500, 'TOURNAI', 'Rue des Carmes', '10', '069-22 96 35', '069-22 23 23', 'ulm@skynet.be'),
(654, 'INSTITUT DIDEROT', 1000, 'BRUXELLES', 'Rue des Capucins', '58', '02-289 63 00', '02-289 63 17', 'idid.capucins@brucity.education'),
(655, 'INSTITUT DOMINIQUE PIRE', 1000, 'BRUXELLES', 'Rue De Lenglentier', '6-14', '02-511 53 22', '02-502 77 14', 'secretariat.direction.idpire@ens.irisnet.be'),
(656, 'INSTITUT DON BOSCO', 1150, 'WOLUWE-SAINT-PIERRE', 'Avenue du Val d\'Or', '90 D', '02-771 01 02', '02-771 50 77', 'direction@idbbxl.com'),
(657, 'Institut Don Bosco - Promotion sociale', 4800, 'VERVIERS', 'Rue des Allies', '57', '087-30 01 87', '087-35 19 12', 'info@donbosco-ps.be'),
(658, 'INSTITUT DU SACRE COEUR - ENSEIGNEMENT SECONDAIRE GENERAL', 7000, 'MONS', 'Rue des Dominicains', '9', '065-40 28 44', '065-40 28 36', 'info@iscmons.be'),
(659, 'INSTITUT DU SACRE-COEUR', 1400, 'NIVELLES', 'Rue Saint-Jean', '2', '067-21 95 71', '067-84 18 19', 'isc.nivelles@skynet.be'),
(660, 'Institut El Hikma - La Sagesse', 1190, 'FOREST', 'Rue Saint Denis', '296', '02-770 44 12', NULL, NULL),
(661, 'Institut Emile Gryzon', 1070, 'ANDERLECHT', 'Avenue Emile Gryson', '1', '02-526 74 00', '02-526 74 03', 'sec.gryzon@spfb.edu.brussels'),
(662, 'INSTITUT ILON SAINT-JACQUES', 5000, 'NAMUR', 'Rue des Carmes', '12', '081-25 37 81', '081-22 61 87', NULL),
(663, 'INSTITUT JEAN XXIII', 5580, 'ROCHEFORT', 'Rue de la SauveniÃ¨re', '7', '084-21 13 45', '084-22 12 26', NULL),
(664, 'Institut Jean-Pierre Lallemand', 1000, 'BRUXELLES', 'Rue du Meiboom', '16-18', '02-513 60 93', '02-513 27 79', 'info@institutlallemand.be'),
(665, 'INSTITUT LA VERTU', 1030, 'SCHAERBEEK', 'Chaussee de Haecht', '138', '02-240 45 30', '02-736 37 39', NULL),
(666, 'Institut libre de formation permanente', 5000, 'NAMUR', 'Avenue Cardinal Mercier', '49', '081-22 19 98', '081-22 19 98', NULL),
(667, 'INSTITUT LIBRE DU CONDROZ SAINT-FRANCOIS', 4590, 'OUFFET', 'Rue du Perron', '31', '086-36 60 79', '086-36 65 45', NULL),
(668, 'Institut libre luxembourgeois d\'enseignement de promotion sociale - Arts et Metiers Pierrard', 6690, 'VIELSALM', 'Rue des Chars-Ã -boeufs', '12', '063-58 89 30', '080-21 50 67', NULL),
(669, 'Institut Machtens - Enseignement communal de promotion sociale', 1080, 'MOLENBEEK-SAINT-JEAN', 'Rue Tazieaux', '25', '02-411 99 99', '02-411 99 99', 'machtens.promsoc@sec.cfwb.be'),
(670, 'INSTITUT MARIA GORETTI', 4031, 'ANGLEUR', 'Rue de Renory', '101', '04-344 97 40', '04-344 97 60', 'inst.maria.goretti@skynet.be'),
(671, 'INSTITUT MARIE IMMACULEE', 1070, 'ANDERLECHT', 'Rue des Resedas', '51', '02-521 63 25', '02-521 63 73', NULL),
(672, 'INSTITUT MARIE-THERESE', 4000, 'LIEGE', 'Rue Delfosse', '25', '04-222 04 05', '04-223 46 82', 'contact@marie-therese.liege.be'),
(673, 'INSTITUT MARIS STELLA', 1020, 'LAEKEN', 'Rue Felix Sterckx', '44', '02-478 63 95', '02-478 52 98', NULL),
(674, 'Institut medico-pedagogique provincial Rene Thône La Louvière', 7100, 'LA LOUVIERE', 'Rue du Temple', '3-5', '064-23 60 24', '064-26 39 52', NULL),
(675, 'Institut medico-pedagogique provincial Rene Thône Marcinelle - \"Ateliers Apri\"', 6001, 'MARCINELLE', 'Rue du DebarcadÃ¨re', '100', '071-44 64 80', '071-44 64 74', NULL),
(676, 'Institut Montjoie', 1180, 'UCCLE', 'Avenue Montjoie', '93-95', '02-344 52 28', '02-344 20 54', NULL),
(677, 'Institut national superieur des Arts du Spectacle et des Techniques de Diffusion', 1000, 'BRUXELLES', 'Rue Theresienne', '8', '+32 2 511 92 86', NULL, 'info@insas.be'),
(678, 'INSTITUT NOTRE-DAME', 1070, 'ANDERLECHT', 'Rue de Fiennes', '66', '02-522 18 73', '02-522 19 10', 'contact@ind1070.be'),
(679, 'Institut Notre-Dame d\'Arlon - 2e et 3e degres', 6700, 'ARLON', 'Rue Joseph Netzer', '21', '063-24 52 10', '063-24 52 11', NULL),
(680, 'Institut Notre-Dame d\'Arlon D.O.A.', 6700, 'ARLON', 'Rue Joseph Netzer', '21', '063-24 52 10', '063-24 52 11', NULL),
(681, 'INSTITUT NOTRE-DAME DE BONNE-ESPERANCE', 7090, 'BRAINE-LE-COMTE', 'Rue des Postes', '101', '067-55 22 75', '067-55 74 15', NULL),
(682, 'INSTITUT NOTRE-DAME DE JUPILLE', 4020, 'JUPILLE-SUR-MEUSE', 'Rue Charlemagne', '47', '04-345 64 70', '04-370 01 76', NULL),
(683, 'INSTITUT NOTRE-DAME DE LOURDES', 1020, 'LAEKEN', 'Rue Edmond Tollenaere', '32', '02-424 09 23', '02-425 14 10', NULL),
(684, 'INSTITUT NOTRE-DAME DE LOVERVAL', 6280, 'GERPINNES', 'Chaussee de Philippeville', '35', '071-29 75 70', '071-47 26 16', NULL),
(685, 'Institut Notre-Dame du Sacre-Coeur', 5570, 'BEAURAING', 'Rue de Rochefort', '92', '082-71 17 97', '082-71 40 00', 'secretariat@indsc-beauraing.be'),
(686, 'INSTITUT NOTRE-DAME SEMINAIRE 1er DEGRE', 6600, 'BASTOGNE', 'Rue des Ecoles', '20', '061-21 22 14', '061-21 22 69', NULL),
(687, 'INSTITUT NOTRE-DAME SEMINAIRE 2e et 3e DEGRES', 6600, 'BASTOGNE', 'Rue Piconrue', '6', '061-24 06 30', '061-24 06 39', NULL),
(688, 'INSTITUT PARIDAENS', 6500, 'BEAUMONT', 'Grand Place', '12', '071-23 10 50', '071-58 93 86', NULL),
(689, 'Institut Paul Hankar des technologies de la Communication, de la Construction et des Metiers d\'Art', 1000, 'BRUXELLES', 'Boulevard de l\'Abattoir', '50', '02-279 51 50', '02-279 51 59', 'hankar@brucity.education'),
(690, 'INSTITUT PAUL-HENRI SPAAK', 1020, 'LAEKEN', 'Rue Alfred Stevens', '20', '02-423 57 00', '02-423 57 28', 'iphs.stevens@brucity.education'),
(691, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT AGRONOMIQUE', 4910, 'LA REID', 'Rue Canada', '157', '087-21 05 10', '087-37 69 40', 'ipealareid@prov-liege.be'),
(692, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT CHARLES DELIEGE', 7130, 'BINCHE', 'Rue des Archers', '12', '064-31 02 20', '064-31 02 39', NULL),
(693, 'Institut provincial d\'enseignement de promotion sociale - Orientation commerciale', 4800, 'VERVIERS', 'Rue aux Laines', '23', '04-279 68 80', '04-279 58 51', NULL),
(694, 'Institut provincial d\'enseignement de promotion sociale - Orientation technologique', 4800, 'VERVIERS', 'Rue aux Laines', '69', '04-279 68 80', NULL, NULL),
(695, 'Institut provincial d\'enseignement de promotion sociale Binche-CarniÃ¨res-Morlanwelz', 7130, 'BINCHE', 'Rue des Archers', '12', '064-31 02 40', '064-31 02 41', 'BinchePS.SecrÃƒÂ©tariat@hainaut.be'),
(696, 'Institut provincial d\'enseignement de promotion sociale de Herstal', 4040, 'HERSTAL', 'Rue de l\'Ecole Technique', '34', '04-279 41 70', '04-279 41 79', NULL);
INSERT INTO `establishments` (`id`, `name`, `postcode`, `locality`, `street`, `streetNumber`, `phone`, `fax`, `email`) VALUES
(697, 'Institut provincial d\'enseignement de promotion sociale de Huy-Waremme', 4500, 'HUY', 'Quai de CompiÃ¨gne', '4', '04-279 37 37', '04-279 58 66', 'Pshuy@provincedeliege.be'),
(698, 'Institut provincial d\'enseignement de promotion sociale de LiÃ¨ge', 4020, 'LIEGE', 'Quai Godefroid Kurth', '100', '04-279 29 50', '04-279 29 78', 'christiane.bonvarlez@provincedeliege.be'),
(699, 'Institut provincial d\'enseignement de promotion sociale de Wallonie picarde', 7500, 'TOURNAI', 'Rue Paul Pastur', '2', '069-25 37 33', '069-25 37 35', 'ipeps.tournai@hainaut.be'),
(700, 'Institut provincial d\'enseignement de promotion sociale et de formation continuee', 1400, 'NIVELLES', 'Rue Demulder', '1', '067-89 40 60', '067-89 40 89', 'ipfc.brabant.wallon@skynet.be'),
(701, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE', 1480, 'TUBIZE', 'Chaussee de Mons', '241-243', '02-355 66 87', '02-355 21 30', NULL),
(702, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE DE HERSTAL', 4040, 'HERSTAL', 'Rue du Grand Puits', '66', '04-248 41 00', '04-248 41 41', 'ipeshl@provincedeliege.be'),
(703, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE DE HESBAYE', 4300, 'WAREMME', 'Rue de Huy', '123', '04-279 66 00', '019-33 05 79', NULL),
(704, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE DE HUY', 4500, 'HUY', 'Avenue Delchambre', '6', '085-27 31 00', '085-21 15 97', NULL),
(705, 'Institut provincial d\'enseignement secondaire de promotion sociale', 4101, 'JEMEPPE-SUR-MEUSE', 'Quai des Carmes', '43', '04-279 47 57', NULL, 'marcel.renquin@provincedeliege.be'),
(706, 'Institut provincial d\'enseignement secondaire de promotion sociale - Orientation technique', 4100, 'SERAING', 'Rue Jean de Seraing', '55', '04-279 72 83', '04-279 72 81', 'ernest.burton@provincedeliege.be'),
(707, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE DE SERAING', 4101, 'JEMEPPE-SUR-MEUSE', 'Quai des Carmes', '43', '04-237 93 46', '04-237 93 47', 'ipesseraing@provincedeliege.be'),
(708, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE DE VERVIERS', 4800, 'VERVIERS', 'Rue Peltzer de Clermont', '104', '04 279 47 73', NULL, NULL),
(709, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE LEON HUREZ', 7100, 'LA LOUVIERE', 'Rue de Bonne Esperance', '1', '064-21 34 11', '064-22 47 06', NULL),
(710, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE PARAMEDICAL DE LIEGE-HUY-VERVIERS (E.P.S.C.)', 4020, 'LIEGE', 'Quai du Barbou', '2', '04-279 79 84', '04-344 79 85', 'Dominique.Lejeune@provincedeliege.be'),
(711, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT SECONDAIRE PARAMEDICAL LA SAMARITAINE', 6061, 'MONTIGNIES-SUR-SAMBRE', 'Rue Samaritaine', '14', '071-48 82 66', '071-48 90 99', NULL),
(712, 'Institut provincial d\'enseignement secondaire specialise de Micheroux', 4630, 'MICHEROUX', 'Rue Paul d\'Andrimont', '24', '04-279 65 57', '04-355 97 69', 'ipes.micheroux@provincedeliege.be'),
(713, 'Institut provincial d\'enseignement secondaire specialise du Val d\'Aisne', 6997, 'EREZEE', 'Briscol', '12', '086-34 94 83', '086-47 77 85', 'epsi.val@busmail.net'),
(714, 'Institut provincial d\'enseignement superieur de promotion sociale de Seraing', 4100, 'SERAING', 'Rue de Colard Trouillet', '48', '04-279 29 54', '04-279 72 89', 'psseraingsup@provincedeliege.be'),
(715, 'INSTITUT PROVINCIAL D\'ENSEIGNEMENT TECHNIQUE', 1400, 'NIVELLES', 'Rue du Paradis', '79A', '067-21 61 66', '067-21 63 22', 'direction@ipet.be'),
(716, 'Institut provincial d\'enseignement technique et professionnel de promotion sociale', 6240, 'FARCIENNES', 'Rue du Puits Communal', '114', '071-24 35 49', '071-24 35 40', NULL),
(717, 'Institut Provincial de Formation Sociale', 5000, 'NAMUR', 'Rue Henri BlÃ¨s', '188-190', '081-77 67 30', '081-77 69 52', 'ipform.sociale@province.namur.be'),
(718, 'INSTITUT PROVINCIAL DE NURSING DU CENTRE', 7100, 'LA LOUVIERE', 'Rue Ernest Milcamps', '13B', '064-26 31 91', '064-26 32 47', NULL),
(719, 'INSTITUT PROVINCIAL DES ARTS ET METIERS', 1400, 'NIVELLES', 'Rue Ferdinand Delcroix', '33', '067-79 48 79', '067-21 66 43', NULL),
(720, 'Institut provincial des Arts et Metiers du Centre', 7100, 'LA LOUVIERE', 'Rue Paul Pastur', '1', '064-22 22 80', '064-26 61 92', 'noella.mertens@hainaut.be'),
(721, 'INSTITUT PROVINCIAL ENSEIGNEMENT SECONDAIRE', 5300, 'SEILLES', 'Rue FranÃ§ois Jassogne', '2 A', '081-77 68 06', '085-82 77 66', 'ipes.direction@province.namur.be'),
(722, 'Institut provincial superieur des Sciences sociales et pedagogiques de promotion sociale', 6000, 'CHARLEROI', 'Square Jules Hiernaux', '2', '071-552 306', '071-552 324', 'ipsma.ps@hainaut-promsoc.be'),
(723, 'Institut Redoute-Peiffer', 1070, 'ANDERLECHT', 'Avenue Marius Renard', '1', '02-526 75 00', '02-526 75 07', NULL),
(724, 'Institut Reine Astrid - I.R.A.M.', 7000, 'MONS', 'Rue Saint-Luc', '3', '065-40 41 92', '065-40 41 99', 'info@iramps.be'),
(725, 'Institut Reine Fabiola Enseignement professionnel', 1040, 'ETTERBEEK', 'Rue des Champs', '41', '02-629 00 40', '02-629 00 41', 'info@irf-ecole.be'),
(726, 'Institut Roger Guilbert', 1070, 'ANDERLECHT', 'Avenue Emile Gryson', '1', '02-526 75 40', '02-526 75 42', 'secretariat.irg@ceria.be'),
(727, 'Institut Roger Lambion', 1070, 'ANDERLECHT', 'Avenue Emile Gryson', '1', '02-526 73 37', '02-526 73 08', 'infoirl@ceria.be'),
(728, 'Institut Royal pour Sourds et Aveugles - Enseignement secondaire Type 6 et Type 7', 1180, 'UCCLE', 'Chaussee de Waterloo', '1508', '02-374 03 68', '02-375 73 13', NULL),
(729, 'INSTITUT SACRE-COEUR ET SAINT-JOSEPH', 4600, 'VISE', 'Rue de la Trairie', '27', '04-379 24 05', '04-379 67 66', 'isc.vise@skynet.be'),
(730, 'Institut Saint Michel', 4800, 'VERVIERS', 'Rue du CollÃ¨ge', '126', '087/39 46 50', '087/31 78 91', NULL),
(731, 'INSTITUT SAINT-ALBERT', 1370, 'JODOIGNE', 'Avenue Fernand Charlot', '35', '010-81 12 50', '010-81 44 81', NULL),
(732, 'INSTITUT SAINT-ANDRE', 1050, 'IXELLES', 'Avenue de l\'Hippodrome', '180', '02-648 62 88', '02-649 98 27', 'isa.bxl@sec.cfwb.be'),
(733, 'INSTITUT SAINT-AUGUSTIN', 7850, 'MARCQ', 'Chaussee d\'Ath', '1', '02-397 02 60', '02-397 02 70', 'saint.augustin.enghien@skynet.be'),
(734, 'INSTITUT SAINT-BARTHELEMY D.O.A.', 4000, 'LIEGE', 'En-Hors-ChÃ¢teau', '31', '04-223 73 71', '04-221 17 16', NULL),
(735, 'INSTITUT SAINT-BERTHUIN', 5020, 'MALONNE', 'Fond de Malonne', '129', '081-44 72 30', '081-44 72 39', 'info@isbm.be'),
(736, 'INSTITUT SAINT-BONIFACE- PARNASSE', 1050, 'IXELLES', 'Rue du Viaduc', '82', '02-511 53 49', '02-511 26 71', NULL),
(737, 'INSTITUT SAINT-CHARLES', 7711, 'DOTTIGNIES', 'Place de la Resistance', '10', '056-48 95 03', '056-48 99 50', 'saint.charles.dottignies@skynet.be'),
(738, 'INSTITUT SAINT-DOMINIQUE', 1030, 'SCHAERBEEK', 'Rue Caporal Claes', '38', '02-240 16 10', '02-240 16 11', NULL),
(739, 'INSTITUT SAINT-FERDINAND', 7012, 'JEMAPPES', 'Avenue Marechal Foch', '824', '065-82 22 98', '065-82 26 21', 'saint.ferdinand.jemappes@skynet.be'),
(740, 'INSTITUT SAINT-FRANCOIS DE SALES', 7800, 'ATH', 'Rue du Gouvernement', '7', '068-26 51 20', '068-26 51 29', 'secretariat@saint-francois.be'),
(741, 'INSTITUT SAINT-FRANCOIS-XAVIER', 4800, 'VERVIERS', 'Rue de Francorchamps', '12', '087-29 39 99', '087-29 39 98', 'info@sfxdeux.be'),
(742, 'INSTITUT SAINT-HENRI', 7780, 'COMINES-WARNETON', 'Rue du Commerce', '21', '056-56 00 60', '056-56 00 75', 'institut.saint.henri@skynet.be'),
(743, 'Institut Saint-Henri - Ecole technique commerciale - Enseignement de promotion sociale', 7780, 'COMINES-WARNETON', 'Rue du Commerce', '21', '056-56 00 61', '056-56 00 75', 'isheps@skynet.be'),
(744, 'Institut Saint-Jean Berchmans', 4000, 'LIEGE', 'Rue des Wallons', '59', '04-229 78 90', '04-229 78 99', NULL),
(745, 'INSTITUT SAINT-JEAN-BAPTISTE', 1300, 'WAVRE', 'Rue de Bruxelles', '45', '010-22 24 60', '010-22 96 69', NULL),
(746, 'INSTITUT SAINT-JEAN-BAPTISTE DE LA SALLE', 1060, 'SAINT-GILLES', 'Rue Moris', '19', '02-537 12 43', '02-538 25 47', NULL),
(747, 'INSTITUT SAINT-JOSEPH', 6000, 'CHARLEROI', 'Boulevard de l\'Yser', '12', '071-20 72 72', '071-70 05 97', 'info@isj.org'),
(748, 'INSTITUT SAINT-JOSEPH (D2-D3)', 7100, 'LA LOUVIERE', 'Rue Gustave BoÃ«l', '55', '064-31 18 40', '064-31 18 51', NULL),
(749, 'INSTITUT SAINT-JOSEPH - ECOLE TECHNIQUE BERTRIX', 6800, 'LIBRAMONT', 'Rue de Bonance', '11', '061-23 06 50', '061-23 06 59', NULL),
(750, 'INSTITUT SAINT-JOSEPH - ENSEIGNEMENT GENERAL', 5590, 'CINEY', 'Rue Saint-Hubert', '14-16', '083-23 21 50', '083-21 29 15', NULL),
(751, 'INSTITUT SAINT-JOSEPH - ENSEIGNEMENT TECHNIQUE', 5590, 'CINEY', 'Rue Saint-Hubert', '14-16', '083-23 21 60', '083-21 62 28', 'isjet.ciney@sec.cfwb.be'),
(752, 'Institut Saint-Joseph - Sacre-Coeur', 6980, 'LA ROCHE-EN-ARDENNE', 'Vieille route de Beausaint', '22', '084-41 14 02', '084-41 16 04', 'isj.isc.laroche@skynet.be'),
(753, 'INSTITUT SAINT-JOSEPH D\'ENSEIGNEMENT TECHNIQUE', 1040, 'ETTERBEEK', 'Rue Felix Hap', '14', '02-735 81 10', '02-732 56 27', NULL),
(754, 'INSTITUT SAINT-JOSEPH D.O.A.', 7100, 'LA LOUVIERE', 'Rue Gustave BoÃ«l', '55', '064-31 18 40', '064-31 18 51', NULL),
(755, 'Institut Saint-Joseph et Sainte-Julienne', 4000, 'LIEGE', 'Rue du General Bertrand', '14', '04-226 04 66', '04-225.09.38', NULL),
(756, 'INSTITUT SAINT-JULIEN-PARNASSE', 1160, 'AUDERGHEM', 'Av de l\'Eglise St-Julien', '22', '02-672 68 01', '02-672 75 64', NULL),
(757, 'INSTITUT SAINT-LAURENT', 4000, 'LIEGE', 'Rue Saint-Laurent', '29', '04-223 78 80', '04-221 20 05', 'institut.stlaurent@win.be'),
(758, 'INSTITUT SAINT-LAURENT - Enseignement general - D2-D3', 6900, 'MARCHE-EN-FAMENNE', 'Rue Americaine', '28', '084-32 01 80', '084-32 01 87', NULL),
(759, 'Institut Saint-Laurent - Promotion sociale', 4000, 'LIEGE', 'Rue Saint-Laurent', '33', '04-223 11 31', '04-223 26 84', 'eps@isl.be'),
(760, 'INSTITUT SAINT-LOUIS', 1000, 'BRUXELLES', 'Rue du Marais', '113', '02-209 17 11', '02-223 10 62', 'isl.human@skynet.be'),
(761, 'INSTITUT SAINT-LUC', 7000, 'MONS', 'Rue Saint-Luc', '3', '065-33 71 21', '065-31 15 57', NULL),
(762, 'INSTITUT SAINT-MICHEL', 6840, 'NEUFCHATEAU', 'Place du ChÃ¢teau', '3', '061-27 71 64', '061-27 77 90', NULL),
(763, 'INSTITUT SAINT-ROCH', 6900, 'MARCHE-EN-FAMENNE', 'Rue Americaine', '28', '084-32 01 50', '084-32 01 57', NULL),
(764, 'INSTITUT SAINT-ROCH 2e ET 3e DEGRES', 4910, 'THEUX', 'Marche', '2', '087-54 13 33', '087-53 04 52', 'stroch.theux@sec.cfwb.be'),
(765, 'INSTITUT SAINT-ROCH D.O.A.', 4910, 'THEUX', 'Marche', '2', '087-54 13 33', '087-53 04 52', 'doa.stroch.theux@swing.be'),
(766, 'Institut Saint-Sepulcre', 4000, 'LIEGE', 'Rue du General Bertrand', '14', '04-226 04 66', '04-225 09 38', 'direction-sepulcre@scarlet.be'),
(767, 'INSTITUT SAINT-STANISLAS', 1040, 'ETTERBEEK', 'Avenue des Nerviens', '131', '02-735 56 31', '02-732 47 87', 'ststanislas.etterbeek@skynet.be'),
(768, 'INSTITUT SAINT-VINCENT DE PAUL', 1180, 'UCCLE', 'Place Jean Vander Elst', '25', '02-345 46 26', '02-345 42 50', 'info@isv.be'),
(769, 'INSTITUT SAINTE MARIE', 5100, 'JAMBES', 'Chaussee de LiÃ¨ge', '246', '081-30 13 30', '081-30 67 53', NULL),
(770, 'Institut Sainte-Anne', 6041, 'GOSSELIES', 'Rue Circulaire', '5', '071-25 82 20', '071-25 82 21', 'isa@isag.be'),
(771, 'INSTITUT SAINTE-BEGGE', 5300, 'ANDENNE', 'Place du Chapitre', '12', '085-84 14 70', '085-84 52 40', NULL),
(772, 'INSTITUT SAINTE-CLAIRE', 4800, 'VERVIERS', 'Rue SÃ¨cheval', '32', '087-31 32 64', '087-31 07 24', NULL),
(773, 'INSTITUT SAINTE-JULIE', 6900, 'MARCHE-EN-FAMENNE', 'Rue Americaine', '28', '084-32 01 70', '084-32 01 77', NULL),
(774, 'INSTITUT SAINTE-MARIE', 1060, 'SAINT-GILLES', 'Rue Emile Feron', '5', '02-537 41 18', '02-534 96 75', 'institutsaintemarie@skynet.be'),
(775, 'INSTITUT SAINTE-MARIE (D2-D3)', 5100, 'JAMBES', 'Chaussee de LiÃ¨ge', '246', '081-30 13 30', '081-30 67 53', NULL),
(776, 'INSTITUT SAINTE-MARIE - ENSEIGNEMENT SECONDAIRE', 6700, 'ARLON', 'Rue de Bastogne', '33', '063-43 01 73', '063-43 01 75', 'isma@isma-arlon.be'),
(777, 'INSTITUT SAINTE-THERESE', 7170, 'MANAGE', 'Grand\'Rue', '79', '064-27 87 10', '064-55 88 48', 'direction.ist@istmanage.be'),
(778, 'INSTITUT SAINTE-THERESE D\'AVILA', 4032, 'CHENEE', 'Rue Soeur Lutgardis', '5', '04-361 85 85', '04-365 71 99', NULL),
(779, 'INSTITUT SAINTE-URSULE', 1190, 'FOREST', 'Avenue des Armures', '39', '02-344 12 88', '02-344 43 70', 'contact@stus.be'),
(780, 'INSTITUT SAINTS-PIERRE ET PAUL', 5620, 'FLORENNES', 'Rue des Ecoles', '19', '071-68 86 75', '071-68 71 24', NULL),
(781, 'Institut secondaire d\'enseignement specialise libre Sainte-Chretienne', 6460, 'CHIMAY', 'Boulevard Louise', '23', '060-21 27 75', '060-21 51 85', 'direction@secondaire.saintechretienne.be'),
(782, 'Institut superieur d\'Architecture de la Communaute franÃ§aise - La Cambre', 1050, 'IXELLES', 'Place EugÃ¨ne Flagey', '19', '02-640 96 96', '02-647 46 55', 'isacf@lacambre-archi.org'),
(783, 'Institut superieur d\'Architecture Intercommunal - I.S.A.I.', 1000, 'BRUXELLES', 'Rue des Minimes', '87-89', '02-504 09 10', '02-504 09 38', 'isa-mons@umh.ac.be'),
(784, 'Institut superieur d\'architecture Saint-Luc Bruxelles', 1060, 'SAINT-GILLES', 'Rue d\'Irlande', '57', '02-537 34 19', '02-539 40 69', 'administration@st-luc-brussels-archi.be'),
(785, 'Institut superieur d\'Architecture Saint-Luc Wallonie', 4020, 'LIEGE', 'Bld de la Constitution', '41', '04-341 81 11', '04-341 81 13', 'beaux-arts@stluc.com'),
(786, 'Institut superieur de formation continue d\'Etterbeek', 1040, 'ETTERBEEK', 'Rue Joseph Buedts', '14', '02-647 25 69', '02-646 39 85', 'info@isfce.org'),
(787, 'Institut superieur de Musique et de Pedagogie', 5000, 'NAMUR', 'Rue Juppin', '28', '+32 81 73 64 37', NULL, 'info@imep.be'),
(788, 'Institut superieur de Promotion Sociale Libre de Bruxelles Ilya Prigogine', 1070, 'ANDERLECHT', 'Route de Lennik', '808', '02-560 29 59', NULL, 'audrey.sesana@iort-prigogine.be'),
(789, 'Institut superieur industriel de la province de Hainaut', 6000, 'CHARLEROI', 'Boulevard Solvay', '31', '071-53 17 57', '071-53 15 43', 'patrice.antoine@hainaut.be'),
(790, 'Institut superieur Plus Oultre', 7130, 'BINCHE', 'Rue de Savoie', '6', '064-34 20 93', '064-34 20 94', 'guy.vanbellingen@sec.cfwb.be'),
(791, 'INSTITUT TECHNIQUE', 7800, 'ATH', 'Boulevard du ChÃ¢teau', '12', '068-26 88 80', '068-26 88 81', 'itlath@hotmail.com'),
(792, 'INSTITUT TECHNIQUE CARDINAL MERCIER - NOTRE-DAME DU SACRE-COEUR', 1030, 'SCHAERBEEK', 'Rue Portaels', '81', '02-216 21 97', '02-215 14 78', 'itcmndsc.2030@ens.irisnet.be'),
(793, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE CENTRE ARDENNE', 6800, 'LIBRAMONT', 'Avenue Herbofin', '39', '061-23 05 00', '061-22 54 72', NULL),
(794, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE DAVID LACHMAN', 6470, 'RANCE', 'Rue Pauline Hubert', '40', '060-21 06 70', '060-41 24 74', NULL),
(795, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE DE MORLANWELZ', 7140, 'MORLANWELZ', 'Rue Raoul Warocque', '46', '064-43 21 89', '064-44 97 32', NULL),
(796, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE ERQUELINNES', 6560, 'ERQUELINNES', 'Rue Albert Ier', '21', '071-55 60 85', '071-55 44 42', NULL),
(797, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE ETIENNE LENOIR', 6700, 'ARLON', 'Chemin de Weyler', '2', '063-23 02 20', '063-23 02 25', NULL),
(798, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE FELICIEN ROPS', 5000, 'NAMUR', 'Rue du QuatriÃ¨me Genie', '2', '081-25 76 00', '081-25 76 08', NULL),
(799, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE GEMBLOUX', 5030, 'GEMBLOUX', 'Rue Entree Jacques', '31', '081-62 53 90', '081-62 53 99', 'ithgembloux@gmail.com'),
(800, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE HENRI MAUS', 5000, 'NAMUR', 'Pl de l\'Ecole des Cadets', '4', '081-25 50 85', NULL, 'itcfhenrimausdirection@gmail.com'),
(801, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE PARAMEDICAL', 9600, 'RENAIX', 'Rue de Ninove', '169', '055-23 53 90', '055-23 53 99', NULL),
(802, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE RENEE JOFFROY', 7801, 'IRCHONWELZ', 'Chaussee de Valenciennes', '48', '068-26 50 50', '068-26 50 55', 'jean-claude.rousseau@sec.cfwb.be'),
(803, 'INSTITUT TECHNIQUE DE LA COMMUNAUTE FRANCAISE VAL - ITMA', 7500, 'TOURNAI', 'Chaussee de Lille', '2', '069-89 02 50', NULL, NULL),
(804, 'Institut technique de promotion sociale', 5000, 'NAMUR', 'Rue Asty-Moulin', '60', '081-72 90 60', '081-72 90 61', 'dir.promsoc@asty-moulin.be'),
(805, 'INSTITUT TECHNIQUE DES URSULINES', 7000, 'MONS', 'Avenue du Tir', '12', '065-40 23 23', '065-40 23 25', 'dir.e7000itu1@win.be'),
(806, 'Institut technique et agricole de la Province du Hainaut', 7060, 'SOIGNIES', 'Rue de la Station', '57', '067-34 02 52', '067-49.08.71', 'ita.soignies@hainaut.be'),
(807, 'INSTITUT TECHNIQUE ET COMMERCIAL DES AUMONIERS DU TRAVAIL', 7300, 'BOUSSU', 'Rue de Caraman', '13', '065-76 61 10', '065-76 61 20', NULL),
(808, 'Institut technique et professionnel du Borinage', 7300, 'BOUSSU', 'Rue de Caraman', '13', '065-76 61 40', '065-76 61 40', 'Aumoniers.Boussu@sec.cfwb.be'),
(809, 'Institut technique Fernand Cocq - Cours de promotion sociale d\'Ixelles', 1050, 'IXELLES', 'Rue du President', '54', '02-515 78 11', '02-513 94 41', 'secretariat@ifcxl.be'),
(810, 'INSTITUT TECHNIQUE PROVINCIAL', 1490, 'COURT-SAINT-ETIENNE', 'Parc de Wisterzee', NULL, '010-61 22 61', '010-61 30 17', NULL),
(811, 'INSTITUT TECHNIQUE RENE CARTIGNY', 1050, 'IXELLES', 'Place de la Petite Suisse', '4', '02-515 75 75', '02-515 75 97', 'irc@ixelles.brussels'),
(812, 'INSTITUT TECHNIQUE SAINT-GABRIEL', 7090, 'BRAINE-LE-COMTE', 'Rue de Mons', '80', '067-87 49 60', '067-87 49 82', NULL),
(813, 'INSTITUT TECHNIQUE SAINT-JOSEPH (D2-D3)', 7100, 'LA LOUVIERE', 'Rue Gustave BoÃ«l', '23', '064-31 18 58', '064-31 18 52', 'infos@itsjlalouviere.be'),
(814, 'INSTITUT TECHNIQUE SAINT-LUC', 7000, 'MONS', 'Rue Saint-Luc', '3', '065-33 71 21', '065-31 15 57', 'ces.saintluc.mons@skynet.be'),
(815, 'INSTITUT TECHNIQUE SAINT-VINCENT', 7060, 'SOIGNIES', 'Chaussee de Braine', '22', '067-34 70 00', '067-34 70 01', NULL),
(816, 'Institut technique superieur Cardinal Mercier - Enseignement de promotion sociale', 1030, 'SCHAERBEEK', 'Boulevard Lambermont', '35', '02-781 00 39', NULL, 'itscm1030@gmail.com'),
(817, 'ITESS - Etablissement d\'enseignement professionnel secondaire specialise', 7800, 'ATH', 'Boulevard du ChÃ¢teau', '14', '068-26 88 95', '068-26 88 83', 'e.s.s.ath@skynet.be'),
(818, 'L\'A.M.I. - ASBL Centre d\'adaptation sociale et professionnelle. Institut d\'enseignement technique specialise', 7100, 'LA LOUVIERE', 'Rue Gustave BoÃ«l', '25A', '064-22 14 08', '064-28 55 13', NULL),
(819, 'L\'Academie', 5310, 'EGHEZEE', 'Rue de la Gare', '1', '081-81 01 76', '081-81 01 75', NULL),
(820, 'L\'Ecole Active', 1180, 'UCCLE', 'Rue de Stalle', '70-82', NULL, NULL, NULL),
(821, 'L\'Ecole Integree - Enseignement fondamental et secondaire specialise libre', 1200, 'WOLUWE-SAINT-LAMBERT', 'Rue de la Rive', '99', '02-771 75 11', '02-772 62 88', NULL),
(822, 'La Clairière Enseignement professionnel specialise libre', 7340, 'WASMES', 'Rue du Berchon', '161', '065-78 57 71', '065-78 65 58', NULL),
(823, 'La Cordee Enseignement professionnel specialise libre', 7340, 'WASMES', 'Rue du Berchon', '159', '065-78 59 33', '065-80 34 91', NULL),
(824, 'La Maison des Phenix - Ecole secondaire', 7940, 'BRUGELETTE', 'Place Maurice Sebastien', '8', NULL, NULL, 'info@maisondesphenix.be'),
(825, 'Les Colibris Enseignement secondaire specialise', 7540, 'KAIN', 'Rue du Saulchoir', '56', '069/22.02.35', '069-67 06 19', 'contact@les-colibris.be'),
(826, 'LiVentourne - Enseignement specialise secondaire', 1340, 'OTTIGNIES', 'Avenue Reine Fabiola', '28', '0475-70 53 63', NULL, 'directionlvtbaurant@gmail.com'),
(827, 'LYCEE COMMUNAL EMILE MAX', 1030, 'SCHAERBEEK', 'Chaussee de Haecht', '235', '02-240 43 40', '02-215 17 36', 'lycee_emile_max@yahoo.fr'),
(828, 'LYCEE DE BERLAYMONT', 1410, 'WATERLOO', 'DrÃ¨ve d\'Argenteuil', '10C', '02-357 09 83', '02-353 18 84', 'lycee@berlaymont.be'),
(829, 'LYCEE DE LA COMMUNAUTE FRANCAISE CHARLES PLISNIER', 7330, 'SAINT-GHISLAIN', 'Rue de Sas', '75', '065-78 67 18', '065-78 22 09', 'directioncharlesplisnier@gmail.com'),
(830, 'Lycee Emile Jacqmain', 1040, 'BRUXELLES', 'Rue Belliard', '135A', '02-238 52 50', '02-280 03 34', 'sec.jacqmain@brucity.education'),
(831, 'LYCEE GUY CUDELL', 1210, 'SAINT-JOSSE-TEN-NOODE', 'Rue de Liedekerke', '66', '02-220 28 10', '02-220 28 14', NULL),
(832, 'LYCEE HENRIETTE DACHSBECK', 1000, 'BRUXELLES', 'Rue de la Paille', '24', '02-500 85 50', '02-500 85 68', 'sec.dachsbeck@brucity.education'),
(833, 'Lycee Integral Roger Lallemand', 1060, 'SAINT-GILLES', 'Rue de la Croix de Pierre', '73', NULL, NULL, NULL),
(834, 'LYCEE LA RETRAITE', 1000, 'BRUXELLES', 'Rue des Confederes', '70', '02-736 91 27', '02-734 76 30', 'info.lyceelaretraite@gmail.com'),
(835, 'LYCEE MARIA ASSUMPTA', 1020, 'LAEKEN', 'Avenue Wannecouter', '76', '02-268 04 13', '02-262 26 62', 'administration.lma@skynet.be'),
(836, 'LYCEE MARTIN V', 1348, 'LOUVAIN-LA-NEUVE', 'Rue du CollÃ¨ge', '3', '010-83 41 00', '010-47 35 44', 'direction.lmv@uclouvain.be'),
(837, 'LYCEE MATER DEI', 1150, 'WOLUWE-SAINT-PIERRE', 'Avenue de l\'Aviation', '72', '02-770 03 99', '02-776 84 57', NULL),
(838, 'LYCEE MIXTE FRANCOIS DE SALES', 6060, 'GILLY', 'Rue des Vallees', '18', '071-41 38 58', '071-42 14 53', NULL),
(839, 'LYCEE PROVINCIAL D\'ENSEIGNEMENT TECHNIQUE DU HAINAUT', 7330, 'SAINT-GHISLAIN', 'Avenue de l\'Enseignement', '45', '065-71 42 11', '065-71 42 10', NULL),
(840, 'LYCEE PROVINCIAL DES SCIENCES ET DES TECHNOLOGIES', 7060, 'SOIGNIES', 'Rue de la Station', '59', '067-34 79 70', '067-34 79 98', 'sonia.dupont@hainaut.be'),
(841, 'LYCEE PROVINCIAL HORNU COLFONTAINE', 7340, 'PATURAGES', 'Avenue Fenelon', '48', '065-61 33 90', '065-67 69 55', NULL),
(842, 'Lycee Saint-Benoît - Saint-Servais (1er degre)', 4000, 'LIEGE', 'Rue Lambert le BÃ¨gue', '44', '04-223 59 65', '04-221 15 85', 'stbenoit.stservais@win.be'),
(843, 'LYCEE SAINT-JACQUES', 4000, 'LIEGE', 'Rue Darchis', '35', '04-223 43 56', '04-223 26 33', 'direction@lyceesaintjacques.be'),
(844, 'LYCEE SAINTE-CROIX ET NOTRE-DAME', 4280, 'HANNUT', 'Avenue Paul Brien', '4', '019-51 95 00', '019-51 95 08', 'saintecroix.hannut@sec.cfwb.be'),
(845, 'Lycee Soeur Emmanuelle - Degre d\'observation autonome', 1070, 'ANDERLECHT', 'Avenue d\'Itterbeek', '482', NULL, NULL, NULL),
(846, 'LYCEE TECHNIQUE PROVINCIAL \"JEAN BOETS\"', 4000, 'LIEGE', 'Rue Hullos', '52', '04-230 68 00', '04-226 72 58', NULL),
(847, 'MAISON SAINT-AUGUSTIN (DOA)', 7850, 'MARCQ', 'Chaussee d\'Ath', '1', '02-397 02 60', '02-397 02 70', 'saint.augustin.enghien@skynet.be'),
(848, 'Notre-Dame Ecole secondaire d\'enseignement specialise libre', 5600, 'PHILIPPEVILLE', 'Rue des Recollets', '1', '071-66 60 03', '071-66 92 74', 'indspec@infonie.be'),
(849, 'NOTRE-DAME SAINT LAMBERT ET SAINT-LAURENT DOA', 4040, 'HERSTAL', 'Rue Elisa Dumonceau', '75', '04-264 41 78', '04-248 15 36', 'dir.e4040doa1@win.be'),
(850, 'Pater-Damian-Sekundarschule', 4700, 'EUPEN', 'Kaperberg', '2-4', '087598900', '087598909', NULL),
(851, 'Promotion sociale secondaire Mons-Borinage', 7000, 'MONS', 'Av du Gouverneur E. Cornez', '1', '065-35 38 13', '065-35 55 73', NULL),
(852, 'Promotion sociale superieur Mons-Borinage', 7000, 'MONS', 'Avenue du Tir', '10', '065-39 89 39', '065-33 44 71', 'pol.lhost@sec.cfwb.be'),
(853, 'Saint-Joseph Ecole d\'enseignement secondaire specialise', 4250, 'GEER', 'Rue Emile Lejeune', '1', '019-58 80 41', '019-58 88 94', 'info@saintjosephgeer.be'),
(854, 'Saint-Vincent - Enseignement secondaire specialise', 7034, 'OBOURG', 'Rue de France', '39', '065-31 82 41', '065-33 84 49', NULL),
(855, 'Sainte-Bernadette - Ecole d\'enseignement secondaire specialise', 1160, 'AUDERGHEM', 'Square du Sacre-Coeur', '2A', '02-673 18 55', '02-660 51 28', NULL),
(856, 'Sainte-Gertrude Enseignement secondaire specialise libre', 7940, 'BRUGELETTE', 'Rue de Bauffe', '2', '068-45 49 41', '068-45 42 52', NULL),
(857, 'SEMINAIRE DE BONNE-ESPERANCE', 7120, 'VELLEREILLE-LES-BRAYEUX', 'Rue Gregoire Jurion', '22', '064-31 08 08', '064-31 08 10', NULL),
(858, 'SEMINAIRE DE FLOREFFE', 5150, 'FLOREFFE', 'Rue du Seminaire', '7', '081-44 71 40', '081-44 57 59', 'seminaire.floreffe@swing.be'),
(859, 'Universite catholique de Louvain', 1348, 'LOUVAIN-LA-NEUVE', 'Place de l\'Universite', '1', '+32 10 47 21 72', NULL, 'info-cio@uclouvain.be'),
(860, 'Universite de Liège', 4000, 'LIEGE', 'Place du Vingt AoÃ»t', '7', '+32 4 366 21 11', NULL, 'info.etudes@ulg.ac.be'),
(861, 'Universite de Mons', 7000, 'MONS', 'Place du Parc', '20', '+32 65 37 31 11', NULL, 'info.mons@umons.ac.be'),
(862, 'Universite de Namur', 5000, 'NAMUR', 'Rue de Bruxelles', '61', '+32 81 72 41 11', NULL, 'relext@fusl.ac.be'),
(863, 'Universite du Travail - Institut d\'enseignement technique commercial', 6000, 'CHARLEROI', 'Square Jules Hiernaux', '2', '071-53 17 56', '071-53 14 56', NULL),
(864, 'Universite du Travail - Institut d\'enseignement technique secondaire', 6000, 'CHARLEROI', 'Boulevard Gustave Roullier', '1', '071-53 17 53', NULL, NULL),
(865, 'Universite du Travail - Institut d\'enseignement technique secondaire de promotion sociale', 6000, 'CHARLEROI', 'Boulevard Gustave Roullier', '1', '071-53 17 55', '071-53 15 12', 'roberto.bruno@hainaut.be'),
(866, 'Universite du Travail - Institut Jean Jaurès', 6000, 'CHARLEROI', 'Rue de la Broucheterre', '52B', '071-53 17 54', '071-53 17 28', NULL),
(867, 'Universite libre de Bruxelles', 1050, 'IXELLES', 'Avenue Franklin Roosevelt', '50', '+32 2 650 21 11', NULL, 'infor-etudes@ulb.ac.be'),
(868, 'Universite Saint-Louis - Bruxelles', 1000, 'BRUXELLES', 'Boulevard du Jardin Botanique', '43', '+32 2 211 78 11', NULL, 'relext@fusl.ac.be'),
(869, 'Willemsfonds - Cours de neerlandais moyens et superieurs', 1000, 'BRUXELLES', 'Rue de la Fontaine', '2', '02-513 47 55', '02-513 12 82', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`name`) VALUES
('2101'),
('2102'),
('2201'),
('2202'),
('2203'),
('2301');

-- --------------------------------------------------------

--
-- Table structure for table `immersions`
--

CREATE TABLE `immersions` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `minimalCourses` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `immersions`
--

INSERT INTO `immersions` (`id`, `date`, `minimalCourses`) VALUES
(1, '2020-04-27', 3),
(2, '2020-04-29', 3);

-- --------------------------------------------------------

--
-- Table structure for table `locals`
--

CREATE TABLE `locals` (
  `name` varchar(50) NOT NULL,
  `maxPlaces` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`) VALUES
(1, 'Info Gestion'),
(2, 'Info Industriel'),
(3, 'Info Reseau');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `firstname` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `lastname` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `id_immersion` int(11) NOT NULL,
  `id_establishment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstname`, `lastname`, `email`, `id_immersion`, `id_establishment`) VALUES
(21, 'Gosset', 'qsdqsd', 'kgossetqsdqsd10@gmail.com', 1, 17),
(22, 'Gosset', 'qsdqsd', 'kgosset11@gmail.com', 1, 15),
(23, 'Gosset', 'qsdqsd', 'kgosset10@gmail.com', 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `students_courses`
--

CREATE TABLE `students_courses` (
  `id_student` int(11) NOT NULL,
  `id_course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students_courses`
--

INSERT INTO `students_courses` (`id_student`, `id_course`) VALUES
(23, 2),
(23, 6),
(23, 3),
(23, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(219, 'kgosset10@gmail.com', '$2y$10$EoYo16yodpHxqKmHX3bCJeO4k/6jAjRpvdf2YMypWQZAKgdn5PdWG'),
(220, 'fb@gmail.com', '$2y$10$EoYo16yodpHxqKmHX3bCJeO4k/6jAjRpvdf2YMypWQZAKgdn5PdWG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk__courses__id_user` (`id_user`);

--
-- Indexes for table `courses_programmation`
--
ALTER TABLE `courses_programmation`
  ADD KEY `fk__courses_programmation__id_course` (`id_course`);

--
-- Indexes for table `courses_sections`
--
ALTER TABLE `courses_sections`
  ADD PRIMARY KEY (`id_course`,`id_section`),
  ADD KEY `fk__courses_sections__id_course` (`id_course`),
  ADD KEY `fk__courses_sections__id_section` (`id_section`);

--
-- Indexes for table `establishments`
--
ALTER TABLE `establishments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Indexes for table `immersions`
--
ALTER TABLE `immersions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `locals`
--
ALTER TABLE `locals`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk__students__id_immersion` (`id_immersion`) USING BTREE,
  ADD KEY `fk__students__id_establishment` (`id_establishment`);

--
-- Indexes for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD KEY `fk__students_couses__id_student` (`id_student`),
  ADD KEY `fk__students_couses__id_course` (`id_course`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `unique__users__email` (`email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `establishments`
--
ALTER TABLE `establishments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=870;

--
-- AUTO_INCREMENT for table `immersions`
--
ALTER TABLE `immersions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk__courses__id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `courses_programmation`
--
ALTER TABLE `courses_programmation`
  ADD CONSTRAINT `fk__courses_programmation__id_course` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses_sections`
--
ALTER TABLE `courses_sections`
  ADD CONSTRAINT `fk__courses_sections__id_course` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk__courses_sections__id_section` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk__students__id_establishment` FOREIGN KEY (`id_establishment`) REFERENCES `establishments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk__students__id_immersion` FOREIGN KEY (`id_immersion`) REFERENCES `immersions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD CONSTRAINT `fk__students_couses__id_course` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk__students_couses__id_student` FOREIGN KEY (`id_student`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
