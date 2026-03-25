-- 用户表
CREATE TABLE `user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `student_id` VARCHAR(32) NOT NULL COMMENT '学号',
    `password` VARCHAR(255) NOT NULL COMMENT '密码',
    `nickname` VARCHAR(64) NOT NULL COMMENT '昵称',
    `phone` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
    `credit_score` INT NOT NULL DEFAULT 100 COMMENT '信用分',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_student_id` (`student_id`)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '用户表';

-- 商品表
CREATE TABLE `product` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `publisher_id` BIGINT NOT NULL COMMENT '发布者ID',
    `title` VARCHAR(128) NOT NULL COMMENT '商品标题',
    `description` TEXT COMMENT '详细描述',
    `price` DECIMAL(10, 2) NOT NULL COMMENT '价格',
    `category` VARCHAR(64) NOT NULL COMMENT '分类',
    `images` JSON COMMENT '多图URL（JSON格式）',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态（0:下架 1:上架 2:已售出）',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_publisher_id` (`publisher_id`)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '商品表';

-- 订单表
CREATE TABLE `orders` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `buyer_id` BIGINT NOT NULL COMMENT '买家ID',
    `seller_id` BIGINT NOT NULL COMMENT '卖家ID',
    `product_id` BIGINT NOT NULL COMMENT '商品ID',
    `amount` DECIMAL(10, 2) NOT NULL COMMENT '交易金额',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT '订单状态（0:待付款 1:已完成 2:已取消）',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_buyer_id` (`buyer_id`),
    KEY `idx_seller_id` (`seller_id`),
    KEY `idx_product_id` (`product_id`)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '订单表';
