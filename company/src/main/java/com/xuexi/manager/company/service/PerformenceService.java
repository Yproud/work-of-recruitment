package com.xuexi.manager.company.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.to.SelStaffTo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.company.entity.PerformenceEntity;

import java.util.List;
import java.util.Map;

/**
 * 员工工作情况表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
public interface PerformenceService extends IService<PerformenceEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<PerformenceEntity> getPerformenceInfoById(String pfId);

    List<PerformenceEntity> getPerformenceInfoByIdTo(SelStaffTo selStaffTo);
}

