
DROP DATABASE if EXISTS `blast_off`;
CREATE DATABASE IF NOT EXISTS `blast_off`;
use `blast_off`;

 CREATE TABLE IF NOT EXISTS `settlement`(
   `settlement_id` int NOT NULL AUTO_INCREMENT,
   `bet_id` varchar(255) DEFAULT NULL,
   `lobby_id` BIGINT DEFAULT NULL,
   `user_id` varchar(255) DEFAULT NULL,
   `operator_id` varchar(255) DEFAULT NULL,
   `name` varchar(255) DEFAULT NULL,
   `bet_amount` DECIMAL(10, 2) DEFAULT NULL,
   `auto_cashout` DECIMAL(10, 2) DEFAULT NULL,
   `balance` DECIMAL(10 ,2) DEFAULT NULL,
   `max_mult` DECIMAL(10, 2) DEFAULT 0.00,
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
   `auto_cashout` DECIMAL(10, 2) DEFAULT NULL,
   `balance` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
   `name` VARCHAR(45) NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `blast_off`.`bets` ADD INDEX `lobby_id_index` (`lobby_id` ASC) VISIBLE, ADD INDEX `operator_id_index` (`operator_id` ASC) VISIBLE, ADD INDEX `bet_amount_index` (`bet_amount` ASC) VISIBLE, ADD INDEX `created_at_index` (`created_at` ASC) VISIBLE, ADD INDEX `bet_id_index` (`bet_id` ASC) VISIBLE, ADD INDEX `user_id_index` (`user_id` ASC) VISIBLE;
ALTER TABLE `blast_off`.`round_stats` ADD INDEX `lobby_id_index` (`lobby_id` ASC) VISIBLE, ADD INDEX `max_mult_index` (`max_mult` ASC) VISIBLE, ADD INDEX `created_at_index` (`created_at` ASC) VISIBLE;
ALTER TABLE `blast_off`.`settlement` ADD INDEX `lobby_id_index` (`lobby_id` ASC) INVISIBLE, ADD INDEX `bet_amount_index` (`bet_amount` ASC) INVISIBLE, ADD INDEX `max_mult_index` (`max_mult` ASC) VISIBLE, ADD INDEX `bet_id_index` (`bet_id` ASC) VISIBLE, ADD INDEX `operator_id_index` (`operator_id` ASC) VISIBLE, ADD INDEX `user_id_index` (`user_id` ASC) VISIBLE, ADD INDEX `created_at_index` (`created_at` ASC) VISIBLE, ADD INDEX `status_index` (`status` ASC) VISIBLE;