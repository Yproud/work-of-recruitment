package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.employee.entity.BackmessEntity;

import java.util.Map;

/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-12 19:43:02
 */
public interface BackmessService extends IService<BackmessEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPageById(Map<String, Object> params);
}

