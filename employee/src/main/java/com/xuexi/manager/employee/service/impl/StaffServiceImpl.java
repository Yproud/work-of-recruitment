package com.xuexi.manager.employee.service.impl;

import com.xuexi.manager.employee.entity.EmployeeEntity;
import com.xuexi.manager.employee.entity.vo.EmlpoyeeEntityVo;
import com.xuexi.manager.employee.entity.vo.StaffEntityVo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.employee.dao.StaffDao;
import com.xuexi.manager.employee.entity.StaffEntity;
import com.xuexi.manager.employee.service.StaffService;
import org.springframework.util.StringUtils;


@Service("staffService")
public class StaffServiceImpl extends ServiceImpl<StaffDao, StaffEntity> implements StaffService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<StaffEntity> wrapper = new QueryWrapper<>();
        wrapper.in("ep_empoyee_status",1,2);
        String key = (String)params.get("key");
        if(!StringUtils.isEmpty(key)){
            wrapper.eq("ep_tel",key);
        }
        IPage<StaffEntity> page = this.page(
                new Query<StaffEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    @Override
    public StaffEntityVo listEmpById(Integer id) {
        StaffEntityVo staffEntity = new StaffEntityVo();
        StaffEntity staffEntity1 = baseMapper.selectById(id);
        BeanUtils.copyProperties(staffEntity1,staffEntity);
        List<String> images=baseMapper.selectImagersById(id);
        String[] strings = new String[images.size()];
        for(int i=0;i<images.size();i++){
            strings[i]=images.get(i);
        }
        staffEntity.setImages(strings);
        return staffEntity;
    }

    @Override
    public void saveStaff(StaffEntityVo staff) {

        StaffEntity staffEntity = new StaffEntity();
        BeanUtils.copyProperties(staff,staffEntity);
        staffEntity.setEpEmpoyeeStatus(1);
        baseMapper.insert(staffEntity);
        Integer epId = staffEntity.getEpId();
        String[] images = staff.getImages();
        for(String image:images){
            baseMapper.saveImages(epId,image);
        }
    }

    @Override
    public void update1ById(Integer id) {
        baseMapper.updateStaffById(id);
    }

    @Override
    public void update11ById(Integer id) {
        baseMapper.updateStaff1ById(id);
    }

    @Override
    public void infoById(StaffEntity staffEntity) {
        StaffEntity entity = baseMapper.selectById(staffEntity.getEpId());
        entity.setEpMessage(staffEntity.getEpMessage());
        updateById(entity);
    }

    @Override
    public PageUtils queryPageEmp(Map<String, Object> params) {
        QueryWrapper<StaffEntity> wrapper = new QueryWrapper<>();
        String key=(String)params.get("key");
        wrapper.and((item)->{
            item.eq("ep_tel",key).or().eq("ep_email",key);
        });
        IPage<StaffEntity> page = this.page(
                new Query<StaffEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }


}