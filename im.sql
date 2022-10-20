-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 18 2022 г., 17:41
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `im`
--

-- --------------------------------------------------------

--
-- Структура таблицы `advantages`
--

CREATE TABLE `advantages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `advantages`
--

INSERT INTO `advantages` (`id`, `name`, `img`, `menu_position`, `visible`) VALUES
(1, 'преимущество 1', 'advantages/201705101443271.png', 2, 1),
(2, 'преимущество 2', 'advantages/rutube.png', 3, 0),
(3, 'преимущество 3', 'advantages/3.jpg', 1, 1),
(4, 'ghtbveotcndj 4', 'advantages/5704c8850c854435ebbf8dfb24094910.png', 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `name`, `parent_id`, `menu_position`, `content`) VALUES
(1, 'art1', NULL, 1, NULL),
(2, 'art2', NULL, 1, NULL),
(3, 'art3', NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `blocked_access`
--

CREATE TABLE `blocked_access` (
  `id` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `trying` tinyint(1) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `keywords` varchar(400) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `keywords`, `description`, `alias`, `img`, `visible`, `parent_id`, `menu_position`) VALUES
(1, 'Cat 1', '', '', 'cat-1', NULL, 1, NULL, 2),
(2, 'Cat 2', '', '', 'cat-2', NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `filters`
--

CREATE TABLE `filters` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  `visible` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `filters`
--

INSERT INTO `filters` (`id`, `name`, `content`, `visible`, `parent_id`, `menu_position`) VALUES
(17, 'red', '1', 1, 25, 1),
(18, 'green', '2', 1, 25, 2),
(19, '200mm', '3', 1, 26, 1),
(20, '300mm', '4', 1, 26, 2),
(23, '400mm', '', 1, 26, 3),
(24, 'lightred', NULL, 1, 25, 3),
(25, 'Color', NULL, 1, NULL, 4),
(26, 'Width', NULL, 1, NULL, 6),
(29, 'height', '', 1, NULL, 5),
(30, '1 px', '', 1, 29, 2),
(31, '2px', '', 1, 29, 1),
(32, '3px', '', 1, 29, 3),
(33, 'Какой то фильтр1', '', 1, NULL, 3),
(34, 'зн какого то фильтра 1', '', 1, 33, 1),
(35, 'какой то фильтр 2', '', 1, NULL, 2),
(36, 'зн какого то фильтра 2', '', 1, 35, 1),
(37, 'какой то фильтр 3', '', 1, NULL, 1),
(38, 'зн какого то фильтра 3', '', 1, 37, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `filters_categories`
--

CREATE TABLE `filters_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `filters_categories`
--

INSERT INTO `filters_categories` (`id`, `name`) VALUES
(1, 'Цвет'),
(2, 'Ширина');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `visible` int(11) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `content` text,
  `keywords` varchar(255) DEFAULT NULL,
  `gallery_img` text,
  `date` date DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `main_img` varchar(255) DEFAULT NULL,
  `new_gallery_img` text,
  `parent_id` int(11) DEFAULT NULL,
  `price` float DEFAULT '0',
  `discount` int(11) DEFAULT NULL,
  `hit` int(11) DEFAULT '0',
  `sale` int(11) DEFAULT '0',
  `new` int(11) DEFAULT '0',
  `hot` int(11) DEFAULT '0',
  `short_content` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `visible`, `menu_position`, `img`, `content`, `keywords`, `gallery_img`, `date`, `datetime`, `alias`, `main_img`, `new_gallery_img`, `parent_id`, `price`, `discount`, `hit`, `sale`, `new`, `hot`, `short_content`) VALUES
