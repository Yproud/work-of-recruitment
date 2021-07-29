package com.xuexi.manager.employee.controller;

import java.util.Arrays;
import java.util.Map;

import com.xuexi.manager.employee.entity.vo.StaffEntityVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xuexi.manager.employee.entity.StaffEntity;
import com.xuexi.manager.employee.service.StaffService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 员工表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-15 19:22:41
 */
@RestController
@RequestMapping("employee/staff")
public class StaffController {
    @Autowired
    private StaffService staffService;


    /**
     * 列表  list/emp/${id}
     */
    @RequestMapping("/list/emp/{id}")
    public R listEmpById(@PathVariable("id") Integer id){
        StaffEntityVo staff = staffService.listEmpById(id);

        return R.ok().put("data", staff);
    }

    /**
     * 列表  list/emp/${id}
     */
    @RequestMapping("/listemp")
    public R listemp(@RequestParam Map<String, Object> params){
        PageUtils page = staffService.queryPageEmp(params);

        return R.ok().put("page", page);
    }



    /**
     * 列表  list/emp/${id}
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = staffService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{epId}")
    public R info(@PathVariable("epId") Integer epId){
		StaffEntity staff = staffService.getById(epId);

        return R.ok().put("staff", staff);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody StaffEntityVo staff){

        staffService.saveStaff(staff);

        return R.ok();
    }

    /**
     * 修改   /updateinfo/${this.dataForm.id}  infoById/${this.dataForm.id}
     */
    @RequestMapping("/infoById")
    public R infoById(@RequestBody StaffEntity staffEntity){
        System.out.println(staffEntity);
        staffService.infoById(staffEntity);

        return R.ok();
    }

    /**
     * 修改   /updateinfo/${this.dataForm.id}
     */
    @RequestMapping("/update/{id}")
    public R update1ById(@PathVariable("id") Integer id){
        staffService.update1ById(id);

        return R.ok();
    }
    /**
     * 修改
     */
    @RequestMapping("/update1/{id}")
    public R update11ById(@PathVariable("id") Integer id){
        staffService.update11ById(id);

        return R.ok();
    }
    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody StaffEntity staff){
		staffService.updateById(staff);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer epIds){
		staffService.removeById(epIds);

        return R.ok();
    }

}
