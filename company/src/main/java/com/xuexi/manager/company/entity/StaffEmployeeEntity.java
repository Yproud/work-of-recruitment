package com.xuexi.manager.company.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 员工表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-03-11 19:18:50
 */
@Data
@TableName("staff_employee")
public class StaffEmployeeEntity implements Serializable {
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
	 * 学历（2.本科  1：高中，3：研究生）
	 */
	private Integer epEducation;
	/**
	 * 期望薪资
	 */
	private Integer epTargetPay;
	/**
	 * 个人介绍
	 */
	private String epIntroduction;
	/**
	 * 员工状态（1.在职 2.离职）
	 */
	private Integer epEmpoyeeStatus;
	/**
	 * 员工头像
	 */
	private String epPortrait;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date modifyTime;
	/**
	 * 其他（证明材料，证书等）
	 */
	private String epOther;
	/**
	 * 逻辑删除 1（true）已删除， 0（false）未删除
	 */
	private Integer epIsDeleted;
	/**
	 * 排序
	 */
	private Integer epSort;

}
