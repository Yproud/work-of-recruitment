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

import com.xuexi.manager.company.entity.DepartureEntity;
import com.xuexi.manager.company.service.DepartureService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 员工离职情况表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
@RestController
@RequestMapping("company/departure")
public class DepartureController {
    @Autowired
    private DepartureService departureService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = departureService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 远程信息
     */
    @RequestMapping("/remote/info/to")
    public List<DepartureEntity> departureInfoTo(@RequestBody SelStaffTo selStaffTo){
        List<DepartureEntity> departure = departureService.departureInfoTo(selStaffTo);

        return departure;
    }
    /**
     * 远程信息
     */
    @RequestMapping("/remote/info/{dpId}")
    public List<DepartureEntity> departureInfo(@PathVariable("dpId") String dpId){
        List<DepartureEntity> departure = departureService.departureInfo(dpId);

        return departure;
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{dpId}")
    public R info(@PathVariable("dpId") Integer dpId){
		DepartureEntity departure = departureService.getById(dpId);

        return R.ok().put("departure", departure);
    }

    /**
     * 保存  /status/${id}
     */
    @RequestMapping("/status/success/{id}")
    public R updateStatus(@PathVariable("id") String id){
        departureService.updateStatus(id);
        return R.ok();
    }

    /**
     * 保存  /status/${id}
     */
    @RequestMapping("/status/fail/{id}")
    public R updateStatusFail(@PathVariable("id") String id){
        departureService.updateStatusFail(id);
        return R.ok();
    }

    /**
     * 保存  /status/${id}   /status/fail/${id}
     */
    @RequestMapping("/save")
    public R save(@RequestBody DepartureEntity departure){
		departureService.save(departure);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody DepartureEntity departure){
		departureService.updateById(departure);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] dpIds){
		departureService.removeByIds(Arrays.asList(dpIds));

        return R.ok();
    }

}
