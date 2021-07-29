package com.xuexi.manager.company.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.xuexi.manager.to.SelStaffTo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xuexi.manager.company.entity.PerformenceEntity;
import com.xuexi.manager.company.service.PerformenceService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 员工工作情况表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
@RestController
@RequestMapping("company/performence")
public class PerformenceController {
    @Autowired
    private PerformenceService performenceService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = performenceService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息 pfId:电话号码
     */
    @RequestMapping("/performence/info/to")
    public List<PerformenceEntity> PerformenceInfoByIdTo(@RequestBody SelStaffTo selStaffTo){
        List<PerformenceEntity> performence = performenceService.getPerformenceInfoByIdTo(selStaffTo);

        return performence;
    }

    /**
     * 信息 pfId:电话号码
     */
    @RequestMapping("/performence/info/{pfId}")
    public List<PerformenceEntity> PerformenceInfoById(@PathVariable("pfId") String pfId){
        List<PerformenceEntity> performence = performenceService.getPerformenceInfoById(pfId);

        return performence;
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{pfId}")
    public R info(@PathVariable("pfId") Integer pfId){
		PerformenceEntity performence = performenceService.getById(pfId);

        return R.ok().put("performence", performence);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody PerformenceEntity performence){
		performenceService.save(performence);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody PerformenceEntity performence){
		performenceService.updateById(performence);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] pfIds){
		performenceService.removeByIds(Arrays.asList(pfIds));

        return R.ok();
    }

}
