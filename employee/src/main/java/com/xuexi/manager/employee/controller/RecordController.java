package com.xuexi.manager.employee.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xuexi.manager.employee.entity.RecordEntity;
import com.xuexi.manager.employee.service.RecordService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 员工表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-17 15:33:40
 */
@RestController
@RequestMapping("employee/record")
public class RecordController {
    @Autowired
    private RecordService recordService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = recordService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{epId}")
    public R info(@PathVariable("epId") Integer epId){
		RecordEntity record = recordService.getById(epId);

        return R.ok().put("record", record);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody RecordEntity record){
		recordService.save(record);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody RecordEntity record){
		recordService.updateById(record);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] epIds){
		recordService.removeByIds(Arrays.asList(epIds));

        return R.ok();
    }

}
