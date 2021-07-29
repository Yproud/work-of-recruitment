package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.employee.entity.vo.StaffEntityVo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.employee.entity.StaffEntity;

import java.util.Map;

/**
 * 员工表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-15 19:22:41
 */
public interface StaffService extends IService<StaffEntity> {

    PageUtils queryPage(Map<String, Object> params);

    StaffEntityVo listEmpById(Integer id);

    void saveStaff(StaffEntityVo staff);

    void update1ById(Integer id);

    void update11ById(Integer id);


    void infoById(StaffEntity staffEntity);

    PageUtils queryPageEmp(Map<String, Object> params);
}

