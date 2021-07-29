package com.xuexi.manager.employee.dao;

import com.xuexi.manager.employee.entity.SendmessEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-12 19:43:03
 */
@Mapper
public interface SendmessDao extends BaseMapper<SendmessEntity> {

    void updateSendById(Integer id);

    void updateByHandle1(Integer id);

    void updateByHandle2(Integer id);
}
