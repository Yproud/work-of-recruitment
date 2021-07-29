package com.xuexi.manager.company.dao;

import com.xuexi.manager.company.entity.ParticularsEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
@Mapper
public interface ParticularsDao extends BaseMapper<ParticularsEntity> {

    List<ParticularsEntity> selectParticularInfoById(String id);

    List<ParticularsEntity> selectByPhone();



    void update1ById(Integer id);

    Integer selectByName(@Param("name") String user);
}
