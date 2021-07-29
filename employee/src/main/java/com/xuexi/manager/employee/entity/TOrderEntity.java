package com.xuexi.manager.employee.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 订单
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-05 21:05:55
 */
@Data
@TableName("t_order")
public class TOrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 订单号
	 */
	private String orderNo;
	/**
	 * 会员名称
	 */
	private String nickname;
	/**
	 * 会员手机
	 */
	private String mobile;
	/**
	 * 订单金额（分）
	 */
	private BigDecimal totalFee;
	/**
	 * 支付类型（1：微信 2：支付宝）
	 */
	private Integer payType;
	/**
	 * 订单状态（0：未支付 1：已支付）
	 */
	private Integer status;
	/**
	 * 逻辑删除 1（true）已删除， 0（false）未删除
	 */
	@TableLogic
	private Integer isDeleted;
	/**
	 * 创建时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 * 更新时间
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;


}