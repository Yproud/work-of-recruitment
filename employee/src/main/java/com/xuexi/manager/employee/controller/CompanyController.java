package com.xuexi.manager.employee.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.xuexi.manager.employee.entity.EmployeeEntity;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.xuexi.manager.employee.entity.CompanyEntity;
import com.xuexi.manager.employee.service.CompanyService;




/**
 * 公司表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@RestController
@RequestMapping("employee/company")
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    /**
     * 删除二级分类信息：/delete/{data.cpId}
     */
    @PostMapping("/delete/{cpId}")
    public R deleteCompById(@PathVariable("cpId") Integer cpId){
        companyService.deleteCompById(cpId);

        return R.ok();
    }

    /**
     * 保存二级分类信息：category/save
     */
    @PostMapping("category/save")
    public R categorySave(@RequestBody CompanyEntity companyEntity){
        companyService.categorySave(companyEntity);

        return R.ok();
    }
    /**
     * 二级分类信息：/list/one
     */
    @RequestMapping("/list/one")
    public R categoryOne(){
        List<CompanyEntity> data = companyService.categoryOne();

        return R.ok().put("data", data);
    }


    /**
     * 二级分类信息：/list/twoById/${this.cpId}
     */
    @RequestMapping("/list/twoById/{cpId}")
    public R categoryTwoById(@PathVariable("cpId")Integer cpId){
        List<CompanyEntity> data = companyService.categoryTwoById(cpId);

        return R.ok().put("data", data);
    }
    /**
     * 二级分类信息：/list/two
     */
    @RequestMapping("/list/two")
    public R categoryTwo(){
        List<CompanyEntity> data = companyService.categoryTwo();

        return R.ok().put("data", data);
    }


    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = companyService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{cpId}")
    public R info(@PathVariable("cpId") Integer cpId){
		CompanyEntity company = companyService.getById(cpId);

        return R.ok().put("company", company);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CompanyEntity company){
		companyService.save(company);

        return R.ok();
    }

    /**
     * 修改newupdate
     */
    @PostMapping("/newupdate")
    public R newUpdate(@RequestBody CompanyEntity company){
        companyService.updateComp(company);

        return R.ok();
    }
    /**
     * 修改newupdate
     */
    @RequestMapping("/update")
    public R update(@RequestBody CompanyEntity company){
		companyService.updateById(company);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] cpIds){
		companyService.removeByIds(Arrays.asList(cpIds));

        return R.ok();
    }

}
