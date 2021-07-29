package com.xuexi.manager.employee.service.impl;

import com.xuexi.manager.employee.entity.vo.EmlpoyeeEntityVo;
import com.xuexi.manager.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.employee.dao.SendmessDao;
import com.xuexi.manager.employee.entity.SendmessEntity;
import com.xuexi.manager.employee.service.SendmessService;
import org.springframework.util.StringUtils;


@Service("sendmessService")
public class SendmessServiceImpl extends ServiceImpl<SendmessDao, SendmessEntity> implements SendmessService {

    @Autowired
    RedisTemplate<String,String> redisTemplate;
    @Autowired
    EmployeeService employeeService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<SendmessEntity> wrapper = new QueryWrapper<>();
        String key=(String)params.get("key");
//        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if(!StringUtils.isEmpty(key)){
            wrapper.like("create_time",key);
        }
        IPage<SendmessEntity> page = this.page(
                new Query<SendmessEntity>().getPage(params),
                wrapper
        );
        return new PageUtils(page);
    }

    @Override
    public void updateSendById(Integer id) {
        baseMapper.updateSendById(id);
    }

    @Override
    public void updateByHandle1(Integer id) {
        baseMapper.updateByHandle1(id);
    }

    @Override
    public PageUtils queryPage12(Map<String, Object> params) {
        QueryWrapper<SendmessEntity> wrapper = new QueryWrapper<>();
        wrapper.in("sendstatus",1,2);
        String key=(String)params.get("key");
        if(!StringUtils.isEmpty(key)){
            wrapper.like("create_time",key);
        }
        IPage<SendmessEntity> page = this.page(
                new Query<SendmessEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    @Override
    public void updateByHandle2(Integer id) {
        baseMapper.updateByHandle2(id);
    }

    @Override
    public PageUtils queryPageById(Map<String, Object> params) {
        QueryWrapper<SendmessEntity> wrapper = new QueryWrapper<>();
        String user = redisTemplate.opsForValue().get("user");
        wrapper.eq("sender",user);
        String key=(String)params.get("key");
        if(!StringUtils.isEmpty(key)){
            wrapper.like("create_time",key);

        }
        IPage<SendmessEntity> page = this.page(
                new Query<SendmessEntity>().getPage(params),
                wrapper
        );
        return new PageUtils(page);
    }

}