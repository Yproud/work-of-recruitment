package com.xuexi.manager.employee.service.impl;

import com.xuexi.manager.employee.entity.EmployeeEntity;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


import com.xuexi.manager.employee.dao.CompanyDao;
import com.xuexi.manager.employee.entity.CompanyEntity;
import com.xuexi.manager.employee.service.CompanyService;


@Service("companyService")
public class CompanyServiceImpl extends ServiceImpl<CompanyDao, CompanyEntity> implements CompanyService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CompanyEntity> page = this.page(
                new Query<CompanyEntity>().getPage(params),
                new QueryWrapper<CompanyEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<CompanyEntity> categoryTwo() {
        QueryWrapper<CompanyEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("cp_parent_id",0);
        List<CompanyEntity> allEmployeeEntities = baseMapper.selectList(new QueryWrapper<CompanyEntity>());
        List<CompanyEntity> entityListOne = baseMapper.selectList(wrapper);
        dfs(entityListOne,allEmployeeEntities);
        return entityListOne;
    }

    @Override
    public void categorySave(CompanyEntity companyEntity) {
        CompanyEntity entity = new CompanyEntity();
        BeanUtils.copyProperties(companyEntity,entity);
        baseMapper.insert(entity);
    }

    @Override
    public void deleteCompById(Integer cpId) {
        QueryWrapper<CompanyEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("cp_id",cpId);
        baseMapper.delete(wrapper);
    }

    @Override
    public void updateComp(CompanyEntity company) {
        baseMapper.updateById(company);
    }

    @Override
    public List<CompanyEntity> selectCompany() {
        QueryWrapper<CompanyEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("cp_level",2);
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<CompanyEntity> categoryOne() {
        QueryWrapper<CompanyEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("cp_level",1);
        List<CompanyEntity> companyEntities = baseMapper.selectList(wrapper);
        return companyEntities;
    }

    @Override
    public List<CompanyEntity> categoryTwoById(Integer cpId) {
        QueryWrapper<CompanyEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("cp_parent_id",cpId);
        List<CompanyEntity> companyEntities = baseMapper.selectList(wrapper);
        return companyEntities;
    }

    private void dfs(List<CompanyEntity> entityListOne, List<CompanyEntity> allEmployeeEntities) {
        List<CompanyEntity> collect1 = entityListOne.stream().map((item) -> {
            Integer cpId = item.getCpId();
            List<CompanyEntity> collect = allEmployeeEntities.stream().filter((allone) -> {
                return allone.getCpParentId() == cpId;
            }).collect(Collectors.toList());
            if(collect!=null&&collect.size()>0) {
                item.setChildren(collect);
                dfs(item.getChildren(), allEmployeeEntities);
            }
            return item;
        }).collect(Collectors.toList());
    }
}