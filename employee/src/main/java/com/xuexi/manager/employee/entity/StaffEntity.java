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
 * @date 2021-04-15 19:22:41
 */
@Data
@TableName("staff")
public class StaffEntity implements Serializable {
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
	 * 申诉原因
	 */
	private String epIntroduction;
	/**
	 * 处理状态（1.已提交 2.审核中，3审核完成  ）
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
	private String epMessage;

}
