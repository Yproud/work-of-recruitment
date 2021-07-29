package com.xuexi.manager.company.entity;

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
 * @date 2021-03-01 13:35:44
 */
@Data
@TableName("video")
public class VideoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 视频凭证
	 */
	private String videoSourceId;
	/**
	 * 视频名称
	 */
	private String videoOriginalName;
	/**
	 * 部门id
	 */
	private Integer cpId;

}
