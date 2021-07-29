package com.xuexi.manager.employee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.employee.entity.vo.EmlpoyeeEntityVo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.employee.entity.RecordEntity;

import java.util.Map;

/**
 * 员工表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-17 15:33:40
 */
public interface RecordService extends IService<RecordEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveRecord(EmlpoyeeEntityVo emlpoyeeEntityVo);
}

