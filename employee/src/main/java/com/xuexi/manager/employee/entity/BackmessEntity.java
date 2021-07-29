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
 * @date 2021-04-12 19:43:02
 */
@Data
@TableName("backmess")
public class BackmessEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 发送人
	 */
	private String sendname;
	/**
	 * 回馈信息
	 */
	private String message;
	/**
	 * 删除字段
	 */
	@TableLogic
	private Integer isDeleted;
	/**
	 * 回馈时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createTime;
    private String recivename;
}
