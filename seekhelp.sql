/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : seekhelp

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 24/11/2022 15:38:41
*/

-- mysql://b93a43cd2b0b4e:6efd3423@us-cdbr-east-06.cleardb.net/heroku_c3fb0ebac6811ea?reconnect=true
-- mysql -u b93a43cd2b0b4e -p6efd3423 -hus-cdbr-east-06.cleardb.net

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS seekhelp;
CREATE DATABASE seekhelp;

USE seekhelp;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `commented_user_id` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `star` tinyint NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `consultant_id` int NOT NULL,
  `price` bigint NOT NULL,
  `status` int NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `pay_amount` bigint NOT NULL,
  `pay_status` int NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` bigint NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
BEGIN;
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (2, 1, 'Vehicle', '4th Floor, The', 'Morbi ut odio.', 73, 'Alpatovo', 1, '2022-11-24 08:17:13', '2022-11-20 07:35:38');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (3, 1, 'Computer', 'Deuces Wild', 'Nullam varius.', 40, 'Prelog', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (4, 1, 'Computer', 'Pussy Riot: A Punk Prayer', 'Proin at turpis a pede posuere nonummy.', 70, 'Ribeirão Preto', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (5, 1, 'House', 'Into the Abyss', 'Aenean auctor gravida sem.', 62, 'Nieuwegein', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (6, 1, 'Vehicle', 'Road to Brown, The', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 62, 'Magdalena', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (7, 1, 'Vehicle', 'Hiding Cot (Piilopirtti)', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 41, 'Canillo', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (8, 1, 'Network', 'My One and Only', 'Sed accumsan felis.', 97, 'Jiutai', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (9, 1, 'Pet', 'Comedy of Power (Ivresse du pouvoir, L\')', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 89, 'Yilan', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (10, 1, 'Network', 'Shakes the Clown', 'Etiam justo.', 25, 'Vigo', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (11, 1, 'Network', 'Designing Woman', 'Duis at velit eu est congue elementum.', 59, 'Banana Village', 0, NULL, '2022-11-20 07:35:39');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (12, 1, 'Network', 'Twist', 'Integer ac leo.', 86, 'Kerek', 0, NULL, '2022-11-20 07:35:40');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (13, 1, 'Computer', 'Hook', 'Suspendisse potenti.', 15, 'Tipaz', 0, NULL, '2022-11-20 07:35:40');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (14, 1, 'Network', 'Belly of an Architect, The', 'Fusce posuere felis sed lacus.', 60, 'Ramanavichy', 0, NULL, '2022-11-20 07:35:40');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (15, 4, 'House', 'Gremlins', 'Maecenas ut massa quis augue luctus tincidunt.', 49, 'Lopandino', 0, '2022-11-24 23:16:09', '2022-11-20 07:35:40');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (16, 1, 'Vehicle', 'Last Drop, The', 'Phasellus in felis.', 92, 'Oslo', 0, NULL, '2022-11-20 07:35:40');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (17, 1, 'Vehicle', 'Wet Parade, The', 'Morbi quis tortor id nulla ultrices aliquet.', 15, 'Sande Vila Nova', 0, NULL, '2022-11-20 07:35:40');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (18, 1, 'Computer', 'Monster in the Closet', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 16, 'Maibu', 0, NULL, '2022-11-20 07:35:40');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (19, 4, 'Computer', 'Eila, Rampe and Likka', 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 59, 'Tabalong', 0, '2022-11-24 23:16:14', '2022-11-20 07:35:40');
INSERT INTO `post` (`post_id`, `user_id`, `category`, `title`, `description`, `price`, `location`, `status`, `updated_at`, `created_at`) VALUES (20, 4, 'Vehicle', 'Our Hospitality', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 26, 'Pipa', 0, '2022-11-24 23:16:18', '2022-11-20 07:35:40');
COMMIT;

-- ----------------------------
-- Table structure for postmatch
-- ----------------------------
DROP TABLE IF EXISTS `postmatch`;
CREATE TABLE `postmatch` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `status` int NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`match_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of postmatch
-- ----------------------------
BEGIN;
INSERT INTO `postmatch` (`match_id`, `user_id`, `post_id`, `status`, `updated_at`, `created_at`) VALUES (1, 2, 2, 1, '2022-11-24 08:17:25', '2022-11-24 06:49:22');
INSERT INTO `postmatch` (`match_id`, `user_id`, `post_id`, `status`, `updated_at`, `created_at`) VALUES (2, 2, 2, 0, NULL, '2022-11-24 06:49:45');
INSERT INTO `postmatch` (`match_id`, `user_id`, `post_id`, `status`, `updated_at`, `created_at`) VALUES (4, 2, 20, 0, NULL, '2022-11-24 23:16:25');
INSERT INTO `postmatch` (`match_id`, `user_id`, `post_id`, `status`, `updated_at`, `created_at`) VALUES (14, 2, 19, 0, NULL, '2022-11-24 23:16:31');
INSERT INTO `postmatch` (`match_id`, `user_id`, `post_id`, `status`, `updated_at`, `created_at`) VALUES (24, 16, 19, 0, NULL, '2022-11-24 15:35:05');
COMMIT;

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `years` tinyint DEFAULT NULL,
  `certification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`skill_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skill
