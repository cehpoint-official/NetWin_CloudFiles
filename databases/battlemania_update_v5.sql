CREATE TABLE `challenge_result_upload` (
  `challenge_result_upload_id` int(10) NOT NULL,
  `ludo_challenge_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `result_uploded_by_flag` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=by addedd,1=by accepted',
  `result_image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=win,1=lost,2=error',
  `date_created` datetime NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `challenge_room_code` (
  `challenge_room_code_id` int(10) NOT NULL,
  `challenge_id` int(10) NOT NULL,
  `room_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ludo_challenge` (
  `ludo_challenge_id` int(10) NOT NULL,
  `game_id` int(10) NOT NULL,
  `auto_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) NOT NULL,
  `accepted_member_id` int(10) NOT NULL,
  `ludo_king_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accepted_ludo_king_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin` int(10) NOT NULL,
  `winning_price` float NOT NULL,
  `room_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0= not accept,1=accepted',
  `challenge_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=canceled,3=completed,4=pending',
  `with_password` ENUM('0','1') NOT NULL DEFAULT '0',
  `challenge_password` TEXT NULL DEFAULT NULL,
  `notification_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0= not send,1=send',
  `canceled_by` int(10) NOT NULL,
  `winner_id` int(10) NOT NULL,
  `accepted_date` datetime NULL,
  `date_created` datetime NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notifications` (
  `notifications_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `game_id` int(5) NOT NULL,
  `id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `challenge_result_upload`
  ADD PRIMARY KEY (`challenge_result_upload_id`),MODIFY `challenge_result_upload_id` int(10) NOT NULL AUTO_INCREMENT;
  
 ALTER TABLE `challenge_room_code`
  ADD PRIMARY KEY (`challenge_room_code_id`),MODIFY `challenge_room_code_id` int(10) NOT NULL AUTO_INCREMENT;
  
 ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notifications_id`),MODIFY `notifications_id` int(10) NOT NULL AUTO_INCREMENT;
  
 ALTER TABLE `ludo_challenge`
  ADD PRIMARY KEY (`ludo_challenge_id`),MODIFY `ludo_challenge_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `member`  ADD `ludo_username` TEXT NOT NULL  AFTER `entry_from`,  ADD `budy_list` LONGTEXT NOT NULL  AFTER `profile_image`,ADD `push_noti` ENUM('0','1') NOT NULL DEFAULT '1' COMMENT '0=off,1=on'  AFTER `budy_list`;

INSERT INTO `web_config` (`id`, `web_config_name`, `web_config_value`) VALUES (NULL, 'coin_up_to_hundrade', '5'), (NULL, 'coin_under_hundrade', '10'),(NULL, 'admin_profit', '5'),(NULL, 'min_require_balance_for_withdrawal', ''),(NULL, 'referral_min_paid_fee', '20');

ALTER TABLE `game`  ADD `game_type` ENUM('0','1') NOT NULL DEFAULT '0' COMMENT '\'0=normal,1=ludo functionality\''  AFTER `status`,ADD `id_prefix` VARCHAR(10) NULL  AFTER `game_type`,ADD `follower` LONGTEXT NOT NULL AFTER `game_type`;

INSERT INTO `permission` (`permission_id`, `name`, `code_name`, `parent_status`) VALUES (NULL, 'Challenge', 'ludo_challenge', 'parent'),(NULL, 'View', 'ludo_challenge_view', '85'), (NULL, 'Delete', 'ludo_challenge_delete', '85');

UPDATE `permission` SET `name` = 'Push Notification' WHERE `permission`.`permission_id` = 76;

ALTER TABLE `matches` DROP `match_password`, DROP `match_id`;

ALTER TABLE `matches`  ADD `room_description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL  AFTER `prize_description`;
