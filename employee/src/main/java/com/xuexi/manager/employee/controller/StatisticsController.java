package com.xuexi.manager.employee.controller;

import java.util.Arrays;
import java.util.Map;

import com.xuexi.manager.employee.entity.vo.DataSearchVo;
import com.xuexi.manager.employee.entity.vo.SearchVo;
import com.xuexi.manager.employee.entity.vo.StatisticsTempVo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xuexi.manager.employee.entity.StatisticsEntity;
import com.xuexi.manager.employee.service.StatisticsService;




/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@RestController
@RequestMapping("employee/statistics")
public class StatisticsController {
    @Autowired
    private StatisticsService statisticsService;



    /**
     * 生成求职者数据  create
     */
    @RequestMapping("/create")
    public R create(@RequestBody StatisticsTempVo statisticsTempVo){
        statisticsService.create(statisticsTempVo);

        return R.ok();
    }
    /**
     * 显示/show
     */
    @RequestMapping("/show")
    public R show(@RequestBody SearchVo searchVo){
        DataSearchVo page = statisticsService.show(searchVo);
        return R.ok().put("data", page);
    }

    /**
     * 列表/show
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = statisticsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		StatisticsEntity statistics = statisticsService.getById(id);

        return R.ok().put("statistics", statistics);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody StatisticsEntity statistics){
		statisticsService.save(statistics);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody StatisticsEntity statistics){
		statisticsService.updateById(statistics);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		statisticsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
