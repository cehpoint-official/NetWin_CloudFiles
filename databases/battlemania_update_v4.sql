ALTER TABLE `admin`  ADD `permission` LONGTEXT NOT NULL  AFTER `default_login`;

ALTER TABLE `currency` CHANGE `currency_code` `currency_code` CHAR(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;

INSERT INTO `currency` (`currency_id`, `currency_name`, `currency_code`, `currency_symbol`, `currency_decimal_place`, `currency_status`, `currency_dateCreated`) VALUES (NULL, 'Token', 'TRX', 'TRX', '2', '1', current_timestamp());

ALTER TABLE `deposit`  ADD `wallet_address` LONGTEXT NULL  AFTER `deposit_amount`,  ADD `private_key` LONGTEXT NULL  AFTER `wallet_address`,  ADD `public_key` LONGTEXT NULL  AFTER `private_key`,  ADD `address_hex` LONGTEXT NULL  AFTER `public_key`;

ALTER TABLE `matches`  ADD `match_private_desc` TEXT NOT NULL  AFTER `match_desc`;

ALTER TABLE `matches` CHANGE `match_status` `match_status` ENUM('0','1','2','3','4') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1' COMMENT '0=deactive,1=active,2 =complete,3 = start,4=cancel';

ALTER TABLE `member`  ADD `profile_image` TEXT NOT NULL  AFTER `new_user`,ADD `user_template` VARCHAR(20) NOT NULL DEFAULT 'bmuserapp'  AFTER `profile_image`;

ALTER TABLE `page`  ADD `add_to_footer` ENUM('0','1') NOT NULL  AFTER `add_to_menu`;

ALTER TABLE `pg_detail` CHANGE `wname` `wname` LONGTEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL, CHANGE `name` `name` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;

ALTER TABLE `matches` DROP `version`;

CREATE TABLE `permission` (
  `permission_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code_name` varchar(100) NOT NULL,
  `parent_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `permission` (`permission_id`, `name`, `code_name`, `parent_status`) VALUES
(1, 'Member', 'members', 'parent'),
(2, 'View', 'members_view', '1'),
(3, 'Delete', 'members_delete', '1'),
(4, 'Register Referral', 'register_referral', 'parent'),
(5, 'Join Referral', 'referral', 'parent'),
(6, 'Game', 'game', 'parent'),
(7, 'Edit', 'game_edit', '6'),
(8, 'Delete', 'game_delete', '6'),
(9, 'Matches', 'matches', 'parent'),
(10, 'Edit', 'matches_edit', '9'),
(11, 'Delete', 'matches_delete', '9'),
(12, 'Image', 'image', 'parent'),
(13, 'Edit', 'image_edit', '12'),
(14, 'Delete', 'image_delete', '12'),
(15, 'Product', 'product', 'parent'),
(16, 'Edit', 'product_edit', '15'),
(17, 'Delete', 'product_delete', '15'),
(18, 'Order', 'order', 'parent'),
(19, 'View', 'order_view', '18'),
(20, 'Courier', 'courier', 'parent'),
(21, 'Edit', 'courier_edit', '20'),
(22, 'Delete', 'courier_delete', '20'),
(23, 'Country', 'country', 'parent'),
(24, 'Edit', 'country_edit', '23'),
(25, 'Delete', 'country_delete', '23'),
(26, 'Money Order', 'pgorder', 'parent'),
(27, 'Withdrawal Request', 'withdraw', 'parent'),
(28, 'Top Player', 'topplayers', 'parent'),
(29, 'LeaderBoard', 'leaderboard', 'parent'),
(30, 'Announcement', 'announcement', '30'),
(31, 'Edit', 'announcement_edit', '30'),
(32, 'Delete', 'announcement_delete', '30'),
(33, 'Lottery', 'lottery', 'parent'),
(34, 'Edit', 'lottery_edit', '33'),
(35, 'Delete', 'lottery_delete', '33'),
(36, 'View', 'lottery_view', '33'),
(37, 'Page', 'page', 'parent'),
(38, 'Edit', 'page_edit', '37'),
(39, 'Delete', 'page_delete', '37'),
(40, 'Main Banner', 'homeheader', 'parent'),
(41, 'Screenshots', 'screenshots', 'parent'),
(42, 'Edit', 'screenshots_delete', '41'),
(43, 'Delete', 'screenshots_delete', '41'),
(44, 'Features', 'features', 'parent'),
(45, 'Edit', 'features_edit', '44'),
(46, 'Delete', 'features_delete', '44'),
(47, 'Tab Content', 'tab_content', 'parent'),
(48, 'Edit', 'tab_content_edit', '47'),
(49, 'Delete', 'tab_content_delete', '47'),
(50, 'How to Play', 'how_to_play', 'parent'),
(51, 'Edit', 'how_to_play_edit', '50'),
(52, 'Delete', 'how_to_play_delete', '50'),
(53, 'How to Install', 'download', 'parent'),
(54, 'Edit', 'download_edit', '53'),
(55, 'Delete', 'download_delete', '53'),
(56, 'AppSetting', 'appsetting', 'parent'),
(57, 'Currency', 'currency', 'parent'),
(58, 'Edit', 'currency_edit', '57'),
(59, 'Delete', 'currency_delete', '57'),
(60, 'Withdrawal Method', 'withdraw_method', 'parent'),
(61, 'Edit', 'withdraw_method_edit', '60'),
(62, 'Delete', 'withdraw_method_delete', '60'),
(63, 'PaymentGateway', 'pgdetail', 'parent'),
(64, 'Edit', 'pgdetail_edit', '63'),
(65, 'Delete', 'pgdetail_delete', '63'),
(66, 'App Tutorial', 'youtube', 'parent'),
(67, 'Edit', 'youtube_edit', '66'),
(68, 'Delete', 'youtube_delete', '66'),
(69, 'Slider', 'slider', 'parent'),
(70, 'Edit', 'slider_edit', '69'),
(71, 'Delete', 'slider_delete', '69'),
(72, 'Banner', 'banner', 'parent'),
(73, 'Edit', 'banner_edit', '72'),
(74, 'Delete', 'banner_delete', '72'),
(75, 'License', 'license', 'parent'),
(76, 'One Signal Notification', 'custom_notification', 'parent'),
(77, 'Admin', 'admin', 'parent'),
(78, 'Edit', 'admin_edit', '77'),
(79, 'Delete', 'admin_delete', '77'),
(80, 'Profile Setting', 'profilesetting', 'parent'),
(81, 'Change Password', 'changepassword', 'parent'),
(82, 'Join Match', 'matches_member_position', '9'),
(83, 'Update Result', 'matches_member_join_match', '9');

ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`);

ALTER TABLE `permission`
  MODIFY `permission_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

INSERT INTO `web_config` (`id`, `web_config_name`, `web_config_value`) VALUES (NULL, 'timezone', 'Asia/Kolkata'), (NULL, 'supported_language', '{\"en\":\"english\",\"ar\":\"arabic\"}'),(NULL, 'rtl_supported_language', '{\"ar\":\"arabic\",\"arc\":\"aramaic\",\"dv\":\"divehi\",\"fa\":\"persian\",\"ha\":\"hausa\",\"he\":\"hebrew\",\"khw\":\"khowar\",\"ks\":\"kashmiri\",\"ku\":\"kurdish\",\"ps\":\"pashto\",\"ur\":\"urdu\",\"yi\":\"yiddish\"}'),(NULL, 'footer_script', ''),(NULL, 'firebase_script', '');

INSERT INTO `pg_detail` (`id`, `payment_name`, `payment_description`, `payment_status`, `name`, `mid`, `mkey`, `wname`, `itype`, `currency`, `currency_point`, `date`, `status`, `created_date`) VALUES (NULL, 'Tron', '', '', '', '', '', '', '', '6', '1', '', '0', current_timestamp()), (NULL, 'PayU', '', '', '', '', '', '', '', '2', '1', '', '0', current_timestamp());

ALTER TABLE `accountstatement` CHANGE `accountstatement_dateCreated` `accountstatement_dateCreated` DATETIME NOT NULL;

ALTER TABLE `admin` CHANGE `craeted_date` `craeted_date` DATETIME NOT NULL;

ALTER TABLE `announcement` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `banner` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `country` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `courier` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `currency` CHANGE `currency_dateCreated` `currency_dateCreated` DATETIME NOT NULL;

ALTER TABLE `deposit` CHANGE `deposit_dateCreated` `deposit_dateCreated` DATETIME NOT NULL;

ALTER TABLE `features_tab` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `features_tab_content` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `game` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `howtoplay_content` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `image` CHANGE `created_date` `created_date` DATETIME NOT NULL;

ALTER TABLE `lottery` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `lottery_member` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `matches` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `match_join_member` CHANGE `date_craeted` `date_craeted` DATETIME NOT NULL;

ALTER TABLE `member` CHANGE `created_date` `created_date` DATETIME NOT NULL;

ALTER TABLE `orders` CHANGE `created_date` `created_date` DATETIME NOT NULL;

ALTER TABLE `pg_detail` CHANGE `created_date` `created_date` DATETIME NOT NULL;

ALTER TABLE `product` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `referral` CHANGE `referral_dateCreated` `referral_dateCreated` DATETIME NOT NULL;

ALTER TABLE `screenshots` CHANGE `created_date` `created_date` DATETIME NOT NULL;

ALTER TABLE `slider` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `watch_earn` CHANGE `date_created` `date_created` DATETIME NOT NULL;

ALTER TABLE `withdraw_method` CHANGE `withdraw_method_dateCreated` `withdraw_method_dateCreated` DATETIME NOT NULL;

ALTER TABLE `youtube_link` CHANGE `date_created` `date_created` DATETIME NOT NULL;

UPDATE `pg_detail` SET `status` = '0' where id != '3';

UPDATE `pg_detail` SET `currency` = '3',`currency_point` = '1' WHERE `pg_detail`.`id` = 3;