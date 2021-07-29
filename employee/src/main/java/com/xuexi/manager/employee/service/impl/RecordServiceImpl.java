package com.xuexi.manager.employee.service.impl;

import com.xuexi.manager.employee.entity.vo.EmlpoyeeEntityVo;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.employee.dao.RecordDao;
import com.xuexi.manager.employee.entity.RecordEntity;
import com.xuexi.manager.employee.service.RecordService;
import org.springframework.util.StringUtils;


@Service("recordService")
public class RecordServiceImpl extends ServiceImpl<RecordDao, RecordEntity> implements RecordService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<RecordEntity> wrapper = new QueryWrapper<>();
        String key = (String)params.get("key");
        if(!StringUtils.isEmpty(key)){
            wrapper.eq("compid",key);
        }
        IPage<RecordEntity> page = this.page(
                new Query<RecordEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    @Override
    public void saveRecord(EmlpoyeeEntityVo emlpoyeeEntityVo) {
        RecordEntity recordEntity = new RecordEntity();
        recordEntity.setEpTel(emlpoyeeEntityVo.getEpTel());
        recordEntity.setEpName(emlpoyeeEntityVo.getEpName());
        recordEntity.setCompid(emlpoyeeEntityVo.getEpId());
        recordEntity.setEpSort(0);
        baseMapper.insert(recordEntity);
    }

}