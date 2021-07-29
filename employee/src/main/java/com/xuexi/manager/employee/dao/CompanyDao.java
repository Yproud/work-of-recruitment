package com.xuexi.manager.employee.dao;

import com.xuexi.manager.employee.entity.CompanyEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 公司表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@Mapper
public interface CompanyDao extends BaseMapper<CompanyEntity> {
	
}
