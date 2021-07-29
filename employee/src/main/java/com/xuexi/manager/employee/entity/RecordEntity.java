package com.xuexi.manager.employee.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 员工表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-17 15:33:40
 */
@Data
@TableName("record")
public class RecordEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Integer epId;
	/**
	 * 公司id
	 */
	private Integer compid;
	/**
	 * 查询的用户电话号码
	 */
	private String epTel;
	/**
	 * 创建时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createTime;
	/**
	 * 逻辑删除 1（true）已删除， 0（false）未删除
	 */
	@TableLogic
	private Integer epIsDeleted;
	/**
	 * 排序
	 */
	private Integer epSort;
	/**
	 * 企业老板名称
	 */
	private String epName;

}
