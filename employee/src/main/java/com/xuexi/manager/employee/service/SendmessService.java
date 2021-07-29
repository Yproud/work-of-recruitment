package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.employee.entity.SendmessEntity;

import java.util.Map;

/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-12 19:43:03
 */
public interface SendmessService extends IService<SendmessEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void updateSendById(Integer id);

    void updateByHandle1(Integer id);

    PageUtils queryPage12(Map<String, Object> params);

    void updateByHandle2(Integer id);

    PageUtils queryPageById(Map<String, Object> params);
}

