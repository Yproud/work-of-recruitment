package com.xuexi.manager.company.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xuexi.manager.company.entity.StaffEmployeeEntity;
import com.xuexi.manager.company.service.StaffEmployeeService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 员工表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-03-11 19:18:50
 */
@RestController
@RequestMapping("company/staffemployee")
public class StaffEmployeeController {
    @Autowired
    private StaffEmployeeService staffEmployeeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = staffEmployeeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{epId}")
    public R info(@PathVariable("epId") Integer epId){
		StaffEmployeeEntity staffEmployee = staffEmployeeService.getById(epId);

        return R.ok().put("staffEmployee", staffEmployee);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody StaffEmployeeEntity staffEmployee){
		staffEmployeeService.save(staffEmployee);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody StaffEmployeeEntity staffEmployee){
		staffEmployeeService.updateById(staffEmployee);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] epIds){
		staffEmployeeService.removeByIds(Arrays.asList(epIds));

        return R.ok();
    }

}
