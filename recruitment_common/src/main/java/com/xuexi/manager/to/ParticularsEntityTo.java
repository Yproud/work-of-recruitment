package com.xuexi.manager.to;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
@Data
public class ParticularsEntityTo implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	private Integer id;
	/**
	 * 重大事件
	 */
	private String particualrs;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date modifyTime;
	/**
	 * 逻辑删除
	 */
	/**
	 * 电话号码
	 */
	private String telephone;
	private Integer compid;
	private Integer auditstatus;
	private String compname;

}
