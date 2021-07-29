package com.xuexi.manager.employee.dao;

import com.xuexi.manager.employee.entity.RecordEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 员工表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-17 15:33:40
 */
@Mapper
public interface RecordDao extends BaseMapper<RecordEntity> {
	
}
