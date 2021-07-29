package com.xuexi.manager.company.service.impl;

import com.xuexi.manager.company.entity.ParticularsEntity;
import com.xuexi.manager.to.SelStaffTo;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.company.dao.DepartureDao;
import com.xuexi.manager.company.entity.DepartureEntity;
import com.xuexi.manager.company.service.DepartureService;
import org.springframework.util.StringUtils;


@Service("departureService")
public class DepartureServiceImpl extends ServiceImpl<DepartureDao, DepartureEntity> implements DepartureService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<DepartureEntity> wrapper = new QueryWrapper<>();
        String key=(String)params.get("key");
        if(!StringUtils.isEmpty(key)){
            wrapper.eq("dp_tel",key);
        }
        IPage<DepartureEntity> page = this.page(
                new Query<DepartureEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    @Override
    public void updateStatus(String id) {
        baseMapper.updateStatus(id);
    }

    @Override
    public void updateStatusFail(String id) {
        baseMapper.updateStatusFail(id);
    }

    @Override
    public List<DepartureEntity> departureInfo(String dpId) {
        List<DepartureEntity> res=baseMapper.departureInfo(dpId);
        return res;
    }

    @Override
    public List<DepartureEntity> departureInfoTo(SelStaffTo selStaffTo) {
        QueryWrapper<DepartureEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("auditstatus",1);
        if(!StringUtils.isEmpty(selStaffTo.getEpName())){
            wrapper.eq("compname",selStaffTo.getEpName());
        }
        if(!StringUtils.isEmpty(selStaffTo.getEpTel())){
            wrapper.eq("dp_tel",selStaffTo.getEpTel());
        }
        if(!StringUtils.isEmpty(selStaffTo.getNowTime())){
            wrapper.ge("create_time",selStaffTo.getNowTime());
        }
        List<DepartureEntity> departureEntities = baseMapper.selectList(wrapper);
        return departureEntities;
    }


}