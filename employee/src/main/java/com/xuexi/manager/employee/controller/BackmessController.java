package com.xuexi.manager.employee.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xuexi.manager.employee.entity.BackmessEntity;
import com.xuexi.manager.employee.service.BackmessService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-12 19:43:02
 */
@RestController
@RequestMapping("employee/backmess")
public class BackmessController {
    @Autowired
    private BackmessService backmessService;

    /**
     * 列表  listById
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = backmessService.queryPage(params);

        return R.ok().put("page", page);
    }
    /**
     * 列表  listById
     */
    @RequestMapping("/listById")
    public R listById(@RequestParam Map<String, Object> params){
        PageUtils page = backmessService.queryPageById(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		BackmessEntity backmess = backmessService.getById(id);

        return R.ok().put("backmess", backmess);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody BackmessEntity backmess){
		backmessService.save(backmess);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody BackmessEntity backmess){
		backmessService.updateById(backmess);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		backmessService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
