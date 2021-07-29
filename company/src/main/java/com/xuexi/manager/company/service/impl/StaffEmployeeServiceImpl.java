package com.xuexi.manager.company.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.company.dao.StaffEmployeeDao;
import com.xuexi.manager.company.entity.StaffEmployeeEntity;
import com.xuexi.manager.company.service.StaffEmployeeService;


@Service("staffEmployeeService")
public class StaffEmployeeServiceImpl extends ServiceImpl<StaffEmployeeDao, StaffEmployeeEntity> implements StaffEmployeeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StaffEmployeeEntity> page = this.page(
                new Query<StaffEmployeeEntity>().getPage(params),
                new QueryWrapper<StaffEmployeeEntity>()
        );

        return new PageUtils(page);
    }

}