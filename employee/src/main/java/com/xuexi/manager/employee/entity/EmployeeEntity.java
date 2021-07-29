package com.xuexi.manager.employee.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 员工表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@Data
@TableName("hr_employee")
public class EmployeeEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Integer epId;
	/**
	 * 姓名
	 */
	private String epName;
	/**
	 * 性别(1：男，）
	 */
	private Integer epSex;
	/**
	 * 年龄
	 */
	private Integer epAge;
	/**
	 * 电话号码
	 */
	private String epTel;
	/**
	 * 邮箱
	 */
	private String epEmail;
	/**
	 * 学历（1.本科  2：高中，3：研究生）
	 */
	private Integer epEducation;
	/**
	 * 期望职位id（ 1：Java工程师 2：h5工程师）
	 */
	private Integer epJobId;
	/**
	 * 期望薪资
	 */
	private String epTargetPay;
	/**
	 * 个人介绍
	 */
	private String epIntroduction;
	/**
	 * 员工状态（1.录用 2.没有录用，3.正在筛选）
	 */
	private Integer epEmpoyeeStatus;
	/**
	 * 员工头像
	 */
	private String epPortrait;
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
	/**
	 * 其他（证明材料，证书等）
	 */
	private String epOther;
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
	 * 职业父级id
	 */
	private Integer epJobParentId;


	@TableField(exist = false)//表示数据库中没有的字段
	private String cpName;

	private Double epSalary;
	private Integer epStatus;
	private Integer epUpload;
	private String epMessage;
}
