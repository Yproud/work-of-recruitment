package com.xuexi.manager.employee.dao;

import com.xuexi.manager.employee.entity.StatisticsEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@Mapper
public interface StatisticsDao extends BaseMapper<StatisticsEntity> {

    List<StatisticsEntity> selectShow(@Param("begin") Date begin,@Param("end") Date end,@Param("cpId") Integer cpId);
}
