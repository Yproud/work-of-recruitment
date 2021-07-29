package com.xuexi.manager.company.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.company.entity.StaffEmployeeEntity;

import java.util.Map;

/**
 * 员工表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-03-11 19:18:50
 */
public interface StaffEmployeeService extends IService<StaffEmployeeEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

