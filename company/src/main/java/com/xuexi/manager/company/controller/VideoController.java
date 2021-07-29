package com.xuexi.manager.company.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xuexi.manager.company.entity.VideoEntity;
import com.xuexi.manager.company.service.VideoService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-03-01 13:35:44
 */
@RestController
@RequestMapping("company/video")
public class VideoController {
    @Autowired
    private VideoService videoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = videoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		VideoEntity video = videoService.getById(id);
        return R.ok().put("video", video);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody VideoEntity video){
		videoService.saveOrUpdateVideo(video);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody VideoEntity video){
		videoService.updateById(video);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete/{id}")
    public R deleteById(@PathVariable("id")String id){
        videoService.removeDelById(id);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		videoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
