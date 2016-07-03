-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: rm-j6c2il7681qgjcw7o.mysql.rds.aliyuncs.com
-- Generation Time: 2016 年 7 月 03 日 12:27
-- サーバのバージョン： 5.5.18.1-log
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marcopanda`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` bigint(20) NOT NULL COMMENT '主キー',
  `user_uuid` varchar(100) DEFAULT NULL COMMENT 'ユーザID。NULLの場合匿名',
  `spot_id` bigint(20) NOT NULL COMMENT 'スポットID（FK）',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '匿名の場合付けられる',
  `article_text` text COMMENT '投稿文書',
  `text_language_code` varchar(100) DEFAULT NULL COMMENT '投稿文書言語（iso15924）',
  `like_number` int(11) NOT NULL DEFAULT '0' COMMENT 'いいね数',
  `average_star` float DEFAULT '0' COMMENT '平均星数（全体）',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='旅行誌';

-- --------------------------------------------------------

--
-- テーブルの構造 `article_like`
--

DROP TABLE IF EXISTS `article_like`;
CREATE TABLE IF NOT EXISTS `article_like` (
  `article_id` bigint(20) NOT NULL COMMENT '旅行誌ID',
  `user_uuid` varchar(100) NOT NULL COMMENT 'ユーザUUID',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '作成日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='旅行誌いいね履歴';

-- --------------------------------------------------------

--
-- テーブルの構造 `article_multimedia`
--

DROP TABLE IF EXISTS `article_multimedia`;
CREATE TABLE IF NOT EXISTS `article_multimedia` (
  `multimedia_id` bigint(20) NOT NULL COMMENT '主キー',
  `article_id` bigint(20) NOT NULL COMMENT '記事主キー(FK)',
  `sort` tinyint(4) NOT NULL COMMENT 'ソート順。小さいのは頭',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='記事添付ファイル';

-- --------------------------------------------------------

--
-- テーブルの構造 `article_star`
--

DROP TABLE IF EXISTS `article_star`;
CREATE TABLE IF NOT EXISTS `article_star` (
  `article_id` bigint(20) NOT NULL COMMENT '旅行誌ID',
  `user_uuid` varchar(100) NOT NULL COMMENT 'ユーザUUID',
  `star` tinyint(4) NOT NULL COMMENT '星数',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='旅行誌星付け履歴';

-- --------------------------------------------------------

--
-- テーブルの構造 `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
CREATE TABLE IF NOT EXISTS `multimedia` (
  `multimedia_id` bigint(20) NOT NULL COMMENT '主キー',
  `media_type` tinyint(4) NOT NULL COMMENT '1:画像 2:音声 3:動画',
  `mime_type` varchar(30) DEFAULT NULL COMMENT 'MIME TYPE',
  `filename` varchar(255) DEFAULT NULL COMMENT '元ファイル名',
  `save_path` varchar(255) NOT NULL COMMENT '保存するパス',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='記事添付ファイル';

-- --------------------------------------------------------

--
-- テーブルの構造 `spot`
--

DROP TABLE IF EXISTS `spot`;
CREATE TABLE IF NOT EXISTS `spot` (
  `spot_id` bigint(20) NOT NULL COMMENT '主キー',
  `location_name` varchar(300) DEFAULT NULL COMMENT '地名',
  `longitude` double(9,6) NOT NULL COMMENT '経度',
  `latitude` double(8,6) NOT NULL COMMENT '緯度',
  `location_name_jp` varchar(300) DEFAULT NULL COMMENT '日本語地名',
  `category_id` smallint(6) NOT NULL DEFAULT '99' COMMENT 'カテゴリID。spot_idがNULLの場合必須。1:温泉 2:レストラン 3:ホテル 4:観光スポット 5:交通 6:ショッピング 7:イベント 8:公共施設 9:アミューズメント 10:病院 99:その他',
  `cost_id` tinyint(4) NOT NULL DEFAULT '99' COMMENT 'コストID。spot_idがNULLの場合必須。1:¥0 2:¥1〜¥1,000 3:¥1,001〜¥2,000 4:¥2,001〜¥5,000 5:¥5,001〜¥10,000 6:¥10,001〜 99:不明',
  `article_count` int(11) NOT NULL DEFAULT '0' COMMENT '該当スポットに投稿数',
  `like_sum` bigint(20) NOT NULL DEFAULT '0' COMMENT '該当スポットに投稿のいいね数の合計',
  `average_star` double(9,6) DEFAULT '0.000000' COMMENT '該当スポットに投稿の平均星数の平均',
  `article_count_in_last_30_days` int(11) NOT NULL DEFAULT '0' COMMENT '直近３０日に該当スポットに投稿の数',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='スポット';

-- --------------------------------------------------------

--
-- テーブルの構造 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_uuid` varchar(100) NOT NULL COMMENT '主キー。ランダム文字列',
  `come_from` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'どのSNSから来た。0:development 1:mail 2:facebook 3:google 4:wechat 5:twitter 6:linkedin',
  `login_account` varchar(255) DEFAULT NULL COMMENT 'ログインアカウント。come_fromが1の場合メールアドレスになる。',
  `nickname` varchar(255) DEFAULT NULL COMMENT 'ニックネーム',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性別。1:男性 2:女性',
  `generation` tinyint(4) DEFAULT NULL COMMENT '年代。1:〜9 2:10〜19 3:20〜29 4:30〜39 5:40〜49 6:50〜59 7:60〜69 8:70〜79 9:80〜',
  `country` varchar(100) DEFAULT NULL COMMENT '国名',
  `image_file` varchar(255) DEFAULT NULL COMMENT 'ユーザアイコンURLパス',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ユーザ';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `article_like`
--
ALTER TABLE `article_like`
  ADD PRIMARY KEY (`article_id`,`user_uuid`);

--
-- Indexes for table `article_multimedia`
--
ALTER TABLE `article_multimedia`
  ADD PRIMARY KEY (`multimedia_id`,`article_id`);

--
-- Indexes for table `multimedia`
--
ALTER TABLE `multimedia`
  ADD PRIMARY KEY (`multimedia_id`),
  ADD KEY `save_path` (`save_path`(191));

--
-- Indexes for table `spot`
--
ALTER TABLE `spot`
  ADD PRIMARY KEY (`spot_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主キー';
--
-- AUTO_INCREMENT for table `multimedia`
--
ALTER TABLE `multimedia`
  MODIFY `multimedia_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主キー';
--
-- AUTO_INCREMENT for table `spot`
--
ALTER TABLE `spot`
  MODIFY `spot_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主キー';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
