-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 24 2013 г., 17:24
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `ufotaxi`
--
CREATE DATABASE `ufotaxi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ufotaxi`;

-- --------------------------------------------------------

--
-- Структура таблицы `car_events_type`
--

CREATE TABLE IF NOT EXISTS `car_events_type` (
  `event_name` varchar(100) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`event_name`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `car_events_type`
--

INSERT INTO `car_events_type` (`event_name`, `id`) VALUES
('взял заказ', 5),
('вошел в сеть', 1),
('вышел из очереди', 4),
('вышел из сети', 2),
('закончил заказ', 6),
('стал в очередь', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `car_in_system`
--

CREATE TABLE IF NOT EXISTS `car_in_system` (
  `car_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 - в сети 2 - готов взять заказ 3 - есть заказ',
  `lat` varchar(100) NOT NULL,
  `lng` varchar(100) NOT NULL,
  KEY `car_id` (`car_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `car_in_system`
--

INSERT INTO `car_in_system` (`car_id`, `status`, `lat`, `lng`) VALUES
(2, 3, '50.3', '42.3');

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callsign` varchar(255) NOT NULL,
  `services` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `callsign`, `services`) VALUES
(1, '0', 11),
(2, '0', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `cars_event_history`
--

CREATE TABLE IF NOT EXISTS `cars_event_history` (
  `car_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_type_id` int(11) DEFAULT NULL,
  `event_value` varchar(11) NOT NULL,
  KEY `car_id` (`car_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars_event_history`
--

INSERT INTO `cars_event_history` (`car_id`, `time`, `event_type_id`, `event_value`) VALUES
(2, '2013-10-24 12:17:51', 1, '1'),
(2, '2013-10-24 12:30:11', 5, '1'),
(2, '2013-10-24 12:45:20', 3, '1'),
(2, '2013-10-24 12:58:23', 4, '1'),
(2, '2013-10-24 12:59:28', 4, '1'),
(2, '2013-10-24 13:21:45', 5, '9'),
(2, '2013-10-24 13:23:19', 5, '9'),
(2, '2013-10-24 13:32:57', 3, '1'),
(2, '2013-10-24 13:35:12', 1, '1'),
(2, '2013-10-24 13:41:03', 3, '1'),
(2, '2013-10-24 13:45:56', 5, '9');

-- --------------------------------------------------------

--
-- Структура таблицы `cars_geoposition`
--

CREATE TABLE IF NOT EXISTS `cars_geoposition` (
  `car_id` int(11) NOT NULL,
  `lat` varchar(100) NOT NULL,
  `lng` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `car_id` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars_geoposition`
--

INSERT INTO `cars_geoposition` (`car_id`, `lat`, `lng`, `date`) VALUES
(2, '30.5249', '50.46738', '2013-10-24 10:48:28'),
(2, '30.5249', '50.46738', '2013-10-24 10:48:28'),
(2, '30.5249', '50.46738', '2013-10-24 10:48:36'),
(2, '30.5249', '50.46738', '2013-10-24 10:48:36'),
(2, '42.3', '50.3', '2013-10-24 13:21:45'),
(2, '42.3', '50.3', '2013-10-24 13:23:08'),
(2, '42.3', '50.3', '2013-10-24 13:43:45'),
(2, '42.3', '50.3', '2013-10-24 13:45:08'),
(2, '42.3', '50.3', '2013-10-24 13:45:56');

-- --------------------------------------------------------

--
-- Структура таблицы `movement_car_log`
--

CREATE TABLE IF NOT EXISTS `movement_car_log` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `car_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  KEY `date` (`date`,`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_to_car`
--

CREATE TABLE IF NOT EXISTS `order_to_car` (
  `order_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `time` (`time`),
  KEY `order_id` (`order_id`,`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_to_car`
--

INSERT INTO `order_to_car` (`order_id`, `car_id`, `time`) VALUES
(9, 2, '2013-10-24 13:45:56');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` text NOT NULL,
  `to` text NOT NULL,
  `user` int(11) NOT NULL,
  `cars_requirements` int(1) NOT NULL,
  `rate` int(11) NOT NULL,
  `arrive_time` date NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 - в ождании 2 - на выполнении 3 - выполнен',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `from`, `to`, `user`, `cars_requirements`, `rate`, `arrive_time`, `status`) VALUES
(1, 'sad', 'qwdas', 0, 7, 2, '0000-00-00', 1),
(2, '12фыв', '123', 0, 3, 2, '0000-00-00', 1),
(3, '0', '0', 0, 0, 0, '0000-00-00', 1),
(4, 'asdq', 'qwdsad', 0, 1, 2, '0000-00-00', 1),
(5, '12фыв', '123', 204, 0, 2, '0000-00-00', 1),
(6, 'sda', 'dqwd', 204, 3, 1, '0000-00-00', 1),
(7, 'dasd', 'qwdsad', 187, 0, 1, '0000-00-00', 1),
(8, '0', '0', 207, 0, 0, '0000-00-00', 1),
(9, 'sad', 'dwfas', 52, 3, 2, '0000-00-00', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cost` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `stack`
--

CREATE TABLE IF NOT EXISTS `stack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `car_id` (`car_id`),
  KEY `id` (`id`,`car_id`,`date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `stack`
--

INSERT INTO `stack` (`id`, `car_id`, `date`) VALUES
(4, 2, '2013-10-24 13:32:57');

-- --------------------------------------------------------

--
-- Структура таблицы `temporary_users`
--

CREATE TABLE IF NOT EXISTS `temporary_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user-groups`
--

CREATE TABLE IF NOT EXISTS `user-groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `user-groups`
--

INSERT INTO `user-groups` (`id`, `name`) VALUES
(1, 'Operator'),
(2, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_group` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`,`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=212 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `phone`, `password`, `user_group`, `name`) VALUES
(1, 'sadasf@dasd.ru', '', 'd41d8cd98f00b204e9800998ecf8427e', 2, ''),
(2, 'test@sad.ru', '', 'd41d8cd98f00b204e9800998ecf8427e', 1, ''),
(3, 'ac.sem@Phasellusataugue.co.uk', '(092) 1679', '', 0, 'Harding'),
(4, 'varius@Praesenteu.ca', '(0020) 079', '', 0, 'Vincent'),
(5, 'cursus.a.enim@blanditcongueIn.edu', '(031970) 3', '', 0, 'Philip'),
(6, 'metus@et.com', '(0135) 755', '', 0, 'Bruno'),
(7, 'Etiam@nequevenenatis.ca', '(038351) 1', '', 0, 'Abbot'),
(8, 'neque@euismod.org', '(034622) 5', '', 0, 'Knox'),
(9, 'cursus@elementumpurus.org', '(047) 9562', '', 0, 'Neil'),
(10, 'mauris.sit.amet@imperdietullamcorperDuis.org', '(032) 9064', '', 0, 'Tobias'),
(11, 'et.magnis@dictummi.com', '(093) 5999', '', 0, 'Hakeem'),
(12, 'at.auctor@liberodui.net', '(0385) 057', '', 0, 'Neil'),
(13, 'purus.accumsan.interdum@nuncsed.com', '(039410) 0', '', 0, 'Igor'),
(14, 'eu@egestasAliquamfringilla.net', '(018) 2205', '', 0, 'Chandler'),
(15, 'mauris@purussapien.com', '(019) 2944', '', 0, 'Octavius'),
(16, 'faucibus.orci.luctus@CurabiturdictumPhasellus.org', '(037067) 8', '', 0, 'Hector'),
(17, 'ipsum.Phasellus.vitae@Quisqueimperdiet.org', '(026) 9102', '', 0, 'Logan'),
(18, 'ac.mattis.semper@ultriciesdignissimlacus.net', '(00810) 48', '', 0, 'Curran'),
(19, 'Quisque.tincidunt@justo.co.uk', '(077) 3754', '', 0, 'Lee'),
(20, 'hendrerit.neque@rutrum.edu', '(052) 1417', '', 0, 'Reuben'),
(21, 'Donec.fringilla@massaMaurisvestibulum.com', '(0641) 258', '', 0, 'Lawrence'),
(22, 'diam.Proin.dolor@auctornon.org', '(01693) 29', '', 0, 'Barclay'),
(23, 'at.velit@magna.org', '(03789) 82', '', 0, 'Kuame'),
(24, 'Aliquam.nisl.Nulla@lacusNullatincidunt.net', '(04671) 26', '', 0, 'Gregory'),
(25, 'Duis@facilisis.com', '(075) 5223', '', 0, 'Hall'),
(26, 'tempus.mauris.erat@maurisid.edu', '(0858) 438', '', 0, 'Hashim'),
(27, 'nulla.Donec@lacus.co.uk', '(030606) 0', '', 0, 'Alfonso'),
(28, 'Donec.est@ac.ca', '(05125) 16', '', 0, 'Russell'),
(29, 'Nam.tempor@Duissit.org', '(0739) 065', '', 0, 'Trevor'),
(30, 'semper.rutrum.Fusce@ametornare.net', '(0273) 934', '', 0, 'Brian'),
(31, 'a@nectempus.edu', '(0073) 985', '', 0, 'Nicholas'),
(32, 'Donec.nibh.Quisque@semper.com', '(030209) 0', '', 0, 'Herrod'),
(33, 'Sed@amifringilla.org', '(0272) 684', '', 0, 'Leroy'),
(34, 'egestas.a@feugiat.co.uk', '(042) 7289', '', 0, 'Basil'),
(35, 'Duis@Aliquam.org', '(045) 7210', '', 0, 'Nero'),
(36, 'iaculis.lacus.pede@infaucibusorci.co.uk', '(094) 1712', '', 0, 'Arsenio'),
(37, 'Duis@placeratorcilacus.com', '(036683) 0', '', 0, 'Castor'),
(38, 'egestas.a.scelerisque@interdumCurabitur.ca', '(052) 4523', '', 0, 'Micah'),
(39, 'ornare.elit.elit@Proinnislsem.co.uk', '(06797) 39', '', 0, 'Owen'),
(40, 'egestas.urna.justo@facilisismagnatellus.org', '(031569) 2', '', 0, 'Troy'),
(41, 'lorem.luctus@sitamet.ca', '(012) 2579', '', 0, 'Caldwell'),
(42, 'placerat.eget@lectuspede.org', '(0976) 330', '', 0, 'Connor'),
(43, 'a@ligula.org', '(036482) 3', '', 0, 'Amir'),
(44, 'natoque.penatibus.et@euismodin.net', '(030199) 1', '', 0, 'Denton'),
(45, 'non.egestas@ametrisusDonec.ca', '(096) 3802', '', 0, 'Nash'),
(46, 'posuere.cubilia.Curae@lectuspedeet.com', '(0404) 370', '', 0, 'Jesse'),
(47, 'dolor.Donec.fringilla@risusNulla.ca', '(08092) 68', '', 0, 'Richard'),
(48, 'Fusce.fermentum@Cumsociisnatoque.ca', '(0675) 435', '', 0, 'Alec'),
(49, 'condimentum.Donec.at@Fuscefeugiat.ca', '(0417) 676', '', 0, 'Tate'),
(50, 'Aenean@Maurisvel.org', '(037077) 1', '', 0, 'Geoffrey'),
(51, 'Duis.gravida.Praesent@aliquetvelvulputate.co.uk', '(08328) 72', '', 0, 'Hakeem'),
(52, 'ante.ipsum@laoreetposuere.ca', '(08635) 07', '', 0, 'Judah'),
(53, 'parturient.montes@malesuadavel.org', '(038682) 3', '', 0, 'Hasad'),
(54, 'sem@odioEtiamligula.com', '(08867) 37', '', 0, 'Alvin'),
(55, 'eu.erat@enimnonnisi.co.uk', '(00215) 26', '', 0, 'Colt'),
(56, 'aliquam@Proinnisl.edu', '(085) 5877', '', 0, 'Cain'),
(57, 'dolor.elit.pellentesque@elitpedemalesuada.org', '(01173) 36', '', 0, 'Colton'),
(58, 'eu@tempuseu.net', '(078) 5892', '', 0, 'Ezekiel'),
(59, 'ut.molestie.in@consectetuer.edu', '(030013) 3', '', 0, 'Stuart'),
(60, 'ac.turpis.egestas@ametmassa.co.uk', '(042) 6247', '', 0, 'Arthur'),
(61, 'mauris.eu.elit@anteNuncmauris.ca', '(038052) 4', '', 0, 'Cain'),
(62, 'convallis@Aenean.ca', '(049) 1890', '', 0, 'Mohammad'),
(63, 'auctor@elit.ca', '(06817) 54', '', 0, 'Zahir'),
(64, 'blandit@Vestibulumut.net', '(030191) 3', '', 0, 'Jesse'),
(65, 'In@neque.net', '(008) 1083', '', 0, 'Igor'),
(66, 'lacus.varius@Donec.ca', '(037874) 5', '', 0, 'Hamish'),
(67, 'nec.cursus.a@porttitorscelerisqueneque.ca', '(0608) 677', '', 0, 'Tyler'),
(68, 'Nulla.eget.metus@antedictum.com', '(089) 3058', '', 0, 'Len'),
(69, 'nunc.risus@eros.co.uk', '(0331) 453', '', 0, 'Cyrus'),
(70, 'adipiscing.elit.Aliquam@porttitoreros.com', '(001) 6645', '', 0, 'Abdul'),
(71, 'Donec.nibh@Etiam.ca', '(0701) 346', '', 0, 'Kaseem'),
(72, 'elit@accumsan.edu', '(034483) 8', '', 0, 'Caleb'),
(73, 'at.egestas.a@erat.com', '(039253) 9', '', 0, 'Caleb'),
(74, 'ultrices.posuere@sedduiFusce.edu', '(016) 4848', '', 0, 'Lester'),
(75, 'a@leoelementumsem.org', '(00632) 26', '', 0, 'John'),
(76, 'Nullam.scelerisque@urnaNunc.co.uk', '(035) 2425', '', 0, 'Jordan'),
(77, 'molestie.orci.tincidunt@scelerisqueneque.ca', '(09999) 49', '', 0, 'Lars'),
(78, 'arcu.Vestibulum.ut@elitdictum.edu', '(05371) 97', '', 0, 'Gregory'),
(79, 'velit.in@portaelita.edu', '(0338) 540', '', 0, 'Flynn'),
(80, 'Integer.sem@sapienCras.net', '(0659) 059', '', 0, 'Lance'),
(81, 'fringilla.cursus.purus@lectusNullam.com', '(0915) 382', '', 0, 'Kuame'),
(82, 'Nulla.tempor.augue@diamPellentesquehabitant.edu', '(01094) 67', '', 0, 'Ian'),
(83, 'vestibulum.Mauris.magna@estMauriseu.ca', '(035810) 8', '', 0, 'Kenneth'),
(84, 'diam.Duis@esttempor.ca', '(0356) 705', '', 0, 'Cadman'),
(85, 'penatibus.et@loremluctusut.ca', '(05390) 43', '', 0, 'Cain'),
(86, 'Donec.nibh.Quisque@dui.com', '(085) 6485', '', 0, 'Cole'),
(87, 'blandit.mattis@ultriciesdignissimlacus.ca', '(038634) 3', '', 0, 'Jack'),
(88, 'posuere.enim@quisaccumsan.co.uk', '(03882) 22', '', 0, 'Reuben'),
(89, 'mi.eleifend@elitpellentesquea.ca', '(026) 7645', '', 0, 'Eric'),
(90, 'eget.venenatis@In.org', '(054) 2170', '', 0, 'Price'),
(91, 'eget.tincidunt@senectusetnetus.edu', '(0890) 854', '', 0, 'Addison'),
(92, 'amet.luctus.vulputate@indolor.net', '(0086) 270', '', 0, 'Dean'),
(93, 'dictum.Phasellus.in@enimcommodo.net', '(0050) 582', '', 0, 'Channing'),
(94, 'nunc.sed.pede@Morbiaccumsan.net', '(02737) 90', '', 0, 'Blaze'),
(95, 'in.consequat.enim@acfermentum.ca', '(0494) 239', '', 0, 'Chadwick'),
(96, 'id.libero.Donec@lectus.co.uk', '(031699) 9', '', 0, 'Byron'),
(97, 'ac.mi@egestasblanditNam.net', '(04752) 80', '', 0, 'Owen'),
(98, 'aliquet.Phasellus@augue.co.uk', '(09005) 86', '', 0, 'Porter'),
(99, 'orci.adipiscing.non@augue.ca', '(09796) 58', '', 0, 'Ralph'),
(100, 'sollicitudin@eudoloregestas.ca', '(07442) 27', '', 0, 'Ryder'),
(101, 'Nunc.sed.orci@sitamet.com', '(09196) 99', '', 0, 'Bernard'),
(102, 'fermentum.metus@dolordapibusgravida.org', '(05952) 01', '', 0, 'Quentin'),
(103, 'ac.sem@Phasellusataugue.co.uk', '(092) 16794209', '', 0, 'Harding'),
(104, 'varius@Praesenteu.ca', '(0020) 07989793', '', 0, 'Vincent'),
(105, 'cursus.a.enim@blanditcongueIn.edu', '(031970) 345769', '', 0, 'Philip'),
(106, 'metus@et.com', '(0135) 75546891', '', 0, 'Bruno'),
(107, 'Etiam@nequevenenatis.ca', '(038351) 107008', '', 0, 'Abbot'),
(108, 'neque@euismod.org', '(034622) 511000', '', 0, 'Knox'),
(109, 'cursus@elementumpurus.org', '(047) 95625582', '', 0, 'Neil'),
(110, 'mauris.sit.amet@imperdietullamcorperDuis.org', '(032) 90645516', '', 0, 'Tobias'),
(111, 'et.magnis@dictummi.com', '(093) 59991324', '', 0, 'Hakeem'),
(112, 'at.auctor@liberodui.net', '(0385) 05752823', '', 0, 'Neil'),
(113, 'purus.accumsan.interdum@nuncsed.com', '(039410) 009251', '', 0, 'Igor'),
(114, 'eu@egestasAliquamfringilla.net', '(018) 22057962', '', 0, 'Chandler'),
(115, 'mauris@purussapien.com', '(019) 29445475', '', 0, 'Octavius'),
(116, 'faucibus.orci.luctus@CurabiturdictumPhasellus.org', '(037067) 874123', '', 0, 'Hector'),
(117, 'ipsum.Phasellus.vitae@Quisqueimperdiet.org', '(026) 91021134', '', 0, 'Logan'),
(118, 'ac.mattis.semper@ultriciesdignissimlacus.net', '(00810) 4851128', '', 0, 'Curran'),
(119, 'Quisque.tincidunt@justo.co.uk', '(077) 37548034', '', 0, 'Lee'),
(120, 'hendrerit.neque@rutrum.edu', '(052) 14170395', '', 0, 'Reuben'),
(121, 'Donec.fringilla@massaMaurisvestibulum.com', '(0641) 25837342', '', 0, 'Lawrence'),
(122, 'diam.Proin.dolor@auctornon.org', '(01693) 2917266', '', 0, 'Barclay'),
(123, 'at.velit@magna.org', '(03789) 8211067', '', 0, 'Kuame'),
(124, 'Aliquam.nisl.Nulla@lacusNullatincidunt.net', '(04671) 2680053', '', 0, 'Gregory'),
(125, 'Duis@facilisis.com', '(075) 52234492', '', 0, 'Hall'),
(126, 'tempus.mauris.erat@maurisid.edu', '(0858) 43822057', '', 0, 'Hashim'),
(127, 'nulla.Donec@lacus.co.uk', '(030606) 018941', '', 0, 'Alfonso'),
(128, 'Donec.est@ac.ca', '(05125) 1664922', '', 0, 'Russell'),
(129, 'Nam.tempor@Duissit.org', '(0739) 06547558', '', 0, 'Trevor'),
(130, 'semper.rutrum.Fusce@ametornare.net', '(0273) 93421252', '', 0, 'Brian'),
(131, 'a@nectempus.edu', '(0073) 98542341', '', 0, 'Nicholas'),
(132, 'Donec.nibh.Quisque@semper.com', '(030209) 021362', '', 0, 'Herrod'),
(133, 'Sed@amifringilla.org', '(0272) 68477498', '', 0, 'Leroy'),
(134, 'egestas.a@feugiat.co.uk', '(042) 72898815', '', 0, 'Basil'),
(135, 'Duis@Aliquam.org', '(045) 72102304', '', 0, 'Nero'),
(136, 'iaculis.lacus.pede@infaucibusorci.co.uk', '(094) 17126852', '', 0, 'Arsenio'),
(137, 'Duis@placeratorcilacus.com', '(036683) 082094', '', 0, 'Castor'),
(138, 'egestas.a.scelerisque@interdumCurabitur.ca', '(052) 45237234', '', 0, 'Micah'),
(139, 'ornare.elit.elit@Proinnislsem.co.uk', '(06797) 3952142', '', 0, 'Owen'),
(140, 'egestas.urna.justo@facilisismagnatellus.org', '(031569) 251906', '', 0, 'Troy'),
(141, 'lorem.luctus@sitamet.ca', '(012) 25795139', '', 0, 'Caldwell'),
(142, 'placerat.eget@lectuspede.org', '(0976) 33038483', '', 0, 'Connor'),
(143, 'a@ligula.org', '(036482) 302921', '', 0, 'Amir'),
(144, 'natoque.penatibus.et@euismodin.net', '(030199) 159211', '', 0, 'Denton'),
(145, 'non.egestas@ametrisusDonec.ca', '(096) 38027410', '', 0, 'Nash'),
(146, 'posuere.cubilia.Curae@lectuspedeet.com', '(0404) 37014965', '', 0, 'Jesse'),
(147, 'dolor.Donec.fringilla@risusNulla.ca', '(08092) 6832988', '', 0, 'Richard'),
(148, 'Fusce.fermentum@Cumsociisnatoque.ca', '(0675) 43509744', '', 0, 'Alec'),
(149, 'condimentum.Donec.at@Fuscefeugiat.ca', '(0417) 67692560', '', 0, 'Tate'),
(150, 'Aenean@Maurisvel.org', '(037077) 179709', '', 0, 'Geoffrey'),
(151, 'Duis.gravida.Praesent@aliquetvelvulputate.co.uk', '(08328) 7206499', '', 0, 'Hakeem'),
(152, 'ante.ipsum@laoreetposuere.ca', '(08635) 0775730', '', 0, 'Judah'),
(153, 'parturient.montes@malesuadavel.org', '(038682) 378749', '', 0, 'Hasad'),
(154, 'sem@odioEtiamligula.com', '(08867) 3799513', '', 0, 'Alvin'),
(155, 'eu.erat@enimnonnisi.co.uk', '(00215) 2660749', '', 0, 'Colt'),
(156, 'aliquam@Proinnisl.edu', '(085) 58774931', '', 0, 'Cain'),
(157, 'dolor.elit.pellentesque@elitpedemalesuada.org', '(01173) 3671208', '', 0, 'Colton'),
(158, 'eu@tempuseu.net', '(078) 58922399', '', 0, 'Ezekiel'),
(159, 'ut.molestie.in@consectetuer.edu', '(030013) 326295', '', 0, 'Stuart'),
(160, 'ac.turpis.egestas@ametmassa.co.uk', '(042) 62471163', '', 0, 'Arthur'),
(161, 'mauris.eu.elit@anteNuncmauris.ca', '(038052) 453288', '', 0, 'Cain'),
(162, 'convallis@Aenean.ca', '(049) 18903070', '', 0, 'Mohammad'),
(163, 'auctor@elit.ca', '(06817) 5497348', '', 0, 'Zahir'),
(164, 'blandit@Vestibulumut.net', '(030191) 337960', '', 0, 'Jesse'),
(165, 'In@neque.net', '(008) 10838762', '', 0, 'Igor'),
(166, 'lacus.varius@Donec.ca', '(037874) 549973', '', 0, 'Hamish'),
(167, 'nec.cursus.a@porttitorscelerisqueneque.ca', '(0608) 67731281', '', 0, 'Tyler'),
(168, 'Nulla.eget.metus@antedictum.com', '(089) 30581413', '', 0, 'Len'),
(169, 'nunc.risus@eros.co.uk', '(0331) 45352484', '', 0, 'Cyrus'),
(170, 'adipiscing.elit.Aliquam@porttitoreros.com', '(001) 66452482', '', 0, 'Abdul'),
(171, 'Donec.nibh@Etiam.ca', '(0701) 34663716', '', 0, 'Kaseem'),
(172, 'elit@accumsan.edu', '(034483) 821279', '', 0, 'Caleb'),
(173, 'at.egestas.a@erat.com', '(039253) 948195', '', 0, 'Caleb'),
(174, 'ultrices.posuere@sedduiFusce.edu', '(016) 48484500', '', 0, 'Lester'),
(175, 'a@leoelementumsem.org', '(00632) 2630768', '', 0, 'John'),
(176, 'Nullam.scelerisque@urnaNunc.co.uk', '(035) 24257520', '', 0, 'Jordan'),
(177, 'molestie.orci.tincidunt@scelerisqueneque.ca', '(09999) 4928383', '', 0, 'Lars'),
(178, 'arcu.Vestibulum.ut@elitdictum.edu', '(05371) 9766972', '', 0, 'Gregory'),
(179, 'velit.in@portaelita.edu', '(0338) 54028548', '', 0, 'Flynn'),
(180, 'Integer.sem@sapienCras.net', '(0659) 05983617', '', 0, 'Lance'),
(181, 'fringilla.cursus.purus@lectusNullam.com', '(0915) 38228108', '', 0, 'Kuame'),
(182, 'Nulla.tempor.augue@diamPellentesquehabitant.edu', '(01094) 6765765', '', 0, 'Ian'),
(183, 'vestibulum.Mauris.magna@estMauriseu.ca', '(035810) 823401', '', 0, 'Kenneth'),
(184, 'diam.Duis@esttempor.ca', '(0356) 70580313', '', 0, 'Cadman'),
(185, 'penatibus.et@loremluctusut.ca', '(05390) 4351512', '', 0, 'Cain'),
(186, 'Donec.nibh.Quisque@dui.com', '(085) 64855381', '', 0, 'Cole'),
(187, 'blandit.mattis@ultriciesdignissimlacus.ca', '(038634) 335955', '', 0, 'Jack'),
(188, 'posuere.enim@quisaccumsan.co.uk', '(03882) 2229725', '', 0, 'Reuben'),
(189, 'mi.eleifend@elitpellentesquea.ca', '(026) 76458781', '', 0, 'Eric'),
(190, 'eget.venenatis@In.org', '(054) 21703943', '', 0, 'Price'),
(191, 'eget.tincidunt@senectusetnetus.edu', '(0890) 85419872', '', 0, 'Addison'),
(192, 'amet.luctus.vulputate@indolor.net', '(0086) 27086687', '', 0, 'Dean'),
(193, 'dictum.Phasellus.in@enimcommodo.net', '(0050) 58214058', '', 0, 'Channing'),
(194, 'nunc.sed.pede@Morbiaccumsan.net', '(02737) 9003987', '', 0, 'Blaze'),
(195, 'in.consequat.enim@acfermentum.ca', '(0494) 23912429', '', 0, 'Chadwick'),
(196, 'id.libero.Donec@lectus.co.uk', '(031699) 937296', '', 0, 'Byron'),
(197, 'ac.mi@egestasblanditNam.net', '(04752) 8005870', '', 0, 'Owen'),
(198, 'aliquet.Phasellus@augue.co.uk', '(09005) 8628721', '', 0, 'Porter'),
(199, 'orci.adipiscing.non@augue.ca', '(09796) 5805250', '', 0, 'Ralph'),
(200, 'sollicitudin@eudoloregestas.ca', '(07442) 2719972', '', 0, 'Ryder'),
(201, 'Nunc.sed.orci@sitamet.com', '(09196) 9963407', '', 0, 'Bernard'),
(202, 'fermentum.metus@dolordapibusgravida.org', '(05952) 0189039', '', 0, 'Quentin'),
(203, '', '063 437 4741', '', 0, 'Emty'),
(204, '', '0633247498', '4297f44b13955235245b2497399d7a93', 2, 'Vis'),
(207, '', '0', '', 3, '0'),
(208, '', '380634374741', 'd41d8cd98f00b204e9800998ecf8427e', 2, ''),
(209, '', '123123123', 'd41d8cd98f00b204e9800998ecf8427e', 2, ''),
(210, '', '30634374747', 'd41d8cd98f00b204e9800998ecf8427e', 2, ''),
(211, '', '380634374742', '4297f44b13955235245b2497399d7a93', 2, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
