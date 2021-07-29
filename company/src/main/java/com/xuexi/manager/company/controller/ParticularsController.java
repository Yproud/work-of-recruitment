package com.xuexi.manager.company.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.xuexi.manager.to.SelStaffTo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.xuexi.manager.company.entity.ParticularsEntity;
import com.xuexi.manager.company.service.ParticularsService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;
import org.springframework.web.multipart.MultipartFile;


/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
@RestController
@RequestMapping("company/particulars")
public class ParticularsController {
    @Autowired
    private ParticularsService particularsService;


    //添加课程分类
    //获取上传过来的文件，把文件内容读取出来
    @PostMapping("addSubject")
    public R addSubject(MultipartFile file){
        //file:上传过来的excel文件
        particularsService.saveSubject(particularsService,file);
        return R.ok();
    }

    /**
     * 列表
     */
    @RequestMapping("/list1")
    public R list1(@RequestParam Map<String, Object> params){
        PageUtils page = particularsService.queryPage1(params);

        return R.ok().put("page", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = particularsService.queryPage(params);

        return R.ok().put("page", page);
    }
    /**
     * 信息  id:电话号码  /particular/info/to
     */
    @RequestMapping("/particular/info/to")
    public List<ParticularsEntity> ParticularInfoTo(@RequestBody SelStaffTo selStaffTo){
        List<ParticularsEntity> particulars = particularsService.getParticularInfoByIdTo(selStaffTo);

        return particulars;
    }

    /**
     * 信息  id:电话号码  /particular/info/to
     */
    @RequestMapping("/particular/info/{id}")
    public List<ParticularsEntity> ParticularInfo(@PathVariable("id") String id){
        List<ParticularsEntity> particulars = particularsService.getParticularInfoById(id);

        return particulars;
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		ParticularsEntity particulars = particularsService.getById(id);

        return R.ok().put("particulars", particulars);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ParticularsEntity particulars){
		particularsService.save(particulars);

        return R.ok();
    }

    /**
     * 修改  /update/${id}
     */
    @RequestMapping("/update/{id}")
    public R update1ById(@PathVariable("id") Integer id){
        particularsService.update1ById(id);

        return R.ok();
    }
    /**
     * 修改  /update/${id}
     */
    @RequestMapping("/update")
    public R update(@RequestBody ParticularsEntity particulars){
		particularsService.updateById(particulars);

        return R.ok();
    }

    /**
     * 删除  /delete2
     */
    @RequestMapping("/delete2")
    public R delete2(@RequestBody Integer[] ids){
        particularsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

    /**
     * 删除  /delete2
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		particularsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
