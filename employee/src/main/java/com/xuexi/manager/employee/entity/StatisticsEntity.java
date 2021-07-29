package com.xuexi.manager.employee.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@Data
@TableName("hr_statistics")
public class StatisticsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 统计日期
	 */
	private Date dateCalculated;
	/**
	 * 申请数量
	 */
	private Integer applyNum;
	/**
	 * 岗位id
	 */
	private Integer jobId;
	/**
	 * 求职者id
	 */
	private Integer employeeId;
	/**
	 * 违纪次数
	 */
	private Integer dispinNum;
	/**
	 * 出勤次数
	 */
	private Integer attendNum;

}
