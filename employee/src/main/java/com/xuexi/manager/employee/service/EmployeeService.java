package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;

import com.xuexi.manager.employee.entity.EmployeeEntity;
import com.xuexi.manager.employee.entity.TOrderEntity;
import com.xuexi.manager.employee.entity.vo.*;
import com.xuexi.manager.to.ParticularsEntityTo;
import com.xuexi.manager.utils.PageUtils;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 员工表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
public interface EmployeeService extends IService<EmployeeEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPageEmp(Map<String, Object> params);

    PageUtils listEmpById(Map<String, Object> params, Integer cpId);

    void updateCpId(Integer cpId);

    void updateNoEpId(Integer epId);

    Integer selectCount(StatisticsTempVo statisticsTempVo);

    void select(EmployeeSelectVo employeeSelectVo);

    void saveEmployee(EmlpoyeeEntityVo emlpoyeeEntityVo);

    EmlpoyeeEntityVo listEmpEmpById(Integer id);

    void updateTosave(EmlpoyeeEntityVo emlpoyeeEntityVo);

    void removeEmpById(Integer epId);

    PageUtils listEmpStatusById(Map<String, Object> params, Integer cpId);

    PageUtils queryPageStatus(Map<String, Object> params);

    void updateStatus(String epTel);

    EmlpoyeeEntityVo listRedis();

    void addFee(BigDecimal totalFee, String mobile);

    OrderVo listRedisAll();

    List<ParticularsEntityTo> listByPart(String phone);

    EmlpoyeeEntityVo selectByPhone(String phone);



    void updateByPhone(Double epSalary, String phone);

    EmlpoyeeEntityVo selectByName(String user);

    void updateName();

    void updateByAddName();

    void updateByAddName1();

    PageUtils list1EmpById(Map<String, Object> params, Integer cpId);

    void infoById(EmployeeEntity staffEntity);

    void imagewx(UploadImagesVo uploadImagesVo);
}

