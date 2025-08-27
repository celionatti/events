 	CREATE TABLE `articles` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `article_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `user_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `views` bigint DEFAULT '0',
 `tag` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `content` text COLLATE utf8mb4_general_ci,
 `meta_title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `meta_description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `meta_keywords` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `contributors` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `featured` enum('yes','no','','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'no',
 `status` enum('draft','publish') COLLATE utf8mb4_general_ci DEFAULT 'draft',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 KEY `article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
categories 	CREATE TABLE `categories` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `category_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `status` enum('active','inactive') COLLATE utf8mb4_general_ci DEFAULT 'inactive',
 PRIMARY KEY (`id`),
 UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
events 	CREATE TABLE `events` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `event_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `user_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `category` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `tags` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `description` text COLLATE utf8mb4_general_ci,
 `location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `date_time` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `mail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `socials` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `is_highlighted` tinyint(1) DEFAULT '0',
 `status` enum('open','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending',
 `ticket_sale` enum('sell','pause','','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pause',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 KEY `event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
failed_logins 	CREATE TABLE `failed_logins` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `attempts` int DEFAULT '0',
 `blocked_until` datetime DEFAULT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
messages 	CREATE TABLE `messages` (
 `id` bigint NOT NULL AUTO_INCREMENT,
 `message_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `message` text COLLATE utf8mb4_general_ci NOT NULL,
 `status` enum('open','close','','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'close',
 `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
payments 	CREATE TABLE `payments` (
 `id` bigint NOT NULL AUTO_INCREMENT,
 `payment_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `user_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `bank_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `account_number` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `account_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `balance` decimal(10,2) NOT NULL,
 `status` enum('active','disable','','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'disable',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
payouts 	CREATE TABLE `payouts` (
 `id` bigint NOT NULL AUTO_INCREMENT,
 `payout_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `user_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `to_user` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `account_number` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `amount` decimal(10,2) NOT NULL,
 `reference_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `status` enum('pending','confirmed','cancelled','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
 `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
settings 	CREATE TABLE `settings` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `value` text COLLATE utf8mb4_general_ci,
 `status` enum('active','disable') COLLATE utf8mb4_general_ci DEFAULT 'disable',
 PRIMARY KEY (`id`),
 UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
sponsors 	CREATE TABLE `sponsors` (
 `id` bigint NOT NULL AUTO_INCREMENT,
 `sponsor_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
teams 	CREATE TABLE `teams` (
 `id` bigint NOT NULL AUTO_INCREMENT,
 `team_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `nickname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `role` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `socials` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
 `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 UNIQUE KEY `email` (`email`),
 KEY `team_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
tickets 	CREATE TABLE `tickets` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `ticket_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `event_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `details` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `price` decimal(10,2) DEFAULT NULL,
 `quantity` int DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
ticket_users 	CREATE TABLE `ticket_users` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `user_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `transaction_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `ticket_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `quantity` int DEFAULT NULL,
 `token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `assign_to` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `status` enum('checked_in','confirmed','pending','cancelled') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
 PRIMARY KEY (`id`),
 KEY `ticket_id` (`ticket_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
transactions 	CREATE TABLE `transactions` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `transaction_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `user_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `first_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `last_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `event_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `ticket_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `quantity` int DEFAULT NULL,
 `amount` decimal(10,2) DEFAULT NULL,
 `total_amount` decimal(10,2) NOT NULL,
 `reference_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `status` enum('pending','confirmed','cancelled','reversed') COLLATE utf8mb4_general_ci DEFAULT 'pending',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 UNIQUE KEY `token` (`token`),
 KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
users 	CREATE TABLE `users` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
 `user_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `first_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `last_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `business_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `registration_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `role` enum('admin','user','organiser') COLLATE utf8mb4_general_ci DEFAULT 'user',
 `is_blocked` tinyint(1) DEFAULT '0',
 `country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `remember_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `session_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `reset_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `reset_token_expiry` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 UNIQUE KEY `email` (`email`),
 KEY `user_id` (`user_id`),
 KEY `first_name` (`first_name`),
 KEY `last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci