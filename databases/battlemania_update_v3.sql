ALTER TABLE `accountstatement` ADD `browser` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `accountstatement` MODIFY `entry_from` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web,3=admin';
ALTER TABLE `accountstatement` ADD `ip_detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `accountstatement` MODIFY `note_id` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13') NOT NULL COMMENT '0 = add money to join wallet,1 = withdraw from win wallet,2 = match join,3 = register referral,4 = referral,5 = match reward,6 = refund,7 = add money to win wallet,8 = withdraw from join wallet,9 = pending withdraw,10 = Lottery Joined,11 = Lottery Reward,12=product order,13=watch and earn';
ALTER TABLE `accountstatement` MODIFY `note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;
ALTER TABLE `accountstatement` ADD `order_id` int(11) NOT NULL;
ALTER TABLE `accountstatement` MODIFY `pyatmnumber` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;
ALTER TABLE `accountstatement` MODIFY `withdraw_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;
ALTER TABLE `admin` MODIFY `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `admin` MODIFY `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `announcement` MODIFY `announcement_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `app_upload` MODIFY `app_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL,
  `banner_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_link_type` enum('app','web') NOT NULL,
  `banner_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `country` MODIFY `country_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
CREATE TABLE IF NOT EXISTS `courier` (
  `courier_id` int(11) NOT NULL,
  `courier_name` varchar(255) NOT NULL,
  `courier_link` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `currency` MODIFY `currency_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `deposit` MODIFY `bank_transection_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;
ALTER TABLE `deposit` ADD `deposit_by` varchar(200) NOT NULL;
ALTER TABLE `deposit` MODIFY `entry_from` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web';
ALTER TABLE `deposit` MODIFY `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `features_tab` MODIFY `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `features_tab` MODIFY `f_tab_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `features_tab` MODIFY `f_tab_img_position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `features_tab` MODIFY `f_tab_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `features_tab` MODIFY `f_tab_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `features_tab` MODIFY `f_tab_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `features_tab_content` MODIFY `content_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `features_tab_content` MODIFY `content_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `features_tab_content` MODIFY `content_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `features_tab_content` MODIFY `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `game` MODIFY `game_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `game` MODIFY `game_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `game` MODIFY `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `howtoplay_content` MODIFY `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `howtoplay_content` MODIFY `htp_content_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `howtoplay_content` MODIFY `htp_content_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `howtoplay_content` MODIFY `htp_content_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `image` MODIFY `image_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `lottery` MODIFY `lottery_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `lottery` MODIFY `lottery_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `lottery` MODIFY `lottery_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `lottery_member` MODIFY `entry_from` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web';
ALTER TABLE `match_join_member` MODIFY `entry_from` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web';
ALTER TABLE `match_join_member` MODIFY `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `match_join_member` MODIFY `team` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `MAP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `match_banner` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `match_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `match_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `match_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `match_sponsor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `match_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `match_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `prize_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `result_notification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `matches` MODIFY `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `member` MODIFY `dob` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;
ALTER TABLE `member` MODIFY `email_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `member` MODIFY `entry_from` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '	0=unknown,1=app,2=web';
ALTER TABLE `member` MODIFY `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;
ALTER TABLE `member` MODIFY `gender` enum('0','1','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '0=male,1=female';
ALTER TABLE `member` MODIFY `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;
ALTER TABLE `member` MODIFY `mobile_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `member` ADD `new_user` enum('Yes','No') NOT NULL DEFAULT 'Yes';
ALTER TABLE `member` MODIFY `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `member` MODIFY `player_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `member` MODIFY `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `order_no` varchar(200) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(200) NOT NULL,
  `product_price` double NOT NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `courier_id` int(11) NOT NULL,
  `tracking_id` varchar(255) NOT NULL,
  `entry_from` enum('0','1','2') NOT NULL COMMENT '0=unknown,1=app,2=web',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `page` MODIFY `page_banner_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `page` MODIFY `page_browsertitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `page` MODIFY `page_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `page` MODIFY `page_menutitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `page` MODIFY `page_metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `page` MODIFY `page_metakeyword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `page` MODIFY `page_metatitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `page` MODIFY `page_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `page` MODIFY `page_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `pg_detail` ADD `currency_point` varchar(100) NOT NULL;
ALTER TABLE `pg_detail` ADD `currency` int(11) NOT NULL;
ALTER TABLE `pg_detail` MODIFY `payment_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `pg_detail` ADD `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active';
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_actual_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `referral` MODIFY `entry_from` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0=unknown,1=app,2=web';
CREATE TABLE IF NOT EXISTS `slider` (
  `slider_id` int(11) NOT NULL,
  `slider_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_link_type` enum('app','web','') NOT NULL DEFAULT '',
  `slider_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=deactive,1=active',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `watch_earn` (
  `watch_earn_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `rewards` int(11) NOT NULL,
  `earning` int(11) NOT NULL,
  `watch_earn_date` date NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `withdraw_method` ADD `withdraw_method_currency_point` varchar(100) NOT NULL;
ALTER TABLE `withdraw_method` ADD `withdraw_method_currency` int(11) NOT NULL;
ALTER TABLE `withdraw_method` ADD `withdraw_method_field` varchar(200) NOT NULL;
ALTER TABLE `withdraw_method` MODIFY `withdraw_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `youtube_link` MODIFY `youtube_link_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `youtube_link` MODIFY `youtube_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;


INSERT INTO `web_config` (`web_config_name`, `web_config_value`) VALUES
('smtp_host', ''),
('smtp_user', ''),
('smtp_pass', ''),
('smtp_port', ''),
('smtp_secure', ''),
('comapny_country_code', ''),
('place_point_show', 'yes'),
('watch_ads_per_day', '0'),
('point_on_watch_ads', '0'),
('watch_earn_description', ''),
('watch_earn_note', ''),
('banner_ads_show', 'no');