-- ----------------------------
BEGIN;
INSERT INTO `skill` (`skill_id`, `user_id`, `category`, `description`, `years`, `certification`, `updated_at`, `created_at`) VALUES (4, 16, 'Vehicle', '11', 4, '11', '2022-11-24 23:33:36', '2022-11-18 06:58:47');
INSERT INTO `skill` (`skill_id`, `user_id`, `category`, `description`, `years`, `certification`, `updated_at`, `created_at`) VALUES (14, 9, 'Computer', '2', 5, NULL, '2022-11-24 23:30:55', '2022-11-24 23:20:46');
INSERT INTO `skill` (`skill_id`, `user_id`, `category`, `description`, `years`, `certification`, `updated_at`, `created_at`) VALUES (19, 15, 'Network', '3', 3, NULL, '2022-11-24 23:31:01', '2022-11-24 23:20:56');
INSERT INTO `skill` (`skill_id`, `user_id`, `category`, `description`, `years`, `certification`, `updated_at`, `created_at`) VALUES (27, 17, 'House', '4', 4, NULL, '2022-11-24 23:32:22', '2022-11-24 23:21:02');
INSERT INTO `skill` (`skill_id`, `user_id`, `category`, `description`, `years`, `certification`, `updated_at`, `created_at`) VALUES (33, 10, 'Pet', '5', 3, NULL, '2022-11-24 23:33:32', '2022-11-24 23:21:12');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_consultant` bit(1) DEFAULT b'0',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `city`, `phone`, `is_consultant`, `updated_at`, `created_at`) VALUES (1, 'eric@outlook.com', '1111', 'eric', 'Burnaby', '111111111', b'0', '2022-11-20 07:27:12', '2022-11-18 06:12:09');
INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `city`, `phone`, `is_consultant`, `updated_at`, `created_at`) VALUES (4, 'juncwks@gmail.com', '123123', 'test', 'Coquitlam', '123123', b'0', '2022-11-24 23:23:08', '2022-01-18 04:04:26');
INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `city`, `phone`, `is_consultant`, `updated_at`, `created_at`) VALUES (9, 'bb@gmail.com', '1111', 'bb', '1111', '1111', b'1', '2022-11-24 23:30:24', '2022-04-01 06:54:40');
INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `city`, `phone`, `is_consultant`, `updated_at`, `created_at`) VALUES (10, 'ee@gmail.com', '1111', 'ee', '1111', '1111', b'1', '2022-11-24 23:33:21', '2022-03-06 06:54:40');
INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `city`, `phone`, `is_consultant`, `updated_at`, `created_at`) VALUES (15, 'cc@gmail.com', '1111', 'cc', '1111', '1111', b'1', '2022-11-24 23:30:28', '2022-06-08 06:54:40');
INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `city`, `phone`, `is_consultant`, `updated_at`, `created_at`) VALUES (16, 'aa@gmail.com', '1111', 'aa', '1111', '1111', b'1', '2022-11-24 23:33:27', '2022-10-18 06:54:40');
INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `city`, `phone`, `is_consultant`, `updated_at`, `created_at`) VALUES (17, 'dd@gmail.com', '1111', 'dd', '1111', '1111', b'1', '2022-11-24 23:30:34', '2022-09-28 06:54:40');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
