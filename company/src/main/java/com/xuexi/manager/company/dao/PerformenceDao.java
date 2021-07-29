package com.xuexi.manager.company.dao;

import com.xuexi.manager.company.entity.PerformenceEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 员工工作情况表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
@Mapper
public interface PerformenceDao extends BaseMapper<PerformenceEntity> {

    List<PerformenceEntity> selectPerformInfoById(String pfId);
}
