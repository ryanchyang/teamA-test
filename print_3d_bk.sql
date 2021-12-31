-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-12-29 16:54:17
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `print_3d`
--

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL COMMENT '購物車id',
  `cart_member_id` int(11) NOT NULL COMMENT '會員id',
  `cart_time` datetime NOT NULL COMMENT '購物車下單時間',
  `cart_value` int(11) DEFAULT NULL COMMENT '購物車金額',
  `cart_coupon` int(11) DEFAULT NULL COMMENT '購物車折扣',
  `cart_total_print_time` int(11) DEFAULT NULL COMMENT '購物車印製時間',
  `cart_status` varchar(255) NOT NULL COMMENT '購物車狀態'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='購物車';

--
-- 傾印資料表的資料 `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_member_id`, `cart_time`, `cart_value`, `cart_coupon`, `cart_total_print_time`, `cart_status`) VALUES
(1, 1, '2021-12-29 09:47:01', 12000, 10, 10, '3'),
(2, 2, '2021-12-28 09:49:15', 5000, 10, 30, '3'),
(3, 3, '2021-12-28 11:58:07', NULL, NULL, NULL, '1');

-- --------------------------------------------------------

--
-- 資料表結構 `classic_orders`
--

CREATE TABLE `classic_orders` (
  `orders_id` int(11) NOT NULL COMMENT '訂單品項id',
  `cart_id` int(11) NOT NULL COMMENT '購物車id',
  `product_id` int(11) NOT NULL COMMENT '經典商品id',
  `orders_value` int(11) NOT NULL COMMENT '訂單品項單價',
  `orders_amount` int(11) NOT NULL COMMENT '訂單品項數量',
  `product_category` varchar(255) NOT NULL COMMENT '產品類別',
  `member_id` int(11) NOT NULL COMMENT '會員ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='訂單品項';

--
-- 傾印資料表的資料 `classic_orders`
--

INSERT INTO `classic_orders` (`orders_id`, `cart_id`, `product_id`, `orders_value`, `orders_amount`, `product_category`, `member_id`) VALUES
(1, 1, 1, 2000, 4, 'sh', 1),
(2, 1, 2, 2800, 4, 'sh', 1),
(3, 1, 3, 2000, 4, 'sh', 1),
(4, 1, 4, 4000, 4, 'sh', 1),
(5, 1, 5, 1200, 1, 'sh', 1),
(6, 2, 6, 500, 1, 'sh', 2),
(7, 2, 14, 500, 1, 'bx', 2),
(8, 2, 7, 2000, 1, 'sh', 2),
(9, 2, 4, 1000, 1, 'sh', 2),
(10, 2, 9, 1000, 1, 'sh', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `classic_product`
--

CREATE TABLE `classic_product` (
  `c_product_id` int(11) NOT NULL COMMENT '產品ID',
  `c_product_name` varchar(255) NOT NULL COMMENT '產品名稱',
  `c_product_special_css_type` text DEFAULT NULL COMMENT '經典產品給前端的CSS 語法',
  `c_product_value` int(11) NOT NULL COMMENT '經典產品單價',
  `c_product_discount` int(11) NOT NULL COMMENT '折數',
  `c_product_is_special_sale` tinyint(1) NOT NULL COMMENT '有打折=1，沒打折=0',
  `c_product_category` varchar(10) NOT NULL COMMENT '壽司sh，甜點dz，禮盒bx',
  `c_product_print_time` int(11) DEFAULT NULL COMMENT '印製時間',
  `c_product_description` varchar(255) NOT NULL COMMENT '經典產品詳細',
  `c_product_recommend_pids` varchar(255) NOT NULL COMMENT '經典產品的推薦產品ID ※會連結到前面產品ID',
  `c_product_calories` int(11) DEFAULT NULL COMMENT '經典產品卡路里',
  `c_product_weight` int(11) NOT NULL COMMENT '經典產品重量',
  `c_product_img_path` varchar(255) NOT NULL COMMENT '經典產品圖片',
  `c_product_nutrition_img_path` varchar(255) NOT NULL COMMENT '經典產品的營養成分分析圖(六角圖)路徑',
  `c_product_nutrition_table_path` varchar(255) NOT NULL COMMENT '經典產品的營養成份表路徑',
  `c_product_materials_id` varchar(255) NOT NULL COMMENT '經典產品使用食材ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='經典產品';

--
-- 傾印資料表的資料 `classic_product`
--

INSERT INTO `classic_product` (`c_product_id`, `c_product_name`, `c_product_special_css_type`, `c_product_value`, `c_product_discount`, `c_product_is_special_sale`, `c_product_category`, `c_product_print_time`, `c_product_description`, `c_product_recommend_pids`, `c_product_calories`, `c_product_weight`, `c_product_img_path`, `c_product_nutrition_img_path`, `c_product_nutrition_table_path`, `c_product_materials_id`) VALUES
(1, '鮭魚壽司', '', 500, 80, 1, 'sh', 15, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上鮭魚作配料。', '2', 120, 300, './pic/product/1.png', './pic/nutritionimg/1.png', './pic/nutritiontable/1.png', '1'),
(2, '鮪魚壽司', '', 700, 70, 1, 'sh', 18, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上鮪魚作配料。', '3', 100, 300, './pic/product/2.png', './pic/nutritionimg/2.png', './pic/nutritiontable/2.png', '1'),
(3, '花枝壽司', '', 500, 100, 0, 'sh', 15, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上花枝作配料。', '1', 90, 300, './pic/product/3.png', './pic/nutritionimg/3.png', './pic/nutritiontable/3.png', '1'),
(4, '海膽壽司', '', 1000, 100, 0, 'sh', 20, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上海膽作配料。', '1', 120, 300, './pic/product/4.png', './pic/nutritionimg/4.png', './pic/nutritiontable/4.png', '1'),
(5, '貝柱壽司', '', 1200, 100, 0, 'sh', 20, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上貝柱作配料。', '1', 90, 300, './pic/product/5.png', './pic/nutritionimg/5.png', './pic/nutritiontable/5.png', '1'),
(6, '玉子燒壽司', '', 500, 70, 1, 'sh', 17, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上海膽作配料。', '1', 121, 300, './pic/product/6.png', './pic/nutritionimg/6.png', './pic/nutritiontable/6.png', '1'),
(7, '鰻魚壽司', '', 2000, 100, 0, 'sh', 16, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上貝柱作配料。', '1', 101, 300, './pic/product/7.png', './pic/nutritionimg/7.png', './pic/nutritiontable/7.png', '1'),
(8, '甜蝦壽司', '', 1000, 100, 0, 'sh', 22, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上海膽作配料。', '1', 91, 300, './pic/product/8.png', './pic/nutritionimg/8.png', './pic/nutritiontable/8.png', '1'),
(9, '鮮蝦壽司', '', 1000, 100, 0, 'sh', 12, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上貝柱作配料。', '1', 121, 300, './pic/product/9.png', './pic/nutritionimg/9.png', './pic/nutritiontable/9.png', '1'),
(10, '烏賊壽司', '', 700, 100, 0, 'sh', 11, '主要材料是用醋、糖、鹽調味過，以肥小而稍帶甜味的日本珍珠米所煮成的醋飯，降溫後加上海膽作配料。', '1', 91, 300, './pic/product/10.png', './pic/nutritionimg/10.png', './pic/nutritiontable/10.png', '1'),
(11, '千層蛋糕', '', 1500, 60, 1, 'dz', 20, '千層蛋糕，因著綿密且層次分明的口感受到大家的喜愛，內餡口味為牛奶、非常推薦大家試試這款蛋糕', '10', 150, 400, './pic/product/11.png', './pic/nutritionimg/11.png', './pic/nutritiontable/11.png', '60'),
(12, '巧克力蛋糕', '', 1200, 50, 1, 'dz', 15, '表皮酥脆、內層濃郁又香醇的巧克力蛋糕，深受大多的愛好者所喜愛，可冷藏冰冰的吃或是溫熱讓內層流出濃郁苦甜的兩種吃法，是一款簡單樸實卻又能跳動味蕾的蛋糕。', '9', 130, 450, './pic/product/12.png', './pic/nutritionimg/12.png', './pic/nutritiontable/12.png', '60'),
(13, '生乳蛋糕', '', 2000, 100, 0, 'dz', 20, '生乳捲其實是瑞士捲蛋糕的變化，傳統的瑞士捲蛋糕體較多，內夾些許奶油。 經過日本的改良後，蛋糕捲減少了蛋糕的厚度，在內餡上做變化。', '9', 150, 450, './pic/product/13.png', './pic/nutritionimg/13.png', './pic/nutritiontable/13.png', '60'),
(14, '禮盒(金)', '', 500, 100, 0, 'bx', 0, '考量到宴會、送禮等需求，我們推出精美的包裝禮盒給有所需求的客戶。', '0', 0, 100, './pic/product/14.png', './pic/nutritionimg/14.png', './pic/nutritiontable/14.png', '0'),
(15, '禮盒(紅)', '', 300, 100, 0, 'bx', 0, '考量到宴會、送禮等需求，我們推出精美的包裝禮盒給有所需求的客戶。', '0', 0, 150, './pic/product/15.png', './pic/nutritionimg/15.png', './pic/nutritiontable/15.png', '0');

-- --------------------------------------------------------

--
-- 資料表結構 `customized_orders`
--

CREATE TABLE `customized_orders` (
  `cus_order_id` int(11) NOT NULL COMMENT '客製化商品訂單ID',
  `cart_id` int(11) NOT NULL COMMENT '購物車ID',
  `customed_product_id` int(11) NOT NULL COMMENT '客製化商品ID',
  `customized_value` int(11) NOT NULL COMMENT '客製化商品訂單價格',
  `customized_amount` int(11) NOT NULL COMMENT '客製化商品訂單數量',
  `member_id` int(11) NOT NULL COMMENT '會員ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客製化商品訂單';

--
-- 傾印資料表的資料 `customized_orders`
--

INSERT INTO `customized_orders` (`cus_order_id`, `cart_id`, `customed_product_id`, `customized_value`, `customized_amount`, `member_id`) VALUES
(1, 1, 2, 200, 2, 1),
(2, 1, 5, 1000, 2, 1),
(3, 1, 4, 500, 3, 1),
(4, 1, 10, 700, 4, 1),
(5, 1, 6, 600, 5, 1),
(6, 2, 2, 1000, 5, 2),
(7, 2, 7, 500, 5, 2),
(8, 2, 6, 1000, 4, 2),
(9, 2, 3, 700, 3, 2),
(10, 2, 10, 1000, 2, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `customized_product`
--

CREATE TABLE `customized_product` (
  `cm_product_id` int(11) NOT NULL COMMENT '客製化商品ID',
  `cm_product_material_mix` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客製化商品混和食材',
  `cm_product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客製化商品名稱',
  `member_id` int(11) NOT NULL COMMENT '會員id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客製化產品';

--
-- 傾印資料表的資料 `customized_product`
--

INSERT INTO `customized_product` (`cm_product_id`, `cm_product_material_mix`, `cm_product_name`, `member_id`) VALUES
(1, '1,2,3', '我的壽司1', 1),
(2, '1,3,4', '壽司的壽司', 1),
(3, '1,5,7', NULL, 2),
(4, '1,9,5', NULL, 2),
(5, '1,3,10', NULL, 3),
(6, '1,5,12', NULL, 3),
(7, '1,8,9', NULL, 4),
(8, '1,10,12', NULL, 4),
(9, '1,13,14', NULL, 5),
(10, '1,11,12', NULL, 5);

-- --------------------------------------------------------

--
-- 資料表結構 `materials`
--

CREATE TABLE `materials` (
  `material_id` int(11) NOT NULL COMMENT '食材ID',
  `material_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '食材名稱',
  `material_produce_date` date NOT NULL COMMENT '食材有效期限',
  `material_produce_process` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '食材的主要成分',
  `material_for_groups` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '適合此食材的族群',
  `material_css_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '食材給前端的CSS 語法',
  `material_img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '食材的圖片路徑',
  `material_nutrition_img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '食材的營養成分分析圖(六角圖)路徑',
  `material_nutrition_table_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '食材的營養成份表路徑',
  `material_value` int(11) NOT NULL COMMENT '食材單價',
  `material_print_time` int(11) NOT NULL COMMENT '食材印製時間',
  `material_discount` int(11) DEFAULT NULL COMMENT '食材折扣優惠'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='食物材質表';

--
-- 傾印資料表的資料 `materials`
--

INSERT INTO `materials` (`material_id`, `material_name`, `material_produce_date`, `material_produce_process`, `material_for_groups`, `material_css_type`, `material_img_path`, `material_nutrition_img_path`, `material_nutrition_table_path`, `material_value`, `material_print_time`, `material_discount`) VALUES
(1, '醋飯', '2025-10-05', '蒟蒻', '老人,小孩', NULL, NULL, NULL, NULL, 100, 15, 80),
(2, '鮭魚', '2025-10-01', '蒟蒻', '老人', NULL, NULL, NULL, NULL, 200, 15, 80),
(3, '鮪魚', '2025-10-01', '蒟蒻', '老人,小孩', NULL, NULL, NULL, NULL, 300, 15, 60),
(4, '玉子燒', '2025-10-01', '雞蛋', '老人,小孩', NULL, NULL, NULL, NULL, 100, 10, 80),
(5, '鮭魚卵', '2025-10-05', '蒟蒻', '老人,小孩', NULL, NULL, NULL, NULL, 200, 20, 100),
(6, '哇沙米', '2025-10-05', '山葵', '老人,小孩', NULL, NULL, NULL, NULL, 100, 5, 80),
(7, '鮮蝦', '2025-10-05', '蒟蒻', '老人', NULL, NULL, NULL, NULL, 200, 15, 80),
(8, '干貝', '2025-10-05', '雞蛋', '老人', NULL, NULL, NULL, NULL, 300, 15, 100),
(9, '燒肉', '2025-10-05', '蒟蒻', '老人,小孩', NULL, NULL, NULL, NULL, 300, 20, 100),
(10, '烏魚子', '2025-10-05', '綠豆粉', '老人,小孩', NULL, NULL, NULL, NULL, 200, 15, 80),
(11, '小黃瓜', '2025-10-05', '小黃瓜', '老人,小孩', NULL, NULL, NULL, NULL, 100, 15, 100),
(12, '素鰻', '2025-10-05', '大豆蛋白', '老人,小孩', NULL, NULL, NULL, NULL, 300, 15, 100),
(13, '白帶魚', '2025-10-05', '大豆蛋白', '老人,小孩', NULL, NULL, NULL, NULL, 200, 15, 80);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL COMMENT '會員ID',
  `member_account` varchar(255) NOT NULL COMMENT '會員登入帳號',
  `member_password` varchar(20) NOT NULL COMMENT '會員登入密碼',
  `member_name` varchar(255) NOT NULL COMMENT '會員姓名',
  `member_nickname` varchar(20) NOT NULL COMMENT '會員暱稱',
  `member_level` varchar(20) NOT NULL COMMENT '會員等級',
  `member_credit` int(11) NOT NULL COMMENT '會員點數',
  `member_total_credit` int(11) NOT NULL COMMENT '會員總積分',
  `member_coupon` int(11) NOT NULL COMMENT '會員優惠卷',
  `member_mobile` varchar(255) NOT NULL COMMENT '會員手機',
  `member_address` varchar(255) NOT NULL COMMENT '會員地址',
  `member_email` varchar(255) NOT NULL COMMENT '會員郵件',
  `member_birthday` date NOT NULL COMMENT '會員生日',
  `member_photo_img_path` varchar(255) NOT NULL COMMENT '會員個人照片',
  `member_everyday_login_record` int(11) NOT NULL COMMENT '會員打卡資訊',
  `member_creditcard_number` varchar(255) NOT NULL COMMENT '會員信用卡號',
  `member_shares` varchar(255) NOT NULL COMMENT '會員收藏',
  `member_lottery_by_day` tinyint(1) NOT NULL COMMENT '會員每日抽獎與否',
  `member_ceate_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '會員建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='會員資料';

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`member_id`, `member_account`, `member_password`, `member_name`, `member_nickname`, `member_level`, `member_credit`, `member_total_credit`, `member_coupon`, `member_mobile`, `member_address`, `member_email`, `member_birthday`, `member_photo_img_path`, `member_everyday_login_record`, `member_creditcard_number`, `member_shares`, `member_lottery_by_day`, `member_ceate_date`) VALUES
(1, 'b12345', '56789', '李大華', '阿華', '銅', 1000, 0, 200, '0923-234-789', '新北市中和區', 'hua_lee2@testmail.com.tw', '1989-10-30', '', 1, '1111222233334444', '', 0, '2021-12-28 17:28:49'),
(2, 'a12345', '12345', '李花花', '阿花', '銅', 5000, 0, 1000, '0923-234-456', '新北市中和區', 'hua_lee@testmail.com.tw', '1989-10-20', '', 1, '1112222333344445', '', 0, '2021-12-28 17:28:49'),
(3, 'iicc666', '66666', '王大六', '阿六', '金', 500, 0, 100, '0933333333', '台中市', '666@testmail.com', '1988-10-05', '', 4, '1111555566668888', '', 1, '2021-12-28 17:35:30'),
(4, 'BigJoe', '0000', '鳩施', '小濕', '金', 18000, 500000, 5000, '0986544378', '苗栗市辛德區', 'BigJoe@gmail.com', '1972-04-19', '', 3, '1225789635687456', '', 0, '2021-12-29 09:50:21'),
(5, 'sunrise', '1111', '旭日東昇', '小甥', '銀', 800, 15000, 2000, '0985-777-458', '台北市內湖區', 'sunrise@testmail.com.jp', '1993-12-09', '', 2, '9687222258965454', '', 1, '2021-12-29 10:01:12'),
(6, 'captainyang', 'rrrryyyy', '台灣隊長', 'nickYang', '金', 500, 5000, 2000, '0955555666', '台北市東湖區', 'ryanyang@testmail.com', '1990-04-06', '', 5, '2222444455556666', '', 1, '2021-12-29 10:03:20'),
(7, 'kklllooo', 'sd99988', '柯呵呵', '呵呵', '銅', 500, 1000, 1000, '0960666555', '台南市', 'c8c8@testmail.com', '1999-10-01', '', 5, '9999888877776666', '', 0, '2021-12-29 10:05:22'),
(8, 'coolman', '2222', '李清涼', '涼哥', '銅', 5000, 8000, 200, '0988-556-665', '台北市中山區', 'coolman@testmail.com', '2013-12-18', '', 1, '2222333355556666', '', 1, '2021-12-29 10:05:42'),
(9, 'd77ddd', '77777', '東戚戚', 'D77', '金', 500, 1000, 2000, '0988999888', '美國達拉斯', 'd77@testmail.com', '1990-05-05', '', 1, '5556666622223333', '', 1, '2021-12-29 10:08:12'),
(10, 'shaokung', '5566', '少年康', '少康', '銀', 6000, 26000, 700, '0966557441', '新北市葫蘆區', 'shaokung@testmail.com', '1982-09-14', '', 5, '9999888877776666', '', 0, '2021-12-29 10:09:01');

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '新聞標題',
  `news_category` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '產品分類',
  `news_start_date` date NOT NULL COMMENT '活動開始日期',
  `news_end_date` date NOT NULL COMMENT '活動結束日期',
  `news_detail` text CHARACTER SET utf8mb4 NOT NULL COMMENT '新聞內容',
  `news_edit_date` date NOT NULL COMMENT '新聞編輯日期',
  `news_img_path` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '圖片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新聞活動';

--
-- 傾印資料表的資料 `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_category`, `news_start_date`, `news_end_date`, `news_detail`, `news_edit_date`, `news_img_path`) VALUES
(1, '迎接新的2022年，新年開運料理吃北海道大帆立貝  ', '新品上市', '2021-12-20', '2022-01-05', '還在想年底聚餐吃什麼嗎?!\n迎接新的2022年，新年開運料理吃北海道大帆立貝  \n讓你一帆風順 事事順利', '2021-12-20', './pic/news/1.png'),
(2, '【新品預告】壽喜吧肉肉 12/21 大口吃肉', '新品上市', '2021-12-22', '2021-12-24', '將牛肉以日本壽喜燒醬汁烘烤入味，香氣四溢令人食指大動\n再結合入口即化的半熟蛋，極佳的滋味讓人唇齒留香', '2021-12-22', './pic/news/2.png'),
(3, '【鰻載而鮭 預告】12/10~12/16限期登場', '期間活動', '2021-12-10', '2021-12-16', '【鰻載而鮭 預告】12/10~12/16限期登場\n冬季開胃料理齊聚，美味超載的鰻載而鮭即將登場！！\n炙烤乳酪照燒鰻魚 鰻魚x起司的創新搭配，濃郁鹹甜的好滋味讓人無法抗拒', '2021-12-08', './pic/news/3.png'),
(4, '【Hello Kitty好禮袋著走活動預告】', '回饋活動', '2021-11-30', '2021-12-22', '【Hello Kitty好禮袋著走活動預告】\nWOW~甜美可愛的 Hello Kitty 限量粉藍色手提袋 登場\n11/30開始快去搶先預約〝袋〞回家', '2021-11-23', './pic/news/4.png'),
(5, '1/19新春御品人氣上桌囉', '新品上市', '2022-01-19', '2021-12-30', '〖本月精選預告〗1/19新春御品人氣上桌囉\n藏壽司精心推出四款人氣限定壽司，滿足你的味蕾\n\n蒜香洋蔥牛肉壽司 $40\n香濃牛肉汁佐上清爽石澤醬，多層次濃厚口感\n炙烤玫瑰岩鹽大生鮮蝦(一貫) $40\n以喜馬拉亞岩鹽和烈火，徹底釋放蝦子的鮮甜\n卡滋紅蔥酥胡麻鮭魚 $40\n特製胡麻醬與油蔥酥完美結合，打造絕無僅有的美味\n蒜香豬五花 $40\n特製甜鹹醬佐大量蒜片，以誘人香氣勾起食慾', '2022-01-12', './pic/news/5.png'),
(6, '冬季開胃料理齊聚，美味超載的鰻載而鮭即將登場！！', '新品上市', '2021-12-30', '2022-01-01', '炙烤乳酪照燒鰻魚 鰻魚x起司的創新搭配，濃郁鹹甜的好滋味讓人無法抗拒\n豪華三鮮(干貝-鮭魚-赤蝦) 屢獲超高人氣的三種食材一次享有\n柚香鮭魚卵生鮭魚 甘甜鮮美的特選一品，清爽又解膩', '2021-12-25', './pic/news/6.png'),
(7, '甜蝦珍鮭祭預告', '新品上市', '2022-01-01', '2022-01-03', '蝦蝦蝦蝦蝦蝦蝦蝦蝦蝦蝦蝦蝦蝦蝦蝦\n你沒看錯 16尾甜蝦一次奉上\n獻上滿足饕客視覺與味覺的奢華料理', '2022-01-01', './pic/news/7.png'),
(8, '秋爽推薦 開胃上桌', '新品上市', '2022-01-05', '2022-01-07', '〖本月精選預告〗秋爽推薦新品美味登場\n食慾大開的秋天，藏壽司準備四款限定料理等你來開吃', '2022-01-05', './pic/news/8.png'),
(9, '鮪貝嚐鮮祭預告', '期間活動', '2022-01-07', '2022-01-09', '帝王級鮪魚大脂、超高CP值三貫 限期七天快閃藏壽司\n10道奢華海鮮饗宴收服你的心', '2022-01-07', './pic/news/9.png'),
(10, '豪華澎湃新商品11/20華麗上桌', '新品上市', '2021-11-20', '2021-11-26', '〖新品預告〗豪華澎湃新商品11/20華麗上桌\n來自北海道厚實大帆立貝重磅登場\n11/20-11/26連續七天12道美味餐點不間斷\n\n北海道大粒醃漬帆立貝海苔包 將帆立貝以特製醬油醃漬鎖入鮮甜，搭配海苔包塑造豐富口感\n北海道大粒帆立貝佐鮭魚卵 厚實美味加大版帆立貝撒上新鮮鮭魚卵\n親子生鮭魚壽司 口感扎實的厚切生鮭魚與甘甜濃厚的鮭魚卵\n炙烤玫瑰岩鹽生鮭魚(一貫)  撒上天然喜瑪拉雅玫瑰岩鹽炙烤，襯出鮭魚的鮮美\n豪華三鮮(生干貝+生鮭魚+赤蝦) 人氣回歸！用料澎湃的必點美味，絕對超值\n金目鯛三重奏 將嚴選金目鯛以三種料理手法，激盪出極致美味\n盛的滿滿貝柱握壽司 飽滿厚實干貝山，鮮味Q彈', '2021-11-13', './pic/news/10.png'),
(11, '海選饗宴 美味登場', '新品上市', '2022-01-11', '2022-01-13', '來藏壽司以澎湃海料犒賞自己\n炙烤香氣與豐富口感造就海選饗宴，入口後彷彿置身大海！！', '2022-01-11', './pic/news/11.png'),
(12, '日本風味 西京漬鰈魚', '新品上市', '2022-01-13', '2022-01-15', '將口感Q彈的鰈魚以京都傳統調味法「西京漬」釀漬，勾勒出魚肉本身的鮮甜\n免出國即可品嚐獨特日本風味，快來藏壽司享用吧～～', '2022-01-07', './pic/news/12.png'),
(13, '印出自己的壽司!親子體驗會', '工作坊', '2022-01-15', '2022-01-17', '大朋友小朋友一起列印壽司!', '2022-01-15', './pic/news/13.png'),
(14, 'Hello Kitty 限量好禮年末滿額回饋活動', '回饋活動', '2022-01-17', '2022-01-19', '三麗鷗家族可愛來襲！準備好帶回家了嗎~~\n超萌#限量三麗鷗家族杯匙組，不僅療癒又能溫暖你的心', '2022-01-13', './pic/news/14.png'),
(15, '大蝦大特價', '特價活動', '2022-01-19', '2022-01-21', '鮮蝦材料特價中', '2022-01-19', './pic/news/15.png'),
(16, '鮪鮭雙享祭1/22限期七日上桌', '期間活動', '2022-01-22', '2022-01-29', '〖新品預告〗1/22限期七日上桌\n頂級黑鮪魚大肚限期回歸\n鮮甜海膽結合飽滿鮭魚卵奢華上市\n鮪魚派VS鮭魚派，你是哪一派?\n\n熟成黑鮪魚大肚(一貫) 豐富油花與入口即化的口感，無法抵擋的美味\n炙烤黑鮪魚大肚(一貫) 將大肚炙烤後帶出香氣，讓吮指美味更上層樓\n豪華三鮮(生干貝+生鮭魚+赤蝦) 老饕必點，絕對超值三貫組\n鮭魚卵鮑魚奢華三貫 鮑魚、小貝柱、海膽、大粒鮭魚卵將所有美味齊聚一堂\n親子生鮭魚壽司 Q彈爆漿的鮭魚卵與鮭魚，打造壽司界的最佳拍檔\n炙烤起司扇貝 清爽與醇厚雙層風味大滿足\n帆立貝蝦仁茶碗蒸 帆立貝與Q彈鮮蝦搭配鮮甜滑嫩的蒸蛋\n還有：熟成黑鮪魚中肚(一貫)、大粒鮭魚卵軍艦、蒜香洋蔥牛肉壽司、蒜香豬五花、雞肉龍田揚握壽司、炙烤玫瑰岩鹽大生鮮蝦(一貫)、7種魚介濃厚味噌拉麵，共14道澎湃料理一次滿足藏友們挑剔的味蕾！', '2022-01-22', './pic/news/16.png'),
(17, '〖新品預告〗期間限定 新鮮登場', '期間活動', '2021-09-15', '2021-09-30', '〖新品預告〗期間限定 新鮮登場\n3款夏秋精選料理9/15隆重推出\n\n蟹肉棒鮮蝦手卷 蟹肉棒加鮮蝦沙拉美味再升級\n特製醃漬鮪魚 獨家醬汁調味令人齒頰留香\n炙烤起司扇貝 清爽與醇厚雙層風味大滿足\n底下留言告訴藏編最想吃哪一款', '2021-09-11', './pic/news/17.png'),
(18, '肉食控注意！1/31起享肉盛宴驚喜登場', '期間活動', '2022-01-31', '2022-03-27', '肉食控注意！1/31起享肉盛宴驚喜登場\n限期28天推出，首次登場2款壽喜牛系列壽司\n8款應景「肉壽司」快來大快朵頤', '2022-01-31', './pic/news/18.png'),
(19, '【本月精選預告】 新品來嚐鮮上市', '期間活動', '2022-02-02', '2022-02-28', '【本月精選預告】 新品來嚐鮮\n炎炎夏日總是讓人沒有食慾\n精選五款清爽開胃der推薦料理\n2月限期美味上桌>>立即預約', '2022-02-02', './pic/news/19.png'),
(20, '與您攜手共同防疫', '通知', '2022-02-04', '2022-02-06', '全力配合政府防疫措施，維護安心健康的用餐環境，\n加強五大消毒與三大防疫措施如下：\n1.全店內外場環境均使用75%酒精加強消毒\n2.收桌整理時，使用酒精消毒\n3.用餐後的餐桌在收拾整理後，會再使用酒精進行消毒\n4.入座前，餐桌、熱水出水口、醬油瓶等調味瓶，包含筷盒、薑片盒、芥末瓶、茶粉末的湯匙等其他用品也都會一併清潔消毒\n5.觸控式螢幕，會使用酒精進行消毒\n6.出勤員工均配戴口罩，並每天更換新口罩\n7.上班前員工均使用抗菌手部清潔用品，出勤期間隨時加強手部清潔消毒\n8.加強員工自主健康管理，發燒或身體不適者均立即就醫並予病假休養', '2022-02-04', './pic/news/20.png'),
(21, '厭世生活 究該醬吃', '新品上市', '2022-04-01', '2022-04-30', '【本月精選預告！厭4生活 #究該醬吃 】\n生活或職場遇到各種厭世的事情都不用擔心\n4/20起~來藏壽司 #吃壽司補充正能量\n一個人或揪好友一起hen可以，究來吃擺脫煩惱\n\n媽媽厭世語錄：到底要我說幾次? 心好累該怎麼\"拌\"\n來一碗 #綜合天婦羅醬拌烏龍麵 補充體力\n\n上班族厭世語錄：\n每天都有做不完的事，蟹蟹讓我壓力不間斷\n吃一口 #蟹肉棒天婦羅佐甜醬油 提起幹勁\n\n學生厭世語錄：\n不求高分，只求這學期醬子就好\n來一盤 #特製七味醬豬 充滿活力', '2022-04-01', './pic/news/21.png'),
(22, '秋冬逸品12/15美味登場', '新品上市', '2021-12-05', '2022-01-01', '〖新品預告〗秋冬逸品12/15美味登場\n期間限定推出2款多層次美味壽司饗宴\n\n雞肉龍田揚握壽司$40\n金黃酥脆、熱騰騰且香氣四溢的暖胃超人氣商品\n\n蒜香洋蔥鮮蝦$40\n新鮮爽口洋蔥搭配香氣馥郁的蒜片，襯托鮮蝦甜美的絕配好滋味', '2021-12-05', './pic/news/22.png'),
(23, '濃郁新美味11/17登場', '新品上市', '2021-11-17', '2021-12-03', '〖新品預告〗濃郁新美味11/17登場\n3款限定料理特別推出，多層次滋味讓人欲罷不能\n\n蒜香洋蔥牛肉壽司 香濃牛肉汁佐上清爽石澤醬，多層次濃厚口感\n奶油乳酪蟹肉棒 濃濃奶香與清甜蟹肉，在口中迸發意猶未盡的滋味\n炙烤味噌美乃滋鮭魚 獨家特製味噌美乃滋，鹹香滋味提升鮮度', '2021-11-10', './pic/news/23.png'),
(24, '蠟筆小新滿額”袋”回家', '回饋活動', '2021-11-09', '2021-11-25', '〖活動預告〗蠟筆小新滿額”袋”回家\n11/9起限定回饋藏友可愛實用 #蠟筆小新購物袋\n快來完成任務搶先兌換限量好禮\n數量有限，立即預約 http://onelink.to/kurasushi\n\n活動時間：2020/11/9(一)起~送完為止\n活動贈品：蠟筆小新購物袋，全台共16,500個\n活動辦法：\nStep1 當日單筆消費滿1500元以上\nStep2 追蹤Facebook或Instagram至櫃台出示畫面+發票\n即可免費兌換「蠟筆小新購物袋」乙個！', '2021-11-03', './pic/news/24.png'),
(25, '初秋嚴選10/20新登場', '新品上市', '2021-10-20', '2022-02-16', '新品預告〗初秋嚴選10/20新登場\n涼爽秋日推出3款期間限定料理\n炙烤香氣與彈牙口感滿足味蕾與嗅覺的雙重饗宴，等你來嘗鮮\n\n日本產熟成真鯛 炙烤香氣與口感並存的美味逸品\n雞肉天婦羅握壽司 酥脆外皮與軟嫩多汁雞肉的完美結合\n醃漬大生鮮蝦(一貫) 緊實飽滿蝦肉以特調醬汁醃漬', '2021-10-07', './pic/news/25.png'),
(26, '藏壽司 8/18超人氣推薦壽司登場', '新品上市', '2021-08-18', '2021-09-09', '【新品預告】藏壽司 8/18超人氣推薦壽司登場\n炎炎夏日藏壽司推出限定超人氣壽司幫藏友們振興食慾\n厚切鯖魚 肉質口感扎實，以醋熟成，夏日開胃新選擇\n雞肉龍田揚握壽司 以特製醬料醃漬調味，油炸後金黃酥脆不容錯過\n\n厚肉扎實與酥脆口感，\n底下留言告訴藏編你最想吃哪一個？！', '2021-08-11', './pic/news/26.png'),
(27, '期間限定 7/10 鮪魚祭', '期間活動', '2021-07-10', '2021-07-30', '【新品預告】 藏壽司 鮪魚祭 7/10盛大登場\n#嚴選黑鮪魚大餐\n4款黑鮪魚系列單品極品大肚肉油脂甜美，生食炙烤都好吃；熟成黑鮪魚肉質細嫩，醃漬後別有一番風味\n#大人氣商品\n厚切熟成鮪魚三鮮、盛的滿滿貝柱，份量十足，加乘美味大呼過癮\n#夏日元氣推薦\n燒炙紅喉與鰻魚茶碗蒸，珍貴食材為食慾不振的夏天補充活力', '2021-07-03', './pic/news/27.png');

-- --------------------------------------------------------

--
-- 資料表結構 `share`
--

CREATE TABLE `share` (
  `share_id` int(11) NOT NULL COMMENT '分享牆id',
  `member_id` int(11) NOT NULL COMMENT '會員id',
  `share_likes` varchar(255) DEFAULT NULL COMMENT '分享牆個人按讚(物件id)',
  `share_saves` varchar(255) DEFAULT NULL COMMENT '分享牆個人收藏(物件id)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分享牆';

--
-- 傾印資料表的資料 `share`
--

INSERT INTO `share` (`share_id`, `member_id`, `share_likes`, `share_saves`) VALUES
(1, 1, '6,7', '6,8'),
(4, 2, '1,2,3,4,5', '2,5'),
(5, 3, '3,9', '1,2,3'),
(6, 4, '6,8', '5'),
(7, 5, '1,8,9', '4,5'),
(8, 6, '3,10', '2,5'),
(9, 7, '1,5,9,8,10', '8,7'),
(10, 8, '6,8,1', NULL),
(11, 9, NULL, '6,3,2,8'),
(12, 10, '1,8', '2');

-- --------------------------------------------------------

--
-- 資料表結構 `share_item`
--

CREATE TABLE `share_item` (
  `share_item_id` int(11) NOT NULL COMMENT '分享牆物件id',
  `member_id` int(11) NOT NULL COMMENT '會員id',
  `share_order_id` int(11) NOT NULL COMMENT '訂單id',
  `share_order_category` varchar(255) NOT NULL COMMENT '訂單種類(經典跟客製)',
  `share_title` varchar(20) NOT NULL COMMENT '分享物件標題',
  `share_img` varchar(255) NOT NULL COMMENT '分享物件照片',
  `share_hash` varchar(255) DEFAULT NULL COMMENT '分享物件井號',
  `share_date` date DEFAULT NULL COMMENT '分享物件建立日期',
  `share_desc` varchar(255) DEFAULT NULL COMMENT '分享物件描述',
  `share_liked` int(11) NOT NULL DEFAULT 0 COMMENT '分享物件被按讚數',
  `share_saved` varchar(255) DEFAULT NULL COMMENT '分享物件被收藏(member_id)',
  `share_status` varchar(255) NOT NULL DEFAULT '0' COMMENT '分享狀態'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分享牆物件';

--
-- 傾印資料表的資料 `share_item`
--

INSERT INTO `share_item` (`share_item_id`, `member_id`, `share_order_id`, `share_order_category`, `share_title`, `share_img`, `share_hash`, `share_date`, `share_desc`, `share_liked`, `share_saved`, `share_status`) VALUES
(1, 1, 1, 'co', '鮭魚壽司', '', '鮭魚,紅色,美味', '2021-12-22', '在家拍的3d列印壽司~', 5, '3', '1'),
(2, 1, 2, 'co', 'Q版鮪魚壽司', '', '可愛，簡單', '2021-12-23', '最喜歡這個口味!', 1, '2,3,6,9,10', '1'),
(3, 1, 3, 'co', 'QQ花枝壽司', '', '彈口，簡易', '2021-12-23', '有吃到花枝的口感', 3, '3,9', '1'),
(4, 1, 4, 'co', '海膽壽司', '', '高級，好吃', '2021-12-23', '味道很濃郁，好吃!', 1, '5', '1'),
(5, 1, 5, 'co', '特級貝柱壽司', '', '口感，高級', '2021-12-23', '吃起來很像真的', 2, '2,4,5,6', '1'),
(6, 1, 1, 'cuso', '壽司的壽司', '', '吸睛', '2021-12-24', '做出來有點高級的壽司', 3, '2,9', '1'),
(7, 1, 2, 'cuso', '我的壽司1', '', '健康，可愛，簡單', '2021-12-24', '自己做的健康壽司呦', 2, '2,9', '1'),
(8, 1, 3, 'cuso', '我的壽司2', '', '快速，簡單', '2021-12-24', '五分鐘就可以完成', 4, '3,6,9', '1'),
(9, 1, 4, 'cuso', '肉壽司', '', '實惠，量多', '2021-12-24', '肉的分量很夠', 2, '5,7', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `subscription`
--

CREATE TABLE `subscription` (
  `sub_id` int(11) NOT NULL COMMENT '訂閱id',
  `sub_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂閱方案名稱',
  `sub_days` int(11) NOT NULL COMMENT '訂閱方案天數',
  `sub_value` int(11) NOT NULL COMMENT '訂閱方案價格',
  `sub_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂閱方案組合內容',
  `sub_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂閱方案敘述',
  `recommend_pids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推薦商品id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='訂閱方案';

--
-- 傾印資料表的資料 `subscription`
--

INSERT INTO `subscription` (`sub_id`, `sub_name`, `sub_days`, `sub_value`, `sub_content`, `sub_description`, `recommend_pids`) VALUES
(1, '健身方案', 7, 12000, '1,2,3,4,5,6,7', '高蛋白,低鈉,低醣', '2,5,3');

-- --------------------------------------------------------

--
-- 資料表結構 `sub_set`
--

CREATE TABLE `sub_set` (
  `set_id` int(11) NOT NULL COMMENT '套餐id',
  `set_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '套餐名稱',
  `product_mix_id_set` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '一個套餐中包含的產品',
  `set_img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '套餐圖片路徑',
  `set_nutrition_img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '套餐的營養成分分析圖(六角圖)路徑',
  `set_nutrition_table_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '套餐的營養成份表路徑'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='訂閱方案中的便當套餐';

--
-- 傾印資料表的資料 `sub_set`
--

INSERT INTO `sub_set` (`set_id`, `set_name`, `product_mix_id_set`, `set_img_path`, `set_nutrition_img_path`, `set_nutrition_table_path`) VALUES
(1, '鮭魚六貫', '1,1,1,1,1,1', NULL, NULL, NULL),
(2, '玉子燒六貫', '6,6,6,6,6,6', NULL, NULL, NULL),
(3, '鮪魚六貫', '2,2,2,2,2,2', NULL, NULL, NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- 資料表索引 `classic_orders`
--
ALTER TABLE `classic_orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- 資料表索引 `classic_product`
--
ALTER TABLE `classic_product`
  ADD PRIMARY KEY (`c_product_id`);

--
-- 資料表索引 `customized_orders`
--
ALTER TABLE `customized_orders`
  ADD PRIMARY KEY (`cus_order_id`);

--
-- 資料表索引 `customized_product`
--
ALTER TABLE `customized_product`
  ADD PRIMARY KEY (`cm_product_id`);

--
-- 資料表索引 `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`material_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `member_account` (`member_account`);

--
-- 資料表索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- 資料表索引 `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`share_id`),
  ADD KEY `share_member_id` (`member_id`);

--
-- 資料表索引 `share_item`
--
ALTER TABLE `share_item`
  ADD PRIMARY KEY (`share_item_id`),
  ADD KEY `share_item_member_id` (`member_id`),
  ADD KEY `share_order_id2` (`share_order_id`);

--
-- 資料表索引 `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`sub_id`);

--
-- 資料表索引 `sub_set`
--
ALTER TABLE `sub_set`
  ADD PRIMARY KEY (`set_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '購物車id', AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `classic_orders`
--
ALTER TABLE `classic_orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '訂單品項id', AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `classic_product`
--
ALTER TABLE `classic_product`
  MODIFY `c_product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '產品ID', AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customized_orders`
--
ALTER TABLE `customized_orders`
  MODIFY `cus_order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客製化商品訂單ID', AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customized_product`
--
ALTER TABLE `customized_product`
  MODIFY `cm_product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客製化商品ID', AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `materials`
--
ALTER TABLE `materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食材ID', AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員ID', AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `share`
--
ALTER TABLE `share`
  MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分享牆id', AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `share_item`
--
ALTER TABLE `share_item`
  MODIFY `share_item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分享牆物件id', AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `subscription`
--
ALTER TABLE `subscription`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '訂閱id', AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `sub_set`
--
ALTER TABLE `sub_set`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐id', AUTO_INCREMENT=4;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `share`
--
ALTER TABLE `share`
  ADD CONSTRAINT `share_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `share_item`
--
ALTER TABLE `share_item`
  ADD CONSTRAINT `share_item_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
