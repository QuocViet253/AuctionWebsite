/*
 Navicat Premium Data Transfer

 Source Server         : Web
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : auction

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 28/12/2021 12:33:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `catid` int NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int NOT NULL,
  `pid` int NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE,
  FULLTEXT INDEX `catname`(`catname`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, 'SmartPhone', 0, 5), (2, 'Laptop', 0, 5), (3, 'Headphone', 0, 6), (4, 'Mouse', 0, 6), (5, 'Electronic', 1, 0), (6, 'Accessory ', 1, 0), (7, 'Smart Watch', 0, 5), (17, 'Book', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `uid` int NOT NULL,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review_id` int NULL DEFAULT NULL,
  `review_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `like1` int NULL DEFAULT NULL,
  `dislike` int NULL DEFAULT NULL,
  `proid` int NULL DEFAULT NULL,
  `proname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of feedback
-- ----------------------------
BEGIN;
INSERT INTO `feedback` VALUES (4, 'bidder2', 5, 'seller2', 'ok', 1, 0, 24, 'Đồng hồ thông minh Suunto 9 Baro titanium'), (5, 'seller2', 4, 'bidder2', 'sản phẩm chất lượng', 1, 0, 24, 'Đồng hồ thông minh Suunto 9 Baro titanium'), (2, 'bidder1', 5, 'seller2', 'đúng hẹn', 1, 0, 23, 'Apple Watch SE LTE'), (6, 'bidder3', 5, 'seller2', 'pro', 1, 0, 22, 'Apple Watch S6 LTE'), (2, 'bidder1', 5, 'seller2', 'lấy hàng chậm', 0, 1, 25, 'Samsung Galaxy Watch 3'), (5, 'seller2', 6, 'bidder3', 'sản phẩm tốt', 1, 0, 22, 'Apple Watch S6 LTE'), (5, 'seller2', 2, 'bidder1', 'tốt', 1, 0, 23, 'Apple Watch SE LTE'), (5, 'seller2', 2, 'bidder1', 'ok, quá được', 1, 0, 25, 'Samsung Galaxy Watch 3');
COMMIT;

-- ----------------------------
-- Table structure for histories
-- ----------------------------
DROP TABLE IF EXISTS `histories`;
CREATE TABLE `histories`  (
  `proid` int NOT NULL,
  `proname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sell_id` int NULL DEFAULT NULL,
  `bid_id` int NULL DEFAULT NULL,
  `buy_day` datetime NULL DEFAULT NULL,
  `price` int NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of histories
-- ----------------------------
BEGIN;
INSERT INTO `histories` VALUES (2, 'Điện thoại IPhone 13 Pro', 1, 6, '2021-12-28 10:48:08', 1800), (2, 'Điện thoại IPhone 13 Pro', 1, 7, '2021-12-28 10:49:59', 2400), (2, 'Điện thoại IPhone 13 Pro', 1, 4, '2021-12-28 10:51:14', 2600), (2, 'Điện thoại IPhone 13 Pro', 1, 7, '2021-12-28 10:51:14', 2600), (2, 'Điện thoại IPhone 13 Pro', 1, 2, '2021-12-28 10:52:46', 2800), (4, 'Điện thoại Samsung Galaxy Z Flip3', 1, 2, '2021-12-28 10:56:16', 900), (4, 'Điện thoại Samsung Galaxy Z Flip3', 1, 4, '2021-12-28 10:56:38', 1200), (4, 'Điện thoại Samsung Galaxy Z Flip3', 1, 7, '2021-12-28 10:57:05', 1500), (4, 'Điện thoại Samsung Galaxy Z Flip3', 1, 6, '2021-12-28 10:57:33', 1800), (4, 'Điện thoại Samsung Galaxy Z Flip3', 1, 4, '2021-12-28 10:57:51', 1800), (4, 'Điện thoại Samsung Galaxy Z Flip3', 1, 6, '2021-12-28 10:57:51', 1800), (6, 'Laptop Apple MacBook Pro M1', 3, 2, '2021-12-28 10:59:34', 2500), (6, 'Laptop Apple MacBook Pro M1', 3, 7, '2021-12-28 10:59:58', 2600), (6, 'Laptop Apple MacBook Pro M1', 3, 6, '2021-12-28 11:00:22', 2900), (6, 'Laptop Apple MacBook Pro M1', 3, 4, '2021-12-28 11:00:44', 3100), (6, 'Laptop Apple MacBook Pro M1', 3, 7, '2021-12-28 11:01:06', 3300), (6, 'Laptop Apple MacBook Pro M1', 3, 4, '2021-12-28 11:01:06', 3300), (8, 'Laptop HP Omen 15 ek0078TX', 3, 2, '2021-12-28 11:01:50', 1800), (8, 'Laptop HP Omen 15 ek0078TX', 3, 4, '2021-12-28 11:02:10', 2100), (8, 'Laptop HP Omen 15 ek0078TX', 3, 6, '2021-12-28 11:02:55', 2400), (8, 'Laptop HP Omen 15 ek0078TX', 3, 2, '2021-12-28 11:13:39', 2700), (10, 'Laptop MSI Gaming GE66 Raider', 3, 2, '2021-12-28 11:20:26', 1800), (10, 'Laptop MSI Gaming GE66 Raider', 3, 4, '2021-12-28 11:21:21', 2400), (10, 'Laptop MSI Gaming GE66 Raider', 3, 2, '2021-12-28 11:22:27', 2600), (10, 'Laptop MSI Gaming GE66 Raider', 3, 7, '2021-12-28 11:27:59', 2800), (10, 'Laptop MSI Gaming GE66 Raider', 3, 2, '2021-12-28 11:45:02', 3000), (11, 'Tai nghe chụp tai Bluetooth AirPods Max Apple', 3, 7, '2021-12-28 11:47:04', 800), (11, 'Tai nghe chụp tai Bluetooth AirPods Max Apple', 3, 4, '2021-12-28 11:48:03', 900), (11, 'Tai nghe chụp tai Bluetooth AirPods Max Apple', 3, 6, '2021-12-28 11:48:50', 1100), (11, 'Tai nghe chụp tai Bluetooth AirPods Max Apple', 3, 2, '2021-12-28 11:49:13', 1300), (12, 'Tai nghe chụp tai Beats Studio3 Wireless', 3, 4, '2021-12-28 11:49:40', 500), (12, 'Tai nghe chụp tai Beats Studio3 Wireless', 3, 7, '2021-12-28 11:49:53', 800), (12, 'Tai nghe chụp tai Beats Studio3 Wireless', 3, 2, '2021-12-28 11:50:15', 850), (12, 'Tai nghe chụp tai Beats Studio3 Wireless', 3, 7, '2021-12-28 11:50:15', 850), (12, 'Tai nghe chụp tai Beats Studio3 Wireless', 3, 4, '2021-12-28 11:51:06', 900), (13, 'Tai nghe True Wireless Sony', 3, 2, '2021-12-28 11:51:33', 400), (13, 'Tai nghe True Wireless Sony', 3, 4, '2021-12-28 11:51:45', 500), (13, 'Tai nghe True Wireless Sony', 3, 7, '2021-12-28 11:55:08', 600), (13, 'Tai nghe True Wireless Sony', 3, 4, '2021-12-28 11:55:08', 600), (14, 'Tai nghe Bluetooth AirPods 3 Apple', 3, 4, '2021-12-28 11:55:48', 200), (14, 'Tai nghe Bluetooth AirPods 3 Apple', 3, 6, '2021-12-28 11:56:04', 300), (14, 'Tai nghe Bluetooth AirPods 3 Apple', 3, 4, '2021-12-28 11:56:27', 350), (14, 'Tai nghe Bluetooth AirPods 3 Apple', 3, 7, '2021-12-28 11:56:42', 350), (14, 'Tai nghe Bluetooth AirPods 3 Apple', 3, 4, '2021-12-28 11:56:42', 350), (21, 'Đồng hồ thông minh Garmin Fenix 6', 5, 2, '2021-12-28 11:57:34', 300), (21, 'Đồng hồ thông minh Garmin Fenix 6', 5, 7, '2021-12-28 11:57:52', 350), (21, 'Đồng hồ thông minh Garmin Fenix 6', 5, 2, '2021-12-28 11:57:52', 350), (21, 'Đồng hồ thông minh Garmin Fenix 6', 5, 6, '2021-12-28 11:58:32', 450), (22, 'Apple Watch S6 LTE', 5, 2, '2021-12-28 11:58:54', 500), (22, 'Apple Watch S6 LTE', 5, 4, '2021-12-28 11:59:16', 600), (22, 'Apple Watch S6 LTE', 5, 7, '2021-12-28 11:59:30', 600), (22, 'Apple Watch S6 LTE', 5, 4, '2021-12-28 11:59:30', 600), (22, 'Apple Watch S6 LTE', 5, 6, '2021-12-28 11:59:47', 800), (23, 'Apple Watch SE LTE', 5, 7, '2021-12-28 12:00:38', 700), (23, 'Apple Watch SE LTE', 5, 6, '2021-12-28 12:00:53', 750), (23, 'Apple Watch SE LTE', 5, 7, '2021-12-28 12:00:53', 750), (23, 'Apple Watch SE LTE', 5, 4, '2021-12-28 12:01:08', 850), (23, 'Apple Watch SE LTE', 5, 2, '2021-12-28 12:01:19', 950), (24, 'Đồng hồ thông minh Suunto 9 Baro titanium', 5, 2, '2021-12-28 12:01:41', 300), (24, 'Đồng hồ thông minh Suunto 9 Baro titanium', 5, 6, '2021-12-28 12:02:02', 500), (24, 'Đồng hồ thông minh Suunto 9 Baro titanium', 5, 7, '2021-12-28 12:02:16', 500), (24, 'Đồng hồ thông minh Suunto 9 Baro titanium', 5, 6, '2021-12-28 12:02:16', 500), (24, 'Đồng hồ thông minh Suunto 9 Baro titanium', 5, 4, '2021-12-28 12:02:32', 600), (25, 'Samsung Galaxy Watch 3', 5, 2, '2021-12-28 12:03:33', 350), (25, 'Samsung Galaxy Watch 3', 5, 7, '2021-12-28 12:03:42', 450), (25, 'Samsung Galaxy Watch 3', 5, 4, '2021-12-28 12:03:53', 550), (25, 'Samsung Galaxy Watch 3', 5, 2, '2021-12-28 12:04:09', 600), (1, 'Điện thoại IPhone 12 Pro Max', 1, 4, '2021-12-28 12:13:52', 2000), (1, 'Điện thoại IPhone 12 Pro Max', 1, 6, '2021-12-28 12:14:41', 2400), (3, 'Điện thoại Samsung Galaxy Z Fold3', 1, 5, '2021-12-28 12:20:35', 1000);
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `proid` int NOT NULL AUTO_INCREMENT,
  `proname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tinydes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fulldes` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `renew` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price_start` int NOT NULL,
  `price_step` int NOT NULL,
  `price_max` int NULL DEFAULT NULL,
  `price_now` int NULL DEFAULT NULL,
  `price_current` int NULL DEFAULT NULL,
  `price_payment` int NULL DEFAULT NULL,
  `start_day` datetime NOT NULL,
  `end_day` datetime NOT NULL,
  `catid` int NOT NULL,
  `bid_id` int NULL DEFAULT NULL,
  `sell_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allow_bid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reject_bid_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`proid`) USING BTREE,
  FULLTEXT INDEX `proname`(`proname`, `tinydes`)
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (1, 'Điện thoại IPhone 12 Pro Max', 'iPhone 12 Pro Max 128 GB một siêu phẩm smartphone đến từ Apple.', '<ul>\r\n    <li>Diện mạo mới mới với khung viền được vát thẳng và mạnh mẽ</li>\r\n    <li>Chất lượng hiển thị tuyệt vời</li>\r\n    <li>Màn hình OLED kích thước 6.7 inch với công nghệ Super Retina XDR </li>\r\n    <li>Cụm camera sau được nâng cấp mạnh mẽ</li>\r\n    <li>Hiệu năng khủng từ \"quái vật\" A14 Bionic</li>\r\n</ul>\r\n', 1, 'off', 2000, 200, 2600, 3000, 2400, NULL, '2021-11-22 14:52:41', '2022-01-02 18:30:30', 1, 6, 1, 'Now', 'on', NULL), (2, 'Điện thoại IPhone 13 Pro', 'iPhone 13 Pro là chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng. ', '<ul>\r\n    <li>Thiết kế đặc trưng với màu sắc thời thượng</li>\r\n    <li>Nâng cấp màn hình với tần số quét 120 Hz</li>\r\n    <li>Quay chụp đỉnh cao với camera Pro </li>\r\n    <li>Hiệu năng đột phá với Apple A15 Bionic</li>\r\n    <li>Nâng cấp thời lượng pin</li>\r\n</ul>', 1, 'off', 1800, 200, 3000, 3500, 2800, NULL, '2021-11-22 14:54:24', '2022-01-02 18:30:30', 1, 2, 1, 'Now', 'off', NULL), (3, 'Điện thoại Samsung Galaxy Z Fold3', 'Galaxy Z Fold3 5G đánh dấu bước tiến mới của Samsung trong phân khúc điện thoại gập cao cấp khi được cải tiến về độ bền cùng những nâng cấp đáng giá về cấu hình hiệu năng, hứa hẹn sẽ mang đến trải nghiệm sử dụng đột phá cho người dùng.', '<ul>\r\n    <li>Đột phá thiết kế màn hình gập</li>\r\n    <li>Cụm camera đỉnh cao công nghệ</li>\r\n    <li>Nâng tầm giải trí màn hình gập với camera ẩn</li>\r\n    <li>Hiệu năng hàng đầu với Snapdragon 888</li>\r\n    <li>Thời lượng pin thoải mái sử dụng giải trí</li>\r\n</ul>\r\n', 1, 'on', 1000, 200, 1200, 0, 1000, NULL, '2021-11-25 08:52:27', '2021-12-28 12:33:30', 1, 5, 1, 'Now', 'on', NULL), (4, 'Điện thoại Samsung Galaxy Z Flip3', 'Nối tiếp thành công của Galaxy Z Flip 5G, trong sự kiện Galaxy Unpacked vừa qua Samsung tiếp tục giới thiệu đến thế giới về Galaxy Z Flip3 5G 256GB.', '<ul>\r\n    <li>Thiết kế nhỏ gọn đầy lôi cuốn</li>\r\n    <li>Cụm camera đỉnh cao công nghệ</li>\r\n    <li>Trải nghiệm thị giác cực đỉnh</li>\r\n    <li>Cấu hình cực khủng Snapdragon 888</li>\r\n    <li>Chuyên gia nhiếp ảnh</li>\r\n    <li>Viên pin kép thông minh</li>\r\n</ul>', 1, 'on', 900, 300, 2100, 2500, 1800, NULL, '2021-12-12 11:35:30', '2022-01-02 18:30:30', 1, 6, 1, 'Now', 'off', NULL), (5, 'Điện thoại OPPO Find X3 Pro', 'Đây là một sản phẩm có thiết kế độc đáo, sở hữu cụm camera khủng, cấu hình thuộc top đầu trong thế giới Android.', '<ul>\r\n    <li>Kết quả của sự sáng tạo không ngừng</li>\r\n    <li>Mạnh mẽ hàng đầu với Snapdragon 888</li>\r\n    <li>Công nghệ màn hình AMOLED</li>\r\n    <li>Máy ảnh xuất sắc từ ngoài vào trong</li>\r\n    <li>Trang bị viên pin thông minh </li>\r\n</ul>', 1, 'off', 1500, 100, 0, 3000, 0, NULL, '2021-11-25 09:08:08', '2022-01-02 18:30:30', 1, 0, 1, 'Now', 'on', NULL), (6, 'Laptop Apple MacBook Pro M1', 'Laptop Apple Macbook Pro M1 2020 (Z11C000CJ) với chip M1 dành riêng cho MacBook đưa hiệu năng của MacBook Pro 2020 lên một tầm cao mới.', '<ul>\r\n    <li>Vi xử lí M1 mạnh mẽ đột phá </li>\r\n    <li>Không gian hiển thị tuyệt mĩ trên màn hình 13.3 inch</li>\r\n    <li>Thiết kế sang trọng, đẳng cấp</li>\r\n    <li>Bàn phím magic cho trải nghiệm gõ phím nhanh, không ồn ào</li>\r\n    <li>Màn hình Retina (2560 x 1600) mang đến những hình ảnh, văn bản sắc nét</li>\r\n</ul>', 1, 'on', 2500, 100, 3500, 5000, 3300, NULL, '2021-11-25 09:09:35', '2022-01-02 18:30:30', 2, 4, 3, 'Now', 'off', NULL), (7, 'Laptop Acer Predator Triton 300', 'Trải nghiệm chơi game cực mượt mà trên chiếc laptop Acer Predator Triton 300 PT315 53 71DJ i7.', '<ul>\r\n    <li>Khả năng xử lý mạnh mẽ, chiến game tốc độ cao</li>\r\n    <li>Thiết kế cơ động dễ dàng mang theo</li>\r\n    <li>Hình ảnh chất lượng cao trên màn hình lớn</li>\r\n    <li>Ổ cứng SSD 512 GB NVMe PCIe cho thời gian khởi động khá nhanh</li>\r\n    <li>Sử dụng card đồ họa rời NVIDIA GeForce RTX 3070 8 GB đẩy mạnh khả năng đồ họa</li>\r\n</ul>', 1, 'off', 1500, 500, 0, NULL, 0, NULL, '2021-11-25 19:32:40', '2022-01-02 18:30:30', 2, 0, 3, 'Now', 'on', NULL), (8, 'Laptop HP Omen 15 ek0078TX', 'HP Omen 15 ek0078TX i7 (26Y68PA) là chiếc laptop gaming mang trong mình sức mạnh siêu phàm nhờ sở hữu cấu hình gồm con chip Intel Core i7 mạnh mẽ và vi xử lý đồ họa cực mượt mà.', '<ul>\r\n    <li>Hiệu năng mạnh mẽ, đồ họa đỉnh cao, chiến game siêu chất</li>\r\n    <li>Tái hiện không gian hình ảnh, âm thanh đa chiều sống động</li>\r\n    <li>Thiết kế tinh xảo, ngoại hình cơ động dễ dàng mang theo</li>\r\n    <li>Kết nối đa dạng, tốc độ cao</li>\r\n    <li>Trang bị các cổng giao tiếp hiện đại</li>\r\n</ul>', 1, 'off', 1800, 300, 2700, 4000, 2700, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 2, 2, 3, 'Now', 'off', NULL), (9, 'Laptop Lenovo Yoga 9', 'Nếu đang tìm 1 chiếc laptop mỏng nhẹ, linh hoạt, cấu hình ấn tượng hỗ trợ các tác vụ nặng, trải nghiệm ngay phiên bản cao cấp này từ Lenovo.', '<ul>\r\n    <li>Siêu mỏng, siêu nhẹ, siêu thời trang</li>\r\n    <li>Cấu hình đầy mạnh mẽ, chinh phục mọi tác vụ</li>\r\n    <li>Tiện dụng, bảo mật cao</li>\r\n    <li>Hình ảnh siêu sắc nét, âm thanh ấn tượng hơn cả mong đợi</li>\r\n    <li>Dải màu 90% DCI-P3 theo tiêu chuẩn điện ảnh</li>\r\n</ul>', 1, 'on', 1200, 300, 0, NULL, 0, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 2, 0, 3, 'Now', 'on', NULL), (10, 'Laptop MSI Gaming GE66 Raider', 'Laptop MSI Gaming GE66 Raider 11UG i7 11800H với thiết kế độc lạ, đem đến vô vàn tính năng cao, chinh phục mọi công việc khó nhằn hay chiến đấu cực đỉnh trên mọi chiến trường game. ', '<ul>\r\n    <li>Sức mạnh nổi bật nhờ công nghệ tiên tiến</li>\r\n    <li>Phá cách cùng vẻ ngoài ấn tượng</li>\r\n    <li>Hình ảnh sắc nét trên màn hình chất lượng cao</li>\r\n    <li>RAM 32 GB tốc độ Bus RAM 3200 MHz cho hiệu năng vượt trội</li>\r\n    <li>Hệ thống tản nhiệt hiện đại với công nghệ độc quyền CoolerBoost 5</li>\r\n</ul>\r\n', 1, 'on', 1800, 200, 3000, NULL, 3000, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 2, 2, 3, 'Now', 'off', NULL), (11, 'Tai nghe chụp tai Bluetooth AirPods Max Apple', 'Sang trọng với lớp vỏ kim loại sáng bóng, bền bỉ, lựa chọn dễ dàng theo sở thích cho 3 phiên bản màu xanh dương, bạc và xám ', '<ul>\r\n	<li>Thiết kế sang trọng với chất liệu kim loại sáng bóng, bền bỉ.</li>\r\n	<li>Sử dụng chip H1 Apple cho kết nối nhanh chóng, kết nối không dây qua Bluetooth 5.0.</li>\r\n	<li>Tích hợp công nghệ chống ồn ANC, âm thanh xuyên âm (Transperency Mode).</li>\r\n	<li>Hỗ trợ Spatial Audio giúp tạo hiệu ứng âm thanh vòm khi xem phim và trải nghiệm nội dung Dolby Atmos được tốt hơn.</li>\r\n	<li>Digital Crown điều chỉnh linh hoạt, nhạy bén.</li>\r\n	<li>Tích hợp trợ lý ảo Siri điều khiển thêm tiện lợi.</li>\r\n	<li>Nghe nhận cuộc gọi trực tiếp từ tai nghe.</li>\r\n	<li>Thời gian sử dụng 20 giờ khi sử dụng chống ồn ANC và Transparency Mode.</li>\r\n	<li>Sạc nhanh 5 phút có thể sử dụng được 1.5 giờ.</li>\r\n</ul>', 1, 'on', 800, 100, 1500, NULL, 1300, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 3, 2, 3, 'Now', 'off', NULL), (12, 'Tai nghe chụp tai Beats Studio3 Wireless', 'Thiết kế sành điệu, có 2 phiên bản màu đen và màu đen đỏ hiện đại nổi bật, hợp với mọi người dùng', '<ul>\r\n	<li>Thiết kế gọn nhẹ, tinh tế, đệm tai mềm thoải mái khi đeo.</li>\r\n	<li>Kết nối không dây với Bluetooth 4.0, khoảng cách kết nối đến 10 m.</li>\r\n	<li>Sử dụng chip Apple W1 mới kết nối nhanh và ổn định, âm thanh mạnh mẽ.</li>\r\n	<li>Trang bị công nghệ chống ồn chủ động (Pure Active Noise Cancelling).</li>\r\n	<li>Thời gian sử dụng 22 giờ (bật chống ồn), 40 giờ (tắt chống ồn).</li>\r\n	<li>Tính năng Fast Fuel sạc nhanh 10 phút sử dụng được 3 giờ.</li>\r\n	<li>Sản phẩm chính hãng Beats (Apple), nguyên seal 100%.</li>\r\n	<li>Lưu ý: Thanh toán trước khi mở seal.</li>\r\n</ul>', 1, 'on', 500, 50, 900, 2000, 900, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 3, 4, 3, 'Now', 'off', NULL), (13, 'Tai nghe True Wireless Sony', 'Tai nghe Bluetooth True Wireless Sony WF-1000XM4 được phủ gam màu đen nhám sang trọng, thiết kế nhỏ gọn dễ dàng bỏ túi mang đi khắp nơi.', '<ul>\r\n	<li>Kiểu dáng nhỏ gọn thiết kế sang trọng.</li>\r\n	<li>Thưởng thức <strong>âm thanh Hi-Res</strong> có chất lượng vượt trội nhờ <strong>công nghệ LDAC</strong>.</li>\r\n	<li>Khả năng chống ồn tuyệt vời nhờ con <strong>chip V1</strong> thế hệ mới.</li>\r\n	<li>Dung lượng pin lớn, hỗ trợ <strong>sạc nhanh 5 phút dùng 60 phút</strong>.</li>\r\n	<li>Thưởng thức trọn vẹn bài hát nhờ loại bỏ tiếng ồn của gió.</li>\r\n	<li>Tắt nhạc khi bạn trò chuyện với người xung quanh.</li>\r\n	<li>Chuẩn <strong>chống nước IPX4 </strong>bảo vệ tai nghe an toàn trước nước mưa và mồ hôi.</li>\r\n	<li>Dễ dàng tiếp nhận thông tin hơn với trợ lý ảo.</li>\r\n</ul>', 1, 'on', 400, 100, 700, NULL, 600, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 3, 4, 3, 'Now', 'off', NULL), (14, 'Tai nghe Bluetooth AirPods 3 Apple', 'Thiết kế gọn nhẹ, kiểu dáng hướng âm thanh vào tai bạn', '<ul>\r\n	<li>Kiểu dáng hiện đại, gọn đẹp, đeo thoải mái đến bất kỳ nơi nào. </li>\r\n	<li>Âm thanh vòm sống động cùng <strong>Spatial audio</strong><strong> </strong>và <strong>chip H1</strong> mạnh mẽ.</li>\r\n	<li>Kết nối không dây <strong>Bluetooth 5.0</strong> mượt mà xa đến <strong>10 m.</strong> </li>\r\n	<li>Điều chỉnh âm thanh phù hợp ống tai của bạn nhờ hỗ trợ <strong>Adaptive EQ</strong>.</li>\r\n	<li>Tai nghe cho thời gian nghe nhạc <strong>6 giờ</strong>, hộp sạc <strong>24 giờ</strong>.</li>\r\n	<li>Hỗ trợ sạc nhanh, cho thời gian sử dụng <strong>1 giờ </strong>chỉ vớ<strong>i 5 phút sạc</strong>.</li>\r\n	<li>Hộp sạc hỗ trợ <strong>sạc không dây chuẩn Qi,</strong> tiện lợi khi sạc lại.</li>\r\n	<li>Trang bị chuẩn chống nước <strong>IPX4</strong>, bảo vệ tai nghe an toàn dưới mưa nhỏ và mồ hôi.</li>\r\n	<li>Sản phẩm chính hãng Apple, nguyên seal 100%.</li>\r\n	<li>Lưu ý: Thanh toán trước khi mở seal.</li>\r\n</ul>', 1, 'on', 200, 50, 400, NULL, 350, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 3, 4, 3, 'Now', 'off', NULL), (15, 'Tai nghe Bluetooth Thể Thao Sony', 'Tai nghe Sony kích thước nhỏ gọn, sang trọng, tinh tế, với thiết kế đeo vòng cổ dây silicone mềm dẻo, thoải mái sử dụng suốt ngày dài', '<ul>\r\n	<li>Nhỏ gọn, kiểu vòng cổ silicone thoải mái, có nút đệm tai và thiết kế có độ tạo góc sử dụng chắc chắn, êm ái.</li>\r\n	<li>Trang bị công nghệ chống ồn tiên tiến HD QN1.</li>\r\n	<li>Âm thanh độ phân giải cao kết hợp cơ chế tăng cường âm thanh kỹ thuật số HX (DSEE HX™).</li>\r\n	<li>Dễ dàng tùy chỉnh tác vụ nghe nhạc, gọi rảnh tay, tương tác với Google Assistant, Siri.</li>\r\n	<li>Điều khiển thông minh, tiện lợi với Google Assistant, Amazon Alexa và Siri.</li>\r\n	<li>Hỗ trợ ứng dụng Sony | Headphones Connect kiểm soát và điều chỉnh âm lượng thông minh tự động hoặc theo sở thích.</li>\r\n	<li>Kết nối Bluetooth 5.0 với khoảng cách 10 m, đường truyền ổn định.</li>\r\n	<li>Sạc 3.5 giờ cho thời gian dùng đến 10 giờ, sạc nhanh 10 phút sử dụng đến 80 phút.</li>\r\n</ul>', 1, 'on', 300, 150, 0, NULL, 0, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 3, 0, 3, 'Now', 'off', NULL), (16, 'Chuột Bluetooth Apple MLA02', 'Chuột Bluetooth Magic Mouse 2 MLA02 với thiết kế sang trọng, cao cấp mang thương hiệu Apple', '<ul>\r\n	<li>Thiết kế nhỏ gọn, nằm trong lòng bàn tay, dễ thao tác, di chuyển.</li>\r\n	<li>Rê chuột mượt với độ phân giải của cảm biến<strong> 1500 DPI.</strong></li>\r\n	<li>Kết nối không dây <strong>Bluetooth</strong> ổn định trong <strong>10 m</strong>. </li>\r\n	<li>Tích hợp cảm ứng tiện cuộn, lật sang các tab đang mở, phóng to,...</li>\r\n	<li>Sử dụng đến <strong>2 tháng </strong>chỉ sau 1 lần sạc đầy qua cổng Lightning trong<strong> 2 tiếng</strong>. </li>\r\n</ul>', 1, 'on', 200, 50, 0, NULL, 0, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 4, 0, 5, 'Now', 'off', NULL), (17, 'Chuột Bluetooth Microsoft Arc', 'Thiết kế mỏng đẹp, độc đáo, duỗi thẳng để mang đi', '<ul>\r\n	<li>Thiết kế mỏng gọn, dễ dàng gấp lại vừa vặn.</li>\r\n	<li>Bề mặt cảm ứng tích hợp cả con lăn chuột dọc, ngang.</li>\r\n	<li>Kết nối Bluetooth 4.0 trở lên, độ phân giải 1000 DPI.</li>\r\n	<li>Tính năng SwiftPair cho kết nối nhanh với Windows.</li>\r\n	<li>Công nghệ Bluetrack sử dụng chuột được trên nhiều bề mặt.</li>\r\n</ul>', 1, 'on', 150, 50, 0, 800, 0, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 4, 0, 5, 'Now', 'off', NULL), (18, 'Chuột Gaming Corsair Nightsword RGB Tunable', 'Thiết kế hầm hố, mang đậm nét gaming chuyên nghiệp', '<ul>\r\n	<li>Thiết kế gọn đẹp, thoải mái khi sử dụng dành cho game thủ.</li>\r\n	<li>Công nghệ Omron siêu bền giúp cho chuột Corsair Night Sword RGB có tuổi thọ lên đến 50 triệu lần bấm.</li>\r\n	<li>Cảm biến quang học với 18.000 DPI di chuyển mượt mà, chính xác.</li>\r\n	<li>Tùy chỉnh nút bấm và con lăn chuột, hiệu ứng LED RGB qua phần mềm iCUE hiện đại.</li>\r\n	<li>Thay đổi trọng lượng chuột dễ dàng với 6 chiếc tạ.</li>\r\n</ul>', 1, 'on', 180, 10, 0, NULL, 0, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 4, 0, 5, 'Now', 'off', NULL), (19, 'Chuột Có Dây Gaming Razer DeathAdder', 'Vỏ ngoài màu đen thanh lịch, thiết kế công thái học hiện đại', '<ul>\r\n	<li>Kiểu dáng công thái học, phù hợp để chơi game, làm việc. </li>\r\n	<li>Cảm biến Focus+ cho độ phân giải cao <strong>20.000 DPI</strong>.</li>\r\n	<li>Sử dụng phần mềm Razer Synapse 3 <strong>lập trình</strong> <strong>8 nút nhấn </strong>dễ dàng. </li>\r\n	<li>Di chuyển dễ dàng với <strong>dây dẫn SpeedFlex</strong>.</li>\r\n	<li>Cá nhân hóa chuột với <strong>đèn RGB Razer Chroma 16.8 triệu màu</strong>.</li>\r\n</ul>', 1, 'on', 150, 10, 0, NULL, 0, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 4, 0, 5, 'Now', 'off', NULL), (20, 'Chuột không dây Logitech MX Master 3', 'Chuột không dây Logitech MX Master 3', '<ul>\r\n	<li>Kiểu dáng độc đáo hỗ trợ cổ tay, bàn tay thoải mái nhất.</li>\r\n	<li>Sử dụng chuột mượt mà trên mọi bề mặt với độ phân giải cảm biến đến 4000 DPI.</li>\r\n	<li>Tính năng Logitech Flow cho phép di chuyển con trỏ chuột và trao đổi dữ liệu giữa tối đa 3 máy tính, laptop với nhau.</li>\r\n	<li>Chức năng cuộn siêu nhanh, cuộn ngang và nút nhấn mở đa nhiệm tiện lợi.</li>\r\n	<li>Trang bị đến 7 nút điều hướng, cá nhân hóa tối ưu qua ứng dụng cài đặt Logitech Options.</li>\r\n	<li>Pin đến 70 ngày cho mỗi lần sạc đầy, sạc đầy trong 3 giờ.</li>\r\n	<li>Logitech - Thương hiệu Thụy Sĩ nổi tiếng toàn cầu trong lĩnh vực sản xuất phụ kiện máy tính.</li>\r\n</ul>', 1, 'on', 100, 30, 0, 500, 0, NULL, '2021-11-27 10:13:11', '2022-01-02 18:30:30', 4, 0, 5, 'Now', 'off', NULL), (21, 'Đồng hồ thông minh Garmin Fenix 6', 'Thiết kế năng động, dây đeo êm ái', '<ul>\r\n	<li>Thiết kế năng động, dây đeo êm ái</li>\r\n	<li>Kết nối bluetooth, hiển thị thông báo nhanh chóng</li>\r\n	<li>Mặt kính cường lực và màn hình công nghệ MiP.</li>\r\n	<li>Bộ sưu tập giao diện mặt đồng hồ phong cách</li>\r\n    <li>Pin dùng 13 ngày, 48 ngày khi ở chế độ tiết kiệm</li>\r\n    <li>Theo dõi sức khoẻ về tim mạch liên tục</li>\r\n    <li>Theo dõi sức khoẻ người đeo mỗi ngày</li>\r\n    <li>Luyện tập thể thao hiệu quả và thú vị hơn</li>\r\n    <li>Điều khiển phát nhạc từ xa</li>\r\n    <li>Thoải mái bơi, lặn ở vùng nước nông với hệ số chống nước 10 ATM</li>\r\n</ul>', 1, 'on', 300, 50, 450, NULL, 450, NULL, '2021-11-27 10:13:11', '2021-12-30 14:52:54', 7, 6, 5, 'Now', 'off', NULL), (22, 'Apple Watch S6 LTE', 'Thiết kế tinh tế, đặc trưng của Apple', '<ul>\r\n	<li>Thiết kế mang tính biểu tượng của Apple với nút Digital Crown đặc trưng</li>\r\n	<li>Tốc độ xử lí mượt mà với bộ chip S6</li>\r\n	<li>Hỗ trợ đo nồng độ Oxi trong máu và điện tâm đồ</li>\r\n	<li>Được trang bị màn hình Retina sắc nét</li>\r\n    <li>Bộ sưu tập mặt đồng hồ mới mẻ hơn</li>\r\n    <li>Thoải mái làm việc cả ngày mà không lo hết pin giữa chừng</li>\r\n    <li>Hỗ trợ bạn theo dõi sức khỏe tốt hơn</li>\r\n    <li>Công cụ đa năng hỗ trợ giám sát sức khỏe của bạn và người thân</li>\r\n    <li>Rèn luyện sức khỏe hiệu quả hơn</li>\r\n    <li>Quản lí các thành viên trong gia đình nhờ tính năng Family Setup</li>\r\n    <li>Trợ lý ảo Siri cho cuộc sống thêm dễ dàng hơn</li>\r\n    <li>Tắm, bơi ở vùng nước nông với chỉ số chống nước 5 ATM</li>\r\n</ul>', 1, 'on', 500, 100, 800, NULL, 800, NULL, '2021-11-27 10:13:11', '2021-12-28 11:52:54', 7, 6, 5, 'Expired', 'off', NULL), (23, 'Apple Watch SE LTE', 'Thiết kế sang trọng, dành cho mọi lứa tuổi', '<ul>\r\n	<li>Thiết kế sang trọng, tinh tế</li>\r\n    <li>Bộ vi xử lý hiện đại</li>\r\n    <li>Có hệ điều hành tối ưu</li>\r\n    <li>Có màn hình rõ nét</li>\r\n    <li>Trang bị bộ sưu tập mặt đồng hồ khủng lồ</li>\r\n    <li>Độc lập hơn với điện thoại</li>\r\n    <li>Có thời lượng pin lâu hơn</li>\r\n    <li>Hàng loạt tính năng theo dõi sức khỏe</li>\r\n    <li>Theo dõi và phát hiện té ngã</li>\r\n    <li>Cải thiện thể chất của bản thân</li>\r\n    <li>Thay mặt bạn làm việc nhiều hơn</li>\r\n    <li>Dễ dàng kết nối với những thành viên trong gia đình</li>\r\n</ul>', 1, 'on', 700, 50, 950, NULL, 950, NULL, '2021-11-27 10:13:11', '2021-12-28 11:52:54', 7, 2, 5, 'Expired', 'off', NULL), (24, 'Đồng hồ thông minh Suunto 9 Baro titanium', 'Thiết kế thể thao năng động', '<ul>\r\n	<li>Thiết kế thể thao năng động</li>\r\n    <li>Màn hình sắc nét với kích thước lớn</li>\r\n    <li>Thời gian sử dụng 7 ngày chỉ với một lần sạc</li>\r\n    <li>Tính toán chính xác độ cao khi leo núi</li>\r\n    <li>Tập luyện thể thao chuyên sâu</li>\r\n    <li>Bổ sung thêm nhiều tính năng chạy bộ</li>\r\n    <li>Safe - Tính năng an toàn</li>\r\n    <li>Theo dõi chất lượng giấc ngủ </li>\r\n    <li>Khẳng định chất riêng với kho giao diện phong phú</li>\r\n</ul>', 1, 'on', 300, 100, 700, 1500, 600, NULL, '2021-11-27 10:13:11', '2021-12-28 11:52:54', 7, 4, 5, 'Expired', 'off', NULL), (25, 'Samsung Galaxy Watch 3', 'Thiết kế sang trọng, chất liệu Titanium cao cấp', '<ul>\r\n	<li>Thiết kế sang trọng, chất liệu Titanium cao cấp</li>\r\n    <li>Mặt kính chống trầy, màn hình hiển thị sắc nét</li>\r\n    <li>Công nghệ theo dõi sức khỏe tối tân</li>\r\n    <li>Chăm sóc sức khỏe cho người dùng bận rộn</li>\r\n    <li>Trải nghiệm kết nối đỉnh cao</li>\r\n    <li>Thời lượng sử dụng lên đến 2 ngày</li>\r\n    <li>Thoải mái tắm, bơi ở vùng nước nông nhờ chỉ số chống nước 5 ATM</li>\r\n</ul>', 1, 'on', 350, 50, 650, NULL, 600, NULL, '2021-11-27 10:13:11', '2021-12-28 11:52:54', 7, 2, 5, 'Expired', 'off', NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dob` date NOT NULL,
  `role` int NOT NULL,
  `request` int NOT NULL,
  `request_date` datetime NULL DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gg_acc` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('abc', '1999-07-07', 0, 0, NULL, 1, 'admin', 'auctionwebapp6@gmail.com', '$2a$12$8MjmXNH3OiE8VTcn1ZqNz.M.UKT.0jabJkWEP1vuEcYEyAy7JuafS', 0), ('abc', '1999-07-07', 1, 0, NULL, 2, 'bidder1', '19119229@student.hcmute.edu.vn', '$2a$12$8MjmXNH3OiE8VTcn1ZqNz.M.UKT.0jabJkWEP1vuEcYEyAy7JuafS', 0), ('abc', '1999-07-07', 2, 0, NULL, 3, 'seller 1', 'tientrung3694@gmail.com', '$2a$12$8MjmXNH3OiE8VTcn1ZqNz.M.UKT.0jabJkWEP1vuEcYEyAy7JuafS', 0), ('abc', '2001-10-09', 1, 0, NULL, 4, 'bidder2', 'huutri0910@gmail.com', '$2a$12$8MjmXNH3OiE8VTcn1ZqNz.M.UKT.0jabJkWEP1vuEcYEyAy7JuafS', 0), ('abc', '1999-07-07', 2, 0, NULL, 5, 'seller2', '19110014@student.hcmute.edu.vn', '$2a$12$8MjmXNH3OiE8VTcn1ZqNz.M.UKT.0jabJkWEP1vuEcYEyAy7JuafS', 0), ('abc', '1999-07-07', 1, 0, NULL, 6, 'bidder3', '19110284@student.hcmute.edu.vn', '$2a$12$8MjmXNH3OiE8VTcn1ZqNz.M.UKT.0jabJkWEP1vuEcYEyAy7JuafS', 0), ('abc', '1999-07-07', 1, 0, NULL, 7, 'bidder4', '19110314@student.hcmute.edu.vn', '$2a$12$8MjmXNH3OiE8VTcn1ZqNz.M.UKT.0jabJkWEP1vuEcYEyAy7JuafS', 0);
COMMIT;

-- ----------------------------
-- Table structure for watch_list
-- ----------------------------
DROP TABLE IF EXISTS `watch_list`;
CREATE TABLE `watch_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `proid` int NOT NULL,
  `proname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price_start` int NOT NULL,
  `uid` int NOT NULL,
  `catid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 269 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of watch_list
-- ----------------------------
BEGIN;
INSERT INTO `watch_list` VALUES (268, 13, 'Tai nghe True Wireless Sony', 400, 7, 3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