(3, 'test', 1, 1, 'goods/1.png', '<p>sfkjhdlkfjhlkdfjhlkdkjflkhjd</p>', '', '[\"goods\\/1_84193277.png\",\"goods\\/2.jpg\",\"goods\\/3.jpg\",\"goods\\/php_magazin1.jpg\",\"goods\\/php_magazin2.jpg\",\"goods\\/php_magazin3.jpg\",\"goods\\/php_magazin4.jpg\",\"goods\\/php_magazin5.jpg\",\"goods\\/php_magazin6.jpg\"]', '2022-08-18', '2022-08-18 17:19:18', 'test', NULL, '[\"favicon.ico\",\"favicon_ec60f18b.ico\",\"iskhodnik.png\",\"kisspng-earring-jewellery-gemstone-diamond-gold-rings-png-clipart-5a78239544c4b32884551215178228692817.png\"]', 1, 10, 10, 1, 1, 0, 0, ''),
(49, 'good test', 1, 3, 'da33f319-de31-419a-a1af-509de74b4d8d.jpg', '', '', '[\"da33f319-de31-419a-a1af-509de74b4d8d_f7c173d3.jpg\"]', '2022-04-09', '2022-04-09 17:43:39', 'good-test', NULL, '[\"goods\\/afe50da436190f5c3e20cd2e0328add4.jpg\",\"goods\\/600002151267b0.jpeg\",\"goods\\/z29vzhmvnjawmdaymtuxmjy3yjauanblzw.url\",\"goods\\/z29vzhmvywzlntbkytqznje5mgy1yznlmjbjzdjlmdmyogfkzdquanbn.url\",\"goods\\/z29vzhmvywzlntbkytqznje5mgy1yznlmjbjzdjlmdmyogfkzdquanbn_4402ff64.url\",\"goods\\/z29vzhmvywzlntbkytqznje5mgy1yznlmjbjzdjlmdmyogfkzdquanbn_d19a5e4f.url\"]', 2, 30, 0, 0, 0, 1, 1, NULL),
(50, 'good_yesy1', 0, 1, NULL, '', '', '[\"da33f319-de31-419a-a1af-509de74b4d8d_e00e57e5.jpg\"]', '2022-09-03', '2022-09-03 15:12:15', 'good_yesy1', NULL, '[\"da33f319-de31-419a-a1af-509de74b4d8d_57cab0a2.jpg\",\"f716a908-62a4-40be-97c9-2e990b903099_f56969ca.jpg\"]', 2, 20, 50, 0, 0, 0, 1, ''),
(53, 'good_new', 1, 2, 'goods/111bigjpg.jpg', '<p>test</p>', '', '[\"840-8403169_download-svg-download-png-doctor-emoji_6720d219.png\",\"foto1.png\",\"31-311861_woman-student-icon-emojis-de-princesas_d1ca0a6d.png\",\"goods\\/840-8403169_download-svg-download-png-doctor-emoji.png\"]', '2022-07-22', '2022-07-22 19:07:41', 'test-53', '840-8403169_download-svg-download-png-doctor-emoji.png', '[\"840-8403169_download-svg-download-png-doctor-emoji_03cb006d.png\",\"kisspng-earring-jewellery-gemstone-diamond-gold-rings-png-clipart-5a78239544c4b32884551215178228692817.png\"]', 2, 150, 0, 1, 0, 0, 0, 'что то там');

-- --------------------------------------------------------

--
-- Структура таблицы `goods_filters`
--

CREATE TABLE `goods_filters` (
  `filters_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `goods_filters`
--

INSERT INTO `goods_filters` (`filters_id`, `goods_id`) VALUES
(17, 3),
(17, 53),
(18, 53),
(20, 3),
(24, 3),
(24, 49),
(24, 53),
(30, 3),
(30, 50),
(30, 53),
(32, 50),
(34, 3),
(36, 3),
(38, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `keywords` varchar(400) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL,
  `show_top_menu` tinyint(4) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `information`
--

INSERT INTO `information` (`id`, `name`, `alias`, `keywords`, `description`, `visible`, `menu_position`, `show_top_menu`, `content`) VALUES
(1, 'Оплата и доставкка', 'oplata-i-dostavkka', '', '', 1, 2, 1, '<p>delivery</p>'),
(2, 'Акции и скидки', 'aktsii-i-skidki', '', '', 1, 1, 1, NULL),
(3, 'Политика конфиденциальности', 'politika-konfidentsialnosti', '', '', 1, 3, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `short_content` varchar(400) DEFAULT NULL,
  `content` text,
  `visible` tinyint(1) DEFAULT '1',
  `alias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `name`, `date`, `short_content`, `content`, `visible`, `alias`) VALUES
