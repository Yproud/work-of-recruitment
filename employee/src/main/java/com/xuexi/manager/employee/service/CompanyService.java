package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;

import com.xuexi.manager.employee.entity.CompanyEntity;
import com.xuexi.manager.employee.entity.EmployeeEntity;
import com.xuexi.manager.utils.PageUtils;

import java.util.List;
import java.util.Map;

/**
 * 公司表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
public interface CompanyService extends IService<CompanyEntity> {

    PageUtils queryPage(Map<String, Object> params);
    List<CompanyEntity> categoryTwo();

    void categorySave(CompanyEntity companyEntity);


    void deleteCompById(Integer cpId);

    void updateComp(CompanyEntity company);

    List<CompanyEntity> selectCompany();

    List<CompanyEntity> categoryOne();

    List<CompanyEntity> categoryTwoById(Integer cpId);
}

