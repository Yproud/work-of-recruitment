package com.xuexi.manager.employee.dao;

import com.xuexi.manager.employee.entity.TOrderEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-05 21:05:55
 */
@Mapper
public interface TOrderDao extends BaseMapper<TOrderEntity> {

    TOrderEntity selectByName(String username);

    TOrderEntity selectPhone(String phone);
}