(1, 'Новость 1', '2022-05-05', 'фафлоырал лфооыра флор ', '', 1, NULL),
(2, 'Новость 2', '2022-07-07', 'ффыафафы 44444', '', 1, NULL),
(3, 'Новость 3', '2022-07-07', 'длфоыад дфлоа дфлыоа', '', 1, NULL),
(4, 'Новость 4', '2022-07-07', 'флоа фдыола дфлоыадлофыд алофд', '', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `old_alias`
--

CREATE TABLE `old_alias` (
  `alias` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `parsing_data`
--

CREATE TABLE `parsing_data` (
  `all_links` longtext,
  `temp_links` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `parsing_data`
--

INSERT INTO `parsing_data` (`all_links`, `temp_links`) VALUES
('', '');

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `img` varchar(255) DEFAULT NULL,
  `external_alias` varchar(255) DEFAULT NULL,
  `short_content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `sales`
--

INSERT INTO `sales` (`id`, `name`, `sub_title`, `menu_position`, `visible`, `img`, `external_alias`, `short_content`) VALUES
(1, 'Акция 1', 'Продажа', 1, 1, 'sales/kuku-ohibka.png', '/catalog/autozapchasti', 'Мы что то проддаем'),
(2, 'Акция 2', 'Услуга', 2, 1, 'sales/5704c8850c854435ebbf8dfb24094910.png', '/about/', 'Что то о нас');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `keywords` varchar(400) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `img_years` varchar(255) DEFAULT NULL,
  `number_of_years` varchar(255) DEFAULT NULL,
  `content` text,
  `short_content` text,
  `promo_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `name`, `keywords`, `description`, `phone`, `email`, `img`, `address`, `img_years`, `number_of_years`, `content`, `short_content`, `promo_img`) VALUES
(1, 'Автозапчасти', '', '', '+8(800)000-00-00', 'test@test.ru', 'settings/logo.svg', 'Москва', 'settings/15.svg', '15', '<p>привет мир</p>\r\n<p>пока планета</p>', '<p>кратенько о нас</p>', 'settings/css3-1841590_1280.webp');

-- --------------------------------------------------------

--
-- Структура таблицы `socials`
--

CREATE TABLE `socials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `external_alias` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `socials`
--

INSERT INTO `socials` (`id`, `name`, `img`, `external_alias`, `visible`, `menu_position`) VALUES
(1, 'vk', 'socials/vk-white.png', 'https://vk.com', 1, 1),
(2, 'instagram', 'socials/instagram-white.png', 'https://instagram.com', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `test`
--

INSERT INTO `test` (`id`, `name`, `parent_id`, `menu_position`) VALUES
(1, 'cat 0', NULL, 2),
(2, 'cat 0-1', 5, 1),
(3, 'cat 1', NULL, 1),
(4, 'cat 1-1', 3, 1),
(5, 'cat 1-1-1', 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `credentials` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `login`, `password`, `credentials`) VALUES
(1, 'admin', 'admin', '202cb962ac59075b964b07152d234b70', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `advantages`
--
ALTER TABLE `advantages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `blocked_access`
--
ALTER TABLE `blocked_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filters_filters_id_fk` (`parent_id`);

--
-- Индексы таблицы `filters_categories`
--
ALTER TABLE `filters_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_categories_id_fk` (`parent_id`);

--
-- Индексы таблицы `goods_filters`
--
ALTER TABLE `goods_filters`
  ADD PRIMARY KEY (`filters_id`,`goods_id`);

--
-- Индексы таблицы `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_test_id_fk` (`parent_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `advantages`
--
ALTER TABLE `advantages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `blocked_access`
--
ALTER TABLE `blocked_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `filters_categories`
--
ALTER TABLE `filters_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `filters`
--
ALTER TABLE `filters`
  ADD CONSTRAINT `filters_filters_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `filters` (`id`);

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `goods_categories_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `catalog` (`id`);

--
-- Ограничения внешнего ключа таблицы `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_test_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `test` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
