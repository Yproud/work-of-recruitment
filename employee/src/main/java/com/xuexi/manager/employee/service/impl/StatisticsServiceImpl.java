package com.xuexi.manager.employee.service.impl;

import com.xuexi.manager.employee.entity.vo.DataSearchVo;
import com.xuexi.manager.employee.entity.vo.SearchVo;
import com.xuexi.manager.employee.entity.vo.StatisticsTempVo;
import com.xuexi.manager.employee.service.EmployeeService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


import com.xuexi.manager.employee.dao.StatisticsDao;
import com.xuexi.manager.employee.entity.StatisticsEntity;
import com.xuexi.manager.employee.service.StatisticsService;


@Service("statisticsService")
public class StatisticsServiceImpl extends ServiceImpl<StatisticsDao, StatisticsEntity> implements StatisticsService {

    @Autowired
    EmployeeService employeeService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StatisticsEntity> page = this.page(
                new Query<StatisticsEntity>().getPage(params),
                new QueryWrapper<StatisticsEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void create(StatisticsTempVo statisticsTempVo) {
        StatisticsEntity one = baseMapper.selectOne(new QueryWrapper<StatisticsEntity>().eq("date_calculated", statisticsTempVo.getNowTime())
                .eq("job_id",statisticsTempVo.getCpId()));
            Integer count = employeeService.selectCount(statisticsTempVo);
            StatisticsEntity statisticsEntity = new StatisticsEntity();
            statisticsEntity.setApplyNum(count);
            statisticsEntity.setJobId(statisticsTempVo.getCpId());
            statisticsEntity.setDateCalculated(statisticsTempVo.getNowTime());
            if(one==null) {
            baseMapper.insert(statisticsEntity);
        }else{
                one.setApplyNum(count);
                baseMapper.updateById(one);
            }
    }

    @Override
    public DataSearchVo show(SearchVo searchVo) {
        Date begin = searchVo.getBegin();
        Date end = searchVo.getEnd();
        Integer cpId = searchVo.getCpId();
        List<StatisticsEntity> sta=baseMapper.selectShow(begin,end,cpId);

        DataSearchVo dataSearchVo = new DataSearchVo();
        dataSearchVo.setNums(new ArrayList<Integer>());
        dataSearchVo.setTimes(new ArrayList<Date>());
        for(StatisticsEntity item:sta) {
            dataSearchVo.getNums().add(item.getApplyNum());
            dataSearchVo.getTimes().add(item.getDateCalculated());
        }
        return dataSearchVo;
    }

}