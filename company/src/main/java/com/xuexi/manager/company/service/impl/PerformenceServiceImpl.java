package com.xuexi.manager.company.service.impl;

import com.xuexi.manager.company.entity.ParticularsEntity;
import com.xuexi.manager.to.SelStaffTo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.company.dao.PerformenceDao;
import com.xuexi.manager.company.entity.PerformenceEntity;
import com.xuexi.manager.company.service.PerformenceService;
import org.springframework.util.StringUtils;


@Service("performenceService")
public class PerformenceServiceImpl extends ServiceImpl<PerformenceDao, PerformenceEntity> implements PerformenceService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<PerformenceEntity> wrapper = new QueryWrapper<>();
        String key = (String)params.get("key");
        if(!StringUtils.isEmpty(key)) {
            wrapper.eq("pf_tel", key);
        }
        IPage<PerformenceEntity> page = this.page(
                new Query<PerformenceEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    @Override
    public List<PerformenceEntity> getPerformenceInfoById(String pfId) {
//        QueryWrapper<PerformenceEntity> wrapper = new QueryWrapper<>();
//        wrapper.eq("pf_tel",pfId);
//        return baseMapper.selectById(pfId);selectById(pfId)中的参数必须是主键id
        List<PerformenceEntity> performenceEntity=baseMapper.selectPerformInfoById(pfId);
        return performenceEntity;
    }

    @Override
    public List<PerformenceEntity> getPerformenceInfoByIdTo(SelStaffTo selStaffTo) {
        QueryWrapper<PerformenceEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("auditstatus",1);
        if(!StringUtils.isEmpty(selStaffTo.getEpName())){
            wrapper.eq("compname",selStaffTo.getEpName());
        }
        if(!StringUtils.isEmpty(selStaffTo.getEpTel())){
            wrapper.eq("pf_tel",selStaffTo.getEpTel());
        }
        if(!StringUtils.isEmpty(selStaffTo.getNowTime())){
            wrapper.ge("create_time",selStaffTo.getNowTime());
        }
        List<PerformenceEntity> performenceEntities = baseMapper.selectList(wrapper);
        return performenceEntities;
    }

}