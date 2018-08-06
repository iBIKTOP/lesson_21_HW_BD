-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 06 2018 г., 23:01
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `firma`
--

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sity_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`, `sity_name`) VALUES
(1, 'test1', 'Dnepr'),
(3, 'Чп Иванов В.В.', 'Dnepr'),
(4, 'ООО Секрет', 'Kiev'),
(2, 'test2', 'Liev');

-- --------------------------------------------------------

--
-- Структура таблицы `deal`
--

CREATE TABLE `deal` (
  `id` int(12) UNSIGNED NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `sity_name_start` varchar(255) NOT NULL,
  `sity_name_finish` varchar(255) NOT NULL,
  `drivers_name` varchar(255) NOT NULL,
  `price` int(20) NOT NULL,
  `method_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `deal`
--

INSERT INTO `deal` (`id`, `client_name`, `sity_name_start`, `sity_name_finish`, `drivers_name`, `price`, `method_name`) VALUES
(1, 'test1', 'Dnepr', 'Kiev', 'ФЛП Пупкин', 5000, 'Б/Н с НДС'),
(2, 'ООО Секрет', 'Dnepr', 'Kiev', 'ФЛП Пупкин', 6000, 'Б/Н с НДС'),
(3, 'Чп Иванов В.В.', 'Lviv', 'Dnepr', 'ФЛП Пупкин', 18000, 'Б/Н с НДС');

-- --------------------------------------------------------

--
-- Структура таблицы `drivers`
--

CREATE TABLE `drivers` (
  `id` int(12) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sity_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `sity_name`) VALUES
(2, 'ФЛП Дудкин', 'Dnepr'),
(1, 'ФЛП Пупкин', 'Lviv');

-- --------------------------------------------------------

--
-- Структура таблицы `method`
--

CREATE TABLE `method` (
  `id` int(12) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `method`
--

INSERT INTO `method` (`id`, `name`) VALUES
(2, 'Б/Н единый'),
(1, 'Б/Н с НДС'),
(4, 'Нал'),
(3, 'Софт');

-- --------------------------------------------------------

--
-- Структура таблицы `sity`
--

CREATE TABLE `sity` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sity`
--

INSERT INTO `sity` (`id`, `name`) VALUES
(1, 'Dnepr'),
(4, 'Kiev'),
(3, 'Liev'),
(2, 'Lviv');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`,`sity_name`,`name`),
  ADD KEY `sity_name` (`sity_name`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`id`,`client_name`,`sity_name_start`,`sity_name_finish`,`drivers_name`),
  ADD KEY `client_name` (`client_name`),
  ADD KEY `sity_name_start_fk_idx` (`sity_name_start`),
  ADD KEY `sity_name_finish_fk_idx` (`sity_name_finish`),
  ADD KEY `drivers_name_fk_idx` (`drivers_name`),
  ADD KEY `drivers_name` (`drivers_name`),
  ADD KEY `idx_deal_method_name` (`method_name`),
  ADD KEY `method_name_fk_idx` (`method_name`);

--
-- Индексы таблицы `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`,`sity_name`,`name`),
  ADD KEY `sity_name_fk_idx` (`sity_name`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `method`
--
ALTER TABLE `method`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `idx_method_name` (`name`);

--
-- Индексы таблицы `sity`
--
ALTER TABLE `sity`
  ADD PRIMARY KEY (`id`,`name`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `deal`
--
ALTER TABLE `deal`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `method`
--
ALTER TABLE `method`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `sity`
--
ALTER TABLE `sity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk` FOREIGN KEY (`sity_name`) REFERENCES `sity` (`name`);

--
-- Ограничения внешнего ключа таблицы `deal`
--
ALTER TABLE `deal`
  ADD CONSTRAINT `client_name_fk` FOREIGN KEY (`client_name`) REFERENCES `client` (`name`),
  ADD CONSTRAINT `drivers_name_fk` FOREIGN KEY (`drivers_name`) REFERENCES `drivers` (`name`),
  ADD CONSTRAINT `method_name_fk` FOREIGN KEY (`method_name`) REFERENCES `method` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sity_name_finish_fk` FOREIGN KEY (`sity_name_finish`) REFERENCES `sity` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sity_name_start_fk` FOREIGN KEY (`sity_name_start`) REFERENCES `sity` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `sity_name_fk` FOREIGN KEY (`sity_name`) REFERENCES `sity` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
