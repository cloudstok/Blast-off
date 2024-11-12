
DROP DATABASE if EXISTS `aviator_3d`;
CREATE DATABASE IF NOT EXISTS `aviator_3d`;
use `aviator_3d`;

 CREATE TABLE IF NOT EXISTS `settlement`(
   `settlement_id` int NOT NULL AUTO_INCREMENT,
   `bet_id` varchar(255) DEFAULT NULL,
   `lobby_id` BIGINT DEFAULT NULL,
   `user_id` varchar(255) DEFAULT NULL,
   `operator_id` varchar(255) DEFAULT NULL,
   `name` varchar(255) DEFAULT NULL,
   `bet_amount` DECIMAL(10, 2) DEFAULT NULL,
   `auto_cashout` DECIMAL(10, 2) DEFAULT NULL,
   `avatar` VARCHAR(255) NOT NULL,
   `balance` DECIMAL(10 ,2) DEFAULT NULL,
   `max_mult` varchar(255) DEFAULT NULL,
   `status` varchar(255) DEFAULT "CRASHED",
   `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`settlement_id`)
 );

CREATE TABLE IF NOT EXISTS `round_stats` (
   `id` int primary key auto_increment,
   `lobby_id` BIGINT NOT NULL DEFAULT 0,
   `start_time` BIGINT NOT NULL DEFAULT 0,
   `max_mult` DECIMAL(5,2) NOT NULL DEFAULT 0,
   `end_time` BIGINT NOT NULL DEFAULT 0,
   `total_bets` varchar(255) DEFAULT NULL,
   `total_players` int NOT NULL DEFAULT 0,
   `total_bet_amount` int NOT NULL DEFAULT 0,
   `total_cashout_amount` DECIMAL(10,2) NOT NULL DEFAULT 0,
   `biggest_winner` DECIMAL(10,2) NOT NULL DEFAULT 0,
   `biggest_looser` int NOT NULL DEFAULT 0,
   `total_round_settled` DECIMAL(10,2) NOT NULL DEFAULT 0,
   `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE IF NOT EXISTS `lobbies` (
   `id` int primary key auto_increment,
   `lobby_id` BIGINT NOT NULL DEFAULT 0,
   `start_delay` INT NOT NULL DEFAULT 0,
   `end_delay` INT NOT NULL DEFAULT 0,
   `max_mult` DECIMAL(5,2) NOT NULL DEFAULT 0,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `bets` (
   `id` int primary key auto_increment,
   `bet_id` varchar(255) NOT NULL,
   `lobby_id` BIGINT NOT NULL DEFAULT 0,
   `user_id` varchar(255) NOT NULL,
   `operator_id` varchar(255) DEFAULT NULL,
   `bet_amount` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
   `avatar` VARCHAR(255) NULL,
    `auto_cashout` DECIMAL(10, 2) DEFAULT NULL,
   `balance` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
   `name` VARCHAR(45) NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

