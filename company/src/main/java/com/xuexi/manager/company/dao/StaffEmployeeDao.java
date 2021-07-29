package com.xuexi.manager.company.dao;

import com.xuexi.manager.company.entity.StaffEmployeeEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 员工表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-03-11 19:18:50
 */
@Mapper
public interface StaffEmployeeDao extends BaseMapper<StaffEmployeeEntity> {
	
}
