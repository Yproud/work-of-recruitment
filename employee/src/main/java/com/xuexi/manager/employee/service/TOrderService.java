package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.employee.entity.vo.OrderVo;
import com.xuexi.manager.employee.entity.vo.WeiXiVo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.employee.entity.TOrderEntity;

import java.util.Map;

/**
 * 订单
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-05 21:05:55
 */
public interface TOrderService extends IService<TOrderEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void createOrder(TOrderEntity tOrderEntity);

    OrderVo selectByName(String username);

    WeiXiVo getByPhone(String phone);
}

