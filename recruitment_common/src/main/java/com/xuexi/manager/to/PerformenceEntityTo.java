package com.xuexi.manager.to;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 员工工作情况表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
@Data
public class PerformenceEntityTo implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */

	private Integer pfId;
	/**
	 * 员工姓名
	 */
	private String pfName;
	/**
	 * 缺勤情况（0:全勤，1：迟到一次）
	 */
	private Long pfAttendance;
	/**
	 * 创建时间
	 */

	private Date createTime;
	/**
	 * 更新时间
	 */

	private Date modifyTime;
	/**
	 * 员工电话号码
	 */
	private String pfTel;
	private Integer compid;
	private Integer auditstatus;
	private String compname;
}
