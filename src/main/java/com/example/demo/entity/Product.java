package com.example.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * <p>
 * 商品表
 * </p>
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("product")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 发布者ID
     */
    @TableField("publisher_id")
    private Long publisherId;

    /**
     * 商品标题
     */
    @TableField("title")
    private String title;

    /**
     * 详细描述
     */
    @TableField("description")
    private String description;

    /**
     * 价格
     */
    @TableField("price")
    private BigDecimal price;

    /**
     * 分类
     */
    @TableField("category")
    private String category;

    /**
     * 多图URL（JSON格式）
     */
    @TableField("images")
    private String images;

    /**
     * 状态（0:下架 1:上架 2:已售出）
     */
    @TableField("status")
    private Integer status;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private LocalDateTime updateTime;
}
