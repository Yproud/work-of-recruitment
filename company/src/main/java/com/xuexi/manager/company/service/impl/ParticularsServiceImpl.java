package com.xuexi.manager.company.service.impl;

import com.alibaba.excel.EasyExcel;
import com.xuexi.manager.company.excei.ExcelParticulars;
import com.xuexi.manager.company.handle.SubjectExcelListener;
import com.xuexi.manager.to.ParticularsEntityTo;
import com.xuexi.manager.to.SelStaffTo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.company.dao.ParticularsDao;
import com.xuexi.manager.company.entity.ParticularsEntity;
import com.xuexi.manager.company.service.ParticularsService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;


@Service("particularsService")
public class ParticularsServiceImpl extends ServiceImpl<ParticularsDao, ParticularsEntity> implements ParticularsService {

    @Autowired
    RedisTemplate<String,String> redisTemplate;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<ParticularsEntity> wrapper = new QueryWrapper<>();
        String key = (String)params.get("key");
        if(!StringUtils.isEmpty(key)) {
            wrapper.eq("compid", key);
        }
        wrapper.eq("auditstatus",1);
        IPage<ParticularsEntity> page = this.page(
                new Query<ParticularsEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    @Override
    public List<ParticularsEntity> getParticularInfoById(String id) {

        List<ParticularsEntity> list=baseMapper.selectParticularInfoById(id);
        return list;
    }

    @Override
    public void saveSubject(ParticularsService particularsService, MultipartFile file) {
            try {
                InputStream inputStream = file.getInputStream();
                EasyExcel.read(inputStream, ExcelParticulars.class,new SubjectExcelListener(particularsService)).sheet().doRead();
            } catch (IOException e) {
                e.printStackTrace();
            }
    }

    @Override
    public PageUtils queryPage1(Map<String, Object> params) {
        QueryWrapper<ParticularsEntity> wrapper = new QueryWrapper<>();
        String key = (String)params.get("key");
        if(!StringUtils.isEmpty(key)) {
            wrapper.eq("compid", key);
        }
        wrapper.eq("auditstatus",0);
        IPage<ParticularsEntity> page = this.page(
                new Query<ParticularsEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }



    @Override
    public void update1ById(Integer id) {
        baseMapper.update1ById(id);

    }

    @Override
    public void saveExcel(ParticularsEntityTo particularsEntity) {
        ParticularsEntity particularsEntity1 = new ParticularsEntity();
        BeanUtils.copyProperties(particularsEntity,particularsEntity1);
        String user = redisTemplate.opsForValue().get("user");
        Integer id = baseMapper.selectByName(user);
        particularsEntity1.setCompid(id);
        particularsEntity1.setCompname(user);
        particularsEntity1.setAuditstatus(0);
        baseMapper.insert(particularsEntity1);
    }

    @Override
    public List<ParticularsEntity> getParticularInfoByIdTo(SelStaffTo selStaffTo) {
        QueryWrapper<ParticularsEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("auditstatus",1);
        if(!StringUtils.isEmpty(selStaffTo.getEpName())){
            wrapper.eq("compname",selStaffTo.getEpName());
        }
        if(!StringUtils.isEmpty(selStaffTo.getEpTel())){
            wrapper.eq("telePhone",selStaffTo.getEpTel());
        }
        if(!StringUtils.isEmpty(selStaffTo.getNowTime())){
            wrapper.ge("create_time",selStaffTo.getNowTime());
        }
        List<ParticularsEntity> particularsEntities = baseMapper.selectList(wrapper);
        return particularsEntities;
    }


}