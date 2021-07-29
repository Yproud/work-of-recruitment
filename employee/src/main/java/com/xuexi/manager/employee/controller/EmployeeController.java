package com.xuexi.manager.employee.controller;

import java.util.*;

import com.xuexi.manager.employee.entity.StaffEntity;
import com.xuexi.manager.employee.entity.TOrderEntity;
import com.xuexi.manager.employee.entity.vo.*;
import com.xuexi.manager.employee.fegin.CompanyFeign;
import com.xuexi.manager.employee.service.RecordService;
import com.xuexi.manager.to.DepartureEntityTo;
import com.xuexi.manager.to.ParticularsEntityTo;
import com.xuexi.manager.to.PerformenceEntityTo;
import com.xuexi.manager.to.SelStaffTo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import com.xuexi.manager.employee.entity.EmployeeEntity;
import com.xuexi.manager.employee.service.EmployeeService;




/**
 * 员工表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@RestController
@RequestMapping("employee/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @Autowired
    CompanyFeign companyFeign;
    @Autowired
    RedisTemplate<String,String> redisTemplate;
    @Autowired
    RecordService recordService;
    /**
     * 修改  /updateStatus/${epTel}
     */
    @PostMapping("/updateStatus/{epTel}")
    public R updateStatus(@PathVariable("epTel") String epTel){
        employeeService.updateStatus(epTel);
        return R.ok();
    }

    /**
     * 修改  /update/${id    /updateStatus/${epTel}
     */
    @PostMapping("/updateNo/{epId}")
    public R updateNoEpId(@PathVariable("epId") Integer epId){
        employeeService.updateNoEpId(epId);

        return R.ok();
    }
    /**
     * 修改  /update/${id
     */
    @PostMapping("/update/{cpId}")
    public R updateCpId(@PathVariable("cpId") Integer cpId){
        employeeService.updateCpId(cpId);
        return R.ok();
    }
    /**
     * 修改  /update/${id
     */
    @PostMapping("/update/name")
    public R updateName(){
        employeeService.updateName();
        return R.ok();
    }
    @RequestMapping("/update/addName1")
    public R updateAddName1(){
        employeeService.updateByAddName1();
        return R.ok();
    }

    @RequestMapping("/update/addName")
    public R updateAddName(){
        employeeService.updateByAddName();
        return R.ok();
    }

    /**
     * 个人信息：listemp
     */
    @RequestMapping("/listemp")
    public R listemp(@RequestParam Map<String, Object> params){
        PageUtils page = employeeService.queryPageEmp(params);

        return R.ok().put("page", page);
    }
    /**
     * 个人信息   /list/emp/${id}
     */
    @RequestMapping("/list/emp/{id}")
    public R listEmpEmpById(@PathVariable("id") Integer id){
        EmlpoyeeEntityVo page = employeeService.listEmpEmpById(id);
        return R.ok().put("data", page);
    }
    /**
     * 列表listemp  list/${this.cpId}  /list/emp/${id}   /list/status/${this.cpId}
     */
    @RequestMapping("/listByPart/{phone}")
    public R listByPart(@PathVariable("phone") String phone){
        List<ParticularsEntityTo> page = employeeService.listByPart(phone);
        return R.ok().put("page", page);
    }
    /**
     * 列表listemp  list/${this.cpId}  /list/emp/${id}   /list/status/${this.cpId}
     */
    @RequestMapping("/list/{cpId}")
    public R listEmpById(@RequestParam Map<String, Object> params,@PathVariable("cpId") Integer cpId){
        PageUtils page = employeeService.listEmpById(params,cpId);

        return R.ok().put("page", page);
    }

    /**
     * 列表listemp  list/${this.cpId}  /list/emp/${id}   /list/status/${this.cpId}
     */
    @RequestMapping("/list1/{cpId}")
    public R list1EmpById(@RequestParam Map<String, Object> params,@PathVariable("cpId") Integer cpId){
        PageUtils page = employeeService.list1EmpById(params,cpId);

        return R.ok().put("page", page);
    }
    /**
     * 列表listemp  list/${this.cpId}  /list/emp/${id}   /list/status/${this.cpId}
     */
    @RequestMapping("/list/status/{cpId}")
    public R listEmpStatusById(@RequestParam Map<String, Object> params,@PathVariable("cpId") Integer cpId){
        PageUtils page = employeeService.listEmpStatusById(params,cpId);

        return R.ok().put("page", page);
    }

    /**
     * 列表listemp  /list/redis
     */
    @RequestMapping("/list/redis")
    public R listRedis(){
        EmlpoyeeEntityVo page = employeeService.listRedis();

        return R.ok().put("page", page);
    }
    /**
     * 列表listemp  /list/redis
     */
    @RequestMapping("/list/redisall")
    public R listRedisAll(){
        OrderVo page = employeeService.listRedisAll();

        return R.ok().put("page",page);
    }
    /**
     * 列表listemp  /list/status /list/redis
     */
    @RequestMapping("/list/status")
    public R listStatus(@RequestParam Map<String, Object> params){
        PageUtils page = employeeService.queryPageStatus(params);

        return R.ok().put("page", page);
    }


    /**
     * 远程查看员工重大事件信息
     */
    @Transactional
    @RequestMapping("/company/feign/sel")
    public R listByIdFeignSel(@RequestBody SelStaffTo selStaffTo){

        List<ParticularsEntityTo> particularsEntityTos = companyFeign.ParticularInfoTo(selStaffTo);
        List<PerformenceEntityTo> performenceEntityTo = companyFeign.PerformenceInfoByIdTo(selStaffTo);
        List<DepartureEntityTo> departureEntityTos = companyFeign.departureInfoTo(selStaffTo);
        return R.ok().put("data",particularsEntityTos).put("perform",performenceEntityTo).put("departure",departureEntityTos);
    }

    /**
     * 远程查看员工重大事件信息
     */
    @Transactional
    @RequestMapping("/company/feign/salary/sel")
    public R listByIdFeign(@RequestBody SelStaffTo selStaffTo){

        String user = redisTemplate.opsForValue().get("user");
        EmlpoyeeEntityVo emlpoyeeEntityVo=employeeService.selectByName(user);
        if(emlpoyeeEntityVo.getEpStatus()==0) {
            if (emlpoyeeEntityVo.getEpSalary() <= 0) {
                return R.ok().put("message", 0);
            }
            employeeService.updateByPhone(emlpoyeeEntityVo.getEpSalary(), emlpoyeeEntityVo.getEpTel());
        }
        recordService.saveRecord(emlpoyeeEntityVo);
        List<ParticularsEntityTo> particularsEntityTos = companyFeign.ParticularInfoTo(selStaffTo);
        List<PerformenceEntityTo> performenceEntityTo = companyFeign.PerformenceInfoByIdTo(selStaffTo);
        List<DepartureEntityTo> departureEntityTos = companyFeign.departureInfoTo(selStaffTo);
        return R.ok().put("data",particularsEntityTos).put("perform",performenceEntityTo).put("departure",departureEntityTos);
    }
    /**
     * 修改   /updateinfo/${this.dataForm.id}  infoById/${this.dataForm.id}
     */
    @RequestMapping("/infoById")
    public R infoById(@RequestBody EmployeeEntity staffEntity){
        System.out.println(staffEntity);
        employeeService.infoById(staffEntity);

        return R.ok();
    }

    /**
     * 列表listemp  /list/status  infoById
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = employeeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{epId}")
    public R info(@PathVariable("epId") Integer epId){
		EmployeeEntity employee = employeeService.getById(epId);

        return R.ok().put("employee", employee);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody EmlpoyeeEntityVo emlpoyeeEntityVo){
		employeeService.saveEmployee(emlpoyeeEntityVo);

        return R.ok();
    }


    /**
     * 简历筛选 /select
     */
    @RequestMapping("/select")
    public R select(@RequestBody EmployeeSelectVo employeeSelectVo){
        employeeService.select(employeeSelectVo);

        return R.ok();
    }
    /**
     * 修改   updateTosave
     */
    @RequestMapping("/updateTosave")
    public R updateTosave(@RequestBody EmlpoyeeEntityVo emlpoyeeEntityVo){
        employeeService.updateTosave(emlpoyeeEntityVo);

        return R.ok();
    }
    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody EmployeeEntity employee){
		employeeService.updateById(employee);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer epId){
		employeeService.removeEmpById(epId);

        return R.ok();
    }
    /**
     * 上传
     */
    @RequestMapping("/upload/image/wx")
    public R imageswx(@RequestBody UploadImagesVo uploadImagesVo){
        System.out.println(uploadImagesVo.toString());
        employeeService.imagewx(uploadImagesVo);

        return R.ok();
    }

}
