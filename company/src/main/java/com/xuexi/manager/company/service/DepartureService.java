package com.xuexi.manager.company.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.to.SelStaffTo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.company.entity.DepartureEntity;

import java.util.List;
import java.util.Map;

/**
 * 员工离职情况表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
public interface DepartureService extends IService<DepartureEntity> {

    PageUtils queryPage(Map<String, Object> params);


    void updateStatus(String id);

    void updateStatusFail(String id);

    List<DepartureEntity> departureInfo(String dpId);

    List<DepartureEntity> departureInfoTo(SelStaffTo selStaffTo);
}

