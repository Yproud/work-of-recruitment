package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;

import com.xuexi.manager.employee.entity.StatisticsEntity;
import com.xuexi.manager.employee.entity.vo.DataSearchVo;
import com.xuexi.manager.employee.entity.vo.SearchVo;
import com.xuexi.manager.employee.entity.vo.StatisticsTempVo;
import com.xuexi.manager.utils.PageUtils;

import java.util.Map;

/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
public interface StatisticsService extends IService<StatisticsEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void create(StatisticsTempVo statisticsTempVo);

    DataSearchVo show(SearchVo searchVo);
}

