-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 08 2018 г., 18:41
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
  `id` int(12) UNSIGNED NOT NULL,
  `clientName` varchar(255) NOT NULL,
  `sity_id` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `clientName`, `sity_id`) VALUES
(5, 'ФЛП Пупкин В.В.', 1),
(6, 'ООО Клубничка', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `deal`
--

CREATE TABLE `deal` (
  `id` int(12) UNSIGNED NOT NULL,
  `client_id` int(12) UNSIGNED DEFAULT NULL,
  `driver_id` int(12) UNSIGNED NOT NULL,
  `sityStart_id` int(12) UNSIGNED NOT NULL,
  `sityFinish_id` int(12) UNSIGNED NOT NULL,
  `price` varchar(45) NOT NULL,
  `method_id` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `deal`
--

INSERT INTO `deal` (`id`, `client_id`, `driver_id`, `sityStart_id`, `sityFinish_id`, `price`, `method_id`) VALUES
(1, 6, 2, 1, 1, '3200', 1),
(2, 5, 1, 4, 1, '8000', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `drivers`
--

CREATE TABLE `drivers` (
  `id` int(12) UNSIGNED NOT NULL,
  `driverName` varchar(255) NOT NULL,
  `sity_id` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `drivers`
--

INSERT INTO `drivers` (`id`, `driverName`, `sity_id`) VALUES
(1, 'ФЛП Кушнир С.В.', 1),
(2, 'ООО АРТА', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `method`
--

CREATE TABLE `method` (
  `id` int(12) UNSIGNED NOT NULL,
  `methodName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `method`
--

INSERT INTO `method` (`id`, `methodName`) VALUES
(1, 'Б/Н с НДС'),
(2, 'Б/Н единый'),
(3, 'Софт'),
(4, 'Нал');

-- --------------------------------------------------------

--
-- Структура таблицы `sity`
--

CREATE TABLE `sity` (
  `id` int(12) UNSIGNED NOT NULL,
  `sityName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sity`
--

INSERT INTO `sity` (`id`, `sityName`) VALUES
(1, 'Dnepr'),
(2, 'Lviv'),
(4, 'Kiev');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sity_id` (`sity_id`);

--
-- Индексы таблицы `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `sityStart_id` (`sityStart_id`),
  ADD KEY `sityFinish_id` (`sityFinish_id`),
  ADD KEY `method_id` (`method_id`);

--
-- Индексы таблицы `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sity_id` (`sity_id`) USING BTREE;

--
-- Индексы таблицы `method`
--
ALTER TABLE `method`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sity`
--
ALTER TABLE `sity`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `deal`
--
ALTER TABLE `deal`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_sity_id_fk` FOREIGN KEY (`sity_id`) REFERENCES `sity` (`id`);

--
-- Ограничения внешнего ключа таблицы `deal`
--
ALTER TABLE `deal`
  ADD CONSTRAINT `client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `driver_id_fk` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `method_id` FOREIGN KEY (`method_id`) REFERENCES `method` (`id`),
  ADD CONSTRAINT `sityFinish_id` FOREIGN KEY (`sityFinish_id`) REFERENCES `sity` (`id`),
  ADD CONSTRAINT `sityStart_id` FOREIGN KEY (`sityStart_id`) REFERENCES `sity` (`id`);

--
-- Ограничения внешнего ключа таблицы `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `driver_sity_id_fk` FOREIGN KEY (`sity_id`) REFERENCES `sity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
