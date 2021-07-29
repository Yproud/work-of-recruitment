package com.xuexi.manager.employee.dao;

import com.xuexi.manager.employee.entity.TPayLogEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 支付日志表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-05 21:05:55
 */
@Mapper
public interface TPayLogDao extends BaseMapper<TPayLogEntity> {
	
}
