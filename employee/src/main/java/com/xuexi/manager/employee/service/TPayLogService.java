package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.employee.entity.TPayLogEntity;

import java.util.Map;

/**
 * 支付日志表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-05 21:05:55
 */
public interface TPayLogService extends IService<TPayLogEntity> {

    PageUtils queryPage(Map<String, Object> params);

    Map createNative(String orderNo);

    Map<String, String> queryPayStatus(String orderNo);

    void updateOrderStatus(Map<String, String> map);
}

