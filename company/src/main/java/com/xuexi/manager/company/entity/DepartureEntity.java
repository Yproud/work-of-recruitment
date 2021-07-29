package com.xuexi.manager.company.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 员工离职情况表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
@Data
@TableName("hr_departure")
public class DepartureEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Integer dpId;
	/**
	 * 员工姓名
	 */
	private String dpName;
	/**
	 * 离职说明
	 */
	private String dpInstruction;
	/**
	 * 创建时间
	 */


	private Date createTime;
	/**
	 * 更新时间
	 */

	private Date modifyTime;
	/**
	 * 员工状态（1：离职）
	 */
	private Integer dpEmployeeStatus;
	/**
	 * 工作时间
	 */
	private Integer dpWorkTime;
	/**
	 * 电话号码
	 */
	private String dpTel;
	private Integer compid;
	private Integer auditstatus;
	private String compname;

}
