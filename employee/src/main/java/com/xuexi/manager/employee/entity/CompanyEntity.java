package com.xuexi.manager.employee.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 公司表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@Data
@TableName("hr_company")
public class CompanyEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 部门分类id
	 */
	@TableId
	private Integer cpId;
	/**
	 * 部门名字
	 */
	private String cpName;
	/**
	 * 状态（1：在招聘，2：没有招聘，3：岗位）
	 */
	private Integer cpStatus;
	/**
	 * 是否显示[0-不显示，1显示]
	 */
	private Integer cpLevel;
	/**
	 * 父分类id
	 */
	private Integer cpParentId;
	/**
	 * 排序
	 */
	private Integer cpSort;
	/**
	 * 创建时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createTime;
	/**
	 * 更新时间
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date modifyTime;

	@TableField(exist = false)//表示数据库中没有的字段
	private List<CompanyEntity> children;

}
