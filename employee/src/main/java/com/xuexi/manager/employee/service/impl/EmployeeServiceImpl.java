package com.xuexi.manager.employee.service.impl;

import com.xuexi.manager.employee.entity.CompanyEntity;
import com.xuexi.manager.employee.entity.StaffEntity;
import com.xuexi.manager.employee.entity.TOrderEntity;
import com.xuexi.manager.employee.entity.vo.*;
import com.xuexi.manager.employee.fegin.CompanyFeign;
import com.xuexi.manager.employee.service.CompanyService;
import com.xuexi.manager.employee.service.TOrderService;
import com.xuexi.manager.to.ParticularsEntityTo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


import com.xuexi.manager.employee.dao.EmployeeDao;
import com.xuexi.manager.employee.entity.EmployeeEntity;
import com.xuexi.manager.employee.service.EmployeeService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;


@Service("employeeService")
public class EmployeeServiceImpl extends ServiceImpl<EmployeeDao, EmployeeEntity> implements EmployeeService {

    @Autowired
    CompanyService companyService;
    @Autowired
    RedisTemplate<String,String> redisTemplate;
    @Autowired
    CompanyFeign companyFeign;
    @Autowired
    TOrderService tOrderService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<EmployeeEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("ep_empoyee_status",1);
        String key=(String)params.get("key");
        if(!StringUtils.isEmpty(key)) {
            wrapper.and((item) -> {
                item.eq("ep_id", key).or().eq("ep_name", key);
            });
        }
        //查询员工对应的岗位
        List<CompanyEntity> companyEntities = companyService.selectCompany();
        IPage<EmployeeEntity> page = this.page(
                new Query<EmployeeEntity>().getPage(params),
                wrapper
        );
        List<EmployeeEntity> records = page.getRecords();
        List<EmployeeEntity> collect1 = records.stream().map((item) -> {
            List<CompanyEntity> collect = companyEntities.stream().filter(comp -> {
                return comp.getCpId() == item.getEpJobId();
            }).collect(Collectors.toList());
            item.setCpName(collect.get(0).getCpName());
            return item;
        }).collect(Collectors.toList());

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageEmp(Map<String, Object> params) {
        QueryWrapper<EmployeeEntity> wrapper = new QueryWrapper<>();
        String key=(String)params.get("key");
        wrapper.and((item)->{
            item.eq("ep_tel",key).or().eq("ep_email",key);
        });
        IPage<EmployeeEntity> page = this.page(
                new Query<EmployeeEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils listEmpById(Map<String, Object> params, Integer cpId) {

        QueryWrapper<EmployeeEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("ep_job_id",cpId);
        //查询员工对应的岗位
        List<CompanyEntity> companyEntities = companyService.selectCompany();
        IPage<EmployeeEntity> page = this.page(
                new Query<EmployeeEntity>().getPage(params),
                wrapper
        );
        List<EmployeeEntity> records = page.getRecords();
        List<EmployeeEntity> collect1 = records.stream().map((item) -> {
            List<CompanyEntity> collect = companyEntities.stream().filter(comp -> {
                return comp.getCpId() == item.getEpJobId();
            }).collect(Collectors.toList());
            item.setCpName(collect.get(0).getCpName());
            return item;
        }).collect(Collectors.toList());
        return new PageUtils(page);
//        IPage<EmployeeEntity> page = this.page(
//                new Query<EmployeeEntity>().getPage(params),
//                wrapper
//        );
//        return new PageUtils(page);
    }

    @Override
    public void updateCpId(Integer cpId) {
        baseMapper.updateCpId(cpId);
    }

    @Override
    public void updateNoEpId(Integer epId) {
        baseMapper.updateNoEpId(epId);
    }

    @Override
    public Integer selectCount(StatisticsTempVo statisticsTempVo) {
        Integer cpId = statisticsTempVo.getCpId();
        Date nowTime = statisticsTempVo.getNowTime();
        Integer count=baseMapper.selectNumCount(cpId,nowTime);
        return count;
    }

    @Override
    public void select(EmployeeSelectVo employeeSelectVo) {
        Integer education = employeeSelectVo.getEducation();
        Integer minMoney = employeeSelectVo.getMinMoney();
        Integer maxMoney = employeeSelectVo.getMaxMoney();
        if(!StringUtils.isEmpty(education)) {
            baseMapper.select(education, minMoney, maxMoney);
        }else{
            baseMapper.selectNotEdu(minMoney,maxMoney);
        }
        baseMapper.setStatusThree();
    }

    @Override
    public void saveEmployee(EmlpoyeeEntityVo emlpoyeeEntityVo) {
        EmployeeEntity employeeEntity = new EmployeeEntity();
        BeanUtils.copyProperties(emlpoyeeEntityVo,employeeEntity);
        if(emlpoyeeEntityVo.getEpEmpoyeeStatus()==null) {
            employeeEntity.setEpEmpoyeeStatus(3);
        }
        if(emlpoyeeEntityVo.getEpSort()==null) {
            employeeEntity.setEpSort(0);
        }
        employeeEntity.setEpStatus(0);
        employeeEntity.setEpUpload(0);
        employeeEntity.setEpSalary(0D);
        baseMapper.insert(employeeEntity);
        Integer epId = employeeEntity.getEpId();
        String[] images = emlpoyeeEntityVo.getImages();
        for(String image:images){
            baseMapper.saveImages(epId,image);
        }
    }

    @Override
    public EmlpoyeeEntityVo listEmpEmpById(Integer id){
        EmlpoyeeEntityVo emlpoyeeEntityVo = new EmlpoyeeEntityVo();
        EmployeeEntity employeeEntity = baseMapper.selectById(id);
        BeanUtils.copyProperties(employeeEntity,emlpoyeeEntityVo);
        List<String> images=baseMapper.selectImagersById(id);
        String[] strings = new String[images.size()];
        for(int i=0;i<images.size();i++){
            strings[i]=images.get(i);
        }
        emlpoyeeEntityVo.setImages(strings);
        return emlpoyeeEntityVo;
    }

    @Override
    public void updateTosave(EmlpoyeeEntityVo emlpoyeeEntityVo) {
      //  baseMapper.updateById(emlpoyeeEntityVo.getEpId());

        Integer epId = emlpoyeeEntityVo.getEpId();
        baseMapper.deleteImages(epId);
        String[] images = emlpoyeeEntityVo.getImages();
        for(String image:images){
           baseMapper.saveImages(epId,image);
        }
        EmployeeEntity employeeEntity = new EmployeeEntity();
        BeanUtils.copyProperties(emlpoyeeEntityVo,employeeEntity);
        baseMapper.updateById(employeeEntity);

    }

    @Override
    public void removeEmpById(Integer epId) {
        baseMapper.deleteById(epId);
        baseMapper.deleteImages(epId);
    }

    @Override
    public PageUtils listEmpStatusById(Map<String, Object> params, Integer cpId) {
        QueryWrapper<EmployeeEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("ep_job_id",cpId).eq("ep_empoyee_status",3);
        //查询员工对应的岗位
        List<CompanyEntity> companyEntities = companyService.selectCompany();
        IPage<EmployeeEntity> page = this.page(
                new Query<EmployeeEntity>().getPage(params),
                wrapper
        );
        List<EmployeeEntity> records = page.getRecords();
        List<EmployeeEntity> collect1 = records.stream().map((item) -> {
            List<CompanyEntity> collect = companyEntities.stream().filter(comp -> {
                return comp.getCpId() == item.getEpJobId();
            }).collect(Collectors.toList());
            item.setCpName(collect.get(0).getCpName());
            return item;
        }).collect(Collectors.toList());
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageStatus(Map<String, Object> params) {
        QueryWrapper<EmployeeEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("ep_empoyee_status",3);
        String key=(String)params.get("key");
        if(!StringUtils.isEmpty(key)) {
            wrapper.and((item) -> {
                item.eq("ep_id", key).or().eq("ep_name", key);
            });
        }
        //查询员工对应的岗位
        List<CompanyEntity> companyEntities = companyService.selectCompany();
        IPage<EmployeeEntity> page = this.page(
                new Query<EmployeeEntity>().getPage(params),
                wrapper
        );
        List<EmployeeEntity> records = page.getRecords();
        List<EmployeeEntity> collect1 = records.stream().map((item) -> {
            List<CompanyEntity> collect = companyEntities.stream().filter(comp -> {
                return comp.getCpId() == item.getEpJobId();
            }).collect(Collectors.toList());
            item.setCpName(collect.get(0).getCpName());
            return item;
        }).collect(Collectors.toList());
        return new PageUtils(page);
    }

    @Override
    public void updateStatus(String epTel) {
        baseMapper.updateStatus(epTel);
    }

    @Override
    public EmlpoyeeEntityVo listRedis() {
        String username = redisTemplate.opsForValue().get("user");
        EmlpoyeeEntityVo emlpoyeeEntityVo=baseMapper.selectByName(username);
        return emlpoyeeEntityVo;
    }

    @Override
    public void addFee(BigDecimal totalFee, String mobile) {
        double value = totalFee.multiply(new BigDecimal("100")).doubleValue();
        EmlpoyeeEntityVo emlpoyeeEntityVo=baseMapper.selectByTel(mobile);
        value=value+emlpoyeeEntityVo.getEpSalary();
        baseMapper.updateFee(value,mobile);
    }

    @Override
    public OrderVo listRedisAll() {
        String username = redisTemplate.opsForValue().get("user");
        OrderVo t=tOrderService.selectByName(username);
        return t;
    }

    @Transactional
    @Override
    public List<ParticularsEntityTo> listByPart(String phone) {
        String user = redisTemplate.opsForValue().get("user");
        EmlpoyeeEntityVo emlpoyeeEntityVo = baseMapper.selectByName(user);
        if(emlpoyeeEntityVo.getEpSalary()<=0){
            return new ArrayList<>();
        }
        String epTel = emlpoyeeEntityVo.getEpTel();
        List<ParticularsEntityTo> particularsEntityTos = companyFeign.ParticularInfo(epTel);
        baseMapper.updateByPhone(emlpoyeeEntityVo.getEpSalary(),phone);
        return particularsEntityTos;
    }

    @Override
    public EmlpoyeeEntityVo selectByPhone(String phone) {
        EmlpoyeeEntityVo emlpoyeeEntityVo = baseMapper.selectByTel(phone);
        return emlpoyeeEntityVo;
    }

    @Override
    public void updateByPhone(Double epSalary, String phone) {
        baseMapper.updateByPhone(epSalary,phone);
    }

    @Override
    public EmlpoyeeEntityVo selectByName(String user) {
        return baseMapper.selectByName(user);
    }

    @Override
    public void updateName() {
        String user = redisTemplate.opsForValue().get("user");
        baseMapper.updateByName(user);

    }

    @Override
    public void updateByAddName() {
        String user = redisTemplate.opsForValue().get("user");
        EmlpoyeeEntityVo emlpoyeeEntityVo = baseMapper.selectByName(user);

        if(emlpoyeeEntityVo.getEpUpload()>=5){
            return;
        }
        baseMapper.updateByAddName(emlpoyeeEntityVo.getEpSalary(),emlpoyeeEntityVo.getEpUpload(),user);

    }
    @Override
    public void updateByAddName1() {
        String user = redisTemplate.opsForValue().get("user");
        EmlpoyeeEntityVo emlpoyeeEntityVo = baseMapper.selectByName(user);

        baseMapper.updateByAddName(emlpoyeeEntityVo.getEpSalary(),emlpoyeeEntityVo.getEpUpload(),user);

    }

    @Override
    public PageUtils list1EmpById(Map<String, Object> params, Integer cpId) {
        QueryWrapper<EmployeeEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("ep_job_id",cpId).eq("ep_empoyee_status",1);
        //查询员工对应的岗位
        List<CompanyEntity> companyEntities = companyService.selectCompany();
        IPage<EmployeeEntity> page = this.page(
                new Query<EmployeeEntity>().getPage(params),
                wrapper
        );
        List<EmployeeEntity> records = page.getRecords();
        List<EmployeeEntity> collect1 = records.stream().map((item) -> {
            List<CompanyEntity> collect = companyEntities.stream().filter(comp -> {
                return comp.getCpId() == item.getEpJobId();
            }).collect(Collectors.toList());
            item.setCpName(collect.get(0).getCpName());
            return item;
        }).collect(Collectors.toList());
        return new PageUtils(page);
//        IPage<EmployeeEntity> page = this.page(
//                new Query<EmployeeEntity>().getPage(params),
//                wrapper
//        );
//        return new PageUtils(page);
    }

    @Override
    public void infoById(EmployeeEntity staffEntity) {
        EmployeeEntity entity = baseMapper.selectById(staffEntity.getEpId());
        entity.setEpMessage(staffEntity.getEpMessage());
        updateById(entity);
    }

    @Override
    public void imagewx(UploadImagesVo uploadImagesVo) {
        String user = redisTemplate.opsForValue().get("user");
        EmlpoyeeEntityVo emlpoyeeEntityVo = baseMapper.selectByName(user);
        System.out.println(uploadImagesVo.toString());
        String[] images = uploadImagesVo.getImages();
        System.out.println(images.toString());
        for(String image:images) {
            System.out.println(image);
            baseMapper.saveImagesWX(emlpoyeeEntityVo.getEpId(), image);
        }
        updateByAddNameWX(user,emlpoyeeEntityVo.getEpUpload(),emlpoyeeEntityVo.getEpSalary(),images.length);
    }

    private void updateByAddNameWX(String user, Integer epUpload, Double epSalary, int len) {
        if(epUpload>=5){
            return;
        }
        if(len>=5) {
            baseMapper.updateByAddNameWX(epSalary, epUpload, user,5);
        }else{
            baseMapper.updateByAddNameWX(epSalary, epUpload, user,len);
        }

    }


}