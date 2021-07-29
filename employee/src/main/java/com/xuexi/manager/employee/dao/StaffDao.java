package com.xuexi.manager.employee.dao;

import com.xuexi.manager.employee.entity.StaffEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 员工表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-15 19:22:41
 */
@Mapper
public interface StaffDao extends BaseMapper<StaffEntity> {

    List<String> selectImagersById(Integer id);

    void saveImages(@Param("epId") Integer epId, @Param("image") String image);

    void updateStaffById(Integer epId);

    void updateStaff1ById(Integer id);
}
