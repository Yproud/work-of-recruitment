package com.xuexi.manager.employee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.employee.dao.BackmessDao;
import com.xuexi.manager.employee.entity.BackmessEntity;
import com.xuexi.manager.employee.service.BackmessService;
import org.springframework.util.StringUtils;


@Service("backmessService")
public class BackmessServiceImpl extends ServiceImpl<BackmessDao, BackmessEntity> implements BackmessService {
    @Autowired
    RedisTemplate<String,String> redisTemplate;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<BackmessEntity> wrapper = new QueryWrapper<>();

        IPage<BackmessEntity> page = this.page(
                new Query<BackmessEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageById(Map<String, Object> params) {
        QueryWrapper<BackmessEntity> wrapper = new QueryWrapper<>();
        String user = redisTemplate.opsForValue().get("user");
        wrapper.eq("recivename",user);
        String key=(String)params.get("key");
        if(!StringUtils.isEmpty(key)){
            wrapper.like("create_time",key);
        }
        IPage<BackmessEntity> page = this.page(
                new Query<BackmessEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

}