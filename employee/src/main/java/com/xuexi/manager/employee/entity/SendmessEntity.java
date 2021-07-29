package com.xuexi.manager.employee.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-12 19:43:03
 */
@Data
@TableName("sendmess")
public class SendmessEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 主题
	 */
	private String theme;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 附件
	 */
	private String accessory;
	/**
	 * 发送人
	 */
	private String sender;
	/**
	 * 发送时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createTime;
	/**
	 * 邮件类型（普通，星级邮件）
	 */
	private Integer sendtype;
	/**
	 * 发送状态(0:草稿，1：发送，2：退回）
	 */
	private Integer sendstatus;
	/**
	 * 是否删除
	 */
	@TableLogic
	private Integer isDeleted;

}
